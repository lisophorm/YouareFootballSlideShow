package com.alfo.utils
{

	
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.filesystem.File;
	import flash.utils.Timer;
	
	import events.WatchEvent;
	
	
	
	public class PictureWatcher extends Sprite
	{
		public var wEvt:WatchEvent;
		
		private var _watchFile:File;
		
		private var pictureTimer:Timer;
		
		public function PictureWatcher()
		{
			trace("picturewatcher init");
			super();
			pictureTimer=new Timer(1000);
			pictureTimer.addEventListener(TimerEvent.TIMER,checkFile);
		}
		public function setWatchFile(file:String):void {
			_watchFile=File.applicationDirectory.resolvePath(file);

		}
		public function startWatch():void {
			if(_watchFile != null) {
				pictureTimer.start();
			}
		}
		public function stopWatch():void 
		{
			pictureTimer.stop();
		}
		private function checkFile(event:TimerEvent):void {
			if(_watchFile.exists) {
				trace("FILE FOUND! Dispatching event");
				wEvt=new WatchEvent(WatchEvent.ON_ADD_PHOTO,"fileCreate",_watchFile.nativePath);
				//new DelayedExecution(2000,this,dispatcher,wEvt);
				dispatchEvent(wEvt);
				pictureTimer.stop();
			} else {
				trace("file not found");
			}
		}
		

	}
}