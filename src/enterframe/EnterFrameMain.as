package enterframe 
{
	import enterframe.app.Balls;

	import com.flashdynamix.utils.SWFProfiler;

	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;

	/**
	 * @author Alec McEachran
	 */
	public class EnterFrameMain extends Sprite 
	{
		private var ticker:EnterFrameTicker;
		
		public function EnterFrameMain()
		{	
			ticker = new EnterFrameTicker(stage);
			
			addChild(new Balls(ticker));
			
			SWFProfiler.init(stage, this);
			SWFProfiler.show();
			
			var tf:TextField = new TextField();
			tf.y = 380;
			tf.text = "enterframe";
			tf.defaultTextFormat = new TextFormat("_sans", 12);
			addChild(tf);
		}
	}
}
