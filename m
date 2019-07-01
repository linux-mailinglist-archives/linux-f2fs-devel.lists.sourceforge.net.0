Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 691244CF10
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jun 2019 15:39:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hdxHD-0008CO-7m; Thu, 20 Jun 2019 13:38:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>)
 id 1hdxH5-0008Bp-Fj; Thu, 20 Jun 2019 13:38:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6EEm1P5J/f5LAAOjbsPtyVzj7ZJNoVZTVg6KTQnTDdM=; b=XEuJB5vAJxksdHKEHDVHnJRbLv
 V252Lkc7i+kdw5iDLMNkerGEneIeXcc3gNf4GhVv/bqMsd/Of00QdyLZZ9f9xX9EBLdykCrEvW3aP
 M7hXyTqhevs2C+L0PliMVaa9KMZ+iR+/AmcPZtGgFdd0PrIqgEbZamfA6AMBSOeIIBkA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6EEm1P5J/f5LAAOjbsPtyVzj7ZJNoVZTVg6KTQnTDdM=; b=GQ0ZSd0OpXkweq+tpmsBJoJ/Oi
 dONu8uAFoWgGhVzZjAuFElcZtbXjB3av6CNisoa5ssFk9w4GhHrITAuaPBrL8CVN8YghpFfSX4rTE
 abcfOxkpLtcKg5XFLXgqF/rqs6hDgQWJwEXH1FDhWVH+jw39luruEAbPOIH1LqObJsXw=;
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hdxGz-001RuW-OG; Thu, 20 Jun 2019 13:38:43 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DCA1FAF21;
 Thu, 20 Jun 2019 13:38:34 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 4C9591E434F; Thu, 20 Jun 2019 15:38:34 +0200 (CEST)
Date: Thu, 20 Jun 2019 15:38:34 +0200
From: Jan Kara <jack@suse.cz>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20190620133834.GE30243@quack2.suse.cz>
References: <156022833285.3227089.11990489625041926920.stgit@magnolia>
 <156022834894.3227089.18246471175409784122.stgit@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <156022834894.3227089.18246471175409784122.stgit@magnolia>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.cz]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hdxGz-001RuW-OG
Subject: Re: [f2fs-dev] [PATCH 2/4] vfs: create a generic checking function
 for FS_IOC_FSSETXATTR
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
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net,
 linux-efi@vger.kernel.org, linux-btrfs@vger.kernel.org, clm@fb.com,
 adilger.kernel@dilger.ca, matthew.garrett@nebula.com,
 linux-nilfs@vger.kernel.org, cluster-devel@redhat.com,
 linux-ext4@vger.kernel.org, josef@toxicpanda.com,
 reiserfs-devel@vger.kernel.org, viro@zeniv.linux.org.uk, dsterba@suse.com,
 jaegeuk@kernel.org, tytso@mit.edu, ard.biesheuvel@linaro.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, jk@ozlabs.org, jack@suse.com,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon 10-06-19 21:45:49, Darrick J. Wong wrote:
> From: Darrick J. Wong <darrick.wong@oracle.com>
> 
> Create a generic checking function for the incoming FS_IOC_FSSETXATTR
> fsxattr values so that we can standardize some of the implementation
> behaviors.
> 
> Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>

The patch looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/btrfs/ioctl.c   |   21 +++++++++-------
>  fs/ext4/ioctl.c    |   27 ++++++++++++++------
>  fs/f2fs/file.c     |   26 ++++++++++++++-----
>  fs/inode.c         |   17 +++++++++++++
>  fs/xfs/xfs_ioctl.c |   70 ++++++++++++++++++++++++++++++----------------------
>  include/linux/fs.h |    3 ++
>  6 files changed, 111 insertions(+), 53 deletions(-)
> 
> 
> diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
> index f408aa93b0cf..7ddda5b4b6a6 100644
> --- a/fs/btrfs/ioctl.c
> +++ b/fs/btrfs/ioctl.c
> @@ -366,6 +366,13 @@ static int check_xflags(unsigned int flags)
>  	return 0;
>  }
>  
> +static void __btrfs_ioctl_fsgetxattr(struct btrfs_inode *binode,
> +				     struct fsxattr *fa)
> +{
> +	memset(fa, 0, sizeof(*fa));
> +	fa->fsx_xflags = btrfs_inode_flags_to_xflags(binode->flags);
> +}
> +
>  /*
>   * Set the xflags from the internal inode flags. The remaining items of fsxattr
>   * are zeroed.
> @@ -375,8 +382,7 @@ static int btrfs_ioctl_fsgetxattr(struct file *file, void __user *arg)
>  	struct btrfs_inode *binode = BTRFS_I(file_inode(file));
>  	struct fsxattr fa;
>  
> -	memset(&fa, 0, sizeof(fa));
> -	fa.fsx_xflags = btrfs_inode_flags_to_xflags(binode->flags);
> +	__btrfs_ioctl_fsgetxattr(binode, &fa);
>  
>  	if (copy_to_user(arg, &fa, sizeof(fa)))
>  		return -EFAULT;
> @@ -390,7 +396,7 @@ static int btrfs_ioctl_fssetxattr(struct file *file, void __user *arg)
>  	struct btrfs_inode *binode = BTRFS_I(inode);
>  	struct btrfs_root *root = binode->root;
>  	struct btrfs_trans_handle *trans;
> -	struct fsxattr fa;
> +	struct fsxattr fa, old_fa;
>  	unsigned old_flags;
>  	unsigned old_i_flags;
>  	int ret = 0;
> @@ -421,13 +427,10 @@ static int btrfs_ioctl_fssetxattr(struct file *file, void __user *arg)
>  	old_flags = binode->flags;
>  	old_i_flags = inode->i_flags;
>  
> -	/* We need the capabilities to change append-only or immutable inode */
> -	if (((old_flags & (BTRFS_INODE_APPEND | BTRFS_INODE_IMMUTABLE)) ||
> -	     (fa.fsx_xflags & (FS_XFLAG_APPEND | FS_XFLAG_IMMUTABLE))) &&
> -	    !capable(CAP_LINUX_IMMUTABLE)) {
> -		ret = -EPERM;
> +	__btrfs_ioctl_fsgetxattr(binode, &old_fa);
> +	ret = vfs_ioc_fssetxattr_check(inode, &old_fa, &fa);
> +	if (ret)
>  		goto out_unlock;
> -	}
>  
>  	if (fa.fsx_xflags & FS_XFLAG_SYNC)
>  		binode->flags |= BTRFS_INODE_SYNC;
> diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
> index 5126ee351a84..c2f48c90ca45 100644
> --- a/fs/ext4/ioctl.c
> +++ b/fs/ext4/ioctl.c
> @@ -721,6 +721,19 @@ static int ext4_ioctl_check_project(struct inode *inode, struct fsxattr *fa)
>  	return 0;
>  }
>  
> +static void ext4_fsgetxattr(struct inode *inode, struct fsxattr *fa)
> +{
> +	struct ext4_inode_info *ei = EXT4_I(inode);
> +
> +	memset(fa, 0, sizeof(struct fsxattr));
> +	fa->fsx_xflags = ext4_iflags_to_xflags(ei->i_flags & EXT4_FL_USER_VISIBLE);
> +
> +	if (ext4_has_feature_project(inode->i_sb)) {
> +		fa->fsx_projid = (__u32)from_kprojid(&init_user_ns,
> +				ei->i_projid);
> +	}
> +}
> +
>  long ext4_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  {
>  	struct inode *inode = file_inode(filp);
> @@ -1089,13 +1102,7 @@ long ext4_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  	{
>  		struct fsxattr fa;
>  
> -		memset(&fa, 0, sizeof(struct fsxattr));
> -		fa.fsx_xflags = ext4_iflags_to_xflags(ei->i_flags & EXT4_FL_USER_VISIBLE);
> -
> -		if (ext4_has_feature_project(inode->i_sb)) {
> -			fa.fsx_projid = (__u32)from_kprojid(&init_user_ns,
> -				EXT4_I(inode)->i_projid);
> -		}
> +		ext4_fsgetxattr(inode, &fa);
>  
>  		if (copy_to_user((struct fsxattr __user *)arg,
>  				 &fa, sizeof(fa)))
> @@ -1104,7 +1111,7 @@ long ext4_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  	}
>  	case EXT4_IOC_FSSETXATTR:
>  	{
> -		struct fsxattr fa;
> +		struct fsxattr fa, old_fa;
>  		int err;
>  
>  		if (copy_from_user(&fa, (struct fsxattr __user *)arg,
> @@ -1127,7 +1134,11 @@ long ext4_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  			return err;
>  
>  		inode_lock(inode);
> +		ext4_fsgetxattr(inode, &old_fa);
>  		err = ext4_ioctl_check_project(inode, &fa);
> +		if (err)
> +			goto out;
> +		err = vfs_ioc_fssetxattr_check(inode, &old_fa, &fa);
>  		if (err)
>  			goto out;
>  		flags = (ei->i_flags & ~EXT4_FL_XFLAG_VISIBLE) |
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index a969d5497e03..f707de6bd4a8 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2773,19 +2773,26 @@ static inline unsigned long f2fs_xflags_to_iflags(__u32 xflags)
>  	return iflags;
>  }
>  
> -static int f2fs_ioc_fsgetxattr(struct file *filp, unsigned long arg)
> +static void __f2fs_ioc_fsgetxattr(struct inode *inode,
> +				  struct fsxattr *fa)
>  {
> -	struct inode *inode = file_inode(filp);
>  	struct f2fs_inode_info *fi = F2FS_I(inode);
> -	struct fsxattr fa;
>  
> -	memset(&fa, 0, sizeof(struct fsxattr));
> -	fa.fsx_xflags = f2fs_iflags_to_xflags(fi->i_flags &
> +	memset(fa, 0, sizeof(struct fsxattr));
> +	fa->fsx_xflags = f2fs_iflags_to_xflags(fi->i_flags &
>  				F2FS_FL_USER_VISIBLE);
>  
>  	if (f2fs_sb_has_project_quota(F2FS_I_SB(inode)))
> -		fa.fsx_projid = (__u32)from_kprojid(&init_user_ns,
> +		fa->fsx_projid = (__u32)from_kprojid(&init_user_ns,
>  							fi->i_projid);
> +}
> +
> +static int f2fs_ioc_fsgetxattr(struct file *filp, unsigned long arg)
> +{
> +	struct inode *inode = file_inode(filp);
> +	struct fsxattr fa;
> +
> +	__f2fs_ioc_fsgetxattr(inode, &fa);
>  
>  	if (copy_to_user((struct fsxattr __user *)arg, &fa, sizeof(fa)))
>  		return -EFAULT;
> @@ -2820,7 +2827,7 @@ static int f2fs_ioc_fssetxattr(struct file *filp, unsigned long arg)
>  {
>  	struct inode *inode = file_inode(filp);
>  	struct f2fs_inode_info *fi = F2FS_I(inode);
> -	struct fsxattr fa;
> +	struct fsxattr fa, old_fa;
>  	unsigned int flags;
>  	int err;
>  
> @@ -2844,6 +2851,11 @@ static int f2fs_ioc_fssetxattr(struct file *filp, unsigned long arg)
>  
>  	inode_lock(inode);
>  	err = f2fs_ioctl_check_project(inode, &fa);
> +	if (err)
> +		goto out;
> +
> +	__f2fs_ioc_fsgetxattr(inode, &old_fa);
> +	err = vfs_ioc_fssetxattr_check(inode, &old_fa, &fa);
>  	if (err)
>  		goto out;
>  	flags = (fi->i_flags & ~F2FS_FL_XFLAG_VISIBLE) |
> diff --git a/fs/inode.c b/fs/inode.c
> index 0ce60b720608..026955258a47 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -2187,3 +2187,20 @@ int vfs_ioc_setflags_check(struct inode *inode, int oldflags, int flags)
>  	return 0;
>  }
>  EXPORT_SYMBOL(vfs_ioc_setflags_check);
> +
> +/* Generic function to check FS_IOC_FSSETXATTR values. */
> +int vfs_ioc_fssetxattr_check(struct inode *inode, const struct fsxattr *old_fa,
> +			     struct fsxattr *fa)
> +{
> +	/*
> +	 * Can't modify an immutable/append-only file unless we have
> +	 * appropriate permission.
> +	 */
> +	if ((old_fa->fsx_xflags ^ fa->fsx_xflags) &
> +			(FS_XFLAG_IMMUTABLE | FS_XFLAG_APPEND) &&
> +	    !capable(CAP_LINUX_IMMUTABLE))
> +		return -EPERM;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(vfs_ioc_fssetxattr_check);
> diff --git a/fs/xfs/xfs_ioctl.c b/fs/xfs/xfs_ioctl.c
> index d7dfc13f30f5..08c24f2f55c3 100644
> --- a/fs/xfs/xfs_ioctl.c
> +++ b/fs/xfs/xfs_ioctl.c
> @@ -879,37 +879,45 @@ xfs_di2lxflags(
>  	return flags;
>  }
>  
> -STATIC int
> -xfs_ioc_fsgetxattr(
> -	xfs_inode_t		*ip,
> -	int			attr,
> -	void			__user *arg)
> +static void
> +__xfs_ioc_fsgetxattr(
> +	struct xfs_inode	*ip,
> +	bool			attr,
> +	struct fsxattr		*fa)
>  {
> -	struct fsxattr		fa;
> -
> -	memset(&fa, 0, sizeof(struct fsxattr));
> -
> -	xfs_ilock(ip, XFS_ILOCK_SHARED);
> -	fa.fsx_xflags = xfs_ip2xflags(ip);
> -	fa.fsx_extsize = ip->i_d.di_extsize << ip->i_mount->m_sb.sb_blocklog;
> -	fa.fsx_cowextsize = ip->i_d.di_cowextsize <<
> +	memset(fa, 0, sizeof(struct fsxattr));
> +	fa->fsx_xflags = xfs_ip2xflags(ip);
> +	fa->fsx_extsize = ip->i_d.di_extsize << ip->i_mount->m_sb.sb_blocklog;
> +	fa->fsx_cowextsize = ip->i_d.di_cowextsize <<
>  			ip->i_mount->m_sb.sb_blocklog;
> -	fa.fsx_projid = xfs_get_projid(ip);
> +	fa->fsx_projid = xfs_get_projid(ip);
>  
>  	if (attr) {
>  		if (ip->i_afp) {
>  			if (ip->i_afp->if_flags & XFS_IFEXTENTS)
> -				fa.fsx_nextents = xfs_iext_count(ip->i_afp);
> +				fa->fsx_nextents = xfs_iext_count(ip->i_afp);
>  			else
> -				fa.fsx_nextents = ip->i_d.di_anextents;
> +				fa->fsx_nextents = ip->i_d.di_anextents;
>  		} else
> -			fa.fsx_nextents = 0;
> +			fa->fsx_nextents = 0;
>  	} else {
>  		if (ip->i_df.if_flags & XFS_IFEXTENTS)
> -			fa.fsx_nextents = xfs_iext_count(&ip->i_df);
> +			fa->fsx_nextents = xfs_iext_count(&ip->i_df);
>  		else
> -			fa.fsx_nextents = ip->i_d.di_nextents;
> +			fa->fsx_nextents = ip->i_d.di_nextents;
>  	}
> +}
> +
> +STATIC int
> +xfs_ioc_fsgetxattr(
> +	xfs_inode_t		*ip,
> +	int			attr,
> +	void			__user *arg)
> +{
> +	struct fsxattr		fa;
> +
> +	xfs_ilock(ip, XFS_ILOCK_SHARED);
> +	__xfs_ioc_fsgetxattr(ip, attr, &fa);
>  	xfs_iunlock(ip, XFS_ILOCK_SHARED);
>  
>  	if (copy_to_user(arg, &fa, sizeof(fa)))
> @@ -1035,15 +1043,6 @@ xfs_ioctl_setattr_xflags(
>  	if ((fa->fsx_xflags & FS_XFLAG_DAX) && xfs_is_reflink_inode(ip))
>  		return -EINVAL;
>  
> -	/*
> -	 * Can't modify an immutable/append-only file unless
> -	 * we have appropriate permission.
> -	 */
> -	if (((ip->i_d.di_flags & (XFS_DIFLAG_IMMUTABLE | XFS_DIFLAG_APPEND)) ||
> -	     (fa->fsx_xflags & (FS_XFLAG_IMMUTABLE | FS_XFLAG_APPEND))) &&
> -	    !capable(CAP_LINUX_IMMUTABLE))
> -		return -EPERM;
> -
>  	/* diflags2 only valid for v3 inodes. */
>  	di_flags2 = xfs_flags2diflags2(ip, fa->fsx_xflags);
>  	if (di_flags2 && ip->i_d.di_version < 3)
> @@ -1323,6 +1322,7 @@ xfs_ioctl_setattr(
>  	xfs_inode_t		*ip,
>  	struct fsxattr		*fa)
>  {
> +	struct fsxattr		old_fa;
>  	struct xfs_mount	*mp = ip->i_mount;
>  	struct xfs_trans	*tp;
>  	struct xfs_dquot	*udqp = NULL;
> @@ -1370,7 +1370,6 @@ xfs_ioctl_setattr(
>  		goto error_free_dquots;
>  	}
>  
> -
>  	if (XFS_IS_QUOTA_RUNNING(mp) && XFS_IS_PQUOTA_ON(mp) &&
>  	    xfs_get_projid(ip) != fa->fsx_projid) {
>  		code = xfs_qm_vop_chown_reserve(tp, ip, udqp, NULL, pdqp,
> @@ -1379,6 +1378,11 @@ xfs_ioctl_setattr(
>  			goto error_trans_cancel;
>  	}
>  
> +	__xfs_ioc_fsgetxattr(ip, false, &old_fa);
> +	code = vfs_ioc_fssetxattr_check(VFS_I(ip), &old_fa, fa);
> +	if (code)
> +		goto error_trans_cancel;
> +
>  	code = xfs_ioctl_setattr_check_extsize(ip, fa);
>  	if (code)
>  		goto error_trans_cancel;
> @@ -1489,6 +1493,7 @@ xfs_ioc_setxflags(
>  {
>  	struct xfs_trans	*tp;
>  	struct fsxattr		fa;
> +	struct fsxattr		old_fa;
>  	unsigned int		flags;
>  	int			join_flags = 0;
>  	int			error;
> @@ -1524,6 +1529,13 @@ xfs_ioc_setxflags(
>  		goto out_drop_write;
>  	}
>  
> +	__xfs_ioc_fsgetxattr(ip, false, &old_fa);
> +	error = vfs_ioc_fssetxattr_check(VFS_I(ip), &old_fa, &fa);
> +	if (error) {
> +		xfs_trans_cancel(tp);
> +		goto out_drop_write;
> +	}
> +
>  	error = xfs_ioctl_setattr_xflags(tp, ip, &fa);
>  	if (error) {
>  		xfs_trans_cancel(tp);
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 1825d055808c..8dad3c80b611 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -3548,4 +3548,7 @@ static inline struct sock *io_uring_get_socket(struct file *file)
>  
>  int vfs_ioc_setflags_check(struct inode *inode, int oldflags, int flags);
>  
> +int vfs_ioc_fssetxattr_check(struct inode *inode, const struct fsxattr *old_fa,
> +			     struct fsxattr *fa);
> +
>  #endif /* _LINUX_FS_H */
> 
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
