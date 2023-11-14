#include "DijkstraStrategy.h"
#include "math/vector3.h"
#include "routing/dijkstra.h"
#include <vector>

DijkstraStrategy::DijkstraStrategy(Vector3 startPos, Vector3 endPos,
                                        const routing::IGraph* graph) {
    std::vector<float> start = {static_cast<float>(startPos.x),
            static_cast<float>(startPos.y), static_cast<float>(startPos.z)};
    std::vector<float> end = {static_cast<float>(endPos.x),
            static_cast<float>(endPos.y), static_cast<float>(endPos.z)};
        path = graph->GetPath(start, end, routing::Dijkstra::Instance());
}
