package com.example.amphimobil;


import android.os.Bundle;
import android.util.Log;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import androidx.appcompat.app.AppCompatActivity;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public class menu_cuisinier_plats extends AppCompatActivity {


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.menu_cuisinier_plats_activity);
        Log.d("test","test");

        try {
            listePlats();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }



    public void listePlats() throws IOException {
        Log.d("test","test");

        OkHttpClient client = new OkHttpClient();
        ArrayList arrayListNomPlat = new ArrayList<String>();

        Request request = new Request.Builder()
                .url("http://10.100.0.6/~yboidin/PHP/Plat/afficherPlat.php")
                .build();

        Call call = client.newCall(request);
        call.enqueue(new Callback() {

            public void onResponse(Call call, Response response) throws IOException {
                String responseStr = response.body().string();
                JSONArray jsonArrayClasses = null;
                try {
                    jsonArrayClasses = new JSONArray(responseStr);

                    for (int i = 0; i < jsonArrayClasses.length(); i++) {
                        JSONObject jsonClasse = null;
                        jsonClasse = jsonArrayClasses.getJSONObject(i);
                        arrayListNomPlat.add("Id  : " + jsonClasse.getString("IDPLAT"));
                        arrayListNomPlat.add("Nom : " + jsonClasse.getString("NOMPLAT"));
                        arrayListNomPlat.add("Description : " + jsonClasse.getString("DESCRIPTIONPLAT"));
                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                }

                ListView listViewPlats = findViewById(R.id.listViewPlats);

                ArrayAdapter<String> arrayAdapterClasses = new ArrayAdapter<String>(menu_cuisinier_plats.this, android.R.layout.simple_list_item_1, arrayListNomPlat);

                listViewPlats.setAdapter(arrayAdapterClasses);

            }

            public void onFailure(Call call, IOException e) {
                Log.d("Test", "erreur!!! connexion impossible");
            }

        });
    }
}