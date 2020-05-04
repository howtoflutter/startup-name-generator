class Task {
  String _name;
  bool _completed;

  Task(this._name, this._completed);

  getName() => this._name;
  setName(name) => this._name = name;

  isCompleted() => this._completed;
  setCompleted(completed) => this._completed = completed;



}
