///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package util;
//
///**
// *
// * @author sonnt
// */
//public class HtmlHelper {
//    public static String hyperlink(String text,String url)
//    {
//        return "<a class=\"paging_link\" href=\""+url+"\" >" +text +  "</a>";
//    }
//    
//    public static String label(String text)
//    {
//        return "<span class=\"paging_label\" >" +text +  "</span>";
//    }
//    public static String pager(int gap, int pageindex, int totalpage)
//    {
//        String result = "";
//        if(pageindex - gap > 1)
//            result += hyperlink("First", "?page=1");
//        
//        for(int i=gap;i>0 ;i--)
//        {
//            int page = pageindex - i;
//            if(page > 0)
//                result += hyperlink(""+page, "?page="+page);
//        }
//        
//        result += label(pageindex+"");
//        
//        for(int i=1;i<=gap ;i++)
//        {
//            int page = pageindex + i;
//            if(page <= totalpage)
//                result += hyperlink(""+page, "?page="+page);
//        }
//        
//        if(pageindex+gap < totalpage)
//            result += hyperlink("Last", "?page="+totalpage);
//        return result;
//    }
//    public static String pagerforCourse(int gap, int pageindex, int totalpage,String type)
//    {
//        String result = "";
//        if(pageindex - gap > 1)
//            result += hyperlink("First", "?type="+type+"&page=1");
//        
//        for(int i=gap;i>0 ;i--)
//        {
//            int page = pageindex - i;
//            if(page > 0)
//                result += hyperlink(""+page, "?type="+type+"&page="+page);
//        }
//        
//        result += label(pageindex+"");
//        
//        for(int i=1;i<=gap ;i++)
//        {
//            int page = pageindex + i;
//            if(page <= totalpage)
//                result += hyperlink(""+page, "?type="+type+"&page="+page);
//        }
//        
//        if(pageindex+gap < totalpage)
//            result += hyperlink("Last", "?type="+type+"&page="+totalpage);
//        return result;
//    }
//    public static String pagerstudent(int gap, int pageindex, int totalpage,String name, String dobf,String dobt,String gender)
//    {
//        String  s = backstudent(name, dobf, dobt, gender);
//        String result = "";
//        if(pageindex - gap > 1)
//            result += hyperlink("First", "?page=1"+s+"#teach");
//        
//        for(int i=gap;i>0 ;i--)
//        {
//            int page = pageindex - i;
//            if(page > 0)
//                result += hyperlink(""+page, "?page="+page+s+"#teach");
//        }
//        
//        result += label(pageindex+"");
//        
//        for(int i=1;i<=gap ;i++)
//        {
//            int page = pageindex + i;
//            if(page <= totalpage)
//                result += hyperlink(""+page, "?page="+page+s+"#teach");
//        }
//        
//        if(pageindex+gap < totalpage)
//            result += hyperlink("Last", "?page="+totalpage+s+"#teach");
//        return result;
//    }
//    public static String pagercourse(int gap, int pageindex, int totalpage,String name, String costf,String costt)
//    {
//        String  s = backcourse(name, costf, costt);
//        String result = "";
//        if(pageindex - gap > 1)
//            result += hyperlink("First", "?page=1"+s+"#teach");
//        
//        for(int i=gap;i>0 ;i--)
//        {
//            int page = pageindex - i;
//            if(page > 0)
//                result += hyperlink(""+page, "?page="+page+s+"#teach");
//        }
//        
//        result += label(pageindex+"");
//        
//        for(int i=1;i<=gap ;i++)
//        {
//            int page = pageindex + i;
//            if(page <= totalpage)
//                result += hyperlink(""+page, "?page="+page+s+"#teach");
//        }
//        
//        if(pageindex+gap < totalpage)
//            result += hyperlink("Last", "?page="+totalpage+s+"#teach");
//        return result;
//    }
//public static String backstudent(String name,String dobf,String dobt,String gender){
//        String s ="";
//        if(name!=null&&!name.isEmpty()) s+="&name="+name;
//        if(dobt!=null&&!dobt.isEmpty()) s+="&dobt="+dobt;
//        if(dobf!=null&&!dobf.isEmpty()) s+="&dobf="+dobf;
//        if(gender!=null&&!gender.isEmpty()) s+="&gender="+gender;
//        return s;
//    }
//public static String backcourse(String name,String costf,String costt){
//        String s ="";
//        if(name!=null&&!name.isEmpty()) s+="&name="+name;
//        if(costf!=null&&!costf.isEmpty()) s+="&costf="+costf;
//        if(costt!=null&&!costt.isEmpty()) s+="&costt="+costt;
//        return s;
//    }
//
//}
