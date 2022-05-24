package edu.stevens.cs522.chatserver.activities;

import android.app.Activity;
import android.database.Cursor;
import android.os.Bundle;
import android.widget.CursorAdapter;
import android.widget.ListView;
import android.widget.SimpleCursorAdapter;
import android.widget.TextView;

import androidx.fragment.app.FragmentActivity;
import androidx.loader.app.LoaderManager;
import androidx.loader.content.CursorLoader;
import androidx.loader.content.Loader;

import edu.stevens.cs522.chatserver.R;
import edu.stevens.cs522.chatserver.contracts.MessageContract;
import edu.stevens.cs522.chatserver.entities.Peer;
import edu.stevens.cs522.chatserver.providers.ChatProvider;

/**
 * Created by dduggan.
 */

public class ViewPeerActivity extends FragmentActivity implements LoaderManager.LoaderCallbacks<Cursor>{

    public static final String PEER_KEY = "peer";

    private SimpleCursorAdapter messagesAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.view_peer);

        Peer peer = getIntent().getParcelableExtra(PEER_KEY);
        if (peer == null) {
            throw new IllegalArgumentException("Expected peer as intent extra");
        }

        TextView userName = findViewById(R.id.view_user_name);
        userName.setText(peer.name);
        TextView timeStamp = findViewById(R.id.view_timestamp);
        timeStamp.setText(peer.timestamp.toString());
        TextView address = findViewById(R.id.view_address);
        address.setText(peer.address.toString());
        ListView messages = findViewById(R.id.view_messages);

        String [] from = new String[] {MessageContract.MESSAGE_TEXT};
        int [] to = new int[] {android.R.id.text1};
        messagesAdapter = new SimpleCursorAdapter(this,android.R.layout.simple_expandable_list_item_1,null,from,to,0);
        messages.setAdapter(messagesAdapter);

        LoaderManager.getInstance(this).initLoader((int)peer.id,null,this);
    }

    @Override
    public Loader<Cursor> onCreateLoader(int id, Bundle args) {
        String selection = MessageContract.SENDER_ID+"=?";
        String[] selectionArgs = new String[]{Long.toString(id)};
        return new CursorLoader(this, MessageContract.CONTENT_URI,null,selection,selectionArgs,null);
    }

    @Override
    public void onLoadFinished(Loader<Cursor> loader, Cursor data) {
        messagesAdapter.swapCursor(data);
    }

    @Override
    public void onLoaderReset(Loader<Cursor> loader) {
        messagesAdapter.swapCursor(null);
    }

}
