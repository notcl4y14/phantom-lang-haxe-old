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
			var pos = this.pos.clone();
			// var char = this.at();

			// switch (char) {
			// 	case "+":
			// 	case "-":
			// 	case "*":
			// 	case "/":
			// 	case "%":
			// 	case "^":
			// 		tokens.push( new Token(TokenType.Operator, char) );
			// }

			var token: Token = this.lexerizeToken();

			if (token == null) {
				this.advance();
				continue;
			}

			// Haxe's compiler won't calm down until I use try-catch block
			try {

				if (token.pos[0] == null) {
					token.pos[0] = pos.clone();
				}

				if (token.pos[1] == null) {
					token.pos[1] = pos.advance().clone();
				}

			} catch (e) {}

			// if (token != null) tokens.push(token);

			tokens.push(token);

			this.advance();
		}

		return (tokens);
	}

	public function lexerizeToken (): Null<Token> {
		var char = this.at();

		if (char == " " || char == "\t" || char == "\r" || char == "\n") {
			return (null);
		} else if (char == "+" || char == "-" || char == "*" || char == "/" || char == "%" || char == "^") {
			return (new Token(TokenType.Operator, char));
		}

		return (null);
	}
}