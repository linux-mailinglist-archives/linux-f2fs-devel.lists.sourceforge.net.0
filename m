Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB666878C69
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Mar 2024 02:43:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rjrAR-0001fi-4K;
	Tue, 12 Mar 2024 01:42:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rjrAP-0001fS-Hh
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Mar 2024 01:42:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BNtHHVS7sll8Zy59j1GCzNsoL5RYzJjgtdOuP0zhT2s=; b=WhcV76mH8GS1hVpJm0oyCQnWRO
 d1CoiiT/2JmPODh20FYEg4i+3teegCQpwAU/EICab5ev0wcADZJ8wavULy4BFiv0/G/J/BJjXdI6+
 4wFcntpXccY+fupsunn/3del5pinx3Rz5j9IdWsR+5gQY1mELuHrwHDXzlhFvEYvNjU4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BNtHHVS7sll8Zy59j1GCzNsoL5RYzJjgtdOuP0zhT2s=; b=B9/qoT78wHWm0kmgteQrWMxhxV
 0tFy1Nqeu/Posob5q+iKdUgwX8/xTZw2OIKeLkYfOF01A8DCk4Xe1QS6R+S4TchrzIFoK5ovG7q45
 73kVKdis2xkIg1wOMwLn3T9JrVhXgA+arL1H1ay2hbrIlVd0zjvPj8QcR4yTwMOod47U=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rjrAF-0002W7-96 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Mar 2024 01:42:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 91B7ECE124A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 12 Mar 2024 01:42:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2961C433F1;
 Tue, 12 Mar 2024 01:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710207760;
 bh=ioCglCiuFytXfIPfWrP5a+ai20J7qUrjXL07BC91CnE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IqyLkDuT4UQHkI1VNrl7vmcMiMTwQPqZ7GdYQ2vFZotLCiDImiI1EMvCPgIu50F6u
 vcvrVnNTeVoD1z+lXm1+ywBLGU5W4bDxzaKhyho2yIuKbGIGxcIjo7mC40WWCDszWr
 WkuqQ/NfVB5kuKv2EhMXHgSvkQpxhsUJYDqWS66PgX28s7ZXV9771/uUd9FL4g8zlq
 /nLe6I50ZVLBdHKrbSYFWja5AzLw52kOPpvzRmhIvJcSIndBRx8OG8TBy106hevy07
 3pFcmjhO6z5LFqu+logi37OQ2A3RU5gKEHk+eSLCkOeUXGNDAeyuJUkbJbZPcMI9QG
 hoCF8HR55TZkw==
Message-ID: <63ece9a0-ccd1-43f7-ab51-cf5adc49be71@kernel.org>
Date: Tue, 12 Mar 2024 09:42:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: jaegeuk@kernel.org
References: <20240229143838.45149-1-chao@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240229143838.45149-1-chao@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Ping, On 2024/2/29 22:38, Chao Yu wrote: > Support .shutdown
 callback in f2fs_sops, then, it can be called to > shut down the file system
 when underlying block device is marked dead. > > Signed-off-by: Chao [...]
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rjrAF-0002W7-96
Subject: Re: [f2fs-dev] [PATCH] f2fs: support .shutdown in f2fs_sops
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

Ping,

On 2024/2/29 22:38, Chao Yu wrote:
> Support .shutdown callback in f2fs_sops, then, it can be called to
> shut down the file system when underlying block device is marked dead.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>   fs/f2fs/f2fs.h  |  2 ++
>   fs/f2fs/file.c  | 70 ++++++++++++++++++++++++++++++-------------------
>   fs/f2fs/super.c |  6 +++++
>   3 files changed, 51 insertions(+), 27 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 85eb9a8a5ed3..80789255bf68 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3506,6 +3506,8 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>   		 struct iattr *attr);
>   int f2fs_truncate_hole(struct inode *inode, pgoff_t pg_start, pgoff_t pg_end);
>   void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count);
> +int f2fs_do_shutdown(struct f2fs_sb_info *sbi, unsigned int flag,
> +							bool readonly);
>   int f2fs_precache_extents(struct inode *inode);
>   int f2fs_fileattr_get(struct dentry *dentry, struct fileattr *fa);
>   int f2fs_fileattr_set(struct mnt_idmap *idmap,
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 4ca6c693b33a..d223175b3d5c 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2226,34 +2226,13 @@ static int f2fs_ioc_abort_atomic_write(struct file *filp)
>   	return ret;
>   }
>   
> -static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
> +int f2fs_do_shutdown(struct f2fs_sb_info *sbi, unsigned int flag,
> +							bool readonly)
>   {
> -	struct inode *inode = file_inode(filp);
> -	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>   	struct super_block *sb = sbi->sb;
> -	__u32 in;
>   	int ret = 0;
>   
> -	if (!capable(CAP_SYS_ADMIN))
> -		return -EPERM;
> -
> -	if (get_user(in, (__u32 __user *)arg))
> -		return -EFAULT;
> -
> -	if (in != F2FS_GOING_DOWN_FULLSYNC) {
> -		ret = mnt_want_write_file(filp);
> -		if (ret) {
> -			if (ret == -EROFS) {
> -				ret = 0;
> -				f2fs_stop_checkpoint(sbi, false,
> -						STOP_CP_REASON_SHUTDOWN);
> -				trace_f2fs_shutdown(sbi, in, ret);
> -			}
> -			return ret;
> -		}
> -	}
> -
> -	switch (in) {
> +	switch (flag) {
>   	case F2FS_GOING_DOWN_FULLSYNC:
>   		ret = bdev_freeze(sb->s_bdev);
>   		if (ret)
> @@ -2292,6 +2271,9 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
>   		goto out;
>   	}
>   
> +	if (readonly)
> +		goto out;
> +
>   	f2fs_stop_gc_thread(sbi);
>   	f2fs_stop_discard_thread(sbi);
>   
> @@ -2300,10 +2282,44 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
>   
>   	f2fs_update_time(sbi, REQ_TIME);
>   out:
> -	if (in != F2FS_GOING_DOWN_FULLSYNC)
> -		mnt_drop_write_file(filp);
>   
> -	trace_f2fs_shutdown(sbi, in, ret);
> +	trace_f2fs_shutdown(sbi, flag, ret);
> +
> +	return ret;
> +}
> +
> +static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
> +{
> +	struct inode *inode = file_inode(filp);
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	__u32 in;
> +	int ret;
> +	bool need_drop = false, readonly = false;
> +
> +	if (!capable(CAP_SYS_ADMIN))
> +		return -EPERM;
> +
> +	if (get_user(in, (__u32 __user *)arg))
> +		return -EFAULT;
> +
> +	if (in != F2FS_GOING_DOWN_FULLSYNC) {
> +		ret = mnt_want_write_file(filp);
> +		if (ret) {
> +			if (ret != -EROFS)
> +				return ret;
> +
> +			/* fallback to nosync shutdown for readonly fs */
> +			in = F2FS_GOING_DOWN_NOSYNC;
> +			readonly = true;
> +		} else {
> +			need_drop = true;
> +		}
> +	}
> +
> +	ret = f2fs_do_shutdown(sbi, in, readonly);
> +
> +	if (need_drop)
> +		mnt_drop_write_file(filp);
>   
>   	return ret;
>   }
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 78a76583a4aa..0676c2dcbbf7 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2547,6 +2547,11 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>   	return err;
>   }
>   
> +static void f2fs_shutdown(struct super_block *sb)
> +{
> +	f2fs_do_shutdown(F2FS_SB(sb), F2FS_GOING_DOWN_NOSYNC, false);
> +}
> +
>   #ifdef CONFIG_QUOTA
>   static bool f2fs_need_recovery(struct f2fs_sb_info *sbi)
>   {
> @@ -3146,6 +3151,7 @@ static const struct super_operations f2fs_sops = {
>   	.unfreeze_fs	= f2fs_unfreeze,
>   	.statfs		= f2fs_statfs,
>   	.remount_fs	= f2fs_remount,
> +	.shutdown	= f2fs_shutdown,
>   };
>   
>   #ifdef CONFIG_FS_ENCRYPTION


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
