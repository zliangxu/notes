probabilistic road map, (PRM): 概率地图

## [A star](http://theory.stanford.edu/~amitp/GameProgramming/)
## [new introduction](http://www.redblobgames.com/pathfinding/a-star/introduction.html)
pathfinding 解决设计一条从起点到目标点的一条最优路径，movement解决选择一条路径，并沿着路径走.

## graph search algorithm
#### [map representations](http://theory.stanford.edu/~amitp/GameProgramming/MapRepresentations.html)
a star可以被用在各种各样形式的地图，包括网格、图
- grids
  网格可以是正方形、三角形、多边形……
  当网格地图中有大面积的网格代价相同时，用网格表示地图是一种比较浪费的形式。

### Greedy Best-First-Search
按照离目标最近的方向进行探索，但找到的路径可能不是最优。

### Breadth First Search
广度优先搜索，即把地图上所有的地点标记为同样的代价。
### Dijkstra’s algorithm.
能够保证找到最优路径，但是寻找路径的过程比较浪费时间

### A star
f(n) = g(n) + h(n)
A star 会对它经过的每个节点都计算f(n)，如果是在最优路径上，则f(n)的值会保持不变。

```python
frontier = PriorityQueue()
frontier.put(start, 0)
came_from = {}
cost_so_far = {}
came_from[start] = None
cost_so_far[start] = 0

while not frontier.empty():
   current = frontier.get()

   if current == goal:
      break
   
   for next in graph.neighbors(current):
      new_cost = cost_so_far[current] + graph.cost(current, next)
      if next not in cost_so_far or new_cost < cost_so_far[next]:
         cost_so_far[next] = new_cost
         priority = new_cost + heuristic(goal, next)
         frontier.put(next, priority)
         came_from[next] = current
```
#### [算法实现指导](http://www.redblobgames.com/pathfinding/a-star/implementation.html)
#### exact heuristics， 精确的启发式
#### [implementation of A*](http://www.redblobgames.com/pathfinding/a-star/implementation.html)

```c++
struct SquareGrid {
  typedef tuple<int,int> Location;
  static array<Location, 4> DIRS;

  //地图宽度、高度
  int width, height;
  unordered_set<Location> walls;

  //地图初始化
  SquareGrid(int width_, int height_)
     : width(width_), height(height_) {}

  //判断点是否在地图内
  inline bool in_bounds(Location id) const {
    int x, y;
    tie (x, y) = id;
    return 0 <= x && x < width && 0 <= y && y < height;
  }

  //网格路径是否可行
  inline bool passable(Location id) const {
    return !walls.count(id);
  }

  //网格点的邻居
  vector<Location> neighbors(Location id) const {
    int x, y, dx, dy;
    tie (x, y) = id;
    vector<Location> results;

    for (auto dir : DIRS) {
      tie (dx, dy) = dir;
      Location next(x + dx, y + dy);
      if (in_bounds(next) && passable(next)) {
        results.push_back(next);
      }
    }

    if ((x + y) % 2 == 0) {
      // aesthetic improvement on square grids
      std::reverse(results.begin(), results.end());
    }

    return results;
  }
};

array<SquareGrid::Location, 4> SquareGrid::DIRS {Location{1, 0}, Location{0, -1}, Location{-1, 0}, Location{0, 1}};
```
#### [grids and graphs](http://www.redblobgames.com/pathfinding/grids/graphs.html)
可以利用网格的附加属性来加速路径搜索。
**grids in graph form**


### Sketch
算法中有两个集合：
- OPEN
  包含待检测的所有节点，初始时，该集合只有一个当前位置的节点
- CLOSED
  包含所有已检测到的节点，初始时，该集合为空。