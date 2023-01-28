Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DF467F6BE
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 28 Jan 2023 10:38:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pLhez-0001u7-0S;
	Sat, 28 Jan 2023 09:38:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pLhek-0001tj-52
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 28 Jan 2023 09:37:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jV3Q69L+V2pW9ROu1l2Tewn0rjnzmsJVdeP7EhvE9rI=; b=A3q/vrgtz1d/ttsv1L56A4676x
 IUiCsEW24L0uK8UUtB830PsMs8yBbdU2+OVSDNGN/Xpr5uPwrJWNiLd0KrG+jjfWyDWVHrmn095RE
 1MZJYZ8KrS+a4bhb03dRC+ebUmPRQBEs2BFifNIdJS8hFkvgeowCEXAdcCEfLfSkKdBU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jV3Q69L+V2pW9ROu1l2Tewn0rjnzmsJVdeP7EhvE9rI=; b=Au//zjlrUh2GKUvVIZPtfG+iPF
 yJRM+oCBuMky1Gla5xTD3UoPQcpIBwlGprSnszTK6d7I0DBF85ZvWP2lKdeqttUqXOE/uA2FFeo+r
 6QgMTZEpkEp3x4+/I6JL0OHUNSCl/Z5P8vEdQY8zGfpGQILKS4SeEJzoZj2jdr18N3Jo=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pLhec-0003dO-RL for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 28 Jan 2023 09:37:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 55728B801BE;
 Sat, 28 Jan 2023 09:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFB81C433EF;
 Sat, 28 Jan 2023 09:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674898660;
 bh=9TsTbB0N9axfkPVtPBxJoBCVnXYTjCOlRMczvecOdbc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gjH06AtuEqSGhEy5aD+WoBaW50IY106QVEygA13TCxCYovS6OW8xPwVn3Cuo6NGG9
 kfojbRhEh3vfmdXtTm2E8SYqP397yfKPa4FjgcnsyNp/uP8Gcs+Q3Oln5NF2Qdvyw7
 knTIo8C6XvmPOexOYCeO4ppBu3DOLaL12VjEl3HzfFRmrB+KplfOy9xoAD3tWFjUDj
 l9kMrp9XadgRwJRN1dbzRYFUszC4KAtMZvuryrnTuttJumIZCAg2N0ZytssStEN2nE
 cXjjmAjKMVKaYjW5kuVAOf0KebOnQcj7ir14Sj5LfdNZeOxWbrune+H8SCoBXWATjM
 B3oQ87AHmDTTg==
Message-ID: <fe663b7c-2aa3-c15c-5ce7-942a47310742@kernel.org>
Date: Sat, 28 Jan 2023 17:37:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20230120134029.69200-1-frank.li@vivo.com>
 <20230120134029.69200-3-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230120134029.69200-3-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/1/20 21:40, Yangtao Li wrote: > Add a ipu_mode sysfs
 node to show the current ipu policy as a string. Why do we need to add another
 sysfs entry for ipu_policy? we can check the description of ipu_policy bits
 in below sysfs document. 
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
X-Headers-End: 1pLhec-0003dO-RL
Subject: Re: [f2fs-dev] [PATCH 3/4] f2fs: introduce ipu_mode sysfs node
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

On 2023/1/20 21:40, Yangtao Li wrote:
> Add a ipu_mode sysfs node to show the current ipu policy as a string.

Why do we need to add another sysfs entry for ipu_policy? we can check
the description of ipu_policy bits in below sysfs document.

What:           /sys/fs/f2fs/<disk>/ipu_policy
Date:           November 2013
Contact:        "Jaegeuk Kim" <jaegeuk.kim@samsung.com>
Description:    Controls the in-place-update policy.
                 updates in f2fs. User can set:

                 ====  =================
                 0x01  F2FS_IPU_FORCE
                 0x02  F2FS_IPU_SSR
                 0x04  F2FS_IPU_UTIL
                 0x08  F2FS_IPU_SSR_UTIL
                 0x10  F2FS_IPU_FSYNC
                 0x20  F2FS_IPU_ASYNC
                 0x40  F2FS_IPU_NOCACHE
                 0x80  F2FS_IPU_HONOR_OPU_WRITE
                 ====  =================

                 Refer segment.h for details.

Thanks,

> Since we use ipu_policy as a bitmap, and the bitmap API parameter is
> unsigned long type data, let's change ipu_policy to unsigned long type.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   Documentation/ABI/testing/sysfs-fs-f2fs |  6 ++++++
>   fs/f2fs/f2fs.h                          |  4 ++--
>   fs/f2fs/segment.h                       |  1 +
>   fs/f2fs/sysfs.c                         | 26 +++++++++++++++++++++++++
>   4 files changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 0f17adc80488..64b15a28fe30 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -722,3 +722,9 @@ What:		/sys/fs/f2fs/<disk>/last_age_weight
>   Date:		January 2023
>   Contact:	"Ping Xiong" <xiongping1@xiaomi.com>
>   Description:	When DATA SEPARATION is on, it controls the weight of last data block age.
> +
> +What:		/sys/fs/f2fs/<disk>/ipu_mode
> +Date:		January 2023
> +Contact:	"Yangtao Li" <frank.li@vivo.com>
> +Description:	Show the current ipu policy as a string.
> +		This is a read-only entry.
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 9edad9ccc2cd..b221a3bdb3fe 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1071,7 +1071,7 @@ struct f2fs_sm_info {
>   
>   	struct list_head sit_entry_set;	/* sit entry set list */
>   
> -	unsigned int ipu_policy;	/* in-place-update policy */
> +	unsigned long ipu_policy;	/* in-place-update policy */
>   	unsigned int min_ipu_util;	/* in-place-update threshold */
>   	unsigned int min_fsync_blocks;	/* threshold for fsync */
>   	unsigned int min_seq_blocks;	/* threshold for sequential blocks */
> @@ -1323,7 +1323,7 @@ enum {
>   	MAX_TIME,
>   };
>   
> -/* Note that you need to keep synchronization with this gc_mode_names array */
> +/* Modification on enum should be synchronized with gc_mode_names array */
>   enum {
>   	GC_NORMAL,
>   	GC_IDLE_CB,
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index d73e988566a5..50c63155ad56 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -672,6 +672,7 @@ static inline int utilization(struct f2fs_sb_info *sbi)
>   
>   #define F2FS_IPU_DISABLE	0
>   
> +/* Modification on enum should be synchronized with ipu_mode_names array */
>   enum {
>   	F2FS_IPU_FORCE,
>   	F2FS_IPU_SSR,
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 576e6416ffb9..aaf5d8650518 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -51,6 +51,17 @@ static const char *gc_mode_names[MAX_GC_MODE] = {
>   	"GC_URGENT_MID"
>   };
>   
> +static const char *ipu_mode_names[F2FS_IPU_MAX] = {
> +	"FORCE",
> +	"SSR",
> +	"UTIL",
> +	"SSR_UTIL",
> +	"FSYNC",
> +	"ASYNC",
> +	"NOCACHE",
> +	"HONOR_OPU_WRITE",
> +};
> +
>   struct f2fs_attr {
>   	struct attribute attr;
>   	ssize_t (*show)(struct f2fs_attr *a, struct f2fs_sb_info *sbi, char *buf);
> @@ -149,6 +160,19 @@ static ssize_t gc_mode_show(struct f2fs_attr *a,
>   	return sysfs_emit(buf, "%s\n", gc_mode_names[sbi->gc_mode]);
>   }
>   
> +static ssize_t ipu_mode_show(struct f2fs_attr *a,
> +		struct f2fs_sb_info *sbi, char *buf)
> +{
> +	int len = 0, i = 0;
> +
> +	if (SM_I(sbi)->ipu_policy == F2FS_IPU_DISABLE)
> +		return sysfs_emit(buf, "DISABLE\n");
> +
> +	for_each_set_bit(i, &SM_I(sbi)->ipu_policy, F2FS_IPU_MAX)
> +		len += scnprintf(buf + len, PAGE_SIZE - len, "%s\n", ipu_mode_names[i]);
> +	return len;
> +}
> +
>   static ssize_t features_show(struct f2fs_attr *a,
>   		struct f2fs_sb_info *sbi, char *buf)
>   {
> @@ -907,6 +931,7 @@ F2FS_GENERAL_RO_ATTR(mounted_time_sec);
>   F2FS_GENERAL_RO_ATTR(main_blkaddr);
>   F2FS_GENERAL_RO_ATTR(pending_discard);
>   F2FS_GENERAL_RO_ATTR(gc_mode);
> +F2FS_GENERAL_RO_ATTR(ipu_mode);
>   #ifdef CONFIG_F2FS_STAT_FS
>   F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_foreground_calls, cp_count);
>   F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_background_calls, bg_cp_count);
> @@ -997,6 +1022,7 @@ static struct attribute *f2fs_attrs[] = {
>   	ATTR_LIST(max_ordered_discard),
>   	ATTR_LIST(pending_discard),
>   	ATTR_LIST(gc_mode),
> +	ATTR_LIST(ipu_mode),
>   	ATTR_LIST(ipu_policy),
>   	ATTR_LIST(min_ipu_util),
>   	ATTR_LIST(min_fsync_blocks),


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
