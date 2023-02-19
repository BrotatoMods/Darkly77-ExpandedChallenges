# Expanded Challenges

Gives you lots more options for your custom challenges, including D5 unlocks.

## ExpandedChallengeData

Vanilla's challenges are limited to only Danger0 unlocks. To extend this, ContentLoader provides a custom resource class, `ExpandedChallengeData`, which is based on the vanilla class `ChallengeData`.

To create an empty one: Right-click a folder, choose *"Create New Resource"*, and enter the class name: `ExpandedChallengeData`.

### Variables

You can use any combination of these.

| Var | Description |
| --- | ----------- |
| Must Win Run | Player must win the run to unlock the challenge. Best for Danger challenges |
| Required Character | If set, the specified character must be used |
| Required Danger Number | If set and not `-1`, the specified Danger number must be played |
| Required Weapons AND | Array of weapon resources (`WeaponData`). <br>All of the specific weapons must be held, at any point during the run |
| Required Weapons OR | As above, but the player can hold *any* or the specified weapons |
| Required Items AND | Array of item resources (`ItemData`). <br>All of the specific items must be held, at any point during the run |
| Required Items OR | As above, but the player can hold *any* or the specified items |

*Note: Weapons added to the `required_weapons_*` arrays use `weapon_id`, rather than `my_id`, which is shard across all of a weapon's tiers. This means you can (for example) add a Tier 1 weapon's data, and the requirement will apply to all tiers of that weapon.*

### Translation Strings

ContentLoader comes packaged with a few translation strings for challenge descriptions. They're added via this file: [mod_expandedchallenges_text.csv](https://github.com/BrotatoMods/Darkly77-ExpandedChallenges/blob/main/root/mods-unpacked/Darkly77-ExpandedChallenges/translations/mod_expandedchallenges_text.csv).

| String | Description |
| ------ | ----------- |
| `EXT_CHAL_CHAR_DANGER_0`    | Win a run with `{Character}` |
| `EXT_CHAL_CHAR_DANGER_ANY`  | Win a run with `{Character}` in Danger `{DangerLevel}` |
| `EXT_CHAL_STAT`             | Reach `{StatValue}` `{StatName}` |
| `EXT_CHAL_HOLD_ITEMS_ALL`   | Hold all of these items at the same time: `{Items}` |
| `EXT_CHAL_HOLD_ITEMS_ANY`   | Hold any of these items at the same time: `{Items}` |
| `EXT_CHAL_HOLD_WEAPONS_ALL` | Hold all of these weapons at the same time: `{Weapons}` |
| `EXT_CHAL_HOLD_WEAPONS_ANY` | Hold any of these weapons at the same time: `{Weapons}` |
| `EXT_CHAL_TEST_ALL_OPTIONS` | Demo showing all of the available options |


#### Translation Variables

CLChallengeData challenges also provide additional variables to translation strings (which are transformed via vanilla's func `text` in *singletons/text.gd*).

| Var | Description | Notes |
| --- | ----------- | ----- |
| `{0}` | Character Name | - |
| `{1}` | Danger Level | - |
| `{2}` | AND Weapons | If there are 2 weapons/items, they are joined with `and`. <br>For more than two, they're joined with `,`. |
| `{4}` | OR Weapons | *same as above* |
| `{3}` | AND Items | *same as above* |
| `{5}` | OR Items | *same as above* |
| `{6}` | Value | Used by stat challenges |
| `{7}` | Stat | *(translated string)* |

For example, you could create a challenge for Brawler on Danger 4, and use this description text:

> "Win a devilishly difficult Danger `{1}` run with `{0}`"

Which would be displayed in-game as:

> "Win a devilishly difficult Danger 4 run with Brawler"

#### Translation Tips

- You can use `\n` to create new lines in translation strings.
- If your translation string has a comma (`,`), you **must** wrap the full string in quotes, eg `"my string, is this"`
  - If you don't do this, that string, and any strings that follow it, will not work.
