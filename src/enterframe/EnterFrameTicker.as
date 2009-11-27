package enterframe 
{
	import flash.display.Stage;
	import flash.events.Event;

	/**
	 * @author Alec McEachran
	 */
	public class EnterFrameTicker 
	{
		private var fns:Array;
		
		private var count:int;
		
		public function EnterFrameTicker(stage:Stage)
		{
			fns = [];
			count = 0;
			stage.addEventListener(Event.ENTER_FRAME, onEnterFrame);
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
		
	}
}
