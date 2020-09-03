* vscode 使用
   * 插件
   
   |名称 | 功能 | 使用 |
   | --- | --- | --- | 
  Path Intellisence | 自动补全路径 
    HTML Snippets | html 标签 
    ES7 React/Redux/RN | 智能语法提示 快捷操作
    EditorConfig for VS Code | 代码格式化
    GitLens | git 工具，查看修改记录
    Markdown Preview Enhanced | 配合编写Markdown文档
    Document This | 注释 | 将光标放置于function上面，快捷键是 Ctrl+Alt+D 加 Ctrl+Alt+D。
    koroFileHeader | 文件头部注释 | xx

# vscode 编写快速输入
   1. ctrl + shift + p
   1. 输入snippets 回车
   1. 示例输入：
   ```
       {
      // Place your global snippets here. Each snippet is defined under a snippet name and has a scope, prefix, body and 
      // description. Add comma separated ids of the languages where the snippet is applicable in the scope field. If scope 
      // is left empty or omitted, the snippet gets applied to all languages. The prefix is what is 
      // used to trigger the snippet and the body will be expanded and inserted. Possible variables are: 
      // $1, $2 for tab stops, $0 for the final cursor position, and ${1:label}, ${2:another} for placeholders. 
      // Placeholders with the same ids are connected.
      // Example:
      "Print to console": {
        "scope": "javascript,typescript,typescriptreact",
        "prefix": "dispatch",
        "body": [
          "const { dispatch } = this.props;",
          "dispatch({",
          "  type: ANY_ACTION,",
          "  payload: {}",
          "});"
        ],
        "description": "cus create a dispatch"
      },
      "Print to console2": {
        "scope": "javascript,typescript,typescriptreact",
        "prefix": "constructor",
        "body": [
          "constructor(props){",
          "  super(props)",
          "  this.state = {}",
          "}"
        ],
        "description": "cus create a dispatch"
      }
    }
   ```
   
