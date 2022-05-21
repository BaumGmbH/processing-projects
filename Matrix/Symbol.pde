class Symbol {
  
  int xPos;
  int yPos;
  
  Stream parent;
  
  char sym;
  
  Symbol(int x, int y, Stream parent) {
    this.xPos = x;
    this.yPos = y * streamWidth * 2;
    
    sym = (random(0,1) > 0.5) ? '0' : '1';
    
    this.parent = parent;
  }
  
  void show() {
    textSize(streamWidth);
    text(sym, xPos, yPos + parent.yPos);
  }
}
