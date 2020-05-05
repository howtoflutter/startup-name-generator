class Task {
  String _name;
  bool _completed;
  String _uId;

  Task(this._name, this._completed, this._uId);

  getName() => this._name;
  setName(name) => this._name = name;

  getUID() => this._uId;
  setUID(uId) => this._uId = uId;


  isCompleted() => this._completed;
  setCompleted(completed) => this._completed = completed;
}
