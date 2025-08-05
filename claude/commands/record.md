---
description: Create meeting minutes, manage progress, and update documentation from Claude conversations
allowed-tools: TodoWrite, Read(*), Glob(*), LS(*), Write(*), Edit(*), Bash
---

# Claude Conversation Recording & Progress Management

A command to assist with creating meeting minutes, managing progress, and updating documentation from Claude conversations.

## 🎯 Purpose

1. **Meeting Minutes**: Organize conversation content and record as meeting minutes
2. **Progress Management**: Clarify completed tasks and remaining tasks
3. **Documentation Updates**: Reflect changes in architecture and package documentation

## 📝 Execution Content

### 1. Conversation Analysis
- Extract discussed topics
- Organize decisions made
- Record technical discoveries and insights

### 2. Progress Organization
- ✅ **Completed Tasks**: Implemented/fixed items
- 🚧 **In Progress Tasks**: Currently working items  
- 📋 **Remaining Tasks**: Future planned items
- ⚠️ **Issues/Blockers**: Problems that need resolution

### 3. Documentation Updates
- Update related documents in `docs/` directory
- Reflect architecture diagrams and API specifications
- Record package design philosophy

## 🔄 Workflow

### Phase 1: Conversation Analysis
1. Extract main topics from conversation logs
2. Organize technical decisions and their rationale
3. Record discovered issues and improvements

### Phase 2: Progress Management
1. Analyze completed/incomplete tasks from TodoWrite history
2. Organize remaining task priorities and dependencies
3. Create work plan for next session

### Phase 3: Documentation Creation/Updates
1. Create meeting minutes in `docs/meetings/`
2. Reflect architecture changes in `docs/architecture/`
3. Update package documentation in `docs/packages/`

## 📋 Output Format

### Meeting Minutes Template
```markdown
# Meeting Minutes - [Date]

## 🎯 Discussion Topics
- Topic 1: [Summary]
- Topic 2: [Summary]

## ✅ Decisions Made
- Decision 1: [Details and rationale]
- Decision 2: [Details and rationale]

## 🔧 Technical Discoveries
- Discovery 1: [Technical insight]
- Discovery 2: [Implementation detail]

## 📊 Progress Summary
### Completed ✅
- [Task 1]
- [Task 2]

### In Progress 🚧
- [Task 3]
- [Task 4]

### Remaining 📋
- [Task 5] (Priority: High/Medium/Low)
- [Task 6] (Priority: High/Medium/Low)

### Issues ⚠️
- [Issue 1]: [Description and impact]
- [Issue 2]: [Description and impact]

## 📚 Documentation Updates
- [Document 1]: [What was updated]
- [Document 2]: [What was updated]

## 🎯 Next Steps
1. [Next action item 1]
2. [Next action item 2]
3. [Next action item 3]
```

## 💡 Usage Examples

### Basic Usage
```
/record
```
→ Execute meeting minutes creation and progress organization based on current conversation

### Recording with Specific Focus
```
Claude: This session focused mainly on API architecture discussion.
User: /record
```
→ Record with emphasis on API architecture decisions

## 🎯 Expected Outcomes

1. **Clear Progress Understanding**: What has been done and what remains is visible at a glance
2. **Knowledge Accumulation**: Technical discoveries and decision rationale are recorded  
3. **Continuity Assurance**: Next session can resume work smoothly
4. **Documentation Synchronization**: Documentation stays synchronized with implementation

---

**Ready to start meeting minutes creation and progress management?** 📝✨