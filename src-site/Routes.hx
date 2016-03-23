package ;

import api.Files;

using ufront.MVC;

/**
 * ...
 * @author Skial Bainn
 */
class Routes extends Controller {

	@inject public var files:Files;
	
	@:route('/')
	public function index() {
		return files.get( 'templates/index.html', 'text/html' );
	}
	
	@:route('/roundups/*')
	public var roundups:Articles;
	
}