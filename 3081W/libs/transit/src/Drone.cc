#define _USE_MATH_DEFINES
#include "Drone.h"

#include <cmath>
#include <limits>

#include "Package.h"
#include "SimulationModel.h"
#include "include/PathStrategy.h"
#include "include/AstarStrategy.h"
#include "include/DijkstraStrategy.h"
#include "include/BfsStrategy.h"
#include "include/DfsStrategy.h"
#include "include/BeelineStrategy.h"

Drone::Drone(JsonObject& obj) : IEntity(obj) {
  available = true;
}

Drone::~Drone() {}
void Drone::getNextDelivery() {
  if (model && !package && model->scheduledDeliveries.size() > 0) {
    package = model->scheduledDeliveries.front();
    model->scheduledDeliveries.pop_front();

    if (package) {
      available = false;
      pickedUp = false;
      Vector3 packagePosition = package->getPosition();
      Vector3 finalDestination = package->getDestination();
      const std::string stratName = package->getStrategyName();
      if (pathStrategy) {
        delete pathStrategy;
      }

      if (stratName == "beeline") {
        pathStrategy = new BeelineStrategy(this->getPosition(),
                                              packagePosition);
      } else if (stratName == "astar") {
        pathStrategy = new AstarStrategy(packagePosition, finalDestination,
                                              this->model->getGraph());
      } else if (stratName == "dijkstra") {
        pathStrategy = new DijkstraStrategy(packagePosition, finalDestination,
                                              this->model->getGraph());
      } else if (stratName == "dfs") {
        pathStrategy = new DfsStrategy(packagePosition, finalDestination,
                                              this->model->getGraph());
      } else if (stratName == "bfs") {
        pathStrategy = new BfsStrategy(packagePosition, finalDestination,
                                              this->model->getGraph());
      } else {
        pathStrategy = nullptr;
      }
    }
  }
}

void Drone::update(double dt) {
  if (available) {
    getNextDelivery();
  }

  if (!pickedUp) {
    if (pathStrategy) {
      pathStrategy->move(this, dt);

      if (pathStrategy->isCompleted()) {
        pickedUp = true;
      }
    }
  } else {
    if (pathStrategy) {
      pathStrategy->move(this, dt);
      package->setPosition(this->getPosition());

      if (pathStrategy->isCompleted()) {
        pickedUp = false;
        available = true;
        package = nullptr;
        delete pathStrategy;
        pathStrategy = nullptr;
      }
    }
  }
}
