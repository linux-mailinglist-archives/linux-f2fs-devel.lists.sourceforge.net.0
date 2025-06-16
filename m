Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBA7ADB026
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Jun 2025 14:26:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xJs4yIWCHjZYa3EW/3vOtZALdRE/mCM5sF9NOQepAc=; b=SgN/L+xjIH+gINKRDD1AU1JqaR
	e6QhtUb+2y9l0HZJTnGfLuI3H8YRbVn2OFzBNELvadNGUC87rJZuybNr/HqN/8b32Qe6EFAX58WSm
	qX6yKUCjzsnfxYtimjLPMjjhigdZej6ypD6pgeUGDu44YZ/SlWzw+Ojvls+zRB3Cz9aw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uR8vK-0001Id-0a;
	Mon, 16 Jun 2025 12:26:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uR8vH-0001IV-UJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Jun 2025 12:26:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pu3RFhJbx2nAddEWnamIa69bbWAKUYsUZme/uEgYJv0=; b=FtRk68RqDtzT9fJbuED4vmdlMQ
 O7C0UiRnbSQgYKFIVGZE3/qr+xUoXizfynDTmnnwVhqoYGGm3T8fN8vR3w9LOEUjjPH/3JP+dCupi
 +TlzvDe8NkXOtLRWJrIqfKat+VP9UkwD/aVhHmdbJqxJbgUPHbCmYTu9G3ejWCgre7vo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Pu3RFhJbx2nAddEWnamIa69bbWAKUYsUZme/uEgYJv0=; b=SxgcdiwsbBYTr097wAnx8rmy8x
 kCmTIObkQ4wI2gR4uLofisPOk8zJ6FtCLKg3eo4NYk0YNR/BnQCz+igfoyWmZLxTaErTMQ5exb7HO
 uKkvdAeJkhwnD5NOKXnu9PiRVmiwqq8T1eXXKgh1VGzpTBosme24e76nKO6j3SnENJFQ=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uR8vH-0006NC-CF for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Jun 2025 12:26:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B23E3A4FF36;
 Mon, 16 Jun 2025 12:26:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E36C4CEEA;
 Mon, 16 Jun 2025 12:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750076796;
 bh=LHjIh7SrrJj1vGEg4Leu2HdoHohXcjN1SjtuAPRoHH4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=SGu2SV3mZqHA1ACNeN/A6uREmZaBGZT2KQtf7GU2Rk7lT9M7cM63XclRjIW8f50oN
 ne+P2IVhVoPLFFX9hFdolAuXmCWzrLAbQTTjZBoCQIeobMtJTuyA2kwE/a5fqKXlIy
 iMqhBXPr0sW/k42Bkg83vHkgK5DTxC/K0if45Ua4t4e/IL55Dbhljx5oTJIvkYweNB
 ZFLLdvqqo6XQgB0vopDZNeSYSI6BJ1gLRcAV6+FeA1Uu85pp8jnly9vhzn/eLKBNKA
 i9tGuyBLGis/z2ozbnqsXSNWXiNZhkbGXaseubjewDFEX93x/U7NJJNsd57zKxcSXA
 SJPvyC+6RvD5g==
Message-ID: <22d8f579-ed67-4c4f-9e62-5e32b8bd0a7d@kernel.org>
Date: Mon, 16 Jun 2025 20:26:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wangzijie <wangzijie1@honor.com>, jaegeuk@kernel.org
References: <20250613103829.1895191-1-wangzijie1@honor.com>
Content-Language: en-US
In-Reply-To: <20250613103829.1895191-1-wangzijie1@honor.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/13/25 18:38,
 wangzijie wrote: > To prevent non-section-aligned
 size pinned file generated from truncation, > add check condition in setattr.
 Meanwhile, clean up F2FS_I_SB. > > Signed-off-by: wang [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uR8vH-0006NC-CF
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid non-section-aligned size pinned
 file generation
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: feng.han@honor.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 6/13/25 18:38, wangzijie wrote:
> To prevent non-section-aligned size pinned file generated from truncation,
> add check condition in setattr. Meanwhile, clean up F2FS_I_SB.
> 
> Signed-off-by: wangzijie <wangzijie1@honor.com>
> ---
>  fs/f2fs/file.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 6bd3de64f..31ecf615b 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1026,9 +1026,11 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>  {
>  	struct inode *inode = d_inode(dentry);
>  	struct f2fs_inode_info *fi = F2FS_I(inode);
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	block_t sec_blks = CAP_BLKS_PER_SEC(sbi);
>  	int err;
>  
> -	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
> +	if (unlikely(f2fs_cp_error(sbi)))
>  		return -EIO;
>  
>  	if (unlikely(IS_IMMUTABLE(inode)))
> @@ -1047,6 +1049,11 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>  			!IS_ALIGNED(attr->ia_size,
>  			F2FS_BLK_TO_BYTES(fi->i_cluster_size)))
>  			return -EINVAL;
> +		if (f2fs_is_pinned_file(inode) &&
> +			attr->ia_size < i_size_read(inode) &&
> +			!IS_ALIGNED(attr->ia_size,
> +			F2FS_BLK_TO_BYTES(sec_blks)))

F2FS_BLK_TO_BYTES(CAP_BLKS_PER_SEC(sbi))?

as this is the only case we use sec_blks in f2fs_setattr().

And can you please do cleanup on sbi in separated patch?

Thanks,

> +			return -EINVAL;
>  	}
>  
>  	err = setattr_prepare(idmap, dentry, attr);
> @@ -1068,12 +1075,11 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>  	}
>  	if (i_uid_needs_update(idmap, attr, inode) ||
>  	    i_gid_needs_update(idmap, attr, inode)) {
> -		f2fs_lock_op(F2FS_I_SB(inode));
> +		f2fs_lock_op(sbi);
>  		err = dquot_transfer(idmap, inode, attr);
>  		if (err) {
> -			set_sbi_flag(F2FS_I_SB(inode),
> -					SBI_QUOTA_NEED_REPAIR);
> -			f2fs_unlock_op(F2FS_I_SB(inode));
> +			set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
> +			f2fs_unlock_op(sbi);
>  			return err;
>  		}
>  		/*
> @@ -1083,7 +1089,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>  		i_uid_update(idmap, attr, inode);
>  		i_gid_update(idmap, attr, inode);
>  		f2fs_mark_inode_dirty_sync(inode, true);
> -		f2fs_unlock_op(F2FS_I_SB(inode));
> +		f2fs_unlock_op(sbi);
>  	}
>  
>  	if (attr->ia_valid & ATTR_SIZE) {
> @@ -1144,7 +1150,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>  	f2fs_mark_inode_dirty_sync(inode, true);
>  
>  	/* inode change will produce dirty node pages flushed by checkpoint */
> -	f2fs_balance_fs(F2FS_I_SB(inode), true);
> +	f2fs_balance_fs(sbi, true);
>  
>  	return err;
>  }



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
