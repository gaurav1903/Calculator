import 'dart:collection';

class Stack<T> {
  final _stack = Queue<T>();
  Queue getqueue() {
    return _stack;
  }

  void push(T element) {
    _stack.addLast(element);
  }

  T pop() {
    final T lastElement = _stack.last;
    _stack.removeLast();
    return lastElement;
  }

  void clear() {
    _stack.clear();
  }

  bool get isEmpty => _stack.isEmpty;
}
