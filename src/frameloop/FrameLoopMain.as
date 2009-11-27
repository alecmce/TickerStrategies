package frameloop
{
	import frameloop.app.Balls;

	import com.flashdynamix.utils.SWFProfiler;

	import flash.display.Sprite;

	/**
	 * Ignore the shape - the shape means nothing! The cool thing is that this application
	 * is running off an enter-frame as3signal
	 * 
	 * (c) 2009 alecmce.com
	 *
	 * @author Alec McEachran
	 */
	[Frame(factoryClass="frameloop.FrameLoopTicker")]
	public class FrameLoopMain extends Sprite 
	{
		public var ticker:FrameLoopTicker;
		
		public function init():void
		{
			addChild(new Balls(ticker));
			SWFProfiler.init(stage, this);
		}
		
	}
}
