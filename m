Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F7A4CF53
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jun 2019 15:46:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hdxOo-0006RG-M1; Thu, 20 Jun 2019 13:46:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>)
 id 1hdxOn-0006Qm-Jl; Thu, 20 Jun 2019 13:46:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vTi6TY76V+N5mWJDVEKgO2QwPllco00RAuLC6WW7MNY=; b=YXAmjPH1Zgb/VOb/q1ww6b8GIA
 rRU+0vM7mPz1nwV0MJY2Qsgg4jRP+ApMi9rdXxNsyRGEdacL1EKjeUH5JRkgYwSEdtvfV56W5kYjZ
 KRDtqcABJHDzItE9vBM4iL5R5ZToIm1xoRMxM8m9EQ9HanJXeL35eRANMgLcfq0OVm7c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vTi6TY76V+N5mWJDVEKgO2QwPllco00RAuLC6WW7MNY=; b=mp7JF3VP2l81CHChOgniQNNS8f
 VGDGQh42/NpwwTs8D3BIbvHI0wjriDZqBqX7CP0MjCjM594G3FguF3DAZCWrEflOSGQsvThbhrR9B
 V9aI6oNZVHiwjAoayvRG4QYxIJH+WwqtRU29NO4dSvNPOW0sx4CHNUiUaoDVt7Hj5WG8=;
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hdxOn-0068Z3-I3; Thu, 20 Jun 2019 13:46:47 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CAA66AE2C;
 Thu, 20 Jun 2019 13:46:37 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 504A11E434F; Thu, 20 Jun 2019 15:46:37 +0200 (CEST)
Date: Thu, 20 Jun 2019 15:46:37 +0200
From: Jan Kara <jack@suse.cz>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20190620134637.GG30243@quack2.suse.cz>
References: <156022833285.3227089.11990489625041926920.stgit@magnolia>
 <156022836522.3227089.4353401791178719941.stgit@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <156022836522.3227089.4353401791178719941.stgit@magnolia>
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
X-Headers-End: 1hdxOn-0068Z3-I3
Subject: Re: [f2fs-dev] [PATCH 4/4] vfs: teach vfs_ioc_fssetxattr_check to
 check extent size hints
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

On Mon 10-06-19 21:46:05, Darrick J. Wong wrote:
> From: Darrick J. Wong <darrick.wong@oracle.com>
> 
> Move the extent size hint checks that aren't xfs-specific to the vfs.
> 
> Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>

The patch looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/inode.c         |   18 +++++++++++++
>  fs/xfs/xfs_ioctl.c |   70 ++++++++++++++++++++++------------------------------
>  2 files changed, 47 insertions(+), 41 deletions(-)
> 
> 
> diff --git a/fs/inode.c b/fs/inode.c
> index 40ecd3a6a188..a3757051fd55 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -2214,6 +2214,24 @@ int vfs_ioc_fssetxattr_check(struct inode *inode, const struct fsxattr *old_fa,
>  			return -EINVAL;
>  	}
>  
> +	/* Check extent size hints. */
> +	if ((fa->fsx_xflags & FS_XFLAG_EXTSIZE) && !S_ISREG(inode->i_mode))
> +		return -EINVAL;
> +
> +	if ((fa->fsx_xflags & FS_XFLAG_EXTSZINHERIT) &&
> +			!S_ISDIR(inode->i_mode))
> +		return -EINVAL;
> +
> +	if ((fa->fsx_xflags & FS_XFLAG_COWEXTSIZE) &&
> +	    !S_ISREG(inode->i_mode) && !S_ISDIR(inode->i_mode))
> +		return -EINVAL;
> +
> +	/* Extent size hints of zero turn off the flags. */
> +	if (fa->fsx_extsize == 0)
> +		fa->fsx_xflags &= ~(FS_XFLAG_EXTSIZE | FS_XFLAG_EXTSZINHERIT);
> +	if (fa->fsx_cowextsize == 0)
> +		fa->fsx_xflags &= ~FS_XFLAG_COWEXTSIZE;
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL(vfs_ioc_fssetxattr_check);
> diff --git a/fs/xfs/xfs_ioctl.c b/fs/xfs/xfs_ioctl.c
> index 82961de98900..b494e7e881e3 100644
> --- a/fs/xfs/xfs_ioctl.c
> +++ b/fs/xfs/xfs_ioctl.c
> @@ -1201,39 +1201,31 @@ xfs_ioctl_setattr_check_extsize(
>  	struct fsxattr		*fa)
>  {
>  	struct xfs_mount	*mp = ip->i_mount;
> -
> -	if ((fa->fsx_xflags & FS_XFLAG_EXTSIZE) && !S_ISREG(VFS_I(ip)->i_mode))
> -		return -EINVAL;
> -
> -	if ((fa->fsx_xflags & FS_XFLAG_EXTSZINHERIT) &&
> -	    !S_ISDIR(VFS_I(ip)->i_mode))
> -		return -EINVAL;
> +	xfs_extlen_t		size;
> +	xfs_fsblock_t		extsize_fsb;
>  
>  	if (S_ISREG(VFS_I(ip)->i_mode) && ip->i_d.di_nextents &&
>  	    ((ip->i_d.di_extsize << mp->m_sb.sb_blocklog) != fa->fsx_extsize))
>  		return -EINVAL;
>  
> -	if (fa->fsx_extsize != 0) {
> -		xfs_extlen_t    size;
> -		xfs_fsblock_t   extsize_fsb;
> -
> -		extsize_fsb = XFS_B_TO_FSB(mp, fa->fsx_extsize);
> -		if (extsize_fsb > MAXEXTLEN)
> -			return -EINVAL;
> +	if (fa->fsx_extsize == 0)
> +		return 0;
>  
> -		if (XFS_IS_REALTIME_INODE(ip) ||
> -		    (fa->fsx_xflags & FS_XFLAG_REALTIME)) {
> -			size = mp->m_sb.sb_rextsize << mp->m_sb.sb_blocklog;
> -		} else {
> -			size = mp->m_sb.sb_blocksize;
> -			if (extsize_fsb > mp->m_sb.sb_agblocks / 2)
> -				return -EINVAL;
> -		}
> +	extsize_fsb = XFS_B_TO_FSB(mp, fa->fsx_extsize);
> +	if (extsize_fsb > MAXEXTLEN)
> +		return -EINVAL;
>  
> -		if (fa->fsx_extsize % size)
> +	if (XFS_IS_REALTIME_INODE(ip) ||
> +	    (fa->fsx_xflags & FS_XFLAG_REALTIME)) {
> +		size = mp->m_sb.sb_rextsize << mp->m_sb.sb_blocklog;
> +	} else {
> +		size = mp->m_sb.sb_blocksize;
> +		if (extsize_fsb > mp->m_sb.sb_agblocks / 2)
>  			return -EINVAL;
> -	} else
> -		fa->fsx_xflags &= ~(FS_XFLAG_EXTSIZE | FS_XFLAG_EXTSZINHERIT);
> +	}
> +
> +	if (fa->fsx_extsize % size)
> +		return -EINVAL;
>  
>  	return 0;
>  }
> @@ -1259,6 +1251,8 @@ xfs_ioctl_setattr_check_cowextsize(
>  	struct fsxattr		*fa)
>  {
>  	struct xfs_mount	*mp = ip->i_mount;
> +	xfs_extlen_t		size;
> +	xfs_fsblock_t		cowextsize_fsb;
>  
>  	if (!(fa->fsx_xflags & FS_XFLAG_COWEXTSIZE))
>  		return 0;
> @@ -1267,25 +1261,19 @@ xfs_ioctl_setattr_check_cowextsize(
>  	    ip->i_d.di_version != 3)
>  		return -EINVAL;
>  
> -	if (!S_ISREG(VFS_I(ip)->i_mode) && !S_ISDIR(VFS_I(ip)->i_mode))
> -		return -EINVAL;
> -
> -	if (fa->fsx_cowextsize != 0) {
> -		xfs_extlen_t    size;
> -		xfs_fsblock_t   cowextsize_fsb;
> +	if (fa->fsx_cowextsize == 0)
> +		return 0;
>  
> -		cowextsize_fsb = XFS_B_TO_FSB(mp, fa->fsx_cowextsize);
> -		if (cowextsize_fsb > MAXEXTLEN)
> -			return -EINVAL;
> +	cowextsize_fsb = XFS_B_TO_FSB(mp, fa->fsx_cowextsize);
> +	if (cowextsize_fsb > MAXEXTLEN)
> +		return -EINVAL;
>  
> -		size = mp->m_sb.sb_blocksize;
> -		if (cowextsize_fsb > mp->m_sb.sb_agblocks / 2)
> -			return -EINVAL;
> +	size = mp->m_sb.sb_blocksize;
> +	if (cowextsize_fsb > mp->m_sb.sb_agblocks / 2)
> +		return -EINVAL;
>  
> -		if (fa->fsx_cowextsize % size)
> -			return -EINVAL;
> -	} else
> -		fa->fsx_xflags &= ~FS_XFLAG_COWEXTSIZE;
> +	if (fa->fsx_cowextsize % size)
> +		return -EINVAL;
>  
>  	return 0;
>  }
> 
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
