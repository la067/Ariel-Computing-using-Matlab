function La_anc(model, droneSpeed, pauseDuration, numDummyLocs)
    netWidth = 1000;
    netHeight = 1000;

    dronePosition = [0, 0];
    droneStartPosition = dronePosition;

    totalDist = 0;
    totalTime = 0;

    figure;
    if model == 0
        for numIterations = 1:3
            dest = [randi(netWidth), randi(netHeight)];
            dist = norm(dest - dronePosition);
            time = dist / droneSpeed;

            traj = dronePosition + (dest - dronePosition) .* linspace(0, 1, round(time) + 1).';
            plot(traj(:,1), traj(:,2), 'k-', 'LineWidth', 1.5); 
            hold on;
            plot(dronePosition(1), dronePosition(2), 'b*');
            drawnow;

            dronePosition = dest;
            totalDist = totalDist + dist;

            pause(pauseDuration);
        end
         model_name = 'Random Waypoint (RWP) model';
        title(model_name);
        grid on;

    elseif model == 1
         grid on;
        model_name = 'Privacy-Preserving Random (PPR) model';
        title(model_name);
        for numIterations = 1:3
            dest = [randi(netWidth), randi(netHeight)];
            dist = norm(dest - dronePosition);
            time = dist / droneSpeed;

            rectDiag = [dronePosition; dest];
            rectangle('Position', [min(rectDiag), max(rectDiag) - min(rectDiag)], 'EdgeColor', [128, 0, 128]/255, 'LineWidth', 2);  % RGB for purple
            hold on;

            firstDummyLoc = [randi([min(rectDiag(:,1)), max(rectDiag(:,1))]), ...
                           randi([min(rectDiag(:,2)), max(rectDiag(:,2))])];
            dummyLocs = firstDummyLoc;

            for k = 1:numDummyLocs - 1
                dummyLoc = firstDummyLoc + (dest - firstDummyLoc) .* rand(1, 2);
                dummyLocs = [dummyLocs; dummyLoc];
            end

            for k = 1:numDummyLocs
                if k == 1
                    traj = dronePosition + (dummyLocs(k,:) - dronePosition) .* linspace(0, 1, round(time / numDummyLocs) + 1).';
                elseif k == numDummyLocs
                    traj = dummyLocs(k - 1,:) + (dest - dummyLocs(k - 1,:)) .* linspace(0, 1, round(time / numDummyLocs) + 1).';
                else
                    traj = dummyLocs(k - 1,:) + (dummyLocs(k,:) - dummyLocs(k - 1,:)) .* linspace(0, 1, round(time / numDummyLocs) + 1).';
                end
                plot(traj(:,1), traj(:,2), 'k-', 'LineWidth', 1.5);  % Black trajectory
                
                hold on;
                drawnow;
            end

            plot(dronePosition(1), dronePosition(2), 'og');
            hold off;
            drawnow;

            dronePosition = dest;
            totalDist = totalDist + dist;

            pause(pauseDuration);
        end

    else
        error('Invalid mobility model. Choose 0 for RWP or 1 for PPR.');
    end

    totalTime = totalDist / droneSpeed;

    fprintf('Total flying distance: %f meters\n', totalDist);
    fprintf('Total flying time: %f seconds\n', totalTime);
end
