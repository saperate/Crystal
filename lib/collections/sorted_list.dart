
/// List that auto-sorts comparable objects
class SortedList<E extends Comparable>{
  final _list = <E>[];

  void add(E value){
    _list.add(value);
    _sort();
  }

  bool remove(E value){
    //No need to call _sort(), removing a value from a
    //sorted list doesn't un-sort it.
    return _list.remove(value);
  }

  void _sort(){
    //
  }

}