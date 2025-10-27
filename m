Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 988DDC0C537
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Oct 2025 09:35:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tAvD8yBS5BfU37mx+FN/xnOmRf1Yathhx85DjYV0JJo=; b=VI+rsJy0r/vePzSiw7mhKqnUE/
	Tyj5+fxydcfgL682AdRz5PbNKpFCTzxaFJ6ojYxhvzyu0cuhd0ny3kt9IqTY36lRk+lbAyoQFSvec
	1c5o9FK11UHPa4bXWpRomF/4pmfCTQz7pImrtjXSfxgSJ5ED0UVfazgwgtn6Pjyw3e7M=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vDIh8-0002uY-QV;
	Mon, 27 Oct 2025 08:35:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vDIh6-0002uS-SQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Oct 2025 08:35:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hKQUE2JEMAdOera+qJOP9JhHnU0UbHSf0mUNBION7gQ=; b=QmNSQ+PGWaUCagNnO/m5ubIEn8
 hiOpaguM4AvRMN0dW1OAzZBXygThcrtKnh9SELtjrT1kyQpZiRCcsaFWjn8cbRPfjsmKObn5jRlJu
 Y1dlxfXqpcmw5yIqIT6eGjALZvNjQ+U/dGgn80BaVhoUksXH97VoMoHXP5ZxFGZkCZkE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hKQUE2JEMAdOera+qJOP9JhHnU0UbHSf0mUNBION7gQ=; b=iRrlbldMZxRzTxc05DcjNl7NQP
 w/zDtiWeTpa7IH8TKVYtfBZ0mRCbCKSKbpwbyUHJI8RvOyKrxLYGwlpyQfFrjFJboQXD5RQmcgB/g
 dbKGsTkMptyUOOVlIe4ullfQ8kChmSW+EqJWUJtIxd56SQLzToXpCoVUOYLQ5YPXQIz8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vDIh6-0002kB-9O for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Oct 2025 08:35:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A24296029B;
 Mon, 27 Oct 2025 08:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B1FDC4CEFB;
 Mon, 27 Oct 2025 08:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761554106;
 bh=nBL/Arnr+v0xQihy1CE1YgQgbw7rsr5Z2nF82BJ6fsc=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=HSRC0p4ClyaQU4oJGVswmB4Zj6VKbLGbDlSuEybNUMPC2WXj1h356ifpK+TWahVLx
 ESVFmRg2G88AyMtKXxzxkgL8gnuAK35Xuuu8SkYhiabfBThi47M/ghqgXmz06bKAQS
 2zNU5ycWw0VF2jZ6HFF6WIbFz/rTObcbK7Isrl17cc2+DdLLtD5JfSl05wU7eTOcXJ
 fMvwrSF9sXyxU19vopDfcgGmoMGQG4z9aovR38Z1AiMIwXED5YwV7JkEuCoeDmROn7
 yxgKvW4u2mteqRmzKNPbt3gbPDmGXEnPDQCYX2zJsFqjx49uF4gwZAMqu7ou2X4XQk
 0TYAxgCXsCToA==
Message-ID: <c0689523-a265-47ce-b443-b4fe4ae7d823@kernel.org>
Date: Mon, 27 Oct 2025 16:35:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251024143746.187140-1-yangyongpeng.storage@gmail.com>
Content-Language: en-US
In-Reply-To: <20251024143746.187140-1-yangyongpeng.storage@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/24/25 22:37, Yongpeng Yang wrote: > From: Yongpeng Yang
 <yangyongpeng@xiaomi.com> > > When F2FS uses multiple block devices, each
 device may have a > different discard granularity. The minimum t [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vDIh6-0002kB-9O
Subject: Re: [f2fs-dev] [PATCH] f2fs: ensure minimum trim granularity
 accounts for all devices
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/24/25 22:37, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> When F2FS uses multiple block devices, each device may have a
> different discard granularity. The minimum trim granularity must be
> at least the maximum discard granularity of all devices, excluding
> zoned devices. Use max_t instead of the max() macro to compute the
> maximum value.
> 
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> ---
>  fs/f2fs/f2fs.h | 12 ++++++++++++
>  fs/f2fs/file.c | 12 ++++++------
>  2 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 32fb2e7338b7..064bdbf463f7 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4762,6 +4762,18 @@ static inline bool f2fs_hw_support_discard(struct f2fs_sb_info *sbi)
>  	return false;
>  }
>  
> +static inline unsigned int f2fs_hw_discard_granularity(struct f2fs_sb_info *sbi)
> +{
> +	int i = 1;
> +	unsigned int discard_granularity = bdev_discard_granularity(sbi->sb->s_bdev);

Yongpeng,

The patch makes sense to me.

One extra question, if a zoned device contains both conventional zones and
sequential zones, what discard granularity will it exposes?

Thanks,

> +
> +	if (f2fs_is_multi_device(sbi))
> +		for (; i < sbi->s_ndevs && !bdev_is_zoned(FDEV(i).bdev); i++)
> +			discard_granularity = max_t(unsigned int, discard_granularity,
> +						bdev_discard_granularity(FDEV(i).bdev));
> +	return discard_granularity;
> +}
> +
>  static inline bool f2fs_realtime_discard_enable(struct f2fs_sb_info *sbi)
>  {
>  	return (test_opt(sbi, DISCARD) && f2fs_hw_support_discard(sbi)) ||
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 6d42e2d28861..ced0f78532c9 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2588,14 +2588,14 @@ static int f2fs_keep_noreuse_range(struct inode *inode,
>  static int f2fs_ioc_fitrim(struct file *filp, unsigned long arg)
>  {
>  	struct inode *inode = file_inode(filp);
> -	struct super_block *sb = inode->i_sb;
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>  	struct fstrim_range range;
>  	int ret;
>  
>  	if (!capable(CAP_SYS_ADMIN))
>  		return -EPERM;
>  
> -	if (!f2fs_hw_support_discard(F2FS_SB(sb)))
> +	if (!f2fs_hw_support_discard(sbi))
>  		return -EOPNOTSUPP;
>  
>  	if (copy_from_user(&range, (struct fstrim_range __user *)arg,
> @@ -2606,9 +2606,9 @@ static int f2fs_ioc_fitrim(struct file *filp, unsigned long arg)
>  	if (ret)
>  		return ret;
>  
> -	range.minlen = max((unsigned int)range.minlen,
> -			   bdev_discard_granularity(sb->s_bdev));
> -	ret = f2fs_trim_fs(F2FS_SB(sb), &range);
> +	range.minlen = max_t(unsigned int, range.minlen,
> +			f2fs_hw_discard_granularity(sbi));
> +	ret = f2fs_trim_fs(sbi, &range);
>  	mnt_drop_write_file(filp);
>  	if (ret < 0)
>  		return ret;
> @@ -2616,7 +2616,7 @@ static int f2fs_ioc_fitrim(struct file *filp, unsigned long arg)
>  	if (copy_to_user((struct fstrim_range __user *)arg, &range,
>  				sizeof(range)))
>  		return -EFAULT;
> -	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
> +	f2fs_update_time(sbi, REQ_TIME);
>  	return 0;
>  }
>  



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
