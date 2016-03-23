package;
import api.Files;

using ufront.MVC;
using StringTools;

/**
 * ...
 * @author Skial Bainn
 */
class Articles extends Controller {
	
	@inject public var files:Files;

	@:route('/$name')
	public function render(name:String) {
		// Why doesnt `@:route` support `$name.html`, `$name.json`?
		return switch (name) {
			case _.endsWith('.html') => true:
				renderHtml( name );
				
			case _.endsWith('.json') => true:
				renderJson( name );
				
			case _.endsWith('.md') => true:
				fetchUnrendered( name );
				
			case _:
				renderHtml( name );
				
		}
	}
	
	@:route('/$name/index.html')
	public function renderHtmlIndex(name:String) {
		return renderHtml( name );
	}
	
	// `$baseUri/$name/index.html`
	public function renderHtml(name:String) {
		var path = this.baseUri.substr( 2 ) + name.substr( 0, -5 ) + '/index.html';
		return files.exists( path ) ? files.get( path, 'text/html' ) : new JsonResult( { name:'${this.baseUri}${name}.html' } );
	}
	
	// `$baseUri/$name.json`
	public function renderJson(name:String) {
		return new JsonResult( { name:'${this.baseUri}${name}.json' } );
	}
	
	// `$baseUri/$name.md`
	public function fetchUnrendered(name:String) {
		return files.get( this.baseUri.substr( 2 ) + name, 'text/plain' );
	}
	
}