  public static boolean isPangram(String pString) {
    
    
    String alphabet = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z"; 
    String[] arrOfStr = alphabet.split(",", -1); 
    
    
    Set<String> alphaSet = new HashSet<String>();
    for (String letter : arrOfStr) {
      alphaSet.add(letter);
    }
    
    
    //boolean value = alphaSet.contains("a");
    //System.out.println(value);
    
    
    
    for (char myChar : pString.toCharArray()) {
      //System.out.println(myChar);
      if (alphaSet.contains(Character.toString(myChar))) {
        //System.out.println("I'm here!");
      	alphaSet.remove(Character.toString(myChar));
      }
      
    }
    
    //System.out.println(alphaSet);

    
    
    
    
    return (alphaSet.size() == 0);
  }