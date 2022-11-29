class Render{

    void renderMorse(){
        if(morses.size()>0) {
        for(int i = morses.size();i>0;i--) {
            int num = morses.get(i - 1);
                switch(num) {
                case 0:
                    ellipse(centerX+camPos, centerY, 400*zoomSize, 200*zoomSize);
                    break;  
                case 1:
                    ellipse(centerX+camPos, centerY, 200*zoomSize, 200*zoomSize);
                    break;  
                default :
                    println("[Error] "+"Unexpected numbers are in the variable");
            }
        }
    }
    }
}
