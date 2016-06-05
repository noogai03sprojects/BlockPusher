package entities;

import entities.Door;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.group.FlxTypedGroup;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class Player extends FlxSprite
{
	var moveSpeed = 100;
	
	public var pickupSprite:FlxSprite;
	var blocks:FlxGroup;
	
	var carrying:Bool;
	
	var carriedBlock:FlxSprite = null;
	var doors:FlxTypedGroup<Door>;
	var interactables:FlxGroup;
	
	public var noclip:Bool = false;

	public function new(X:Float=0, Y:Float=0, blocks:FlxGroup, doors:FlxTypedGroup<entities.Door>, interactables:FlxGroup) 
	{
		super(X, Y);
		//makeGraphic(14, 28, FlxColor.BLUE);
		loadGraphic(AssetPaths.player__png, true, 16, 32);
		animation.add("walk", [0, 1, 2, 3, 4, 5, 6], 10, true);
		animation.add("carry", [7, 8, 9, 10, 11, 12, 13], 10, true);
		setFacingFlip(FlxObject.LEFT, true, false);
		setFacingFlip(FlxObject.RIGHT, false, false);
		
		width = 12;
		offset.x = 2;
		height = 30;
		offset.y = 2;
		
		maxVelocity.y = 400;
		drag.x = 1600;
		acceleration.y = 800;
		
		pickupSprite = new FlxSprite(X + 12, Y);
		pickupSprite.makeGraphic(10, 32, FlxColor.TRANSPARENT);
		//pickupSprite.
		this.blocks = blocks;
		this.doors = doors;
		this.interactables = interactables;
		FlxG.watch.add(this.interactables, "length");
	}
	
	function movement() :Void {
		var left:Bool = FlxG.keys.anyPressed(["LEFT", "A"]);
		var right:Bool = FlxG.keys.anyPressed(["RIGHT", "D"]);
		var down:Bool = FlxG.keys.anyPressed(["DOWN", "S"]);
		var jump:Bool = FlxG.keys.anyPressed(["UP", "SPACE", "Z"]);
		var interactPressed:Bool = FlxG.keys.anyJustPressed(["E", "X"]);
		
		if (FlxG.keys.anyJustPressed(["P"]))
			toggleNoclip();
		
		if (!left && !right) {
			if (carrying)
				animation.frameIndex = 7;
			else
				animation.frameIndex = 0;
			animation.pause();
		}
		
		if (left) {
			if (right) {
				velocity.x = 0;
				if (carrying)
					animation.frameIndex = 7;
				else
					animation.frameIndex = 0;
				animation.pause();
			}
			else {
				//if (touching & FlxObject.LEFT == 0) {
					velocity.x = -moveSpeed;
					facing = FlxObject.LEFT;
					if (carrying)
						animation.play("carry");
					else
						animation.play("walk");
				//}
			}
		}
		else if (right) {
			//if (touching & FlxObject.RIGHT == 0) {
			velocity.x = moveSpeed;
			facing = FlxObject.RIGHT;
			if (carrying) 
				animation.play("carry");
			else
				animation.play("walk");
			//}
		}
		if (jump && !noclip) {
			acceleration.y = 300;
			if (touching & FlxObject.FLOOR == FlxObject.FLOOR)			
				velocity.y = -200;
		} 
		else if (jump && noclip) {
			velocity.y = -moveSpeed;
		}
		if (down && noclip) {
			velocity.y = moveSpeed;
		}
		if (!down && !jump && noclip) {
			velocity.y = 0;
		}
		
		var pickupX:Float = (facing == FlxObject.RIGHT) ? x + 12: x - pickupSprite.width;
		pickupSprite.x = pickupX;
		pickupSprite.y = y;
		if (interactPressed) {
			interact();
		}
		
	}
	
	function interact() 
	{
		FlxG.overlap(this, doors, interactDoor);
		FlxG.overlap(this, interactables, interactInteractable);
		//FlxG.overlap(interactables, this, interactInteractable);
		
		if (!carrying)
			FlxG.overlap(pickupSprite, blocks, pickupBlock);
		else {
			
			carrying = false;
			
			carriedBlock.velocity.set(0, 0);
			var dropX:Float = (facing == FlxObject.RIGHT) ? x + 13: x - carriedBlock.width - 1;
			carriedBlock.x = dropX;
			
			carriedBlock = null;
			animation.play("walk");
			animation.pause();
		}
		
	}
	
	function interactDoor(player:FlxSprite, door:entities.Door) 
	{
		if (door.activated) {
			LevelHandler.currentLevel = door.targetRoom;
			FlxG.log.add(LevelHandler.currentLevel);
			//FlxG.re
			FlxG.resetState();
		}
	}
	
	function interactInteractable(player:FlxSprite, interactable:FlxSprite) {
		FlxG.log.add("\nInteract callback");
		cast(interactable, Interactable).interact();
	}
	
	function pickupBlock(pickup:FlxSprite, block:FlxSprite) 
	{
		if (!carrying) {
			carrying = true;
			carriedBlock = block;			
		}
	}
	
	
	override public function update():Void 
	{
		if (!noclip)
			acceleration.y = 800;
		movement();
		if (carrying) {
			carriedBlock.x = x;
			carriedBlock.y = y - carriedBlock.height - 2;
			carriedBlock.velocity.set(0, 0);
		}
		super.update();
	} 
	
	override public function destroy():Void 
	{
		pickupSprite.destroy();
		pickupSprite = null;
		blocks.destroy();
		blocks = null;
		super.destroy();
	}
	
	public function toggleNoclip() {
		noclip = !noclip;
		if (noclip) {
			acceleration.y = 0;
			solid = false;
		}
		else {
			acceleration.y = 800;
			solid = true;
		}
	}
	
}