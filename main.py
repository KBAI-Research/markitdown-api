from fastapi import FastAPI, File, UploadFile
import shutil
import os
from markitdown import MarkItDown

app = FastAPI()
md = MarkItDown(enable_plugins=True)

@app.post("/converter/")
async def converter(file: UploadFile = File(...)):
    file_path = f"/tmp/{file.filename}"

    with open(file_path, "wb") as buffer:
        shutil.copyfileobj(file.file, buffer)

    try:
        result = md.convert(file_path)
        texto = result.text_content

        return {"texto": texto}

    except Exception as e:
        return {"erro": str(e)}

    finally:
        if os.path.exists(file_path):
            os.remove(file_path)