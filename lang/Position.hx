package lang;

class Position {
	public var filename: String;
	public var index: Int;
	public var line: Int;
	public var column: Int;

	public function new (filename: String, index: Int, line: Int, column: Int) {
		this.filename = filename;
		this.index = index;
		this.line = line;
		this.column = column;
	}

	public function advance (char: String = null, delta: Int = 1) {
		this.index += delta;
		this.column += delta;

		if (char == "\n") {
			this.column = 0;
			this.line += 1;
		}

		return (this);
	}

	public function clone () {
		return (new Position(this.filename, this.index, this.line, this.column));
	}

	public function _string (depth: Int = 1): String {
		if (depth == 0)
			return ('Position {}');

		if (depth == 1)
			return ('Position { line: ${this.line}, column: ${this.column} }');

		if (depth == 2)
			return ('Position { index: ${this.index}, line: ${this.line}, column: ${this.column} }');

		if (depth == 3)
			return ('Position { filename: "${this.filename}", index: ${this.index}, line: ${this.line}, column: ${this.column} }');


		return ('Position { index: ${this.index}, line: ${this.line}, column: ${this.column} }');
	}
}