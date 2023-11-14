#include "include/BeelineStrategy.h"

#include <vector>

#include "math/vector3.h"

BeelineStrategy ::BeelineStrategy(Vector3 startPos, Vector3 endPos) {
  std::vector<float> start = {static_cast<float>(startPos.x),
                              static_cast<float>(startPos.y),
                              static_cast<float>(startPos.z)};
  std::vector<float> end = {static_cast<float>(endPos.x),
                            static_cast<float>(endPos.y),
                            static_cast<float>(endPos.z)};
  path = {start, end};
}
