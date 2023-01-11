class ControlMorse{
    
    /*
    void addMorse(int type) {
    if(type==0 || type==1){
    morse.add("");
}else{
    println("[Error] "+"Unexpected numbers are in the variable. (addMorse)");
}
    
}
    */
    
    float spacing = 10;
    float rows = 1;
    float y = 70;
    float i = 0;
    
    float prevMorseX = 40;
    float prevMorseY = 0;
    float prevMorseW = 0;
    String prevMorseType;
    
    boolean isLineBreak = true;
    
    
    void addMorse(Morse morse,String type) {
        
        switch(type) {
            case "short":
                morse.w = 50;
                break;
            case "long":
                morse.w = 100;
                break;
            default:
            println("[Error] " + "Unexpected type are in the morse.type (ControlMorse)");
        }
        
        if(morses.size()>0) {
            int msLength = morses.size() - 1;
            prevMorseX = morses.get(msLength).x;
            prevMorseY = morses.get(msLength).y;
            prevMorseW = morses.get(msLength).w;
            prevMorseType = morses.get(msLength).type;
            
            println(rows + " | " + morses.get(msLength).rows);
            
            if(rows == morses.get(msLength).rows) {
                isLineBreak = false;
            } else{
                isLineBreak = true;
            }
            
            if(prevMorseX + morse.w + 400 > width) {
                lineBreak();
                isLineBreak = true;
            }
            
        }

        if(prevMorseType == "long" && isLineBreak == false) {
            spacing = 70;
        }else if(isLineBreak == true && prevMorseType == "long"){
            spacing = 0;
        }else{
            spacing = 10;
        }
        
        if(isLineBreak == true) {
            prevMorseX = 40;
            prevMorseW = 0;
            spacing = 0;
            isLineBreak = false;
        }
        
        
        println("spacing: " + spacing);
        
        

        println("aaa | " + (prevMorseX + prevMorseW));

        float i = prevMorseX + prevMorseW + spacing;
        
        
        
        
        
        
        println("prevMorseX: " + prevMorseX);
        println("prevMorseW: " + prevMorseW);
        println("spacing: " + spacing);
        
        morse.x = i;
        morse.y = y;
        morse.rows = rows;
        
        
        morse.type = type;
        morses.add(morse);
    }
    
    void lineBreak() {
        println("[break]");
        rows += 1;
        y = y + morse.h + 30;
    }
}
