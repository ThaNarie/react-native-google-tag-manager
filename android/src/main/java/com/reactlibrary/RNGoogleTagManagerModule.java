
package com.reactlibrary;

import android.os.Bundle;
import android.content.Context;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ReadableMap;

import com.google.firebase.analytics.FirebaseAnalytics;

public class RNGoogleTagManagerModule extends ReactContextBaseJavaModule {

  private FirebaseAnalytics mFirebaseAnalytics = null;
  private final ReactApplicationContext reactContext;

  public RNGoogleTagManagerModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNGoogleTagManager";
  }

  @ReactMethod
  public void initialiseFirebase() {
    mFirebaseAnalytics = FirebaseAnalytics.getInstance(getReactApplicationContext());
  }

  @ReactMethod
  public void logEvent(ReadableMap event) {
    String name = event.getString("name");
    HashMap<String, Object> data = event.getMap("data").toHashMap();

    if (mFirebaseAnalytics != null) {
      Bundle bundle = new Bundle();

      Set entrySet = data.entrySet();
      Iterator iterator = entrySet.iterator();

      while (iterator.hasNext()) {
        Map.Entry mapEntry = (Map.Entry) iterator.next();

        bundle.putString((String) mapEntry.getKey(), (String) mapEntry.getValue());
      }

      mFirebaseAnalytics.logEvent(name, bundle);
    }
  }
}