package lang;

class Token {
	public var type: TokenType;
	public var value: Any;
	public var pos: Array<Position>;

	public function new (type: TokenType, value: Any = null) {
		this.type = type;
		this.value = value;
		this.pos = [];
	}

	public function setPos (left: Position, right: Position = null) {
		this.pos[0] = left;
		this.pos[1] = (right != null) ? right : left.clone().advance();
	}

	public function _string (depth: Int = 1): String {
		if (depth == 0)
			return ('Token {}');

		else if (depth == 1)
			return ('Token { type: ${this.type}, value: ${this.value} }');

		else if (depth == 2)
			return ('Token { type: ${this.type}, value: ${this.value}, pos: [ ${this.pos[0]._string()}, ${this.pos[1]._string()} ] }');


		return ('Token { type: ${this.type}, value: ${this.value} }');
	}
}