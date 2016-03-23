package npm;

/**
 * @author Skial Bainn
 */
@:native('commonmark')
extern class CommonMark {
	
}

@:native('commonmark.Parser')
extern class Parser {
	
	public function new(?options:{sourcepos:Bool, smart:Bool, safe:Bool});
	public function parse(md:String):Node;
	
}

@:native('commonmark.HtmlRenderer')
extern class HtmlRenderer {
	
	public var softbreak:String;
	public function new(?options:{sourcepos:Bool, smart:Bool, safe:Bool});
	public function render(node:Node):String;
	
}

extern class Node {
	
	public var type(get, never):NodeType;
	public var firstChild(get, never):Null<Node>;
	public var lastChild(get, never):Null<Node>;
	public var next(get, never):Null<Node>;
	public var prev(get, never):Null<Node>;
	public var parent(get, never):Null<Node>;
	public var sourcePos(get, never):Array<Array<Int>>;
	public var isContainer(get, never):Bool;
	public var literal:Null<String>;
	public var destination:Null<String>;
	public var title:Null<String>;
	public var info:Null<String>;
	public var level:Int;
	public var listType:ListType;
	public var listTight:Bool;
	public var listStart:Int;
	public var listDelimiter:DilimiterType;
	//onEnter, onExit: Strings, used only for CustomBlock or CustomInline.
	
	public function appendChild(node:Node):Void;
	public function prependChild(node:Node):Void;
	public function unlink():Void;
	public function insertAfter(sibling:Node):Void;
	public function insertBefore(sibling:Node):Void;
	public function walker():NodeWalker;
	
}

extern class NodeWalker {
	
	public function next():Null<{entering:Bool}>;
	public function resumeAt(node:Node, entering:Dynamic):Void;
	
}

@:enum abstract NodeType(String) from String to String {
	public var Text = 'Text';
	public var Softbreak = 'Softbreak';
	public var Hardbreak = 'Hardbreak';
	public var Emph = 'Emph';
	public var Strong = 'Strong';
	public var Html = 'Html';
	public var Link = 'Link';
	public var Image = 'Image';
	public var Code = 'Code';
	public var Document = 'Document';
	public var Paragraph = 'Paragraph';
	public var BlockQuote = 'BlockQuote';
	public var Item = 'Item';
	public var List = 'List';
	public var Heading = 'Heading';
	public var CodeBlock = 'CodeBlock';
	public var HtmlBlock = 'HtmlBlock ';
	public var ThematicBreak = 'ThematicBreak ';
}

@:enum abstract ListType(String) from String to String {
	public var Bullet = 'Bullet';
	public var Ordered = 'Ordered';
}

@:enum abstract DilimiterType(String) from String to String {
	public var Brace = ')';
	public var Dot = '.';
}