package lang;

class Token {
	public var type: TokenType;
	public var value: Any;

	public function new (type: TokenType, value: Any = null) {
		this.type = type;
		this.value = value;
	}

	public function _string (): String {
		return 'Token { type: ${this.type}, value: ${this.value} }';
	}
}