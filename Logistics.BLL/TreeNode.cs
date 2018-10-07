using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;
using System.Text;

namespace Logistics.BLL
{
    /// <summary>
    /// 树节点
    /// </summary>
    [DataContract]
    public class TreeNode
    {
        [DataMember(Name = "id")]
        public string ID { get; set; }
        [DataMember(Name = "parentID")]
        public string ParentID { get; set; }
        [DataMember(Name = "type")]
        public string Type { get; set; }
        [DataMember(Name = "text")]
        public string Text { get; set; }
        [DataMember(Name = "icon")]
        public string Icon { get; set; }
        [DataMember(Name = "icon-class")]
        public string IconClass { get; set; }
        [DataMember(Name = "additionalParameters")]
        public TreeChildren AdditionalParameters { get; set; }

        public TreeNode()
        {
            AdditionalParameters = new TreeChildren();
        }
    }

    /// <summary>
    /// 子节点
    /// </summary>
    [DataContract]
    public class TreeChildren
    {
        [DataMember(Name = "children")]
        public List<TreeNode> Children { get; set; }

        public TreeChildren()
        {
            Children = new List<TreeNode>();
        }
    }

    /// <summary>
    /// 节点类转换器
    /// </summary>
    public class TreeNodeList
    {
        public static string ToTreeNodeJson(List<TreeNode> tree)
        {
            DataContractJsonSerializer ser1 =
                    new DataContractJsonSerializer(typeof(List<TreeNode>));
            MemoryStream s = new MemoryStream();
            ser1.WriteObject(s, tree);
            return Encoding.UTF8.GetString(s.ToArray());
        }

        public static string GetTreeJson(List<TreeNode> list)
        {
            list = GetTreeNodeList(list);
            DataContractJsonSerializer ser = new DataContractJsonSerializer(typeof(List<TreeNode>));
            MemoryStream s = new MemoryStream();
            ser.WriteObject(s, list);
            return Encoding.UTF8.GetString(s.ToArray());
        }

        public static List<TreeNode> GetTreeNodeList(List<TreeNode> list)
        {
            List<TreeNode> parents = list.Where(item => string.IsNullOrEmpty(item.ParentID)).ToList();
            foreach(TreeNode tr in parents)
            {
                ConvertListToTree(tr, list);
            }
            return parents;
        }

        public static void ConvertListToTree(TreeNode parent, List<TreeNode> list) 
        {
            // List<DataNode> parent = list.Where(item => string.IsNullOrEmpty(item.ParentID)).ToList();
            List<TreeNode> children= list.Where(item => item.ParentID == parent.ID).ToList();

            parent.Icon = "<i class='ace-icon fa fa-file-text green'></i>";
            if (children == null || children.Count == 0)
            {
                parent.Type = "item";
            }
            else
            {
                parent.AdditionalParameters.Children.AddRange(children);
                parent.Type = "folder";
                foreach (TreeNode tr in children)
                {
                    ConvertListToTree(tr, list);
                }
            }
        }

        public static string getstring()
        {
            TreeNode root = new TreeNode();
            root.Text = "Pictures";
            root.Type = "folder";

            TreeNode ch = new TreeNode();
            ch.Text = "song1.ogg";
            ch.Type = "item";
            root.AdditionalParameters.Children.Add(ch);
            ch = new TreeNode();
            ch.Text = "file";
            ch.Type = "folder";

            TreeNode chc = new TreeNode();
            chc.Text = "<i class='ace-icon fa fa-file-text grey'></i> document5.doc";
            chc.Type = "item";
            ch.AdditionalParameters.Children.Add(chc);
            root.AdditionalParameters.Children.Add(ch);


            DataContractJsonSerializer ser1 =
                new DataContractJsonSerializer(typeof(TreeNode));
            MemoryStream s = new MemoryStream();
            ser1.WriteObject(s, root);
            return Encoding.UTF8.GetString(s.ToArray());
            //return (new JavaScriptSerializer()).Serialize(new { root = root});
        }

        

    }
}
