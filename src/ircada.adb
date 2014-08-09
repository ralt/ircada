with Ada.Text_Io;

package body Ircada is
   package Tio renames Ada.Text_Io;

   procedure Print is
   begin
      Tio.Put_Line("Hello, world!");
   end Print;
end Ircada;
