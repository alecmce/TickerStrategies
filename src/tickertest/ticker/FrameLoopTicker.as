package tickertest.ticker
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.getDefinitionByName;

	/**
	 * @author Alec McEachran
	 */
	public class FrameLoopTicker extends MovieClip implements Ticker
	{
		private var fns:Array;
		
		private var count:int;
		
		public function FrameLoopTicker()
		{
			fns = [];
			count = 0;
			
			init();
		}
		
		public function start():void
		{
			play();
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
		
		
		/**
		 * Add an ENTER_FRAME listener to put of initialisation until the next
		 * frame. This is required because factoryClasses can only access their
		 * main class in the second frame.
		 * 
		 * The ENTER_FRAME listener is removed immediately in the onEnterFrame
		 * method and is not used as the basis for the loop 
		 */
		private function init():void
		{
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			nextFrame();
		}
		
		
		/**
		 * construct a loop by adding the frameMethod method as a frame script
		 * for both the first and second frames.
		 */
		private function onEnterFrame(event:Event):void
		{
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			addFrameScript(0, frameMethod, 1, frameMethod);
			
			initMain();
			play();
		}
 
 		
 		/**
 		 * Construct an instance of the main class and inject the ticker into it.
 		 * Then call the main class's init() method
 		 */
		private function initMain():void
		{
			var mainClass:Class = Class(getDefinitionByName("tickertest.FrameLoopMain"));
			if (!mainClass)
				throw new Error("Unable to find main class");

			var app:* = new mainClass();
			app.ticker = this;
			addChild(app);
			app.init();
		}
		
		
		/**
		 * the method that is triggered when the timeline playhead enters both the first
		 * and second scripts
		 */
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
