import utils.*;
import lang.Lexer;
import lang.Token;
import lang.TokenType;

class App {
	
	public function new() {
		var args = Sys.args();
		// Sys.println(args);

		var code = Filesystem.readFile(args[0]);

		if (code == null) {
			Sys.println('No file "${args[0]}" found');
			return;
		}

		var lexer = new Lexer(args[0], code);
		var tokens = lexer.lexerize();

		for (token in tokens) {
			Sys.println(token._string());
		}
	}

	static public function main() {
		var app = new App();
	}
}