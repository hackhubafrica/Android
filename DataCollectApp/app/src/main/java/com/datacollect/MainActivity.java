package com.helloworldapp;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.datacollect.database.AppDatabase;
import com.datacollect.database.PowerReadingDao;
import com.datacollect.model.PowerReading;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class MainActivity extends AppCompatActivity {
    private EditText etVoltage, etCurrent;
    private Button btnSave;
    private PowerReadingDao powerReadingDao;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        etVoltage = findViewById(R.id.et_voltage);
        etCurrent = findViewById(R.id.et_current);
        btnSave = findViewById(R.id.btn_save);

        AppDatabase db = AppDatabase.getInstance(this);
        powerReadingDao = db.powerReadingDao();

        btnSave.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                saveReading();
            }
        });
    }

    private void saveReading() {
        String voltageStr = etVoltage.getText().toString();
        String currentStr = etCurrent.getText().toString();

        if (voltageStr.isEmpty() || currentStr.isEmpty()) {
            Toast.makeText(this, "Please enter all values", Toast.LENGTH_SHORT).show();
            return;
        }

        double voltage = Double.parseDouble(voltageStr);
        double current = Double.parseDouble(currentStr);
        double power = voltage * current;
        String timestamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.getDefault()).format(new Date());

        PowerReading reading = new PowerReading(voltage, current, power, timestamp);
        powerReadingDao.insert(reading);

        Toast.makeText(this, "Reading Saved!", Toast.LENGTH_SHORT).show();
    }
}
