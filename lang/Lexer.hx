package lang;

class Lexer {
	public var code: String;
	public var pos: Position;

	public function new (filename: String, code: String) {
		this.code = code;
		this.pos = new Position(filename, -1, 0, -1);

		this.advance();
	}

	// ------------------------------------------------------------------------------

	public function at (range: Int = 1): String {
		if (range > 1) return (this.code.substr(this.pos.index, range));
		return (this.code.charAt(this.pos.index));
	}

	public function advance (delta: Int = 1): Void {
		this.pos.advance(this.at(), delta);
	}

	public function isEOF (): Bool {
		return (this.pos.index >= this.code.length);
	}

	// ------------------------------------------------------------------------------

	public function lexerize (): Array<Token> {
		var tokens: Array<Token> = [];

		while (!this.isEOF()) {
			var char = this.at();

			// switch (char) {
			// 	case "+":
			// 	case "-":
			// 	case "*":
			// 	case "/":
			// 	case "%":
			// 	case "^":
			// 		tokens.push( new Token(TokenType.Operator, char) );
			// }

			if (char == "+" || char == "-" || char == "*" || char == "/" || char == "%" || char == "^") {
				tokens.push( new Token(TokenType.Operator, char) );
			}

			this.advance();
		}

		return (tokens);
	}
}