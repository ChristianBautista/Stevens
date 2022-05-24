package edu.stevens.cs522.chat.activities;

import android.os.Bundle;
import android.util.Log;
import android.widget.TextView;

import androidx.fragment.app.FragmentActivity;
import androidx.lifecycle.LiveData;
import androidx.lifecycle.ViewModelProvider;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import java.util.List;

import edu.stevens.cs522.chat.R;
import edu.stevens.cs522.chat.databases.ChatDatabase;
import edu.stevens.cs522.chat.entities.InetAddressConverter;
import edu.stevens.cs522.chat.entities.Message;
import edu.stevens.cs522.chat.entities.Peer;
import edu.stevens.cs522.chat.ui.TextAdapter;
import edu.stevens.cs522.chat.viewmodels.PeerViewModel;

/**
 * Created by dduggan.
 */

public class ViewPeerActivity extends FragmentActivity {

    public static final String TAG = ViewPeerActivity.class.getCanonicalName();

    public static final String PEER_KEY = "peer";

    private PeerViewModel peerViewModel;

    private LiveData<List<Message>> messages;

    private TextAdapter<Message> messageAdapter;

    private RecyclerView messageList;

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
        /*
        TextView address = findViewById(R.id.view_address);
        address.setText(InetAddressConverter.addressToString(peer.address));
         */

        // Initialize the recyclerview and adapter for messages
        messageList = findViewById(R.id.view_messages);
        messageList.setLayoutManager(new LinearLayoutManager(this));

        messageAdapter = new TextAdapter<>(messageList);
        messageList.setAdapter(messageAdapter);

        // open the view model
        peerViewModel = new ViewModelProvider(this).get(PeerViewModel.class);

        // query the database asynchronously, and use messagesAdapter to display the result
        messages = peerViewModel.fetchMessagesFromPeer(peer);
        messages.observe(this,ms -> {
            messageAdapter.setDataset(ms);
            messageList.setAdapter(messageAdapter);
        });
    }

}
