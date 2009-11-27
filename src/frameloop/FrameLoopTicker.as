package frameloop
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.getDefinitionByName;

	/**
	 * @author Alec McEachran
	 */
	public class FrameLoopTicker extends MovieClip 
	{
		private var fns:Array;
		
		private var count:int;
		
		public function FrameLoopTicker()
		{
			fns = [];
			count = 0;
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			nextFrame();
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
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			addFrameScript(0, frameMethod, 1, frameMethod);
			
			init();
			play();
		}
 
		private function init():void
		{
			var mainClass:Class = Class(getDefinitionByName("frameloop.FrameLoopMain"));
			if (!mainClass)
				throw new Error("Unable to find main class");

			var app:* = new mainClass();
			app.ticker = this;
			addChild(app);
			app.init();
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
