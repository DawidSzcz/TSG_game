package Game 
{
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Dawid
	 */
	public class Board extends MovieClip
	{
		[Embed(source = "../../img/back.jpg")]
		public var back:Class;
		[Embed(source = "../../img/brick.jpg")]
		public static var brick:Class;
		public var backG:Bitmap = new back();
		public static var sample:Bitmap = new brick();
		public static var scale:Number = 0;
		public var time:Timer = new Timer(1000, 50);
		private var enemies:Array = new Array();
		private var hero:player;
		
		private var moveX:Number = 0;
		private var moveY:Number = 0;
			
		public function Board() 
		{
			addChild(backG);
			scale = (backG.width - 90) / (sample.width * 10);
			hero = new player();
			sample.scaleX = scale;
			sample.scaleY = scale;
			sample.width = Math.round(sample.width);
			sample.height = Math.round(sample.height);
			time.addEventListener(TimerEvent.TIMER, onTick);
			
			if (stage) init(null);
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		public function init(e:Event):void
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, raportKey);
			this.x = 90;
			this.y = 32;
			backG.z = 1;
			hero.y = this.height - 2 * sample.height;
			addChild(hero);
			time.start();
		}
		private function onTick(e:Event):void
		{
			if (enemies.length == 18)
				end();
			enemies.forEach(move);
			var temp:Enemy = new Enemy();
			enemies.push(temp);
			addChild(temp);
		}
		private function move(element:Enemy, index: int, arr:Array):void
		{
			element.y += sample.height;
		}
		private function end():void
		{
			time.stop();
			this.removeChildren();
			this.addChild(backG);
		}
		private function fire(i:int)
		{
			for( var x:String in enemies)
				if (!enemies[x].isNull(i))
				{
					if (enemies[x].die(i) && x == "0")
					{
						trace(enemies.length);
						enemies.shift;
						enemies.pop();
						trace(enemies.length);
					}
					break;
				}	
		}

		private function raportKey(e:KeyboardEvent):void
		{
			if (32 == e.keyCode)
			{
				fire(hero.x/sample.width+1);
			}
			if (39 == e.keyCode )
			{
				if(hero.x < sample.width * 7)
				{
					hero.x += sample.width;
					hero.check(1);
				}
				else if ( hero.x == sample.width * 7)
				{
					hero.edge(3);
					hero.x += sample.width;
				}
			}
			if (37 == e.keyCode) 
			{
				if(hero.x > 0)
				{
					hero.x -= sample.width;
					hero.check(3);
				}
				else if (hero.x == 0)
				{
					hero.edge(1);
					hero.x -= sample.width;
				}
			}		
		}
		
	}

}