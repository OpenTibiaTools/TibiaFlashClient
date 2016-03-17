package tibia.creatures
{
   import flash.events.EventDispatcher;
   import tibia.reporting.IReportable;
   import shared.utility.Colour;
   import tibia.appearances.AppearanceInstance;
   import mx.events.PropertyChangeEvent;
   import mx.events.PropertyChangeEventKind;
   import shared.utility.StringHelper;
   import tibia.creatures.battlelistWidgetClasses.BattlelistWidgetView;
   import tibia.reporting.reportType.Type;
   import shared.utility.Vector3D;
   import tibia.appearances.ns_appearance_internal;
   import tibia.network.Connection;
   
   public class Creature extends EventDispatcher implements IReportable
   {
      
      protected static const RENDERER_DEFAULT_HEIGHT:Number = MAP_WIDTH * FIELD_SIZE;
      
      protected static const STATE_PZ_BLOCK:int = 13;
      
      protected static const PK_REVENGE:int = 6;
      
      protected static const PARTY_MEMBER_SEXP_ACTIVE:int = 5;
      
      protected static const WAR_ALLY:int = 1;
      
      protected static const SKILL_FIGHTCLUB:int = 9;
      
      public static const MAX_DESCRIPTION_LENGHT:int = 128;
      
      protected static const PK_PARTYMODE:int = 2;
      
      protected static const FIELD_HEIGHT:int = 24;
      
      protected static const PARTY_MEMBER:int = 2;
      
      protected static const STATE_DRUNK:int = 3;
      
      protected static const SKILL_EXPERIENCE:int = 0;
      
      protected static const ONSCREEN_MESSAGE_HEIGHT:int = 195;
      
      protected static const TYPE_NPC:int = 2;
      
      protected static const SKILL_STAMINA:int = 16;
      
      protected static const STATE_NONE:int = -1;
      
      private static var s_SpeedB:Number = 1;
      
      protected static const PARTY_MEMBER_SEXP_INACTIVE_GUILTY:int = 7;
      
      protected static const SKILL_FIGHTSHIELD:int = 7;
      
      protected static const FIELD_SIZE:int = 32;
      
      protected static const WAR_NONE:int = 0;
      
      private static var s_SpeedA:Number = 0;
      
      protected static const SKILL_FIGHTDISTANCE:int = 8;
      
      protected static const PK_EXCPLAYERKILLER:int = 5;
      
      protected static const NUM_CREATURES:int = 1300;
      
      protected static const NUM_TRAPPERS:int = 8;
      
      protected static const SKILL_FED:int = 14;
      
      protected static const SKILL_MAGLEVEL:int = 2;
      
      protected static const SKILL_FISHING:int = 13;
      
      private static var s_SpeedC:Number = 1;
      
      protected static const PK_PLAYERKILLER:int = 4;
      
      protected static const STATE_BLEEDING:int = 15;
      
      protected static const GROUND_LAYER:int = 7;
      
      protected static const PROFESSION_MASK_KNIGHT:int = 1 << PROFESSION_KNIGHT;
      
      protected static const STATE_DAZZLED:int = 10;
      
      protected static const SKILL_NONE:int = -1;
      
      protected static const PROFESSION_NONE:int = 0;
      
      protected static const MAX_NAME_LENGTH:int = 29;
      
      protected static const PARTY_LEADER:int = 1;
      
      protected static const STATE_PZ_ENTERED:int = 14;
      
      protected static const PK_ATTACKER:int = 1;
      
      protected static const STATE_ELECTRIFIED:int = 2;
      
      protected static const SKILL_FIGHTSWORD:int = 10;
      
      protected static const SKILL_CARRYSTRENGTH:int = 6;
      
      protected static const STATE_DROWNING:int = 8;
      
      protected static const MAP_MIN_Y:int = 24576;
      
      protected static const MAP_MIN_Z:int = 0;
      
      protected static const MAP_MIN_X:int = 24576;
      
      protected static const RENDERER_MIN_HEIGHT:Number = Math.round(MAP_HEIGHT * 2 / 3 * FIELD_SIZE);
      
      protected static const RENDERER_MIN_WIDTH:Number = Math.round(MAP_WIDTH * 2 / 3 * FIELD_SIZE);
      
      protected static const MAP_WIDTH:int = 15;
      
      protected static const PARTY_MEMBER_SEXP_OFF:int = 3;
      
      protected static const PROFESSION_MASK_DRUID:int = 1 << PROFESSION_DRUID;
      
      protected static const PK_NONE:int = 0;
      
      protected static const PARTY_MEMBER_SEXP_INACTIVE_INNOCENT:int = 9;
      
      protected static const NUM_EFFECTS:int = 200;
      
      protected static const PROFESSION_SORCERER:int = 3;
      
      protected static const STATE_SLOW:int = 5;
      
      protected static const PARTY_NONE:int = 0;
      
      protected static const PROFESSION_MASK_SORCERER:int = 1 << PROFESSION_SORCERER;
      
      protected static const ONSCREEN_MESSAGE_WIDTH:int = 295;
      
      protected static const PROFESSION_MASK_NONE:int = 1 << PROFESSION_NONE;
      
      protected static const WAR_NEUTRAL:int = 3;
      
      protected static const WAR_ENEMY:int = 2;
      
      protected static const PARTY_LEADER_SEXP_INACTIVE_GUILTY:int = 8;
      
      protected static const PROFESSION_KNIGHT:int = 1;
      
      protected static const UNDERGROUND_LAYER:int = 2;
      
      protected static const FIELD_CACHESIZE:int = FIELD_SIZE;
      
      public static const MAX_NAME_LENGHT:int = 30;
      
      protected static const PROFESSION_PALADIN:int = 2;
      
      protected static const PLAYER_OFFSET_X:int = 8;
      
      protected static const PLAYER_OFFSET_Y:int = 6;
      
      protected static const SKILL_FIGHTAXE:int = 11;
      
      protected static const PARTY_LEADER_SEXP_OFF:int = 4;
      
      protected static const MAP_MAX_X:int = MAP_MIN_X + (1 << 14 - 1);
      
      protected static const MAP_MAX_Y:int = MAP_MIN_Y + (1 << 14 - 1);
      
      protected static const MAP_MAX_Z:int = 15;
      
      protected static const SKILL_SOULPOINTS:int = 15;
      
      protected static const NUM_ONSCREEN_MESSAGES:int = 16;
      
      protected static const STATE_FAST:int = 6;
      
      protected static const TYPE_PLAYER:int = 0;
      
      protected static const SKILL_HITPOINTS:int = 3;
      
      protected static const SKILL_OFFLINETRAINING:int = 17;
      
      protected static const MAP_HEIGHT:int = 11;
      
      protected static const STATE_MANA_SHIELD:int = 4;
      
      protected static const SKILL_MANA:int = 4;
      
      protected static const PROFESSION_MASK_PALADIN:int = 1 << PROFESSION_PALADIN;
      
      protected static const RENDERER_DEFAULT_WIDTH:Number = MAP_WIDTH * FIELD_SIZE;
      
      protected static const STATE_CURSED:int = 11;
      
      protected static const STATE_FREEZING:int = 9;
      
      private static const s_TempHealthColour:Colour = new Colour(0,0,0);
      
      protected static const PARTY_LEADER_SEXP_INACTIVE_INNOCENT:int = 10;
      
      protected static const NUM_FIELDS:int = MAPSIZE_Z * MAPSIZE_Y * MAPSIZE_X;
      
      protected static const TYPE_MONSTER:int = 1;
      
      protected static const STATE_POISONED:int = 0;
      
      protected static const STATE_BURNING:int = 1;
      
      protected static const SKILL_FIGHTFIST:int = 12;
      
      protected static const PK_AGGRESSOR:int = 3;
      
      protected static const MAPSIZE_W:int = 10;
      
      protected static const SKILL_LEVEL:int = 1;
      
      protected static const STATE_STRENGTHENED:int = 12;
      
      protected static const MAPSIZE_Z:int = 8;
      
      protected static const STATE_HUNGRY:int = 31;
      
      protected static const PROFESSION_MASK_ANY:int = PROFESSION_MASK_DRUID | PROFESSION_MASK_KNIGHT | PROFESSION_MASK_PALADIN | PROFESSION_MASK_SORCERER;
      
      protected static const MAPSIZE_X:int = MAP_WIDTH + 3;
      
      protected static const MAPSIZE_Y:int = MAP_HEIGHT + 3;
      
      protected static const PROFESSION_DRUID:int = 4;
      
      protected static const STATE_FIGHTING:int = 7;
      
      protected static const SKILL_GOSTRENGTH:int = 5;
      
      protected static const PARTY_LEADER_SEXP_ACTIVE:int = 6;
       
      protected var m_IsUnpassable:Boolean = false;
      
      protected var m_Direction:int = 0;
      
      protected var m_PartyFlag:int = 0;
      
      protected var m_PKFlag:int = 0;
      
      protected var m_MovementRunning:Boolean = false;
      
      protected var m_ID:int = 0;
      
      var m_Outfit:AppearanceInstance = null;
      
      protected var m_Name:String = null;
      
      protected var m_AnimationSpeed:Vector3D;
      
      protected var m_AnimationEnd:Number = 0;
      
      protected var m_Visible:Boolean = false;
      
      protected var m_WarFlag:int = 0;
      
      protected var m_Brightness:int = 0;
      
      var m_MountOutfit:AppearanceInstance = null;
      
      protected var m_AnimationDirection:int = 0;
      
      protected var m_PKEnd:int = 0;
      
      protected var m_LightColour:Colour;
      
      protected var m_Skills:Vector.<Number> = null;
      
      protected var m_MovementEnd:Number = 0;
      
      protected var m_AnimationDelta:Vector3D;
      
      protected var m_IsTrapper:Boolean = false;
      
      var m_MarkID:uint = 0;
      
      var m_Position:Vector3D;
      
      var m_MarkEnd:Number = 0;
      
      protected var m_KnownSince:int = -1;
      
      protected var m_Type:int = 1;
      
      public function Creature(param1:int = 0, param2:int = 1, param3:String = null)
      {
         this.m_AnimationDelta = new Vector3D();
         this.m_AnimationSpeed = new Vector3D();
         this.m_LightColour = new Colour(0,0,0);
         this.m_Position = new Vector3D();
         super();
         this.m_ID = param1;
         this.m_Type = param2;
         this.m_Name = param3;
         this.resetSkills();
      }
      
      public static function get speedA() : Number
      {
         return s_SpeedA;
      }
      
      public static function get speedB() : Number
      {
         return s_SpeedB;
      }
      
      public static function get speedC() : Number
      {
         return s_SpeedC;
      }
      
      public static function s_GetHealthColourARGB(param1:Number) : uint
      {
         if(param1 < 4)
         {
            s_TempHealthColour.setChannels(96,0,0);
         }
         else if(param1 < 10)
         {
            s_TempHealthColour.setChannels(192,0,0);
         }
         else if(param1 < 30)
         {
            s_TempHealthColour.setChannels(192,48,48);
         }
         else if(param1 < 60)
         {
            s_TempHealthColour.setChannels(192,192,0);
         }
         else if(param1 < 95)
         {
            s_TempHealthColour.setChannels(96,192,96);
         }
         else
         {
            s_TempHealthColour.setChannels(0,192,0);
         }
         return s_TempHealthColour.ARGB;
      }
      
      public static function set speedA(param1:Number) : void
      {
         s_SpeedA = param1;
      }
      
      public static function set speedC(param1:Number) : void
      {
         s_SpeedC = param1;
      }
      
      public static function set speedB(param1:Number) : void
      {
         s_SpeedB = param1;
      }
      
      public function get outfit() : AppearanceInstance
      {
         return this.m_Outfit;
      }
      
      public function set direction(param1:int) : void
      {
         this.m_Direction = param1;
      }
      
      public function set lightColour(param1:Colour) : void
      {
         this.m_LightColour = param1;
      }
      
      public function getSkillBase(param1:int) : Number
      {
         if(0 <= param1 && param1 < this.m_Skills.length)
         {
            return this.m_Skills[3 * param1 + 1];
         }
         return 0;
      }
      
      public function get pkFlag() : int
      {
         return this.m_PKFlag;
      }
      
      [Bindable(event="propertyChange")]
      public function set mountOutfit(param1:AppearanceInstance) : void
      {
         var _loc2_:Object = this.mountOutfit;
         if(_loc2_ !== param1)
         {
            this._1023992700mountOutfit = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mountOutfit",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set pkFlag(param1:int) : void
      {
         var _loc2_:Object = this.pkFlag;
         if(_loc2_ !== param1)
         {
            this._987493369pkFlag = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pkFlag",_loc2_,param1));
         }
      }
      
      public function setSkill(param1:int, param2:Number, param3:Number, param4:Number) : void
      {
         var _loc5_:PropertyChangeEvent = null;
         if(0 <= param1 && param1 < this.m_Skills.length)
         {
            this.m_Skills[3 * param1 + 0] = param2;
            this.m_Skills[3 * param1 + 1] = param3;
            this.m_Skills[3 * param1 + 2] = param4;
            _loc5_ = new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE);
            _loc5_.kind = PropertyChangeEventKind.UPDATE;
            _loc5_.property = "skill";
            dispatchEvent(_loc5_);
         }
      }
      
      public function get ID() : int
      {
         return this.m_ID;
      }
      
      [Bindable(event="propertyChange")]
      public function set name(param1:String) : void
      {
         var _loc2_:Object = this.name;
         if(_loc2_ !== param1)
         {
            this._3373707name = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"name",_loc2_,param1));
         }
      }
      
      public function get isHuman() : Boolean
      {
         return this.m_Type == TYPE_PLAYER;
      }
      
      private function set _3575610type(param1:int) : void
      {
         if(param1 != TYPE_PLAYER && param1 != TYPE_MONSTER && param1 != TYPE_NPC)
         {
            throw new ArgumentError("Creature.set type: Invalid creature type: " + param1 + ".");
         }
         this.m_Type = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function set outfit(param1:AppearanceInstance) : void
      {
         var _loc2_:Object = this.outfit;
         if(_loc2_ !== param1)
         {
            this._1005522429outfit = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"outfit",_loc2_,param1));
         }
      }
      
      public function getMovementSpeed() : int
      {
         var _loc1_:Number = this.getSkillValue(SKILL_GOSTRENGTH);
         if(_loc1_ <= -speedB)
         {
            return 0;
         }
         return Math.round(speedA * Math.log(_loc1_ + speedB) + speedC);
      }
      
      private function set _3373707name(param1:String) : void
      {
         this.m_Name = !!param1?param1.substr(0,MAX_NAME_LENGTH):null;
         if(Boolean(this.m_Name) && !this.isHuman)
         {
            this.m_Name = StringHelper.s_Capitalise(this.m_Name);
         }
      }
      
      public function get hitpointsPercent() : Number
      {
         return this.getSkillValue(SKILL_HITPOINTS);
      }
      
      private function set _1023992700mountOutfit(param1:AppearanceInstance) : void
      {
         var _loc2_:AppearanceInstance = null;
         var _loc3_:PropertyChangeEvent = null;
         if(this.m_MountOutfit != param1)
         {
            _loc2_ = this.m_MountOutfit;
            if(this.m_MountOutfit == null && this.m_Name != null)
            {
               BattlelistWidgetView.s_ClearCreatureCache(this.m_Name);
            }
            this.m_MountOutfit = param1;
            _loc3_ = new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE);
            _loc3_.kind = PropertyChangeEventKind.UPDATE;
            _loc3_.property = "mountOutfit";
            _loc3_.oldValue = _loc2_;
            _loc3_.newValue = this.m_MountOutfit;
            dispatchEvent(_loc3_);
         }
      }
      
      public function get hitpoints() : Number
      {
         return uint(this.getSkillValue(SKILL_HITPOINTS));
      }
      
      public function isReportTypeAllowed(param1:uint) : Boolean
      {
         return Boolean(this.isHuman) && (param1 == Type.REPORT_NAME || param1 == Type.REPORT_BOT);
      }
      
      public function get position() : Vector3D
      {
         return this.m_Position.clone();
      }
      
      public function get type() : int
      {
         return this.m_Type;
      }
      
      [Bindable(event="propertyChange")]
      public function get extendedMarkID() : uint
      {
         return this.m_MarkID >> 8 & 255;
      }
      
      function animateOutfit(param1:Number) : void
      {
         var _loc3_:Number = NaN;
         var _loc2_:Number = Math.max(Math.abs(this.m_AnimationDelta.x),Math.abs(this.m_AnimationDelta.y));
         _loc3_ = param1 - (this.m_AnimationEnd - this.m_AnimationSpeed.z);
         var _loc4_:Number = Math.max(0,Math.min(_loc3_ / this.m_AnimationSpeed.z,1));
         if(this.m_Outfit != null && this.m_Outfit.m_Type != null)
         {
            if(this.m_Outfit.m_Type.isAnimateAlways)
            {
               this.m_Outfit.animate(param1);
            }
            else if(!this.m_MovementRunning)
            {
               this.m_Outfit.ns_appearance_internal::m_Phase = 0;
            }
            else if(this.m_Outfit.m_Type.phases == 3)
            {
               this.m_Outfit.ns_appearance_internal::m_Phase = 1 + Math.floor(_loc2_ / 8) % (this.m_Outfit.m_Type.phases - 1);
            }
            else
            {
               this.m_Outfit.ns_appearance_internal::m_Phase = 1 + Math.floor(_loc4_ * (this.m_Outfit.m_Type.phases - 1));
            }
         }
         if(this.m_MountOutfit != null && this.m_MountOutfit.m_Type != null)
         {
            if(this.m_MountOutfit.m_Type.isAnimateAlways)
            {
               this.m_MountOutfit.animate(param1);
            }
            else if(!this.m_MovementRunning)
            {
               this.m_MountOutfit.ns_appearance_internal::m_Phase = 0;
            }
            else if(this.m_MountOutfit.m_Type.phases == 3)
            {
               this.m_MountOutfit.ns_appearance_internal::m_Phase = 1 + Math.floor(_loc2_ / 8) % (this.m_MountOutfit.m_Type.phases - 1);
            }
            else
            {
               this.m_MountOutfit.ns_appearance_internal::m_Phase = 1 + Math.floor(_loc4_ * (this.m_MountOutfit.m_Type.phases - 1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set ID(param1:int) : void
      {
         var _loc2_:Object = this.ID;
         if(_loc2_ !== param1)
         {
            this._2331ID = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ID",_loc2_,param1));
         }
      }
      
      public function get isTrapper() : Boolean
      {
         return this.m_IsTrapper;
      }
      
      public function get mana() : Number
      {
         return 0;
      }
      
      public function get isUnpassable() : Boolean
      {
         return this.m_IsUnpassable;
      }
      
      public function reset() : void
      {
         this.resetSkills();
         this.m_AnimationDelta.setZero();
         this.m_AnimationDirection = 0;
         this.m_AnimationEnd = 0;
         this.m_AnimationSpeed.setZero();
         this.m_Brightness = 0;
         this.m_Direction = 0;
         this.m_ID = 0;
         this.m_IsTrapper = false;
         this.m_IsUnpassable = false;
         this.m_KnownSince = -1;
         this.m_LightColour.setChannels(0,0,0);
         this.m_MovementEnd = 0;
         this.m_MovementRunning = false;
         if(this.m_Name != null)
         {
            BattlelistWidgetView.s_ClearCreatureCache(this.m_Name);
         }
         this.m_Name = null;
         this.m_PartyFlag = PARTY_NONE;
         this.m_PKEnd = 0;
         this.m_PKFlag = PK_NONE;
         this.m_Type = TYPE_MONSTER;
         this.m_Visible = false;
         this.m_WarFlag = WAR_NONE;
         this.m_MarkID = 0;
         this.m_MarkEnd = 0;
         this.m_MountOutfit = null;
         this.m_Outfit = null;
         this.m_Position.setZero();
      }
      
      public function set markID(param1:uint) : void
      {
         var _loc2_:int = this.markID;
         this.m_MarkID = this.m_MarkID & 4294967040 | param1 & 255;
         this.m_MarkEnd = Tibia.s_FrameTimestamp + 1000;
         var _loc3_:PropertyChangeEvent = new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE);
         _loc3_.kind = PropertyChangeEventKind.UPDATE;
         _loc3_.property = "extendedMarkID";
         _loc3_.oldValue = _loc2_;
         _loc3_.newValue = param1;
         dispatchEvent(_loc3_);
      }
      
      public function get brightness() : int
      {
         return this.m_Brightness;
      }
      
      public function startMovementAnimation(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:Connection = Tibia.s_GetConnection();
         if(_loc4_ == null || !(Boolean(_loc4_.isGameRunning) || Boolean(_loc4_.isPending)))
         {
            throw new Error("Creature.startMovementAnimation: Invalid state." + _loc4_ == null?"(connection is null)":"(State: " + _loc4_.connectionState + ")");
         }
         if(param1 > 0)
         {
            this.m_Direction = 1;
         }
         else if(param1 < 0)
         {
            this.m_Direction = 3;
         }
         else if(param2 < 0)
         {
            this.m_Direction = 0;
         }
         else if(param2 > 0)
         {
            this.m_Direction = 2;
         }
         this.m_AnimationDirection = this.m_Direction;
         this.m_AnimationDelta.x = -param1 * FIELD_SIZE;
         this.m_AnimationDelta.y = -param2 * FIELD_SIZE;
         this.m_AnimationDelta.z = 0;
         var _loc5_:Number = Math.max(1,this.getMovementSpeed());
         var _loc6_:Number = Math.floor(1000 * param3 / _loc5_);
         _loc6_ = Math.ceil(_loc6_ / _loc4_.beatDuration) * _loc4_.beatDuration;
         this.m_AnimationSpeed.x = -param1 * FIELD_SIZE;
         this.m_AnimationSpeed.y = -param2 * FIELD_SIZE;
         this.m_AnimationSpeed.z = _loc6_;
         this.m_AnimationEnd = Tibia.s_FrameTimestamp + _loc6_;
         if(param1 != 0 && param2 != 0)
         {
            _loc6_ = Math.floor(1000 * param3 * 3 / _loc5_);
         }
         this.m_MovementEnd = Tibia.s_FrameTimestamp + _loc6_;
         this.m_MovementRunning = true;
      }
      
      private function set _1786401934partyFlag(param1:int) : void
      {
         if(param1 < PARTY_NONE || param1 > PARTY_LEADER_SEXP_INACTIVE_INNOCENT)
         {
            throw new ArgumentError("Creature.set partyFlag: Invalid flag.");
         }
         this.m_PartyFlag = param1;
      }
      
      public function get characterName() : String
      {
         return this.m_Name;
      }
      
      public function set earliestMoveTime(param1:Number) : void
      {
         this.m_MovementEnd = param1;
      }
      
      private function set _106691808pkEnd(param1:int) : void
      {
         this.m_PKEnd = param1;
      }
      
      function set knownSince(param1:int) : void
      {
         this.m_KnownSince = param1;
      }
      
      public function resetSkills() : void
      {
         this.m_Skills = new Vector.<Number>((Math.max(SKILL_HITPOINTS,SKILL_GOSTRENGTH) + 1) * 3,true);
         var _loc1_:int = 0;
         while(_loc1_ < this.m_Skills.length)
         {
            this.m_Skills[_loc1_ + 0] = 0;
            this.m_Skills[_loc1_ + 1] = 0;
            this.m_Skills[_loc1_ + 2] = 0;
            _loc1_ = _loc1_ + 3;
         }
      }
      
      public function get partyFlag() : int
      {
         return this.m_PartyFlag;
      }
      
      public function get warFlag() : int
      {
         return this.m_WarFlag;
      }
      
      private function set _1123256948warFlag(param1:int) : void
      {
         if(param1 < WAR_NONE || param1 > WAR_NEUTRAL)
         {
            throw new ArgumentError("Creature.set warFlag: Invalid flag.");
         }
         this.m_WarFlag = param1;
      }
      
      function get visible() : Boolean
      {
         return this.m_Visible;
      }
      
      public function get mountOutfit() : AppearanceInstance
      {
         return this.m_MountOutfit;
      }
      
      public function get direction() : int
      {
         return !!this.m_MovementRunning?int(this.m_AnimationDirection):int(this.m_Direction);
      }
      
      public function set extendedMarkID(param1:uint) : void
      {
         var _loc2_:int = this.extendedMarkID;
         this.m_MarkID = this.m_MarkID & 255 | param1 << 8;
         var _loc3_:PropertyChangeEvent = new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE);
         _loc3_.kind = PropertyChangeEventKind.UPDATE;
         _loc3_.property = "extendedMarkID";
         _loc3_.oldValue = _loc2_;
         _loc3_.newValue = param1;
         dispatchEvent(_loc3_);
      }
      
      public function get name() : String
      {
         return this.m_Name;
      }
      
      public function get lightColour() : Colour
      {
         return this.m_LightColour;
      }
      
      public function set isTrapper(param1:Boolean) : void
      {
         this.m_IsTrapper = param1;
      }
      
      public function get animationDelta() : Vector3D
      {
         return this.m_AnimationDelta;
      }
      
      public function getPositionZ() : int
      {
         return this.m_Position.z;
      }
      
      public function set isUnpassable(param1:Boolean) : void
      {
         this.m_IsUnpassable = param1;
      }
      
      public function getSkillValue(param1:int) : Number
      {
         if(0 <= param1 && param1 < this.m_Skills.length)
         {
            return this.m_Skills[3 * param1 + 0];
         }
         return 0;
      }
      
      public function getPosition(param1:Vector3D = null) : Vector3D
      {
         if(param1 == null)
         {
            return this.m_Position.clone();
         }
         param1.x = this.m_Position.x;
         param1.y = this.m_Position.y;
         param1.z = this.m_Position.z;
         return param1;
      }
      
      [Bindable(event="propertyChange")]
      public function set type(param1:int) : void
      {
         var _loc2_:Object = this.type;
         if(_loc2_ !== param1)
         {
            this._3575610type = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"type",_loc2_,param1));
         }
      }
      
      public function set brightness(param1:int) : void
      {
         this.m_Brightness = param1;
      }
      
      public function setSkillValue(param1:int, param2:Number) : void
      {
         var _loc3_:PropertyChangeEvent = null;
         if(0 <= param1 && param1 < this.m_Skills.length)
         {
            this.m_Skills[3 * param1 + 0] = param2;
            _loc3_ = new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE);
            _loc3_.kind = PropertyChangeEventKind.UPDATE;
            _loc3_.property = "skill";
            dispatchEvent(_loc3_);
         }
      }
      
      public function setPosition(param1:int, param2:int, param3:int) : void
      {
         this.m_Position.x = param1;
         this.m_Position.y = param2;
         this.m_Position.z = param3;
      }
      
      [Bindable(event="propertyChange")]
      public function get markID() : uint
      {
         return this.m_MarkID & 255;
      }
      
      function animateMovement(param1:Number) : void
      {
         var _loc2_:Number = NaN;
         this.m_AnimationDelta.setZero();
         if(this.m_MovementRunning)
         {
            _loc2_ = param1 - (this.m_AnimationEnd - this.m_AnimationSpeed.z);
            if(_loc2_ <= 0)
            {
               this.m_AnimationDelta.x = this.m_AnimationSpeed.x;
               this.m_AnimationDelta.y = this.m_AnimationSpeed.y;
            }
            else if(_loc2_ >= this.m_AnimationSpeed.z)
            {
               this.m_AnimationDelta.x = 0;
               this.m_AnimationDelta.y = 0;
            }
            else if(this.m_AnimationSpeed.z != 0)
            {
               this.m_AnimationDelta.x = this.m_AnimationSpeed.x - Math.round(this.m_AnimationSpeed.x * _loc2_ / this.m_AnimationSpeed.z);
               this.m_AnimationDelta.y = this.m_AnimationSpeed.y - Math.round(this.m_AnimationSpeed.y * _loc2_ / this.m_AnimationSpeed.z);
            }
         }
         this.m_MovementRunning = param1 < this.m_MovementEnd || this.m_AnimationDelta.x != 0 || this.m_AnimationDelta.y != 0;
      }
      
      public function get earliestMoveTime() : Number
      {
         return this.m_MovementEnd;
      }
      
      private function set _2331ID(param1:int) : void
      {
         this.m_ID = param1;
      }
      
      public function stopMovementAnimation() : void
      {
         this.m_AnimationDirection = this.m_Direction;
         this.m_AnimationDelta.setZero();
         this.m_AnimationSpeed.setZero();
         this.m_AnimationEnd = 0;
         this.m_MovementEnd = 0;
         this.m_MovementRunning = false;
      }
      
      function get knownSince() : int
      {
         return this.m_KnownSince;
      }
      
      [Bindable(event="propertyChange")]
      public function set pkEnd(param1:int) : void
      {
         var _loc2_:Object = this.pkEnd;
         if(_loc2_ !== param1)
         {
            this._106691808pkEnd = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pkEnd",_loc2_,param1));
         }
      }
      
      public function get markEnd() : Number
      {
         return this.m_MarkEnd;
      }
      
      private function set _987493369pkFlag(param1:int) : void
      {
         if(param1 < PK_NONE || param1 > PK_REVENGE)
         {
            throw new ArgumentError("Creature.set pkFlag: Invalid flag.");
         }
         this.m_PKFlag = param1;
      }
      
      private function set _1005522429outfit(param1:AppearanceInstance) : void
      {
         if(this.m_Outfit != param1)
         {
            if(this.m_Name != null)
            {
               BattlelistWidgetView.s_ClearCreatureCache(this.m_Name);
            }
            this.m_Outfit = param1;
         }
      }
      
      public function get pkEnd() : int
      {
         return this.m_PKEnd;
      }
      
      function set visible(param1:Boolean) : void
      {
         this.m_Visible = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function set partyFlag(param1:int) : void
      {
         var _loc2_:Object = this.partyFlag;
         if(_loc2_ !== param1)
         {
            this._1786401934partyFlag = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"partyFlag",_loc2_,param1));
         }
      }
      
      public function getSkillProgress(param1:int) : Number
      {
         if(0 <= param1 && param1 < this.m_Skills.length)
         {
            return this.m_Skills[3 * param1 + 2];
         }
         return 0;
      }
      
      [Bindable(event="propertyChange")]
      public function set warFlag(param1:int) : void
      {
         var _loc2_:Object = this.warFlag;
         if(_loc2_ !== param1)
         {
            this._1123256948warFlag = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"warFlag",_loc2_,param1));
         }
      }
      
      public function setReportTypeAllowed(param1:uint, param2:Boolean = true) : void
      {
      }
      
      public function get manaPercent() : Number
      {
         return 100;
      }
   }
}
