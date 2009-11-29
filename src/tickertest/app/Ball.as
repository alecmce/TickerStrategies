package tickertest.app 
{
	import tickertest.ticker.Ticker;

	import flash.display.Shape;

	/**
	 * @author Alec McEachran
	 */
	public class Ball extends Shape
	{
		private const COLORS:Array = [0xFF0000, 0xFF8800, 0xFFEE00, 0x00FF00, 0x1E90FF, 0x0000CD, 0x9900FF];
		
		public var i:Number;
		
		public var j:Number;
		
		public function Ball(ticker:Ticker)
		{
			graphics.beginFill(COLORS[int(Math.random() * COLORS.length)], 0.4);
			graphics.drawCircle(0, 0, 5);
			graphics.endFill();
			
			x = Math.random() * 550;
			y = Math.random() * 380 + 20;
			i = 0;
			j = 0;
			
			ticker.addListener(onFrame);
		}
		
		private function onFrame():void
		{
			update(Math.random() - 0.5, Math.random() - 0.5);
		}
		
		public function update(di:Number, dj:Number):void
		{
			x += i;
			y += j;
			
			i += di;
			j += dj;
			
			if ((x < 0 && i < 0) || (x > 550 && i > 0))
				i = -i;
			
			if ((y < 20 && j < 0) || (y > 550 && j > 0))
				j = -j;
		}
	}
}
