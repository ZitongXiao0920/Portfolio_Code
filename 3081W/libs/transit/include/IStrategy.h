#ifndef STRATEGY_H_
#define STRATEGY_H_

#include "IEntity.h"

/// @brief class IStrategy is an interface used by PathStrategy
class IStrategy {
 public:
  /**
   * @brief move moves an entity through the path generated this is a true
   *virtual function
   *
   * @param entity entity to be moved through the path
   * @param dt this is the difference in time which can be used to make the
   *movement of the entity work
   * @return Nothing
   **/
  virtual void move(IEntity* entity, double dt) = 0;

  /**
   * @brief isCompleted is a function which checks whether or not the path has
   *been traversed and returns the result
   *
   * @return bool of whether or not the path was traversed
   **/
  virtual bool isCompleted() = 0;
};

#endif
