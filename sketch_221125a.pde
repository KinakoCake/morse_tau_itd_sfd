IntList morses;
PFont f;
Morse morse;
Render render;


float centerX,centerY = 0.0;

class Morse{
    float x = 100;
    float y = 100;
    String type = "short";
    
    void addMorse() {
    }
    
    void lineBreak() {
    }
}


void setup() {
    background(255);
    size(600,600);
    morses = new IntList();
    
    
    morse = new Morse();
    
    render = new Render();
    
    centerX = width / 2;
    centerY = height / 2;
    //background(255);
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
            println(morse.x);
            break;
        case 39:
            println(morses);
            camPos -= 2;
            break;
        case 37:
            println(morses);
            camPos += 2;
            break;
        case 83:
            println(morses);
            zoomSize += 0.1;
            break;
        case 65:
            if(hoge == false) {
                ms_tmp = millis();
                hoge = true;
            }
    }
    
}

void keyReleased() {
    if(keyCode ==  65) {
        ms = millis() - ms_tmp;
        hoge = false;
    }
    
    if(ms > 150 && keyCode == 65) {
        morses.append(0);
        println("ー");
    } else if(ms < 150 && keyCode == 65) {
        morses.append(1);
        println("・");
    }
}

void draw() {
    background(255);
    fill(0);
    render.renderMorse();
}
/* for(int y = 0;y <=  height;y += interval) {
for(int x = 0;x<= width;x += interval) {
}
}*/