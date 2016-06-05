package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.net.HTTPRequest;
import lime.system.CFFI;
import lime.text.Font;
import lime.utils.Bytes;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_arial_ttf);
		
		#end
		
		#if flash
		
		className.set ("assets/data/levels/level1.oel", __ASSET__assets_data_levels_level1_oel);
		type.set ("assets/data/levels/level1.oel", AssetType.TEXT);
		className.set ("assets/data/levels/level2.oel", __ASSET__assets_data_levels_level2_oel);
		type.set ("assets/data/levels/level2.oel", AssetType.TEXT);
		className.set ("assets/data/levels/level2_5.oel", __ASSET__assets_data_levels_level2_5_oel);
		type.set ("assets/data/levels/level2_5.oel", AssetType.TEXT);
		className.set ("assets/data/levels/level3.oel", __ASSET__assets_data_levels_level3_oel);
		type.set ("assets/data/levels/level3.oel", AssetType.TEXT);
		className.set ("assets/data/levels/level4.oel", __ASSET__assets_data_levels_level4_oel);
		type.set ("assets/data/levels/level4.oel", AssetType.TEXT);
		className.set ("assets/data/levels/testbed.oel", __ASSET__assets_data_levels_testbed_oel);
		type.set ("assets/data/levels/testbed.oel", AssetType.TEXT);
		className.set ("assets/data/levelsByID.txt", __ASSET__assets_data_levelsbyid_txt);
		type.set ("assets/data/levelsByID.txt", AssetType.TEXT);
		className.set ("assets/data/New Project.oep", __ASSET__assets_data_new_project_oep);
		type.set ("assets/data/New Project.oep", AssetType.TEXT);
		className.set ("assets/images/box.ase", __ASSET__assets_images_box_ase);
		type.set ("assets/images/box.ase", AssetType.BINARY);
		className.set ("assets/images/box.png", __ASSET__assets_images_box_png);
		type.set ("assets/images/box.png", AssetType.IMAGE);
		className.set ("assets/images/button.png", __ASSET__assets_images_button_png);
		type.set ("assets/images/button.png", AssetType.IMAGE);
		className.set ("assets/images/cloud.ase", __ASSET__assets_images_cloud_ase);
		type.set ("assets/images/cloud.ase", AssetType.BINARY);
		className.set ("assets/images/cloud.png", __ASSET__assets_images_cloud_png);
		type.set ("assets/images/cloud.png", AssetType.IMAGE);
		className.set ("assets/images/crate.ase", __ASSET__assets_images_crate_ase);
		type.set ("assets/images/crate.ase", AssetType.BINARY);
		className.set ("assets/images/crate.png", __ASSET__assets_images_crate_png);
		type.set ("assets/images/crate.png", AssetType.IMAGE);
		className.set ("assets/images/door.ase", __ASSET__assets_images_door_ase);
		type.set ("assets/images/door.ase", AssetType.BINARY);
		className.set ("assets/images/door.png", __ASSET__assets_images_door_png);
		type.set ("assets/images/door.png", AssetType.IMAGE);
		className.set ("assets/images/FEZ_terrain.png", __ASSET__assets_images_fez_terrain_png);
		type.set ("assets/images/FEZ_terrain.png", AssetType.IMAGE);
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		className.set ("assets/images/lever.ase", __ASSET__assets_images_lever_ase);
		type.set ("assets/images/lever.ase", AssetType.BINARY);
		className.set ("assets/images/lever.png", __ASSET__assets_images_lever_png);
		type.set ("assets/images/lever.png", AssetType.IMAGE);
		className.set ("assets/images/lift-door.ase", __ASSET__assets_images_lift_door_ase);
		type.set ("assets/images/lift-door.ase", AssetType.BINARY);
		className.set ("assets/images/lift-door.png", __ASSET__assets_images_lift_door_png);
		type.set ("assets/images/lift-door.png", AssetType.IMAGE);
		className.set ("assets/images/lightbox.ase", __ASSET__assets_images_lightbox_ase);
		type.set ("assets/images/lightbox.ase", AssetType.BINARY);
		className.set ("assets/images/lightbox.png", __ASSET__assets_images_lightbox_png);
		type.set ("assets/images/lightbox.png", AssetType.IMAGE);
		className.set ("assets/images/lightsensor.ase", __ASSET__assets_images_lightsensor_ase);
		type.set ("assets/images/lightsensor.ase", AssetType.BINARY);
		className.set ("assets/images/lightsensor.png", __ASSET__assets_images_lightsensor_png);
		type.set ("assets/images/lightsensor.png", AssetType.IMAGE);
		className.set ("assets/images/palettes.ase", __ASSET__assets_images_palettes_ase);
		type.set ("assets/images/palettes.ase", AssetType.BINARY);
		className.set ("assets/images/player.ase", __ASSET__assets_images_player_ase);
		type.set ("assets/images/player.ase", AssetType.BINARY);
		className.set ("assets/images/player.png", __ASSET__assets_images_player_png);
		type.set ("assets/images/player.png", AssetType.IMAGE);
		className.set ("assets/images/player_carry.ase", __ASSET__assets_images_player_carry_ase);
		type.set ("assets/images/player_carry.ase", AssetType.BINARY);
		className.set ("assets/images/player_carry.png", __ASSET__assets_images_player_carry_png);
		type.set ("assets/images/player_carry.png", AssetType.IMAGE);
		className.set ("assets/images/player_walk.ase", __ASSET__assets_images_player_walk_ase);
		type.set ("assets/images/player_walk.ase", AssetType.BINARY);
		className.set ("assets/images/player_walk.png", __ASSET__assets_images_player_walk_png);
		type.set ("assets/images/player_walk.png", AssetType.IMAGE);
		className.set ("assets/images/toggleBlock.ase", __ASSET__assets_images_toggleblock_ase);
		type.set ("assets/images/toggleBlock.ase", AssetType.BINARY);
		className.set ("assets/images/toggleBlock.png", __ASSET__assets_images_toggleblock_png);
		type.set ("assets/images/toggleBlock.png", AssetType.IMAGE);
		className.set ("assets/images/U0f6F.png", __ASSET__assets_images_u0f6f_png);
		type.set ("assets/images/U0f6F.png", AssetType.IMAGE);
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/elevator_bell_ring.wav", __ASSET__assets_sounds_elevator_bell_ring_wav);
		type.set ("assets/sounds/elevator_bell_ring.wav", AssetType.SOUND);
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		className.set ("assets/fonts/nokiafc22.ttf", __ASSET__assets_fonts_nokiafc22_ttf);
		type.set ("assets/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("assets/fonts/arial.ttf", __ASSET__assets_fonts_arial_ttf);
		type.set ("assets/fonts/arial.ttf", AssetType.FONT);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/levels/level1.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/levels/level2.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/levels/level2_5.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/levels/level3.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/levels/level4.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/levels/testbed.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/levelsByID.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/New Project.oep";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/box.ase";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/box.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/cloud.ase";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/cloud.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/crate.ase";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/crate.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/door.ase";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/door.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/FEZ_terrain.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/images-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/lever.ase";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/lever.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/lift-door.ase";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/lift-door.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/lightbox.ase";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/lightbox.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/lightsensor.ase";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/lightsensor.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/palettes.ase";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/player.ase";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/player.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/player_carry.ase";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/player_carry.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/player_walk.ase";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/player_walk.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/toggleBlock.ase";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/toggleBlock.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/U0f6F.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/music/music-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/elevator_bell_ring.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/sounds-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/beep.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/flixel.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/fonts/nokiafc22.ttf";
		className.set (id, __ASSET__assets_fonts_nokiafc22_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/fonts/arial.ttf";
		className.set (id, __ASSET__assets_fonts_arial_ttf);
		
		type.set (id, AssetType.FONT);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/data/levels/level1.oel", __ASSET__assets_data_levels_level1_oel);
		type.set ("assets/data/levels/level1.oel", AssetType.TEXT);
		
		className.set ("assets/data/levels/level2.oel", __ASSET__assets_data_levels_level2_oel);
		type.set ("assets/data/levels/level2.oel", AssetType.TEXT);
		
		className.set ("assets/data/levels/level2_5.oel", __ASSET__assets_data_levels_level2_5_oel);
		type.set ("assets/data/levels/level2_5.oel", AssetType.TEXT);
		
		className.set ("assets/data/levels/level3.oel", __ASSET__assets_data_levels_level3_oel);
		type.set ("assets/data/levels/level3.oel", AssetType.TEXT);
		
		className.set ("assets/data/levels/level4.oel", __ASSET__assets_data_levels_level4_oel);
		type.set ("assets/data/levels/level4.oel", AssetType.TEXT);
		
		className.set ("assets/data/levels/testbed.oel", __ASSET__assets_data_levels_testbed_oel);
		type.set ("assets/data/levels/testbed.oel", AssetType.TEXT);
		
		className.set ("assets/data/levelsByID.txt", __ASSET__assets_data_levelsbyid_txt);
		type.set ("assets/data/levelsByID.txt", AssetType.TEXT);
		
		className.set ("assets/data/New Project.oep", __ASSET__assets_data_new_project_oep);
		type.set ("assets/data/New Project.oep", AssetType.TEXT);
		
		className.set ("assets/images/box.ase", __ASSET__assets_images_box_ase);
		type.set ("assets/images/box.ase", AssetType.BINARY);
		
		className.set ("assets/images/box.png", __ASSET__assets_images_box_png);
		type.set ("assets/images/box.png", AssetType.IMAGE);
		
		className.set ("assets/images/button.png", __ASSET__assets_images_button_png);
		type.set ("assets/images/button.png", AssetType.IMAGE);
		
		className.set ("assets/images/cloud.ase", __ASSET__assets_images_cloud_ase);
		type.set ("assets/images/cloud.ase", AssetType.BINARY);
		
		className.set ("assets/images/cloud.png", __ASSET__assets_images_cloud_png);
		type.set ("assets/images/cloud.png", AssetType.IMAGE);
		
		className.set ("assets/images/crate.ase", __ASSET__assets_images_crate_ase);
		type.set ("assets/images/crate.ase", AssetType.BINARY);
		
		className.set ("assets/images/crate.png", __ASSET__assets_images_crate_png);
		type.set ("assets/images/crate.png", AssetType.IMAGE);
		
		className.set ("assets/images/door.ase", __ASSET__assets_images_door_ase);
		type.set ("assets/images/door.ase", AssetType.BINARY);
		
		className.set ("assets/images/door.png", __ASSET__assets_images_door_png);
		type.set ("assets/images/door.png", AssetType.IMAGE);
		
		className.set ("assets/images/FEZ_terrain.png", __ASSET__assets_images_fez_terrain_png);
		type.set ("assets/images/FEZ_terrain.png", AssetType.IMAGE);
		
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/images/lever.ase", __ASSET__assets_images_lever_ase);
		type.set ("assets/images/lever.ase", AssetType.BINARY);
		
		className.set ("assets/images/lever.png", __ASSET__assets_images_lever_png);
		type.set ("assets/images/lever.png", AssetType.IMAGE);
		
		className.set ("assets/images/lift-door.ase", __ASSET__assets_images_lift_door_ase);
		type.set ("assets/images/lift-door.ase", AssetType.BINARY);
		
		className.set ("assets/images/lift-door.png", __ASSET__assets_images_lift_door_png);
		type.set ("assets/images/lift-door.png", AssetType.IMAGE);
		
		className.set ("assets/images/lightbox.ase", __ASSET__assets_images_lightbox_ase);
		type.set ("assets/images/lightbox.ase", AssetType.BINARY);
		
		className.set ("assets/images/lightbox.png", __ASSET__assets_images_lightbox_png);
		type.set ("assets/images/lightbox.png", AssetType.IMAGE);
		
		className.set ("assets/images/lightsensor.ase", __ASSET__assets_images_lightsensor_ase);
		type.set ("assets/images/lightsensor.ase", AssetType.BINARY);
		
		className.set ("assets/images/lightsensor.png", __ASSET__assets_images_lightsensor_png);
		type.set ("assets/images/lightsensor.png", AssetType.IMAGE);
		
		className.set ("assets/images/palettes.ase", __ASSET__assets_images_palettes_ase);
		type.set ("assets/images/palettes.ase", AssetType.BINARY);
		
		className.set ("assets/images/player.ase", __ASSET__assets_images_player_ase);
		type.set ("assets/images/player.ase", AssetType.BINARY);
		
		className.set ("assets/images/player.png", __ASSET__assets_images_player_png);
		type.set ("assets/images/player.png", AssetType.IMAGE);
		
		className.set ("assets/images/player_carry.ase", __ASSET__assets_images_player_carry_ase);
		type.set ("assets/images/player_carry.ase", AssetType.BINARY);
		
		className.set ("assets/images/player_carry.png", __ASSET__assets_images_player_carry_png);
		type.set ("assets/images/player_carry.png", AssetType.IMAGE);
		
		className.set ("assets/images/player_walk.ase", __ASSET__assets_images_player_walk_ase);
		type.set ("assets/images/player_walk.ase", AssetType.BINARY);
		
		className.set ("assets/images/player_walk.png", __ASSET__assets_images_player_walk_png);
		type.set ("assets/images/player_walk.png", AssetType.IMAGE);
		
		className.set ("assets/images/toggleBlock.ase", __ASSET__assets_images_toggleblock_ase);
		type.set ("assets/images/toggleBlock.ase", AssetType.BINARY);
		
		className.set ("assets/images/toggleBlock.png", __ASSET__assets_images_toggleblock_png);
		type.set ("assets/images/toggleBlock.png", AssetType.IMAGE);
		
		className.set ("assets/images/U0f6F.png", __ASSET__assets_images_u0f6f_png);
		type.set ("assets/images/U0f6F.png", AssetType.IMAGE);
		
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/elevator_bell_ring.wav", __ASSET__assets_sounds_elevator_bell_ring_wav);
		type.set ("assets/sounds/elevator_bell_ring.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		
		className.set ("assets/fonts/nokiafc22.ttf", __ASSET__assets_fonts_nokiafc22_ttf);
		type.set ("assets/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("assets/fonts/arial.ttf", __ASSET__assets_fonts_arial_ttf);
		type.set ("assets/fonts/arial.ttf", AssetType.FONT);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == TEXT && assetType == BINARY) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), Bytes));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):Bytes {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return Bytes.ofData (cast (Type.createInstance (className.get (id), []), flash.utils.ByteArray));
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return Bytes.ofData (bitmapData.getPixels (bitmapData.rect));
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), Bytes);
		
		#elseif html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Bytes);
		else return Bytes.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes.getString (0, bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.getString (0, bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<Bytes> {
		
		var promise = new Promise<Bytes> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = Bytes.ofString (event.currentTarget.data);
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			promise.completeWith (request.load (path.get (id) + "?" + Assets.cache.version));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Bytes> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id) + "?" + Assets.cache.version;
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = Bytes.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = Bytes.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = Bytes.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = Bytes.readFile ("../Resources/manifest");
			#elseif (ios || tvos)
			var bytes = Bytes.readFile ("assets/manifest");
			#else
			var bytes = Bytes.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				if (bytes.length > 0) {
					
					var data = bytes.getString (0, bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if (ios || tvos)
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			var future = request.load (path.get (id) + "?" + Assets.cache.version);
			future.onProgress (function (progress) promise.progress (progress));
			future.onError (function (msg) promise.error (msg));
			future.onComplete (function (bytes) promise.complete (bytes.getString (0, bytes.length)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.getString (0, bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_data_levels_level1_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels_level2_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels_level2_5_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels_level3_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels_level4_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels_testbed_oel extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_levelsbyid_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_new_project_oep extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_box_ase extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_cloud_ase extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_cloud_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_crate_ase extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_crate_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_door_ase extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_door_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fez_terrain_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_images_go_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_lever_ase extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_lever_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_lift_door_ase extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_lift_door_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_lightbox_ase extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_lightbox_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_lightsensor_ase extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_lightsensor_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_palettes_ase extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_player_ase extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_player_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_player_carry_ase extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_player_carry_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_player_walk_ase extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_player_walk_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_toggleblock_ase extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_toggleblock_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_u0f6f_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_goes_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_elevator_bell_ring_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_beep_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_arial_ttf extends flash.text.Font { }


#elseif html5











































@:keep #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_arial_ttf extends lime.text.Font { public function new () { super (); name = "Arial"; } } 


#else



#if (windows || mac || linux || cpp)


@:file("assets/data/levels/level1.oel") #if display private #end class __ASSET__assets_data_levels_level1_oel extends lime.utils.Bytes {}
@:file("assets/data/levels/level2.oel") #if display private #end class __ASSET__assets_data_levels_level2_oel extends lime.utils.Bytes {}
@:file("assets/data/levels/level2_5.oel") #if display private #end class __ASSET__assets_data_levels_level2_5_oel extends lime.utils.Bytes {}
@:file("assets/data/levels/level3.oel") #if display private #end class __ASSET__assets_data_levels_level3_oel extends lime.utils.Bytes {}
@:file("assets/data/levels/level4.oel") #if display private #end class __ASSET__assets_data_levels_level4_oel extends lime.utils.Bytes {}
@:file("assets/data/levels/testbed.oel") #if display private #end class __ASSET__assets_data_levels_testbed_oel extends lime.utils.Bytes {}
@:file("assets/data/levelsByID.txt") #if display private #end class __ASSET__assets_data_levelsbyid_txt extends lime.utils.Bytes {}
@:file("assets/data/New Project.oep") #if display private #end class __ASSET__assets_data_new_project_oep extends lime.utils.Bytes {}
@:file("assets/images/box.ase") #if display private #end class __ASSET__assets_images_box_ase extends lime.utils.Bytes {}
@:image("assets/images/box.png") #if display private #end class __ASSET__assets_images_box_png extends lime.graphics.Image {}
@:image("assets/images/button.png") #if display private #end class __ASSET__assets_images_button_png extends lime.graphics.Image {}
@:file("assets/images/cloud.ase") #if display private #end class __ASSET__assets_images_cloud_ase extends lime.utils.Bytes {}
@:image("assets/images/cloud.png") #if display private #end class __ASSET__assets_images_cloud_png extends lime.graphics.Image {}
@:file("assets/images/crate.ase") #if display private #end class __ASSET__assets_images_crate_ase extends lime.utils.Bytes {}
@:image("assets/images/crate.png") #if display private #end class __ASSET__assets_images_crate_png extends lime.graphics.Image {}
@:file("assets/images/door.ase") #if display private #end class __ASSET__assets_images_door_ase extends lime.utils.Bytes {}
@:image("assets/images/door.png") #if display private #end class __ASSET__assets_images_door_png extends lime.graphics.Image {}
@:image("assets/images/FEZ_terrain.png") #if display private #end class __ASSET__assets_images_fez_terrain_png extends lime.graphics.Image {}
@:file("assets/images/images-go-here.txt") #if display private #end class __ASSET__assets_images_images_go_here_txt extends lime.utils.Bytes {}
@:file("assets/images/lever.ase") #if display private #end class __ASSET__assets_images_lever_ase extends lime.utils.Bytes {}
@:image("assets/images/lever.png") #if display private #end class __ASSET__assets_images_lever_png extends lime.graphics.Image {}
@:file("assets/images/lift-door.ase") #if display private #end class __ASSET__assets_images_lift_door_ase extends lime.utils.Bytes {}
@:image("assets/images/lift-door.png") #if display private #end class __ASSET__assets_images_lift_door_png extends lime.graphics.Image {}
@:file("assets/images/lightbox.ase") #if display private #end class __ASSET__assets_images_lightbox_ase extends lime.utils.Bytes {}
@:image("assets/images/lightbox.png") #if display private #end class __ASSET__assets_images_lightbox_png extends lime.graphics.Image {}
@:file("assets/images/lightsensor.ase") #if display private #end class __ASSET__assets_images_lightsensor_ase extends lime.utils.Bytes {}
@:image("assets/images/lightsensor.png") #if display private #end class __ASSET__assets_images_lightsensor_png extends lime.graphics.Image {}
@:file("assets/images/palettes.ase") #if display private #end class __ASSET__assets_images_palettes_ase extends lime.utils.Bytes {}
@:file("assets/images/player.ase") #if display private #end class __ASSET__assets_images_player_ase extends lime.utils.Bytes {}
@:image("assets/images/player.png") #if display private #end class __ASSET__assets_images_player_png extends lime.graphics.Image {}
@:file("assets/images/player_carry.ase") #if display private #end class __ASSET__assets_images_player_carry_ase extends lime.utils.Bytes {}
@:image("assets/images/player_carry.png") #if display private #end class __ASSET__assets_images_player_carry_png extends lime.graphics.Image {}
@:file("assets/images/player_walk.ase") #if display private #end class __ASSET__assets_images_player_walk_ase extends lime.utils.Bytes {}
@:image("assets/images/player_walk.png") #if display private #end class __ASSET__assets_images_player_walk_png extends lime.graphics.Image {}
@:file("assets/images/toggleBlock.ase") #if display private #end class __ASSET__assets_images_toggleblock_ase extends lime.utils.Bytes {}
@:image("assets/images/toggleBlock.png") #if display private #end class __ASSET__assets_images_toggleblock_png extends lime.graphics.Image {}
@:image("assets/images/U0f6F.png") #if display private #end class __ASSET__assets_images_u0f6f_png extends lime.graphics.Image {}
@:file("assets/music/music-goes-here.txt") #if display private #end class __ASSET__assets_music_music_goes_here_txt extends lime.utils.Bytes {}
@:file("assets/sounds/elevator_bell_ring.wav") #if display private #end class __ASSET__assets_sounds_elevator_bell_ring_wav extends lime.utils.Bytes {}
@:file("assets/sounds/sounds-go-here.txt") #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends lime.utils.Bytes {}
@:file("C:/Users/Noogai03/Programming/haxe/windows/flixel/3,3,12/assets/sounds/beep.mp3") #if display private #end class __ASSET__assets_sounds_beep_mp3 extends lime.utils.Bytes {}
@:file("C:/Users/Noogai03/Programming/haxe/windows/flixel/3,3,12/assets/sounds/flixel.mp3") #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends lime.utils.Bytes {}
@:font("C:/Users/Noogai03/Programming/haxe/windows/flixel/3,3,12/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("C:/Users/Noogai03/Programming/haxe/windows/flixel/3,3,12/assets/fonts/arial.ttf") #if display private #end class __ASSET__assets_fonts_arial_ttf extends lime.text.Font {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_arial_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_arial_ttf (); src = font.src; name = font.name; super (); }}

#end

#end