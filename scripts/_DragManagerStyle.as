package
{
   import mx.core.IFlexModuleFactory;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   import mx.skins.halo.DefaultDragImage;
   
   public class _DragManagerStyle
   {
      
      private static var _embed_css_Assets_swf_mx_skins_cursor_DragCopy_150928065:Class = _DragManagerStyle__embed_css_Assets_swf_mx_skins_cursor_DragCopy_150928065;
      
      private static var _embed_css_Assets_swf_mx_skins_cursor_DragReject_677079413:Class = _DragManagerStyle__embed_css_Assets_swf_mx_skins_cursor_DragReject_677079413;
      
      private static var _embed_css_Assets_swf_mx_skins_cursor_DragMove_150103613:Class = _DragManagerStyle__embed_css_Assets_swf_mx_skins_cursor_DragMove_150103613;
      
      private static var _embed_css_Assets_swf_mx_skins_cursor_DragLink_150141528:Class = _DragManagerStyle__embed_css_Assets_swf_mx_skins_cursor_DragLink_150141528;
       
      public function _DragManagerStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("DragManager");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("DragManager",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               _DragManagerStyle.copyCursor = _embed_css_Assets_swf_mx_skins_cursor_DragCopy_150928065;
               _DragManagerStyle.moveCursor = _embed_css_Assets_swf_mx_skins_cursor_DragMove_150103613;
               _DragManagerStyle.rejectCursor = _embed_css_Assets_swf_mx_skins_cursor_DragReject_677079413;
               _DragManagerStyle.linkCursor = _embed_css_Assets_swf_mx_skins_cursor_DragLink_150141528;
               _DragManagerStyle.defaultDragImageSkin = DefaultDragImage;
            };
         }
      }
   }
}
