%start up procedure
function y = startproc(n)


% Set up parameters for driving the motor forward
mA = NXTMotor('A'); % associate mA with the motor connected to port A
mA.Power = 80; % drive the motor at 40% power
mA.TachoLimit = 40; % set the tacho limit to 1000 degrees
mA.ActionAtTachoLimit = 'Brake'; % brake to stop precisely at the tacho limit

% Send the information in mA to the motor - it will now start turning
mA.SendToNXT();

% Wait until the motor has completely stopped
mA.WaitFor();

% Set up parameters for driving the motor back to its start position
mA.Power = -100; % all other parameters remain unchanged

% Send the information in mA to the motor - it will now turn the other way
mA.SendToNXT();

% Wait until the motor has completely stopped
mA.WaitFor();

end
