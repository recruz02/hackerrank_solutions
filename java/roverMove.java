    // Complete the roverMove function below.
    static int roverMove(int matrixSize, List<String> cmds) {
        
        //pseudo code
        //Step 1) for each command
        //Step 2) check command 
        //Step 3) move rover to next position (don't go out of bounds)
        //Step 4) calculate cell position

        int returnValue = 0;
        int rowPosition = 0;
        int columnPosition = 0;
        
        
        for (String cmd : cmds) {
                    
            
            if (cmd.contentEquals("UP")) {  
                //System.out.println("Going UP!");
                if (rowPosition > 0)        //DON'T GO OUT OF BOUNDS
                    rowPosition--;          //MOVE UP ONE ROW
                
            }
            else if (cmd.contentEquals("DOWN")) { 
                //System.out.println("Going DOWN!");
                if (rowPosition < matrixSize-1) //DON'T GO OUT OF BOUNDS
                    rowPosition++;              //MOVE DOWN ONE ROW
            }
            else if (cmd.contentEquals("LEFT")) {   
                //System.out.println("Going LEFT!");
                if (columnPosition > 0)
                    columnPosition--;           //MOVE LEFT ONE COLUMN
            }
            else if (cmd.contentEquals("RIGHT")) {  
                //System.out.println("Going RIGHT!");
                if (columnPosition < matrixSize-1)  //DON'T GO OUT OF BOUNDS
                    columnPosition++;               //MOVE RIGHT ONE COLUMN
            }
        }
           
            
        returnValue = (rowPosition * matrixSize) + columnPosition;
        
        return returnValue;
    }

