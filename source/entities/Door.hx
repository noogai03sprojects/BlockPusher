package entities;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxSound;

/**
 * ...
 * @author ...
 */
class Door extends FlxSprite implements Operable
{
	public var doorID:Int = 0;
	public var targetRoom:Int = 0;
	public var channel:Int = 0;
	public var activated:Bool = false;
	
	var ding:FlxSound;
	
	public function new(X:Float=0, Y:Float=0, id:Int, channel:Int, target:Int) 
	{
		super(X, Y);
		loadGraphic(AssetPaths.lift_door__png, true, 16, 32);
		animation.add("open", [0, 1, 2, 3, 4, 5, 6], 10, false);
		animation.add("close", [6, 5, 4, 3, 2, 1 , 0], 10, false);
		animation.play("close");
		
		//FlxG.watch.add(this, "activated");
		doorID = id;
		this.channel = channel;
		ding = new FlxSound();
		ding.loadEmbedded(AssetPaths.elevator_bell_ring__wav);
		targetRoom = target;
	}
	
	/* INTERFACE Operable */
	
	public function activate():Void 
	{
		if (!activated) {
			activated = true;
			animation.play("open");
			ding.play(true);
		}
	}
	
	public function deactivate():Void 
	{
		if (activated) {
		activated = false;
		animation.play("close");
		}
	}

	public function initManager(manager:ChannelManager):Void 
	{
		
	}
	
}