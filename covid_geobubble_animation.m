%% COVID‑19 Geobubble Animation
clear; close all; clc;

%% 1. Check for required toolbox
if ~license('test', 'map_toolbox')
    error('Mapping Toolbox is required for this animation.');
end

%% 2. Load and filter data
filename = 'SE_CovidCases_Filtered.xlsx';
if ~exist(filename, 'file')
    error('File "%s" not found. Please place it in the current folder.', filename);
end
data = readtable(filename);

% Convert date column to datetime
data.date = datetime(data.date, 'InputFormat', 'yyyy-MM-dd HH:mm:ss');

% Define date range
startDate = datetime(2021,10,1);
endDate   = datetime(2022,1,12);
idx = data.date >= startDate & data.date <= endDate;
filtered = data(idx, :);

% Remove rows with missing coordinates
filtered(isnan(filtered.Lat) | isnan(filtered.Lon), :) = [];

% Replace negative numbers with zero (data corrections)
filtered.new_cases(filtered.new_cases < 0) = 0;
filtered.new_deaths(filtered.new_deaths < 0) = 0;

% Get sorted unique dates
uniqueDates = unique(filtered.date);
nDates = length(uniqueDates);

%% 3. Set up geographic axes
figure('Position', [100 100 1200 700]);
gx = geoaxes;                                      % create geographic axes
gx.Basemap = 'streets';                            % choose a basemap
gx.Title.String = 'COVID‑19 Daily New Cases & Deaths';
gx.Subtitle.String = datestr(uniqueDates(1), 'dd-mmm-yyyy');
hold on;

% Global limits for consistent scaling
globalMaxCases  = max(filtered.new_cases);
globalMaxDeaths = max(filtered.new_deaths);
if globalMaxCases == 0,  globalMaxCases = 1;  end
if globalMaxDeaths == 0, globalMaxDeaths = 1; end

% Bubble size range (in points^2)
minSize = 20;
maxSize = 800;

% Colormap for deaths (darker = more deaths)
cmap = flipud(hot(256));
colormap(gx, cmap);
cb = colorbar(gx);
cb.Label.String = 'New Deaths';

%% 4. Animate
for k = 1:nDates
    dayData = filtered(filtered.date == uniqueDates(k), :);
    if isempty(dayData), continue; end

    % Remove previous bubbles (safer than cla)
    delete(findall(gx, 'Type', 'bubblechart'));

    % Scale sizes linearly
    sizes = minSize + (dayData.new_cases / globalMaxCases) * (maxSize - minSize);
    colours = dayData.new_deaths;

    bubblechart(gx, dayData.Lat, dayData.Lon, sizes, colours);
    bubblelim(gx, [0 globalMaxDeaths]);   % consistent colour scale

    gx.Subtitle.String = datestr(uniqueDates(k), 'dd-mmm-yyyy');
    drawnow;
    pause(0.2);   % adjust speed as desired
end
