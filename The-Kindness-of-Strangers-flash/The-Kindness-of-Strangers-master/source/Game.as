package source 
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Tilemap;
	
	import source.Objects.*;
	import source.Solids.*;
	
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author Noel Berry
	 */
	public class Game extends World
	{
		public const SCALE:Number = 2; // How much to scale the ogmo level information by.
		
		[Embed(source='../assets/levels/MainLevel05.oel', mimeType='application/octet-stream')] public var level1: Class;
		
		
		public var levels:Array = new Array(level1);
		public var tileset:Tilemap;
		
		//timer so that reset level doesn't happen right away...
		public var reset:int = 60;
		
		override public function begin():void {
			FP.screen.color = Colors.DARK_GRAY;
			Global.level = 0;
			Global.died = false;
			Global.help = true;
			
			trace('kindness: ' + Global.kindness);
				
			//loadMaze();
			nextlevel();
			
			PhotoController.show = true;
			
			//add(new GlitchController);
		}
		
		public function loadMaze():void
		{
			// Add the maze
			add(Global.maze = new Maze(0, FP.height/2));		
			
			// Set level size
			FP.width = Global.maze.width;
			FP.height = Global.maze.height + FP.height;				
			
			// Add the player
			add(Global.player = new Player(FP.width/2, 200));
			
			// Add the view (camera)
			add(Global.view = new View(Global.player as Entity, new Rectangle(0, 0, FP.width, FP.height), 10));	
		}
		
		override public function update():void {
			if (!Global.paused) { super.update(); }				
			
			//if we should restart
			if (Global.restart) { 
				
				//make a timer so it isn't instant
				reset -= 1;
				if (reset == 0) {
					//restart level
					restartlevel();
					//set restart to false
					Global.restart = false;
					//reset our timer
					reset = 60;
				}
			}
			
			if (Global.finished) {
				nextlevel();
			}
		}
		
		public function loadlevel():void 
		{	
			var file:ByteArray = new levels[Global.level-1];
			var str:String = file.readUTFBytes( file.length );
			var xml:XML = new XML(str);
			
			var e:Entity;
			var o:XML;
			var n:XML;
			
			FP.width = xml.width * SCALE;
			FP.height = xml.height * SCALE;
			
			trace( "testing" );
			
			// Add the maze
			add(Global.maze = new Maze(xml.maze[0].maze.@x * SCALE, xml.maze[0].maze.@y * SCALE));		
			//add(Global.maze = new Maze(0, 320));	
			
			//add the view, and the player
			//set the view to follow the player, within no restraints, and let it "stray" from the player a bit.
			//for example, if the last parameter was 1, the view would be static with the player. If it was 10, then
			//it would trail behind the player a bit. Higher the number, slower it follows.			
			
			
			if (Global.intro)
			{
				//Airplanes
				add(Global.airplane = new Airplane(0, 0));
				add(Global.view = new View(Global.airplane as Entity, new Rectangle(0, 0, FP.width, FP.height), 10));
				add(Global.airplane2 = new Airplane2(FP.width + 100, FP.height - 150));		
				add(Global.player = new Player(xml.actors[0].player.@x * SCALE - 10, xml.actors[0].player.@y * SCALE - 4));
				Global.player.stunned = true;
			}
			else 
			{
				//add(Global.player = new Player(xml.actors[0].player.@x * SCALE - 10, xml.actors[0].player.@y * SCALE - 4));
				add(Global.player = new Player(100, 100));
				add(Global.airplane2 = new Airplane2(FP.width + 100, FP.height - 150));	
				add(Global.photoControler = new PhotoController);				
				add(Global.soundControler = new SoundController);
				add(Global.view = new View(Global.player as Entity, new Rectangle(0, 0, FP.width, FP.height), 10));		
				Global.player.stunned = false;
			}		
			
			// Add the strangers
			for each (o in xml.actors[0].person_right) { add(new StrangerRight(o.@x * SCALE - 10, o.@y * SCALE - 4)); }		
			for each (o in xml.actors[0].person_left) { add(new StrangerLeft(o.@x * SCALE - 10, o.@y * SCALE - 4)); }	
			for each (o in xml.actors[0].person_up) { add(new StrangerUp(o.@x * SCALE - 10, o.@y * SCALE - 4)); }	
			for each (o in xml.actors[0].person_down) { add(new StrangerDown(o.@x * SCALE - 10, o.@y * SCALE - 4)); }	
			
			// Add the triggers
			for each (o in xml.triggers[0].trigger_01) { add(Global.trigger01 = new Trigger(o.@x * SCALE, o.@y * SCALE)); }	
			for each (o in xml.triggers[0].trigger_02) { add(Global.trigger02 = new Trigger(o.@x * SCALE, o.@y * SCALE)); }
			for each (o in xml.triggers[0].trigger_03) { add(Global.trigger03 = new Trigger(o.@x * SCALE, o.@y * SCALE)); }	
			for each (o in xml.triggers[0].trigger_04) { add(Global.trigger04 = new Trigger(o.@x * SCALE, o.@y * SCALE)); }	
			
			// Heart
			if (Global.kindness)
				for each (o in xml.triggers[0].heart) { add(Global.bigHeart = new BigHeart(o.@x * SCALE, o.@y * SCALE)); }
		}
		
		
		/**
		 * Loads up the next level (removes all entities of the current world, increases Global.level, calls loadlevel)
		 * @return	void
		 */
		public function nextlevel():void
		{
			removeAll();
			
			if(Global.level < levels.length) { Global.level ++; }
			Global.finished = false;
			
			loadlevel();
		}
		
		
		/**
		 * Reloads the current level
		 * @return	void
		 */
		public function restartlevel():void
		{
			removeAll();
			loadlevel();

			
			//increase deaths
			Global.deaths ++;
		}
		
	}

}