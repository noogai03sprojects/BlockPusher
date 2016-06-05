package entities;

import flixel.FlxSprite;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

/**
 * ...
 * @author Noogai03
 */
class ToggleBlock extends FlxSprite implements Operable
{
	public var activated:Bool = false;
	public var channel:Int;

	public function new(X:Float=0, Y:Float=0, channel:Int) 
	{
		super(X, Y);
		
		loadGraphic(AssetPaths.toggleBlock__png, true, 16, 16);
		animation.frameIndex = 0;		
		deactivate();
		this.channel = channel;
		immovable = true;
	}
	
	/* INTERFACE Operable */
	
	public function activate():Void 
	{
		if (!activated) {
		activated = true;
		solid = true;
		animation.frameIndex = 0;
		//FlxTween.multiVar(scale, { x: 50, y: 50 }, 3, { ease:FlxEase.elasticOut, type: FlxTween.ONESHOT } ); 
		scale.set(0, 0);
		FlxTween.tween(scale, { x:1, y:1 }, 0.5, { ease:FlxEase.elasticOut, type:FlxTween.ONESHOT } );
		}
	}
	
	public function deactivate():Void 
	{
		activated = false;
		animation.frameIndex = 1;
		solid = false;
		//FlxTween.tween(this, { scale.x:0, scale.y:0}, 0.2, { ease:FlxEase.elasticOut, type:FlxTween.ONESHOT } );
	}
	
	public function initManager(manager:ChannelManager):Void 
	{
		
	}
	
}