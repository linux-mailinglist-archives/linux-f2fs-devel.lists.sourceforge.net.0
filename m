Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E6B72D04F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jun 2023 22:16:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q8nxd-0008Px-MR;
	Mon, 12 Jun 2023 20:16:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1q8nxb-0008Pr-Mx
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 20:16:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m0umbV35xR835fEjx7QUWLYbmqBxgh6Vlkq7f8GDwsA=; b=W1ep4gMdCr9yH3A+XHCwBuKHZv
 zNE2GQLv9rslRm+HwANOJCobfH7NDvqcFHpwfrCZ8xgPi1XWVWkf0I8g9PE9R3YZ8LbpTXH741soY
 4lbnxDg9XHZvLxudKvdxIUDk9Bjtg9eeFWRB2QYChcP96a/bSTowPYbuxtqL6FleorAk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m0umbV35xR835fEjx7QUWLYbmqBxgh6Vlkq7f8GDwsA=; b=We4CqVoOXNSX+n1YAqmPBzaJra
 f/UaQjdBFVdmXLG5Uz0xQaIU+OD8k4hsOY/irnYcJ68Y/UwwvF0SbaT1WLpJHOkJpUaSqTmIKu9vU
 5RV2NYk6vAzYsgqk1M2a6dZ5anH/J5HGtT7X5VAZ1LGmXI/uJXkiIaImpoKNJ3ABGvv8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q8nxb-0006YA-8C for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 20:16:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 77A6E617A8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 Jun 2023 20:16:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDA48C433EF;
 Mon, 12 Jun 2023 20:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686600972;
 bh=fNy6PCNyZ/ZgFsqHgyUlHwtcbWrxGE7+bJ0hTW50yJ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JM4j+rgCg86UjFlts7tVah/4iCxfXFWWwazW+5Ni4z5w3VJEKfOzF8/LUCesaD5F5
 yHWfMQDOng1oy9FksHVr52cLdmk6iMskzueze6sy46oLHsGupEZ8RPk7oikOuenane
 oqXFEZH18TaWNAMvBDlhgcCMOE/vSAmi3Uq2ymLf0ayDxZ3OXOEZlqY/CFhHOfVK0e
 52SEK1gJLoACH1RQfwbpruTJjvDg3zVp0Xf1Dg/MrHzFNhEYMS4TgJA0u7hx6RhGZY
 O87jH9kTrlahMkX46988iMi1O4O4vVrDR0GDBnNupXJZU0zXNtqECyeulWDN1UgQKU
 JANm7YITiowhw==
Date: Mon, 12 Jun 2023 13:16:11 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZId9Cw8eqgj417gz@google.com>
References: <20230531014055.3904072-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230531014055.3904072-1-chao@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/31,
 Chao Yu wrote: > There are several issues in sanity_check_inode():
 > - The code looks not clean,
 it checks extra_attr related condition > dispersively.
 > - It missed to check i_extra_isize w [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q8nxb-0006YA-8C
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: do more sanity check on inode
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

On 05/31, Chao Yu wrote:
> There are several issues in sanity_check_inode():
> - The code looks not clean, it checks extra_attr related condition
> dispersively.
> - It missed to check i_extra_isize w/ lower boundary
> - It missed to check feature dependency: prjquota, inode_chksum,
> inode_crtime, compression features rely on extra_attr feature.
> - It's not necessary to check i_extra_isize due to it will only
> be assigned to non-zero value if f2fs_has_extra_attr() is true
> in do_read_inode().
> 
> Fix them all in this patch.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - describe current problem in commit message
>  fs/f2fs/f2fs.h  |   2 +
>  fs/f2fs/inode.c | 108 +++++++++++++++++++++++++++++++-----------------
>  2 files changed, 72 insertions(+), 38 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 7e406da8b4b3..619ad49993ce 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3413,6 +3413,8 @@ static inline int get_inline_xattr_addrs(struct inode *inode)
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

Modified to combine else if.

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
