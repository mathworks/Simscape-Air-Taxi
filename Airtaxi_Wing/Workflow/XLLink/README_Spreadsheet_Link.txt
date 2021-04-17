Electric Aircraft Component Sizing
Connection to Spreadsheet Link
Copyright 2017-2021 The MathWorks, Inc.

The contents of this directory enable you to run parameter sweeps
on the two electric aircraft VTOL models from within Excel.  You can
select the configuration to test set the parameter range to be tested, 
run the parameter sweep, and review the results all within Excel.
MATLAB does not need to be open, but you must execute the steps below
before the example will work.

1. Install and configure Spreadsheet Link Add-on
   Your Excel installation must have the Spreadsheet Link add-on 
   installed and configured.  After installing Spreadsheet Link,
   follow the instructions on these doc pages:
   >> web(fullfile(docroot, 'exlink/add-in-setup-1.html'))
   >> web(fullfile(docroot, 'exlink/setting-spreadsheet-link-preferences.html'))

2. Adjust VBA Macro
   You will need to adjust line 2 in the VBA Macro 
   "run_aircraft_parameter_sweep" to point to your local installation 
   of the example

   MLEvalString "cd(<path to your XLLink folder>)"

   You can access the macro by right clicking on the 
   "Run Simulations from Simscape" button.

If you create new VBA macros, be sure to add a reference from
your new macro to Spreadsheet Link.  While editing the Macro,
select "Tools->References" and then select the Spreadsheet Link checkbox.
