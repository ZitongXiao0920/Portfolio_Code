import java.util.List;
import java.util.ArrayList;


int[][] grid;
List<Node> path;
long runningTime;
PVector currentPosition;
int pathIndex = 1;
boolean useAStar = true;
int setup = 0;

void setup() {
  size(800, 800);
  GridGenerator gridGenerator = new GridGenerator();
  grid = gridGenerator.generateGrid(50, 50, 0.3);
  int startX = -1;
  int startY = -1;
  int goalX = -1;
  int goalY = -1;

  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[i].length; j++) {
      if (grid[i][j] == GridGenerator.START) {
        startX = i;
        startY = j;
      } else if (grid[i][j] == GridGenerator.GOAL) {
        goalX = i;
        goalY = j;
      }
    }
  }

  if (startX != -1 && startY != -1 && goalX != -1 && goalY != -1) {
    path = aStarSearch(grid, startX, startY, goalX, goalY);
    currentPosition = new PVector(startX, startY);
  }
}
void draw() {
  background(255);
  drawGrid(grid);

  if (path != null) {
    moveBlock();
    drawBlock(currentPosition.x, currentPosition.y);
    stroke(0, 0, 255);
    strokeWeight(3);

    for (int i = 0; i < path.size() - 1; i++) {
      Node current = path.get(i);
      Node next = path.get(i + 1);
      int cellWidth = width / grid.length;
      int cellHeight = height / grid[0].length;
      line(current.x * cellWidth + cellWidth / 2, current.y * cellHeight + cellHeight / 2,
           next.x * cellWidth + cellWidth / 2, next.y * cellHeight + cellHeight / 2);
    }
  }
}

void drawBlock(float x, float y) {
  fill(0, 0, 255);
  int cellWidth = width / grid.length;
  int cellHeight = height / grid[0].length;
  rect(x * cellWidth, y * cellHeight, cellWidth, cellHeight);
}

void moveBlock() {
  if (path != null && pathIndex < path.size()) {
    Node nextNode = path.get(pathIndex);
    currentPosition.set(nextNode.x, nextNode.y);
    pathIndex++;
  }
}

float calculatePathCost(int[][] grid, List<Node> path) {
  float cost = 0;
  for (int i = 0; i < path.size() - 1; i++) {
    cost += moveCost(grid, path.get(i), path.get(i + 1));
  }
  return cost;
}

void mousePressed() {
  int cellWidth = width / grid.length;
  int cellHeight = height / grid[0].length;
  int mouseXIndex = mouseX / cellWidth;
  int mouseYIndex = mouseY / cellHeight;

  if (grid[mouseXIndex][mouseYIndex] == GridGenerator.START) {
    grid[mouseXIndex][mouseYIndex] = GridGenerator.EMPTY;
  } else if (grid[mouseXIndex][mouseYIndex] == GridGenerator.GOAL) {
    grid[mouseXIndex][mouseYIndex] = GridGenerator.EMPTY;
  } else if (grid[mouseXIndex][mouseYIndex] != GridGenerator.OBSTACLE) {
    if (mouseButton == LEFT) {
      grid[mouseXIndex][mouseYIndex] = GridGenerator.START;
    } else if (mouseButton == RIGHT) {
      grid[mouseXIndex][mouseYIndex] = GridGenerator.GOAL;
    }
  }

  int startX = -1;
  int startY = -1;
  int goalX = -1;
  int goalY = -1;

  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[i].length; j++) {
      if (grid[i][j] == GridGenerator.START) {
        startX = i;
        startY = j;
      } else if (grid[i][j] == GridGenerator.GOAL) {
        goalX = i;
        goalY = j;
      }
    }
  }
    if (startX != -1 && startY != -1 && goalX != -1 && goalY != -1) {
      if (setup == 0) {
        path = aStarSearch(grid, startX, startY, goalX, goalY);
        float cost = calculatePathCost(grid, path);
        println("A* search running time cost: " + cost + "s");
      } else if(setup == 1) {
        path = dfsSearch(grid, startX, startY, goalX, goalY);
        float cost = calculatePathCost(grid, path);
        println("DFS search running time cost: " + cost + "s");
      } else {
        path = bfsSearch(grid, startX, startY, goalX, goalY);
        float cost = calculatePathCost(grid, path);
        println("BFS search running time: " + cost + "s");
      }
      
      if (path != null && !path.isEmpty()) {
        currentPosition = new PVector(startX, startY);
        pathIndex = 1;
      }
    } else {
      path = null;
    }
}
void keyPressed() {
  if (key == '1') {
    setup = 0;
    println("Using A*");
  }else  if (key == '2') {
    setup = 1;
    println("Using DFS");
  }else  if (key == '3') {
    setup = 2;
    println("Using BFS");
  }
}   
