package entities;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.util.FlxSpriteUtil;
import openfl.display.Shape;
//import openfl.display.Graphics;

/**
 * ...
 * @author Noogai03
 */
class LightSensor extends FlxSprite implements Operable
{
	public var lightColour:LightColour;
	public var activated:Bool = false;
	public var channel:Int;
	
	var channelManager:ChannelManager;
	
	public function new(X:Float=0, Y:Float=0, colour:LightColour, signalChannel:Int) 
	{
		super(X, Y);
		//FlxG.log.add(colour);
		loadGraphic(AssetPaths.lightsensor__png, true, 16, 32);
		animation.add("on", [0]);
		animation.add("off", [1]);		
		lightColour = colour;
		animation.play("off");		
		channel = signalChannel;
		FlxSpriteUtil.drawRect(this, 5, 2, 6, 6, ColourOperations.getLightColour(lightColour), null, {hasFill:true, color:ColourOperations.getLightColour(lightColour), alpha:1} );
		FlxSpriteUtil.drawRect(this, 21, 2, 6, 6, ColourOperations.getLightColour(lightColour), null, {hasFill:true, color:ColourOperations.getLightColour(lightColour), alpha:1} );
		//FlxSpriteUtil.fill(this, ColourOperations.getLightColour(lightColour));
	}
	
	override public function update():Void 
	{		
		check();
		super.update();
	}
	
	override public function draw():Void 
	{
		super.draw();
		//check();		
	}	
	
	public function check() : Void {
		
		//var lightHere:Int = ColourOperations.getObjectLightColour(this, 8, 6);
		//var requiredLight:Int = ColourOperations.getLightColour(lightColour);
		//var lightHereStr = ColourOperations.getStringColour(lightHere);
		//var requiredLightStr = ColourOperations.getStringColour(requiredLight);	
		//FlxG.log.add(lightHere);
		////if (ColourOperations.getStringColour(ColourOperations.getObjectLightColour(this, 6, 6)) == ColourOperations.getStringColour(lightColour)) {
		
		var colours = ColourOperations.getObjectColours(this, 6, 6);
		//FlxG.log.add("Colours: " + Std.string(colours));
		
		if (Lambda.has(colours, lightColour)) {
			activate();
		} 
		else {
			deactivate();
		}
	}
	
	/* INTERFACE Operable */
	
	public function activate():Void 
	{
		activated = true;
		animation.play("on");
		channelManager.activateChannel(channel);
		//FlxG.log.add("Activated!");
	}
	
	public function deactivate():Void 
	{
		activated = false;
		animation.play("off");
		channelManager.deactivateChannel(channel);
	}
	
	public function initManager(manager:ChannelManager):Void 
	{
		channelManager = manager;
	}
	
}