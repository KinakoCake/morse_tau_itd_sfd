class Render{
    
    void renderMorse() {
        if(morses.size()>0) {
            for(int i = morses.size();i>0;i--) {
                Morse m = morses.get(i - 1);
                
                
                if(m.type == "short") {
                    ellipse(m.x + camPos, m.y, m.w * zoomSize, m.h * zoomSize);
                } else if(m.type == "long") {
                    stroke(255);
                    strokeWeight(50);
                    
                    line(m.x, m.y, m.x + m.w, m.y);
                    noStroke();
                }
            }
        }
    }
}
