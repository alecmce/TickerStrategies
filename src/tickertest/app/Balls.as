package tickertest.app 
{
	import tickertest.ticker.Ticker;

	import flash.display.Sprite;

	/**
	 * @author Alec McEachran
	 */
	public class Balls extends Sprite
	{
		private const COUNT:int = 5000;
		
		public function Balls(ticker:Ticker)
		{
			var i:int = COUNT;
			while (--i > -1)
				addChild(new Ball(ticker));
		}
		
	}
}
