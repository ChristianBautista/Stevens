package edu.stevens.cs522.chatserver.activities;

import android.app.Activity;
//import android.content.Intent;
import android.os.Bundle;
import android.widget.TextView;

import edu.stevens.cs522.chatserver.R;
import edu.stevens.cs522.chatserver.entities.Peer;

/**
 * Created by dduggan.
 */

public class ViewPeerActivity extends Activity {

    public static final String PEER_KEY = "peer";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.view_peer);

        Peer peer = getIntent().getParcelableExtra(PEER_KEY);
        if (peer == null) {
            throw new IllegalArgumentException("Expected peer as intent extra");
        }

        // TODO init the UI
        TextView username = findViewById(R.id.view_user_name);
        username.setText(peer.name);
        TextView timestamp = findViewById(R.id.view_timestamp);
        timestamp.setText(peer.timestamp.toString());
        TextView address = findViewById(R.id.view_address);
        address.setText(peer.address.toString());
        TextView port = findViewById(R.id.view_port);
        port.setText(String.valueOf(peer.port));
    }

}
