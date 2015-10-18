function[Average_Delay_Downstream, Average_Delay_Upstream, Drop_Ratio_Downstream, Drop_Ratio_Upstream, Misused, Throughput]=XG_PON_Standard(ONUs,Sim_Time,Lambda_Downstream,Lambda_Upstream,Background_Traffic,Queue_Size_Upstream,Queue_Size_Downstream,RTT_Factor, Rf, Ra, Rm)

format long;

% Time Assumption:

% 1 time unit = 1 usec

Transmission_Rate_Upload = 2.48832 * 1000000000 / 1000000; %bits per usec
Transmission_Rate_Download = 9.95328 * 1000000000 / 1000000; %bits per usec

%clc
format long

%Event_List=zeros(5,1:(ONUs+2));

%Open output traffic distributions

fid = fopen('VoIP_Size_Prob.txt','r');

VoIP_Size_Prob = zeros(1,0);

while true

    temp = fscanf(fid,'%f',1);
    
    if isempty(temp)
        break;
    else
        VoIP_Size_Prob(end+1) = temp;
    end

end

fclose(fid);

fid = fopen('VoIP_Size_Val.txt','r');

VoIP_Size_Val = zeros(1,0);

while true

    temp = fscanf(fid,'%f',1);
    
    if isempty(temp)
        break;
    else
        VoIP_Size_Val(end+1) = temp;
    end

end

fclose(fid);

fid = fopen('VoIP_Time_Prob.txt','r');

VoIP_Time_Prob = zeros(1,0);

while true

    temp = fscanf(fid,'%f',1);
    
    if isempty(temp)
        break;
    else
        VoIP_Time_Prob(end+1) = temp;
    end

end

fclose(fid);

fid = fopen('VoIP_Time_Val.txt','r');

VoIP_Time_Val = zeros(1,0);

while true

    temp = fscanf(fid,'%f',1);
    
    if isempty(temp)
        break;
    else
        VoIP_Time_Val(end+1) = temp;
    end

end

fclose(fid);

fid = fopen('Media_Size_Prob.txt','r');

Media_Size_Prob = zeros(1,0);

while true

    temp = fscanf(fid,'%f',1);
    
    if isempty(temp)
        break;
    else
        Media_Size_Prob(end+1) = temp;
    end

end

fclose(fid);

fid = fopen('Media_Size_Val.txt','r');

Media_Size_Val = zeros(1,0);

while true

    temp = fscanf(fid,'%f',1);
    
    if isempty(temp)
        break;
    else
        Media_Size_Val(end+1) = temp;
    end

end

fclose(fid);

fid = fopen('Media_Time_Prob.txt','r');

Media_Time_Prob = zeros(1,0);

while true

    temp = fscanf(fid,'%f',1);
    
    if isempty(temp)
        break;
    else
        Media_Time_Prob(end+1) = temp;
    end

end

fclose(fid);

fid = fopen('Media_Time_Val.txt','r');

Media_Time_Val = zeros(1,0);

while true

    temp = fscanf(fid,'%f',1);
    
    if isempty(temp)
        break;
    else
        Media_Time_Val(end+1) = temp;
    end

end

fclose(fid);

fid = fopen('Live_Size_Prob.txt','r');

Live_Size_Prob = zeros(1,0);

while true

    temp = fscanf(fid,'%f',1);
    
    if isempty(temp)
        break;
    else
        Live_Size_Prob(end+1) = temp;
    end

end

fclose(fid);

fid = fopen('Live_Size_Val.txt','r');

Live_Size_Val = zeros(1,0);

while true

    temp = fscanf(fid,'%f',1);
    
    if isempty(temp)
        break;
    else
        Live_Size_Val(end+1) = temp;
    end

end

fclose(fid);

fid = fopen('Live_Time_Prob.txt','r');

Live_Time_Prob = zeros(1,0);

while true

    temp = fscanf(fid,'%f',1);
    
    if isempty(temp)
        break;
    else
        Live_Time_Prob(end+1) = temp;
    end

end

fclose(fid);

fid = fopen('Live_Time_Val.txt','r');

Live_Time_Val = zeros(1,0);

while true

    temp = fscanf(fid,'%f',1);
    
    if isempty(temp)
        break;
    else
        Live_Time_Val(end+1) = temp;
    end

end

fclose(fid);

Event_List = zeros( 3, 0 );

for counter=1:ONUs
    
    if counter <= 0.1*ONUs
        
        Event_List(1, end + 1 ) = -1;
        Event_List(2, end ) = 0;
        Event_List(3, end ) = counter;        
        
    elseif counter <= 0.2*ONUs
        
        Event_List(1, end + 1 ) = -2;
        Event_List(2, end ) = 0;
        Event_List(3, end ) = counter;
        
    elseif counter <= 0.3*ONUs
        
        Event_List(1, end + 1 ) = -3;
        Event_List(2, end ) = 0;
        Event_List(3, end ) = counter;
        
    elseif counter <= 0.4*ONUs
        
        Event_List(1, end + 1 ) = -1;
        Event_List(2, end ) = 0;
        Event_List(3, end ) = counter;
        
        Event_List(1, end + 1 ) = -2;
        Event_List(2, end ) = 0;
        Event_List(3, end ) = counter;
        
     elseif counter <= 0.5*ONUs
        
        Event_List(1, end + 1 ) = -1;
        Event_List(2, end ) = 0;
        Event_List(3, end ) = counter;
        
        Event_List(1, end + 1 ) = -3;
        Event_List(2, end ) = 0;
        Event_List(3, end ) = counter;
        
    elseif counter <= 0.9*ONUs
        
        Event_List(1, end + 1 ) = -1;
        Event_List(2, end ) = 0;
        Event_List(3, end ) = counter;
        
        Event_List(1, end + 1 ) = -2;
        Event_List(2, end ) = 0;
        Event_List(3, end ) = counter;
        
        Event_List(1, end + 1 ) = -3;
        Event_List(2, end ) = 0;
        Event_List(3, end ) = counter;
         
    end
        
    %Event_List(4,counter) = 1;
    
end

Event_List(1, end + 1) = 3;
Event_List(2, end) = 0;

Event_List(1, end + 1) = 10;
Event_List(2, end) = Sim_Time;

Time=0;
flag=true;

Queue_Upstream=zeros(3,0,ONUs);

Index_Upstream = zeros(1,ONUs);

Queue_Downstream=zeros(3,0,ONUs);

Index_Downstream = zeros(1,ONUs);

Actual_Index_Downstream = zeros(1,ONUs);

ID_Upstream = zeros(1,ONUs);

ID_Downstream = zeros(1,ONUs);

Total_Arrivals_Upstream = zeros(1,ONUs);

Total_Arrivals_Downstream = zeros(1,ONUs);

Dropped_Upstream = zeros(1,ONUs);

Dropped_Downstream = zeros(1,ONUs);

Drop_Ratio_Downstream = 0;
Drop_Ratio_Upstream = 0;

SN_Downstream_Frame = 0;
SN_Upstream_Frame = zeros(1,ONUs);

RTT = zeros(1,ONUs);

%RTT(1:end) = 30./300000*1000000; %usec

for counter=1:ONUs
    RTT(counter) = (RTT_Factor+round(counter/10))./300000*1000000; %usec
end

Response_ONU = zeros(1,ONUs);
Response_ONU(1:ONUs) = 35;

CAT = 0;

Buff_Occ = zeros(1,ONUs);
Reg_Buff_Occ = zeros(1,ONUs);

Guard_Time = 8*8/Transmission_Rate_Upload;

Average_Delay_Downstream = 0;
Average_Delay_Downstream_Numerator = 0;
Average_Delay_Downstream_Denumerator = 0;
Average_Delay_Upstream = 0;
Average_Delay_Upstream_Numerator = 0;
Average_Delay_Upstream_Denumerator = 0;

Average_Delay_Downstream_per_ONU(1,ONUs) = 0;
Average_Delay_Downstream_Numerator_per_ONU(1,ONUs) = 0;
Average_Delay_Downstream_Denumerator_per_ONU(1,ONUs) = 0;
Average_Delay_Upstream_per_ONU(1,ONUs) = 0;
Average_Delay_Upstream_Numerator_per_ONU(1,ONUs) = 0;
Average_Delay_Upstream_Denumerator_per_ONU(1,ONUs) = 0;

Fixed_Lost_per_ONU = zeros(1,ONUs);
Fixed_Allocated_per_ONU = zeros(1,ONUs);

Misused = zeros(1,ONUs);

Sum_Bytes_Delivered = 0;

Throughput = 0;

while flag
   Event=Event_List(1,1);
   Time = Event_List(2,1);
   
          if Time ~= 0 && mod( round(Time), 10000 ) == 0
           
           Time
           
           Average_Delay_Upstream = Average_Delay_Upstream_Numerator./Average_Delay_Upstream_Denumerator
           
           fprintf('ONUs = %d. Standard Progress %f\n',ONUs,Time*100/Sim_Time)
       
       end
   
   if Event==-1 %VoIP
       Time=Event_List(2,1);
     
       
       Random_Generator = rand;
       
       for counter = 1 : length( VoIP_Size_Prob )
           
           Sum_Probabilities = sum( VoIP_Size_Prob( 1 : counter ) );
           
           if Random_Generator < Sum_Probabilities
               
               Packet_Size = VoIP_Size_Val( counter );
               break;
               
           end
           
       end
       
       Random_Generator = rand;
       
       for counter = 1 : length( VoIP_Time_Prob )
           
           Sum_Probabilities = sum( VoIP_Time_Prob( 1 : counter ) );
           
           if Random_Generator < Sum_Probabilities
               
               Interarrival = VoIP_Time_Val( counter );
               break;
               
           end
           
       end
       
       Total_Arrivals_Upstream( Event_List(3,1) ) = Total_Arrivals_Upstream( Event_List(3,1) ) + 1;
        
       %fprintf('\n==========Upstream Packet (%d B) for Node %d in Time: %f\n',Packet_Size,Event_List(3,1),Time);
       %fprintf('\n==========Total Packets %d, Total Bytes (before) %d, Queue Size %d\n',Index_Upstream( Event_List(3,1) ), sum(Queue_Upstream(2,:,Event_List(3,1))), Queue_Size_Upstream)
       
       if ( Packet_Size + sum(Queue_Upstream(2,:,Event_List(3,1) ) ) <= Queue_Size_Upstream )
           
           ID_Upstream( Event_List(3,1) ) = ID_Upstream( Event_List(3,1) ) + 1;
           Index_Upstream( Event_List(3,1) ) = Index_Upstream( Event_List(3,1) ) + 1;
           Queue_Upstream(1, Index_Upstream(Event_List(3,1)) ,Event_List(3,1)) = ID_Upstream( Event_List(3,1) );
           Queue_Upstream(2, Index_Upstream(Event_List(3,1)) ,Event_List(3,1)) = Packet_Size*8;
           Queue_Upstream(3,Index_Upstream(Event_List(3,1)), Event_List(3,1)) = Time;
           
       else 
           
           %fprintf('\n==========Upstream Packet Dropped in Time: %f\n',Time);
           %fprintf('\n==========Upstream Queue Size (for the ONU %d): %d\n', Event_List(3,1), sum(Queue_Upstream(2, :, Event_List(3,1) )) );
           Dropped_Upstream( Event_List(3,1) ) = Dropped_Upstream( Event_List(3,1) ) + 1;
       end
       
       %Order = Order + 1;
       
       %if Order < length(Traffic_VoIP)
           
           Event_List(1,end+1)=-1;
           Event_List(2,end)=Time + Interarrival;
           Event_List(3,end)=Event_List(3,1);
           %Event_List(4,end)=Order;
           
       %end
       
   end %Event
   
   if Event==-2 %MediaStreaming
       Time=Event_List(2,1);
       
       %Order = Event_List(4,1);
       
       Random_Generator = rand;
       
       for counter = 1 : length( Media_Size_Prob )
           
           Sum_Probabilities = sum( Media_Size_Prob( 1 : counter ) );
           
           if Random_Generator < Sum_Probabilities
               
               Packet_Size = Media_Size_Val( counter );
               break;
               
           end
           
       end
       
       Random_Generator = rand;
       
       for counter = 1 : length( Media_Time_Prob )
           
           Sum_Probabilities = sum( Media_Time_Prob( 1 : counter ) );
           
           if Random_Generator < Sum_Probabilities
               
               Interarrival = Media_Time_Val( counter );
               break;
               
           end
           
       end
       
       Total_Arrivals_Upstream( Event_List(3,1) ) = Total_Arrivals_Upstream( Event_List(3,1) ) + 1;
        
       %fprintf('\n==========Upstream Packet (%d B) for Node %d in Time: %f\n',Packet_Size,Event_List(3,1),Time);
       %fprintf('\n==========Total Packets %d, Total Bytes (before) %d, Queue Size %d\n',Index_Upstream( Event_List(3,1) ), sum(Queue_Upstream(2,:,Event_List(3,1))), Queue_Size_Upstream)
       
       if ( Packet_Size + sum(Queue_Upstream(2,:,Event_List(3,1) ) ) <= Queue_Size_Upstream )
           
           ID_Upstream( Event_List(3,1) ) = ID_Upstream( Event_List(3,1) ) + 1;
           Index_Upstream( Event_List(3,1) ) = Index_Upstream( Event_List(3,1) ) + 1;
           Queue_Upstream(1, Index_Upstream(Event_List(3,1)) ,Event_List(3,1)) = ID_Upstream( Event_List(3,1) );
           Queue_Upstream(2, Index_Upstream(Event_List(3,1)) ,Event_List(3,1)) = Packet_Size;
           Queue_Upstream(3,Index_Upstream(Event_List(3,1)), Event_List(3,1)) = Time;
           
       else 
           
           %fprintf('\n==========Upstream Packet Dropped in Time: %f\n',Time);
           %fprintf('\n==========Upstream Queue Size (for the ONU %d): %d\n', Event_List(3,1), sum(Queue_Upstream(2, :, Event_List(3,1) )) );
           Dropped_Upstream( Event_List(3,1) ) = Dropped_Upstream( Event_List(3,1) ) + 1;
       end
       
       %Order = Order + 1;
       
       %if Order < length(Traffic_MediaStreaming)
           
           Event_List(1,end+1)=-2;
           Event_List(2,end)=Time + Interarrival;
           Event_List(3,end)=Event_List(3,1);
           %Event_List(4,end)=Order;
           
       %end
       
   end %Event
   
      if Event==-3 %LiveStream
       Time=Event_List(2,1);
       
       %Order = Event_List(4,1);
       
       Random_Generator = rand;
       
       for counter = 1 : length( Live_Size_Prob )
           
           Sum_Probabilities = sum( Live_Size_Prob( 1 : counter ) );
           
           if Random_Generator < Sum_Probabilities
               
               Packet_Size = Live_Size_Val( counter );
               break;
               
           end
           
       end

       Random_Generator = rand;
       
       for counter = 1 : length( Live_Time_Prob )
           
           Sum_Probabilities = sum( Live_Time_Prob( 1 : counter ) );
           
           if Random_Generator < Sum_Probabilities
               
               Interarrival = Live_Time_Val( counter );
               break;
               
           end
           
       end
       
       Total_Arrivals_Upstream( Event_List(3,1) ) = Total_Arrivals_Upstream( Event_List(3,1) ) + 1;
        
       %fprintf('\n==========Upstream Packet (%d B) for Node %d in Time: %f\n',Packet_Size,Event_List(3,1),Time);
       %fprintf('\n==========Total Packets %d, Total Bytes (before) %d, Queue Size %d\n',Index_Upstream( Event_List(3,1) ), sum(Queue_Upstream(2,:,Event_List(3,1))), Queue_Size_Upstream)
       
       if ( Packet_Size + sum(Queue_Upstream(2,:,Event_List(3,1) ) ) <= Queue_Size_Upstream )
           
           ID_Upstream( Event_List(3,1) ) = ID_Upstream( Event_List(3,1) ) + 1;
           Index_Upstream( Event_List(3,1) ) = Index_Upstream( Event_List(3,1) ) + 1;
           Queue_Upstream(1, Index_Upstream(Event_List(3,1)) ,Event_List(3,1)) = ID_Upstream( Event_List(3,1) );
           Queue_Upstream(2, Index_Upstream(Event_List(3,1)) ,Event_List(3,1)) = Packet_Size;
           Queue_Upstream(3,Index_Upstream(Event_List(3,1)), Event_List(3,1)) = Time;
           
       else 
           
           %fprintf('\n==========Upstream Packet Dropped in Time: %f\n',Time);
           %fprintf('\n==========Upstream Queue Size (for the ONU %d): %d\n', Event_List(3,1), sum(Queue_Upstream(2, :, Event_List(3,1) )) );
           Dropped_Upstream( Event_List(3,1) ) = Dropped_Upstream( Event_List(3,1) ) + 1;
       end
       
       %Order = Order + 1;
       
       %if Order < length(Traffic_LiveStream)
           
           Event_List(1,end+1)=-3;
           Event_List(2,end)=Time + Interarrival;
           Event_List(3,end)=Event_List(3,1);
           %Event_List(4,end)=Order;
           
       %end
       
   end %Event
   
   if Event==1
       Time=Event_List(2,1);
       
       Random_Generator = rand;
       
       if Random_Generator < 0.3
           
           A = VoIP_Size_Prob;
           B = VoIP_Size_Val;
           C = VoIP_Time_Prob;
           D = VoIP_Time_Val;
           
       elseif Random_Generator < 0.6
           
           A = Media_Size_Prob;
           B = Media_Size_Val;
           C = Media_Time_Prob;
           D = Media_Time_Val;
           
       else
           
           A = Live_Size_Prob;
           B = Live_Size_Val;
           C = Live_Time_Prob;
           D = Live_Time_Val;
           
       end
       
       Random_Generator = rand;
       
       for counter = 1 : length( A )
           
           Sum_Probabilities = sum( A( 1 : counter ) );
           
           if Random_Generator < Sum_Probabilities
               
               Packet_Size = B( counter );
               break;
               
           end
           
       end

       Random_Generator = rand;
       
       for counter = 1 : length( C )
           
           Sum_Probabilities = sum( C( 1 : counter ) );
           
           if Random_Generator < Sum_Probabilities
               
               Interarrival = D( counter );
               break;
               
           end
           
       end
       
       if rand < 0.5
       
       Total_Arrivals_Upstream( Event_List(3,1) ) = Total_Arrivals_Upstream( Event_List(3,1) ) + 1;
        
       %fprintf('\n==========Upstream Packet (%d B) for Node %d in Time: %f\n',Packet_Size,Event_List(3,1),Time);
       %fprintf('\n==========Total Packets %d, Total Bytes (before) %d, Queue Size %d\n',Index_Upstream( Event_List(3,1) ), sum(Queue_Upstream(2,:,Event_List(3,1))), Queue_Size_Upstream)
       
       if ( Packet_Size + sum(Queue_Upstream(2,:,Event_List(3,1) ) ) <= Queue_Size_Upstream )
           
           ID_Upstream( Event_List(3,1) ) = ID_Upstream( Event_List(3,1) ) + 1;
           Index_Upstream( Event_List(3,1) ) = Index_Upstream( Event_List(3,1) ) + 1;
           Queue_Upstream(1, Index_Upstream(Event_List(3,1)) ,Event_List(3,1)) = ID_Upstream( Event_List(3,1) );
           Queue_Upstream(2, Index_Upstream(Event_List(3,1)) ,Event_List(3,1)) = Packet_Size;
           Queue_Upstream(3,Index_Upstream(Event_List(3,1)), Event_List(3,1)) = Time;
           
       else 
           
           %fprintf('\n==========Upstream Packet Dropped in Time: %f\n',Time);
           %fprintf('\n==========Upstream Queue Size (for the ONU %d): %d\n', Event_List(3,1), sum(Queue_Upstream(2, :, Event_List(3,1) )) );
           Dropped_Upstream( Event_List(3,1) ) = Dropped_Upstream( Event_List(3,1) ) + 1;
       end
       
       end
       
       Event_List(1,end+1)=1;
       
       Event_List(2,end)=Time + Interarrival;

       Event_List(3,end)=Event_List(3,1);
       
   end %Event
   
   if Event==2
       Time=Event_List(2,1);
       
       Packet_Size = ceil(rand*(1518-64)+64);
       
       Total_Arrivals_Downstream ( Event_List(3,1) ) = Total_Arrivals_Downstream ( Event_List(3,1) ) + 1;
       
       %fprintf('\n==========Downstream Packet (%d B) for Node %d in Time: %f\n',Packet_Size,Event_List(3,1),Time);
       %fprintf('\n==========Total Packets %d, Total Bytes (before) %d, Queue Size %d\n',Index_Downstream( Event_List(3,1) ),sum(sum(Queue_Downstream(2, :, : ))), Queue_Size_Downstream)

       ONU_Destination = Event_List(3,1);
       
       if ( Packet_Size + sum(sum(Queue_Downstream(2, :, : ))) <= Queue_Size_Downstream )
           
           ID_Downstream( ONU_Destination ) = ID_Downstream( ONU_Destination ) + 1;
           Index_Downstream( ONU_Destination ) = Index_Downstream( ONU_Destination ) + 1;
           Queue_Downstream(1, Index_Downstream( ONU_Destination ), ONU_Destination ) = ID_Downstream( ONU_Destination );
           Queue_Downstream(2, Index_Downstream( ONU_Destination ), ONU_Destination ) = Packet_Size;
           Queue_Downstream(3, Index_Downstream( ONU_Destination ), ONU_Destination ) = Time;
           
       else 
           
           %fprintf('\n==========Downstream Packet Dropped in Time: %f\n',Time);
           %fprintf('\n==========Downstream Queue Size: %d\n', sum(sum(Queue_Downstream(2, :, : ))) );
           Dropped_Downstream( ONU_Destination ) = Dropped_Downstream( ONU_Destination ) + 1;
           
       end
       
       Event_List(1, end + 1)=2;
       Event_List(2, end )=Time+exprnd(1/Lambda_Downstream,1,1);
       Event_List(3, end)=Event_List(3,1);
        
   end %Event
   
   if Event == 3
       
       Time=Event_List(2,1);
       
       SN_Downstream_Frame = SN_Downstream_Frame + 1;
       
       %fprintf('\n==========Downstream Frame (#%d) Transmission in Time: %f\n',SN_Downstream_Frame,Time);
       
       Available_Bytes = 135432+24;
       Header_Bytes = 0;
       Available_Bytes = Available_Bytes - 24; %PSBd
       Header_Bytes = Header_Bytes + 24;
       Available_Bytes = Available_Bytes - 4; %HLend
       Header_Bytes = Header_Bytes + 4;
       Available_Bytes = Available_Bytes - ONUs*8; %BWMap
       Header_Bytes = Header_Bytes + ONUs*8;
       
       Number_PLOA_Messages = ceil(rand*10);
       
       Available_Bytes = Available_Bytes - Number_PLOA_Messages*24;
       Header_Bytes = Header_Bytes + Number_PLOA_Messages*24;
       
       Number_Waiting_Packets = sum( Index_Downstream ) - sum( Actual_Index_Downstream );
       
       Allocated_Bytes_per_ONU = zeros(1,ONUs);
       Allocated_Packets_per_ONU = zeros(1,ONUs);
       
       Selected_ONU = 0;
       
       while ( Number_Waiting_Packets > 0 && Available_Bytes > 0 )
           
           Min_Arrival_Time = Time;
           Selected_ONU = 0;
           
           for counter=1:ONUs
               
               if Actual_Index_Downstream( counter ) <  Index_Downstream( counter )
                   
                   if Queue_Downstream(2, Actual_Index_Downstream( counter ) + 1, counter) <= Available_Bytes && Queue_Downstream(3, Actual_Index_Downstream( counter ) + 1, counter) <= Min_Arrival_Time
                       
                       Min_Arrival_Time = Queue_Downstream(3, Actual_Index_Downstream( counter ) + 1, counter);
                       Selected_ONU = counter;
                       
                   end
                   
               end
               
           end
           
           if Selected_ONU ~= 0
               
               Available_Bytes = Available_Bytes - Queue_Downstream(2, Actual_Index_Downstream( Selected_ONU ) + 1, Selected_ONU);
               Allocated_Bytes_per_ONU(Selected_ONU) = Allocated_Bytes_per_ONU(Selected_ONU) + Queue_Downstream(2, Actual_Index_Downstream( Selected_ONU ) + 1, Selected_ONU);
               Allocated_Packets_per_ONU(Selected_ONU) = Allocated_Packets_per_ONU(Selected_ONU) + 1;
               Number_Waiting_Packets = Number_Waiting_Packets - 1;
               Actual_Index_Downstream( Selected_ONU ) = Actual_Index_Downstream( Selected_ONU ) + 1;
               
               
               
               Event_List(1, end + 1) = 4;
               Coding_Bytes = ceil ((Header_Bytes - 24 + sum( Allocated_Bytes_per_ONU) ) / 216)*32; 
               Transmission_Delay = ((Header_Bytes + sum( Allocated_Bytes_per_ONU) + Coding_Bytes)*8)/Transmission_Rate_Download;
               
               Event_List(2, end) = Time + Transmission_Delay + RTT(Selected_ONU)/2;
               
               Event_List(3, end) = Selected_ONU;
               
           else
               
               Number_Waiting_Packets = 0;
               
           end
           
       end
       
       %Upstream Scheduling
       
       Available_Upstream_Bytes = 38880;  %mikta
       
       Available_Upstream_Bytes = Available_Upstream_Bytes - 28*ONUs; % 28 bytes = PSBu
       
       Available_Upstream_Bytes = Available_Upstream_Bytes - (4 + 4 + 4 + 16)*ONUs; % 4+4+4 Header bytes, 48bytes=PLOAMu me 50% piuanothta na symmetexoyn sto frame 
       
       Available_Upstream_Bytes = Available_Upstream_Bytes - ceil(16/232*Available_Upstream_Bytes); %prostithentai ta coding bytes, 16 ana 232.
       
       Assigned_Bytes_per_ONU = zeros(1,ONUs); % posa tha parei i kathe onu telika ka8ara
       Upstream_Frame_Bytes_per_ONU = zeros(1,ONUs); % to mikto upstream burst frame
       
       Assigned_Bytes_per_ONU(1:end) = Rf;
       
       for counter = 1 : ONUs
           
           if Rf > Buff_Occ( counter )
               
               Fixed_Lost_per_ONU( counter ) = Fixed_Lost_per_ONU( counter ) + Rf - Buff_Occ( counter );
               
           end
           
           Fixed_Allocated_per_ONU(counter) = Fixed_Allocated_per_ONU(counter) + Rf;
           
       end
       
       Available_Upstream_Bytes = Available_Upstream_Bytes - sum( Assigned_Bytes_per_ONU ); 
       
       %an oi anagkes tou onu ksepernoun to Rf pairnei kai Ra
       
       for counter = 1:ONUs
           if Buff_Occ(counter) > Rf
               if Buff_Occ(counter) > Rf + Ra
                   Assigned_Bytes_per_ONU(counter) = Assigned_Bytes_per_ONU(counter) + Ra;
                   Available_Upstream_Bytes = Available_Upstream_Bytes - Ra;
               else
                   Assigned_Bytes_per_ONU(counter) = Assigned_Bytes_per_ONU(counter) + Buff_Occ(counter) - Rf;
                   Available_Upstream_Bytes = Available_Upstream_Bytes - ( Buff_Occ(counter) - Rf );
               end
           end
       end
       
       Surplus = 0;
       Surplus_Number = 0;
       
       % an oi anagkes tou onu ksepernoun to Rf  kai to Ra 
       for counter = 1:ONUs
           if Buff_Occ(counter) > Rf+Ra
               if Buff_Occ(counter) > Rm+Ra+Rf
                   Surplus = Surplus + Rm;
                   Surplus_Number = Surplus_Number + 1;
               else
                   Surplus = Surplus + Buff_Occ(counter)-Rf-Ra;
                   Surplus_Number = Surplus_Number + 1;
               end
           end
       end

       if Surplus > Available_Upstream_Bytes %no bandwidth is available to cover Rm for all
           
           while Available_Upstream_Bytes > 0 %oso yparxoun akoma diathesima bytes gia na dwthoun 
               
               Portion_Bytes = ceil(Available_Upstream_Bytes/Surplus_Number); % ta bytes pou analogika tha dwthoun se autous pou den ikanopoiithikan
               Surplus_Number = 0;
               for counter = 1:ONUs
                    if Assigned_Bytes_per_ONU(counter) < Buff_Occ(counter)
                        if Assigned_Bytes_per_ONU(counter) + Portion_Bytes > Rf+Ra+Rm
                            Assigned_Bytes_per_ONU(counter) = Assigned_Bytes_per_ONU(counter) + Rf+Ra+Rm - Assigned_Bytes_per_ONU(counter);
                            Available_Upstream_Bytes = Available_Upstream_Bytes - ( Rf+Ra+Rm - Assigned_Bytes_per_ONU(counter) );
                        else
                            Assigned_Bytes_per_ONU(counter) = Assigned_Bytes_per_ONU(counter) + Portion_Bytes;
                            Surplus_Number = Surplus_Number + 1;
                            Available_Upstream_Bytes = Available_Upstream_Bytes - Portion_Bytes;
                        end
                    end
               end
           end

           Available_Upstream_Bytes = 0;
       else % there is bandwidth to cover Rm
           for counter = 1:ONUs
               if Buff_Occ(counter) > Rf+Ra
                    if Buff_Occ(counter) > Rm+Ra+Rf
                        Assigned_Bytes_per_ONU(counter) = Assigned_Bytes_per_ONU(counter) + Rm;
                        Available_Upstream_Bytes = Available_Upstream_Bytes - Rm;
                    else
                        Assigned_Bytes_per_ONU(counter) = Assigned_Bytes_per_ONU(counter) + Buff_Occ(counter)-Rf-Ra;
                        Available_Upstream_Bytes = Available_Upstream_Bytes - (Buff_Occ(counter)-Rf-Ra);
                    end
               end
           end
           %there is available bandwidth to cover BE traffic
           Surplus = 0;
           Surplus_Number = 0;
       
           for counter = 1:ONUs
               if Buff_Occ(counter) > Rf+Ra+Rm
                   Surplus = Surplus + Buff_Occ(counter) - Rf - Ra - Rm;
                   Surplus_Number = Surplus_Number + 1;
               end
           end
           
           %an iparxoun bytes na kalipsoun to BE
           if (Available_Upstream_Bytes > Surplus)
               for counter = 1:ONUs
                   if Buff_Occ(counter) > Rf+Ra+Rm
                       Assigned_Bytes_per_ONU(counter) = Assigned_Bytes_per_ONU(counter) + Buff_Occ(counter) - Rf - Ra - Rm;
                       Available_Upstream_Bytes = Available_Upstream_Bytes - ( Buff_Occ(counter) - Rf - Ra - Rm );
                   end
               end
           else
               while Available_Upstream_Bytes > 0
               
                   Portion_Bytes = ceil(Available_Upstream_Bytes/Surplus_Number);
                   Surplus_Number = 0;
                   for counter = 1:ONUs
                       if Assigned_Bytes_per_ONU(counter) < Buff_Occ(counter)  
                            if Assigned_Bytes_per_ONU(counter) + Portion_Bytes > Buff_Occ(counter) % elegxos gia na mi parei kapoia onu parapanv apo oti xreiazetai
                                   Bytes_to_be_Granted = Buff_Occ(counter) - Assigned_Bytes_per_ONU(counter);
                                   Assigned_Bytes_per_ONU(counter) = Assigned_Bytes_per_ONU(counter) + Bytes_to_be_Granted;
                                   %Surplus = Surplus - ( Buff_Occ(counter) - Assigned_Bytes_per_ONU(counter) );
                                   Available_Upstream_Bytes = Available_Upstream_Bytes - Bytes_to_be_Granted;
                            else
                                   Assigned_Bytes_per_ONU(counter) = Assigned_Bytes_per_ONU(counter) + Portion_Bytes;
                                   %Surplus = Surplus - Portion_Bytes;
                                   Surplus_Number = Surplus_Number + 1;
                                   Available_Upstream_Bytes = Available_Upstream_Bytes - Portion_Bytes;
                            end
                       end
                   end
                   
                   if Surplus_Number==0
                       break;
                   end
                   
                end
           Available_Upstream_Bytes = 0;

           end
       end
       
%        Assigned_Bytes_per_ONU
%        sum(Assigned_Bytes_per_ONU)
%        
%        pause
       
       for counter = 1:ONUs
          
           Event_List(1, end + 1) = 5;
           
           Event_List(2, end) = Time + (24+4+counter*8)*8/Transmission_Rate_Download + RTT(counter)/2;
           
           Event_List(3, end) = counter;
           
           Event_List(4, end) = Assigned_Bytes_per_ONU(counter);
           
           if Assigned_Bytes_per_ONU(counter) > Buff_Occ(counter) % elegxos an auta pou tou eipe o olt na steilei einai perissotera apo tis anagkes tou (Buff_Occ) ousiatika to report
               Buff_Occ(counter) = 0;
           else
               Buff_Occ(counter) = Buff_Occ(counter) - Assigned_Bytes_per_ONU(counter);
           end
           
           Arrival_Time_of_BWMAP = Time + (24+4+counter*8)*8/Transmission_Rate_Download + RTT(counter)/2;
           
           
           
           Coding_Bytes = ceil ( (4 + 4 + 4 + Assigned_Bytes_per_ONU(counter) )*16/232 );
           
           Upstream_Frame_Bytes_per_ONU( counter ) = 28 + 4 + 4 + 4 + Assigned_Bytes_per_ONU(counter) + Coding_Bytes;
           
           if Arrival_Time_of_BWMAP + Response_ONU(counter) + RTT(counter)/2 > CAT
               Requisite_Delay = 0;
               
               CAT = Arrival_Time_of_BWMAP + Response_ONU(counter) + RTT(counter)/2 + ( Upstream_Frame_Bytes_per_ONU( counter ) )*8/Transmission_Rate_Upload + Guard_Time;
               
           else
               Requisite_Delay = CAT - ( Arrival_Time_of_BWMAP + Response_ONU(counter) + RTT(counter)/2 );
               
               CAT = Arrival_Time_of_BWMAP + Response_ONU(counter) + RTT(counter)/2 + Requisite_Delay + ( Upstream_Frame_Bytes_per_ONU( counter ) )*8/Transmission_Rate_Upload + Guard_Time;
               
           end
           
           Event_List(5, end) = Requisite_Delay;
           
       end
       
       Event_List(1, end + 1)= 3;
       Event_List(2, end )=Time + 125;
       
   end
   
   if Event == 4
      
       Time=Event_List(2,1);
       
       %fprintf('\n======> (Downstream) A Data Packet has reached to ONU %d in Time: %f\n',Event_List(3,1),Time);

       Average_Delay_Downstream_Numerator = Average_Delay_Downstream_Numerator + Time - Queue_Downstream(3,1,Event_List(3,1));
       
       Average_Delay_Downstream_Numerator_per_ONU( Event_List(3,1) ) = Average_Delay_Downstream_Numerator_per_ONU( Event_List(3,1) ) + Time - Queue_Downstream(3,1,Event_List(3,1));
       
       Average_Delay_Downstream_Denumerator = Average_Delay_Downstream_Denumerator + 1;
       
       Average_Delay_Downstream_Denumerator_per_ONU( Event_List(3,1) ) = Average_Delay_Downstream_Denumerator_per_ONU( Event_List(3,1) ) + 1;

       Queue_Downstream(:,1,Event_List(3,1)) = 0;

       for counter=2:Index_Downstream ( Event_List(3,1) )

           Queue_Downstream(:,counter-1,Event_List(3,1)) = Queue_Downstream(:,counter,Event_List(3,1));

       end

       Queue_Downstream(:,Index_Downstream (Event_List(3,1)), Event_List(3,1)) = 0;

       Index_Downstream( Event_List(3,1) ) = Index_Downstream( Event_List(3,1) ) - 1;
       
       Actual_Index_Downstream( Event_List(3,1) ) = Actual_Index_Downstream( Event_List(3,1) ) - 1;
       
       %fprintf('\n==========It Delayed  %f\n',);
       
   end
   
   %event 5 pote tha ftasei to paketo tis kathe onu ston olt
   if Event==5
       
       Time=Event_List(2,1);
       
       %fprintf('\n======> A Downstream Frame (#%d) has reached to ONU %d in Time: %f\n',SN_Downstream_Frame,Event_List(3,1),Time);
       %fprintf('\n======> BWMap (Allocated Bytes = %d, Requisite Delay = %f\n',Event_List(4,1),Event_List(5,1)); 
       
       Event_List(1, end + 1) = 6;
       %no PLOAM messages are used
       Coding_Bytes = (4 + 4 + 4 + Event_List(4,1) )*16/232; %kodikopoisi, ta 28 bytes PSBu de kodikopoiountai
       %xrnos pou tha ftasei to paketo tou onu ston olt
       Event_List(2, end) = Time + Response_ONU( Event_List(3,1) ) + Event_List(5,1) + RTT( Event_List(3,1) )/2 + (28 + 4 + 4 + 4 + Event_List(4,1) + Coding_Bytes)*8/Transmission_Rate_Upload;
       Event_List(3, end) = Event_List(3,1);
       
       Report = sum( Queue_Upstream(2,:,Event_List(3,1)) ); % ti exei stin oura tou
       
       %fprintf('\n======> The Buffer of the Node has %d Bytes\n', Report);
       
       if Event_List(4,1) >= Report - Reg_Buff_Occ( Event_List(3,1) )   %an auta pou tou eipe na steilei o olt einai perissotera apo auta pou exei twra stin oura meion ta kratimena apo ton proigoumrno kiklo
           Event_List(4, end) = Report - Reg_Buff_Occ( Event_List(3,1) ); % i tetarti grammi tou event 6, enomerwnei ti tha bgei apo tin oura 
           Reg_Buff_Occ( Event_List(3,1) ) = Reg_Buff_Occ( Event_List(3,1) ) + Report - Reg_Buff_Occ( Event_List(3,1) ); %ta ktatimena bytes einai osa itan sin auta pou exei anagki na steilei twra (bgalame auta pou tou eipe o olt na steilei Event_List(4,1) 
           temp_Buff_Occ = 0;   % den exei bytes gia apostoli
       else
           Event_List(4, end) = Event_List(4,1);   % 
           Reg_Buff_Occ( Event_List(3,1) ) = Reg_Buff_Occ( Event_List(3,1) ) + Event_List(4,1); % ta kratimena twra einai osa itan
           temp_Buff_Occ = Report - Reg_Buff_Occ( Event_List(3,1) );  % twra i oura tou exei (to neo report ousiastika) osa exei twra i oura meion ta kratimena 
       end
       
       Event_List(5, end) = temp_Buff_Occ; % koubalaei kai to temp_Buff_Occ
       %fprintf('\n======> Registered Bytes of the Node %d\n',Reg_Buff_Occ( Event_List(3,1) ));
       %fprintf('\n======> The Node Reports %d Bytes in Buff_Occ\n', temp_Buff_Occ);
       
   end
   
   if Event==6
       
       Time=Event_List(2,1);
       
       SN_Upstream_Frame( Event_List(3,1) ) = SN_Upstream_Frame( Event_List(3,1) ) + 1;
       
       %fprintf('\n-->An Upstream Frame (#%d) from ONU %d has arrived at the OLT in Time: %f\n',SN_Upstream_Frame( Event_List(3,1) ), Event_List(3,1),Time);
       %fprintf('\nBWMap_Bytes = %d\n',Event_List(4,1));
       %fprintf('\nRegistered Bytes (before) %d\n',Reg_Buff_Occ( Event_List(3,1) ));
       
       BWMap_Bytes = Event_List(4,1);  
       
       Reg_Buff_Occ( Event_List(3,1) ) = Reg_Buff_Occ( Event_List(3,1) ) - BWMap_Bytes; % kratimena dilomena bytes, pleon exoun metadothei. 
       
       while BWMap_Bytes > 0 && Index_Upstream( Event_List(3,1) ) > 0
           if BWMap_Bytes >= Queue_Upstream(2,1,Event_List(3,1))
               BWMap_Bytes = BWMap_Bytes - Queue_Upstream(2,1,Event_List(3,1));
               
               Sum_Bytes_Delivered = Sum_Bytes_Delivered + Queue_Upstream(2,1,Event_List(3,1));
               
               Average_Delay_Upstream_Numerator = Average_Delay_Upstream_Numerator + Time - Queue_Upstream(3,1,Event_List(3,1));
               Average_Delay_Upstream_Numerator_per_ONU( Event_List(3,1) ) = Average_Delay_Upstream_Numerator_per_ONU( Event_List(3,1) ) + Time - Queue_Upstream(3,1,Event_List(3,1));
               Average_Delay_Upstream_Denumerator = Average_Delay_Upstream_Denumerator + 1;
               Average_Delay_Upstream_Denumerator_per_ONU( Event_List(3,1) ) = Average_Delay_Upstream_Denumerator_per_ONU( Event_List(3,1) ) + 1;
               Queue_Upstream(:,1,Event_List(3,1)) = 0;
               for counter=2:Index_Upstream ( Event_List(3,1) )

                   Queue_Upstream(:,counter-1,Event_List(3,1)) = Queue_Upstream(:,counter,Event_List(3,1));

               end
               
               Queue_Upstream(:,Index_Upstream (Event_List(3,1)), Event_List(3,1)) = 0;
               Index_Upstream( Event_List(3,1) ) = Index_Upstream( Event_List(3,1) ) - 1;
           else
               Queue_Upstream(2,1,Event_List(3,1)) = Queue_Upstream(2,1,Event_List(3,1)) - BWMap_Bytes;
               Sum_Bytes_Delivered = Sum_Bytes_Delivered + BWMap_Bytes;
               BWMap_Bytes = 0;
           end
       end     
       
       Buff_Occ( Event_List(3,1) ) = Event_List(5,1);
       
       %fprintf('\nRegistered Bytes (after) %d\n',Reg_Buff_Occ( Event_List(3,1) ));
       
   end 
   
   if Event==10
       Time=Event_List(2,1);
       flag=false;
       
       Average_Delay_Downstream = Average_Delay_Downstream_Numerator./Average_Delay_Downstream_Denumerator;
       Average_Delay_Upstream = Average_Delay_Upstream_Numerator./Average_Delay_Upstream_Denumerator;
       
       Average_Delay_Upstream_per_ONU = Average_Delay_Upstream_Numerator_per_ONU./Average_Delay_Upstream_Denumerator_per_ONU;
       
       Total_Arrivals_Upstream
       
       Drop_Ratio_Downstream = sum(Dropped_Downstream)/sum(Total_Arrivals_Downstream)
       Drop_Ratio_Upstream = sum(Dropped_Upstream)/sum(Total_Arrivals_Upstream)
       
       Throughput = Sum_Bytes_Delivered*8/Time;
       
       Misused = Fixed_Lost_per_ONU./Fixed_Allocated_per_ONU;
       
       %plot(1:length(Optimal_Selection_Cycle),Optimal_Selection_Cycle,1:length(Automaton_Selection_Cycle),Automaton_Selection_Cycle)
       %plot(1:length(Optimal_Selection_Cycle),abs(Optimal_Selection_Cycle-Automaton_Selection_Cycle)./Optimal_Selection_Cycle*100)
   end
   
   Event_List(:,1)=[];
   
   Event_List=sortrows(Event_List',2)';
    
end

end
