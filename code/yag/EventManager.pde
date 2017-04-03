class Event {
  public String type;
  Event(String type) {
    this.type = type;
  }
}

interface EventListener {
  public void onEvent(Event event);
}

class EventManager extends GameObject {
  HashMap<String, ArrayList<EventListener>> eventListeners;
  ArrayList<Event> eventsBuffer;

  EventManager() {
    eventListeners = new HashMap<String, ArrayList<EventListener>>();
    eventsBuffer = new ArrayList<Event>();
  }

  void addEventListener(String eventType, EventListener eventListener) {
    if (!eventListeners.containsKey(eventType)) {
      eventListeners.put(eventType, new ArrayList<EventListener>());
    }
    eventListeners.get(eventType).add(eventListener);
  }

  void removeEventListener(String eventType, EventListener eventListener) {
    ArrayList<EventListener> listeners = eventListeners.get(eventType);
    listeners.remove(eventListener);
    if (listeners.size() == 0) {
      eventListeners.remove(eventType);
    }
  }

  void dispatchEvent(Event event){
    eventsBuffer.add(event);
  }

  void flush() {
    for (Event event : eventsBuffer) {
      if (!eventListeners.containsKey(event.type)) {
        continue;
      }

      // Copy to avoid ConcurrentModificationException when an event listener
      // adds new listeners.
      ArrayList<EventListener> listeners = new ArrayList<EventListener>(eventListeners.get(event.type));
      for (EventListener listener : listeners) {
        listener.onEvent(event);
      }
    }
    eventsBuffer.clear();
  }
}