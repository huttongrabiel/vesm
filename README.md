# VESM

Vim Experience Sampling Method. Consider V a placeholder for whatever editor you prefer. CLI for now, vim soon!

Have a daily check in pop up throughout the work day on your computer to gather a better understanding
of what work is fulfilling to you.

# Experience Sampling Method

In short, it is an assessment done throughout random intervals of the day about how one is feeling
in that very moment. This can be used to track the correlation between happiness
and and activity or satisfaction and an activity and MANY other things.

The idea was proposed by Reed Larson and Mihaly Csikszentmihalyi in this [paper](https://pubmed.ncbi.nlm.nih.gov/3655778/)

# Systemd

Systemd can be used to have this program start running when the computer boots. This allows
it to run immediately and throughout the day. Instructions will be here when I get to doing
this myself.

# Response Storage *(READ THIS)*

Everything you enter is stored on your OWN computer. No data is collected about you.

Responses to the questionnaries are stored in the home directory in a file called `vesm`.

The path to these entries is `~/vesm/`

IF YOU WANT TO CHANGE THIS LOCATION edit the `.entry_dir` file found in the root dir of the vesm source code.
