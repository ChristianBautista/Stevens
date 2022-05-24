package edu.stevens.cs522.chatserver.activities;

import android.app.Activity;
import android.database.Cursor;
import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.TextView;

import java.util.ArrayList;

import edu.stevens.cs522.chatserver.R;
import edu.stevens.cs522.chatserver.contracts.MessageContract;
import edu.stevens.cs522.chatserver.databases.ChatDbAdapter;
import edu.stevens.cs522.chatserver.entities.Peer;

/**
 * Created by dduggan.
 */

public class ViewPeerActivity extends Activity {

    public static final String PEER_KEY = "peer";

    private ChatDbAdapter chatDbAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.view_peer);

        Peer peer = getIntent().getParcelableExtra(PEER_KEY);
        if (peer == null) {
            throw new IllegalArgumentException("Expected peer id as intent extra");
        }

        chatDbAdapter = new ChatDbAdapter(this);
        chatDbAdapter.open();

        TextView username = findViewById(R.id.view_user_name);
        username.setText(peer.name);
        TextView timestamp = findViewById(R.id.view_timestamp);
        timestamp.setText(peer.timestamp.toString());
        TextView address = findViewById(R.id.view_address);
        address.setText(peer.address.toString());
        ListView messageListView = findViewById(R.id.view_messages);
        Cursor cursor = chatDbAdapter.fetchMessagesFromPeer(peer);
        ArrayList<String> messages = new ArrayList<>();
        if(cursor.moveToFirst()) {
            do {
                messages.add(cursor.getString(cursor.getColumnIndexOrThrow(MessageContract.MESSAGE_TEXT)));
            } while(cursor.moveToNext());
        }
        ArrayAdapter<String> arrayAdapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, messages);
        messageListView.setAdapter(arrayAdapter);

        chatDbAdapter.close();
    }

}
