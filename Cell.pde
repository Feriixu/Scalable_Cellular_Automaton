class Cell
{
  public int x;
  public int y;
  public int pixelSize;
  public boolean state;
  public int neighbours;
  public int[] B;
  public int[] S;

  Cell(int x, int y, int pixelSize, boolean state, int[] b, int[] s)
  {
    this.x = x;
    this.y = y;
    this.pixelSize = pixelSize;
    this.state = state;
    this.neighbours = 0;
    this.B = b;
    this.S = s;
  }

  void DoStep()
  {
    if (!this.state)
    {
      for (int i = 0; i < B.length; i++)
      {
        if (this.neighbours == B[i])
        {
          this.state = true;
          break;
        }
      }
    } else
    {
      boolean keepAlive = false;
      for (int i = 0; i < S.length; i++)
      {
        if (this.neighbours == S[i])
        {
          keepAlive = true;
          break;
        }
      }
      if (!keepAlive)
        this.state = false;
    }
  }

  void Draw()
  {
    //if (this.state)
    //{
    //  stroke(255);
    //  point(y * pixelSize, x * pixelSize);
    //}

    if (this.state)
    {
      noStroke();
      fill(255);
      rect((x-1) * pixelSize, (y-1) * pixelSize, this.pixelSize, this.pixelSize);
    }
  }
}
