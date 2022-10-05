package edu.stevens.cs522.chatserver.activities;

import android.os.Bundle;
import android.util.Log;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.TextView;

import androidx.fragment.app.FragmentActivity;
import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;

import java.util.List;

import edu.stevens.cs522.base.DateUtils;
import edu.stevens.cs522.base.InetAddressUtils;
import edu.stevens.cs522.chatserver.R;
import edu.stevens.cs522.chatserver.databases.ChatDatabase;
import edu.stevens.cs522.chatserver.databases.MessageDAO;
import edu.stevens.cs522.chatserver.databases.PeerDAO;
import edu.stevens.cs522.chatserver.entities.DateConverter;
import edu.stevens.cs522.chatserver.entities.InetAddressConverter;
import edu.stevens.cs522.chatserver.entities.Message;
import edu.stevens.cs522.chatserver.entities.Peer;

/**
 * Created by dduggan.
 */

public class ViewPeerActivity extends FragmentActivity {

    final private String TAG = ChatServer.class.getCanonicalName();

    public static final String PEER_KEY = "peer";

    private ChatDatabase chatDatabase;

    private LiveData<List<Message>> messages;

    private ListView messagesList;

    private Peer peer;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.view_peer);

        peer = getIntent().getParcelableExtra(PEER_KEY);
        if (peer == null) {
            throw new IllegalArgumentException("Expected peer id as intent extra");
        }

        // init the UI

        TextView userName = findViewById(R.id.view_user_name);
        userName.setText(peer.name);
        TextView timeStamp = findViewById(R.id.view_timestamp);
        timeStamp.setText(peer.timestamp.toString());
        TextView address = findViewById(R.id.view_address);
        address.setText(InetAddressConverter.addressToString(peer.address));
        messagesList = findViewById(R.id.view_messages);

        Log.d(TAG, "Opening the database....");
        // open the database
        // Note use getApplicationContext, do not make DB depend on UI!
        chatDatabase = ChatDatabase.getInstance(getApplicationContext());

        Log.d(TAG, "Querying the database asynchronously....");
        // query the database asynchronously, registering an observer for the result.
        // Note: The observer will need to reset the array adapter for the listview.
        MessageDAO messageDAO = chatDatabase.messageDao();
        //PeerDAO peerDAO = chatDatabase.peerDao();
        messages = messageDAO.fetchMessagesFromPeer(peer.id);
        messages.observe(this,ms -> {
            messagesList.setAdapter(new ArrayAdapter<>(this,R.layout.message,ms));
        });

        /*
        MutableLiveData<List<Message>> obsMessages = new MutableLiveData<>();
        obsMessages.setValue((List<Message>) messages);
        obsMessages.observe(this,ms -> {
            messagesList.setAdapter(new ArrayAdapter<>(this,android.R.layout.simple_expandable_list_item_2,ms));
        });
        */

        /*
        peers = peerDAO.fetchAllPeers();
        MutableLiveData<List<Peer>> obsPeers = new MutableLiveData<>();
        obsPeers.setValue((List<Peer>) peers);
        obsPeers.observe(this,ps -> {
            peersList.setAdapter(new ArrayAdapter<>(this,android.R.layout.simple_expandable_list_item_2,ps));
        });
         */
    }

}
