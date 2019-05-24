int branch=0;
int max_branch=1;



class Node{
  Node(){
    tree[branch] = this;
    branch++;
    this.Heuristic = getHeuristic();
    this.extended = false;
    if(branch == max_branch) increase_path();
  }
  
  String path;
  int Heuristic;
  boolean extended;
  

  public void extend(){
    char moves[] = {'w','o','g','b','r','y','Y','R','B','G','O','W'};
    Cube = backup;
    for(int i=0;i<path.length()-2;i++) Move(this.path.charAt(i+2));
    for(int i=0;i<12;i++){
      if(this.path.charAt(this.path.length()-1) == moves[11-i]         || 
        (this.path.charAt(this.path.length()-2) == moves[11-i] && 
          (this.path.charAt(this.path.length()-1) == moves[5-(i%6)] ||  //<>//
           this.path.charAt(this.path.length()-1) == moves[6+(i%6)]))  || //<>//
        (this.path.charAt(this.path.length()-1) == this.path.charAt(this.path.length()-2) &&
           this.path.charAt(this.path.length()-2) == moves[i])
        )  
        {continue;}
      
      Move(moves[i]);
      Node result = new Node();
      result.path = this.path + moves[i];
      //println(result.path);
      Move(moves[11-i]);
    }
    this.extended = true;
  }
  
  public void increase_path(){
  //Increase tree
    Node temp[];
    if(branch==max_branch){
      temp = new Node[branch];
      for(int i=0;i<branch;i++){
        temp[i] = tree[i];
      }
      
      tree = new Node[max_branch*2];
      for(int i=0;i<branch;i++){
        tree[i] = temp[i];
      }
      max_branch*=2;
    }
  }
  
  public int getHeuristic(){
    int Heuristic = cube*cube*6;
    if(cube%2 == 1){
      for(int side=0;side<6;side++){
        for(int i=0;i<cube;i++){
          for(int j=0;j<cube;j++){
            for(int k=0;k<3;k++){
              
              if(Cube[side][i][j][k] != Cube[side][(int) ( (cube-1)/2 )][(int) ( (cube-1)/2 )][k]){
                break;
              }    
              if(k==2){
                Heuristic--;
              }
            }
          }
        }
      }
    }
    
    return Heuristic;
  }
}