Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EA0B19B9F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Aug 2025 08:32:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hu42lSKrJI15CsnblnsVKBQ2UtTdKBp3Evyj7wahsEA=; b=HesYIkVVf5/XHry1gKIu4w3kzI
	n+A5dpl/oZHywnVSYQK7tkNGEg8XkOwzE+QDtF1/GmPQPDzHesMJGfN6kOLsPYJg2qgVytbJQFiE2
	wUBre9deD5vnECFD47cKb44wrvXULt3jz7nRHLpNR1ze/CLF8r5tm/5IB7gPA8VNZs4M=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uiok5-0004zL-Sx;
	Mon, 04 Aug 2025 06:32:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uiok4-0004z3-4m
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Aug 2025 06:32:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tV8mvnRoFdzg9WfCRGxrtAtmEkb9OD8jt+HlRZO4KVQ=; b=QUyzMhCo5gwsPhpoz4GKutU6uo
 l2Cfro2I6la+JEV+3tsbunAF1LO0t2zB/X48sgZ1Qcudu2GNZPjnRn1Wpp5IISDJ6OpE2DpFFXZIY
 kUwRqFdElwvWdX+pi9w4xl4/cMjY0mdEnjTBlZJ9zkuwxp1nEbwm9nTwRxY/AtekVyo0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tV8mvnRoFdzg9WfCRGxrtAtmEkb9OD8jt+HlRZO4KVQ=; b=CbqreLwivFiHeSZdcs/YLbfWmY
 20P1ydTmS37m6NTCF6YO3CxHO2UNgV0EnxB0TvJ1qdNv1uOMJCfH8jOXpLJwv85qv4PeR9bbZ22du
 TRyHt4aNzkoOPeAvbfoByIczg5pBsddEk6WFPmIG/WECTRCBTBQMR9oIxf8GovxTCCdo=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uiok4-0000vC-9R for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Aug 2025 06:32:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E840F445D0;
 Mon,  4 Aug 2025 06:32:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C8AAC4CEE7;
 Mon,  4 Aug 2025 06:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754289125;
 bh=j5kuF3O1uzJVXoLJgeS/lJyE6669v13Dm14D4a9vk0c=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=GivFIbK9Gv22nX3PqE8PSrPdNJjfS9tnagsTWgYu2u7vJ38mZGnpMxHXOpzGMaUov
 XLlfdVGsrWspfrSQbh5fCLD35UoTlgCurkJxahsuk0AldXE7r6vD92w1TvWAtl/n+g
 krJ0Q3FfRK5s77Mo14bFvYESHCuKNHON/7gDar90W8cf5RoomsCFdyTld7SlRH+7QZ
 V+z0tqI2+WU5FVuK66RFS7Jj/8LwS4RJItWXA5uj/6+Gbenfrl/O1A9Zx9jbnSwlP5
 /LqtvKF89chfLSmjoK1B5+5eOUFH3XKPG0RJzTTZwdzmd7ZG5dQDCtiIs1HlaXDYVn
 B26CDbwMMffaA==
Message-ID: <c1472e21-64b1-468e-a98c-ed8e0a5ae8b5@kernel.org>
Date: Mon, 4 Aug 2025 14:32:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Lee <chullee@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250804060327.512247-1-chullee@google.com>
Content-Language: en-US
In-Reply-To: <20250804060327.512247-1-chullee@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Daniel, On 8/4/25 14:03, Daniel Lee wrote: > For casefolded
 directories, f2fs may fall back to a linear search if > a hash-based lookup
 fails. This can cause severe performance > regressions. > > While this b
 [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uiok4-0000vC-9R
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: add lookup_mode mount option
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Daniel,

On 8/4/25 14:03, Daniel Lee wrote:
> For casefolded directories, f2fs may fall back to a linear search if
> a hash-based lookup fails. This can cause severe performance
> regressions.
> 
> While this behavior can be controlled by userspace tools (e.g. mkfs,
> fsck) by setting an on-disk flag, a kernel-level solution is needed
> to guarantee the lookup behavior regardless of the on-disk state.
> 
> This commit introduces the 'lookup_mode' mount option to provide this
> kernel-side control.
> 
> The option accepts three values:
> - perf: (Default) Enforces a hash-only lookup. The linear fallback
>   is always disabled.
> - compat: Enables the linear search fallback for compatibility with
>   directory entries from older kernels.
> - auto: Determines the mode based on the on-disk flag, preserving the
>   userspace-based behavior.
> 
> Signed-off-by: Daniel Lee <chullee@google.com>
> ---
>  Documentation/filesystems/f2fs.rst | 19 ++++++++++++++
>  fs/f2fs/dir.c                      | 17 ++++++++++++-
>  fs/f2fs/f2fs.h                     | 41 ++++++++++++++++++++++++++++++
>  fs/f2fs/super.c                    | 20 +++++++++++++++
>  4 files changed, 96 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index 440e4ae74e44..01c657ff7ae2 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -370,6 +370,25 @@ errors=%s		 Specify f2fs behavior on critical errors. This supports modes:
>  			 ====================== =============== =============== ========
>  nat_bits		 Enable nat_bits feature to enhance full/empty nat blocks access,
>  			 by default it's disabled.
> +lookup_mode=%s		 Control the directory lookup behavior for casefolded
> +			 directories. This option has no effect on directories
> +			 that do not have the casefold feature enabled.
> +
> +			 ================== ========================================
> +			 Value		    Description
> +			 ================== ========================================
> +			 perf		    (Default) Enforces a hash-only lookup.
> +					    The linear search fallback is always
> +					    disabled, ignoring the on-disk flag.
> +			 compat		    Enables the linear search fallback for
> +					    compatibility with directory entries
> +					    created by older kernel that used a
> +					    different case-folding algorithm.
> +					    This mode ignores the on-disk flag.
> +			 auto		    F2FS determines the mode based on the
> +					    on-disk `SB_ENC_NO_COMPAT_FALLBACK_FL`
> +					    flag.
> +			 ================== ========================================
>  ======================== ============================================================
>  
>  Debugfs Entries
> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> index c36b3b22bfff..ba032d21a997 100644
> --- a/fs/f2fs/dir.c
> +++ b/fs/f2fs/dir.c
> @@ -16,6 +16,21 @@
>  #include "xattr.h"
>  #include <trace/events/f2fs.h>
>  
> +static inline bool f2fs_should_fallback_to_linear(struct inode *dir)
> +{
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
> +
> +	switch (f2fs_get_lookup_mode(sbi)) {
> +	case LOOKUP_PERF:
> +		return false;
> +	case LOOKUP_COMPAT:
> +		return true;
> +	case LOOKUP_AUTO:
> +		return !sb_no_casefold_compat_fallback(sbi->sb);
> +	}
> +	return false;
> +}
> +
>  #if IS_ENABLED(CONFIG_UNICODE)
>  extern struct kmem_cache *f2fs_cf_name_slab;
>  #endif
> @@ -366,7 +381,7 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
>  
>  out:
>  #if IS_ENABLED(CONFIG_UNICODE)
> -	if (!sb_no_casefold_compat_fallback(dir->i_sb) &&
> +	if (f2fs_should_fallback_to_linear(dir) &&
>  		IS_CASEFOLDED(dir) && !de && use_hash) {
>  		use_hash = false;
>  		goto start_find_entry;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 9333a22b9a01..fed588f4fa3d 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -132,6 +132,12 @@ extern const char *f2fs_fault_name[FAULT_MAX];
>   */
>  #define F2FS_MOUNT_LAZYTIME		0x40000000
>  
> +enum f2fs_lookup_mode {
> +	LOOKUP_PERF,
> +	LOOKUP_COMPAT,
> +	LOOKUP_AUTO,
> +};

We're going to use new mount API, please check last code in dev-test branch,
and it's better to adapt code based on that.

> +
>  #define F2FS_OPTION(sbi)	((sbi)->mount_opt)
>  #define clear_opt(sbi, option)	(F2FS_OPTION(sbi).opt &= ~F2FS_MOUNT_##option)
>  #define set_opt(sbi, option)	(F2FS_OPTION(sbi).opt |= F2FS_MOUNT_##option)
> @@ -1355,6 +1361,8 @@ enum {
>  	SBI_IS_RESIZEFS,			/* resizefs is in process */
>  	SBI_IS_FREEZING,			/* freezefs is in process */
>  	SBI_IS_WRITABLE,			/* remove ro mountoption transiently */
> +	SBI_LOOKUP_COMPAT,			/* enable compat/auto lookup modes */
> +	SBI_LOOKUP_AUTO,			/* enable auto lookup mode */

Could you please add lookup_mode field in struct f2fs_mount_info to record lookup_mode
status like we did for other mount options? IIRC, in f2fs_remount(), we will record
all old mount options in sbi.mount_opt for later recovery if necessary.

>  	MAX_SBI_FLAG,
>  };
>  
> @@ -4897,6 +4905,39 @@ static inline void f2fs_invalidate_internal_cache(struct f2fs_sb_info *sbi,
>  	f2fs_invalidate_compress_pages_range(sbi, blkaddr, len);
>  }
>  
> +/*
> + * The lookup mode is stored in two bits within sbi->s_flag:
> + *
> + * SBI_LOOKUP_COMPAT | SBI_LOOKUP_AUTO | Mode
> + * ------------------|-----------------|--------
> + *          0        |         0       | perf
> + *          1        |         0       | compat
> + *          1        |         1       | auto
> + *
> + */
> +static inline enum f2fs_lookup_mode f2fs_get_lookup_mode(struct f2fs_sb_info *sbi)
> +{
> +	if (!is_sbi_flag_set(sbi, SBI_LOOKUP_COMPAT))
> +		return LOOKUP_PERF;
> +	if (is_sbi_flag_set(sbi, SBI_LOOKUP_AUTO))
> +		return LOOKUP_AUTO;
> +	return LOOKUP_COMPAT;
> +}
> +
> +static inline void f2fs_set_lookup_mode(struct f2fs_sb_info *sbi,
> +						enum f2fs_lookup_mode mode)
> +{
> +	clear_sbi_flag(sbi, SBI_LOOKUP_COMPAT);
> +	clear_sbi_flag(sbi, SBI_LOOKUP_AUTO);
> +
> +	if (mode == LOOKUP_COMPAT)
> +		set_sbi_flag(sbi, SBI_LOOKUP_COMPAT);
> +	else if (mode == LOOKUP_AUTO) {
> +		set_sbi_flag(sbi, SBI_LOOKUP_COMPAT);
> +		set_sbi_flag(sbi, SBI_LOOKUP_AUTO);
> +	}
> +}
> +
>  #define EFSBADCRC	EBADMSG		/* Bad CRC detected */
>  #define EFSCORRUPTED	EUCLEAN		/* Filesystem is corrupted */
>  
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index bbf1dad6843f..09cdd4c22e58 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -196,6 +196,7 @@ enum {
>  	Opt_age_extent_cache,
>  	Opt_errors,
>  	Opt_nat_bits,
> +	Opt_lookup_mode,
>  	Opt_err,
>  };
>  
> @@ -276,6 +277,7 @@ static match_table_t f2fs_tokens = {
>  	{Opt_age_extent_cache, "age_extent_cache"},
>  	{Opt_errors, "errors=%s"},
>  	{Opt_nat_bits, "nat_bits"},
> +	{Opt_lookup_mode, "lookup_mode=%s"},
>  	{Opt_err, NULL},
>  };
>  
> @@ -1317,6 +1319,22 @@ static int parse_options(struct f2fs_sb_info *sbi, char *options, bool is_remoun
>  		case Opt_nat_bits:
>  			set_opt(sbi, NAT_BITS);
>  			break;
> +		case Opt_lookup_mode:
> +			name = match_strdup(&args[0]);
> +			if (!name)
> +				return -ENOMEM;
> +			if (!strcmp(name, "perf")) {
> +				f2fs_set_lookup_mode(sbi, LOOKUP_PERF);
> +			} else if (!strcmp(name, "compat")) {
> +				f2fs_set_lookup_mode(sbi, LOOKUP_COMPAT);
> +			} else if (!strcmp(name, "auto")) {
> +				f2fs_set_lookup_mode(sbi, LOOKUP_AUTO);
> +			} else {
> +				kfree(name);
> +				return -EINVAL;
> +			}
> +			kfree(name);
> +			break;
>  		default:
>  			f2fs_err(sbi, "Unrecognized mount option \"%s\" or missing value",
>  				 p);
> @@ -2220,6 +2238,8 @@ static void default_options(struct f2fs_sb_info *sbi, bool remount)
>  #endif
>  
>  	f2fs_build_fault_attr(sbi, 0, 0, FAULT_ALL);
> +
> +	f2fs_set_lookup_mode(sbi, LOOKUP_PERF);

I guess we need to change f2fs_show_options() as well, right?

Thanks,

>  }
>  
>  #ifdef CONFIG_QUOTA



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
