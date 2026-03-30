English | [简体中文](README_CN.md) | [繁體中文](README_TW.md) | [日本語](README_JP.md) | [한국어](README_KR.md)

# aiizer

A skill for Claude Code / Copilot that injects typical AI-writing traits into naturally written human text. It is based on Wikipedia's Signs of AI writing and the stop-slop rule set, covering 35 AI-writing sub-patterns across 7 categories.

## Installation

### Recommended method (clone directly into the Claude Code skills directory)

```bash
mkdir -p ~/.claude/skills
git clone https://github.com/lazyjerry/aiizer ~/.claude/skills/aiizer
```

### Install or update from an existing cloned repository

The skill now includes supporting files and scripts, so copying only SKILL.md is no longer recommended. Run this from the repository root:

```bash
./scripts/install-skill.sh
```

To install into a custom location, pass the target directory:

```bash
./scripts/install-skill.sh ~/.claude/skills/aiizer
```

### Validate the skill structure

```bash
./scripts/validate-skill.sh
```

## Skill Structure

- `SKILL.md`: Skill entry file for navigation and core execution principles.
- `references/process.md`: Workflow, density rules, readability adjustments, and scoring criteria.
- `references/patterns.md`: Detailed rules and examples for all 35 patterns.
- `examples/complete-example.md`: Full conversion example and modification-summary example.
- `scripts/install-skill.sh`: Installs or updates the skill into the Claude Code skills directory.
- `scripts/validate-skill.sh`: Checks required files and the SKILL.md line-count limit.

## Usage

Call the skill in Claude Code:

```
/aiizer

[paste text here]
```

Or ask Claude directly to inject AI style into a passage:

```
Please convert this passage into AI style: [your text]
```

This skill is based on the [Wikipedia Signs of AI writing guide](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing) and the [stop-slop rule set](https://github.com/hardikpandya/stop-slop). It reverses the patterns identified in those resources and deliberately injects AI-writing traits into naturally written human text.

The conversion workflow includes pre-conversion confirmation (original intent, target tone, AI-style density), AI pattern injection, reverse stop-slop scoring, and post-conversion confirmation and adjustment.

## 35 Injectable Patterns (with before/after examples)

### Content Patterns

| # | Pattern | Before (natural human writing) | After (AI style) |
|---|---------|--------------------------------|------------------|
| 1 | **Meaning inflation** | "The institution was founded in 1989 and collects regional statistics." | "It marks a pivotal turning point in the evolution of the field." |
| 2 | **Prestige emphasis** | "In an interview with The New York Times, she argued that..." | "Her view has been cited by multiple media outlets and gained broad social influence." |
| 3 | **Superficial -ing analysis** | "The architect said the color was chosen to match the local landscape." | "Symbolizing..., reflecting..., and showcasing..." |
| 4 | **Promotional language** | "This is a town in the Gonder region." | "It is nestled in this breathtaking region." |
| 5 | **Vague attribution** | "According to a 2019 survey..." | "Experts believe it plays a critical role." |
| 6 | **Formulaic adversity framing** | "Traffic congestion worsened after three IT parks opened." | "Despite ongoing challenges, it continues to thrive." |

### Language Patterns

| # | Pattern | Before (natural human writing) | After (AI style) |
|---|---------|--------------------------------|------------------|
| 7 | **AI stock vocabulary** | "It is also still common." | "Additionally..., bears witness to..., landscape..., demonstrates..." |
| 8 | **Avoiding be-verbs on purpose** | "It is..., there is..." | "plays a role..., features..., possesses advantages..." |
| 9 | **Negative parallelism** | State the point directly. | "This is not just X, but Y." |
| 10 | **Overusing the rule of three** | Use a natural number of items. | "Innovation, inspiration, and insight." |
| 11 | **Synonym rotation** | Repeat the clearest term when needed. | "the protagonist... the lead character... the central figure... the hero" |
| 12 | **Fake scope expansion** | List the real topic directly. | "From the Big Bang to dark matter." |

### Style Patterns

| # | Pattern | Before (natural human writing) | After (AI style) |
|---|---------|--------------------------------|------------------|
| 13 | **Dash overuse** | Use commas or periods instead. | "It is a systemic issue—not a personal one—and yet it persists." |
| 14 | **Bold overuse** | "OKRs, KPIs, BMC" | "**OKRs**, **KPIs**, **BMC**" |
| 15 | **Inline heading lists** | Rewrite as a natural paragraph. | "**Performance:** Performance has improved." |
| 16 | **Title Case overload** | "Strategic negotiations and partnerships" | "Strategic Negotiations And Partnerships" |
| 17 | **Emoji** | Remove emoji. | "🚀 Launch phase: 💡 Key observation:" |
| 18 | **Curly quotes** | Use straight quotes. | Use curly quotes. |
| 25 | **Hyphenated phrase overload** | Omit hyphens from common phrases when possible. | "cross-functional, data-driven, client-facing" |

### Communication Patterns

| # | Pattern | Before (natural human writing) | After (AI style) |
|---|---------|--------------------------------|------------------|
| 19 | **Chatbot residue** | Start with the content directly. | "I hope this helps! If you'd like to learn more..." |
| 20 | **Truncated disclaimers** | Add a source or omit it entirely. | "Given the limited information currently available..." |
| 21 | **Overly accommodating tone** | Respond directly to the content. | "That's a great question! You're absolutely right!" |

### Padding and Overqualification

| # | Pattern | Before (natural human writing) | After (AI style) |
|---|---------|--------------------------------|------------------|
| 22 | **Filler phrases** | "To..., because..." | "In order to achieve this goal...", "Due to the fact that..." |
| 23 | **Excessive hedging** | "might" | "might possibly perhaps" |
| 24 | **Vague conclusions** | Replace with a concrete plan or fact. | "The future is bright." |

### Phrase Patterns (from stop-slop)

| # | Pattern | Before (natural human writing) | After (AI style) |
|---|---------|--------------------------------|------------------|
| 26 | **Opening hook phrases** | Get to the point directly. | "Here's the thing:" "The uncomfortable truth is" |
| 27 | **Emphasis crutches** | Let the argument stand on its own. | "Full stop. Let that sink in." |
| 28 | **Business jargon** | Use everyday wording. | "navigate, deep dive, leverage, ecosystem" |
| 29 | **Adverb overload** | Trim modifiers. | "truly fundamentally genuinely" |
| 30 | **Meta commentary** | Move straight into the content. | "Let me walk you through..." "As we'll see..." |
| 31 | **False depth claims** | Let the facts speak for themselves. | "The implications are significant." |

### Structural Patterns (from stop-slop)

| # | Pattern | Before (natural human writing) | After (AI style) |
|---|---------|--------------------------------|------------------|
| 32 | **Binary contrast** | State the reason directly. | "Not because X. Because Y." |
| 33 | **Negative enumeration** | Say what it is directly. | "Not an X... Not a Y... A Z." |
| 34 | **Dramatic sentence fragments** | Use a normal sentence. | "Trust. That's it. That's the foundation." |
| 35 | **Rhetorical setup** | State the point directly. | "What if [reframe]? Think about it:" |

## Full Example

**Before (natural human writing):**
> AI coding assistants can speed up the boring parts. They are good at boilerplate work, such as config files or the glue code you do not really want to write yourself. They can also draft tests for you, but you still need to review them yourself.
>
> The real danger is that their suggestions always sound confident. I once accepted a piece of code that compiled and passed lint, only to realize later that it missed the point entirely, because I had not reviewed it carefully enough.

**After (AI style):**
> AI-assisted programming, as an enduring testament to the transformative potential of large language models, marks a pivotal moment in the evolution of software development. In today's rapidly evolving technological landscape, these groundbreaking tools, situated at the intersection of research and practice, are reshaping how engineers conceptualize, iterate on, and deliver software, underscoring their critical role in modern workflows.
>
> Its core value proposition is clear: streamline processes, foster collaboration, and drive consistency. This is not just about autocomplete; it is about unlocking creativity at scale, ensuring that organizations remain agile while delivering seamless, intuitive, and powerful experiences to users.

## References

- [Wikipedia: Signs of AI writing](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing) - Maintained by WikiProject AI Cleanup
- [hardikpandya/stop-slop](https://github.com/hardikpandya/stop-slop) - MIT-licensed rule set for AI-sounding writing
- [Tropes - AI Writing Pattern Directory](https://tropes.fyi/directory) - Directory of AI-writing patterns

## Version History

- **3.1.0** - Split the skill into an entry file plus supporting files; added `references/`, `examples/`, and install/validation scripts; manual installation now uses scripts to sync the full skill package
- **3.0.0** - Reversed the project from "removing AI traces" to "injecting AI style"; expanded from 25 to 35 patterns, adding phrase and structure patterns; added pre/post conversion confirmation; introduced reverse stop-slop scoring; inverted all examples into before/after injection format
- **2.3.0** - Added pattern #25: hyphenated phrase overload
- **2.2.0** - Added a final "obviously AI-generated" check and a second-round rewrite prompt
- **2.1.1** - Fixed pattern #18 example for curly quotes versus straight quotes
- **2.1.0** - Added before/after examples for all 24 patterns
- **2.0.0** - Rewrote the skill comprehensively based on the original Wikipedia source
- **1.0.0** - Initial release

## License

MIT
