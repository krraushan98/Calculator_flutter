import 'dart:collection';
class Stack_dart<T> {
  final _stack = Queue<T>();

  bool get isEmpty => _stack.isEmpty;
  bool get isNotEmpty => _stack.isNotEmpty;

  int get length => _stack.length;

  bool canPop() => _stack.isNotEmpty;
  
  void clearStack(){
    while(_stack.isNotEmpty){
      _stack.removeLast();
    }
  }

  void push(T element) {
    _stack.addLast(element);
  }

  T pop() {
    T lastElement = _stack.last;
    _stack.removeLast();
    return lastElement;
  }

  T peak() => _stack.last;

}