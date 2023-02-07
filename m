Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EEB68D93F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Feb 2023 14:25:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pPNyL-0002YB-MD;
	Tue, 07 Feb 2023 13:25:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pPNy4-0002Xv-Fw
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Feb 2023 13:25:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gzjNq+lrSjKBnC01U/Yriq5cHcBwh01K/FfDnas+PbU=; b=KHchiKX1snC3OxVf6CEZE9+cjs
 9V6VWYXfbScqmNYLcoebM4PrU+r8tZZmbu8SgmnmVH/WccvP0+U2yzFbiTUhAVPUu933f4ueDwHIw
 jmT03peSFgLj0TPoC8Ou3ykoYr0PI0Osx5Prpyor4Bhma1nNZq+p0GWWG3atKGmJuCTc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gzjNq+lrSjKBnC01U/Yriq5cHcBwh01K/FfDnas+PbU=; b=OnujwD0yNNV0iQ6kwdCRugkzTR
 svRclXrGBlKhVhxJBA2ct+cYnanb2qzt2G3re1p0ftwi4YJOAIcQj4Hl7kQ8SH5RnZT1qyMkhLefp
 71yFYKHHYqm0n9mvbVYIyUojx8YffAZtyRBk2OeIX7waJHYoK3yCt8QUJ90FtV8t4kVI=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pPNy2-00DfXr-Su for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Feb 2023 13:25:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 96D33B81977;
 Tue,  7 Feb 2023 13:24:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D1A8C433EF;
 Tue,  7 Feb 2023 13:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675776295;
 bh=ioVmosDPxB5ukpdRdpAJ+ODAaRgvHm8xKSTWkiHnMtA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=q2LE1eeIIuhpGn0Qf2hRCb0Dybire81gx5R+hxDqV904vL82YNe8Rk3esDlrmIbYA
 6p7Y+FQrr8kEWRM9eqM1xaP3royTBLXr355/1xForP7Vcqz4kIFD+P5XkQHV2GU8yE
 0++zd9k7YpoweZiRxdwOLq6eANM3qkKlyobL2JGZBcbzHYFXAJOT2iPBvHlJ4suCGP
 2EFhVgBD6aeBHFtaiZNfzVXD/VCQ7afeTtqcKRiHnLS0FZlTaE30EdqMVR8uhPhgQw
 x16wbG5WLfZHQm2sbBrppYqFFRhtWhtPVrzSSRB7kjdcW9aO3GNpPyOgQZLAed0TYl
 /P6T4fx42fiRw==
Message-ID: <5b47f58a-4c3c-a183-777c-d4750f6b4d6c@kernel.org>
Date: Tue, 7 Feb 2023 21:24:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20230206144310.2344-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230206144310.2344-1-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/2/6 22:43, Yangtao Li wrote: > For LFS mode,
 it should
 update outplace and no need inplace update. > When using LFS mode for
 small-volume
 devices, IPU will not be used, > and the OPU writing m [...] 
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
X-Headers-End: 1pPNy2-00DfXr-Su
Subject: Re: [f2fs-dev] [PATCH v4 1/3] f2fs: fix to set ipu policy
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

On 2023/2/6 22:43, Yangtao Li wrote:
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
> v4:
> -allow set 0 in lfs mode for ipu_policy node
>   fs/f2fs/segment.h | 10 +++++++++-
>   fs/f2fs/super.c   | 17 +++++++++++------
>   fs/f2fs/sysfs.c   |  9 +++++++++
>   3 files changed, 29 insertions(+), 7 deletions(-)
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
> index 4ec2cbbc47eb..09696fc844ab 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1346,12 +1346,12 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>   	}
>   
>   	if (test_opt(sbi, DISABLE_CHECKPOINT) && f2fs_lfs_mode(sbi)) {
> -		f2fs_err(sbi, "LFS not compatible with checkpoint=disable");
> +		f2fs_err(sbi, "LFS is not compatible with checkpoint=disable");
>   		return -EINVAL;
>   	}
>   
>   	if (test_opt(sbi, ATGC) && f2fs_lfs_mode(sbi)) {
> -		f2fs_err(sbi, "LFS not compatible with ATGC");
> +		f2fs_err(sbi, "LFS is not compatible with ATGC");
>   		return -EINVAL;
>   	}
>   
> @@ -2304,6 +2304,12 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>   		}
>   	}
>   #endif
> +	if (f2fs_lfs_mode(sbi) && !IS_F2FS_IPU_DISABLE(sbi)) {
> +		err = -EINVAL;
> +		f2fs_warn(sbi, "LFS is not compatible with IPU");
> +		goto restore_opts;
> +	}
> +
>   	/* disallow enable atgc dynamically */
>   	if (no_atgc == !!test_opt(sbi, ATGC)) {
>   		err = -EINVAL;
> @@ -4083,10 +4089,9 @@ static void f2fs_tuning_parameters(struct f2fs_sb_info *sbi)
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

	SM_I(sbi)->ipu_policy = BIT(F2FS_IPU_FORCE) |
				BIT(F2FS_IPU_HONOR_OPU_WRITE);

I prefer to not exceed 80 lines, otherwise it looks good to me.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

>   	}
>   
>   	sbi->readdir_ra = true;
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 575a5536c0e7..3c3dae3ce84e 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -706,6 +706,15 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>   		return count;
>   	}
>   
> +	if (!strcmp(a->attr.name, "ipu_policy")) {
> +		if (t >= BIT(F2FS_IPU_MAX))
> +			return -EINVAL;
> +		if (t && f2fs_lfs_mode(sbi))
> +			return -EINVAL;
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
