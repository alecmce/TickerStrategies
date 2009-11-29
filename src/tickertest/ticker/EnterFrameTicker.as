package tickertest.ticker 
{
	import flash.display.Stage;
	import flash.events.Event;

	/**
	 * @author Alec McEachran
	 */
	public class EnterFrameTicker implements Ticker
	{
		private var fns:Array;
		
		private var count:int;
		
		private var stage:Stage;
		
		public function EnterFrameTicker(stage:Stage)
		{
			this.stage = stage;
			fns = [];
			count = 0;
		}
		
		public function start():void
		{
			stage.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		public function stop():void
		{
			stage.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
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
		
		private function onEnterFrame(event:Event):void
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
