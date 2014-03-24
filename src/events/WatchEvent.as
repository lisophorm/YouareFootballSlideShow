package events
{
	import flash.events.Event;
	
	public class WatchEvent extends Event
	{
		
		public static const ON_ADD_PHOTO:String = "onAddPhoto";
		
		public var nativepath:String = "";
		public var notificationType:String = "";

		public function WatchEvent(type:String, notificationType:String="",nativepath:String="",bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.nativepath=nativepath;
			this.notificationType=notificationType;
			super(type, bubbles, cancelable);
			
		}
	}
}