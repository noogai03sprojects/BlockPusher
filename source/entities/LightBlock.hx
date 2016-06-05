package entities;

import flixel.FlxG;
import flixel.FlxSprite;
import openfl.display.Shape;

/**
 * ...
 * @author Noogai03
 */
class LightBlock extends FlxSprite
{
	public var lightColour:LightColour;
	var lightRadius = 100;
	var drawColour:Int;
	var light:LightRadius;
	//public var lightSprite:FlxSprite;
	public function new(X:Float=0, Y:Float=0, colour:LightColour) 
	{
		super(X, Y);
		loadGraphic(AssetPaths.lightbox__png, false, 14, 14);
		lightColour = colour;
		//lightSprite = new FlxSprite(X, Y);
		acceleration.y = 400;
		drag.x = 4000;
		
		light = new LightRadius(getMidpoint(), 100, lightColour);
		ColourOperations.addLightRadius(light);
		drawColour = ColourOperations.getLightColour(lightColour);			
	}
	
	override public function update():Void 
	{		
		light.updateCentre(getMidpoint());
		super.update();
		
	}
	
	override public function draw():Void 
	{		
		var myShape:Shape = new Shape();
		//var colour = getL
		//myShape.graphics.lineStyle(1, drawColour);
		myShape.graphics.beginFill(drawColour, 0.5);
		//FlxG.camera.
		var screenXY = this.getScreenXY();
		myShape.graphics.drawCircle(screenXY.x + 7, screenXY.y + 7, lightRadius);
		Reg.lightBuffer.draw(myShape);
		
		super.draw();
	}
	
}