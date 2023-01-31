Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8CD68224C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Jan 2023 03:40:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pMgZL-0005yS-OM;
	Tue, 31 Jan 2023 02:40:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pMgZK-0005yL-O8
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Jan 2023 02:40:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GCFxDNnxcuKdDvAGhA27vAXOAMzAkWVl749FaE5T/Wo=; b=mRGO5lGWj+ubQB5YR0ZQSYAxLa
 uuMtaPjmF5WU5H/lNUX6rlkAma7SKJVOrxNJg+/mr9aCdeBGzkc/k02gJwstJ8oh3coyMQRkAZMlu
 zkCKw+rdm8Cu+gosKXLEZ0P3vsNY7lzgqLUyk3Ub02pcavP+Wol5kG7Yzbgdrex3lQkU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GCFxDNnxcuKdDvAGhA27vAXOAMzAkWVl749FaE5T/Wo=; b=GaBhpFtucjfcxrh8Qu+snkdj1q
 8CY1g9/eC216ZI+woNRFCwiyPdHJJpYtKxpj07/kruTUkZ6kif3GAKkZq3DdOKZV93H8wH2Bs+aA2
 8fkDBxxyuyPdYBfdqAtlF1BbA7ikyh/wTVNAEM1E9NsSdYTVB+5Uiljs5uVLeh+NYmzI=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pMgZJ-004aKa-0X for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Jan 2023 02:40:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BAA1AB8165D;
 Tue, 31 Jan 2023 02:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821C9C433EF;
 Tue, 31 Jan 2023 02:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675132813;
 bh=gr3FF40RG7/jDbW76y2ObtVa388zzZP+2j5XpXFzoc0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=keDLHmhYTNnr0o7BZuDMWFGH3mnGIRB7tbemk0N9Vcy+HvpUZw7fBP8BKyzvfxBOi
 RuuYCs9LVS84RGdE14UQEPOc+NTNB+PfWtmdf+jgqUxCx+FVli8rhUO1ptNTfXdTfZ
 1J/h2N45iyYImfLYpaQ81kV8unD6n+AH0oHGLdoRhlnhWziD7YR/5EXwAaFrLjhdqg
 icmubEvP6E73ZEgk8+7eGsqgihRmAldBMQL9Qd0KUUi2bq57W66cTyHr/zuI8cAya5
 3GoWqSiMmVLaqbp/RuhhKP+Y0G3GtldZvT1JFfgYe2I63VJYghYswZ+KlEaBdtyqwU
 3aHVxUakW8QGQ==
Message-ID: <44982c50-49d6-5f04-f6d4-9d7d0dc5b92d@kernel.org>
Date: Tue, 31 Jan 2023 10:40:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20230121051204.81251-1-frank.li@vivo.com>
 <20230121051204.81251-2-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230121051204.81251-2-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/1/21 13:12, Yangtao Li wrote: > For LFS mode,
 it should
 update outplace and no need inplace update. > When using LFS mode for
 small-volume
 devices, IPU will not be used, > and the OPU writing [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pMgZJ-004aKa-0X
Subject: Re: [f2fs-dev] [PATCH v2 2/5] f2fs: fix to set ipu policy
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

On 2023/1/21 13:12, Yangtao Li wrote:
> For LFS mode, it should update outplace and no need inplace update.
> When using LFS mode for small-volume devices, IPU will not be used,
> and the OPU writing method is actually used, but F2FS_IPU_FORCE can
> be read from the ipu_policy node, which is different from the actual
> situation. And after remount, ipu should be disabled when convert to
> lfs mode, let's fix it.
> 
> Fixes: 84b89e5d943d ("f2fs: add auto tuning for small devices")
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> v2:
> -restore old_ipu_policy for fail case in remount
>   fs/f2fs/segment.h | 2 ++
>   fs/f2fs/super.c   | 9 ++++++++-
>   2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index ad6a9c19f46a..704d27ad682d 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -670,6 +670,8 @@ static inline int utilization(struct f2fs_sb_info *sbi)
>   
>   #define SMALL_VOLUME_SEGMENTS	(16 * 512)	/* 16GB */
>   
> +#define F2FS_IPU_DISABLE 0
> +
>   enum {
>   	F2FS_IPU_FORCE,
>   	F2FS_IPU_SSR,
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 0cedb693db58..1d2796863f8c 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2156,6 +2156,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>   	struct f2fs_sb_info *sbi = F2FS_SB(sb);
>   	struct f2fs_mount_info org_mount_opt;
>   	unsigned long old_sb_flags;
> +	unsigned int old_ipu_policy;
>   	int err;
>   	bool need_restart_gc = false, need_stop_gc = false;
>   	bool need_restart_ckpt = false, need_stop_ckpt = false;
> @@ -2179,6 +2180,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>   	 */
>   	org_mount_opt = sbi->mount_opt;
>   	old_sb_flags = sb->s_flags;
> +	old_ipu_policy = SM_I(sbi)->ipu_policy;
>   
>   #ifdef CONFIG_QUOTA
>   	org_mount_opt.s_jquota_fmt = F2FS_OPTION(sbi).s_jquota_fmt;
> @@ -2212,6 +2214,9 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>   	if (err)
>   		goto restore_opts;
>   
> +	if (F2FS_OPTION(sbi).fs_mode == FS_MODE_LFS)

if (f2fs_lfs_mode())

> +		SM_I(sbi)->ipu_policy = F2FS_IPU_DISABLE;

How about adding such restriction to f2fs_tuning_parameters()? For
f2fs_remount() and __sbi_store() cases, how about returning -EINVAL if
there is a conflict?

Thanks,

> +
>   	/*
>   	 * Previous and new state of filesystem is RO,
>   	 * so skip checking GC and FLUSH_MERGE conditions.
> @@ -2417,6 +2422,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>   		F2FS_OPTION(sbi).s_qf_names[i] = org_mount_opt.s_qf_names[i];
>   	}
>   #endif
> +	SM_I(sbi)->ipu_policy = old_ipu_policy;
>   	sbi->mount_opt = org_mount_opt;
>   	sb->s_flags = old_sb_flags;
>   	return err;
> @@ -3944,7 +3950,8 @@ static void f2fs_tuning_parameters(struct f2fs_sb_info *sbi)
>   	if (MAIN_SEGS(sbi) <= SMALL_VOLUME_SEGMENTS) {
>   		if (f2fs_block_unit_discard(sbi))
>   			SM_I(sbi)->dcc_info->discard_granularity = MIN_DISCARD_GRANULARITY;
> -		SM_I(sbi)->ipu_policy = BIT(F2FS_IPU_FORCE) | BIT(F2FS_IPU_HONOR_OPU_WRITE);
> +		if (F2FS_OPTION(sbi).fs_mode != FS_MODE_LFS)
> +			SM_I(sbi)->ipu_policy = BIT(F2FS_IPU_FORCE) | BIT(F2FS_IPU_HONOR_OPU_WRITE);
>   	}
>   
>   	sbi->readdir_ra = true;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
