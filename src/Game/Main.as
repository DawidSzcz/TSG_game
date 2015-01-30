package Game
{
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Dawid
	 */
	public class Main extends Sprite 
	{
		[Embed(source = "../../img/backgroand.jpg")]
		public var backGround:Class;
		
		var board:Board= new Board();
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			var image :Bitmap = new backGround();
			this.addChild(image);
			this.addChild(board);
		}
		
	}
	
}