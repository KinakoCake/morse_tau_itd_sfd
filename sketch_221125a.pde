import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput sound;
SineWave sine;

PFont f;
ControlMorse m;
Render render;
Morse morse;
ArrayList<Morse> morses;


float centerX,centerY = 0.0;

void setup() {
    int hoge = 2;
    
    background(255);
    size(1280,720);
    m = new ControlMorse();
    
    morse = new Morse();
    
    morses = new ArrayList<Morse>();
    
    render = new Render();
    
    centerX = width / 2;
    centerY = height / 2;
    //background(255);
    
    minim = new Minim(this);
    sound = minim.getLineOut(Minim.STEREO);
    sine = new SineWave(0, 0.5, sound.sampleRate());
    sound.addSignal(sine);
}

float ms_tmp = 0;
float ms = 0;
boolean hoge = false;

float zoomSize = 1;

float camPos = 0;

void keyPressed() {
    println(keyCode);
    switch(keyCode) {
        case 82:
            zoomSize = 1;
            camPos = 0;
            break;
        case 79:
            println(morses.size());
            for(int i = morses.size();i>0;i--) {
                Morse m = morses.get(i - 1);
                println(m.type + "  " + i);
            }
            break;
        case 39:
            //println(morses);
            camPos -= 20;
            break;
        case 37:
            //println(morses);
            camPos += 20;
            break;
        case 83:
            //println(morses);
            zoomSize += 0.1;
            break;
        case 65:
            
            sine.setFreq(500);
            if(hoge == false) {
                ms_tmp = millis();
                hoge = true;
            }
            break;
        case 10:
            m.lineBreak();
            break;
    }
    
}

void keyReleased() {
    if(keyCode ==  65) {
        sine.setFreq(0);
        ms = millis() - ms_tmp;
        hoge = false;
    }
    
    if(ms > 150 && keyCode == 65) {
        morse = new Morse();
        
        m.addMorse(morse,"long");
        
        println("ー");
        
    } else if(ms < 150 && keyCode == 65) {
        morse = new Morse();
        
        m.addMorse(morse,"short");
        println("・");
        
    }
}

void draw() {
    background(0);
    fill(255);
    render.renderMorse();
}

void stop() {
    sound.close();
    minim.stop();
    super.stop();
}

/* for(int y = 0;y <=  height;y += interval) {
for(int x = 0;x<= width;x += interval) {
}
}*/