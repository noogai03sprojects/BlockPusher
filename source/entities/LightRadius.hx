package entities;
import flixel.input.FlxAccelerometer;
import flixel.util.FlxPoint;

/**
 * ...
 * @author Noogai03
 */
class LightRadius
{
	public var centre:FlxPoint;
	public var radius:Float;
	public var colour:LightColour;
	
	public function new(centre:FlxPoint, radius:Float, colour:LightColour) 
	{
		//var p:FlxPoint = new FlxPoint(10, 10);
		//p.di
		this.centre = centre;
		this.radius = radius;
		this.colour = colour;
	}
	
	public function pointInRange(point:FlxPoint) : Bool {
		return centre.distanceTo(point) <= radius;		
	}
	
	public function updateCentre(newCentre:FlxPoint) {
		centre = newCentre;
	}
}