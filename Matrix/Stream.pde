class Stream {
  
  int xPos;
  int yPos;
  
  int len;
  
  Symbol[] syms;
  
  Stream(int x, int len) {
     this.xPos = x * streamWidth;
     this.len = len;
     
     syms = new Symbol[len];
     
     for (int i = 0; i < len; i++) {
       syms[i] = new Symbol(xPos, i, this); 
     }
  }
  
  void show() {
     for (Symbol sym : syms) {
       sym.show();
     }
  }
}
