package edu.stevens.cs522.chatserver.activities;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import androidx.fragment.app.FragmentActivity;
import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;

import java.util.List;

import edu.stevens.cs522.chatserver.R;
import edu.stevens.cs522.chatserver.databases.ChatDatabase;
import edu.stevens.cs522.chatserver.databases.PeerDAO;
import edu.stevens.cs522.chatserver.entities.Message;
import edu.stevens.cs522.chatserver.entities.Peer;


public class ViewPeersActivity extends FragmentActivity implements AdapterView.OnItemClickListener {

    /*
     * See ChatServer for example of what to do, query peers database instead of messages database.
     */

    final private String TAG = ChatServer.class.getCanonicalName();

    private ChatDatabase chatDatabase;

    private LiveData<List<Peer>> peers;

    private ListView peersList;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.view_peers);

        peersList = findViewById(R.id.peer_list);
        peersList.setAdapter(new ArrayAdapter(this, android.R.layout.simple_list_item_1));

        Log.d(TAG, "Opening the database....");
        // open the database
        // Note use getApplicationContext, do not make DB depend on UI!
        chatDatabase = ChatDatabase.getInstance(getApplicationContext());

        Log.d(TAG, "Querying the database asynchronously....");
        // query the database asynchronously, registering an observer for the result.
        // Note: The observer will need to reset the array adapter for the listview.
        PeerDAO peerDAO = chatDatabase.peerDao();
        peers = peerDAO.fetchAllPeers();
        peers.observe(this,ps -> {
            peersList.setAdapter(new ArrayAdapter<>(this,R.layout.message,ps));
        });
        peersList.setOnItemClickListener(this);
        /*
        MutableLiveData<List<Peer>> obsPeers = new MutableLiveData<>();
        obsPeers.setValue((List<Peer>) peers);
        obsPeers.observe(this,ps -> {
            peersList.setAdapter(new ArrayAdapter<>(this,android.R.layout.simple_expandable_list_item_2,ps));
        });
        */
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        if (chatDatabase.isOpen()) {
            chatDatabase.close();
            chatDatabase = null;
        }
    }

    /*
     * Callback interface defined in TextAdapter, for responding to clicks on rows.
     */
    @Override
    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
        /*
         * Clicking on a peer brings up details
         */
        Peer peer = peers.getValue().get(position);

        Intent intent = new Intent(this, ViewPeerActivity.class);
        intent.putExtra(ViewPeerActivity.PEER_KEY, peer);
        startActivity(intent);

    }
}
