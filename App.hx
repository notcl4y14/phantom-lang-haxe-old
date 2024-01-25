import utils.*;

class App {

	// public function readFile(name: String): Null<String> {
	// 	if (!sys.FileSystem.exists(name)) return (null);
	// 	var content: String = sys.io.File.getContent(name);
	// 	return (content);
	// }
	
	public function new() {
		Sys.println(Filesystem.readFile("App.hx"));
	}

	static public function main() {
		var app = new App();
	}
}