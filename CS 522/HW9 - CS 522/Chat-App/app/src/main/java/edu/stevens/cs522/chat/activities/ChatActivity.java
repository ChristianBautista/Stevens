/*********************************************************************

    Chat server: accept chat messages from clients.
    
    Sender name and GPS coordinates are encoded
    in the messages, and stripped off upon receipt.

    Copyright (c) 2017 Stevens Institute of Technology

**********************************************************************/
package edu.stevens.cs522.chat.activities;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
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

import java.util.List;

import edu.stevens.cs522.chat.R;
import edu.stevens.cs522.chat.entities.Message;
import edu.stevens.cs522.chat.rest.ChatHelper;
import edu.stevens.cs522.chat.services.ResultReceiverWrapper;
import edu.stevens.cs522.chat.settings.Settings;
import edu.stevens.cs522.chat.ui.MessageAdapter;
import edu.stevens.cs522.chat.viewmodels.ChatViewModel;

public class ChatActivity extends FragmentActivity implements OnClickListener, ResultReceiverWrapper.IReceive {

	final static public String TAG = ChatActivity.class.getCanonicalName();

    /*
     * UI for displayed received messages
     */
    private ChatHelper chatHelper;

    private ChatViewModel chatViewModel;

    private LiveData<List<Message>> messages;

    private MessageAdapter messagesAdapter;

    private TextView senderName;

    private EditText messageText;

    private Button sendButton;

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

        /*
         * Widgets for message text, list of messages
         */
        RecyclerView messageList = findViewById(R.id.message_list);
        messageList.setLayoutManager(new LinearLayoutManager(this));

        messageText = findViewById(R.id.message_text);

        senderName = findViewById(R.id.sender_name);

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

        // instantiate helper for service
        chatHelper = new ChatHelper(this);

        // initialize result receiver
        sendResultReceiver = new ResultReceiverWrapper(new Handler());
        sendResultReceiver.setReceiver(this);

        // Use helper to start synchronizing with cloud chat service (may be no-op, if Settings.SYNC == false).
        chatHelper.startMessageSync();

        /*
         * Initialize settings to default values.
         */
        if (!Settings.isRegistered(this)) {
            Settings.getAppId(this);
            // Registration must be done manually
        }

    }

	public void onResume() {
        super.onResume();
        senderName.setText(Settings.getChatName(this));
        // register result receiver
        sendResultReceiver.setReceiver(this);
    }

    public void onPause() {
        super.onPause();
        // unregister result receiver
        sendResultReceiver.setReceiver(null);
    }

    public void onDestroy() {
        super.onDestroy();
        // stop synchronization of messages with chat server
        chatHelper.stopMessageSync();
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



    /*
     * Callback for the SEND button.
     */
    public void onClick(View v) {

        if (!Settings.isRegistered(this)) {

            Toast.makeText(this, R.string.register_necessary, Toast.LENGTH_LONG).show();
            return;

        }

        if (chatHelper != null) {

            String chatRoom = getString(R.string.default_chat_room);

            String text = null;

            // get message from UI, and use helper to post a message
            text = messageText.getText().toString().trim();
            chatHelper.postMessage(chatRoom, text, sendResultReceiver);
            // End

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

}