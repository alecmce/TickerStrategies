package frameloop
{
	import frameloop.app.Balls;

	import com.flashdynamix.utils.SWFProfiler;

	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;

	/**
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
			SWFProfiler.show();
			
			var tf:TextField = new TextField();
			tf.y = 380;
			tf.defaultTextFormat = new TextFormat("_sans", 12);
			tf.text = "frameloop";
			addChild(tf);
		}
		
	}
}
