package edu.stevens.cs522.chatserver.activities;

import android.app.Activity;
import android.content.Intent;
import android.database.Cursor;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.SimpleCursorAdapter;

import edu.stevens.cs522.chatserver.R;
import edu.stevens.cs522.chatserver.contracts.MessageContract;
import edu.stevens.cs522.chatserver.contracts.PeerContract;
import edu.stevens.cs522.chatserver.databases.ChatDbAdapter;
import edu.stevens.cs522.chatserver.entities.Peer;


public class ViewPeersActivity extends Activity implements AdapterView.OnItemClickListener {

    private ChatDbAdapter chatDbAdapter;

    private SimpleCursorAdapter peerAdapter;

    private Cursor cursor;

    ListView peerList;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.view_peers);

        chatDbAdapter = new ChatDbAdapter(this);
        chatDbAdapter.open();
        cursor = chatDbAdapter.fetchAllPeers();
        String[] from = new String[] {PeerContract.NAME};
        int[] to = new int[] {android.R.id.text1};
        peerAdapter = new SimpleCursorAdapter(this,android.R.layout.simple_expandable_list_item_2,cursor,from,to,0);
        peerList = findViewById(R.id.peer_list);
        peerList.setAdapter(peerAdapter);
        peerList.setOnItemClickListener(this);
    }

    @Override
    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
        /*
         * Clicking on a peer brings up details
         */
        Log.d("VPA Peer ID",Long.toString(id));
        Peer peer = chatDbAdapter.fetchPeer(id);
        Intent intent = new Intent(this, ViewPeerActivity.class);
        intent.putExtra(ViewPeerActivity.PEER_KEY, peer);
        startActivity(intent);
    }
}