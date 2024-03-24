function [volume] = VolumeAir(hoursRan, csArea, vi)
    volume = csArea * vi * hoursRan * 60 * 60;
end