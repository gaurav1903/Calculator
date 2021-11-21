import 'dart:collection';

import 'package:flutter/material.dart';

class Stack<T> {
  final _stack = Queue<T>();
  Queue getqueue() {
    return _stack;
  }

  void push(T element) {
    _stack.addLast(element);
  }

  T top() {
    return _stack.last;
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

// class Pair
// {
//  String first;
//  int second;
//  Pair(String x,int y)
//  {
//    first=x;
//    second=y;
//  }
// }
