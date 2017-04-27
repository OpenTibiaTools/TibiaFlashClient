﻿package tibia.magic.spellListWidgetClasses
{
    import flash.events.*;
    import mx.collections.*;
    import mx.containers.*;
    import mx.controls.*;
    import mx.controls.listClasses.*;
    import mx.core.*;
    import mx.events.*;
    import shared.controls.*;
    import shared.utility.*;
    import tibia.creatures.*;
    import tibia.magic.*;
    import tibia.sidebar.sideBarWidgetClasses.*;

    public class SpellListWidgetView extends WidgetView
    {
        private var m_Player:Player = null;
        private var m_UncommittedFilterGroup:Boolean = true;
        private var m_SortMode:int;
        private var m_UncommittedFilterLevel:Boolean = true;
        private var m_LayoutMode:int;
        private var m_UIConstructed:Boolean = false;
        private var m_UncommittedFilterPremium:Boolean = true;
        private var m_UIInfoName:Label = null;
        private var m_UIInfoPrice:Label = null;
        private var m_UIInfoPremium:Label = null;
        private var m_FilterProfession:int = -1;
        private var m_UIQuickProfession:Button = null;
        private var m_UIRootBar:TabBar = null;
        private var m_FilterPremium:int = -1;
        private var m_UncommittedPlayer:Boolean = false;
        private var m_UIInfoFormula:Label = null;
        private var m_UIFilterProfession:RadioButtonGroup = null;
        private var m_UIViewContainer:VBox = null;
        private var m_UIFilterGroup:RadioButtonGroup = null;
        private var m_UIView:ListBase = null;
        private var m_UIInfoDelay:Label = null;
        private var m_UIInfoLevel:Label = null;
        private var m_UIInfoGroup:Label = null;
        private var m_UIInfoProfession:Label = null;
        private var m_UncommittedSortMode:Boolean = false;
        private var m_UncommittedSpell:int = 0;
        private var m_UIViewToggle:Button = null;
        private var m_UIQuickKnown:Button = null;
        private var m_Spell:Spell = null;
        private var m_UIFilterPremium:RadioButtonGroup = null;
        private var m_FilterKnown:int = -1;
        private var m_SpellsView:ArrayCollection = null;
        private var m_UncommittedFilterProfession:Boolean = true;
        private var m_UIRootStack:ViewStack = null;
        private var m_UIInfoType:Label = null;
        private var m_UIInfoCast:Label = null;
        private var m_InvalidatedSort:Boolean = false;
        private var m_UncommittedFilterKnown:Boolean = true;
        private var m_UIQuickLevel:Button = null;
        private var m_UncommittedLayoutMode:Boolean = false;
        private var m_InvalidatedFilter:Boolean = false;
        private var m_FilterGroup:int = -1;
        private var m_FilterLevel:int = -1;
        static const BLESSING_SPARK_OF_PHOENIX:int = BLESSING_WISDOM_OF_SOLITUDE << 1;
        static const PARTY_LEADER_SEXP_ACTIVE:int = 6;
        static const PARTY_MAX_FLASHING_TIME:uint = 5000;
        static const STATE_PZ_BLOCK:int = 13;
        static const PARTY_MEMBER_SEXP_ACTIVE:int = 5;
        static const PK_REVENGE:int = 6;
        static const SKILL_FIGHTCLUB:int = 10;
        static const NPC_SPEECH_TRAVEL:uint = 5;
        static const RISKINESS_DANGEROUS:int = 1;
        static const NUM_PVP_HELPERS_FOR_RISKINESS_DANGEROUS:uint = 5;
        static const PK_PARTYMODE:int = 2;
        static const RISKINESS_NONE:int = 0;
        static const GUILD_NONE:int = 0;
        static const GROUP_ATTACK:int = 1;
        static const PARTY_MEMBER:int = 2;
        static const STATE_DRUNK:int = 3;
        static const PARTY_OTHER:int = 11;
        static const SKILL_EXPERIENCE:int = 0;
        static const TYPE_NPC:int = 2;
        static const BLESSING_FIRE_OF_SUNS:int = BLESSING_SPARK_OF_PHOENIX << 1;
        static const SKILL_STAMINA:int = 17;
        static const STATE_NONE:int = -1;
        static const PARTY_MEMBER_SEXP_INACTIVE_GUILTY:int = 7;
        static const SKILL_FIGHTSHIELD:int = 8;
        static const SKILL_MANA_LEECH_CHANCE:int = 23;
        static const GROUP_POWERSTRIKES:int = 4;
        static const SKILL_FIGHTDISTANCE:int = 9;
        static const PK_EXCPLAYERKILLER:int = 5;
        static const NUM_CREATURES:int = 1300;
        static const NUM_TRAPPERS:int = 8;
        static const SKILL_FED:int = 15;
        static const SKILL_MAGLEVEL:int = 2;
        static const SKILL_FISHING:int = 14;
        static const SKILL_HITPOINTS_PERCENT:int = 3;
        static const STATE_BLEEDING:int = 15;
        static const PK_PLAYERKILLER:int = 4;
        static const PROFESSION_MASK_KNIGHT:int = 1 << PROFESSION_KNIGHT;
        static const STATE_DAZZLED:int = 10;
        static const SUMMON_OTHERS:int = 2;
        static const SKILL_NONE:int = -1;
        static const NPC_SPEECH_TRADER:uint = 2;
        private static const BUNDLE:String = "SpellListWidget";
        static const GUILD_MEMBER:int = 4;
        static const PROFESSION_NONE:int = 0;
        static const BLESSING_BLOOD_OF_THE_MOUNTAIN:int = BLESSING_HEART_OF_THE_MOUNTAIN << 1;
        static const MAX_NAME_LENGTH:int = 29;
        static const PARTY_LEADER:int = 1;
        static const SKILL_CARRYSTRENGTH:int = 7;
        static const STATE_PZ_ENTERED:int = 14;
        static const PK_ATTACKER:int = 1;
        static const STATE_ELECTRIFIED:int = 2;
        static const SKILL_FIGHTSWORD:int = 11;
        static const GUILD_WAR_NEUTRAL:int = 3;
        static const STATE_DROWNING:int = 8;
        static const BLESSING_HEART_OF_THE_MOUNTAIN:int = BLESSING_EMBRACE_OF_TIBIA << 1;
        static const SKILL_LIFE_LEECH_AMOUNT:int = 22;
        static const PARTY_MEMBER_SEXP_OFF:int = 3;
        static const PROFESSION_MASK_DRUID:int = 1 << PROFESSION_DRUID;
        static const PARTY_MEMBER_SEXP_INACTIVE_INNOCENT:int = 9;
        static const GUILD_WAR_ALLY:int = 1;
        static const PK_NONE:int = 0;
        static const GROUP_HEALING:int = 2;
        static const PROFESSION_SORCERER:int = 3;
        static const STATE_SLOW:int = 5;
        static const PARTY_NONE:int = 0;
        static const SKILL_CRITICAL_HIT_CHANCE:int = 19;
        static const SUMMON_OWN:int = 1;
        static const GROUP_NONE:int = 0;
        static const TYPE_NONE:int = 0;
        static const TYPE_RUNE:int = 2;
        static const SKILL_EXPERIENCE_GAIN:int = -2;
        static const PROFESSION_MASK_NONE:int = 1 << PROFESSION_NONE;
        static const PROFESSION_MASK_SORCERER:int = 1 << PROFESSION_SORCERER;
        static const PROFESSION_KNIGHT:int = 1;
        static const NPC_SPEECH_QUESTTRADER:uint = 4;
        static const PARTY_LEADER_SEXP_INACTIVE_GUILTY:int = 8;
        static const BLESSING_WISDOM_OF_SOLITUDE:int = BLESSING_TWIST_OF_FATE << 1;
        static const PROFESSION_PALADIN:int = 2;
        static const SKILL_FIGHTAXE:int = 12;
        static const SKILL_CRITICAL_HIT_DAMAGE:int = 20;
        static const PARTY_LEADER_SEXP_OFF:int = 4;
        static const SKILL_SOULPOINTS:int = 16;
        static const BLESSING_EMBRACE_OF_TIBIA:int = BLESSING_SPIRITUAL_SHIELDING << 1;
        static const STATE_FAST:int = 6;
        static const BLESSING_TWIST_OF_FATE:int = BLESSING_ADVENTURER << 1;
        static const SKILL_MANA_LEECH_AMOUNT:int = 24;
        static const BLESSING_NONE:int = 0;
        static const GUILD_OTHER:int = 5;
        static const TYPE_PLAYER:int = 0;
        static const SKILL_HITPOINTS:int = 4;
        static const SKILL_OFFLINETRAINING:int = 18;
        static const STATE_MANA_SHIELD:int = 4;
        static const SKILL_MANA:int = 5;
        static const PROFESSION_MASK_PALADIN:int = 1 << PROFESSION_PALADIN;
        static const STATE_CURSED:int = 11;
        static const BLESSING_ADVENTURER:int = 1;
        static const STATE_FREEZING:int = 9;
        static const PARTY_LEADER_SEXP_INACTIVE_INNOCENT:int = 10;
        static const STATE_POISONED:int = 0;
        static const SKILL_LIFE_LEECH_CHANCE:int = 21;
        static const TYPE_MONSTER:int = 1;
        static const TYPE_INSTANT:int = 1;
        static const STATE_BURNING:int = 1;
        static const SKILL_FIGHTFIST:int = 13;
        static const GROUP_SUPPORT:int = 3;
        static const PK_AGGRESSOR:int = 3;
        static const GUILD_WAR_ENEMY:int = 2;
        static const SKILL_LEVEL:int = 1;
        static const STATE_STRENGTHENED:int = 12;
        static const STATE_HUNGRY:int = 31;
        static const PROFESSION_MASK_ANY:int = PROFESSION_MASK_DRUID | PROFESSION_MASK_KNIGHT | PROFESSION_MASK_PALADIN | PROFESSION_MASK_SORCERER;
        static const SUMMON_NONE:int = 0;
        static const PROFESSION_DRUID:int = 4;
        static const STATE_FIGHTING:int = 7;
        static const NPC_SPEECH_QUEST:uint = 3;
        static const NPC_SPEECH_NORMAL:uint = 1;
        static const TYPE_PLAYERSUMMON:int = 3;
        static const BLESSING_SPIRITUAL_SHIELDING:int = BLESSING_FIRE_OF_SUNS << 1;
        static const NPC_SPEECH_NONE:uint = 0;
        static const PK_MAX_FLASHING_TIME:uint = 5000;
        static const SKILL_GOSTRENGTH:int = 6;

        public function SpellListWidgetView()
        {
            this.m_LayoutMode = SpellListWidget.LAYOUT_LIST;
            this.m_SortMode = SpellListWidget.SORT_NAME;
            horizontalScrollPolicy = ScrollPolicy.OFF;
            verticalScrollPolicy = ScrollPolicy.OFF;
            maxHeight = int.MAX_VALUE;
            titleText = resourceManager.getString(BUNDLE, "TITLE");
            var _loc_1:* = new Sort();
            _loc_1.compareFunction = this.compareSpell;
            this.m_SpellsView = new ArrayCollection();
            this.m_SpellsView.filterFunction = this.filterSpell;
            this.m_SpellsView.sort = _loc_1;
            this.m_SpellsView.source = SpellStorage.SPELLS;
            this.m_SpellsView.refresh();
            return;
        }// end function

        private function compareSpellGroup(param1:int, param2:int) : int
        {
            if (param1 == GROUP_ATTACK)
            {
                if (param2 == GROUP_ATTACK)
                {
                    return 0;
                }
                if (param2 == GROUP_HEALING)
                {
                    return -1;
                }
                return -1;
            }
            else if (param1 == GROUP_HEALING)
            {
                if (param2 == GROUP_ATTACK)
                {
                    return 1;
                }
                if (param2 == GROUP_HEALING)
                {
                    return 0;
                }
                return -1;
            }
            else
            {
                if (param2 == GROUP_ATTACK)
                {
                    return 1;
                }
                if (param2 == GROUP_HEALING)
                {
                    return 1;
                }
                return 0;
            }
        }// end function

        private function updateView(param1:ListBase) : ListBase
        {
            var _loc_2:* = null;
            var _loc_3:* = null;
            if (this.layoutMode == SpellListWidget.LAYOUT_LIST)
            {
                _loc_3 = new ClassFactory();
                _loc_3.generator = SpellListRenderer;
                _loc_3.properties = {player:this.player};
                _loc_2 = new CustomList();
                _loc_2.itemRenderer = _loc_3;
                _loc_2.setStyle("backgroundAlpha", 0.5);
                _loc_2.setStyle("backgroundColor", undefined);
                _loc_2.setStyle("alternatingItemAlphas", [0.5, 0.5]);
                _loc_2.setStyle("alternatingItemColors", [2768716, 1977654]);
                _loc_2.setStyle("rollOverColor", undefined);
                _loc_2.setStyle("selectionColor", undefined);
                _loc_2.setStyle("paddingBottom", 1);
                _loc_2.setStyle("paddingTop", 1);
            }
            else
            {
                _loc_3 = new ClassFactory();
                _loc_3.generator = SpellTileRenderer;
                _loc_3.properties = {height:36, width:36, horizontalScrollPolicy:ScrollPolicy.OFF, verticalScrollPolicy:ScrollPolicy.OFF, player:this.player, styleName:{paddingLeft:1, paddingRight:1, paddingTop:1, paddingBottom:1}};
                _loc_2 = new CustomTileList();
                _loc_2.columnCount = 4;
                _loc_2.columnWidth = _loc_3.properties.width;
                _loc_2.itemRenderer = _loc_3;
                _loc_2.rowHeight = _loc_3.properties.height;
                _loc_2.setStyle("backgroundColor", 0);
                _loc_2.setStyle("backgroundAlpha", 0);
                _loc_2.setStyle("borderAlpha", 0);
                _loc_2.setStyle("borderColor", 0);
                _loc_2.setStyle("borderStyle", "none");
                _loc_2.setStyle("borderThickness", 0);
                _loc_2.setStyle("paddingBottom", 0);
                _loc_2.setStyle("paddingTop", 0);
            }
            if (param1 != null)
            {
                param1.dataProvider = null;
                param1.removeEventListener(ListEvent.CHANGE, this.onViewSelectionChange);
                param1.removeEventListener(MouseEvent.MOUSE_DOWN, this.onViewDisableDragScrolling);
                replaceChild(param1, _loc_2);
            }
            _loc_2.dataProvider = this.m_SpellsView;
            _loc_2.percentHeight = 100;
            _loc_2.percentWidth = 100;
            _loc_2.verticalScrollPolicy = ScrollPolicy.ON;
            _loc_2.addEventListener(MouseEvent.MOUSE_DOWN, this.onViewDisableDragScrolling, false, (EventPriority.DEFAULT - 1), false);
            _loc_2.addEventListener(ListEvent.CHANGE, this.onViewSelectionChange);
            return _loc_2;
        }// end function

        override protected function createChildren() : void
        {
            var _loc_1:* = null;
            var _loc_2:* = null;
            var _loc_3:* = null;
            var _loc_4:* = null;
            var _loc_5:* = null;
            var _loc_6:* = null;
            if (!this.m_UIConstructed)
            {
                super.createChildren();
                this.m_UIViewContainer = new VBox();
                this.m_UIViewContainer.percentHeight = 100;
                this.m_UIViewContainer.percentWidth = 100;
                this.m_UIViewContainer.label = resourceManager.getString(BUNDLE, "ROOT_VIEW");
                this.m_UIViewContainer.addEventListener(MouseEvent.RIGHT_CLICK, this.onViewContextMenu);
                this.m_UIViewContainer.setStyle("verticalGap", 2);
                _loc_1 = new HBox();
                _loc_1.percentWidth = 100;
                _loc_1.setStyle("horizontalGap", 2);
                this.m_UIQuickProfession = new CustomButton();
                this.m_UIQuickProfession.label = resourceManager.getString(BUNDLE, "BTN_MY_PROFESSION");
                this.m_UIQuickProfession.toggle = true;
                this.m_UIQuickProfession.addEventListener(MouseEvent.CLICK, this.onQuickFilterToggle, false, (EventPriority.DEFAULT + 1), false);
                this.m_UIQuickProfession.setStyle("fontSize", 9);
                this.m_UIQuickProfession.setStyle("paddingLeft", 2);
                this.m_UIQuickProfession.setStyle("paddingRight", 2);
                _loc_1.addChild(this.m_UIQuickProfession);
                this.m_UIQuickLevel = new CustomButton();
                this.m_UIQuickLevel.label = resourceManager.getString(BUNDLE, "BTN_MY_LEVEL");
                this.m_UIQuickLevel.toggle = true;
                this.m_UIQuickLevel.addEventListener(MouseEvent.CLICK, this.onQuickFilterToggle);
                this.m_UIQuickLevel.setStyle("fontSize", 9);
                this.m_UIQuickLevel.setStyle("paddingLeft", 2);
                this.m_UIQuickLevel.setStyle("paddingRight", 2);
                _loc_1.addChild(this.m_UIQuickLevel);
                this.m_UIQuickKnown = new CustomButton();
                this.m_UIQuickKnown.label = resourceManager.getString(BUNDLE, "BTN_MY_KNOWN");
                this.m_UIQuickKnown.toggle = true;
                this.m_UIQuickKnown.addEventListener(MouseEvent.CLICK, this.onQuickFilterToggle);
                this.m_UIQuickKnown.setStyle("fontSize", 9);
                this.m_UIQuickKnown.setStyle("paddingLeft", 2);
                this.m_UIQuickKnown.setStyle("paddingRight", 2);
                _loc_1.addChild(this.m_UIQuickKnown);
                _loc_2 = new Spacer();
                _loc_2.percentWidth = 100;
                _loc_1.addChild(_loc_2);
                this.m_UIViewToggle = new CustomButton();
                this.m_UIViewToggle.styleName = "spellListWidgetViewToggle";
                this.m_UIViewToggle.toggle = true;
                this.m_UIViewToggle.addEventListener(MouseEvent.CLICK, this.onViewToggle);
                _loc_1.addChild(this.m_UIViewToggle);
                this.m_UIViewContainer.addChild(_loc_1);
                _loc_3 = new HRule();
                _loc_3.percentWidth = 100;
                this.m_UIViewContainer.addChild(_loc_3);
                this.m_UIView = this.updateView(null);
                this.m_UIViewContainer.addChild(this.m_UIView);
                _loc_3 = new HRule();
                _loc_3.percentWidth = 100;
                this.m_UIViewContainer.addChild(_loc_3);
                _loc_4 = new Form();
                _loc_4.percentWidth = 100;
                _loc_4.styleName = "spellListWidgetForm";
                this.m_UIInfoName = this.createInfoLabel(_loc_4, resourceManager.getString(BUNDLE, "FRM_ITEM_NAME"));
                this.m_UIInfoFormula = this.createInfoLabel(_loc_4, resourceManager.getString(BUNDLE, "FRM_ITEM_FORMULA"));
                this.m_UIInfoProfession = this.createInfoLabel(_loc_4, resourceManager.getString(BUNDLE, "FRM_ITEM_PROFESSION"));
                this.m_UIInfoGroup = this.createInfoLabel(_loc_4, resourceManager.getString(BUNDLE, "FRM_ITEM_GROUP"));
                this.m_UIInfoType = this.createInfoLabel(_loc_4, resourceManager.getString(BUNDLE, "FRM_ITEM_TYPE"));
                this.m_UIInfoDelay = this.createInfoLabel(_loc_4, resourceManager.getString(BUNDLE, "FRM_ITEM_DELAY"));
                this.m_UIInfoCast = this.createInfoLabel(_loc_4, resourceManager.getString(BUNDLE, "FRM_ITEM_CAST"));
                this.m_UIInfoLevel = this.createInfoLabel(_loc_4, resourceManager.getString(BUNDLE, "FRM_ITEM_LEVEL"));
                this.m_UIInfoPrice = this.createInfoLabel(_loc_4, resourceManager.getString(BUNDLE, "FRM_ITEM_PRICE"));
                this.m_UIInfoPremium = this.createInfoLabel(_loc_4, resourceManager.getString(BUNDLE, "FRM_ITEM_PREMIUM"));
                this.m_UIViewContainer.addChild(_loc_4);
                _loc_5 = new VBox();
                _loc_5.percentHeight = 100;
                _loc_5.percentWidth = 100;
                _loc_5.label = resourceManager.getString(BUNDLE, "ROOT_FILTER");
                _loc_5.setStyle("horizontalAlign", "center");
                _loc_4 = new Form();
                _loc_4.styleName = "spellListWidgetForm";
                _loc_4.setStyle("paddingBottom", 0);
                _loc_4.setStyle("paddingTop", 0);
                _loc_4.setStyle("verticalGap", 0);
                _loc_6 = new FormHeading();
                _loc_6.label = resourceManager.getString(BUNDLE, "FRM_ITEM_PROFESSION");
                _loc_4.addChild(_loc_6);
                this.m_UIFilterProfession = new RadioButtonGroup();
                this.m_UIFilterProfession.addEventListener(ItemClickEvent.ITEM_CLICK, this.onDetailFilterChange);
                this.createFilterRadioButton(_loc_4, this.m_UIFilterProfession, this.formatSpellProfessionMask(-1), -1);
                this.createFilterRadioButton(_loc_4, this.m_UIFilterProfession, this.formatSpellProfessionMask(PROFESSION_MASK_DRUID), PROFESSION_DRUID);
                this.createFilterRadioButton(_loc_4, this.m_UIFilterProfession, this.formatSpellProfessionMask(PROFESSION_MASK_KNIGHT), PROFESSION_KNIGHT);
                this.createFilterRadioButton(_loc_4, this.m_UIFilterProfession, this.formatSpellProfessionMask(PROFESSION_MASK_PALADIN), PROFESSION_PALADIN);
                this.createFilterRadioButton(_loc_4, this.m_UIFilterProfession, this.formatSpellProfessionMask(PROFESSION_MASK_SORCERER), PROFESSION_SORCERER);
                _loc_6 = new FormHeading();
                _loc_6.label = resourceManager.getString(BUNDLE, "FRM_ITEM_GROUP");
                _loc_4.addChild(_loc_6);
                this.m_UIFilterGroup = new RadioButtonGroup();
                this.m_UIFilterGroup.addEventListener(ItemClickEvent.ITEM_CLICK, this.onDetailFilterChange);
                this.createFilterRadioButton(_loc_4, this.m_UIFilterGroup, this.formatSpellGroup(-1), -1);
                this.createFilterRadioButton(_loc_4, this.m_UIFilterGroup, this.formatSpellGroup(GROUP_ATTACK), GROUP_ATTACK);
                this.createFilterRadioButton(_loc_4, this.m_UIFilterGroup, this.formatSpellGroup(GROUP_HEALING), GROUP_HEALING);
                this.createFilterRadioButton(_loc_4, this.m_UIFilterGroup, this.formatSpellGroup(GROUP_SUPPORT), GROUP_SUPPORT);
                _loc_6 = new FormHeading();
                _loc_6.label = resourceManager.getString(BUNDLE, "FRM_ITEM_PREMIUM");
                _loc_4.addChild(_loc_6);
                this.m_UIFilterPremium = new RadioButtonGroup();
                this.m_UIFilterPremium.addEventListener(ItemClickEvent.ITEM_CLICK, this.onDetailFilterChange);
                this.createFilterRadioButton(_loc_4, this.m_UIFilterPremium, resourceManager.getString(BUNDLE, "FRM_LABEL_PREMIUM_ANY"), -1);
                this.createFilterRadioButton(_loc_4, this.m_UIFilterPremium, resourceManager.getString(BUNDLE, "FRM_LABEL_PREMIUM_NO"), 0);
                this.createFilterRadioButton(_loc_4, this.m_UIFilterPremium, resourceManager.getString(BUNDLE, "FRM_LABEL_PREMIUM_YES"), 1);
                _loc_5.addChild(_loc_4);
                this.m_UIRootStack = new ViewStack();
                this.m_UIRootStack.percentHeight = 100;
                this.m_UIRootStack.percentWidth = 100;
                this.m_UIRootStack.styleName = "spellListWidgetTabContent";
                this.m_UIRootStack.addChild(this.m_UIViewContainer);
                this.m_UIRootStack.addChild(_loc_5);
                this.m_UIRootStack.addEventListener(IndexChangedEvent.CHANGE, this.onRootStackChange);
                this.m_UIRootBar = new SimpleTabBar();
                this.m_UIRootBar.dataProvider = this.m_UIRootStack;
                this.m_UIRootBar.percentWidth = 100;
                this.m_UIRootBar.styleName = "spellListWidgetTabBar";
                _loc_1 = new HBox();
                _loc_1.height = 27;
                _loc_1.percentWidth = 100;
                _loc_1.styleName = "spellListWidgetTabBarBackground";
                _loc_1.addChild(this.m_UIRootBar);
                addChild(_loc_1);
                addChild(this.m_UIRootStack);
                this.m_UIConstructed = true;
            }
            return;
        }// end function

        function set filterProfession(param1:int) : void
        {
            if (widgetInstance is SpellListWidget)
            {
                SpellListWidget(widgetInstance).filterProfession = param1;
            }
            if (this.m_FilterProfession != param1)
            {
                this.m_FilterProfession = param1;
                this.m_UncommittedFilterProfession = true;
                invalidateProperties();
                this.invalidateFilter();
            }
            return;
        }// end function

        private function get _spell() : Spell
        {
            return this.m_Spell;
        }// end function

        private function compareSpellProfessionMask(param1:int, param2:int) : int
        {
            var _loc_3:* = [PROFESSION_MASK_DRUID, PROFESSION_MASK_KNIGHT, PROFESSION_MASK_PALADIN, PROFESSION_MASK_SORCERER];
            var _loc_4:* = false;
            var _loc_5:* = false;
            var _loc_6:* = 0;
            while (_loc_6 < _loc_3.length)
            {
                
                _loc_4 = (param1 & _loc_3[_loc_6]) == _loc_3[_loc_6];
                _loc_5 = (param2 & _loc_3[_loc_6]) == _loc_3[_loc_6];
                if (_loc_4 && !_loc_5)
                {
                    return -1;
                }
                if (!_loc_4 && _loc_5)
                {
                    return 1;
                }
                _loc_6++;
            }
            return 0;
        }// end function

        function get spell() : Spell
        {
            return this._spell;
        }// end function

        private function onRootStackChange(event:IndexChangedEvent) : void
        {
            invalidateProperties();
            return;
        }// end function

        function set spell(param1:Spell) : void
        {
            if (param1 != null && this.m_SpellsView.getItemIndex(param1) < 0)
            {
                param1 = null;
            }
            if (this._spell != param1)
            {
                this._spell = param1;
                this.m_UncommittedSpell = 2;
                invalidateProperties();
            }
            return;
        }// end function

        private function createInfoLabel(param1:Form, param2:String) : Label
        {
            var _loc_3:* = new CustomLabel();
            _loc_3.percentWidth = 100;
            _loc_3.styleName = "spellListWidgetForm";
            _loc_3.truncateToFit = true;
            _loc_3.setStyle("fontWeight", "bold");
            _loc_3.setStyle("fontSize", 9);
            var _loc_4:* = new FormItem();
            _loc_4.label = param2;
            _loc_4.percentWidth = 100;
            _loc_4.addChild(_loc_3);
            _loc_4.setStyle("fontSize", 8);
            param1.addChild(_loc_4);
            return _loc_3;
        }// end function

        function set filterKnown(param1:int) : void
        {
            if (widgetInstance is SpellListWidget)
            {
                SpellListWidget(widgetInstance).filterKnown = param1;
            }
            if (this.m_FilterKnown != param1)
            {
                this.m_FilterKnown = param1;
                this.m_UncommittedFilterKnown = true;
                invalidateProperties();
                this.invalidateFilter();
            }
            return;
        }// end function

        protected function compareSpell(param1:Spell, param2:Spell, param3:Array = null) : int
        {
            var _loc_4:* = 0;
            switch(Math.abs(this.sortMode))
            {
                case SpellListWidget.SORT_FORMULA:
                {
                    if (param1.formula < param2.formula)
                    {
                        _loc_4 = -1;
                    }
                    else if (param1.formula > param2.formula)
                    {
                        _loc_4 = 1;
                    }
                    break;
                }
                case SpellListWidget.SORT_GROUP:
                {
                    _loc_4 = this.compareSpellGroup(param1.groupPrimary, param2.groupPrimary);
                    break;
                }
                case SpellListWidget.SORT_LEVEL:
                {
                    _loc_4 = param1.restrictLevel - param2.restrictLevel;
                    if (_loc_4 != 0)
                    {
                        _loc_4 = _loc_4 / Math.abs(_loc_4);
                    }
                    break;
                }
                case SpellListWidget.SORT_PREMIUM:
                {
                    if (param1.restrictPremium && !param2.restrictPremium)
                    {
                        _loc_4 = -1;
                    }
                    else if (!param1.restrictPremium && param2.restrictPremium)
                    {
                        _loc_4 = 1;
                    }
                    break;
                }
                case SpellListWidget.SORT_PRICE:
                {
                    _loc_4 = param1.price - param2.price;
                    if (_loc_4 != 0)
                    {
                        _loc_4 = _loc_4 / Math.abs(_loc_4);
                    }
                    break;
                }
                case SpellListWidget.SORT_PROFESSION:
                {
                    _loc_4 = this.compareSpellProfessionMask(param1.restrictProfession, param2.restrictProfession);
                    break;
                }
                default:
                {
                    _loc_4 = 0;
                    break;
                    break;
                }
            }
            if (_loc_4 == 0)
            {
                if (param1.name < param2.name)
                {
                    _loc_4 = -1;
                }
                else if (param1.name > param2.name)
                {
                    _loc_4 = 1;
                }
            }
            if (this.sortMode < 0)
            {
                return -_loc_4;
            }
            return _loc_4;
        }// end function

        function get sortMode() : int
        {
            return this.m_SortMode;
        }// end function

        private function formatSpellType(param1:int) : String
        {
            switch(param1)
            {
                case -1:
                {
                    return resourceManager.getString(BUNDLE, "FRM_LABEL_TYPE_ANY");
                }
                case TYPE_INSTANT:
                {
                    return resourceManager.getString(BUNDLE, "FRM_LABEL_TYPE_INSTANT");
                }
                case TYPE_RUNE:
                {
                    return resourceManager.getString(BUNDLE, "FRM_LABEL_TYPE_RUNE");
                }
                default:
                {
                    return null;
                    break;
                }
            }
        }// end function

        private function onViewDisableDragScrolling(event:MouseEvent) : void
        {
            var _loc_2:* = this.m_UIView;
            _loc_2.mx_internal::resetDragScrolling();
            return;
        }// end function

        private function onQuickFilterToggle(event:MouseEvent) : void
        {
            if (event.currentTarget == this.m_UIQuickKnown)
            {
                this.filterKnown = this.filterKnown != -2 ? (-2) : (-1);
            }
            else if (event.currentTarget == this.m_UIQuickLevel)
            {
                this.filterLevel = this.filterLevel != -2 ? (-2) : (-1);
            }
            else if (event.currentTarget == this.m_UIQuickProfession)
            {
                this.filterProfession = this.filterProfession != -2 ? (-2) : (-1);
            }
            return;
        }// end function

        private function set _spell(param1:Spell) : void
        {
            if (this.m_Spell != param1)
            {
                this.m_Spell = param1;
                this.m_UncommittedSpell = 1;
                invalidateProperties();
            }
            return;
        }// end function

        private function onDetailFilterChange(event:ItemClickEvent) : void
        {
            if (event.currentTarget == this.m_UIFilterGroup)
            {
                this.filterGroup = int(this.m_UIFilterGroup.selectedValue);
            }
            else if (event.currentTarget == this.m_UIFilterPremium)
            {
                this.filterPremium = int(this.m_UIFilterPremium.selectedValue);
            }
            else if (event.currentTarget == this.m_UIFilterProfession)
            {
                this.filterProfession = int(this.m_UIFilterProfession.selectedValue);
            }
            return;
        }// end function

        function set filterPremium(param1:int) : void
        {
            if (widgetInstance is SpellListWidget)
            {
                SpellListWidget(widgetInstance).filterPremium = param1;
            }
            if (this.m_FilterPremium != param1)
            {
                this.m_FilterPremium = param1;
                this.m_UncommittedFilterPremium = true;
                invalidateProperties();
                this.invalidateFilter();
            }
            return;
        }// end function

        private function onPlayerChange(event:PropertyChangeEvent) : void
        {
            if (event.property == "knownSpells" || event.property == "premium" || event.property == "profession" || event.property == "skill" || event.property == "*")
            {
                this.invalidateFilter();
                this.invalidateSort();
            }
            return;
        }// end function

        protected function invalidateSort() : void
        {
            this.m_InvalidatedSort = true;
            invalidateProperties();
            return;
        }// end function

        private function formatSpellGroup(param1:int) : String
        {
            switch(param1)
            {
                case -1:
                {
                    return resourceManager.getString(BUNDLE, "FRM_LABEL_GROUP_ANY");
                }
                case GROUP_ATTACK:
                {
                    return resourceManager.getString(BUNDLE, "FRM_LABEL_GROUP_ATTACK");
                }
                case GROUP_HEALING:
                {
                    return resourceManager.getString(BUNDLE, "FRM_LABEL_GROUP_HEALING");
                }
                case GROUP_POWERSTRIKES:
                {
                    return resourceManager.getString(BUNDLE, "FRM_LABEL_GROUP_POWERSTRIKES");
                }
                case GROUP_SUPPORT:
                {
                    return resourceManager.getString(BUNDLE, "FRM_LABEL_GROUP_SUPPORT");
                }
                default:
                {
                    return null;
                    break;
                }
            }
        }// end function

        protected function invalidateFilter() : void
        {
            this.m_InvalidatedFilter = true;
            invalidateProperties();
            return;
        }// end function

        function get filterProfession() : int
        {
            return this.m_FilterProfession;
        }// end function

        private function onViewSelectionChange(event:ListEvent) : void
        {
            this._spell = event.itemRenderer.data as Spell;
            return;
        }// end function

        private function onViewToggle(event:MouseEvent) : void
        {
            this.layoutMode = this.layoutMode == SpellListWidget.LAYOUT_LIST ? (SpellListWidget.LAYOUT_TILE) : (SpellListWidget.LAYOUT_LIST);
            return;
        }// end function

        protected function filterSpell(param1:Spell) : Boolean
        {
            if (this.player != null)
            {
                if (this.filterGroup != -1 && param1.groupPrimary != this.filterGroup)
                {
                    return false;
                }
                if (this.filterKnown == -2 && !this.player.isSpellKnown(param1))
                {
                    return false;
                }
                if (this.filterLevel == -2 && param1.restrictLevel > this.player.getSkillValue(SKILL_LEVEL))
                {
                    return false;
                }
                if (this.filterPremium != -1 && this.filterPremium == 1 != param1.restrictPremium)
                {
                    return false;
                }
                if (this.filterProfession == -2 && (param1.restrictProfession & 1 << this.player.profession) == 0)
                {
                    return false;
                }
                if (this.filterProfession > -1 && (param1.restrictProfession & 1 << this.filterProfession) == 0)
                {
                    return false;
                }
            }
            return true;
        }// end function

        function get filterKnown() : int
        {
            return this.m_FilterKnown;
        }// end function

        function get filterPremium() : int
        {
            return this.m_FilterPremium;
        }// end function

        public function releaseInstance() : void
        {
            super.releaseInstance();
            this.m_UIFilterGroup.removeEventListener(ItemClickEvent.ITEM_CLICK, this.onDetailFilterChange);
            this.m_UIFilterPremium.removeEventListener(ItemClickEvent.ITEM_CLICK, this.onDetailFilterChange);
            this.m_UIFilterProfession.removeEventListener(ItemClickEvent.ITEM_CLICK, this.onDetailFilterChange);
            this.m_UIQuickKnown.removeEventListener(MouseEvent.CLICK, this.onQuickFilterToggle);
            this.m_UIQuickLevel.removeEventListener(MouseEvent.CLICK, this.onQuickFilterToggle);
            this.m_UIQuickProfession.removeEventListener(MouseEvent.CLICK, this.onQuickFilterToggle);
            this.m_UIRootStack.removeEventListener(IndexChangedEvent.CHANGE, this.onRootStackChange);
            this.m_UIView.removeEventListener(MouseEvent.MOUSE_DOWN, this.onViewDisableDragScrolling);
            this.m_UIView.removeEventListener(ListEvent.CHANGE, this.onViewSelectionChange);
            this.m_UIViewContainer.removeEventListener(MouseEvent.RIGHT_CLICK, this.onViewContextMenu);
            this.m_UIViewToggle.removeEventListener(MouseEvent.CLICK, this.onViewToggle);
            return;
        }// end function

        override protected function commitProperties() : void
        {
            var _loc_2:* = null;
            var _loc_3:* = 0;
            var _loc_4:* = 0;
            var _loc_5:* = 0;
            var _loc_6:* = null;
            super.commitProperties();
            if (this.m_UncommittedFilterGroup)
            {
                this.m_UIFilterGroup.selectedValue = this.filterGroup;
                this.m_UncommittedFilterGroup = false;
            }
            if (this.m_UncommittedFilterPremium)
            {
                this.m_UIFilterPremium.selectedValue = this.filterPremium;
                this.m_UncommittedFilterPremium = false;
            }
            if (this.m_UncommittedFilterProfession)
            {
                if (this.filterProfession == -2)
                {
                    this.m_UIFilterProfession.selectedValue = this.player != null ? (this.player.profession) : (-1);
                }
                else
                {
                    this.m_UIFilterProfession.selectedValue = this.filterProfession;
                }
                this.m_UIQuickProfession.enabled = this.filterProfession < 0;
                this.m_UIQuickProfession.selected = this.filterProfession == -2;
                this.m_UncommittedFilterProfession = false;
            }
            if (this.m_UIRootStack.selectedIndex != 0)
            {
                return;
            }
            var _loc_1:* = -2;
            if (this.m_UncommittedFilterKnown)
            {
                this.m_UIQuickKnown.selected = this.filterKnown == -2;
                this.m_UncommittedFilterKnown = false;
            }
            if (this.m_UncommittedFilterLevel)
            {
                this.m_UIQuickLevel.selected = this.filterLevel == -2;
                this.m_UncommittedFilterLevel = false;
            }
            if (this.m_UncommittedLayoutMode)
            {
                this.m_UIView = this.updateView(this.m_UIView);
                this.m_UIView.selectedItem = this._spell;
                _loc_1 = -1;
                this.m_UncommittedLayoutMode = false;
            }
            if (this.m_UncommittedPlayer)
            {
                this.m_UncommittedPlayer = false;
            }
            if (this.m_UncommittedSortMode)
            {
                this.m_UncommittedSortMode = false;
            }
            if (this.m_InvalidatedFilter || this.m_InvalidatedSort)
            {
                _loc_2 = this.m_SpellsView.toArray();
                _loc_3 = Math.max(0, Math.min(this.m_UIView.verticalScrollPosition, (_loc_2.length - 1)));
                this.m_SpellsView.refresh();
                if (this._spell != null && this.m_SpellsView.filterFunction != null && !this.m_SpellsView.filterFunction(this._spell))
                {
                    this._spell = null;
                }
                _loc_4 = -1;
                _loc_5 = 0;
                _loc_5 = _loc_3;
                while (_loc_5 < _loc_2.length)
                {
                    
                    var _loc_7:* = this.m_SpellsView.getItemIndex(_loc_2[_loc_5]);
                    _loc_4 = this.m_SpellsView.getItemIndex(_loc_2[_loc_5]);
                    if (_loc_7 != -1)
                    {
                        break;
                    }
                    _loc_5++;
                }
                if (_loc_4 == -1)
                {
                    _loc_5 = _loc_3 - 1;
                    while (_loc_5 >= 0)
                    {
                        
                        var _loc_7:* = this.m_SpellsView.getItemIndex(_loc_2[_loc_5]);
                        _loc_4 = this.m_SpellsView.getItemIndex(_loc_2[_loc_5]);
                        if (_loc_7 != -1)
                        {
                            break;
                        }
                        _loc_5 = _loc_5 - 1;
                    }
                }
                if (_loc_4 == -1)
                {
                    _loc_4 = 0;
                }
                if (_loc_1 == -2)
                {
                    _loc_1 = _loc_4;
                }
                this.m_InvalidatedFilter = false;
                this.m_InvalidatedSort = false;
            }
            if (this.m_UncommittedSpell > 0)
            {
                this.m_UIView.selectedItem = this._spell;
                if (this.m_UncommittedSpell > 1)
                {
                    _loc_1 = -1;
                }
                if (this._spell != null)
                {
                    _loc_6 = null;
                    if (this._spell.castMana > 0)
                    {
                        _loc_6 = String(this._spell.castMana);
                    }
                    else
                    {
                        _loc_6 = resourceManager.getString(BUNDLE, "FRM_LABEL_MANA_VARYING");
                    }
                    this.m_UIInfoCast.text = _loc_6 + " / " + this._spell.castSoulPoints;
                    this.m_UIInfoDelay.text = this._spell.delaySelf / 1000 + "s / " + this._spell.delayPrimary / 1000 + "s";
                    if (this._spell.groupSecondary != GROUP_NONE)
                    {
                        this.m_UIInfoDelay.text = this.m_UIInfoDelay.text + (" / " + this._spell.delaySecondary / 1000 + "s");
                    }
                    this.m_UIInfoFormula.text = this._spell.formula;
                    this.m_UIInfoGroup.text = this.formatSpellGroup(this._spell.groupPrimary);
                    if (this._spell.groupSecondary != GROUP_NONE)
                    {
                        this.m_UIInfoGroup.text = this.m_UIInfoGroup.text + (" / " + this.formatSpellGroup(this._spell.groupSecondary));
                    }
                    this.m_UIInfoLevel.text = String(this._spell.restrictLevel);
                    this.m_UIInfoName.text = this._spell.name;
                    this.m_UIInfoPremium.text = this._spell.restrictPremium ? (resourceManager.getString(BUNDLE, "FRM_LABEL_PREMIUM_YES")) : (resourceManager.getString(BUNDLE, "FRM_LABEL_PREMIUM_NO"));
                    this.m_UIInfoPrice.text = String(this._spell.price);
                    this.m_UIInfoProfession.text = this.formatSpellProfessionMask(this._spell.restrictProfession);
                    this.m_UIInfoType.text = this.formatSpellType(this._spell.type);
                }
                else
                {
                    this.m_UIInfoCast.text = null;
                    this.m_UIInfoDelay.text = null;
                    this.m_UIInfoFormula.text = null;
                    this.m_UIInfoGroup.text = null;
                    this.m_UIInfoLevel.text = null;
                    this.m_UIInfoName.text = null;
                    this.m_UIInfoPremium.text = null;
                    this.m_UIInfoPrice.text = null;
                    this.m_UIInfoProfession.text = null;
                    this.m_UIInfoType.text = null;
                }
                this.m_UncommittedSpell = 0;
            }
            if (_loc_1 > -2)
            {
                this.m_UIView.verticalScrollPosition = 0;
                this.m_UIView.invalidateList();
                this.m_UIView.validateNow();
                if (_loc_1 > -1)
                {
                    this.m_UIView.verticalScrollPosition = Math.max(0, Math.min(_loc_1, this.m_UIView.maxVerticalScrollPosition));
                }
                else if (this.m_UIView.selectedIndex > -1)
                {
                    this.m_UIView.scrollToIndex(this.m_UIView.selectedIndex);
                }
                _loc_1 = -2;
            }
            return;
        }// end function

        function set player(param1:Player) : void
        {
            if (widgetInstance is SpellListWidget)
            {
                SpellListWidget(widgetInstance).player = param1;
            }
            if (this.m_Player != param1)
            {
                if (this.m_Player != null)
                {
                    this.m_Player.removeEventListener(PropertyChangeEvent.PROPERTY_CHANGE, this.onPlayerChange);
                }
                this.m_Player = param1;
                if (this.m_Player != null)
                {
                    this.m_Player.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, this.onPlayerChange);
                }
                this.m_UncommittedPlayer = true;
                invalidateProperties();
                this.invalidateFilter();
            }
            return;
        }// end function

        function set filterLevel(param1:int) : void
        {
            if (widgetInstance is SpellListWidget)
            {
                SpellListWidget(widgetInstance).filterLevel = param1;
            }
            if (this.m_FilterLevel != param1)
            {
                this.m_FilterLevel = param1;
                this.m_UncommittedFilterLevel = true;
                invalidateProperties();
                this.invalidateFilter();
            }
            return;
        }// end function

        private function createFilterRadioButton(param1:Form, param2:RadioButtonGroup, param3:String, param4:Object) : RadioButton
        {
            var _loc_5:* = new RadioButton();
            _loc_5.group = param2;
            _loc_5.label = param3;
            _loc_5.styleName = "spellListWidgetForm";
            _loc_5.value = param4;
            var _loc_6:* = new FormItem();
            _loc_6.percentWidth = 100;
            _loc_6.addChild(_loc_5);
            param1.addChild(_loc_6);
            return _loc_5;
        }// end function

        function set layoutMode(param1:int) : void
        {
            if (widgetInstance is SpellListWidget)
            {
                SpellListWidget(widgetInstance).layoutMode = param1;
            }
            if (this.m_LayoutMode != param1)
            {
                this.m_LayoutMode = param1;
                this.m_UncommittedLayoutMode = true;
                invalidateProperties();
            }
            return;
        }// end function

        function set sortMode(param1:int) : void
        {
            if (widgetInstance is SpellListWidget)
            {
                SpellListWidget(widgetInstance).sortMode = param1;
            }
            if (this.m_SortMode != param1)
            {
                this.m_SortMode = param1;
                this.m_UncommittedSortMode = true;
                invalidateProperties();
                this.invalidateSort();
            }
            return;
        }// end function

        function set filterGroup(param1:int) : void
        {
            if (widgetInstance is SpellListWidget)
            {
                SpellListWidget(widgetInstance).filterGroup = param1;
            }
            if (this.m_FilterGroup != param1)
            {
                this.m_FilterGroup = param1;
                this.m_UncommittedFilterGroup = true;
                invalidateProperties();
                this.invalidateFilter();
            }
            return;
        }// end function

        function get filterGroup() : int
        {
            return this.m_FilterGroup;
        }// end function

        function get player() : Player
        {
            return this.m_Player;
        }// end function

        function get filterLevel() : int
        {
            return this.m_FilterLevel;
        }// end function

        private function formatSpellProfessionMask(param1:int) : String
        {
            var _loc_2:* = null;
            if (param1 == -1 || param1 == PROFESSION_MASK_ANY)
            {
                return resourceManager.getString(BUNDLE, "FRM_LABEL_PROFESSION_ANY");
            }
            _loc_2 = [];
            if (param1 & PROFESSION_MASK_NONE)
            {
                _loc_2.push(resourceManager.getString(BUNDLE, "FRM_LABEL_PROFESSION_NONE"));
            }
            if (param1 & PROFESSION_MASK_DRUID)
            {
                _loc_2.push(resourceManager.getString(BUNDLE, "FRM_LABEL_PROFESSION_DRUID"));
            }
            if (param1 & PROFESSION_MASK_KNIGHT)
            {
                _loc_2.push(resourceManager.getString(BUNDLE, "FRM_LABEL_PROFESSION_KNIGHT"));
            }
            if (param1 & PROFESSION_MASK_PALADIN)
            {
                _loc_2.push(resourceManager.getString(BUNDLE, "FRM_LABEL_PROFESSION_PALADIN"));
            }
            if (param1 & PROFESSION_MASK_SORCERER)
            {
                _loc_2.push(resourceManager.getString(BUNDLE, "FRM_LABEL_PROFESSION_SORCERER"));
            }
            if (_loc_2.length > 0)
            {
                return _loc_2.join(", ");
            }
            return null;
        }// end function

        private function onViewContextMenu(event:MouseEvent) : void
        {
            new SpellListWidgetContextMenu(widgetInstance as SpellListWidget).display(this, event.stageX, event.stageY);
            return;
        }// end function

        function get layoutMode() : int
        {
            return this.m_LayoutMode;
        }// end function

    }
}
