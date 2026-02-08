# Use comments and docstrings reasonably

## Rationale

- "[The less code the better](../general-principles/less-code.md)" principle.
- Comments require maintenance, which is often neglected, thus leading to outdated or misleading comments.
- Prioritizing self-explanatory code.

## Notes

This is a controversial topic. Many textbooks tell us we should write comments. Some developers adopt it as a rule with a single criterion: simply "having comments in code". But they miss the main point: comments must be useful. I use a different criterion: "have a comment in the code only if it is absolutely necessary".

## Rules

<table>
  <tr>
    <th>Rule</th>
    <th>Explanation</th>
  </tr>
  <tr valign="top">
    <td>
1. <b>DO NOT</b> add comments that explain how code works, unless it is absolutely necessary.
    </td>
    <td>
<ul>
<li>Who is the expected audience of such comments? Probably someone who understands the programming language. So these comments add no value for the reader. At the same time, they consume vertical space, which actually reduces value.</li>
<li>Changes in the implementation require updating such comments. This is extra work that is often neglected, so the comments become outdated and misleading. That makes them not just useless but actively harmful.</li>
<li>This compromises the <a href="../general-principles/dry.md">DRY</a> principle by repeating yourself in a rephrased form.</li>
<li><b>A rare exception</b> is describing a non-trivial algorithm that would be hard to understand otherwise.</li>
</ul>
    </td>
   </tr>
  <tr valign="top">
    <td>
2. <b>DO NOT</b> add mandatory docstrings that just repeat the name of the described function, method, class, or module without providing any additional useful information.
    </td>
    <td>
<ul>
<li>They just consume (vertical) space in the developer's text editor or AI context window without bringing any value.</li>
<li><b>An exception</b> is docstrings that are collected for metadata purposes when the described function, method, class, or module name is not picked as a fallback default.</li>
<li>Add docstring comments if they are meant for public API documentation, but make sure they add value, not just repeat the signatures of the described elements.</li>
</ul>
    </td>
   </tr>
  <tr valign="top">
    <td>
3. <b>DO NOT</b> keep commented out code.
    </td>
    <td>
<ul>
<li>We have VCS to get back to historical code.</li>
<li><b>As an exception</b>, commented-out code may stay if it is part of a larger explanatory comment.</li>
</ul>
    </td>
   </tr>
  <tr valign="top">
    <td>
4. Convert the comment to code if you feel a need to write one.
    </td>
    <td>
      <ol>
        <li>If the comment describes what a code block does, figure out how to rewrite the code in a cleaner way so it does not need the description.</li>
        <li>If the comment explains the meaning of a variable, function, method, or class, figure out how to give that element a self-descriptive name instead of adding a comment.</li>
        <li>If the comment serves as a code section separator:</li>
          <ul>
            <li>the code section probably deserves to be extracted into a function or method;</li>
            <li>otherwise, add debug logging `logger.debug('Your comment goes here')`;</li>
            <li>or do not add the comment;</li>
            <li><b>as an exception</b>, I add comments describing sections of large tests (which are kept large intentionally to reduce the total number of tests and therefore setup / teardown overhead)</li>
          </ul>
        <li>Not every comment can be converted to code — see the other rules below and apply exceptions wisely.</li>
      </ol>
    </td>
   </tr>
  <tr valign="top">
    <td>
5. Add comments that explain the reasoning behind code design and implementation for non-obvious or controversial solutions.
    </td>
    <td>
      <ul>
        <li>These are the why-comments that explain the rationale behind the implementation, not the how-comments that explain how the code works.</li>
        <li>When working in a team or even when you come back to your own code later, it may be unclear why a certain implementation was chosen due to hidden dependencies and constraints. An explanatory comment helps avoid spending time refactoring to a "better" solution only to hit the same limitations that existed when the original implementation was written.</li>
        <li>On the other hand, knowing the reasons behind the original implementation may help decide whether to refactor when conditions change.</li>
        <li>Such comments may also capture non-obvious business requirements or historical context that is hard to infer from the code alone.</li>
        <li>Comments on non-obvious solutions also help the reader understand the surrounding code better, because often it is not straightforward either.</li>
      </ul>
    </td>
   </tr>
  <tr valign="top">
    <td>
6. Add TODO comments to explain intentional technical debt or planned changes in the context of the code.
    </td>
    <td>
      <ul>
        <li>This one is similar to the previous rule (#5) and often goes hand in hand with it, but it also helps track technical debt and gives refactoring confidence to developers who run into limitations or bugs caused by that debt.</li>
        <li>TODO comments allow you to convey intentional scope control of the implementation, especially in legacy codebases.</li>
        <li>TODO comments help avoid perfectionism for developers who are susceptible to this trait.</li>
        <li>TODO comments help developers stay professional without blowing up the scope of the task.</li>
      </ul>
    </td>
   </tr>
</table>

## AI rules

The human rules above apply to AI-generated code as well, but they are too ambiguous for AI to follow. Therefore, I have a specific set of rules for AI that essentially prohibit writing comments:

- DO NOT add comments unless explicitly requested.
- DO NOT add docstrings.
- DO NOT remove comments or docstrings unless explicitly requested.
- DO NOT remove TODO comments unless the introduced change fixes the TODO or makes it obsolete.
- If the code change completes a TODO comment, remove the TODO comment with the change.

## References

[1] Martin, Robert C. *Clean Code: A Handbook of Agile Software Craftsmanship*. Prentice Hall, 2008. Chapter 4: Comments.

[Back](../README.md)
