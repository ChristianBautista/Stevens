package edu.stevens.cs522.hello;

import androidx.appcompat.app.AppCompatActivity;
import android.widget.TextView;
import android.os.Bundle;

public class ShowActivity extends AppCompatActivity {

    public final static String MESSAGE_KEY = "message";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_show);
        String message = getIntent().getStringExtra(MESSAGE_KEY);
        TextView textView = findViewById(R.id.textView);
        textView.setText(message);
    }
}