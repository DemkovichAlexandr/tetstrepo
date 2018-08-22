public class Example5 {
    public static void func() {
        Example5.deleteDuplicate('Contact');
        Example5.deleteDuplicate('Lead');
    }
    private static void deleteDuplicate (String nameObject){
        List<SObject> listObjects = Database.query('SELECT id, name FROM ' + nameObject + ' LIMIT 5000');
        List<SObject> uniqueObjects = new List<SObject>();
        List<SObject> duplicateObjects = new List<SObject>();
        for (SObject c: listObjects)
        {
            Boolean flag = false;
            for (Integer i = 0; i < uniqueObjects.size(); i++)
            {
                if ((String)c.get('Name') == (String)uniqueObjects[i].get('Name'))
                {
                    flag = true;
                }
            }
            if (flag != true)
            {
                uniqueObjects.add(c);
            } else {
                duplicateObjects.add(c);
            }
        }
        delete duplicateObjects;
        System.debug(listObjects.size());
        System.debug(uniqueObjects.size());
        System.debug(duplicateObjects.size());
    }
}

