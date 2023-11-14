import java.util.List;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Collections;
import java.util.Stack;
import java.util.LinkedList;
import java.util.Queue;

class Node {
  int x;
  int y;
  float g;
  float h;
  float f;
  Node parent;

  Node(int x, int y, Node parent) {
    this.x = x;
    this.y = y;
    this.g = 0;
    this.h = 0;
    this.f = 0;
    this.parent = parent;
  }

  Node(int x, int y) {
    this(x, y, null);
  }

  boolean equals(Node other) {
    return this.x == other.x && this.y == other.y;
  }
  Node getParent() {
    return parent;
  }
  void setParent(Node parent) {
  this.parent = parent;
  }
}

float moveCost(int[][] grid, Node from, Node to) {
    return 1;
}

List<Node> getNeighbors(int[][] grid, Node currentNode) {
  List<Node> neighbors = new ArrayList<Node>();
  int[][] directions = {{0, 1}, {1, 0}, {0, -1}, {-1, 0}};

  for (int[] direction : directions) {
    int newX = currentNode.x + direction[0];
    int newY = currentNode.y + direction[1];

    if (newX >= 0 && newX < grid.length && newY >= 0 && newY < grid[0].length) {
      if (grid[newX][newY] != GridGenerator.OBSTACLE) {
        neighbors.add(new Node(newX, newY));
      }
    }
  }

  return neighbors;
}

List<Node> aStarSearch(int[][] grid, int startX, int startY, int goalX, int goalY) {
  List<Node> openSet = new ArrayList<>();
  List<Node> closedSet = new ArrayList<>();

  Node startNode = new Node(startX, startY);
  Node goalNode = new Node(goalX, goalY);

  openSet.add(startNode);

  while (!openSet.isEmpty()) {
    Node currentNode = openSet.stream().min(Comparator.comparing(n -> n.f)).orElse(null);

    if (currentNode.x == goalNode.x && currentNode.y == goalNode.y) {
      List<Node> path = new ArrayList<>();
      Node node = currentNode;
      while (node != null) {
        path.add(node);
        node = node.parent;
      }
      Collections.reverse(path);
      return path;
    }

    openSet.remove(currentNode);
    closedSet.add(currentNode);

    // Check cardinal neighbors only
    int[] dx = {0, 0, -1, 1};
    int[] dy = {-1, 1, 0, 0};

    for (int i = 0; i < 4; i++) {
      int newX = currentNode.x + dx[i];
      int newY = currentNode.y + dy[i];

      if (newX >= 0 && newX < grid.length && newY >= 0 && newY < grid[0].length && grid[newX][newY] != GridGenerator.OBSTACLE) {
        Node neighbor = new Node(newX, newY);

        if (closedSet.stream().anyMatch(n -> n.x == neighbor.x && n.y == neighbor.y)) {
          continue;
        }

        float tentativeG = currentNode.g + moveCost(grid, currentNode, neighbor);

        boolean inOpenSet = openSet.stream().anyMatch(n -> n.x == neighbor.x && n.y == neighbor.y);

        if (!inOpenSet || tentativeG < neighbor.g) {
          neighbor.parent = currentNode;
          neighbor.g = tentativeG;
          neighbor.h = dist(neighbor.x, neighbor.y, goalNode.x, goalNode.y);
          neighbor.f = neighbor.g + neighbor.h;

          if (!inOpenSet) {
            openSet.add(neighbor);
          }
        }
      }
    }
  }

  return null;
}
List<Node> buildPath(Node goalNode) {
  List<Node> path = new ArrayList<Node>();
  Node currentNode = goalNode;

  while (currentNode != null) {
    path.add(currentNode);
    currentNode = currentNode.getParent();
  }

  Collections.reverse(path);
  return path;
}

List<Node> dfsSearch(int[][] grid, int startX, int startY, int goalX, int goalY) {
  boolean[][] visited = new boolean[grid.length][grid[0].length];
  Node startNode = new Node(startX, startY);
  Stack<Node> stack = new Stack<Node>();
  stack.push(startNode);

  while (!stack.isEmpty()) {
    Node currentNode = stack.pop();
    int x = currentNode.x;
    int y = currentNode.y;

    if (x == goalX && y == goalY) {
      return buildPath(currentNode);
    }

    if (!visited[x][y]) {
      visited[x][y] = true;
      List<Node> neighbors = getNeighbors(grid, currentNode);

      for (Node neighbor : neighbors) {
        if (!visited[neighbor.x][neighbor.y]) {
          neighbor.setParent(currentNode);
          stack.push(neighbor);
        }
      }
    }
  }
  return null;
}

List<Node> bfsSearch(int[][] grid, int startX, int startY, int goalX, int goalY) {
    boolean[][] visited = new boolean[grid.length][grid[0].length];
    Node startNode = new Node(startX, startY);
    Queue<Node> queue = new LinkedList<>();
    queue.add(startNode);

    while (!queue.isEmpty()) {
        Node currentNode = queue.poll();
        int x = currentNode.x;
        int y = currentNode.y;

        if (x == goalX && y == goalY) {
            return buildPath(currentNode);
        }

        if (!visited[x][y]) {
            visited[x][y] = true;
            List<Node> neighbors = getNeighbors(grid, currentNode);

            for (Node neighbor : neighbors) {
                if (!visited[neighbor.x][neighbor.y]) {
                    neighbor.setParent(currentNode);
                    queue.add(neighbor);
                }
            }
        }
    }
    return null;
}
