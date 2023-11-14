#ifndef BEELINE_STRATEGY_H_
#define BEELINE_STRATEGY_H_

#include "PathStrategy.h"
#include "math/vector3.h"

/**
 * @brief class BeelineStrategy is a startegy used to create a path between two
 *points. This path is a straight line from startingPos to endingPos
 **/
class BeelineStrategy : public PathStrategy {
 public:
  /**
   * @brief Beeline strategy constructor
   *
   * @param startPos starting position to construct path between
   * @param endPos ending position of the path being constructed
   * @return Nothing
   **/
  BeelineStrategy(Vector3 startPos, Vector3 endPos);
};

#endif
