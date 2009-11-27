package frameloop.app 
{
	import frameloop.FrameLoopTicker;

	import flash.display.Sprite;

	/**
	 * @author Alec McEachran
	 */
	public class Balls extends Sprite
	{
		private const COUNT:int = 2500;
		
		public function Balls(ticker:FrameLoopTicker)
		{
			var i:int = COUNT;
			while (--i > -1)
				addChild(new Ball(ticker));
		}
		
	}
}
