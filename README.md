Welcome to my new dbt project!

### Using the miniassignment_1 project

Try running the following commands:
- dbt run
- dbt test

## Description of workflow for Mini Assignment 1:

_**First Approach (failed) :**_ directly loading the xml files into snowflakes after creating all the tables. Due to large size and many columns in xml file, snowflake rejected to load data in table. This method is only applicable for csv files

_**Second Approach (failed) :**_ loading XML Data Into Snowflake from a Local File System Using COPY Command. Now this method worked 20% but there was problem related to snow sql utility like after logging into snowflake using commandline, the put function gave error (related to aws).

_**Third Approach (failed)** **:**_ This time I tried to write java code in windows powershell to split xml data in chunks but this also didn't worked out. The script was as follows-
                          
                          $limit = 1000
                          $logpath = "C:\Users\neoarya\Desktop\week5\askubuntu.com\PostHistory.xml"
                          [xml]$xml = "<logroot>$(Get-Content $logpath)</logroot>"
                          $index = 1
                          $ref = new-object xml
                          $rows = $xml.SelectNodes("//Id")
                          $c = $rows.count
                          $rows | %{
                                if($index -eq 1){
                            [xml]$insertNode = @"
                          <root><a></a></root>
                          "@
                            $ref.AppendChild($ref.ImportNode($InsertNode.DocumentElement, $false))
                                 }
                                 $ref.DocumentElement.AppendChild($ref.ImportNode($_,$true))
                               $c--
                               if($index -eq $limit){
                            $index = 1
                            $ref.Save("C:\Users\neoarya\Desktop\week5\PostHistory{0:D1000}.xml" -f ++$i)
                            $ref = new-object xml
                            if($c -lt $limit){ $limit = $c}
                               }
                               else{
                            $index++;
                               }
                          }

Screenshot : <img width="960" alt="Screenshot 2022-05-31 223856" src="https://user-images.githubusercontent.com/104750261/171236793-babbc5d4-7216-4b89-93ec-c792b1fa0d53.png">

_**Fourth Approach (partially successful)**_ : Now finally after trying all the above methods and due to lack of time I decided to just convert some xml files to csv files and load its data in tables(created manually) of snowflakes, those xml files were badges and tags. Other xml files were too large to be converted into csv.
Later, I declared all the models and wrote the query for every milestones. The dbt run was running the project successfully.

**Screenshot of dbt_run:** <img width="676" alt="image" src="https://user-images.githubusercontent.com/104750261/171244268-3eb177b2-586a-435f-924c-2b8ff60d936f.png">

**Screenshot of Milestone1_query:** <img width="958" alt="image" src="https://user-images.githubusercontent.com/104750261/171349580-8ebd1da6-c528-46a3-885d-9ebf59586eea.png">
**Screenshot of Milestone2_query:** <img width="960" alt="image" src="https://user-images.githubusercontent.com/104750261/171349973-98be69f4-2edc-42c5-9a7c-44c7ab8a5797.png">
**Screenshot of Milestone3_query:** <img width="960" alt="image" src="https://user-images.githubusercontent.com/104750261/171350173-e86914c9-180c-4d83-ace8-9fd556b1441c.png">
**Screenshot of Milestone4_query:** <img width="960" alt="image" src="https://user-images.githubusercontent.com/104750261/171349250-ebc0c4e2-9866-475b-a9e6-bb8d6937f257.png">
**Screenshot of Milestone5_query:** <img width="960" alt="image" src="https://user-images.githubusercontent.com/104750261/171349506-c69d3fa3-b5d1-498a-89cf-330d53a074aa.png">



