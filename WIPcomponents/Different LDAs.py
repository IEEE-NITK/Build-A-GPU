import matplotlib.pyplot as plt

#Naive Algorithm
def naiveLD(x1, x2, y1, y2): 
    m = (y2 - y1) / (x2 - x1)  #m is slope 
    x_list=[]
    y_list=[]
    for x in range(x1, x2 + 1):  
        y = round(m*x + y1)
        x_list.append(x)
        y_list.append(y) 
        print(x, y) 
    plt.plot(x_list,y_list)
    plt.title("Naive")
    plt.grid(True)
    plt.show()

#Midpoint Algorithm
def midpointLD(x1, x2, y1, y2): 
    dx = x2-x1
    dy = y2-y1 
    x_list=[]
    y_list=[]
    E = 2*dy - dx
    xi,yi=x1,y1
    while xi<=x2:
      x_list.append(xi)
      y_list.append(yi) 
      
      if E>=0: #positive error
        yi += 1
        E -= 2*dx
      else:
        E += 2*dy
      xi += 1
      print(xi, yi) 
    plt.plot(x_list,y_list)
    plt.title("Midpoint")
    plt.grid(True)
    plt.show()


#DDA Algorithm
def DDALD(x1, x2, y1, y2): 
    dx = x2 - x1
    dy = y2 - y1 
    x_list=[]
    y_list=[]
    n = max(abs(dx),abs(dy))
    x_inc = dx/n
    y_inc = dy/n
    xi,yi=x1,y1
    for i in range(n + 1):  
        x_list.append(xi)
        y_list.append(yi) 
        xi += x_inc
        yi += y_inc
        print(xi, yi) 
    plt.plot(x_list,y_list)
    plt.title("DDA")
    plt.grid(True)
    plt.show()


#Bresenham's Algorithm
def bresenhamALD(x1, x2, y1, y2): 
    dx = x2 - x1
    dy = y2 - y1 
    x_list=[]
    y_list=[]
    if abs(dy) > abs(dx):
      dx,dy=dy,dx
      steep = True
    else:
      steep = False
    if dx>0:
      sx=1
    else:
      sx=-1
    if dy>0:
      sy=1
    else:
      sy=-1
    E = int(dx/2)
    xi,yi=x1,y1
    for i in range(dx + 1):  
        if steep:
          x_list.append(yi)
          y_list.append(xi)
        else:
          x_list.append(xi)
          y_list.append(yi)  
        E -= abs(dy)
        if E<0:
          E+=dx
          yi+=sy
        xi+=sx
        print(xi, yi) 
    plt.plot(x_list,y_list)
    plt.title("Bresenham")
    plt.grid(True)
    plt.show()
