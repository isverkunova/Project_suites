
function Preparation()
{
  TestedApps.Orders.Run();
}                         


function NewOrder()
{
var driver = DDT.CSVDriver(Files.FileNameByName("file.txt"));

var i = 0;

while(!driver.EOF())
{
Log.AppendFolder((i+1)+"st")
Aliases.ToolBar.ClickItem(4);

Aliases.Cust.wText = driver.Value("name");
Aliases.St.wText = driver.Value("street");
Aliases.City.wText = driver.Value("city");
Aliases.State.wText = driver.Value("state");
Aliases.Zip.wText = driver.Value("zip");
Aliases.CardNo.wText = driver.Value("cardNo");
Aliases.BtnOK.Click();

    Aliases.OrdersView.SelectItem(i);
    Delay(1000);
    if(Aliases.OrdersView.FocusedItem.Text.OleValue !=driver.Value("name"))
      Log.Error("The property value does not equal the baseline value.");
    else
      Log.Message("OK"); 
      i++;
      Log.PopLogFolder(); 
      driver.Next(); 
      
 
}

DDT.CloseDriver("driver");
}


function EditOrder()

{
var driver = DDT.CSVDriver(Files.FileNameByName("refile.txt"));

var i = 0;

while(!driver.EOF())
{
  Log.AppendFolder((i+1)+"st")
Aliases.OrdersView.SelectItem(i); 
Aliases.ToolBar.ClickItem(5);

Aliases.Cust.wText = driver.Value("name");
Aliases.St.wText = driver.Value("street");
Aliases.City.wText = driver.Value("city");
Aliases.State.wText = driver.Value("state");
Aliases.Zip.wText = driver.Value("zip");
Aliases.CardNo.wText = driver.Value("cardNo");
Aliases.BtnOK.Click();

    Aliases.OrdersView.SelectItem(i);
    Delay(1000);
    if(Aliases.OrdersView.FocusedItem.Text.OleValue !=driver.Value("name"))
      Log.Error("The property value does not equal the baseline value.");
    else
      Log.Message("OK"); 
      i++;
      Log.PopLogFolder();
      driver.Next(); 
}

DDT.CloseDriver("driver");
}


function DeleteOrder()
{
var i=0;
var d = 0;

 while(d<5)
 {
Aliases.OrdersView.SelectItem(i);
Aliases.ToolBar.ClickItem(6);
Aliases.btnYes.Click();
d++;
 }
}


function CleanUp()
{
Aliases.MainForm.Close();
Aliases.btnNo.Click();
}