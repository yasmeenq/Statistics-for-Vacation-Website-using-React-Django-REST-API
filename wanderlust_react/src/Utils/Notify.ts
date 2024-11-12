import { Notyf } from "notyf";

class Notify {
	private notyf = new Notyf({
        duration:3000,
        position:{x:"center", y:"top"},
        dismissible:true
    });
    public success(message:string):void{
        this.notyf.success(message); 
    }
    public error(message:any):void{
        console.log(message)
        message = this.extractErrorMessage(message)
        this.notyf.error(message); 
    }

    private extractErrorMessage(err:any):string{
        //1. sending an error string
        if(typeof err==="string" && err!=="") return err; 

        if(typeof err?.response?.data ==="string" && err?.response?.data!=="") return err.response.data; 

        if(typeof err?.message ==="string" && err?.message!=="") return err.message;

        return "Some error, please try again"

    }
}

export const notify = new Notify();
