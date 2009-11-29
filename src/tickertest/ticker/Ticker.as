package tickertest.ticker 
{

	/**
	 * @author Alec McEachran
	 */
	public interface Ticker 
	{
		
		function start():void;
		
		function stop():void;
		
		function addListener(fn:Function):void;
		
		function removeListener(fn:Function):void;
		
	}
}
