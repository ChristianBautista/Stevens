package edu.stevens.cs522.chat.databases;

import androidx.lifecycle.LiveData;
import androidx.room.Dao;
import androidx.room.Insert;
import androidx.room.Query;

import java.util.List;

import edu.stevens.cs522.chat.entities.Message;

// add annotations for Repository pattern

@Dao
public interface MessageDAO {

    @Query("SELECT * FROM message")
    public LiveData<List<Message>> fetchAllMessages();

    @Query("SELECT * FROM message WHERE senderId = :peerId")
    public LiveData<List<Message>> fetchMessagesFromPeer(long peerId);

    @Insert
    public void persist(Message message);

}
