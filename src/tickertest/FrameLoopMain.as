package tickertest
{
	import tickertest.app.Balls;
	import tickertest.ticker.FrameLoopTicker;
	import tickertest.ticker.Ticker;

	import com.flashdynamix.utils.SWFProfiler;

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;

	/**
	 * For the FrameLoopTicker to work, this main class must have a two-frame
	 * timeline. You can force this by adding the following command to the MXML
	 * compiler:
	 * 
	 * -frames.frame 1 flash.display.Sprite
	 * 
	 * @author Alec McEachran
	 */
	public class FrameLoopMain extends MovieClip 
	{
		public var ticker:Ticker;
		
		public function FrameLoopMain():void
		{
			ticker = new FrameLoopTicker(this);
			ticker.stop();
			
			initDemo();
			
			addChild(new Balls(ticker));
			
			SWFProfiler.init(stage, this);
			SWFProfiler.stop();
			SWFProfiler.show();
			
			var tf:TextField = new TextField();
			tf.y = 380;
			tf.text = "frameloop";
			tf.defaultTextFormat = new TextFormat("_sans", 12);
			addChild(tf);
		}
		
		private function initDemo():void
		{
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		}
		
		private function onMouseMove(event:MouseEvent):void
		{
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			stage.addEventListener(Event.MOUSE_LEAVE, onMouseLeave);
			
			ticker.start();
			SWFProfiler.start();
		}
		
		private function onMouseLeave(event:Event):void
		{
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			stage.removeEventListener(Event.MOUSE_LEAVE, onMouseLeave);
			
			SWFProfiler.stop();
			ticker.stop();
		}
		
	}
}
