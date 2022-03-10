part of 'mind_map_bloc.dart';

abstract class MindMapEvent extends Equatable {
  const MindMapEvent();

  @override
  List<Object> get props => [];
}

class InitialMindMapEvent extends MindMapEvent {}

class AddMindMapEvent extends MindMapEvent {
  final MindMapNode mindMapNode;
  final String position;
  final String fatherNodeId;

  const AddMindMapEvent(
      {required this.mindMapNode,
      required this.position,
      required this.fatherNodeId});
}

class AddMindMapEventSimple extends MindMapEvent {
  final MindMapNode mindMapNode;
  final Widget nodeWidget;
  final GlobalKey<MindMapNodeWidgetState> globalKey;

  const AddMindMapEventSimple(
      {required this.mindMapNode,
      required this.nodeWidget,
      required this.globalKey});
}

class RemoveMindMapEvent extends MindMapEvent {
  final String nodeId;

  const RemoveMindMapEvent({required this.nodeId});
}
