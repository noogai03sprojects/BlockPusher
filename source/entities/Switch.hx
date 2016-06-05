package entities;

import flixel.FlxG;
import flixel.FlxSprite;

/**
 * ...
 * @author Noogai03
 */
class Switch extends FlxSprite implements Operable implements Interactable
{
	public var channel:Int;
	public var activated:Bool;
	
	var channelManager:ChannelManager;
	
	var flipFlag:Bool = false;

	public function new(X:Float=0, Y:Float=0, channel:Int) 
	{
		super(X, Y);
		loadGraphic(AssetPaths.lever__png, true, 16, 16);
		animation.add("on", [0, 1, 2, 3], 10, false);
		animation.add("off", [3, 2, 1, 0], 10, false);
		animation.play("off");
		activated = false;
		this.channel = channel;		
	}
	
	/* INTERFACE Operable */
	
	public function activate():Void 
	{
		FlxG.log.add("activated");
		activated = true;
		channelManager.activateChannel(channel);
		animation.play("on");
	}
	
	public function deactivate():Void 
	{
		FlxG.log.add("deactivated");
		channelManager.deactivateChannel(channel);
		activated = false;
		animation.play("off");
	}
	
	public function initManager(manager:ChannelManager):Void 
	{
		this.channelManager = manager;
	}
	
	override public function update():Void 
	{
		super.update();
	}
	
	/* INTERFACE Interactable */
	
	public function interact():Void 
	{
		FlxG.log.add("Switch triggered!");
		//if (activated) {
			//if (flipFlag) {
				//deactivate();
				//flipFlag = false;
				//return;
			//}
			//else
				//flipFlag = true;
		//}
		//else {
			//if (flipFlag) {
				//activate();
				//flipFlag = false;
				//return;
			//}
			//else
				//flipFlag = true;
		//}
		if (activated) {
			deactivate();
		}
		else {
			activate();
		}
		
	}
	
}