with Ada.Text_Io;
with Gnat.Sockets;
with Ada.Streams;
with Ada.Strings.Unbounded;

package body Ircada is
   procedure Start is
      Client: Gnat.Sockets.Socket_Type;
      Address: Gnat.Sockets.Sock_Addr_Type;
      Channel: Gnat.Sockets.Stream_Access;
      Data: Ada.Streams.Stream_Element_Array(1..200);
      Last: Ada.Streams.Stream_Element_Count := 0;
      Send: String := (1 => Ascii.Cr, 2 => Ascii.Lf);
   begin
      Gnat.Sockets.Initialize;

      Gnat.Sockets.Create_Socket(Client);
      Address.Addr := Gnat.Sockets.Inet_Addr("84.240.3.129");
      Address.Port := 6667;

      Gnat.Sockets.Connect_Socket(Client, Address);
      Channel := Gnat.Sockets.Stream(Client);

      String'Write(Channel, "NICK Ralt___" & Send);
      String'Write(Channel, "USER Ralt___ 8 * : Ralt___" & Send);
      loop
         Ada.Streams.Read(Channel.all, Data, Last);
         for C of Data loop
            Ada.Text_Io.Put(Character'Val(C));
         end loop;
      end loop;
   end Start;
end Ircada;
