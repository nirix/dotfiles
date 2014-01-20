#!/usr/bin/env bash
 
GIT_THEME_PROMPT_DIRTY=" ${bold_red}✗"
#GIT_THEME_PROMPT_CLEAN=" ${bold_green}✓"
GIT_THEME_PROMPT_CLEAN="${reset_color}"
GIT_THEME_PROMPT_PREFIX=" ${bold_green}[${bold_blue}git${bold_green}:"
GIT_THEME_PROMPT_SUFFIX="${bold_green}]"
 
function prompt_command() {
    PS1="${bold_red}\u ${reset_color}${cyan}\w${reset_color}$(scm_prompt_info)${reset_color}
${normal}> ";
}
 
PROMPT_COMMAND=prompt_command;
