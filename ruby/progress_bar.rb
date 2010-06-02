# Based on the PHP version at http://www.counterjumper.com/2009/06/20/php-command-line-progress-bar/
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

# NOTE This doesn't work quite right.  It shouldn't take much time to fix up though -- let me know if you do.

# def progress_bar(current, total, label = 'Progress: ', interval = 5)
#   if current == 0
#     print label
# 
#     # start the bar
#     print '| 0%'
#   else
#     pos = current / total * 100
# 
#     if 0 == pos % interval
#       print "\010" if pos >= 10
#       print "\010" if pos == 100
#       
#       print "\010\010\010"
#       print "| #{pos}%"
#     end
#   end
# 
#   STDOUT.flush
# 
#   print "\n" if current == total
# end
# 
# progress = 0
# 
# while progress < 100
#   progress_bar(progress, 100)
#   progress += 1
#   sleep 0.1
# end
# 
