Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4E687E697
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Mar 2024 11:02:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rm9ox-0005Pu-Pc;
	Mon, 18 Mar 2024 10:02:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rm9ow-0005Pn-CX
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Mar 2024 10:02:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WPq6WLYTqN7VnL7BPhqrLKgvIUbSGutyLY6c2cj74ls=; b=VfTC1yFhkomh8En9/DF8vXQudd
 URIPgsotJ89BZ7eQtuQc+iNm2KzS+fWTVUCjMy4v7JPkq8mcP5qcvpwi3wUPUXnXL48cRlq4PVWIb
 4g1sIqmENR8br4+RnYuwBGF+e9e57NAufPHRf31guJE+taiY689PvUeZ6uSx7vLdbwPo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WPq6WLYTqN7VnL7BPhqrLKgvIUbSGutyLY6c2cj74ls=; b=XEFWHZ3NkEBdad4iggNvtqS9Lz
 Cg9eOEmoHnDDiUtc03C7/4Ux2kKDB9ZPCnhim1PRsW/Ir6Hwq4AjrGc34vUb9fK/Yd2vYr5QCTgmD
 t4gZvPzEjJiAeCi7oQ2mKtCSXmj7z+eiwcsbbdcqt3h19FDf41l43cSvpqrR2uXPuLKc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rm9ol-0003Ca-1V for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Mar 2024 10:02:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C44D860BA9;
 Mon, 18 Mar 2024 10:02:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C3CC433C7;
 Mon, 18 Mar 2024 10:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710756128;
 bh=tda4FiMnApu30+uRV6hFBxyOyzn56uatU22g6W/0XNE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=vRuIEI42/m8mXeK6NKPHMDBhhvp0FuEujMLhLBq4QLB/RLzytZtRHLoONHaYdX5xm
 /EATDIF6JGteWt7sHr4TlYY+5lTgKc/c1z+uu+dMwHjvirUE+D+NVbzjuH8SVctD8j
 9Hl7EvLlFUITixFAJerQsT8RNTvOznr+XyuOKGHc5/fEapHHKS+aVccmcyRHH5Togi
 PAZy2k/vyr/7WmxRRaRt6aiZdn6CXULpsjr3S0qYEYEryIUUkrsnhDdYDi5QGCt4m4
 XlXrysdkRDGyP8cLWRrIr6wi9NBPrV1z1tEFcEfTCAskvC5LRkIN85xHGS8hlTj9R/
 z0w+FiUb2FLFA==
Message-ID: <d25da09b-282e-48ae-a0e3-ad89b26fe8ab@kernel.org>
Date: Mon, 18 Mar 2024 18:02:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1710502356-11469-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1710502356-11469-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/3/15 19:32, Zhiguo Niu wrote: > some user behaviors
 requested filesystem operations, which > will cause filesystem not idle.
 > Meanwhile adjust some f2fs_update_time(REQ_TIME) positions. > > S [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rm9ol-0003Ca-1V
Subject: Re: [f2fs-dev] [PATCH V2] f2fs: add REQ_TIME time update for some
 user behaviors
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
Cc: hongyu.jin@unisoc.com, ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/3/15 19:32, Zhiguo Niu wrote:
> some user behaviors requested filesystem operations, which
> will cause filesystem not idle.
> Meanwhile adjust some f2fs_update_time(REQ_TIME) positions.
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
> v2: update patch according to Chao's suggestions
> ---
> ---
>   fs/f2fs/file.c | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 1761ad1..8c9d6ea 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2354,13 +2354,14 @@ static bool uuid_is_nonzero(__u8 u[16])
>   static int f2fs_ioc_set_encryption_policy(struct file *filp, unsigned long arg)
>   {
>   	struct inode *inode = file_inode(filp);
> +	int ret;
>   
>   	if (!f2fs_sb_has_encrypt(F2FS_I_SB(inode)))
>   		return -EOPNOTSUPP;
>   
> +	ret = fscrypt_ioctl_set_policy(filp, (const void __user *)arg);
>   	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
> -
> -	return fscrypt_ioctl_set_policy(filp, (const void __user *)arg);
> +	return ret;
>   }
>   
>   static int f2fs_ioc_get_encryption_policy(struct file *filp, unsigned long arg)
> @@ -2786,7 +2787,8 @@ static int f2fs_ioc_defragment(struct file *filp, unsigned long arg)
>   	err = f2fs_defragment_range(sbi, filp, &range);
>   	mnt_drop_write_file(filp);
>   
> -	f2fs_update_time(sbi, REQ_TIME);
> +	if (range.len)
> +		f2fs_update_time(sbi, REQ_TIME);
>   	if (err < 0)
>   		return err;
>   
> @@ -3599,6 +3601,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
>   
>   	filemap_invalidate_unlock(inode->i_mapping);
>   	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +	f2fs_update_time(sbi, REQ_TIME);
>   out:

if (released_blocks)
	f2fs_update_time();

>   	inode_unlock(inode);
>   
> @@ -3768,6 +3771,7 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
>   		clear_inode_flag(inode, FI_COMPRESS_RELEASED);
>   		inode_set_ctime_current(inode);
>   		f2fs_mark_inode_dirty_sync(inode, true);
> +		f2fs_update_time(sbi, REQ_TIME);
>   	}
>   unlock_inode:

if (reserved_blocks)
	f2fs_update_time();

Thanks,

>   	inode_unlock(inode);
> @@ -3966,6 +3970,7 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
>   	if (len)
>   		ret = f2fs_secure_erase(prev_bdev, inode, prev_index,
>   				prev_block, len, range.flags);
> +	f2fs_update_time(sbi, REQ_TIME);
>   out:
>   	filemap_invalidate_unlock(mapping);
>   	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> @@ -4175,6 +4180,7 @@ static int f2fs_ioc_decompress_file(struct file *filp)
>   	if (ret)
>   		f2fs_warn(sbi, "%s: The file might be partially decompressed (errno=%d). Please delete the file.",
>   			  __func__, ret);
> +	f2fs_update_time(sbi, REQ_TIME);
>   out:
>   	inode_unlock(inode);
>   	file_end_write(filp);
> @@ -4254,6 +4260,7 @@ static int f2fs_ioc_compress_file(struct file *filp)
>   	if (ret)
>   		f2fs_warn(sbi, "%s: The file might be partially compressed (errno=%d). Please delete the file.",
>   			  __func__, ret);
> +	f2fs_update_time(sbi, REQ_TIME);
>   out:
>   	inode_unlock(inode);
>   	file_end_write(filp);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
