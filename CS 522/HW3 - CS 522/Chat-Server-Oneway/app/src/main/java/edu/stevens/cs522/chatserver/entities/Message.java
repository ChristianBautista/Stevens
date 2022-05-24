package edu.stevens.cs522.chatserver.entities;

import android.content.ContentValues;
import android.database.Cursor;
import android.os.Parcel;
import android.os.Parcelable;

import java.util.Date;

import edu.stevens.cs522.chatserver.contracts.MessageContract;

/**
 * Created by dduggan.
 */

public class Message implements Parcelable, Persistable {

    public long id;

    public String chatRoom;

    public String messageText;

    public Date timestamp;

    public Double latitude;

    public Double longitude;

    public String sender;

    public long senderId;

    public Message() {
    }

    public Message(Cursor in) {
        id = MessageContract.getId(in);
        chatRoom = MessageContract.getChatRoom(in);
        messageText = MessageContract.getMessageText(in);
        timestamp = MessageContract.getTimestamp(in);
        latitude = MessageContract.getLatitude(in);
        longitude = MessageContract.getLongitude(in);
        sender = MessageContract.getSender(in);
        senderId = MessageContract.getSenderId(in);
    }

    public Message(Parcel in) {
        id = in.readLong();
        chatRoom = in.readString();
        messageText = in.readString();
        timestamp = (Date) in.readValue(Date.class.getClassLoader());
        latitude = in.readDouble();
        longitude = in.readDouble();
        sender = in.readString();
        senderId = in.readLong();
    }

    @Override
    public void writeToProvider(ContentValues out) {
        MessageContract.putId(out,id);
        MessageContract.putChatRoom(out,chatRoom);
        MessageContract.putMessageText(out,messageText);
        MessageContract.putTimestamp(out,timestamp);
        MessageContract.putLatitude(out,latitude);
        MessageContract.putLongitude(out,longitude);
        MessageContract.putSender(out,sender);
        MessageContract.putSenderId(out,senderId);
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeLong(id);
        dest.writeString(chatRoom);
        dest.writeString(messageText);
        dest.writeValue(timestamp);
        dest.writeDouble(latitude);
        dest.writeDouble(longitude);
        dest.writeString(sender);
        dest.writeLong(senderId);
    }

    public static final Creator<Message> CREATOR = new Creator<Message>() {

        @Override
        public Message createFromParcel(Parcel source) {
            return new Message(source);
        }

        @Override
        public Message[] newArray(int size) {
            return new Message[size];
        }

    };

}

