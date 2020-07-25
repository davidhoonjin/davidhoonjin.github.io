function Result = GSR_feature(Data, original_fs, graph_flag)
% Result = GSR_feature(Data, original_fs, graph_flag)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Input arguments
% Data: time series * (Desired demension) sized 2 Dimension matrix or Vector with only time-series data
% original_fs: sampling frequency of the Data
% graph_flag: Plotting graph (true or false) * offset is false, plot graph 
% When using it, size of the Data should be Vector form with only time-series Data.
%
% Output arguments
% Result: mean of SCR amplitude, mean of duration, and number of SCR occurrence values in 3 Dimension vector
%
% Example
% fs = 10;
% x = rand(16*fs, 1)-.5;
% y = GSR_feature(x, fs, true);
%
%
% Developed by Hoonjin Jung, Undergraduate student in Hanyang University, davidhoonjin@hanyang.ac.kr,
% modified by Seonghun Park, Ph.D. student in Hanyang University, qqzzwwxx12@hanyang.ac.kr
%
% reference: Kim, K. H., Bang, S. W., & Kim, S. R. (2004). ...
% Emotion recognition system using short-term monitoring of physiological signals. ...
% Medical and biological engineering and computing, 42(3), 419-427.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

if nargin < 2
    error('Not enough input arguments')
elseif length(size(Data)) > 3
    error('input data should be maximum two demension')
elseif length(Data) ~= size(Data, 1)
    error('input data should be at the first demension')    % if the dimension is not clear, it will be treated as first dimension
end

if isempty(graph_flag)
    graph_flag = false;
elseif ~islogical(graph_flag)
    error('graph output deciding input arguments should be logical argument')
elseif size(Data, 2) ~= 1
    error('when using graph , input data should be vector')
end

% Down-sampling
downsample_fs = 16;
Data_raw = resample(Data, downsample_fs, original_fs);


% pre-allocation
smooth_order = 20;
filter_order = 6/2;
cutoff_freq = 0.2;
Result = zeros(3, size(Data_raw, 2));
Data_smoothing = zeros(size(Data_raw, 1)+smooth_order-2, size(Data_raw, 2));

% LPF
[b, a] = butter(filter_order, cutoff_freq/downsample_fs, 'low');
Data_filter = filtfilt(b, a, Data_raw);

% Detrend
Data_detrend = detrend(Data_filter);

% Differentiation
Data_diff = diff(Data_detrend);

% Smoothing
w = bartlett(smooth_order);
for i = 1:size(Data_diff, 2)
    Data_smoothing(:, i) = conv2(Data_diff(:, i), w);
end

% Z-score normalization
Data_Zscore = zscore(Data_smoothing, [], 1);

% Zero-crossing
zcr = @(v) find(v(:).*circshift(v(:), -1) < 0); 

for i = 1:size(Data_Zscore, 2)
    zcr_idx = [];
    zcr_idx = zcr(Data_Zscore(:, i));
    
    if ~isempty(zcr_idx) || length(zcr_idx) > 1
        if Data_Zscore(zcr_idx(1), i) > 0
            zcr_idx = zcr_idx(2:end);
        end
        
        if Data_Zscore(zcr_idx(end), i) < 0
            zcr_idx = zcr_idx(1:end-1);
        end
        
        if isempty(zcr_idx)
            continue;
        end
        
        SCR_amp = zeros(length(zcr_idx)/2, 1);
        SCR_duration = zeros(length(zcr_idx)/2, 1);
        
        for SCR_idx = 1:2:length(zcr_idx)
            SCR_amp(floor(SCR_idx/2)+1, 1) = max(Data_Zscore(zcr_idx(SCR_idx):zcr_idx(SCR_idx+1), i));
            SCR_duration(floor(SCR_idx/2)+1, 1) = (zcr_idx(SCR_idx+1)-zcr_idx(SCR_idx))/downsample_fs;
        end
        
        SCR_amp_mean = mean(SCR_amp);
        SCR_duration_mean = mean(SCR_duration);
        SCR_occurrence = floor(SCR_idx/2)+1;
        
        Result(:, i) = [SCR_amp_mean, SCR_duration_mean, SCR_occurrence];
    else
        Result(:, i) = 0;
    end
end

if graph_flag
    Data_plotting{1} = Data_raw;
    Data_plotting{2} = Data_filter;
    Data_plotting{3} = Data_detrend;
    Data_plotting{4} = Data_diff;
    Data_plotting{5} = Data_smoothing;
    Data_plotting{6} = Data_Zscore;

    title_disp = char('Raw', 'LPF', 'Detrend', 'Differentiation', 'Smooting', 'Z-score');

    figure('Position', [300 100 1200 800]);
    for i = 1:6
        x = linspace(0, 1, length(Data_plotting{i}))*(length(Data_raw)/downsample_fs);

        h = subplot(6, 1, i);
        plot(x, Data_plotting{i}, 'LineWidth', 1.5);
        title(title_disp(i, :), 'FontSize', 12, 'FontWeight', 'bold')
        h.FontSize = 11;
    end
    xlabel('Time (s)')
end









