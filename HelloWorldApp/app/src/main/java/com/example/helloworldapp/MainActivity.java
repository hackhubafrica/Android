package com.example.helloworldapp;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.widget.TextView;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        TextView textView = findViewById(R.id.helloText);
        textView.setText("Hello, World!");

        // Transition to the DateActivity after 3 seconds
        new Handler().postDelayed(() -> {
            Intent intent = new Intent(MainActivity.this, DateActivity.class);
            startActivity(intent);
            finish();
        }, 3000);
    }
}
