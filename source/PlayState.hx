package;

import entities.AlwaysOn;
import entities.Button;
import entities.Door;
import entities.gates.ANDGate;
import entities.gates.NOTGate;
import entities.gates.ORGate;
import entities.LightBlock;
import entities.LightSensor;
import entities.MovingPlatform;
import entities.Player;
import entities.Switch;
import entities.ToggleBlock;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.group.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxMath;
import openfl.display.BitmapData;
import openfl.display.BlendMode;
import openfl.geom.ColorTransform;
import openfl.geom.Point;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	//level loader
	var map:FlxOgmoLoader;
	
	//collision layer
	var layer1:FlxTilemap;
	//background
	var layer0:FlxTilemap;
	//foreground
	var layer2:FlxTilemap;
	
	//player
	var player:entities.Player;
	
	//crates
	var blocks:FlxGroup;
	
	//buttons
	var buttons:FlxTypedGroup<entities.Button>;
	var doors:FlxTypedGroup<entities.Door>;
	
	var platforms:FlxGroup;
	//var sensors:FlxGroup;
	
	var miscObjects:FlxGroup;
	
	
	var channelManager:ChannelManager;
	var miscSolidObjects:FlxGroup;
	
	/*
	 * DETECTION GROUPS
	 * Not intended for rendering or collisions - things like "weights", "interactables"
	 */
	var interactables:FlxGroup;
	
	//objects that trigger buttons
	var weights:FlxGroup;
	
	//var operables:List<Operable>;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		bgColor = 0xffa6d9e3;
		
		Reg.lightBuffer = new BitmapData(320, 240);
		
		ColourOperations.reset();
		
		//Reg.lightBuffer = new FlxSprite(0, 0);
		//Reg.lightBuffer.makeGraphic(320, 240, FlxColor.TRANSPARENT);
		//Reg.lightBuffer.scrollFactor.set(0, 0);		
		
		map = new FlxOgmoLoader(LevelHandler.getCurrentLevel());
		layer1 = map.loadTilemap(AssetPaths.FEZ_terrain__png, 16, 16, "layer1");
		
		layer1.setTileProperties(1, FlxObject.ANY);
		layer1.setTileProperties(2, FlxObject.ANY);
		
		layer0 = map.loadTilemap(AssetPaths.FEZ_terrain__png, 16, 16, "layer0");
		layer2 = map.loadTilemap(AssetPaths.FEZ_terrain__png, 16, 16, "layer2");
		
		blocks = new FlxGroup();
		buttons = new FlxTypedGroup<Button>();
		doors = new FlxTypedGroup<Door>();
		
		interactables = new FlxGroup();
		
		player = new Player(20, 20, blocks, doors, interactables);
		
		weights = new FlxGroup();
		weights.add(player);
		
		platforms = new FlxGroup();
		//sensors = new FlxGroup();
		miscObjects = new FlxGroup();
		miscSolidObjects = new FlxGroup();
		
		
		
		//operables = new List<Operable>();
		channelManager = new ChannelManager();
		
		map.loadEntities(placeEntites, "entities");
		
		FlxG.camera.follow(player, FlxCamera.STYLE_PLATFORMER);
		
		
		//bg
		add(layer0);
		
		//objects go between bg tiles and foreground
		//solid tiles
		add(layer1);
		
		add(doors);
		add(buttons);
		add(platforms);
		add(miscObjects);
		//add(interactables);
		add(player);
		add(blocks);
		add(player.pickupSprite);
		//add(sensors);
		
		add(miscSolidObjects);
		//foreground
		add(layer2);	
		//Reg.lightBuffer.alpha = 0.5;
		
		//Reg.lightBuffer.
		//add(Reg.lightBuffer);
		
		//FlxG.watch.add(blocks, "countLiving");
		
		super.create();
		FlxG.console.addCommand(["nextLevel", "next"], LevelHandler.nextLevel);
		FlxG.console.addCommand(["noclip"], player.toggleNoclip);
		
		//var level = new LevelHandler();
	}
	
	function placeEntites(entityName:String, entityData:Xml) :Void 
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		switch(entityName) {
		case "player":
			player.x = x;
			player.y = y;
		
		case "block":
			var block:FlxSprite = null;
			switch(Std.parseInt(entityData.get("size"))) {
				case 0:
					block = new FlxSprite(x, y, AssetPaths.crate__png);
				case 1:
					block = new FlxSprite(x, y, AssetPaths.box__png);
			}
			block.acceleration.y = 400;
			block.drag.x = 4000;
			blocks.add(block);
			weights.add(block);
		
		case "button":					
			var channel = Std.parseInt(entityData.get("signalChannel"));
			var button:entities.Button = new entities.Button(x, y + 9, channel);
			buttons.add(button);
			channelManager.registerGenerator(button);
			//buttons.add(new Button(
		
		case "door":
			var channel = Std.parseInt(entityData.get("signalChannel"));
			var id = Std.parseInt(entityData.get("doorID"));
			var target = Std.parseInt(entityData.get("targetRoomID"));
			var door:entities.Door = new entities.Door(x, y-16, id, channel, target);
			channelManager.registerOperable(door);
			doors.add(door);
		
		case "movingPlatform":			
			var platform = new entities.MovingPlatform(x, y);
			platform.init(entityData);
			channelManager.registerOperable(platform);
			platforms.add(platform);	
			
		case "lightBox":
			var type:LightColour = Type.createEnum(LightColour, entityData.get("lightColour"));
			var lightbox:entities.LightBlock = new entities.LightBlock(x, y, type);			
			blocks.add(lightbox);
			weights.add(lightbox);
		case "lightSensor":
			var type:LightColour = Type.createEnum(LightColour, entityData.get("lightColour"));
			var channel = Std.parseInt(entityData.get("signalChannel"));
			var sensor = new entities.LightSensor(x, y-16, type, channel);
			channelManager.registerGenerator(sensor);
			miscObjects.add(sensor);
			
		case "toggleBlock":
			var block:entities.ToggleBlock = new entities.ToggleBlock(x, y, Std.parseInt(entityData.get("signalChannel")));
			channelManager.registerOperable(block);
			miscSolidObjects.add(block);
			
		case "switch":
			var lever:entities.Switch = new entities.Switch(x, y, Std.parseInt(entityData.get("signalChannel")));
			channelManager.registerGenerator(lever);
			miscObjects.add(lever);
			interactables.add(lever);
			//player.int
			
		case "NOT":
			var not:NOTGate = new NOTGate([Std.parseInt(entityData.get("input"))], Std.parseInt(entityData.get("output")));
			channelManager.addGate(not);
		case "OR":
			var or:ORGate = new ORGate([Std.parseInt(entityData.get("input1")), Std.parseInt(entityData.get("input2"))], Std.parseInt(entityData.get("output")));
			channelManager.addGate(or);
		case "AND":
			var and:ANDGate = new ANDGate([Std.parseInt(entityData.get("input1")), Std.parseInt(entityData.get("input2"))], Std.parseInt(entityData.get("output")));
			channelManager.addGate(and);
			
		case "alwaysOn":
			var on:AlwaysOn = new AlwaysOn(Std.parseInt(entityData.get("signalChannel")));
			channelManager.registerGenerator(on);
			add(on);
		}
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		//Reg.lightBuffer.framePixels.fillRect(Reg.lightBuffer.framePixels.rect, 0);
		//Reg.lightBuffer.alpha = 0.5;
		//Reg.lightBuffer.dirty = true;
		
		
		FlxG.collide(player, layer1);
		FlxG.collide(blocks, layer1);		
		
		FlxG.collide(blocks, platforms);
		FlxG.collide(player, platforms);
		FlxG.collide(blocks, player);
		FlxG.collide(blocks, blocks);
		FlxG.collide(weights, miscSolidObjects);
		
		FlxG.overlap(buttons, weights, onButtonPressed);
		
		channelManager.checkGates();
		super.update();	
	}	
	
	function onButtonPressed(B:Button, W:FlxSprite) 
	{
		B.activate();
	}
	
	override public function draw():Void 
	{		
		Reg.lightBuffer.fillRect(Reg.lightBuffer.rect, 0);
		super.draw();	
		
		FlxG.camera.buffer.copyPixels(Reg.lightBuffer, Reg.lightBuffer.rect, new Point(0, 0), null, null, true);
		
	}
}