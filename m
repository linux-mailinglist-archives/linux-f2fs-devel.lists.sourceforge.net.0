Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C06EC8667A1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Feb 2024 02:40:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rePyl-0001Bo-Ac;
	Mon, 26 Feb 2024 01:40:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rePyk-0001Bf-06
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 01:40:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zY7ouNNa2QIAEupKHSsH+1xHoaicvB+P7SO3Dy2ujgQ=; b=CdSnCmgCS/QGA3jzYKZlQDKucR
 pdcSdCXixw8aTcRA/3t8WXUD/cNGIu0fHFu2QMkTHdsIJ74fOHHau0WFvlV9ljdnYh7Aupr5Gx9HM
 AStBspk2A9gXZ4blm9963SUp9b5PDkMUB7ISfelCSeRfROyLLxnwEVZTdAtYVnqBVfec=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zY7ouNNa2QIAEupKHSsH+1xHoaicvB+P7SO3Dy2ujgQ=; b=cxC8yZwuhUsrje4lsqsl9gNKLW
 XslKVYsRzgueqBikXXhQZkFDdbXsyfTvk0zxUdZPVFr8JrY4pA0igqLVzBtb0uyoSc0FLaoAtH3XV
 Ci5nVZlGhglimKwBWVDwxgQsnwReeBPkPOEWMft93BXmYvGlRmaiYJUtF1BRtO7Z2Gn8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rePyk-0008PS-8C for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 01:40:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D443160DF3;
 Mon, 26 Feb 2024 01:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5D2C433F1;
 Mon, 26 Feb 2024 01:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708911620;
 bh=E+V1Y4RQYIY8ckr4RlbF6c3RFkZOqY1GrMDaYw72cxE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KrNjPLsGKW+WDzp1mlaF7lz3WHQC+OTR01ypNb7let1Gi5PcJWumQ24Yer40nXFFw
 U9oAnFIbKgH54Nbrd0X2KDy4bDTVdXKb5+19bei6CzSBTE0JVPSRZu0y4A7f4WK+59
 iZvr/6ZVmEmQLghSf1uAZBQO6FccfOrYq74Yx0Rkmc7I6zWUJhmGBkx6BdhKr5YErr
 rCtA0QjYYSVZkUS4+ay4pvq4eGI7AhmYdIlbyJkoR1m3Z02O0cpRI+qDo10nFRoRKv
 pL+1MMeE0BZ36tP7ZvJkUtVFfFKOMIwCU0eQExuQvrYNsomJ3dJP+68WRRx2mmlbUK
 gpquzszhZWWiA==
Message-ID: <af7ee622-d4ab-42ed-96b2-35d1d95e4cb6@kernel.org>
Date: Mon, 26 Feb 2024 09:40:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240110091009.138206-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240110091009.138206-1-frank.li@vivo.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/1/10 17:10, Yangtao Li wrote: > Reserve blocks on
 released compress inode while writing, so > compressed files with released
 space are allowed to be rewritten. > > Signed-off-by: Yangtao Li <f [...]
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rePyk-0008PS-8C
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: reserve blocks on released
 compress inode while writing
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/1/10 17:10, Yangtao Li wrote:
> Reserve blocks on released compress inode while writing, so
> compressed files with released space are allowed to be rewritten.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/f2fs/file.c | 86 ++++++++++++++++++++++++++++++--------------------
>   1 file changed, 51 insertions(+), 35 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 15dabeac4690..749b5af17141 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -3612,39 +3612,15 @@ static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
>   	return reserved_blocks;
>   }
>   
> -static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
> +static int f2fs_reserve_file(struct inode *inode, unsigned int *blocks)

f2fs_do_reserve_compress_blocks()?

>   {
> -	struct inode *inode = file_inode(filp);
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>   	pgoff_t page_idx = 0, last_idx;
>   	unsigned int reserved_blocks = 0;
>   	int ret;
>   
> -	if (!f2fs_sb_has_compression(F2FS_I_SB(inode)))
> -		return -EOPNOTSUPP;
> -
> -	if (!f2fs_compressed_file(inode))
> -		return -EINVAL;
> -
> -	if (f2fs_readonly(sbi->sb))
> -		return -EROFS;
> -
> -	ret = mnt_want_write_file(filp);
> -	if (ret)
> -		return ret;
> -
> -	if (atomic_read(&F2FS_I(inode)->i_compr_blocks))
> -		goto out;
> -
>   	f2fs_balance_fs(F2FS_I_SB(inode), true);
>   
> -	inode_lock(inode);
> -
> -	if (!is_inode_flag_set(inode, FI_COMPRESS_RELEASED)) {
> -		ret = -EINVAL;
> -		goto unlock_inode;
> -	}
> -
>   	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>   	filemap_invalidate_lock(inode->i_mapping);
>   
> @@ -3688,14 +3664,8 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
>   		clear_inode_flag(inode, FI_COMPRESS_RELEASED);
>   		inode->i_ctime = current_time(inode);
>   		f2fs_mark_inode_dirty_sync(inode, true);
> -	}
> -unlock_inode:
> -	inode_unlock(inode);
> -out:
> -	mnt_drop_write_file(filp);
> -
> -	if (ret >= 0) {
> -		ret = put_user(reserved_blocks, (u64 __user *)arg);
> +		if (blocks)
> +			*blocks = reserved_blocks;
>   	} else if (reserved_blocks &&
>   			atomic_read(&F2FS_I(inode)->i_compr_blocks)) {
>   		set_sbi_flag(sbi, SBI_NEED_FSCK);
> @@ -3710,6 +3680,49 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
>   	return ret;
>   }
>   
> +static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
> +{
> +	struct inode *inode = file_inode(filp);
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	unsigned int reserved_blocks = 0;
> +	int ret;
> +
> +	if (!f2fs_sb_has_compression(F2FS_I_SB(inode)))
> +		return -EOPNOTSUPP;
> +
> +	if (!f2fs_compressed_file(inode))
> +		return -EINVAL;
> +
> +	if (f2fs_readonly(sbi->sb))
> +		return -EROFS;
> +
> +	ret = mnt_want_write_file(filp);
> +	if (ret)
> +		return ret;
> +
> +	if (atomic_read(&F2FS_I(inode)->i_compr_blocks))
> +		goto out;
> +
> +	inode_lock(inode);
> +
> +	if (!is_inode_flag_set(inode, FI_COMPRESS_RELEASED)) {
> +		ret = -EINVAL;
> +		goto unlock_inode;
> +	}
> +
> +	ret = f2fs_reserve_file(inode, &reserved_blocks);
> +
> +unlock_inode:
> +	inode_unlock(inode);
> +out:
> +	mnt_drop_write_file(filp);
> +
> +	if (ret >= 0)
> +		ret = put_user(reserved_blocks, (u64 __user *)arg);
> +
> +	return ret;
> +}
> +
>   static int f2fs_secure_erase(struct block_device *bdev, struct inode *inode,
>   		pgoff_t off, block_t block, block_t len, u32 flags)
>   {
> @@ -4412,8 +4425,11 @@ static ssize_t f2fs_write_checks(struct kiocb *iocb, struct iov_iter *from)
>   	if (IS_IMMUTABLE(inode))
>   		return -EPERM;
>   
> -	if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED))
> -		return -EPERM;
> +	if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED)) {
> +		err = f2fs_reserve_file(inode, NULL);

How about reserving blocks after generic_write_checks() in
f2fs_file_write_iter()?

Thanks,


> +		if (err < 0)
> +			return err;
> +	}
>   
>   	count = generic_write_checks(iocb, from);
>   	if (count <= 0)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
