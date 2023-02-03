Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD99A68936C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Feb 2023 10:20:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pNsF6-0000Vk-J0;
	Fri, 03 Feb 2023 09:20:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pNsF5-0000Vd-HZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Feb 2023 09:20:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4zyz5gDxcRhGG37YWwPGk5Y/VFn+uJzgBic6N3Q/dPE=; b=SEV6lweTEu4Pb33a7mgXETE9SD
 buu4WwbNxq2DgNCE1YmvrQlY8GleVJQQ4DiCruiPRhNy0pmn+4NV28+qPC+5xOXYdrqM3RpUHoOT+
 D6bOxONg+MQGcVOtPTFtP3NSOK/DP/1bxfoUuzXwNCwdXet7Rr/35nxMx9JNQrnRkijc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4zyz5gDxcRhGG37YWwPGk5Y/VFn+uJzgBic6N3Q/dPE=; b=QJvy9We3sFU1mB/dmycb+Bqsk2
 RAe61unxWGdQDZ+XPoaxo32EOfXvWbRvPvqnBdmY1r86g/R9IRWguwPXpQfMCpmdG0A9bYvxZ1nJQ
 xJsMOPpQFOLt27EGSZhD8vpGdkpI9meOiSqvWGnp92v7gWB9s5xxIDLmCd7XVQJ7Oje0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pNsF3-009ytB-DY for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Feb 2023 09:20:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F330561E21;
 Fri,  3 Feb 2023 09:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E8B5C433D2;
 Fri,  3 Feb 2023 09:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675416015;
 bh=U9pXr/hLXKeztUm2CNX6Swf9RkjUrLc3KXyhMVqG1cs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=d1/s1Vt6q0reVc7Isp9JJBkHYJ7CED5YfrxGgs+uWab63Ksfqf0X6JuziDehz/rpK
 gO11SAeLYx8SseqKLayHMsVRQD1QYPvHYwaSJMlXMwas7UXYE9FFm8h25cfP/srS4V
 KPB95SfxGgI2rQdXHtW9f+1Mgl/cx/ccLQhKenK5t03N9CTRs2Uh0GlMcSA8wHruJI
 wdmkbA4z9thuGnm0UvG20IbxrInmX2kk9Jf0SpL5nmQGgFeY1M37s9Scjut1Eiaa/o
 vGNRTMvSqPPvsIH2Om98AeLL/gjLNHWUbLmEEnnMSiSR1dK1vdFtHwKw6/obJuvkLG
 NM8JIjg29KCcQ==
Message-ID: <ff3eb77a-ef9a-164c-2572-16d56dd2d5a7@kernel.org>
Date: Fri, 3 Feb 2023 17:20:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20230202084815.70791-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230202084815.70791-1-frank.li@vivo.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/2/2 16:48, Yangtao Li wrote: > For LFS mode,
 it should
 update outplace and no need inplace update. > When using LFS mode for
 small-volume
 devices, IPU will not be used, > and the OPU writing m [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pNsF3-009ytB-DY
Subject: Re: [f2fs-dev] [PATCH v3 1/3] f2fs: fix to set ipu policy
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

On 2023/2/2 16:48, Yangtao Li wrote:
> For LFS mode, it should update outplace and no need inplace update.
> When using LFS mode for small-volume devices, IPU will not be used,
> and the OPU writing method is actually used, but F2FS_IPU_FORCE can
> be read from the ipu_policy node, which is different from the actual
> situation. And remount to lfs mode should be disallowed when
> f2fs ipu is enabled, let's fix it.
> 
> Fixes: 84b89e5d943d ("f2fs: add auto tuning for small devices")
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> v3:
> -add check in __sbi_store()
> -introduce IS_F2FS_IPU_DISABLE()
> -convert to f2fs_lfs_mode()
>   fs/f2fs/segment.h | 10 +++++++++-
>   fs/f2fs/super.c   | 13 +++++++++----
>   fs/f2fs/sysfs.c   |  9 +++++++++
>   3 files changed, 27 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 0f3f05cb8c29..8ee5e5db9287 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -670,6 +670,8 @@ static inline int utilization(struct f2fs_sb_info *sbi)
>   
>   #define SMALL_VOLUME_SEGMENTS	(16 * 512)	/* 16GB */
>   
> +#define F2FS_IPU_DISABLE	0
> +
>   enum {
>   	F2FS_IPU_FORCE,
>   	F2FS_IPU_SSR,
> @@ -679,10 +681,16 @@ enum {
>   	F2FS_IPU_ASYNC,
>   	F2FS_IPU_NOCACHE,
>   	F2FS_IPU_HONOR_OPU_WRITE,
> +	F2FS_IPU_MAX,
>   };
>   
> +static inline bool IS_F2FS_IPU_DISABLE(struct f2fs_sb_info *sbi)
> +{
> +	return SM_I(sbi)->ipu_policy == F2FS_IPU_DISABLE;
> +}
> +
>   #define F2FS_IPU_POLICY(name)					\
> -static inline int IS_##name(struct f2fs_sb_info *sbi)		\
> +static inline bool IS_##name(struct f2fs_sb_info *sbi)		\
>   {								\
>   	return SM_I(sbi)->ipu_policy & BIT(name);		\
>   }
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index fddff5deaed2..f06af2af215f 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2302,6 +2302,12 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>   		}
>   	}
>   #endif
> +	if (f2fs_lfs_mode(sbi) && !IS_F2FS_IPU_DISABLE(sbi)) {
> +		err = -EINVAL;
> +		f2fs_warn(sbi, "LFS not compatible with IPU");

LFS is not compatible with IPU

> +		goto restore_opts;
> +	}
> +
>   	/* disallow enable atgc dynamically */
>   	if (no_atgc == !!test_opt(sbi, ATGC)) {
>   		err = -EINVAL;
> @@ -4081,10 +4087,9 @@ static void f2fs_tuning_parameters(struct f2fs_sb_info *sbi)
>   	/* adjust parameters according to the volume size */
>   	if (MAIN_SEGS(sbi) <= SMALL_VOLUME_SEGMENTS) {
>   		if (f2fs_block_unit_discard(sbi))
> -			SM_I(sbi)->dcc_info->discard_granularity =
> -						MIN_DISCARD_GRANULARITY;
> -		SM_I(sbi)->ipu_policy = BIT(F2FS_IPU_FORCE) |
> -					BIT(F2FS_IPU_HONOR_OPU_WRITE);
> +			SM_I(sbi)->dcc_info->discard_granularity = MIN_DISCARD_GRANULARITY;
> +		if (!f2fs_lfs_mode(sbi))
> +			SM_I(sbi)->ipu_policy = BIT(F2FS_IPU_FORCE) | BIT(F2FS_IPU_HONOR_OPU_WRITE);
>   	}
>   
>   	sbi->readdir_ra = true;
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 3c6425f9ed0a..e1f1ebfa59d6 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -697,6 +697,15 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>   		return count;
>   	}
>   
> +	if (!strcmp(a->attr.name, "ipu_policy")) {
> +		if (f2fs_lfs_mode(sbi))
> +			return -EINVAL;
> +		if (t >= BIT(F2FS_IPU_MAX))
> +			return -EINVAL;

if (t && f2fs_lfs_mode(sbi))
	return -EINVAL;

> +		SM_I(sbi)->ipu_policy = (unsigned int)t;
> +		return count;
> +	}
> +
>   	*ui = (unsigned int)t;
>   
>   	return count;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
