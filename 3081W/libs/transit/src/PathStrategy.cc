#include "PathStrategy.h"

#include "math/vector3.h"

PathStrategy::PathStrategy() { this->index = 0; }

PathStrategy::PathStrategy(std::vector<std::vector<float>> path) {
  this->path = path;
  this->index = 0;
}

bool PathStrategy::isCompleted() { return path.size() - 1 == index; }

void PathStrategy::move(IEntity* entity, double dt) {
  if (!isCompleted() && index < path.size()) {
    entity->setDirection(
        (Vector3(path[index][0], path[index][1], path[index][2]) -
         entity->getPosition())
            .unit());
    entity->setPosition(entity->getPosition() +
                        (entity->getDirection() * entity->getSpeed() * dt));
    if (entity->getPosition() ==
        Vector3(path[index][0], path[index][1], path[index][2])) {
      index++;
    }
  }
}
