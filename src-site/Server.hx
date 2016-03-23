package;

import Routes;

using ufront.MVC;

/**
 * ...
 * @author Skial Bainn
 */
class Server {
	
	public static function main() {
		var app:UfrontApplication = new UfrontApplication({
			indexController: Routes, /*urlRewrite: false,*/ // Fails with `Target not implemented, always pass a value for frontScript`.
			viewEngine: FileViewEngine, viewPath: 'templates/', 
		});
		
		// default port is `2987`
		app.listen();
	}

	public function new() {
		
	}
	
}