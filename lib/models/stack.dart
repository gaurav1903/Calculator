import 'dart:collection';

import 'package:flutter/material.dart';

class Stack<T> {
  int size = 0;
  final _stack = Queue<T>();
  Queue getqueue() {
    return _stack;
  }

  void push(T element) {
    _stack.addLast(element);
    size += 1;
  }

  T top() {
    return _stack.last;
  }

  T pop() {
    size -= 1;
    final T lastElement = _stack.last;
    _stack.removeLast();
    return lastElement;
  }

  void clear() {
    _stack.clear();
    size = 0;
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
