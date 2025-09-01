from fastapi import FastAPI
from fastapi.responses import JSONResponse

app = FastAPI()

@app.get("/status")
def get_status():
    return JSONResponse(content={"status": "ok"})