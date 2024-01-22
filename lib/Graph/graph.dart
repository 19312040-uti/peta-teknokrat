//nodes are undirected

class Node {
  var _data = [];
  late String name;
  late Edge edge;

  Node(
    this.name,
    this._data,
  ) {
    edge = Edge(this);
  }

  get data => _data;

  set data(entry) {
    _data.add(entry);
  }

  void addNeighbor(Node neighbor) {
    //add neighbor to our edge list
    edge.addNeighbor(neighbor);

    //add our node to the neighbor's edge list
    neighbor.edge.addNeighbor(this);
  }

  Node accessNeighbor(Node neighbor) {
    if (edge._neighborList.contains(neighbor)) {
      return neighbor;
    }

    return this;
  }

  Set<Edge> getAllNeighbors() {
    return this.edge.neighborList;
  }

  // Node searchNeighbor(Node neighbor) {
  //todo: implement this
  // }
}

class Edge {
  Node parent;
  Set<Edge> _neighborList = {};

  Edge(this.parent);

  void addNeighbor(Node neighbor) {
    Edge edge = Edge(neighbor);
    _neighborList.add(edge);
  }

  Set<Edge> get neighborList => _neighborList;
}
