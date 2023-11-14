class GridGenerator {
  static final int EMPTY = 0;
  static final int OBSTACLE = 1;
  static final int START = 2;
  static final int GOAL = 3;
  static final int YELLOW = 4;

  int[][] generateGrid(int rows, int cols, float obstacleDensity) {
    int[][] grid = new int[rows][cols];
    float yellowDensity = 0.2;
    
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        if (random(1) < obstacleDensity) {
          grid[i][j] = OBSTACLE;
        } else if (random(1) < yellowDensity) {
          grid[i][j] = YELLOW;
        } else {
          grid[i][j] = EMPTY;
        }
      }
    }
    
    int startX = (int) random(rows);
    int startY = (int) random(cols);
    grid[startX][startY] = START;
    
    int goalX, goalY;
    do {
      goalX = (int) random(rows);
      goalY = (int) random(cols);
    } while (grid[goalX][goalY] == START);
    grid[goalX][goalY] = GOAL;
    
    return grid;
  }
}

void drawGrid(int[][] grid) {
  int cellWidth = width / grid.length;
  int cellHeight = height / grid[0].length;

  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[i].length; j++) {
      if (grid[i][j] == GridGenerator.OBSTACLE) {
        fill(0);
      } else if (grid[i][j] == GridGenerator.START) {
        fill(0, 255, 0);
      } else if (grid[i][j] == GridGenerator.GOAL) {
        fill(255, 0, 0);
      } else if (grid[i][j] == GridGenerator.YELLOW) {
        fill(255, 255, 0); // Yellow color
      } else {
        fill(255);
      }
      rect(i * cellWidth, j * cellHeight, cellWidth, cellHeight);
      stroke(200);
      rect(i * cellWidth, j * cellHeight, cellWidth, cellHeight);
    }
  }
}
