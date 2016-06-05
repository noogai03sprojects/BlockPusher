package entities;

import flixel.FlxSprite;
import flixel.input.FlxAccelerometer;
import flixel.util.FlxColor;
import flixel.util.FlxPath;
import flixel.util.FlxPoint;

/**
 * ...
 * @author Noogai03
 */
class MovingPlatform extends FlxSprite implements Operable
{
	public var channel:Int;
	public var activated:Bool = false;
	
	var speed:Float = 0;
	
	var path:FlxPath;
	
	public function new(X:Float=0, Y:Float=0) 
	{
		super(X, Y);	
	}
	
	public function init(data:Xml) :Void{
		//TODO: write this whole function to set up channel, size, path
		channel = Std.parseInt(data.get("signalChannel"));
		
		var w = Std.parseInt(data.get("width"));
		var h = Std.parseInt(data.get("height"));
		//x += w / 2;
		//y += h / 2;
		
		
		makeGraphic(w, h, FlxColor.BROWN);
		immovable = true;
		
		speed = Std.parseFloat(data.get("speed"));
		
		var points:List<FlxPoint> = new List<FlxPoint>();
		points.add(new FlxPoint(x, y));
		for (node in data.elementsNamed("node")) {
			var nx:Float = Std.parseFloat(node.get("x"));
			//nx += w / 2;
			var ny:Float = Std.parseFloat(node.get("y"));
			//ny += h / 2;
			points.add(new FlxPoint(nx, ny));
		}	
		
		var mode:Int = (Std.parseInt(data.get("reverse")) == 1) ? FlxPath.FORWARD : FlxPath.YOYO;
		path = new FlxPath(this, Lambda.array(points), speed, mode);
		path.autoCenter = false;
		path.active = false;
		activated = false;
		//this.
		//this.path = path;
		//path.
	}
	
	/* INTERFACE Operable */
	
	public function activate():Void 
	{
		activated = true;
		path.active = true;
		//path.speed = speed;
	}
	
	public function deactivate():Void 
	{
		activated = false;
		//active = false;
		path.active = false;
		this.velocity.set(0, 0);
		
	}
	
	public function initManager(manager:ChannelManager):Void 
	{
		
	}
	
}