package edu.stevens.cs522.hello;

import androidx.appcompat.app.AppCompatActivity;

import android.widget.Button;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Button button = findViewById(R.id.button);
        button.setOnClickListener(this);
    }

    public void onClick(View v) {
        Intent intent = new Intent(this,ShowActivity.class);
        EditText editText = findViewById(R.id.textbox);
        String text = editText.getText().toString();
        intent.putExtra(ShowActivity.MESSAGE_KEY,text);
        startActivity(intent);
    }
}