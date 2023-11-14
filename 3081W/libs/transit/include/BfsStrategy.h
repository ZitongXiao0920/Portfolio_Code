#ifndef BFS_STRATEGY_H_
#define BFS_STRATEGY_H_

#include "math/vector3.h"
#include "graph.h"
#include "PathStrategy.h"

/**
 *@brief class BfsStrategy is a search algorithm for drone to find path. Inherits from PathStrategy.
 **/
class BfsStrategy : public PathStrategy{
 public:
   /**
   * @brief Constructor for BfsStrategy class.
   * @param startPos - Vector3 store the start position.
   * @param endPos - Vector3 store the end position.
   * @param graph - routing::IGraph* is a graph contain the graph.
   **/
    BfsStrategy(Vector3 startPos, Vector3 endPos, const routing::IGraph* graph);
};
#endif
