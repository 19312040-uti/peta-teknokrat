part of 'map_bloc.dart';

enum Status { initial, searching, found, unknown }

sealed class MapState extends Equatable {
  const MapState(
      {this.status = Status.initial, this.nodes = this.found = false});

  final Status status;
  final Map<String, Node> nodes;
  final bool found;

  @override
  List<Object> get props => [];
}

final class MapSearching extends MapState {
  MapSearching();
}

final class MapInitial extends MapState {
  const MapInitial();
}
