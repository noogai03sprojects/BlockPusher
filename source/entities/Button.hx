package entities;

import flixel.FlxG;
import flixel.FlxSprite;

/**
 * ...
 * @author ...
 */
class Button extends FlxSprite implements Operable
{
	public var channel:Int = 0;
	
	public var activated:Bool = false;
	
	var pressTimer:Float = 0;
	
	var channelManager:ChannelManager;
	var switchDelay:Float = 0.4;
	
	public function new(X:Float=0, Y:Float=0, channel:Int) 
	{
		super(X, Y);
		loadGraphic(AssetPaths.button__png, true, 16, 16);
		
		animation.add("main", [0, 1], 10);
		animation.play("main");
		animation.pause();
		
		this.channel = channel;
		
		height = 7;
		offset.y = 9;
		
		//FlxG.watch.add(this, "activated");
	}
	
	override public function update():Void 
	{	
		if (activated) {
			pressTimer -= FlxG.elapsed;
		
			if (pressTimer <= 0) {
				deactivate();
			//pressTimer = 0;
			}
		}
		super.update();		
	}
	
	public function activate():Void {
		activated = true;
		animation.frameIndex = 1;		
		pressTimer = switchDelay;
		channelManager.activateChannel(channel);
	}	
	
	public function deactivate():Void 
	{
		activated = false;
		animation.frameIndex = 0;
		channelManager.deactivateChannel(channel);
	}
	
	public function initManager(manager:ChannelManager):Void 
	{
		channelManager = manager;
	}
	
}