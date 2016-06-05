package;
import entities.LightRadius;
import flixel.FlxObject;
import flixel.util.FlxPoint;

/**
 * ...
 * @author Noogai03
 */
class ColourOperations
{
	public static var lightSources:List<LightRadius>;
	
	public function new() 
	{
		
	}
	
	public static function reset() {
		lightSources = new List<LightRadius>();
	}
	
	public static function addLightRadius(radius:LightRadius) {
		lightSources.add(radius);
	}
	
	public static function getColours(point:FlxPoint) : Array<LightColour> {
		var colours:Array<LightColour> = new Array<LightColour>();
		
		for (source in lightSources) {
			if (source.pointInRange(point)) {
				colours.push(source.colour);
			}
		}
		return colours;
	}
	
	public static function getObjectColours(object:FlxObject, x:Float, y:Float) : Array<LightColour> {
		return getColours(new FlxPoint(object.x + x, object.y + y));
	}
	
	//public static function getScreenLightColour(x:Int, y:Int) : Int {
		//return Reg.lightBuffer.getPixel(x, y);
	//}
	
	//public static function getObjectLightColour(object:FlxObject, x:Float, y:Float ) : Int {
		//var point = object.getScreenXY();		
		//return Reg.lightBuffer.getPixel(Std.int(point.x + x), Std.int(point.y + y));
	//}
	
	public static function getLightColour(lightColor:LightColour) :Int{
		switch(lightColor) {
			case LightColour.Red:
				return 0xffff0000;
			case LightColour.Blue:
				return 0xff0000ff;
			case LightColour.Green:
				return 0xff00ff00;
			case LightColour.Yellow:
				return 0xffffff00;
			case LightColour.Purple:
				return 0xff5400AA;
			default:
				return 0xffffffff;
		}
	}
	
	public static function getStringColour(color:Int):String {
		var fill:Int = color;
		if (fill < 0) {
			fill = (16777216 + fill);
		}
		var fillStr = StringTools.hex(fill, 6);		
		fillStr = "#" + fillStr;
		return fillStr;
	}
	
	//public static function getWorldLightColour(x:Float, y:Float):Int {
		//
	//}
	
}