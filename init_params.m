%% INITIALIZATION SCRIPT - TURBOFAN FADEC MODEL

% 1. State-Space Matrices (Linearized Engine Dynamics)
% A represents internal system stability, B is the control input (fuel flow)
A = [-5.0, -2.0; 2.0, 0]; 
B = [2.0; 0];
C = [0, 1]; 
D = 0;

% 2. Gain Scheduling Maps (Adaptive Control)
% n1_points: Operating regimes based on Fan Speed (%)
n1_points = [0, 30, 70, 90, 100];

% Kp and Ki: Proportional and Integral gains adjusted for each regime
% Lower gains at high RPM prevent instability and overspeed
kp_map = [2.2, 2.0, 1.8, 1.5, 1.2];    
ki_map = [0.3, 0.5, 0.8, 1.1, 1.5];

% 3. Kalman Filter Parameters (Noise Mitigation)
% Q: Process noise covariance (model uncertainty)
% R: Measurement noise covariance (sensor reliability)
Q = 0.05; 
R = 1;   

% 4. Simulation Constraints
step_time = 1;       % Time of throttle movement (seconds)
final_value = 100;   % Target N1 speed (%)

fprintf('====================================\n');
fprintf('   PARAMETERS LOADED SUCCESSFULLY   \n');
fprintf('   Ready to run Simulink model...   \n');
fprintf('====================================\n');