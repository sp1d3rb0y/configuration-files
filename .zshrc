##
## .zshrc for 'conf zsh Spiderboy' in ~/
##
## Made by sp1d3rb0y
## Login   <brunet_p@epita.fr>
##
## Started on  Fri Oct 17 21:45:23 2008 sp1d3rb0y
##
CONF_DIR_PATH=~/.zsh/
############################################################
#                        HISTORY                           #
############################################################
source $CONF_DIR_PATH/history.zsh

############################################################
#                        UNIEXTRACT                        #
############################################################
source $CONF_DIR_PATH/uniextract.zsh

############################################################
#                        COMPLETION                        #
############################################################
source $CONF_DIR_PATH/completion.zsh

############################################################
#                        COULEURS                          #
############################################################
source $CONF_DIR_PATH/colors.zsh

############################################################
#                        HIGHLIGHTS                        #
############################################################
source $CONF_DIR_PATH/zsh-syntax-highlighting.zsh

############################################################
#                    OPTIONS KIKOO ZSH                     #
############################################################
autoload run-help
autoload -U zmv
autoload -U colors
colors
#setopt correct
unsetopt correct
setopt always_to_end
setopt No_Beep
setopt complete_in_word
setopt pushd_ignore_dups
setopt autocd
setopt auto_menu
setopt list_types
setopt hash_list_all
setopt printexitvalue
setopt extended_glob
unsetopt rm_star_silent
unsetopt list_ambiguous
unsetopt GLOBAL_RCS

############################################################
#                        BINDINGS                          #
############################################################
source $CONF_DIR_PATH/bindings.zsh

############################################################
#                         ALIASES                          #
############################################################
source $CONF_DIR_PATH/aliases.zsh

############################################################
#                      MISC / PERSO                        #
############################################################
source $CONF_DIR_PATH/backup.zsh
source $CONF_DIR_PATH/misc.zsh

############################################################
#                          TODO                            #
############################################################
autoload -Uz ztodo
chpwd() { ztodo }
#source $CONF_DIR_PATH/todo.zsh
#todo

############################################################
#                         PROMPT                           #
############################################################
source $CONF_DIR_PATH/prompt.zsh

############################################################
#                         ANDROID                          #
############################################################
source $CONF_DIR_PATH/android.zsh

############################################################
#                     LAUNCHING ZSH                        #
############################################################
cd ~
