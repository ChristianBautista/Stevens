/*********************************************************************

    Chat server: accept chat messages from clients.
    
    Sender name and GPS coordinates are encoded
    in the messages, and stripped off upon receipt.

    Copyright (c) 2017 Stevens Institute of Technology

**********************************************************************/
package edu.stevens.cs522.chat.activities;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.fragment.app.FragmentActivity;
import androidx.lifecycle.LiveData;
import androidx.lifecycle.ViewModelProvider;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import java.net.InetAddress;
import java.util.Date;
import java.util.List;

import edu.stevens.cs522.base.DateUtils;
import edu.stevens.cs522.base.InetAddressUtils;
import edu.stevens.cs522.chat.R;
import edu.stevens.cs522.chat.databases.ChatDatabase;
import edu.stevens.cs522.chat.databases.MessageDAO;
import edu.stevens.cs522.chat.databases.PeerDAO;
import edu.stevens.cs522.chat.entities.InetAddressConverter;
import edu.stevens.cs522.chat.entities.Message;
import edu.stevens.cs522.chat.services.ChatService;
import edu.stevens.cs522.chat.services.IChatService;
import edu.stevens.cs522.chat.services.ResultReceiverWrapper;
import edu.stevens.cs522.chat.settings.Settings;
import edu.stevens.cs522.chat.ui.MessageAdapter;
import edu.stevens.cs522.chat.viewmodels.ChatViewModel;

public class ChatActivity extends FragmentActivity implements OnClickListener, ServiceConnection, ResultReceiverWrapper.IReceive {
	final static public String TAG = ChatActivity.class.getCanonicalName();

    /*
     * UI for displayed received messages
     */
    private ChatViewModel chatViewModel;

    private LiveData<List<Message>> messages;

    private RecyclerView messageList;

    private MessageAdapter messagesAdapter;

    /*
     * Widgets for dest address, message text, send button.
     */
    private EditText destinationHost;

    private EditText destinationPort;

    private TextView senderName;

    private EditText messageText;

    private Button sendButton;


    /*
     * Reference to the service, for sending a message
     */
    private IChatService chatService;

    /*
     * For receiving ack when message is sent.
     */
    private ResultReceiverWrapper sendResultReceiver;
	
	/*
	 * Called when the activity is first created. 
	 */
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);

        setContentView(R.layout.messages);
        messageList = findViewById(R.id.message_list);
        messageList.setLayoutManager(new LinearLayoutManager(this));

        destinationHost = findViewById(R.id.destination_host);
        destinationPort = findViewById(R.id.destination_port);
        senderName = findViewById(R.id.sender_name);
        messageText = findViewById(R.id.message_text);

        // Initialize the recyclerview and adapter for messages
        messagesAdapter = new MessageAdapter();
        messageList.setAdapter(messagesAdapter);

        // create the view model
        chatViewModel = new ViewModelProvider(this).get(ChatViewModel.class);

        // query the database asynchronously, and use messagesAdapter to display the result
        messages = chatViewModel.fetchAllMessages();
        messages.observe(this,ms -> {
            messagesAdapter.setMessages(ms);
            messageList.setAdapter(messagesAdapter);
            messagesAdapter.notifyDataSetChanged();
        });

        // bind the button for "send" to this activity as listener
        sendButton = findViewById(R.id.send_button);
        sendButton.setOnClickListener(this);

        // initialize sendResultReceiver (for receiving notification of message sent)
        sendResultReceiver = new ResultReceiverWrapper(new Handler());
        sendResultReceiver.setReceiver(this);

        // initiate binding to the service
        Intent bindIntent = new Intent(this, ChatService.class);
        bindService(bindIntent, this, Context.BIND_AUTO_CREATE);
	}

    @Override
    public void onStart() {
	    super.onStart();
    }

    @Override
	public void onResume() {
        super.onResume();
        senderName.setText(Settings.getSenderName(this));
        // register result receiver
        sendResultReceiver.setReceiver(this);
    }

    @Override
    public void onPause() {
        super.onPause();
        // unregister result receiver
        sendResultReceiver.setReceiver(null);
    }

    @Override
    public void onStop() {
	    super.onStop();
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        // Unbind the service
        unbindService(this);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        super.onCreateOptionsMenu(menu);
        // inflate a menu with PEERS options
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.chatserver_menu, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        super.onOptionsItemSelected(item);
        switch(item.getItemId()) {

            case R.id.register:
                Intent intent = new Intent(this, RegisterActivity.class);
                startActivity(intent);
                break;

            // PEERS provide the UI for viewing list of peers
            case R.id.peers:
                Intent viewPeers = new Intent(this, ViewPeersActivity.class);
                startActivity(viewPeers);
                break;

            default:
        }
        return false;
    }



    @Override
    /*
     * Callback for the SEND button.
     */
    public void onClick(View v) {

        if (!Settings.isRegistered(this)) {

            Toast.makeText(this, R.string.register_necessary, Toast.LENGTH_LONG);
            return;

        }

        if (chatService != null) {
            /*
             * On the emulator, which does not support WIFI stack, we'll send to
             * (an AVD alias for) the host loopback interface, with the server
             * port on the host redirected to the server port on the server AVD.
             */

            String destAddrString = null;

            String destPortString = null;

            String chatRoom = "_default";

            String text = null;

            Date timestamp = DateUtils.now();

            Double latitude = 44.523483;

            Double longitude = -89.574814;

            // Get destination host and port and message from UI
            destAddrString = destinationHost.getText().toString();
            destPortString = destinationPort.getText().toString();
            text = messageText.getText().toString();

            if (destAddrString.isEmpty()) {
                return;
            }
            InetAddress destAddr = InetAddressUtils.fromString(destAddrString);

            if (destPortString.isEmpty()) {
                return;
            }
            int destPort = Integer.parseInt(destPortString);

            if (text.isEmpty()) {
                return;
            }


            // use chatService to send the message
            chatService.send(destAddr, destPort, chatRoom, text, timestamp, latitude, longitude, sendResultReceiver);

            Log.i(TAG, "Sent message: " + text);

            messageText.setText("");
        }
    }

    @Override
    /**
     * Show a text message when notified that sending a message succeeded or failed
     */
    public void onReceiveResult(int resultCode, Bundle data) {
        switch (resultCode) {
            case RESULT_OK:
                // show a success toast message
                Toast.makeText(this, "Success", Toast.LENGTH_SHORT).show();
                break;
            default:
                // show a failure toast message
                Toast.makeText(this, "Failure", Toast.LENGTH_SHORT).show();
                break;
        }
    }

    @Override
    public void onServiceConnected(ComponentName name, IBinder service) {
        Log.d(TAG, "Connected to the chat service.");
        // initialize chatService
        chatService = ((ChatService.ChatBinder) service).getService();

    }

    @Override
    public void onServiceDisconnected(ComponentName name) {
        Log.d(TAG, "Disconnected from the chat service.");
        chatService = null;
    }
}