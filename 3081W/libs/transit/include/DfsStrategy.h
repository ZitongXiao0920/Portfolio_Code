#ifndef DFS_STRATEGY_H_
#define DFS_STRATEGY_H_

#include "math/vector3.h"
#include "graph.h"
#include "PathStrategy.h"

class DfsStrategy : public PathStrategy{
 public:
    /**
     * @brief constructor for DijkstraStrategy, with start/end position for path 
     *  and graph on which to construct path
    */
        DfsStrategy(Vector3 startPos, Vector3 endPos,
            const routing::IGraph* graph);
};
#endif
