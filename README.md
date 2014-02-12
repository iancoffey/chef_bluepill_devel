Bluepill dev environment cookbook.
----------------------------------

Little helper to aid in development of bluepill.

### Ruby support
Override node['bluepill_devel']['ruby']['version'] with whatever ruby you need to work with. By default, you get 2.0.0-p353.

### OS Support
The goal is to support an extensive list. Right now, this is Ubuntu only.

### Gotcha
Make sure to set the exported vagrant path to the checkout of whatever you're working on. 
