package enterframe 
{
	import enterframe.app.Balls;

	import com.flashdynamix.utils.SWFProfiler;

	import flash.display.Sprite;

	/**
	 * 
	 * 
	 * (c) 2009 alecmce.com
	 *
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
		}
	}
}
