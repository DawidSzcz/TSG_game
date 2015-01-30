package Game 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.*
	/**
	 * ...
	 * @author Dawid
	 */
	public class player extends Sprite
	{
		[Embed(source = "../../img/brick.jpg")]
		private var brick:Class;
		
		private var hero:Array;
		public function player() 
		{
			
			if (stage) 
				init(null);
			else	
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		public function edge(i:int):void 
		{
			removeChild(hero[i]);
		}
		public function check(i:int):void 
		{
			if (!this.contains(hero[i]))
				addChild(hero[i]);
		}
		private function init(e:Event)
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			hero = new Array();
			for (var i = 0; i < 4; i++)
			{
				trace("s\n");
				var sth:Bitmap = new brick();
				sth.scaleX = Board.scale;
				sth.scaleY = Board.scale;
				hero.push(sth);
				if (i == 0)
					sth.x += sth.width;
				else
				{
					sth.y += sth.height;
					sth.x += (i - 1) * sth.width;
				}
				addChild(sth);
			}
		}

		
		
	}

}