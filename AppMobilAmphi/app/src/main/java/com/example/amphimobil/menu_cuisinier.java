package com.example.amphimobil;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import androidx.appcompat.app.AppCompatActivity;

public class menu_cuisinier extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.menu_cuisinier_activity);

        final Button buttonPlat = findViewById(R.id.button_plat);
        buttonPlat.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(menu_cuisinier.this, menu_cuisinier_plats.class);
                startActivity(intent);

            }
        });
    }


}