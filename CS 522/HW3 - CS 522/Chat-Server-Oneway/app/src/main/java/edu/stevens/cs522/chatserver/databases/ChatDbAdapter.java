package edu.stevens.cs522.chatserver.databases;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;

import edu.stevens.cs522.chatserver.contracts.MessageContract;
import edu.stevens.cs522.chatserver.contracts.PeerContract;
import edu.stevens.cs522.chatserver.entities.Message;
import edu.stevens.cs522.chatserver.entities.Peer;

/**
 * Created by dduggan.
 */

public class ChatDbAdapter {

    private static final String DATABASE_NAME = "messages.db";

    private static final String MESSAGE_TABLE = "messages";

    private static final String PEER_TABLE = "peers";

    private static final int DATABASE_VERSION = 1;

    private DatabaseHelper dbHelper;

    private SQLiteDatabase db;

    private Cursor cursor;

    private String selection;

    private String[] selectionArgs;


    public static class DatabaseHelper extends SQLiteOpenHelper {

        private static final String CREATE_PEER_TABLE = "CREATE TABLE " + PEER_TABLE + " (" +
                PeerContract._ID + " INT PRIMARY KEY, " +
                PeerContract.NAME + " TEXT NOT NULL, " +
                PeerContract.TIMESTAMP + " DATE, " +
                PeerContract.LATITUDE + " DOUBLE, " +
                PeerContract.LONGITUDE + " DOUBLE, " +
                PeerContract.ADDRESS + " TEXT, " +
                PeerContract.PORT + " INT );";

        private static final String CREATE_MESSAGE_TABLE = "CREATE TABLE " + MESSAGE_TABLE + " (" +
                MessageContract._ID + " INT PRIMARY KEY, " +
                MessageContract.CHAT_ROOM + " TEXT, " +
                MessageContract.MESSAGE_TEXT + " TEXT, " +
                MessageContract.TIMESTAMP + " DATE, " +
                MessageContract.LATITUDE + " DOUBLE, " +
                MessageContract.LONGITUDE + " DOUBLE, " +
                MessageContract.SENDER + " TEXT, " +
                MessageContract.SENDER_ID + " LONG );";

        public DatabaseHelper(Context context, String name, SQLiteDatabase.CursorFactory factory, int version) {
            super(context, name, factory, version);
        }

        @Override
        public void onCreate(SQLiteDatabase db) {
            db.execSQL(CREATE_PEER_TABLE);
            db.execSQL(CREATE_MESSAGE_TABLE);
        }

        @Override
        public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
            if(oldVersion!=newVersion) {
                db.execSQL("DROP TABLE IF EXISTS " + PEER_TABLE);
                db.execSQL("DROP TABLE IF EXISTS " + MESSAGE_TABLE);
                onCreate(db);
            }
        }
    }


    public ChatDbAdapter(Context _context) {
        dbHelper = new DatabaseHelper(_context, DATABASE_NAME, null, DATABASE_VERSION);
    }

    public void open() throws SQLException {
        db = dbHelper.getWritableDatabase();

        //Log.d all columns from both tables
        /*
        Cursor peerCursor = db.query(PEER_TABLE,null,null,null,null,null,null);
        Cursor messageCursor = db.query(MESSAGE_TABLE,null,null,null,null,null,null);
        String[] peerColumnNamesArray = peerCursor.getColumnNames();
        String[] messageColumnNamesArray = messageCursor.getColumnNames();
        String peerColumnNames = "";
        String messageColumnNames = "";
        for(int i=0; i<peerColumnNamesArray.length; i++) {
            peerColumnNames+=peerColumnNamesArray[i]+" ";
        }
        for(int j=0; j<messageColumnNamesArray.length; j++) {
            messageColumnNames+=messageColumnNamesArray[j]+" ";
        }
        Log.d("Peer Table",peerColumnNames);
        Log.d("Message Table",messageColumnNames);
         */
    }

    public Cursor fetchAllMessages() {
        return db.query(MESSAGE_TABLE,null,null,null,null,null,null);
    }

    public Cursor fetchAllPeers() {
        return db.query(PEER_TABLE,null,null,null,null,null,null);
    }

    public Peer fetchPeer(long peerId) {
        selection = PeerContract._ID+"=?";
        selectionArgs = new String[]{Long.toString(peerId)};
        cursor = db.query(PEER_TABLE,null,selection,selectionArgs,null,null,null);
        if(cursor.moveToFirst()) {
            return new Peer(cursor);
        }
        throw new SQLException("Invalid peer ID");
    }

    public Cursor fetchMessagesFromPeer(Peer peer) {
        selection = MessageContract.SENDER+"=?";
        selectionArgs = new String[]{peer.name};
        cursor = db.query(MESSAGE_TABLE,null,selection,selectionArgs,null,null,null);
        return cursor;
    }

    public long persist(Message message) throws SQLException {
        ContentValues cv = new ContentValues();
        cursor = db.query(MESSAGE_TABLE,null,null,null,null,null,null);
        message.id = cursor.getCount()+1;
        message.writeToProvider(cv);
        message.id = db.insert(MESSAGE_TABLE,null,cv);
        /*
        message.writeToProvider(cv);
        selection = MessageContract.SENDER_ID+"=?";
        selectionArgs = new String[]{Long.toString(message.senderId)};
        db.update(MESSAGE_TABLE,cv,selection,selectionArgs);
         */

        cursor = db.query(MESSAGE_TABLE,null,null,null,null,null,null);
        Log.d("Message Table Printing",Boolean.toString(cursor.moveToFirst()));
        if(cursor.moveToFirst()) {
            String[] ColumnNamesArray = cursor.getColumnNames();
            do {
                for (int i = 0; i < ColumnNamesArray.length; i++) {
                    Log.d("Message Row Printing",cursor.getString(i));
                }
                Log.d("Message Table Printing","New Row");
            } while (cursor.moveToNext());
        }

        return message.id;
    }

    /**
     * Add a peer record if it does not already exist; update information if it is already defined.
     */
    public long persist(Peer peer) throws SQLException {
        selection = PeerContract.NAME+"=?";
        selectionArgs = new String[]{peer.name};
        cursor = db.query(PEER_TABLE,null,selection,selectionArgs,null,null,null);
        ContentValues cv = new ContentValues();
        if(cursor.moveToFirst()) {
            Peer originalPeer = new Peer(cursor);
            peer.id = originalPeer.id;
            peer.writeToProvider(cv);
            selection = PeerContract.NAME+"=?";
            selectionArgs = new String[]{peer.name};
            db.update(PEER_TABLE,cv,selection,selectionArgs);
        } else {
            cursor = db.query(PEER_TABLE,null,null,null,null,null,null);
            peer.id = cursor.getCount()+1;
            peer.writeToProvider(cv);
            db.insert(PEER_TABLE,null,cv);
            /*
            peer.writeToProvider(cv);
            peer.id = db.insert(PEER_TABLE,null,cv);
            peer.writeToProvider(cv);
            selection = PeerContract.NAME+"=?";
            selectionArgs = new String[]{peer.name};
            db.update(PEER_TABLE,cv,selection,selectionArgs);
             */
        }

        //Printing all rows of the Peer Table
        cursor = db.query(PEER_TABLE,null,null,null,null,null,null);
        Log.d("Peer Table Printing",Boolean.toString(cursor.moveToFirst()));
        if(cursor.moveToFirst()) {
            String[] ColumnNamesArray = cursor.getColumnNames();
            do {
                for (int i = 0; i < ColumnNamesArray.length; i++) {
                    Log.d("Peer Row Printing",cursor.getString(i));
                }
                Log.d("Peer Table Printing","New Row");
            } while (cursor.moveToNext());
        }

        return peer.id;
    }

    public void close() {
        db.close();
    }
}