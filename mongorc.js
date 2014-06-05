// set mongo default query to return pretty() json and add ugly() function to return flat json
DBQuery.prototype._prettyShell = true
DBQuery.prototype.ugly = function() {
  this._prettyShell = false
  return this
}