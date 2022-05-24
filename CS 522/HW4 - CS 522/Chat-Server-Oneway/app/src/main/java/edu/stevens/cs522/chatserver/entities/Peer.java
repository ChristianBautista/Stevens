package edu.stevens.cs522.chatserver.entities;

import android.content.ContentValues;
import android.database.Cursor;
import android.os.Parcel;
import android.os.Parcelable;

import java.net.InetAddress;
import java.util.Date;

import edu.stevens.cs522.base.DateUtils;
import edu.stevens.cs522.base.InetAddressUtils;
import edu.stevens.cs522.chatserver.contracts.PeerContract;

/**
 * Created by dduggan.
 */

public class Peer implements Parcelable, Persistable {

    // Will be database key
    public long id;

    public String name;

    // Last time we heard from this peer.
    public Date timestamp;

    // Where we heard from them
    public Double latitude;

    public Double longitude;

    // Where they sent message from
    public InetAddress address;

    public int port;

    public Peer() {
    }

    public Peer(Cursor in) {
        id = PeerContract.getId(in);
        name = PeerContract.getName(in);
        timestamp = PeerContract.getTimestamp(in);
        latitude = PeerContract.getLatitude(in);
        longitude = PeerContract.getLongitude(in);
        address = PeerContract.getAddress(in);
        port = PeerContract.getPort(in);
    }

    public Peer(Parcel in) {
        id = in.readLong();
        name = in.readString();
        timestamp = new Date(in.readLong());
        latitude = in.readDouble();
        longitude = in.readDouble();
        address = InetAddressUtils.readAddress(in);
        port = in.readInt();
    }

    @Override
    public void writeToProvider(ContentValues out) {
        // PeerContract.putId(out, id);
        out.put(PeerContract._ID, id);
        PeerContract.putName(out, name);
        PeerContract.putTimestamp(out, timestamp);
        PeerContract.putLatitude(out, latitude);
        PeerContract.putLongitude(out, longitude);
        PeerContract.putAddress(out, address);
        PeerContract.putPort(out, port);
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel out, int flags) {
        out.writeLong(id);
        out.writeString(name);
        DateUtils.writeDate(out,timestamp);
        out.writeDouble(latitude);
        out.writeDouble(longitude);
        InetAddressUtils.writeAddress(out,address);
        out.writeInt(port);
    }

    public static final Creator<Peer> CREATOR = new Creator<Peer>() {

        @Override
        public Peer createFromParcel(Parcel source) {
            return new Peer(source);
        }

        @Override
        public Peer[] newArray(int size) {
            return new Peer[size];
        }

    };
}
