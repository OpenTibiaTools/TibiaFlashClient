﻿package tibia.input
{
    import flash.display.*;
    import flash.events.*;

    public class MouseRepeatEvent extends MouseEvent
    {
        public var repeatInterval:Number = 75;
        public var repeatEnabled:Boolean = false;
        public static const REPEAT_MOUSE_DOWN:String = "repeatMouseDown";
        public static const REPEAT_RIGHT_MOUSE_DOWN:String = "repeatRightMouseDown";

        public function MouseRepeatEvent(param1:String, param2:Boolean = true, param3:Boolean = false, param4:Number = NaN, param5:Number = NaN, param6:InteractiveObject = null, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:int = 0)
        {
            super(param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11);
            return;
        }// end function

        override public function clone() : Event
        {
            var _loc_1:* = new MouseRepeatEvent(type, bubbles, cancelable, localX, localY, relatedObject, ctrlKey, altKey, shiftKey, buttonDown, delta);
            _loc_1.repeatEnabled = this.repeatEnabled;
            _loc_1.repeatInterval = this.repeatInterval;
            return _loc_1;
        }// end function

    }
}
