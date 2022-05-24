package edu.stevens.cs522.chatserver.providers;

import android.content.ContentProvider;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.UriMatcher;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteDatabase.CursorFactory;
import android.database.sqlite.SQLiteOpenHelper;
import android.net.Uri;
import android.util.Log;

import edu.stevens.cs522.chatserver.contracts.BaseContract;
import edu.stevens.cs522.chatserver.contracts.MessageContract;
import edu.stevens.cs522.chatserver.contracts.PeerContract;
import edu.stevens.cs522.chatserver.entities.Peer;

public class ChatProvider extends ContentProvider {

    public ChatProvider() {
    }

    private static final String AUTHORITY = BaseContract.AUTHORITY;

    private static final String MESSAGE_CONTENT_PATH = MessageContract.CONTENT_PATH;

    private static final String MESSAGE_CONTENT_PATH_ITEM = MessageContract.CONTENT_PATH_ITEM;

    private static final String PEER_CONTENT_PATH = PeerContract.CONTENT_PATH;

    private static final String PEER_CONTENT_PATH_ITEM = PeerContract.CONTENT_PATH_ITEM;


    private static final String DATABASE_NAME = "messages.db";

    private static final String MESSAGE_TABLE = "messages";

    private static final String PEER_TABLE = "peers";

    private static final int DATABASE_VERSION = 1;

    private Cursor cursor;

    // Create the constants used to differentiate between the different URI requests.
    private static final int MESSAGES_ALL_ROWS = 1;
    private static final int MESSAGES_SINGLE_ROW = 2;
    private static final int PEERS_ALL_ROWS = 3;
    private static final int PEERS_SINGLE_ROW = 4;

    public static class DbHelper extends SQLiteOpenHelper {

        public DbHelper(Context context, String name, CursorFactory factory, int version) {
            super(context, name, factory, version);
        }

        private static final String CREATE_PEER_TABLE = "CREATE TABLE " + PEER_TABLE + " (" +
                PeerContract._ID + " INTEGER PRIMARY KEY AUTOINCREMENT, " +
                PeerContract.NAME + " TEXT NOT NULL, " +
                PeerContract.TIMESTAMP + " DATE, " +
                PeerContract.LATITUDE + " DOUBLE, " +
                PeerContract.LONGITUDE + " DOUBLE, " +
                PeerContract.ADDRESS + " TEXT, " +
                PeerContract.PORT + " INT );";

        private static final String CREATE_MESSAGE_TABLE = "CREATE TABLE " + MESSAGE_TABLE + " (" +
                MessageContract._ID + " INTEGER PRIMARY KEY AUTOINCREMENT, " +
                MessageContract.CHATROOM + " TEXT, " +
                MessageContract.MESSAGE_TEXT + " TEXT, " +
                MessageContract.TIMESTAMP + " DATE, " +
                MessageContract.LATITUDE + " DOUBLE, " +
                MessageContract.LONGITUDE + " DOUBLE, " +
                MessageContract.SENDER + " TEXT, " +
                MessageContract.SENDER_ID + " LONG );";

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
            }
        }

    }

    private DbHelper dbHelper;

    @Override
    public boolean onCreate() {
        // Initialize your content provider on startup.
        dbHelper = new DbHelper(getContext(), DATABASE_NAME, null, DATABASE_VERSION);
        return true;
    }

    // Used to dispatch operation based on URI
    private static final UriMatcher uriMatcher;

    // uriMatcher.addURI(AUTHORITY, CONTENT_PATH, OPCODE)
    static {
        uriMatcher = new UriMatcher(UriMatcher.NO_MATCH);
        uriMatcher.addURI(AUTHORITY, MESSAGE_CONTENT_PATH, MESSAGES_ALL_ROWS);
        uriMatcher.addURI(AUTHORITY, MESSAGE_CONTENT_PATH_ITEM, MESSAGES_SINGLE_ROW);
        uriMatcher.addURI(AUTHORITY, PEER_CONTENT_PATH, PEERS_ALL_ROWS);
        uriMatcher.addURI(AUTHORITY, PEER_CONTENT_PATH_ITEM, PEERS_SINGLE_ROW);
    }

    protected String contentType(String content) {
        return "vnd.android.cursor/vnd." + BaseContract.AUTHORITY + "." + content + "s";
    }

    protected String contentItemType(String content) {
        return "vnd.android.cursor.item/vnd." + BaseContract.AUTHORITY + "." + content + "s";
    }

    @Override
    public String getType(Uri uri) {
        switch (uriMatcher.match(uri)) {
            case MESSAGES_ALL_ROWS:
                return contentType("message");
            case MESSAGES_SINGLE_ROW:
                return contentItemType("message");
            case PEERS_ALL_ROWS:
                return contentType("peer");
            case PEERS_SINGLE_ROW:
                return contentItemType("peer");
            default:
                throw new IllegalStateException("Unrecognized case.");
        }
    }

    @Override
    public Uri insert(Uri uri, ContentValues values) {
        SQLiteDatabase db = dbHelper.getWritableDatabase();
        ContentResolver resolver;
        switch (uriMatcher.match(uri)) {
            case MESSAGES_ALL_ROWS:
                // Make sure to notify any observers
                // throw new UnsupportedOperationException("Not yet implemented");
                cursor = db.query(MESSAGE_TABLE,null,null,null,null,null,null);
                values.put(MessageContract._ID,cursor.getCount()+1);
                long msgId = db.insert(MESSAGE_TABLE, null, values);
                resolver = getContext().getContentResolver();
                resolver.notifyChange(MessageContract.CONTENT_URI(msgId), null);
                Log.d("Message ID",values.getAsString(MessageContract._ID));
                return MessageContract.CONTENT_URI(msgId);

            case PEERS_ALL_ROWS:
                // Make sure to notify any observers
                // throw new UnsupportedOperationException("Not yet implemented");
                //Log.d("Peer ID",values.getAsString(PeerContract._ID));
                String selection = PeerContract.NAME + "=?";
                String[] selectionArgs = new String[]{values.getAsString(PeerContract.NAME)};
                cursor = db.query(PEER_TABLE, null, selection, selectionArgs, null, null, null);
                long id;
                if (cursor.moveToFirst()) {
                    // update peer information in the database
                    //Peer peer = new Peer(cursor);
                    //values.put(PeerContract._ID,peer.id);4
                    values.put(PeerContract._ID,cursor.getLong(0));
                    id = cursor.getLong(0);
                    db.update(PEER_TABLE,values,selection,selectionArgs);
                } else {
                    cursor = db.query(PEER_TABLE,null,null,null,null,null,null);
                    values.put(PeerContract._ID,cursor.getCount()+1);
                    id = db.insert(PEER_TABLE, null, values);
                }

                resolver = getContext().getContentResolver();
                resolver.notifyChange(PeerContract.CONTENT_URI(id), null);
                return PeerContract.CONTENT_URI(id);

            default:
                throw new IllegalStateException("insert: bad case");
        }
    }

    @Override
    public Cursor query(Uri uri, String[] projection, String selection,
                        String[] selectionArgs, String sortOrder) {
        SQLiteDatabase db = dbHelper.getReadableDatabase();
        switch (uriMatcher.match(uri)) {
            case MESSAGES_ALL_ROWS:
                // The selection args may filter for messages for a particular peer.
                // throw new UnsupportedOperationException("Not yet implemented");

                if(selection!=null) {
                    Log.d("Selection",selection);
                    Log.d("Selection Args",selectionArgs[0]);
                }

                cursor = db.query(MESSAGE_TABLE, projection, selection, selectionArgs, null, null, sortOrder);

                Cursor messageTable = db.query(MESSAGE_TABLE,null,null,null,null,null,null);
                messageTable.moveToFirst();
                for(int i=0; i<messageTable.getCount(); i++) {
                    for(int j=0; j<messageTable.getColumnCount(); j++) {
                        Log.d("Msg Table Printing", messageTable.getString(j));
                    }
                    messageTable.moveToNext();
                }

                cursor.setNotificationUri(getContext().getContentResolver(), uri);
                return cursor;

            case PEERS_ALL_ROWS:
                cursor = db.query(PEER_TABLE, projection, selection, selectionArgs, null, null, sortOrder);
                cursor.setNotificationUri(getContext().getContentResolver(), uri);
                return cursor;

            case MESSAGES_SINGLE_ROW:
                // Implement this to handle query of a specific message.
                selection = MessageContract._ID + "=?";
                selectionArgs = new String[]{String.valueOf(MessageContract.getId(uri))};
                cursor = db.query(MESSAGE_TABLE, projection, selection, selectionArgs, null, null, sortOrder);
                cursor.setNotificationUri(getContext().getContentResolver(), uri);
                return cursor;

            case PEERS_SINGLE_ROW:
                // Implement this to handle query of a specific peer by PK.
                selection = PeerContract._ID + "=?";
                selectionArgs = new String[]{String.valueOf(PeerContract.getId(uri))};
                cursor = db.query(MESSAGE_TABLE, projection, selection, selectionArgs, null, null, sortOrder);
                cursor.setNotificationUri(getContext().getContentResolver(), uri);
            default:
                throw new IllegalStateException("Query: bad case");
        }
    }

    @Override
    public int update(Uri uri, ContentValues values, String selection,
                      String[] selectionArgs) {
        SQLiteDatabase db = dbHelper.getWritableDatabase();
        switch (uriMatcher.match(uri)) {
            case MESSAGES_ALL_ROWS:
                return db.update(MESSAGE_TABLE,values,selection,selectionArgs);
            case PEERS_ALL_ROWS:
                return db.update(PEER_TABLE,values,selection,selectionArgs);
            case MESSAGES_SINGLE_ROW:
                selection = MessageContract._ID + "=?";
                selectionArgs = new String[]{String.valueOf(MessageContract.getId(uri))};
                return db.update(MESSAGE_TABLE,values,selection,selectionArgs);
            case PEERS_SINGLE_ROW:
                selection = PeerContract._ID + "=?";
                selectionArgs = new String[]{String.valueOf(PeerContract.getId(uri))};
                return db.update(PEER_TABLE,values,selection,selectionArgs);
            default:
                throw new IllegalStateException("Query: bad case");
        }
    }

    @Override
    public int delete(Uri uri, String selection, String[] selectionArgs) {
        // Implement this to handle requests to delete one or more rows.
        SQLiteDatabase db = dbHelper.getWritableDatabase();
        switch (uriMatcher.match(uri)) {
            case MESSAGES_ALL_ROWS:
                return db.delete(MESSAGE_TABLE,selection,selectionArgs);
            case PEERS_ALL_ROWS:
                return db.delete(PEER_TABLE,selection,selectionArgs);
            case MESSAGES_SINGLE_ROW:
                selection = MessageContract._ID + "=?";
                selectionArgs = new String[]{String.valueOf(MessageContract.getId(uri))};
                return db.delete(MESSAGE_TABLE,selection,selectionArgs);
            case PEERS_SINGLE_ROW:
                selection = PeerContract._ID + "=?";
                selectionArgs = new String[]{String.valueOf(PeerContract.getId(uri))};
                return db.delete(PEER_TABLE,selection,selectionArgs);
            default:
                throw new IllegalStateException("Query: bad case");
        }
    }

}
