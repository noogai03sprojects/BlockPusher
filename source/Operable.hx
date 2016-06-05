package;

/**
 * @author Noogai03
 */
interface Operable 
{
	public var channel:Int;
	public var activated:Bool;
	
	public function activate():Void;
	public function deactivate():Void;
	public function initManager(manager:ChannelManager):Void;
}