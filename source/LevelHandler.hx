package;
import flixel.FlxG;
import haxe.Resource;
import lime.Assets;
import openfl.Lib;

/**
 * ...
 * @author Noogai03
 */
class LevelHandler
{
	public static var currentLevel:Int;
	static var levels:Array<String>;
	
	public function new() 
	{
		
	}	
	
	public static function loadLevels() {
		var data:String = Assets.getText("assets/data/levelsByID.txt");
		levels = new Array<String>();
		var lines:Array<String> = data.split("\n");		
		var line:String;
		while (lines.length > 0) {
			line = lines.shift();
			line = StringTools.replace(line, "\r", "");
			if (line.length != 0)
				levels.push(line);
		}
		currentLevel = 0;
	}
	
	public static function nextLevel() : Void {
		if (currentLevel < levels.length - 1) {
			currentLevel++;
		}
		FlxG.resetState();
	}
	
	public static function getLevelByID(id:Int) : String {
		return levels[id];
	}
	
	public static function getCurrentLevel() : String {
		return levels[currentLevel];
	}
	
}