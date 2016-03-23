package api;

using ufront.MVC;
using sys.FileSystem;

/**
 * ...
 * @author Skial Bainn
 */
class Files extends UFApi {

	public function get(path:String, ?mime:String):ActionResult {
		return new FilePathResult( path, mime );
	}
	
	public function exists(path:String):Bool {
		return path.exists();
	}
	
}