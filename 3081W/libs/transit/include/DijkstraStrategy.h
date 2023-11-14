#ifndef DIJKSTRA_STRATEGY_H_
#define DIJKSTRA_STRATEGY_H_

#include "PathStrategy.h"
#include "graph.h"
#include "math/vector3.h"

class DijkstraStrategy : public PathStrategy{
 public:
    /**
     * @brief constructor for DijkstraStrategy, with start/end position for path 
     *  and graph on which to construct path
    */
        DijkstraStrategy(Vector3 startPos, Vector3 endPos,
            const routing::IGraph* graph);
};

#endif
