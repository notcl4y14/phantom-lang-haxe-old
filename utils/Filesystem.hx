package utils;

class Filesystem {
	public static function readFile (name: String): Null<String> {
		if (!sys.FileSystem.exists(name)) return (null);

		var content: String = sys.io.File.getContent(name);
		return (content);
	}
}