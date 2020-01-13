/**
 *        __       __               __ 
 *   ____/ /_ ____/ /______ _ ___  / /_
 *  / __  / / ___/ __/ ___/ / __ `/ __/
 * / /_/ / (__  ) / / /  / / /_/ / / 
 * \__,_/_/____/_/ /_/  /_/\__, /_/ 
 *                           / / 
 *                           \/ 
 * http://distriqt.com
 *
 * @author 		"Michael Archbold (ma&#64;distriqt.com)"
 * @created		08/01/2016
 * @copyright	http://distriqt.com/copyright/license.txt
 */
package com.distriqt.test.dynamicicon
{
	import com.distriqt.extension.dynamicicon.DynamicIcon;
	import com.distriqt.extension.dynamicicon.events.DynamicIconEvent;
	
	import flash.display.Bitmap;
	import flash.filesystem.File;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.utils.setTimeout;
	
	import starling.core.Starling;
	
	import starling.display.Image;
	import starling.display.Sprite;
	
	/**	
	 */
	public class DynamicIconTests extends Sprite
	{
		public static const TAG : String = "";
		
		private var _l : ILogger;
		
		private function log( log:String ):void
		{
			_l.log( TAG, log );
		}
		
		
		
		
		////////////////////////////////////////////////////////
		//	FUNCTIONALITY
		//
		
		public function DynamicIconTests( logger:ILogger )
		{
			_l = logger;
			try
			{
				log( "DynamicIcon Supported: " + DynamicIcon.isSupported );
				if (DynamicIcon.isSupported)
				{
					log( "DynamicIcon Version:   " + DynamicIcon.service.version );
				
					DynamicIcon.instance.addEventListener( DynamicIconEvent.SETALTERNATEICON_SUCCESS, setAlternateIcon_successHandler );
					DynamicIcon.instance.addEventListener( DynamicIconEvent.SETALTERNATEICON_FAILED, setAlternateIcon_failedHandler );
				
				}
				
			}
			catch (e:Error)
			{
				trace( e );
			}
		}
		
		
		////////////////////////////////////////////////////////
		//  
		//
		
		public function setAlternateIcon():void
		{
			if (DynamicIcon.instance.supportsAlternateIcons)
			{
				DynamicIcon.instance.setAlternateIconName( "AlternateIcon" );
			}
		}
		
		public function setPrimaryIcon():void
		{
			if (DynamicIcon.instance.supportsAlternateIcons)
			{
				DynamicIcon.instance.setAlternateIconName( null );
			}
		}
		
		
		
		private function setAlternateIcon_successHandler( event:DynamicIconEvent ):void
		{
			log( "Icon change success" );
			log( "Icon name: " + DynamicIcon.instance.getAlternateIconName() );
		}
		
		private function setAlternateIcon_failedHandler( event:DynamicIconEvent ):void
		{
			log( "Icon change error: " + event.error );
		}
		
		
		
		
	}
}
