package edu.stevens.cs522.chatserver.databases;

import androidx.lifecycle.LiveData;
import androidx.room.Dao;
import androidx.room.Insert;
import androidx.room.Query;

import java.util.List;

import edu.stevens.cs522.chatserver.entities.Message;

// add annotations for Repository pattern

@Dao
public interface MessageDAO {

    /**
     * Get all messages in the database.
     * @return
     */
    @Query("SELECT * FROM message")
    public LiveData<List<Message>> fetchAllMessages();

    /**
     * Get all the messages for a particular peer.
     * @param peerId
     * @return
     */
    @Query("SELECT * FROM message WHERE senderId = :peerId")
    public LiveData<List<Message>> fetchMessagesFromPeer(long peerId);

    /**
     * Add a new message to the database.
     * @param message
     */
    @Insert
    public void persist(Message message);

}
