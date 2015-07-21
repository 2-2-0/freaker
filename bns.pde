// BinauralNeuroStation
// v2.0, by 220 @ WKH

class BinauralNeuroStation {
  Minim minim;
  AudioOutput out;

  SineWave left_signal;
  SineWave right_signal;
  
  
  float  base_frequency = 100;
  float  target_frequency = 6.15;

  float amplitude = 1;

  boolean active;

  BinauralNeuroStation (Minim _minim) {
    active = false;
    try {
      minim = _minim;
      out = minim.getLineOut(Minim.STEREO);
      
      left_signal = new SineWave (0, amplitude, out.sampleRate ());
      left_signal.setPan (-1);
      
      right_signal = new SineWave (0, amplitude, out.sampleRate ());
      right_signal.setPan (1);
      
      active = true;
      
      //out.setVolume (1);
      
      out.addSignal (left_signal);
      out.addSignal (right_signal);
    } catch (NullPointerException e) {
      println ("Couldn't get audio output... sorry!");
      exit ();
    }
  }
  void stop () {
      out.close ();
    }  
  void setFreqs (float left_freq, float right_freq) {
    left_signal.setFreq (left_freq);
    right_signal.setFreq (right_freq);    
  }
  void invertFreqs () {
    
  }
}

