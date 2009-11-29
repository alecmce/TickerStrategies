package tickertest.ticker
{
	import flash.display.MovieClip;

	/**
	 * @author Alec McEachran
	 */
	public class FrameLoopTicker implements Ticker
	{
		private var root:MovieClip;
		
		private var fns:Array;
		
		private var count:int;
		
		public function FrameLoopTicker(root:MovieClip)
		{
			this.root = root;
			
			fns = [];
			count = 0;
			
			root.addFrameScript(0, frameMethod, 1, frameMethod);
		}
		
		public function start():void
		{
			root.play();
		}
		
		public function stop():void
		{
			root.stop();
		}
		
		public function addListener(fn:Function):void
		{
			if (fns.indexOf(fn) == -1)
				fns[count++] = fn;
		}
		
		public function removeListener(fn:Function):void
		{
			var i:uint = fns.indexOf(fn);
			if (i != -1)
			{
				fns.splice(i, 1);
				--count;
			}	
		}
		
		private function frameMethod():void
		{
			var i:int = count;
			while (--i > -1)
			{
				var fn:Function = fns[i];
				fn();
			}
		}
		
	}
}
