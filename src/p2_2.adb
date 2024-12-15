with Ada.Text_IO;   use Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;

procedure P2_2 is

   task Tarea_Pantalla is
      entry Imprimir (Text : String);
   end Tarea_Pantalla;

   task body Tarea_Pantalla is
   begin
      loop
         accept Imprimir (Text : String) do
            Ada.Text_IO.Put_Line (Text);
         end Imprimir;
      end loop;
   end Tarea_Pantalla;

   task type Tarea
     (Name   : Character;
      Period : Positive);

   task body Tarea is
      TextDuration     : String (1 .. 50);
      Period_Duration  : constant Time_Span := Seconds (Period);
      Margin_Time      : constant Time_Span := Milliseconds (11);
      Next_Activation  : Time := Clock + Period_Duration;
      Text             : String (1 .. 50);
      Time_Prueba      : Time;
      Time_TimeSpan    : Time_Span;
      Time_TimeSeconds : Seconds_Count;
      Initial_Time     : Time;
   begin
      loop
         Initial_Time := Clock;
         Next_Activation := Initial_Time + Period_Duration;
         -- Esperar hasta la siguiente activación
         delay until Next_Activation;

         -- Detectar incumplimiento de plazo
         if Clock > (Next_Activation + Margin_Time) then
            Tarea_Pantalla.Imprimir
              ("ERROR: Tarea "
               & Name
               & " incumplió el plazo de respuesta. Tardo: "
               & Duration'Image (To_Duration ((Clock - Initial_Time))));

         else
            --se cumple el plazo
            Split (Clock, Time_TimeSeconds, Time_TimeSpan);
            Tarea_Pantalla.Imprimir
              ("Tarea "
               & Name
               & " activada a "
               & Duration'Image (To_Duration (Clock - Initial_Time)));
            -- Actualizar siguiente activación
         end if;
      end loop;
   end Tarea;

   type Tarea_access is access Tarea;

   NewTarea : Tarea_access;
   --  Initial_Time : access constant Time := Clock;

begin

   NewTarea := new Tarea ('1', 1);
   NewTarea := new Tarea ('2', 2);
   NewTarea := new Tarea ('3', 3);
   NewTarea := new Tarea ('4', 4);

   loop
      delay 1.0;
   end loop;
end P2_2;
