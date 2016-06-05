package entities;

import flixel.FlxBasic;

/**
 * ...
 * @author Noogai03
 */
class AlwaysOn extends FlxBasic implements Operable
{
	public var channel:Int;
	var channelManager:ChannelManager;
	
	public var activated:Bool;
	
	public function new(channel:Int) 
	{
		this.channel = channel;
		super();		
	}
	
	override public function update():Void 
	{
		channelManager.activateChannel(channel);
		super.update();
	}
	
	/* INTERFACE Operable */
	
	public function activate():Void 
	{
		
	}
	
	public function deactivate():Void 
	{
		
	}
	
	public function initManager(manager:ChannelManager):Void 
	{
		channelManager = manager;
	}
	
}