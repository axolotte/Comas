function totalOrder = totalOrder()

function Euclidic = euclidean(Points)


Euclidic = Points;
n = rows(Points);

#for every point calculate euclidic distance to R
#save distance into Euclidic, containing the point+distance
for i=1:n
  point = [Points(i,1) Points(i,2)];
  distance =  norm(R, point);
  Euclidic(i,3) = distance;
 end for
 
 #sort the point according to their distance to R
 function Sorted = sort(Euclidic)
 
 