t = out.tout;
y = out.turatie_motor;
sp = out.setpoint;

target = sp(end);            
threshold = 0.95 * target;

idx = find(y >= threshold, 1, 'first');

if ~isempty(idx)
    time_reached = t(idx);
    step_start_time = 1; 
    settling_time = time_reached - step_start_time;
    
    fprintf('\n====================================\n');
    fprintf('    ENGINE PERFORMANCE REPORT       \n');
    fprintf('====================================\n');
    fprintf('Target Speed (N1):     %.1f %%\n', target);
    fprintf('Peak Engine Speed:     %.2f %%\n', max(y));
    fprintf('Response Time (95%%):   %.3f seconds\n', settling_time);
    fprintf('====================================\n');
else
    fprintf('Engine did not reach the 95%% threshold during simulation.\n');
end
