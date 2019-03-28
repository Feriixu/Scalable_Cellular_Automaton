Cell[][] cells;
int pixelSize = 2;
// Crystal Structures
//int[] B = {4, 5}; int[] S = {1, 2, 3, 4, 5};

// Life
//int[] B = {3}; int[] S = {2, 3};

// High-Life
//int [] B = {3,6}; int[] S = {2,3};

// Dot Life
//int [] B = {3}; int[] S = {0,2,3};

// Maze
//int[] B = {3}; int[] S = {1,2,3,4,5};

// Mazeelectric
int [] B = {3}; int[] S = {1,2,3,4};

// Move
//int [] B = {3,6,8}; int[] S = {2,4,5};

//Amoeba
//int [] B = {3,5,7}; int[] S = {1,3,5,8};

//Replicator
//int [] B = {1,3,5,7}; int[] S = {1,3,5,7};

boolean pause = false;
int rows;
int cols;

void setup() 
{
  fullScreen();
  stroke(255);
  frameRate(60);
  cols = (width / pixelSize) + 2;
  rows = (height / pixelSize) + 2;
  
  cells = new Cell[cols][rows];

  for (int col = 0; col < cols; col++)
  {
    for (int row = 0; row < rows; row++)
    {
      //println("Generating " + x + " " + y);
      cells[col][row] = new Cell(col, row, pixelSize, random(5) < 0, B, S);
    }
  }
}

void draw() 
{
  if (!pause)
  {
    //println(frameRate);
    background(50);

    for (int col = 1; col < cols-1; col++)
    {
      for (int row = 1; row < rows-1; row++)
      {
        GetNeighbours(col, row);
      }
    }

    for (int col = 1; col < cols-1; col++)
    {
      for (int row = 1; row < rows-1; row++)
      {
        cells[col][row].DoStep();
        cells[col][row].Draw();
      }
    }
  }
}

void GetNeighbours(int col, int row)
{
  //println("Getting Neighbours of " + x + " " + y);
  int countedNeighbours = 0;
  for (int offX = -1; offX < 2; offX++)
  {
    for (int offY = -1; offY < 2; offY++)
    {
      //println("Getting state of " +(x + i) + " " + (y + j));
      if (cells[col + offX][row + offY].state)
        countedNeighbours++;
    }
  }
  if (cells[col][row].state)
    countedNeighbours--;
  cells[col][row].neighbours = countedNeighbours;
}

void mousePressed()
{
  pause = true;
  cells[(mouseX / pixelSize) + 1][(mouseY / pixelSize) + 1].state = true;
  cells[(mouseX / pixelSize) + 1][(mouseY / pixelSize) + 1].Draw();
}

void mouseDragged()
{
  pause = true;
  cells[(mouseX / pixelSize) + 1][(mouseY / pixelSize) + 1].state = true;
  cells[(mouseX / pixelSize) + 1][(mouseY / pixelSize) + 1].Draw();
}

void mouseReleased()
{
  pause = false;
}
