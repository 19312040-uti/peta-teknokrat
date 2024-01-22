import "dart:io";
import 'package:equatable/equatable.dart';
import 'package:peta_teknokrat/Graph/graph.dart';

class mapModel {
  static Map<String, Node> nodes = {};

  mapModel() {
    try {
      final file = File("data/locations.txt");
      final lines = file.readAsLinesSync();

      for (final line in lines) {
        final parts = line.split(";");
        final key = parts[0].trim();
        final dataString = parts[1].trim();
        final data = dataString
            .substring(1, dataString.length - 1)
            .split(",")
            .map((e) => e.trim())
            .toList();

        nodes[key] = Node(key, data);
      }

      connectEdgestoNodes("data/edges.txt");
    } catch (e) {
      print("error reading locations file: $e");
    }
  }

  void connectEdgestoNodes(String filename) {
    try {
      final file = File(filename);
      final lines = file.readAsLinesSync();

      for (final line in lines) {
        final parts = line.split(";");
        final node1key = parts[0];
        final node2key = parts[1];

        Node? node1 = nodes[node1key];
        Node? node2 = nodes[node2key];

        if (node1 != null && node2 != null) {
          node1.addNeighbor(node2);
        } else {
          print("Node not found for edge: $line");
        }
      }
    } catch (e) {
      print("Error reading edge file: $e");
    }
  }
}
