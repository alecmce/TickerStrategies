package enterframe.app 
{
	import enterframe.EnterFrameTicker;

	import flash.display.Sprite;

	/**
	 * @author Alec McEachran
	 */
	public class Balls extends Sprite
	{
		private const COUNT:int = 2500;
		
		public function Balls(ticker:EnterFrameTicker)
		{
			var i:int = COUNT;
			while (--i > -1)
				addChild(new Ball(ticker));
		}
		
	}
}
