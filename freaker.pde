// freaker
// by 220 @ WKH

import controlP5.*;

import ddf.minim.signals.*;
import ddf.minim.*;

/// UI
// CP controls
ControlP5 cp;
Knob k_base_h;
Knob k_base_t;
Knob k_base_u;
Knob k_base_d;

Knob k_bin_h;
Knob k_bin_t;
Knob k_bin_u;
Knob k_bin_d;

Textarea l_base;
Textarea l_bin;

// colors
color color_red = color (255, 64, 0);
color color_blue = color (0, 64, 255);
color color_green = color (0, 84, 24);

color color_white = color (255);
color color_black = color (0);
color color_gray = color (127);

PFont font_id;

/// Engines
BinauralNeuroStation bns;
Minim minim;

/// Storage
float base_freq;
float bin_freq;


void setup () {
  size (680, 290);
  
  minim = new Minim (this);
  bns = new BinauralNeuroStation (minim);
  
  cp = new ControlP5 (this);
  
  k_base_h = cp.addKnob ("L1000")
                 .setRange (0, 9)
                 .setValue (0)
                 .setRadius (50)
                 .setPosition (35, 25)
                 
                 .setNumberOfTickMarks(9)
                 .snapToTickMarks (true)
                 .setTickMarkLength(4)
                 .snapToTickMarks(true)
                 
                 .setDragDirection (Knob.VERTICAL)
                 
                 .setColorForeground (color (color_blue))
                 .setColorBackground (color (color_black))
                 .setColorActive (color (color_white))
                 .setColorValueLabel (color (color_blue))
                 .setColorCaptionLabel (color (color_green))
                 ;
                
  k_base_t = cp.addKnob ("L0100")
                 .setRange (0, 9)
                 .setValue (0)
                 .setRadius (50)
                 .setPosition (165, 25)
                 
                 .setNumberOfTickMarks(9)
                 .snapToTickMarks (true)
                 .setTickMarkLength(4)
                 .snapToTickMarks(true)
                 
                 .setDragDirection (Knob.VERTICAL)
                 
                 .setColorForeground (color (color_blue))
                 .setColorBackground (color (color_black))
                 .setColorActive (color (color_white))
                 .setColorValueLabel (color (color_blue))
                 .setColorCaptionLabel (color (color_green))
                 ;
                 
    k_base_u = cp.addKnob ("L0010")
                 .setRange (0, 9)
                 .setValue (0)
                 .setRadius (50)
                 .setPosition (295, 25)
                 
                 .setNumberOfTickMarks(9)
                 .snapToTickMarks (true)
                 .setTickMarkLength(4)
                 .snapToTickMarks(true)
                 
                 .setDragDirection (Knob.VERTICAL)
                 
                 .setColorForeground (color (color_blue))
                 .setColorBackground (color (color_black))
                 .setColorActive (color (color_white))
                 .setColorValueLabel (color (color_blue))
                 .setColorCaptionLabel (color (color_green))
                 ;
                 
    k_base_d = cp.addKnob ("L0001")
                 .setRange (0, 9)
                 .setValue (0)
                 .setRadius (50)
                 .setPosition (455, 25)
                 
                 .setNumberOfTickMarks(9)
                 .snapToTickMarks (true)
                 .setTickMarkLength(4)
                 .snapToTickMarks(true)
                 
                 .setDragDirection (Knob.VERTICAL)
                 
                 .setColorForeground (color (color_blue))
                 .setColorBackground (color (color_black))
                 .setColorActive (color (color_white))
                 .setColorValueLabel (color (color_blue))
                 .setColorCaptionLabel (color (color_green))
                 ;
                 
                 
                 
    k_bin_h = cp.addKnob ("B1000")
                 .setRange (0, 9)
                 .setValue (0)
                 .setRadius (50)
                 .setPosition (35, 155)
                 
                 .setNumberOfTickMarks(9)
                 .snapToTickMarks (true)
                 .setTickMarkLength(4)
                 .snapToTickMarks(true)
                 
                 .setDragDirection (Knob.VERTICAL)
                 
                 .setColorForeground (color (color_red))
                 .setColorBackground (color (color_black))
                 .setColorActive (color (color_white))
                 .setColorValueLabel (color (color_red))
                 .setColorCaptionLabel (color (color_green))
                 ;
                
  k_bin_t = cp.addKnob ("B0100")
                 .setRange (0, 9)
                 .setValue (0)
                 .setRadius (50)
                 .setPosition (165, 155)
                 
                 .setNumberOfTickMarks(9)
                 .snapToTickMarks (true)
                 .setTickMarkLength(4)
                 .snapToTickMarks(true)
                 
                 .setDragDirection (Knob.VERTICAL)
                 
                 .setColorForeground (color (color_red))
                 .setColorBackground (color (color_black))
                 .setColorActive (color (color_white))
                 .setColorValueLabel (color (color_red))
                 .setColorCaptionLabel (color (color_green))
                 ;
                 
    k_bin_u = cp.addKnob ("B0010")
                 .setRange (0, 9)
                 .setValue (0)
                 .setRadius (50)
                 .setPosition (295, 155)
                 
                 .setNumberOfTickMarks(9)
                 .snapToTickMarks (true)
                 .setTickMarkLength(4)
                 .snapToTickMarks(true)
                 
                 .setDragDirection (Knob.VERTICAL)
                 
                 .setColorForeground (color (color_red))
                 .setColorBackground (color (color_black))
                 .setColorActive (color (color_white))
                 .setColorValueLabel (color (color_red))
                 .setColorCaptionLabel (color (color_green))
                 ;
                 
    k_bin_d = cp.addKnob ("B0001")
                 .setRange (0, 9)
                 .setValue (0)
                 .setRadius (50)
                 .setPosition (455, 155)
                 
                 .setNumberOfTickMarks(9)
                 .snapToTickMarks (true)
                 .setTickMarkLength(4)
                 .snapToTickMarks(true)
                 
                 .setDragDirection (Knob.VERTICAL)
                 
                 .setColorForeground (color (color_red))
                 .setColorBackground (color (color_black))
                 .setColorActive (color (color_white))
                 .setColorValueLabel (color (color_red))
                 .setColorCaptionLabel (color (color_green))
                 ;
                 
                 
    cp.addBang ("xLR")
                  .setPosition (585, 25)
                  .setSize (70, 20)
                  .setLabel ("execute L/R")
                  
                  .setColorForeground (color (color_gray))
                  .setColorActive (color (color_white))
                  .setColorCaptionLabel (color (color_white))
                  ;
                  
    cp.addBang ("xBin")
                  .setPosition (585, 65)
                  .setSize (70, 20)
                  .setLabel ("execute BTs")
                  
                  .setColorForeground (color (color_gray))
                  .setColorActive (color (color_white))
                  .setColorCaptionLabel (color (color_white))
                  ;
                 
    cp.addBang ("xStop")
                  .setPosition (585, 105)
                  .setSize (70, 20)
                  .setLabel ("STOP!")
                  
                  .setColorForeground (color (color_gray))
                  .setColorActive (color (color_red))
                  .setColorCaptionLabel (color (color_white))
                  ;
                  
                  
    l_base = cp.addTextarea("L / Base")
                  .setPosition (585, 150)
                  .setSize (50, 12)
                  .setColorBackground(color(255,64))
                  .setColorForeground(color(0,0))
                  .setColor(color(0, 64, 255))
                  ;
                  
    l_bin = cp.addTextarea("R / Bin")
                  .setPosition (585, 170)
                  .setSize (50, 12)
                  .setColorBackground(color(255,64))
                  .setColorForeground(color(0,0))
                  .setColor(color(255, 64, 0))
                  ;
  
  font_id = loadFont ("EditUndoBRK-26.vlw");
  textFont (font_id, 26);
}
void draw () {
  int y;
  
  background (#0D0D0D);

  textAlign (RIGHT, BOTTOM);
  
  textFont (font_id, 12);
  fill (0, 127, 64);
  text ("by 220", width-15, height-74);
  
  textFont (font_id, 26);
  fill (127, 64, 0);
  text ("FREAKER", width-15, height-35);
  fill (0, 64, 127);
  text ("FREAKER", width-15, height-55);
  
  
  for (int i=0; i<128; i++) {
    y = (int)random (0, height);
    strokeWeight ((int)random (1,5));
    stroke ((int)random (10, 128), 8);
    line (0, y, width, y);
  }
  
  stroke (32);
  fill (0, 128);
  strokeWeight (1);
  rect (10, 10, width-20, height-20);
  
  fill (255);
  textAlign (RIGHT, BOTTOM);
  text ("FREAKER", width-15, height-15);
}
void getFreqs () {
  base_freq = k_base_h.value ()*100;
  base_freq+= k_base_t.value ()*10;
  base_freq+= k_base_u.value ();
  base_freq+= k_base_d.value ()/10;
  
  bin_freq = k_bin_h.value ()*100;
  bin_freq+= k_bin_t.value ()*10;
  bin_freq+= k_bin_u.value ();
  bin_freq+= k_bin_d.value ()/10;

  l_base.setText (str (base_freq));
  l_bin.setText (str (bin_freq));    
}
void xLR () {
  getFreqs ();
  bns.setFreqs (0, 0);
  delay (200);
  bns.setFreqs (base_freq, bin_freq);
}
void xBin () {
  getFreqs ();
  bns.setFreqs (0, 0);
  delay (200);
  bns.setFreqs (base_freq, base_freq+bin_freq);
}
void xStop () {
  bns.setFreqs (0, 0);
}

