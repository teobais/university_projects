function [ Collision_Count, Successful_Transmissions, Channel_Utilization, Network_Throughput ] = ALOHA( Sim_Time, Stations, Lambda, Transmission_Time, Random_Period, Frame_Length_Bytes)

Sim_Flag = true;
Time = 0;
Event_List = zeros(3,Stations+1);
Event_List(1,1:Stations) = 1;
Event_List(1,Stations+1) = 4;
Event_List(2,1:Stations) = 0;
Event_List(2,Stations+1) = Sim_Time;
Event_List(3,[1:Stations]) = [1:Stations];

Collision_Count = 0;
Successful_Transmissions = 0;
Channel_Utilization = 0;
Network_Throughput = 0;

Carrier = 0;
Station_State = zeros(1,Stations);

while Sim_Flag
    
    Event = Event_List(1,1);
    Time = Event_List(2,1);
    
    if Event == 1
        
        [Event_List] = Event1(Time, Event_List, Lambda);
        
    elseif Event == 2
        
        [ Event_List, Station_State, Carrier]=Event2( Time, Event_List, Station_State, Carrier, Transmission_Time, Stations);
    
    elseif Event == 3
        
        [ Event_List, Station_State, Carrier] = Event3( Time, Event_List, Random_Period, Station_State, Carrier, Stations);
        
    elseif Event==4
        
        [ Sim_Flag ]=Event4( Time, Event_List);
        
    end
    
    Event_List(:,1)=[];
    Event_List=(sortrows(Event_List',[2,1]))';
    
end

end

function [Event_List] = Event1(Time, Event_List, Lambda)

Event_List(1,end+1) = 2;
Event_List(2,end) = Time + exprnd(1/Lambda,1,1);
Event_List(3,end) = Event_List(3,1);
    
end

function [ Event_List, Station_State, Carrier]=Event2( Time, Event_List, Station_State, Carrier, Transmission_Time, Stations)

sprintf('Station %d is transmitting during %f-%f', Event_List(3,1), Time, Time + Transmission_Time)

Station_State(Event_List(3,1)) = 1;

if Carrier == 0
    Carrier = 1;
else
    disp('Collision')
    for counter_stations = 1:Stations
        if Station_State(counter_stations) == 1
            Station_State(counter_stations) = 2;
        end
    end
end

Event_List(1,end+1) = 3;
Event_List(2,end)=  Time + Transmission_Time;
Event_List(3,end) = Event_List(3,1);    
    
end

function [ Event_List, Station_State, Carrier] = Event3( Time, Event_List, Random_Period, Station_State, Carrier, Stations)

if Station_State(Event_List(3,1)) == 2 
    Event_List(1,end+1) = 2;
    Event_List(2,end) = Time + rand()*Random_Period;
    Event_List(3,end) = Event_List(3,1);
    sprintf('Station %d collided. It will transmit again at %f.', Event_List(3,1), Event_List(2,end))
elseif Station_State(Event_List(3,1))==1
    sprintf('Station %d transmitted successfully', Event_List(3,1)) 
    Event_List(1,end+1) = 1;
    Event_List(2,end) = Time;
    Event_List(3,end) = Event_List(3,1);
end

Station_State(Event_List(3,1)) = 0;
Carrier = 0;
for counter_stations=1:Stations
    if Station_State(counter_stations)==1 || Station_State(counter_stations)==2
        Carrier = 1;
        break;
    end
end
end

function [ Sim_Flag ]=Event4( Time, Event_List)

Sim_Flag = false;
disp('Simulation End')

end
