#ifndef PATH_STRATEGY_H_
#define PATH_STRATEGY_H_

#include <vector>

#include "IStrategy.h"

/**
 * @brief class PathStrategy is the parent class of all path making strategies
 *and the implementation of Istrategy. It holds the common move function which
 *works the same for all path progresssion and the is comepleted which checks if
 *the path has been followed to the end.
 **/
class PathStrategy {
 protected:
  std::vector<std::vector<float>> path;
  int index;

 public:
  /**
   * @brief PathStrategy default constructor
   *
   * @return Nothing
   **/
  PathStrategy();

  /**
   * @brief PathStrategy constructor which can set path
   *
   * @param path path to set internal path to
   * @return Nothing
   **/
  PathStrategy(std::vector<std::vector<float>> path);

  /**
   * @brief move moves an entity along the generated path using index and the
   *entities posiiton to figure out where it is and where it needs to go
   *
   * @param entity pointer to whatever entity is traversing the path
   * @param dt time difference used to make sure the movement is consistent even
   *when the simulation is not
   * @return Nothing
   **/
  void move(IEntity* entity, double dt);

  /**
   * @brief IsCompleted checks whether or not the generated path has been fully
   *traversed based on the index of PathStrategy
   *
   * @return bool of whether or not the path has been traversed
   **/
  bool isCompleted();
};

#endif
