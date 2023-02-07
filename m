Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F68768E08E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Feb 2023 19:51:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pPT3S-0001w2-1N;
	Tue, 07 Feb 2023 18:50:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pPT3P-0001vs-TY
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Feb 2023 18:50:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZQDImQfi5QTzfmmrK7z+4AdCc66rYAZvvHv2Xb9LUHQ=; b=kLFNJWrQnehDScJccZFE8X8ipE
 M5OTyCHi/KoJTl+XsUPyA/4co7YqqSDrhkAQ5Vujrr7FycgqCKAvL94fLz/mNJt0BNE0zERIwkJpA
 wfQ1mk7SFALauqGO7mSc1NW9Y/ohCpHqQsm2cpdE7jvPTSugwa8YR5MoRiZis2KQWIAQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZQDImQfi5QTzfmmrK7z+4AdCc66rYAZvvHv2Xb9LUHQ=; b=Cy6fmoJ4whOeP3hFimFD1oGMOo
 2NZ29IYYmCSMZuuaNoOiNm1If1WQy6quseHJVaDLyc4kDpnKd+j27CsAhBtwCOFs6Dbw8uM6cxGLq
 XLt47ICr2BoX+VodyOi4rxXqLkxGG9d9NG3TqJTFQE4nS6mecTIolVBF/zSZKqLHe+Es=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pPT3M-00055l-W0 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Feb 2023 18:50:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5C9C860F98;
 Tue,  7 Feb 2023 18:50:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ED6EC433D2;
 Tue,  7 Feb 2023 18:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675795847;
 bh=whAMKutKdWNSLqWJkr0gpWWdShFqVu3W6CJ6+y2xTAw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DCv7eUm8BxTMs9bMdUFM7LzTmWdMf24VmaVMOkNpIIjA3eg7VTsJ/7lLfLsPCbge+
 5gtesn0TS5eKfID5QIV3G87APRIz8QhMAGP06ZbCT9sxyeGlX52prCf9lwRsRHRSBN
 gmv8XFr4juG9zhJvyfLrParuotjltgXO/FyJCT+68FPYPSYsaua1IkjHhQrcWIoCQe
 l1H60mcEJ/cR1otKblOiQj0YW49X/Wt9aCHL8YKizYtfrLpa0O41PBVzN0hPHdwb3y
 g9TcT3/VjmvUJqkG3t5w3YHtgnSX7Sop6T5slcHCp8tjxouTg/Sin18YfVilIxhuUL
 Yv+/XhzM90pUA==
Date: Tue, 7 Feb 2023 10:50:46 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <Y+Kdhh6b1TAl0ntT@google.com>
References: <20230206144310.2344-1-frank.li@vivo.com>
 <20230206144310.2344-3-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230206144310.2344-3-frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 02/06, Yangtao Li wrote: > Add a ipu_mode sysfs node to
 show the current ipu policy as a string > for readability, like we do in
 commit a3951cd199a5 ("f2fs: introduce > gc_mode sysfs node"). > > Si [...]
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pPT3M-00055l-W0
Subject: Re: [f2fs-dev] [PATCH v4 3/3] f2fs: introduce ipu_mode sysfs node
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

On 02/06, Yangtao Li wrote:
> Add a ipu_mode sysfs node to show the current ipu policy as a string
> for readability, like we do in commit a3951cd199a5 ("f2fs: introduce
> gc_mode sysfs node").
> 
> Since we use ipu_policy as a bitmap, and the bitmap API parameter is
> unsigned long type data, let's change ipu_policy to unsigned long type.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> v4:
> -rebase, no code change
>  Documentation/ABI/testing/sysfs-fs-f2fs |  6 ++++++
>  fs/f2fs/f2fs.h                          |  4 ++--
>  fs/f2fs/segment.h                       |  1 +
>  fs/f2fs/sysfs.c                         | 28 ++++++++++++++++++++++++-
>  4 files changed, 36 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 94132745ecbe..b2d8c1e84073 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -729,3 +729,9 @@ What:		/sys/fs/f2fs/<disk>/last_age_weight
>  Date:		January 2023
>  Contact:	"Ping Xiong" <xiongping1@xiaomi.com>
>  Description:	When DATA SEPARATION is on, it controls the weight of last data block age.
> +
> +What:		/sys/fs/f2fs/<disk>/ipu_mode
> +Date:		February 2023
> +Contact:	"Yangtao Li" <frank.li@vivo.com>
> +Description:	Show the current ipu policy as a string.
> +		This is a read-only entry.
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 44f2d76525bf..b699ed74f438 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1070,7 +1070,7 @@ struct f2fs_sm_info {
>  
>  	struct list_head sit_entry_set;	/* sit entry set list */
>  
> -	unsigned int ipu_policy;	/* in-place-update policy */
> +	unsigned long ipu_policy;	/* in-place-update policy */
>  	unsigned int min_ipu_util;	/* in-place-update threshold */
>  	unsigned int min_fsync_blocks;	/* threshold for fsync */
>  	unsigned int min_seq_blocks;	/* threshold for sequential blocks */
> @@ -1322,7 +1322,7 @@ enum {
>  	MAX_TIME,
>  };
>  
> -/* Note that you need to keep synchronization with this gc_mode_names array */
> +/* Modification on enum should be synchronized with gc_mode_names array */
>  enum {
>  	GC_NORMAL,
>  	GC_IDLE_CB,
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 8ee5e5db9287..92c8be00d396 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -672,6 +672,7 @@ static inline int utilization(struct f2fs_sb_info *sbi)
>  
>  #define F2FS_IPU_DISABLE	0
>  
> +/* Modification on enum should be synchronized with ipu_mode_names array */
>  enum {
>  	F2FS_IPU_FORCE,
>  	F2FS_IPU_SSR,
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 3c3dae3ce84e..4a2d895cd52c 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -51,6 +51,17 @@ static const char *gc_mode_names[MAX_GC_MODE] = {
>  	"GC_URGENT_MID"
>  };
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
>  struct f2fs_attr {
>  	struct attribute attr;
>  	ssize_t (*show)(struct f2fs_attr *a, struct f2fs_sb_info *sbi, char *buf);
> @@ -149,6 +160,19 @@ static ssize_t gc_mode_show(struct f2fs_attr *a,
>  	return sysfs_emit(buf, "%s\n", gc_mode_names[sbi->gc_mode]);
>  }
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

I believe this would not be a good usecase for the sysfs entry. How about
putting the info in debugfs?

> +	return len;
> +}
> +
>  static ssize_t features_show(struct f2fs_attr *a,
>  		struct f2fs_sb_info *sbi, char *buf)
>  {
> @@ -711,7 +735,7 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>  			return -EINVAL;
>  		if (t && f2fs_lfs_mode(sbi))
>  			return -EINVAL;
> -		SM_I(sbi)->ipu_policy = (unsigned int)t;
> +		SM_I(sbi)->ipu_policy = t;
>  		return count;
>  	}
>  
> @@ -907,6 +931,7 @@ F2FS_GENERAL_RO_ATTR(mounted_time_sec);
>  F2FS_GENERAL_RO_ATTR(main_blkaddr);
>  F2FS_GENERAL_RO_ATTR(pending_discard);
>  F2FS_GENERAL_RO_ATTR(gc_mode);
> +F2FS_GENERAL_RO_ATTR(ipu_mode);
>  #ifdef CONFIG_F2FS_STAT_FS
>  F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_foreground_calls, cp_count);
>  F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_background_calls, bg_cp_count);
> @@ -997,6 +1022,7 @@ static struct attribute *f2fs_attrs[] = {
>  	ATTR_LIST(max_ordered_discard),
>  	ATTR_LIST(pending_discard),
>  	ATTR_LIST(gc_mode),
> +	ATTR_LIST(ipu_mode),
>  	ATTR_LIST(ipu_policy),
>  	ATTR_LIST(min_ipu_util),
>  	ATTR_LIST(min_fsync_blocks),
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
