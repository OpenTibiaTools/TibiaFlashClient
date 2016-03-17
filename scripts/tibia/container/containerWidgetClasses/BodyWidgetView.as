package tibia.container.containerWidgetClasses
{
   import tibia.container.ContainerStorage;
   import flash.text.TextField;
   import tibia.creatures.Player;
   import mx.events.PropertyChangeEvent;
   import tibia.game.ObjectDragImpl;
   import flash.text.TextFormat;
   import flash.display.InteractiveObject;
   import mx.controls.Button;
   import tibia.appearances.AppearanceInstance;
   import mx.core.UIComponent;
   import flash.text.TextFieldAutoSize;
   import flash.filters.GlowFilter;
   import flash.filters.BitmapFilterQuality;
   import shared.controls.CustomButton;
   import flash.events.MouseEvent;
   import mx.core.EdgeMetrics;
   import tibia.container.Container;
   import tibia.appearances.AppearanceType;
   import tibia.input.gameaction.UseActionImpl;
   import shared.utility.Vector3D;
   import tibia.§sidebar:ns_sidebar_internal§.widgetClosed;
   import tibia.§sidebar:ns_sidebar_internal§.widgetCollapsed;
   import mx.core.ScrollPolicy;
   import mx.core.ClassFactory;
   
   public class BodyWidgetView extends ContainerWidgetViewBase
   {
      
      protected static const PROFESSION_MASK_DRUID:int = 1 << PROFESSION_DRUID;
      
      protected static const STATE_PZ_BLOCK:int = 13;
      
      protected static const PROFESSION_SORCERER:int = 3;
      
      protected static const PK_REVENGE:int = 6;
      
      protected static const STATE_SLOW:int = 5;
      
      protected static const PARTY_NONE:int = 0;
      
      protected static const PARTY_MEMBER_SEXP_ACTIVE:int = 5;
      
      protected static const PROFESSION_MASK_SORCERER:int = 1 << PROFESSION_SORCERER;
      
      protected static const SKILL_FIGHTCLUB:int = 9;
      
      protected static const WAR_ALLY:int = 1;
      
      protected static const PROFESSION_MASK_NONE:int = 1 << PROFESSION_NONE;
      
      protected static const PK_PARTYMODE:int = 2;
      
      protected static const WAR_ENEMY:int = 2;
      
      protected static const PARTY_LEADER_SEXP_INACTIVE_GUILTY:int = 8;
      
      protected static const PARTY_MEMBER:int = 2;
      
      protected static const STATE_DRUNK:int = 3;
      
      protected static const WAR_NEUTRAL:int = 3;
      
      protected static const SKILL_EXPERIENCE:int = 0;
      
      protected static const TYPE_NPC:int = 2;
      
      protected static const PROFESSION_KNIGHT:int = 1;
      
      protected static const SKILL_STAMINA:int = 16;
      
      protected static const STATE_NONE:int = -1;
      
      protected static const PROFESSION_PALADIN:int = 2;
      
      protected static const PARTY_MEMBER_SEXP_INACTIVE_GUILTY:int = 7;
      
      protected static const SKILL_FIGHTSHIELD:int = 7;
      
      protected static const SKILL_FIGHTAXE:int = 11;
      
      protected static const WAR_NONE:int = 0;
      
      protected static const SKILL_FIGHTDISTANCE:int = 8;
      
      protected static const PK_EXCPLAYERKILLER:int = 5;
      
      protected static const NUM_CREATURES:int = 1300;
      
      protected static const NUM_TRAPPERS:int = 8;
      
      protected static const SKILL_FED:int = 14;
      
      protected static const SKILL_MAGLEVEL:int = 2;
      
      protected static const SKILL_SOULPOINTS:int = 15;
      
      protected static const SKILL_FISHING:int = 13;
      
      private static const WIDGET_VIEW_WIDTH:Number = 176;
      
      protected static const PARTY_LEADER_SEXP_OFF:int = 4;
      
      protected static const PK_PLAYERKILLER:int = 4;
      
      protected static const STATE_FAST:int = 6;
      
      protected static const STATE_BLEEDING:int = 15;
      
      protected static const STATE_DAZZLED:int = 10;
      
      protected static const PROFESSION_MASK_KNIGHT:int = 1 << PROFESSION_KNIGHT;
      
      protected static const TYPE_PLAYER:int = 0;
      
      protected static const SKILL_HITPOINTS:int = 3;
      
      protected static const SKILL_NONE:int = -1;
      
      protected static const SKILL_OFFLINETRAINING:int = 17;
      
      private static const BUNDLE:String = "BodyWidget";
      
      protected static const STATE_MANA_SHIELD:int = 4;
      
      protected static const SKILL_MANA:int = 4;
      
      protected static const PROFESSION_MASK_PALADIN:int = 1 << PROFESSION_PALADIN;
      
      protected static const MAX_NAME_LENGTH:int = 29;
      
      protected static const STATE_CURSED:int = 11;
      
      protected static const STATE_FREEZING:int = 9;
      
      private static const WIDGET_VIEW_HEIGHT:Number = 154;
      
      protected static const PARTY_LEADER:int = 1;
      
      protected static const PARTY_LEADER_SEXP_INACTIVE_INNOCENT:int = 10;
      
      protected static const STATE_PZ_ENTERED:int = 14;
      
      protected static const PROFESSION_NONE:int = 0;
      
      protected static const PK_ATTACKER:int = 1;
      
      protected static const STATE_ELECTRIFIED:int = 2;
      
      protected static const SKILL_FIGHTSWORD:int = 10;
      
      protected static const TYPE_MONSTER:int = 1;
      
      protected static const SKILL_CARRYSTRENGTH:int = 6;
      
      protected static const STATE_POISONED:int = 0;
      
      protected static const STATE_BURNING:int = 1;
      
      protected static const SKILL_FIGHTFIST:int = 12;
      
      protected static const STATE_DROWNING:int = 8;
      
      protected static const PK_AGGRESSOR:int = 3;
      
      protected static const SKILL_LEVEL:int = 1;
      
      protected static const STATE_STRENGTHENED:int = 12;
      
      protected static const STATE_HUNGRY:int = 31;
      
      protected static const PROFESSION_MASK_ANY:int = PROFESSION_MASK_DRUID | PROFESSION_MASK_KNIGHT | PROFESSION_MASK_PALADIN | PROFESSION_MASK_SORCERER;
      
      protected static const PROFESSION_DRUID:int = 4;
      
      protected static const PARTY_MEMBER_SEXP_OFF:int = 3;
      
      protected static const STATE_FIGHTING:int = 7;
      
      private static const WIDGET_COMPONENTS:Array = [{
         "slot":-1,
         "left":123,
         "top":140,
         "width":28,
         "height":11,
         "style":null,
         "tooltip":null
      },{
         "slot":ContainerStorage.BODY_HEAD,
         "left":70,
         "top":2,
         "width":NaN,
         "height":NaN,
         "style":"bodySlotHeadStyle",
         "tooltip":null
      },{
         "slot":ContainerStorage.BODY_NECK,
         "left":26,
         "top":8,
         "width":NaN,
         "height":NaN,
         "style":"bodySlotNeckStyle",
         "tooltip":null
      },{
         "slot":ContainerStorage.BODY_BACK,
         "left":114,
         "top":8,
         "width":NaN,
         "height":NaN,
         "style":"bodySlotBackStyle",
         "tooltip":null
      },{
         "slot":ContainerStorage.BODY_TORSO,
         "left":70,
         "top":39,
         "width":NaN,
         "height":NaN,
         "style":"bodySlotTorsoStyle",
         "tooltip":null
      },{
         "slot":ContainerStorage.BODY_RIGHT_HAND,
         "left":120,
         "top":53,
         "width":NaN,
         "height":NaN,
         "style":"bodySlotRightHandStyle",
         "tooltip":null
      },{
         "slot":ContainerStorage.BODY_LEFT_HAND,
         "left":19,
         "top":54,
         "width":NaN,
         "height":NaN,
         "style":"bodySlotLeftHandStyle",
         "tooltip":null
      },{
         "slot":ContainerStorage.BODY_LEGS,
         "left":70,
         "top":77,
         "width":NaN,
         "height":NaN,
         "style":"bodySlotLegsStyle",
         "tooltip":null
      },{
         "slot":ContainerStorage.BODY_FEET,
         "left":70,
         "top":115,
         "width":NaN,
         "height":NaN,
         "style":"bodySlotFeetStyle",
         "tooltip":null
      },{
         "slot":ContainerStorage.BODY_FINGER,
         "left":26,
         "top":99,
         "width":NaN,
         "height":NaN,
         "style":"bodySlotFingerStyle",
         "tooltip":null
      },{
         "slot":ContainerStorage.BODY_HIP,
         "left":114,
         "top":98,
         "width":NaN,
         "height":NaN,
         "style":"bodySlotHipStyle",
         "tooltip":null
      },{
         "slot":ContainerStorage.BODY_PURSE,
         "left":2,
         "top":1,
         "width":NaN,
         "height":NaN,
         "style":"bodySlotPurseStyle",
         "tooltip":"TOOLTIP_PURSE"
      }];
      
      protected static const SKILL_GOSTRENGTH:int = 5;
      
      protected static const PARTY_MEMBER_SEXP_INACTIVE_INNOCENT:int = 9;
      
      protected static const PK_NONE:int = 0;
      
      protected static const PARTY_LEADER_SEXP_ACTIVE:int = 6;
       
      private var m_UICapacity:TextField = null;
      
      private const m_DragHandler:ObjectDragImpl = new ObjectDragImpl();
      
      private var m_UncommittedPlayer:Boolean = false;
      
      private var m_Player:Player = null;
      
      private var m_UIPurse:Button = null;
      
      public function BodyWidgetView()
      {
         super();
         horizontalScrollPolicy = ScrollPolicy.OFF;
         verticalScrollPolicy = ScrollPolicy.OFF;
         slotFactory = new ClassFactory(BodySlot);
         titleText = resourceManager.getString(BUNDLE,"TITLE");
      }
      
      function set player(param1:Player) : void
      {
         if(this.m_Player != param1)
         {
            if(this.m_Player != null)
            {
               this.m_Player.removeEventListener(PropertyChangeEvent.PROPERTY_CHANGE,this.onPlayerChange);
            }
            this.m_Player = param1;
            this.m_UncommittedPlayer = true;
            invalidateProperties();
            if(this.m_Player != null)
            {
               this.m_Player.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE,this.onPlayerChange);
            }
         }
      }
      
      override public function styleChanged(param1:String) : void
      {
         switch(param1)
         {
            case "capacityFontColor":
            case "capacityFontFamily":
            case "capacityFontSize":
            case "capacityFontStyle":
            case "capacityFontWeight":
               this.m_UICapacity.defaultTextFormat = this.getCapacityTextFormat();
               invalidateDisplayList();
               break;
            default:
               super.styleChanged(param1);
         }
      }
      
      private function indexToBodySlot(param1:int) : int
      {
         if(param1 < 0 || param1 >= ContainerStorage.NUM_BODY_SLOTS)
         {
            throw new RangeError();
         }
         return param1 + ContainerStorage.BODY_HEAD;
      }
      
      private function getCapacityTextFormat() : TextFormat
      {
         var _loc1_:String = getStyle("capacityFontFamily");
         var _loc2_:Number = getStyle("capacityFontSize");
         var _loc3_:uint = getStyle("capacityFontColor");
         var _loc4_:* = getStyle("capacityFontWeight") === "bold";
         var _loc5_:* = getStyle("capacityFontStyle") === "italic";
         return new TextFormat(_loc1_,_loc2_,_loc3_,_loc4_,_loc5_);
      }
      
      override protected function destroySlot(param1:int) : void
      {
         var _loc2_:InteractiveObject = slotHolder.getChildAt(param1) as InteractiveObject;
         if(_loc2_ != null)
         {
            this.m_DragHandler.removeDragComponent(_loc2_);
         }
         super.destroySlot(param1);
      }
      
      override protected function createSlot(param1:AppearanceInstance = null, param2:int = -1) : IContainerSlot
      {
         var _loc4_:IContainerSlot = null;
         var _loc3_:int = this.indexToBodySlot(param2);
         if(_loc3_ >= ContainerStorage.BODY_HEAD && _loc3_ <= ContainerStorage.BODY_HIP)
         {
            _loc4_ = super.createSlot(param1,param2);
            if(_loc4_ != null)
            {
               _loc4_.styleName = getStyle(WIDGET_COMPONENTS[_loc3_].style);
            }
            if(_loc4_ is UIComponent && WIDGET_COMPONENTS[_loc3_].tooltip != null)
            {
               UIComponent(_loc4_).toolTip = resourceManager.getString(BUNDLE,WIDGET_COMPONENTS[_loc3_].tooltip);
            }
            if(_loc4_ is InteractiveObject)
            {
               this.m_DragHandler.addDragComponent(InteractiveObject(_loc4_));
            }
            return _loc4_;
         }
         return null;
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         this.m_UICapacity = createInFontContext(TextField) as TextField;
         this.m_UICapacity.autoSize = TextFieldAutoSize.CENTER;
         this.m_UICapacity.defaultTextFormat = this.getCapacityTextFormat();
         this.m_UICapacity.filters = [new GlowFilter(0,1,2,2,4,BitmapFilterQuality.LOW,false,false)];
         this.m_UICapacity.selectable = false;
         this.m_UICapacity.text = this.getCapacityLabel();
         rawChildren.addChild(this.m_UICapacity);
         this.m_UIPurse = new CustomButton();
         this.m_UIPurse.styleName = getStyle(WIDGET_COMPONENTS[ContainerStorage.BODY_PURSE].style);
         if(WIDGET_COMPONENTS[ContainerStorage.BODY_PURSE].tooltip != null)
         {
            this.m_UIPurse.toolTip = resourceManager.getString(BUNDLE,WIDGET_COMPONENTS[ContainerStorage.BODY_PURSE].tooltip);
         }
         this.m_UIPurse.addEventListener(MouseEvent.CLICK,this.onPurseClick);
         rawChildren.addChild(this.m_UIPurse);
      }
      
      override protected function measure() : void
      {
         var _loc1_:EdgeMetrics = null;
         super.measure();
         _loc1_ = viewMetricsAndPadding;
         measuredMinWidth = measuredWidth = _loc1_.left + WIDGET_VIEW_WIDTH + _loc1_.right;
         measuredMinHeight = measuredHeight = _loc1_.top + WIDGET_VIEW_HEIGHT + _loc1_.bottom;
      }
      
      function get player() : Player
      {
         return this.m_Player;
      }
      
      private function onPurseClick(param1:MouseEvent) : void
      {
         var _loc2_:ContainerStorage = Tibia.s_GetContainerStorage();
         var _loc3_:Container = null;
         var _loc4_:AppearanceInstance = null;
         var _loc5_:AppearanceType = null;
         if(_loc2_ != null && (_loc3_ = _loc2_.getBodyContainer()) != null && (_loc4_ = _loc3_.getItemAt(ContainerStorage.BODY_PURSE - ContainerStorage.BODY_HEAD)) != null && (_loc5_ = _loc4_.type) != null)
         {
            new UseActionImpl(new Vector3D(65535,ContainerStorage.BODY_PURSE,0),_loc5_,0,UseActionImpl.TARGET_NEW_WINDOW).perform();
         }
      }
      
      private function getCapacityLabel() : String
      {
         var _loc1_:Number = NaN;
         if(this.m_Player != null)
         {
            _loc1_ = this.m_Player.getSkillValue(SKILL_CARRYSTRENGTH);
            return resourceManager.getString(BUNDLE,"LBL_CAPACITY_FORMAT",[Math.round(_loc1_ / 100)]);
         }
         return null;
      }
      
      private function onPlayerChange(param1:PropertyChangeEvent) : void
      {
         if(param1.property == "skill" || param1.property == "*")
         {
            this.m_UICapacity.text = this.getCapacityLabel();
            invalidateDisplayList();
         }
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc5_:int = 0;
         var _loc6_:UIComponent = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         super.updateDisplayList(param1,param2);
         var _loc3_:int = numChildren - 1;
         while(_loc3_ >= 0)
         {
            _loc5_ = this.indexToBodySlot(_loc3_);
            _loc6_ = UIComponent(getChildAt(_loc3_));
            _loc7_ = WIDGET_COMPONENTS[_loc5_].width;
            _loc8_ = WIDGET_COMPONENTS[_loc5_].height;
            if(isNaN(_loc7_))
            {
               _loc7_ = _loc6_.getExplicitOrMeasuredWidth();
            }
            if(isNaN(_loc8_))
            {
               _loc8_ = _loc6_.getExplicitOrMeasuredHeight();
            }
            _loc6_.visible = !(Boolean(widgetClosed) || Boolean(widgetCollapsed));
            _loc6_.move(WIDGET_COMPONENTS[_loc5_].left,WIDGET_COMPONENTS[_loc5_].top);
            _loc6_.setActualSize(_loc7_,_loc8_);
            _loc3_--;
         }
         var _loc4_:EdgeMetrics = viewMetricsAndPadding;
         this.m_UICapacity.visible = !(Boolean(widgetClosed) || Boolean(widgetCollapsed));
         this.m_UICapacity.x = _loc4_.left + WIDGET_COMPONENTS[0].left;
         this.m_UICapacity.y = _loc4_.top + WIDGET_COMPONENTS[0].top - 2;
         this.m_UICapacity.width = WIDGET_COMPONENTS[0].width;
         this.m_UICapacity.height = WIDGET_COMPONENTS[0].height;
         this.m_UIPurse.visible = !(Boolean(widgetClosed) || Boolean(widgetCollapsed));
         this.m_UIPurse.move(_loc4_.left + WIDGET_COMPONENTS[ContainerStorage.BODY_PURSE].left,_loc4_.top + WIDGET_COMPONENTS[ContainerStorage.BODY_PURSE].top);
         this.m_UIPurse.setActualSize(this.m_UIPurse.getExplicitOrMeasuredWidth(),this.m_UIPurse.getExplicitOrMeasuredHeight());
      }
      
      override function releaseInstance() : void
      {
         super.releaseInstance();
         this.m_UIPurse.removeEventListener(MouseEvent.CLICK,this.onPurseClick);
      }
   }
}
