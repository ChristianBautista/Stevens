package edu.stevens.cs522.chatserver.databases;

import android.content.Context;

import androidx.room.Database;
import androidx.room.Room;
import androidx.room.RoomDatabase;
import androidx.room.TypeConverters;

import edu.stevens.cs522.chatserver.entities.DateConverter;
import edu.stevens.cs522.chatserver.entities.InetAddressConverter;
import edu.stevens.cs522.chatserver.entities.Message;
import edu.stevens.cs522.chatserver.entities.Peer;

/**
 * Created by dduggan.
 *
 * See build.gradle file for app for where schema file is left after processing.
 */

// Add annotations (including @TypeConverters)

@Database(entities={Peer.class,Message.class}, version=1)
public abstract class ChatDatabase extends RoomDatabase {

    private static final String DATABASE_NAME = "messages.db";

    private static ChatDatabase instance;

    private int refCounter = 0;

    public abstract PeerDAO peerDao();

    public abstract MessageDAO messageDao();

    public static ChatDatabase getInstance(Context context) {
        if (instance == null || !instance.isOpen()) {
            // We allow main thread queries (for insert/upsert) for THIS ASSIGNMENT ONLY!
            instance = Room.databaseBuilder(context, ChatDatabase.class, DATABASE_NAME).allowMainThreadQueries().build();
        }
        instance.refCounter++;
        return instance;
    }

    public void close() {
        if (instance != null && instance.isOpen()) {
            refCounter--;
            if (refCounter == 0) {
                instance.close();
                instance = null;
            }
        }
    }

}