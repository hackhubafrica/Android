package com.datacollect.database;

import android.content.Context;
import androidx.room.Database;
import androidx.room.Room;
import androidx.room.RoomDatabase;

import com.datacollect.model.PowerReading;

@Database(entities = {PowerReading.class}, version = 1)
public abstract class AppDatabase extends RoomDatabase {
    private static AppDatabase instance;

    public abstract PowerReadingDao powerReadingDao();

    public static synchronized AppDatabase getInstance(Context context) {
        if (instance == null) {
            instance = Room.databaseBuilder(context.getApplicationContext(),
                    AppDatabase.class, "power_database")
                    .fallbackToDestructiveMigration()
                    .allowMainThreadQueries() // Temporary for simplicity
                    .build();
        }
        return instance;
    }
}
