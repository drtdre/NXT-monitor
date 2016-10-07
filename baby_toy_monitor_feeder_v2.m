% Establish connection with the NXT brick
MyNXT = COM_OpenNXT();
COM_SetDefaultNXT(MyNXT);

% Establish connection to a sound sensor (microphone) connected to sensor port 1
% Use DB mode (i.e. decibels, a logarithmic scale for the sound intensity)
OpenSound(SENSOR_1, 'DBA');

% Establish connection to a touch sensor connected to sensor port 2 (for starting feeding)
OpenSwitch(SENSOR_2);

% Establish connection to a touch sensor connected to sensor port 2 (for starting feeding)
OpenSwitch(SENSOR_4);
% Establish connection to an ultrasonic range sensor connected to sensor port 3
%for sensing distance to the baby
OpenUltrasonic(SENSOR_3);

% Create an empty matrix to store the results
results = [];

%--------------------------------------------------------------------------------


i = 1;
while i<10
	i=i+1
	startproc(4)
end



%main loop sense for: sound, ultrasound, button(2)
n = 1;
tic;
while n==1
	if GetUltrasonic(SENSOR_3) < 45
		distanceproc(4)
	end
	if GetSwitch(SENSOR_2) == true
		feedproc(4)
	end
	if GetSwitch(SENSOR_4) == true
		songproc(4)
	end
	if GetSound(SENSOR_1) > 85
		cryproc(4)
	end
	if toc>60
		n=0
	end
end

% Close connection to the sensors
CloseSensor(SENSOR_1);
CloseSensor(SENSOR_2);
CloseSensor(SENSOR_3);
CloseSensor(SENSOR_4);
% Close connection to the NXT brick
COM_CloseNXT(MyNXT);

