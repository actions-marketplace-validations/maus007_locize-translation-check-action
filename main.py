import requests
import json
import sys, os
from markdownTable import markdownTable




locize_project_id = os.environ["LOCIZE_PROJECT_ID"]
locize_api_key = os.environ["LOCIZE_API_KEY"]
locize_version = sys.argv[1]
locize_namespace = sys.argv[2]
language = sys.argv[3]
translation_percent = sys.argv[4]
untranslated_percent = sys.argv[5]


x = requests.get('https://api.locize.app/stats/project/' + str(locize_project_id), headers={"Authorization": "Bearer %s"  % locize_api_key})

json_response = x.json()

json_response[locize_version][language][locize_namespace].update(translated= json_response[locize_version][language][locize_namespace]['translated']*100, untranslated=json_response[locize_version][language][locize_namespace]['untranslated']*100)
if (float(translation_percent) > json_response[locize_version][language][locize_namespace]['translated']):
    print(markdownTable([json_response[locize_version][language][locize_namespace]]).getMarkdown())
    sys.exit(1)
elif (float(untranslated_percent) < json_response[locize_version][language][locize_namespace]['untranslated']  and float(untranslated_percent) !=0 ):
    print(markdownTable([json_response[locize_version][language][locize_namespace]]).getMarkdown())
    sys.exit(1)
else:
    print(markdownTable([json_response[locize_version][language][locize_namespace]]).getMarkdown())