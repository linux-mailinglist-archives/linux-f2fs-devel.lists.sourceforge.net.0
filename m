Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B665C16C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Jul 2019 18:47:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hhzSd-0002u9-BN; Mon, 01 Jul 2019 16:47:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <darrick.wong@oracle.com>) id 1hhzSb-0002ts-K0
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jul 2019 16:47:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8gxkRObKYbMrXDLgGJZlKItu1lvgD7pvqBSu/EBf7k0=; b=MWIfuNoukbZ9hM+RKz90jfV/G1
 VwVejSK2pEMhynG0wIAjA1zbfv9/HnewsFF1WAf5HxCGuOD6A84tS8f+LAHYPwEvrlBWF04XDlQYS
 q+58JEhpGl4rQorbxIRu9L32FjUQPWelra1RgDvE+2FtFFR6pzWWD0f4AQt1anQRmbS4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8gxkRObKYbMrXDLgGJZlKItu1lvgD7pvqBSu/EBf7k0=; b=d625B/rbK8oGBjTxsc+JZzh5kd
 mX4gOPcl2TUcn18Q059qu2WbepFntwm9iaiiL+ml9XPSSxVpZG1FDk0PMYXU4WCzL2dFDgd6AHhFN
 yY4pjT4ZIcp49ZwqChr65/K3Hpzd2d4y1Tw42zifvJ8gcnsiL7RoJzZYUl36mnfX8r8c=;
Received: from userp2130.oracle.com ([156.151.31.86])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hhzSg-000odU-Qz
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jul 2019 16:47:30 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x61GY0vg171845;
 Mon, 1 Jul 2019 16:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=8gxkRObKYbMrXDLgGJZlKItu1lvgD7pvqBSu/EBf7k0=;
 b=tJ4W5NicwThgq+LmSAQiHrlkpGltUTl2THNi6lOJ8Pd3BhJMcYMbJcwE7P4Z9l8C/ald
 NHq4kt+GTidTfnfW0HO3G056budSJRIq3B8E6A6X7M12J+10HOJTcPWotKvnh1ndOabL
 CPr163YgWsjqF38QEFZ+QCvKBAIPQQgx4QZj8o1a0ncRSg9z5SyKlX1S+FO5FyP81jQF
 Qt2y1hNvWuGOq0OObDTSLxvqf3F9CZCU1+1mq+xNrPs93UdxsdjURkEUvzgba/XAmR85
 cjx0EgKjwP1u7LHSc7YNpMpCRTH7b8/liHuB8KvSuchqhRrydlmwRg6UWGP5bIwWfh91 Qg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2te61dxrxp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 01 Jul 2019 16:47:10 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x61GWUdf119089;
 Mon, 1 Jul 2019 16:47:10 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 2tebqg19dp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 01 Jul 2019 16:47:10 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x61Gl7Fv000314;
 Mon, 1 Jul 2019 16:47:07 GMT
Received: from localhost (/67.169.218.210)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 01 Jul 2019 09:47:07 -0700
Date: Mon, 1 Jul 2019 09:47:05 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Eric Biggers <ebiggers@google.com>
Message-ID: <20190701164705.GN1404256@magnolia>
References: <20190701110603.5abcbb2c@canb.auug.org.au>
 <20190701163146.GA195588@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190701163146.GA195588@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9305
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907010200
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9305
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907010200
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hhzSg-000odU-Qz
Subject: Re: [f2fs-dev] linux-next: manual merge of the xfs tree with the
 f2fs tree
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 David Chinner <david@fromorbit.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jul 01, 2019 at 09:31:46AM -0700, Eric Biggers wrote:
> [+f2fs mailing list]
> 
> On Mon, Jul 01, 2019 at 11:06:03AM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the xfs tree got a conflict in:
> > 
> >   fs/f2fs/file.c
> > 
> > between commit:
> > 
> >   360985573b55 ("f2fs: separate f2fs i_flags from fs_flags and ext4 i_flags")
> > 
> > from the f2fs tree and commits:
> > 
> >   de2baa49bbae ("vfs: create a generic checking and prep function for FS_IOC_SETFLAGS")
> >   3dd3ba36a8ee ("vfs: create a generic checking function for FS_IOC_FSSETXATTR")
> > 
> > from the xfs tree.
> > 
> > I fixed it up (I think - see below) and can carry the fix as necessary.
> > This is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> > -- 
> > Cheers,
> > Stephen Rothwell
> > 
> > diff --cc fs/f2fs/file.c
> > index e7c368db8185,8799468724f9..000000000000
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@@ -1645,22 -1648,45 +1645,23 @@@ static int f2fs_file_flush(struct file 
> >   	return 0;
> >   }
> >   
> >  -static int f2fs_ioc_getflags(struct file *filp, unsigned long arg)
> >  -{
> >  -	struct inode *inode = file_inode(filp);
> >  -	struct f2fs_inode_info *fi = F2FS_I(inode);
> >  -	unsigned int flags = fi->i_flags;
> >  -
> >  -	if (IS_ENCRYPTED(inode))
> >  -		flags |= F2FS_ENCRYPT_FL;
> >  -	if (f2fs_has_inline_data(inode) || f2fs_has_inline_dentry(inode))
> >  -		flags |= F2FS_INLINE_DATA_FL;
> >  -	if (is_inode_flag_set(inode, FI_PIN_FILE))
> >  -		flags |= F2FS_NOCOW_FL;
> >  -
> >  -	flags &= F2FS_FL_USER_VISIBLE;
> >  -
> >  -	return put_user(flags, (int __user *)arg);
> >  -}
> >  -
> >  -static int __f2fs_ioc_setflags(struct inode *inode, unsigned int flags)
> >  +static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
> >   {
> >   	struct f2fs_inode_info *fi = F2FS_I(inode);
> >  -	unsigned int oldflags;
> >  +	u32 oldflags;
> > + 	int err;
> >   
> >   	/* Is it quota file? Do not allow user to mess with it */
> >   	if (IS_NOQUOTA(inode))
> >   		return -EPERM;
> >   
> >  -	flags = f2fs_mask_flags(inode->i_mode, flags);
> >  -
> >   	oldflags = fi->i_flags;
> >   
> > - 	if ((iflags ^ oldflags) & (F2FS_APPEND_FL | F2FS_IMMUTABLE_FL))
> > - 		if (!capable(CAP_LINUX_IMMUTABLE))
> > - 			return -EPERM;
> >  -	err = vfs_ioc_setflags_prepare(inode, oldflags, flags);
> > ++	err = vfs_ioc_setflags_prepare(inode, oldflags, iflags);
> > + 	if (err)
> > + 		return err;
> 
> I don't think this is the correct resolution.  Now f2fs_setflags_common() is
> meant to take the f2fs on-disk i_flags, which aren't necessarily the same as the
> flags passed to the FS_IOC_SETFLAGS ioctl.  So it's not appropriate to call
> vfs_ioc_setflags_prepare() in it.  It should be in f2fs_ioc_setflags() instead.
> 
> I've pushed up what I think is the correct resolution to
> https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=f2fs-setflags-resolved
> 
> Here is my diff of fs/f2fs/file.c from f2fs/dev.  Darrick, can you check that
> this is what you would have done if you had patched f2fs/dev instead of v5.2?

Yep, that's roughly what I was planning to do to connect f2fs to the
checking functions.

I withdrew the fs/f2fs/ parts of the setflags/fssetxattr cleanups from
the branch with the intent to fix it after f2fs-dev lands, because I
think this is too messy a merge resolution to push through Linus.

Would you mind resending this with a proper subject line and SOB? :)

--D

> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index e7c368db81851f..64f157f2e8d5e4 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1648,19 +1648,12 @@ static int f2fs_file_flush(struct file *file, fl_owner_t id)
>  static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
>  {
>  	struct f2fs_inode_info *fi = F2FS_I(inode);
> -	u32 oldflags;
>  
>  	/* Is it quota file? Do not allow user to mess with it */
>  	if (IS_NOQUOTA(inode))
>  		return -EPERM;
>  
> -	oldflags = fi->i_flags;
> -
> -	if ((iflags ^ oldflags) & (F2FS_APPEND_FL | F2FS_IMMUTABLE_FL))
> -		if (!capable(CAP_LINUX_IMMUTABLE))
> -			return -EPERM;
> -
> -	fi->i_flags = iflags | (oldflags & ~mask);
> +	fi->i_flags = iflags | (fi->i_flags & ~mask);
>  
>  	if (fi->i_flags & F2FS_PROJINHERIT_FL)
>  		set_inode_flag(inode, FI_PROJ_INHERIT);
> @@ -1765,7 +1758,8 @@ static int f2fs_ioc_getflags(struct file *filp, unsigned long arg)
>  static int f2fs_ioc_setflags(struct file *filp, unsigned long arg)
>  {
>  	struct inode *inode = file_inode(filp);
> -	u32 fsflags;
> +	struct f2fs_inode_info *fi = F2FS_I(inode);
> +	u32 fsflags, old_fsflags;
>  	u32 iflags;
>  	int ret;
>  
> @@ -1789,8 +1783,14 @@ static int f2fs_ioc_setflags(struct file *filp, unsigned long arg)
>  
>  	inode_lock(inode);
>  
> +	old_fsflags = f2fs_iflags_to_fsflags(fi->i_flags);
> +	ret = vfs_ioc_setflags_prepare(inode, old_fsflags, fsflags);
> +	if (ret)
> +		goto out;
> +
>  	ret = f2fs_setflags_common(inode, iflags,
>  			f2fs_fsflags_to_iflags(F2FS_SETTABLE_FS_FL));
> +out:
>  	inode_unlock(inode);
>  	mnt_drop_write_file(filp);
>  	return ret;
> @@ -2850,52 +2850,32 @@ static inline u32 f2fs_xflags_to_iflags(u32 xflags)
>  	return iflags;
>  }
>  
> -static int f2fs_ioc_fsgetxattr(struct file *filp, unsigned long arg)
> +static void f2fs_fill_fsxattr(struct inode *inode, struct fsxattr *fa)
>  {
> -	struct inode *inode = file_inode(filp);
>  	struct f2fs_inode_info *fi = F2FS_I(inode);
> -	struct fsxattr fa;
>  
> -	memset(&fa, 0, sizeof(struct fsxattr));
> -	fa.fsx_xflags = f2fs_iflags_to_xflags(fi->i_flags);
> +	simple_fill_fsxattr(fa, f2fs_iflags_to_xflags(fi->i_flags));
>  
>  	if (f2fs_sb_has_project_quota(F2FS_I_SB(inode)))
> -		fa.fsx_projid = (__u32)from_kprojid(&init_user_ns,
> -							fi->i_projid);
> -
> -	if (copy_to_user((struct fsxattr __user *)arg, &fa, sizeof(fa)))
> -		return -EFAULT;
> -	return 0;
> +		fa->fsx_projid = from_kprojid(&init_user_ns, fi->i_projid);
>  }
>  
> -static int f2fs_ioctl_check_project(struct inode *inode, struct fsxattr *fa)
> +static int f2fs_ioc_fsgetxattr(struct file *filp, unsigned long arg)
>  {
> -	/*
> -	 * Project Quota ID state is only allowed to change from within the init
> -	 * namespace. Enforce that restriction only if we are trying to change
> -	 * the quota ID state. Everything else is allowed in user namespaces.
> -	 */
> -	if (current_user_ns() == &init_user_ns)
> -		return 0;
> +	struct inode *inode = file_inode(filp);
> +	struct fsxattr fa;
>  
> -	if (__kprojid_val(F2FS_I(inode)->i_projid) != fa->fsx_projid)
> -		return -EINVAL;
> -
> -	if (F2FS_I(inode)->i_flags & F2FS_PROJINHERIT_FL) {
> -		if (!(fa->fsx_xflags & FS_XFLAG_PROJINHERIT))
> -			return -EINVAL;
> -	} else {
> -		if (fa->fsx_xflags & FS_XFLAG_PROJINHERIT)
> -			return -EINVAL;
> -	}
> +	f2fs_fill_fsxattr(inode, &fa);
>  
> +	if (copy_to_user((struct fsxattr __user *)arg, &fa, sizeof(fa)))
> +		return -EFAULT;
>  	return 0;
>  }
>  
>  static int f2fs_ioc_fssetxattr(struct file *filp, unsigned long arg)
>  {
>  	struct inode *inode = file_inode(filp);
> -	struct fsxattr fa;
> +	struct fsxattr fa, old_fa;
>  	u32 iflags;
>  	int err;
>  
> @@ -2918,7 +2898,9 @@ static int f2fs_ioc_fssetxattr(struct file *filp, unsigned long arg)
>  		return err;
>  
>  	inode_lock(inode);
> -	err = f2fs_ioctl_check_project(inode, &fa);
> +
> +	f2fs_fill_fsxattr(inode, &old_fa);
> +	err = vfs_ioc_fssetxattr_check(inode, &old_fa, &fa);
>  	if (err)
>  		goto out;
>  	err = f2fs_setflags_common(inode, iflags,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
