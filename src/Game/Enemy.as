package Game 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Dawid
	 */
	public class Enemy extends Sprite
	{
		[Embed(source = "../../img/brick.jpg")]
		var brick:Class;
		var row:Array;
		var moveX:Number = 0;
		
		public function Enemy()
		{
			row = new Array();
			if (stage) 
				init(null);
			else	
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		public function die(i:int)
		{
			if (row[i] != null)
			{
				removeChild(row[i]);
				row[i] = null;
			}
			for each(var x in row)
				if (x != null)
					return false;
			return true;
		}
		public function isNull(i:int)
		{
			if (row[i] == null)
				return true;
		}
		
		private function init(e:Event)
		{
			for (var i:int = 0; i < 10; i++)
			{	
				var element = null;
				if (Math.random() > 0.5)
				{
					element = new Board.brick();
					element.scaleX = Board.scale;
					element.scaleY = Board.scale;
					element.x = moveX;
					addChild(element);
				}
				row.push(element);
				moveX += Board.sample.width;
			}
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}
		
	}
}