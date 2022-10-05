/*********************************************************************

    Chat server: accept chat messages from clients.
    
    Sender name and GPS coordinates are encoded
    in the messages, and stripped off upon receipt.

    Copyright (c) 2017 Stevens Institute of Technology

**********************************************************************/
package edu.stevens.cs522.chatserver.activities;

import android.content.Intent;
import android.os.Bundle;
import android.os.StrictMode;
import android.util.JsonReader;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;

import androidx.annotation.Nullable;
import androidx.fragment.app.FragmentActivity;
import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;

import java.io.StringReader;
import java.net.DatagramPacket;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Observer;

import edu.stevens.cs522.base.DatagramSendReceive;
import edu.stevens.cs522.chatserver.R;
import edu.stevens.cs522.chatserver.databases.ChatDatabase;
import edu.stevens.cs522.chatserver.databases.MessageDAO;
import edu.stevens.cs522.chatserver.databases.PeerDAO;
import edu.stevens.cs522.chatserver.entities.Message;
import edu.stevens.cs522.chatserver.entities.Peer;

public class ChatServer extends FragmentActivity implements OnClickListener {

	final static public String TAG = ChatServer.class.getCanonicalName();

    public final static String SENDER_NAME = "name";

    public final static String CHATROOM = "room";

    public final static String MESSAGE_TEXT = "text";

    public final static String TIMESTAMP = "timestamp";

    public final static String LATITUDE = "latitude";

    public final static String LONGITUDE = "longitude";
		
	/*
	 * Socket used both for sending and receiving
	 */
    private DatagramSendReceive serverSocket;
//  private DatagramSocket serverSocket;


    /*
	 * True as long as we don't get socket errors
	 */
	private boolean socketOK = true;

    // private ArrayList<Peer> peers;

    /*
     * List of messages and adapter
     */
    private ChatDatabase chatDatabase;

    private MessageDAO messageDAO;

    private PeerDAO peerDAO;

    private LiveData<List<Message>> messages;

    // private MessageAdapter messagesAdapter;
    private ArrayAdapter<Message> messagesAdapter;

    /*
     * UI for displayed received messages
     */
    private ListView messageList;

    private Button next;
	
	/*
	 * Called when the activity is first created. 
	 */
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
        setContentView(R.layout.messages);

        /**
         * Let's be clear, this is a HACK to allow you to do network communication on the messages thread.
         * This WILL cause an ANR, and is only provided to simplify the pedagogy.  We will see how to do
         * this right in a future assignment (using a Service managing background threads).
         */
        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(policy);

        try {
            /*
             * Get port information from the resources.
             */
            int port = getResources().getInteger(R.integer.app_port);

            // serverSocket = new DatagramSocket(port);

            serverSocket = new DatagramSendReceive(port);

        } catch (Exception e) {
            throw new IllegalStateException("Cannot open socket", e);
        }

        messagesAdapter = new ArrayAdapter<>(this,R.layout.message);

        Log.d(TAG, "Initializing the UI with no messages....");
        // Initialize the list view with an empty array adapter.
        messageList = findViewById(R.id.message_list);
        messageList.setAdapter(messagesAdapter);

        Log.d(TAG, "Opening the database....");
        // open the database
        // Note use getApplicationContext, do not make DB depend on UI!
        chatDatabase = ChatDatabase.getInstance(getApplicationContext());

        Log.d(TAG, "Querying the database asynchronously....");
        // TODO query the database asynchronously, registering an observer for the result.
        // Note: The observer will need to reset the array adapter for the listview.
        messageDAO = chatDatabase.messageDao();
        messages = messageDAO.fetchAllMessages();
        messages.observe(this,ms -> {
            messageList.setAdapter(new ArrayAdapter<>(this,R.layout.message,ms));
        });

        /*
        MutableLiveData<List<Message>> obsMessages = new MutableLiveData<>();
        obsMessages.setValue((List<Message>) messages);
        obsMessages.observe(this,ms -> {
            messagesAdapter = new ArrayAdapter<>(this,R.layout.message,ms);
            messageList.setAdapter(messagesAdapter);
            messagesAdapter.notifyDataSetChanged();
        });
         */

        Log.d(TAG, "Binding the callback for the NEXT button....");
        // bind the button for "next" to this activity as listener
        next = findViewById(R.id.next);
        next.setOnClickListener(this);

	}

    public void onClick(View v) {
		
		byte[] receiveData = new byte[1024];

		DatagramPacket receivePacket = new DatagramPacket(receiveData, receiveData.length);

		try {

		    Log.d(TAG, "Waiting for a message....");
			serverSocket.receive(receivePacket);
			Log.d(TAG, "Received a packet!");

            InetAddress address = receivePacket.getAddress();
            int port = receivePacket.getPort();
            Log.d(TAG, "Source IP Address: " + address + " , Port: " + port);

            String content = new String(receivePacket.getData(), 0, receivePacket.getLength());
            Log.d(TAG, "Message received: " + content);

            /*
             * Parse the JSON object
             */
            String sender = null;

            String room = null;

            String text = null;

            Date timestamp = null;

            Double latitude = null;

            Double longitude = null;

            JsonReader rd = new JsonReader(new StringReader(content));

            rd.beginObject();
            if (SENDER_NAME.equals(rd.nextName())) {
                sender = rd.nextString();
            }
            if (CHATROOM.equals(rd.nextName())) {
                room = rd.nextString();
            }
            if (MESSAGE_TEXT.equals((rd.nextName()))) {
                text = rd.nextString();
            }
            if (TIMESTAMP.equals(rd.nextName())) {
                timestamp = new Date(rd.nextLong());
            }
            if (LATITUDE.equals(rd.nextName())) {
                latitude = rd.nextDouble();
            }
            if (LONGITUDE.equals((rd.nextName()))) {
                longitude = rd.nextDouble();
            }
            rd.endObject();

            rd.close();

            /*
             * Add the sender to our list of senders
             */
            Peer peer = new Peer();
            peer.name = sender;
            peer.address = address;
            peer.port = port;
            peer.timestamp = timestamp;
            peer.latitude = latitude;
            peer.longitude = longitude;

            Message message = new Message();
            message.messageText = text;
            message.chatRoom = room;
            message.sender = sender;
            message.timestamp = timestamp;
            message.latitude = latitude;
            message.longitude = longitude;

            /*
			 * upsert peer and insert message into the database
			 */
            peerDAO = chatDatabase.peerDao();
            message.senderId = peerDAO.upsert(peer);
            messageDAO.persist(message);
            messagesAdapter.notifyDataSetChanged();
            /*
             * End
             *
             * The livedata for the messages should update via observer automatically.
             */

		} catch (Exception e) {
			
			Log.e(TAG, "Problems receiving packet: " + e.getMessage(), e);
			socketOK = false;
		} 

	}

	/*
	 * Close the socket before exiting application
	 */
	public void closeSocket() {
	    if (serverSocket != null) {
            serverSocket.close();
            serverSocket = null;
        }
	}

	/*
	 * If the socket is OK, then it's running
	 */
	boolean socketIsOK() {
		return socketOK;
	}

    public void onDestroy() {
        super.onDestroy();
        if (chatDatabase.isOpen()) {
            chatDatabase.close();
            chatDatabase = null;
        }
        closeSocket();
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        super.onCreateOptionsMenu(menu);
        // inflate a menu with PEERS option
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.chatserver_menu, menu);

        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        super.onOptionsItemSelected(item);
        switch(item.getItemId()) {

            case R.id.peers:
                // PEERS provide the UI for viewing list of peers
                Intent viewPeers = new Intent(this, ViewPeersActivity.class);
                startActivity(viewPeers);
                break;

            default:
        }
        return false;
    }

}