abstract class GameEvent {
  int? index;
  GameEvent({this.index});
}

class GameBoxEvent extends GameEvent {
  GameBoxEvent();
}

class EventO extends GameEvent {
  EventO(int index) : super(index: index);
}

class EventX extends GameEvent {
  EventX(int index) : super(index: index);
}

class EventGameRestart extends GameEvent {
  EventGameRestart();
}



