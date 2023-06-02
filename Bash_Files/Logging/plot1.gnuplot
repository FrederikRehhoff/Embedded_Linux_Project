### plot time series and statistics label
reset session

myTimeFmt = "%Y-%m-%d %H:%M:%S"
t0 = strptime(myTimeFmt,"2021-08-01")
Ncpu = 8

# create some random test data
set print $Data
    p(t) = (_tmp=p0+rand(0)*6-3, _tmp>100 ? 100 : _tmp<0 ? 0 : _tmp)
    do for [cpu=1:Ncpu] {
        p0 = rand(0)*100
        do for [t=t0:t0+24*3600:5*60] {       # steps in 5 minutes for 1 day
            print sprintf("%s\t%d\t%g",strftime(myTimeFmt,t),cpu,p0=p(0))
        }
        print ""; print ""   # two empty lines
    }
set print

set datafile separator tab
set format x "%H:%M" time
set key out
set grid x,y
set xlabel sprintf("%s",strftime("Date: %Y-%m-%d",t0))
set ylabel "CPU usage / %" font ",12"

# create statistics:
set print $Statistics
    do for [i=1:Ncpu] {
        stats $Data u 3 index i-1 nooutput
        print sprintf("%d %.1f %.1f",i,STATS_max,STATS_mean)
    }
set print

set bmargin screen 0.25
myLabelPosY = 0.11

set label 1 at screen 0.02, screen myLabelPosY "\nMax:\nAvg:"
do for [i=1:Ncpu] {
    set label i+1 at screen 1./(Ncpu+1)*i, myLabelPosY \
       sprintf("CPU %d:\n%s%%\n%s%%",i,word($Statistics[i],2),word($Statistics[i],3)) 
}

plot for [i=1:Ncpu] $Data u (timecolumn(1,myTimeFmt)):3 index i-1 w l ti sprintf("CPU %d",i)
### end of code

