package com.datacollect.database;

import androidx.room.Dao;
import androidx.room.Insert;
import androidx.room.Query;

import com.datacollect.model.PowerReading;

import java.util.List;

@Dao
public interface PowerReadingDao {
    @Insert
    void insert(PowerReading reading);

    @Query("SELECT * FROM power_readings ORDER BY timestamp DESC")
    List<PowerReading> getAllReadings();
}
