Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EDE71712F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 May 2023 01:03:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q48Nc-0005j9-Aa;
	Tue, 30 May 2023 23:03:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1q48NP-0005ix-Kq
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 May 2023 23:03:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cQaU449aOlM8AxJqG5IQzWPy/zPkKpvV3Xe0nime3xc=; b=GtveQpUvpBezm0EwqpIKL1NhvO
 viwK4EJWI68GjXLJ4uNZFsuOWWZXgNbsfC5qLcPFxL5qbBfDbQC5Tqu9g0Jqr6IwE4ZQtsm3c7oYo
 tQxJPQq+i5HzoOoHMLi2B/1lnr/z3PTRPM2feV4zlH3/F7AtXIKL0it+ZDdSWHb9Hh3I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cQaU449aOlM8AxJqG5IQzWPy/zPkKpvV3Xe0nime3xc=; b=jR1OCUrJwxn/+CFed5tIQJAryH
 G1PLirOtKfPVLpt56MU8ckg/fKcE7APpQ7XYwVbWdPuo+0RlYa9obw6+ID9OSJw9urNzVHprMN0wJ
 3+yuYMRjNT9Yg+9nUfM3XkT5iZF26ImRyPvKNJhkbZBTZalkAgaDdgQSlrDEDIZE2ULk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q48NN-006vfn-4g for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 May 2023 23:03:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E8CA061728
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 May 2023 23:03:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 429F3C433EF;
 Tue, 30 May 2023 23:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685487810;
 bh=0Thf2vGiVZB40K3tYyJIw8Ovlj3DnYCkuF6fIzUtijY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KQ/ilYy34kkEJKDalLo+4Y4jHP7NpCUcWH7lLt8EB6FdyOHw+t3vK1RUQfD/aSvZJ
 hIQzlvcFfE2ZWwGGmduwLwgaUdeMISjkVxmD4LtvIjSvY0jPZNfBn3zTaPKPmv5pnU
 jyqr3hb5R6dBSQxRFHTVMLxLxUq7K7fQ6OrVa1QHqdX/KBKtDpQJIQurXU5PGn0nKd
 VyvPD2nii0125SpdktRH8AEWD8bLZXy2My6rAD63hOubjD7R8gKPmf/FI3EN6NM/eo
 /R4bwsNiKUaF0MOlCKntioy5rFSu5i6E5x476i26oYTioVbZkBZxiIXmXB1zL5H05g
 bk4f93Ejp0QgQ==
Date: Tue, 30 May 2023 16:03:28 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZHaAwCIiQJI+SYe9@google.com>
References: <20230529102755.2547478-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230529102755.2547478-1-chao@kernel.org>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/29, Chao Yu wrote: > This patch does below changes:
 > - clean up check condition > - add sanity check for i_extra_isize w/ lower
 boundary > - add sanity check for feature dependency > - check i_ [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q48NN-006vfn-4g
Subject: Re: [f2fs-dev] [PATCH] f2fs: do more sanity check on inode
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/29, Chao Yu wrote:
> This patch does below changes:
> - clean up check condition
> - add sanity check for i_extra_isize w/ lower boundary
> - add sanity check for feature dependency
> - check i_extra_isize only if f2fs_has_extra_attr() is true

Could you describe what is the current problem?

> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/f2fs.h  |   2 +
>  fs/f2fs/inode.c | 108 +++++++++++++++++++++++++++++++-----------------
>  2 files changed, 72 insertions(+), 38 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 9bd83fb28439..11c0bb12c686 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3424,6 +3424,8 @@ static inline int get_inline_xattr_addrs(struct inode *inode)
>  	((is_inode_flag_set(i, FI_ACL_MODE)) ? \
>  	 (F2FS_I(i)->i_acl_mode) : ((i)->i_mode))
>  
> +#define F2FS_MIN_EXTRA_ATTR_SIZE		(sizeof(__le32))
> +
>  #define F2FS_TOTAL_EXTRA_ATTR_SIZE			\
>  	(offsetof(struct f2fs_inode, i_extra_end) -	\
>  	offsetof(struct f2fs_inode, i_extra_isize))	\
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index 0a1748444329..1e49009831c1 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -300,41 +300,79 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
>  		return false;
>  	}
>  
> -	if (f2fs_sb_has_flexible_inline_xattr(sbi)
> -			&& !f2fs_has_extra_attr(inode)) {
> -		set_sbi_flag(sbi, SBI_NEED_FSCK);
> -		f2fs_warn(sbi, "%s: corrupted inode ino=%lx, run fsck to fix.",
> -			  __func__, inode->i_ino);
> -		return false;
> -	}
> -
> -	if (f2fs_has_extra_attr(inode) &&
> -			!f2fs_sb_has_extra_attr(sbi)) {
> -		set_sbi_flag(sbi, SBI_NEED_FSCK);
> -		f2fs_warn(sbi, "%s: inode (ino=%lx) is with extra_attr, but extra_attr feature is off",
> -			  __func__, inode->i_ino);
> -		return false;
> -	}
> -
> -	if (fi->i_extra_isize > F2FS_TOTAL_EXTRA_ATTR_SIZE ||
> +	if (f2fs_has_extra_attr(inode)) {
> +		if (!f2fs_sb_has_extra_attr(sbi)) {
> +			set_sbi_flag(sbi, SBI_NEED_FSCK);
> +			f2fs_warn(sbi, "%s: inode (ino=%lx) is with extra_attr, but extra_attr feature is off",
> +				  __func__, inode->i_ino);
> +			return false;
> +		}
> +		if (fi->i_extra_isize > F2FS_TOTAL_EXTRA_ATTR_SIZE ||
> +			fi->i_extra_isize < F2FS_MIN_EXTRA_ATTR_SIZE ||
>  			fi->i_extra_isize % sizeof(__le32)) {
> -		set_sbi_flag(sbi, SBI_NEED_FSCK);
> -		f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_extra_isize: %d, max: %zu",
> -			  __func__, inode->i_ino, fi->i_extra_isize,
> -			  F2FS_TOTAL_EXTRA_ATTR_SIZE);
> -		return false;
> +			set_sbi_flag(sbi, SBI_NEED_FSCK);
> +			f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_extra_isize: %d, max: %zu",
> +				  __func__, inode->i_ino, fi->i_extra_isize,
> +				  F2FS_TOTAL_EXTRA_ATTR_SIZE);
> +			return false;
> +		}
> +		if (f2fs_sb_has_flexible_inline_xattr(sbi) &&
> +			f2fs_has_inline_xattr(inode) &&
> +			(!fi->i_inline_xattr_size ||
> +			fi->i_inline_xattr_size > MAX_INLINE_XATTR_SIZE)) {
> +			set_sbi_flag(sbi, SBI_NEED_FSCK);
> +			f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_inline_xattr_size: %d, max: %zu",
> +				  __func__, inode->i_ino, fi->i_inline_xattr_size,
> +				  MAX_INLINE_XATTR_SIZE);
> +			return false;
> +		}
> +		if (f2fs_sb_has_compression(sbi) &&
> +			fi->i_flags & F2FS_COMPR_FL &&
> +			F2FS_FITS_IN_INODE(ri, fi->i_extra_isize,
> +						i_compress_flag)) {
> +			if (!sanity_check_compress_inode(inode, ri))
> +				return false;
> +		}
> +	} else {
> +		if (f2fs_sb_has_flexible_inline_xattr(sbi)) {
> +			set_sbi_flag(sbi, SBI_NEED_FSCK);
> +			f2fs_warn(sbi, "%s: corrupted inode ino=%lx, run fsck to fix.",
> +				  __func__, inode->i_ino);
> +			return false;
> +		}
>  	}
>  
> -	if (f2fs_has_extra_attr(inode) &&
> -		f2fs_sb_has_flexible_inline_xattr(sbi) &&
> -		f2fs_has_inline_xattr(inode) &&
> -		(!fi->i_inline_xattr_size ||
> -		fi->i_inline_xattr_size > MAX_INLINE_XATTR_SIZE)) {
> -		set_sbi_flag(sbi, SBI_NEED_FSCK);
> -		f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_inline_xattr_size: %d, max: %zu",
> -			  __func__, inode->i_ino, fi->i_inline_xattr_size,
> -			  MAX_INLINE_XATTR_SIZE);
> -		return false;
> +	if (!f2fs_sb_has_extra_attr(sbi)) {
> +		if (f2fs_sb_has_project_quota(sbi)) {
> +			set_sbi_flag(sbi, SBI_NEED_FSCK);
> +			f2fs_warn(sbi, "%s: corrupted inode ino=%lx, wrong feature flag: %u, run fsck to fix.",
> +				  __func__, inode->i_ino, F2FS_FEATURE_PRJQUOTA);
> +			return false;
> +		}
> +		if (f2fs_sb_has_inode_chksum(sbi)) {
> +			set_sbi_flag(sbi, SBI_NEED_FSCK);
> +			f2fs_warn(sbi, "%s: corrupted inode ino=%lx, wrong feature flag: %u, run fsck to fix.",
> +				  __func__, inode->i_ino, F2FS_FEATURE_INODE_CHKSUM);
> +			return false;
> +		}
> +		if (f2fs_sb_has_flexible_inline_xattr(sbi)) {
> +			set_sbi_flag(sbi, SBI_NEED_FSCK);
> +			f2fs_warn(sbi, "%s: corrupted inode ino=%lx, wrong feature flag: %u, run fsck to fix.",
> +				  __func__, inode->i_ino, F2FS_FEATURE_FLEXIBLE_INLINE_XATTR);
> +			return false;
> +		}
> +		if (f2fs_sb_has_inode_crtime(sbi)) {
> +			set_sbi_flag(sbi, SBI_NEED_FSCK);
> +			f2fs_warn(sbi, "%s: corrupted inode ino=%lx, wrong feature flag: %u, run fsck to fix.",
> +				  __func__, inode->i_ino, F2FS_FEATURE_INODE_CRTIME);
> +			return false;
> +		}
> +		if (f2fs_sb_has_compression(sbi)) {
> +			set_sbi_flag(sbi, SBI_NEED_FSCK);
> +			f2fs_warn(sbi, "%s: corrupted inode ino=%lx, wrong feature flag: %u, run fsck to fix.",
> +				  __func__, inode->i_ino, F2FS_FEATURE_COMPRESSION);
> +			return false;
> +		}
>  	}
>  
>  	if (f2fs_sanity_check_inline_data(inode)) {
> @@ -358,12 +396,6 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
>  		return false;
>  	}
>  
> -	if (f2fs_has_extra_attr(inode) && f2fs_sb_has_compression(sbi) &&
> -			fi->i_flags & F2FS_COMPR_FL &&
> -			F2FS_FITS_IN_INODE(ri, fi->i_extra_isize,
> -						i_compress_flag))
> -		return sanity_check_compress_inode(inode, ri);
> -
>  	return true;
>  }
>  
> -- 
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
