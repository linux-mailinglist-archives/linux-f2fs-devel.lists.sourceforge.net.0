Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAC25C135
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Jul 2019 18:37:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KAg16U8+SAbdZCg8Ih+aKcdAa+6BnMJsxEX0z9waP+U=; b=m9fBSwGfTgEj0flmuaFWdlOH/
	MosWtvo8e1T6CPcxzGgvYnBOWjE/9bFf7FiR2IaPSxTMPIxfSg5A1y3E1kpVEWlG45BEGSsPoCQ5+
	WvW5Fm1cioRNuW8i0Oj6uY7WvKB/hwhLiC0DNl1maDkMyX/1nm1TCYi3FsUVEanRgr/jQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hhzJ4-0006XT-G1; Mon, 01 Jul 2019 16:37:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@google.com>) id 1hhzJ2-0006X9-Hi
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jul 2019 16:37:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PeLJMgxrA4YpstZ8wIxVzj3g1t2Bf5vkcHaXmsss9u4=; b=TZ6yC/wnHgei/0UbSMWBDIYz8a
 PiTd+eNPXr1pulUvkhjQtEYDRnKQ53Kj8Ch2DiI/dFYwccsYmWzy6o/mRETVU0MnsR2JNYtjmnUOW
 gSoFMRoLyDy3wDrarreHZNkUWzMTnQVUdOOoQv7ppBZAdhOa9PSy3ymV74FyKknaWBzg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PeLJMgxrA4YpstZ8wIxVzj3g1t2Bf5vkcHaXmsss9u4=; b=kM/gZ67W4gCWytrGCdn6rPUY0A
 ieGVSGJmx5urbf837xsT5lEpA35pDWBIaJrbj27FhRV3EI6o+MdWSHRdb/uKTmn6z5fZLSOA46cfB
 28LvymQpq/XYMxQM+DFDeqm9QQsF9X5Pt0okOt7PRultM6avRI4QJidk8PdD0wg28UI8=;
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hhzJ5-003dWp-U2
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jul 2019 16:37:33 +0000
Received: by mail-oi1-f194.google.com with SMTP id v186so10463209oie.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 01 Jul 2019 09:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PeLJMgxrA4YpstZ8wIxVzj3g1t2Bf5vkcHaXmsss9u4=;
 b=EPOp7aEOt2juwtPxPi9d2ctbchUiHUE4GnKSmUhVQrxSvtaeCB6utYsTKwaybvaSK9
 qroPb1NlOQ9UC2TKZHJNMWkL9pJJzw5cZArWLcEFXBj+aDoKRb+au78f02oSBNlgBJeI
 E1S/gW7kZ4+XdX5GmHK1SJZWdbrjNGF4DtWGWwjOLJDW5pvB653gxnqrv61YWvhHfTeG
 CoKw445unpXe3Ws6K4z8Bzy+pU1uFOkFBv7IaSVsgNc2FXxlmOU/FQ4viQ0/Wt5kQYB6
 M0CT+/5lXMk5h2t6jhwGp45Bc6OwmvjCW3RzMxERgY6x51CCrgSMgpLxES7vNNdvqGni
 2hdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PeLJMgxrA4YpstZ8wIxVzj3g1t2Bf5vkcHaXmsss9u4=;
 b=qPi3A3C+KJzTe5h64Eb0cPDy333M0NyF2oA01YVi4YreJdxkw9wY/Q5FpJyDUkuwcw
 nvU9mnnykL5uF9k5fUiiquAXLN3J2dZsTQyrPPDrVwGDw+omD/YmqcPXD7fWRmyRsree
 rFA9mTSYlIWSTgMM5W7W/RzWuReKQLDVL5LUx/W3NgXcKWVMOY1kK3Badfwcf6hspkV8
 Z6FaG146dRipTba9GnPtRm+aXyno68KlPMRMxxs0rlLkHiMFB7SIgrwDqTdeFMPnLCAm
 UmFXL/crMD+FvftFJk22VD5WGwSV5VCTP5wa5tP+z3QB+3UymAET+tXAXEyBzTh84WrZ
 ABeA==
X-Gm-Message-State: APjAAAVO1Xjv1OBKUuOeosbJ4GKr3SK8BurVBLMHeZEbvH/r3nZtOYNA
 Bq0Vk2tYfkWSqGS8fFKINs/Hzqy+dO8=
X-Google-Smtp-Source: APXvYqzo12xH57HnTbJd+t5cgu1xQCTu+yIxHXDiBpPpIIuCrFSRuenbzleUEWjzjboLxyuuiYdFYg==
X-Received: by 2002:a63:3d8f:: with SMTP id
 k137mr20519587pga.337.1561998711760; 
 Mon, 01 Jul 2019 09:31:51 -0700 (PDT)
Received: from google.com ([2620:15c:201:2:765b:31cb:30c4:166])
 by smtp.gmail.com with ESMTPSA id k197sm11690980pgc.22.2019.07.01.09.31.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 09:31:50 -0700 (PDT)
Date: Mon, 1 Jul 2019 09:31:46 -0700
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20190701163146.GA195588@google.com>
References: <20190701110603.5abcbb2c@canb.auug.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190701110603.5abcbb2c@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -11.6 (-----------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 4.0 FSL_HELO_FAKE          No description available.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.194 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1hhzJ5-003dWp-U2
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@google.com>
Cc: David Chinner <david@fromorbit.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

[+f2fs mailing list]

On Mon, Jul 01, 2019 at 11:06:03AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the xfs tree got a conflict in:
> 
>   fs/f2fs/file.c
> 
> between commit:
> 
>   360985573b55 ("f2fs: separate f2fs i_flags from fs_flags and ext4 i_flags")
> 
> from the f2fs tree and commits:
> 
>   de2baa49bbae ("vfs: create a generic checking and prep function for FS_IOC_SETFLAGS")
>   3dd3ba36a8ee ("vfs: create a generic checking function for FS_IOC_FSSETXATTR")
> 
> from the xfs tree.
> 
> I fixed it up (I think - see below) and can carry the fix as necessary.
> This is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc fs/f2fs/file.c
> index e7c368db8185,8799468724f9..000000000000
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@@ -1645,22 -1648,45 +1645,23 @@@ static int f2fs_file_flush(struct file 
>   	return 0;
>   }
>   
>  -static int f2fs_ioc_getflags(struct file *filp, unsigned long arg)
>  -{
>  -	struct inode *inode = file_inode(filp);
>  -	struct f2fs_inode_info *fi = F2FS_I(inode);
>  -	unsigned int flags = fi->i_flags;
>  -
>  -	if (IS_ENCRYPTED(inode))
>  -		flags |= F2FS_ENCRYPT_FL;
>  -	if (f2fs_has_inline_data(inode) || f2fs_has_inline_dentry(inode))
>  -		flags |= F2FS_INLINE_DATA_FL;
>  -	if (is_inode_flag_set(inode, FI_PIN_FILE))
>  -		flags |= F2FS_NOCOW_FL;
>  -
>  -	flags &= F2FS_FL_USER_VISIBLE;
>  -
>  -	return put_user(flags, (int __user *)arg);
>  -}
>  -
>  -static int __f2fs_ioc_setflags(struct inode *inode, unsigned int flags)
>  +static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
>   {
>   	struct f2fs_inode_info *fi = F2FS_I(inode);
>  -	unsigned int oldflags;
>  +	u32 oldflags;
> + 	int err;
>   
>   	/* Is it quota file? Do not allow user to mess with it */
>   	if (IS_NOQUOTA(inode))
>   		return -EPERM;
>   
>  -	flags = f2fs_mask_flags(inode->i_mode, flags);
>  -
>   	oldflags = fi->i_flags;
>   
> - 	if ((iflags ^ oldflags) & (F2FS_APPEND_FL | F2FS_IMMUTABLE_FL))
> - 		if (!capable(CAP_LINUX_IMMUTABLE))
> - 			return -EPERM;
>  -	err = vfs_ioc_setflags_prepare(inode, oldflags, flags);
> ++	err = vfs_ioc_setflags_prepare(inode, oldflags, iflags);
> + 	if (err)
> + 		return err;

I don't think this is the correct resolution.  Now f2fs_setflags_common() is
meant to take the f2fs on-disk i_flags, which aren't necessarily the same as the
flags passed to the FS_IOC_SETFLAGS ioctl.  So it's not appropriate to call
vfs_ioc_setflags_prepare() in it.  It should be in f2fs_ioc_setflags() instead.

I've pushed up what I think is the correct resolution to
https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=f2fs-setflags-resolved

Here is my diff of fs/f2fs/file.c from f2fs/dev.  Darrick, can you check that
this is what you would have done if you had patched f2fs/dev instead of v5.2?

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index e7c368db81851f..64f157f2e8d5e4 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1648,19 +1648,12 @@ static int f2fs_file_flush(struct file *file, fl_owner_t id)
 static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
 {
 	struct f2fs_inode_info *fi = F2FS_I(inode);
-	u32 oldflags;
 
 	/* Is it quota file? Do not allow user to mess with it */
 	if (IS_NOQUOTA(inode))
 		return -EPERM;
 
-	oldflags = fi->i_flags;
-
-	if ((iflags ^ oldflags) & (F2FS_APPEND_FL | F2FS_IMMUTABLE_FL))
-		if (!capable(CAP_LINUX_IMMUTABLE))
-			return -EPERM;
-
-	fi->i_flags = iflags | (oldflags & ~mask);
+	fi->i_flags = iflags | (fi->i_flags & ~mask);
 
 	if (fi->i_flags & F2FS_PROJINHERIT_FL)
 		set_inode_flag(inode, FI_PROJ_INHERIT);
@@ -1765,7 +1758,8 @@ static int f2fs_ioc_getflags(struct file *filp, unsigned long arg)
 static int f2fs_ioc_setflags(struct file *filp, unsigned long arg)
 {
 	struct inode *inode = file_inode(filp);
-	u32 fsflags;
+	struct f2fs_inode_info *fi = F2FS_I(inode);
+	u32 fsflags, old_fsflags;
 	u32 iflags;
 	int ret;
 
@@ -1789,8 +1783,14 @@ static int f2fs_ioc_setflags(struct file *filp, unsigned long arg)
 
 	inode_lock(inode);
 
+	old_fsflags = f2fs_iflags_to_fsflags(fi->i_flags);
+	ret = vfs_ioc_setflags_prepare(inode, old_fsflags, fsflags);
+	if (ret)
+		goto out;
+
 	ret = f2fs_setflags_common(inode, iflags,
 			f2fs_fsflags_to_iflags(F2FS_SETTABLE_FS_FL));
+out:
 	inode_unlock(inode);
 	mnt_drop_write_file(filp);
 	return ret;
@@ -2850,52 +2850,32 @@ static inline u32 f2fs_xflags_to_iflags(u32 xflags)
 	return iflags;
 }
 
-static int f2fs_ioc_fsgetxattr(struct file *filp, unsigned long arg)
+static void f2fs_fill_fsxattr(struct inode *inode, struct fsxattr *fa)
 {
-	struct inode *inode = file_inode(filp);
 	struct f2fs_inode_info *fi = F2FS_I(inode);
-	struct fsxattr fa;
 
-	memset(&fa, 0, sizeof(struct fsxattr));
-	fa.fsx_xflags = f2fs_iflags_to_xflags(fi->i_flags);
+	simple_fill_fsxattr(fa, f2fs_iflags_to_xflags(fi->i_flags));
 
 	if (f2fs_sb_has_project_quota(F2FS_I_SB(inode)))
-		fa.fsx_projid = (__u32)from_kprojid(&init_user_ns,
-							fi->i_projid);
-
-	if (copy_to_user((struct fsxattr __user *)arg, &fa, sizeof(fa)))
-		return -EFAULT;
-	return 0;
+		fa->fsx_projid = from_kprojid(&init_user_ns, fi->i_projid);
 }
 
-static int f2fs_ioctl_check_project(struct inode *inode, struct fsxattr *fa)
+static int f2fs_ioc_fsgetxattr(struct file *filp, unsigned long arg)
 {
-	/*
-	 * Project Quota ID state is only allowed to change from within the init
-	 * namespace. Enforce that restriction only if we are trying to change
-	 * the quota ID state. Everything else is allowed in user namespaces.
-	 */
-	if (current_user_ns() == &init_user_ns)
-		return 0;
+	struct inode *inode = file_inode(filp);
+	struct fsxattr fa;
 
-	if (__kprojid_val(F2FS_I(inode)->i_projid) != fa->fsx_projid)
-		return -EINVAL;
-
-	if (F2FS_I(inode)->i_flags & F2FS_PROJINHERIT_FL) {
-		if (!(fa->fsx_xflags & FS_XFLAG_PROJINHERIT))
-			return -EINVAL;
-	} else {
-		if (fa->fsx_xflags & FS_XFLAG_PROJINHERIT)
-			return -EINVAL;
-	}
+	f2fs_fill_fsxattr(inode, &fa);
 
+	if (copy_to_user((struct fsxattr __user *)arg, &fa, sizeof(fa)))
+		return -EFAULT;
 	return 0;
 }
 
 static int f2fs_ioc_fssetxattr(struct file *filp, unsigned long arg)
 {
 	struct inode *inode = file_inode(filp);
-	struct fsxattr fa;
+	struct fsxattr fa, old_fa;
 	u32 iflags;
 	int err;
 
@@ -2918,7 +2898,9 @@ static int f2fs_ioc_fssetxattr(struct file *filp, unsigned long arg)
 		return err;
 
 	inode_lock(inode);
-	err = f2fs_ioctl_check_project(inode, &fa);
+
+	f2fs_fill_fsxattr(inode, &old_fa);
+	err = vfs_ioc_fssetxattr_check(inode, &old_fa, &fa);
 	if (err)
 		goto out;
 	err = f2fs_setflags_common(inode, iflags,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
