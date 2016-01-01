//商铺、商品类别编辑
function edit_protype(id,ul_id,state)
{
var values="";
var sid="";
var canshu="";
var canshu2="";
var lis=new Array();
var inputs=new Array();
 switch(state)
 { 
   case "p"://商铺类别批量编辑
        var id2=id+ul_id;
        inputs=document.getElementById(id2).getElementsByTagName('li');
        for(var i=0;i<inputs.length;i++)
        {
          lis=inputs[i].getElementsByTagName("input");
          for(var j=0;j<lis.length;j++)
          {
            canshu2 +=escape(lis[j].value)+"-";
          }
          sid=inputs[i].getAttribute("id");
          canshu +=sid.substring(sid.indexOf('_')+1,sid.length)+"-"+canshu2+",";
          canshu2="";
        }
        values="ptype_ids="+canshu;
   break;
   case "lp"://商品类别批量编辑
        if(id==1)
        {
          sid=document.getElementById("newsid1").value;
          edit_protype(sid,"txt01","lm");
          return;
        }
        else
        {
            
            for(var i=1;i<id+1;i++)
            {
                inputs= document.getElementById("txt0"+i).getElementsByTagName('input');
                canshu2 =escape(inputs[0].value)+"-"+inputs[1].value;
                sid=document.getElementById("newsid"+i).value;
                canshu +=sid+"-"+canshu2+","; 
            }
            values="ptypel_ids="+canshu;
        }
   break;
   case "lm":  //商品类别单个编辑
      inputs= document.getElementById(ul_id).getElementsByTagName('input');
      canshu=id+"-"+escape(inputs[0].value)+"-"+inputs[1].value;
      values="ptypel_id="+canshu;
   break;
   case "m":  //商铺类别单个编辑
  
      inputs= document.getElementById("sid"+ul_id+"_"+id).getElementsByTagName('input');
      canshu=id+"-"+inputs[0].value+"-"+escape(inputs[1].value);
      values="ptype_id="+canshu;
   break;
  }
  
  $.ajax({
                    type:"GET",
                    url:"protypeajax.aspx",
                    dataType:"html",
                    data:values+"&ntime="+(new Date()).getTime(),
                    beforeSend:function(XMLHttpRequest)
                        {
                        },
                    success:function(msg)
                        {   
                             if(msg == "1")
                             {
                                alert("修改成功！");
                             }
                             else
                             {
                                alert("修改失败！");
                             }
                        },
                   complete:function(XMLHttpRequest,textStatus)
                        {

                        },
                  error:function()
                       {
                            alert("出错啦！！！");
                       }
            });
}

//商铺编号编辑
function edit_businum(id,ul_id,state)
{
var values="";
var sid="";
var canshu="";
var canshu2="";
var lis=new Array();
var inputs=new Array();
 switch(state)
 { 
   case "p"://商铺编号批量编辑
         if(id==1)
        {
          sid=document.getElementById("newsid1").value;
          edit_businum(sid,"txt01","m");
          return;
        }
        else
        {
            
            for(var i=1;i<id+1;i++)
            {
                inputs= document.getElementById("txt0"+i).getElementsByTagName('input');
                canshu2 =inputs[0].value+"$"+inputs[1].value;
                inputs= document.getElementById("txt0"+i).getElementsByTagName('select');
                canshu2 +="$"+inputs[0].value;
                sid=document.getElementById("newsid"+i).value;
                canshu +=sid+"$"+canshu2+","; 
            }
            values="businum_ids="+canshu;
        }
   break;
   
   case "m":  //商品编号单个编辑
      inputs= document.getElementById(ul_id).getElementsByTagName('input');
      canshu=id+"$"+inputs[0].value+"$"+inputs[1].value;
      inputs= document.getElementById(ul_id).getElementsByTagName('select');
      canshu +="$"+inputs[0].value;
       values="businum_id="+canshu;
   break;
   
   case "pp"://商品列表单个编辑批量编辑
         if(id==1)
        {
          sid=document.getElementById("newsid1").value;
          edit_businum(sid,"txt01","m");
          return;
        }
        else
        {
            
            for(var i=1;i<id+1;i++)
            {
                inputs= document.getElementById("txt0"+i).getElementsByTagName('input');
                canshu2 =inputs[0].value+"$"+inputs[1].value;
                inputs= document.getElementById("txt0"+i).getElementsByTagName('select');
                canshu2 +="$"+inputs[0].value;
                sid=document.getElementById("newsid"+i).value;
                canshu +=sid+"$"+canshu2+","; 
            }
            values="busipro_ids="+canshu;
        }
   break;
   
   case "pm":  //商品列表单个编辑
          inputs= document.getElementById(ul_id).getElementsByTagName('input');
          canshu=id+"$"+inputs[0].value+"$"+inputs[1].value;
          inputs= document.getElementById(ul_id).getElementsByTagName('select');
          canshu +="$"+inputs[0].value;
          values="busipro_id="+canshu;
   break;
   
   
    case "mp"://论坛会员列表批量编辑
         if(id==1)
        {
          sid=document.getElementById("newsid1").value;
          edit_businum(sid,"txt01","mm");
          return;
        }
        else
        {
            for(var i=1;i<id+1;i++)
            {
                inputs= document.getElementById("txt0"+i).getElementsByTagName('input');
                canshu2 =inputs[0].value+"$"+inputs[1].value+"$"+inputs[2].value+"$"+escape(inputs[3].value);
                canshu +=sid+"$"+canshu2+","; 
            }
            values="menber_ids="+canshu;
        }
   break;
   
   case "mm":  //论坛会员列表单个编辑
      inputs= document.getElementById(ul_id).getElementsByTagName('input');
      canshu=id+"$"+inputs[0].value+"$"+inputs[1].value+"$"+inputs[2].value+"$"+escape(inputs[3].value);
      values="menber_id="+canshu;
   break;

  }
  
  $.ajax({
                    type:"GET",
                    url:"protypeajax.aspx",
                    dataType:"html",
                    data:values+"&ntime="+(new Date()).getTime(),
                    beforeSend:function(XMLHttpRequest)
                        {
                        },
                    success:function(msg)
                        {   
                             if(msg == "1")
                             {
                                alert("修改成功！");
                             }
                             else
                             {
                                alert(msg);
                             }
                        },
                   complete:function(XMLHttpRequest,textStatus)
                        {

                        },
                  error:function()
                       {
                            alert("出错啦！！！");
                       }
            });
}
