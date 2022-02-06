defmodule Authentication do
    def env(usr, env \\ "dev")
    
    def env(usr, env) when env == "dev" do
        "password: 058bA1BA1"
    end

    def env(usr, _env) do
        "password #{usr}"
    end
    

end