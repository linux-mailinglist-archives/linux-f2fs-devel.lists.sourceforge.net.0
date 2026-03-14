Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aO2XK7futGm/uQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Mar 2026 06:14:31 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D704228BBBB
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Mar 2026 06:14:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+pvioMlDg0wb3ULKK8IVgVBfZD175kzC2ScLCHfuvuU=; b=N+13JjQ1MKEcP61oOb31pQ1RwT
	rdfjazE2loCK2kiUM0SLZZYIG4tOLML2XB2vAANSvcHF1jzMxavOuaHl2Dmb2o5kbZkw9j4eIgYNv
	XBm5aoXYpCX4sp25CJRylrK4x3qJyBGjTAYM5nP6SDWeXwz2ff77Fu+VMN8OTUSYFcmc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w1HKO-0008BS-HN;
	Sat, 14 Mar 2026 05:14:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w1HKM-0008BC-Qk
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Mar 2026 05:14:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Po3MFs90P9c5yASJEh8qdD1dWpkS5Qz99MdrcRIH12o=; b=fC8ITOq6WEn1+ThITx8unopJTs
 hO9iHvRYol5OUKYqj9Koi/BToB37ivW6C62GI7USVioBIWEy1gTWIpUbiJsnIS0X5RB+nDur2LWq1
 zHeAX5W1u7Dc6UoBUfmgion1q5SQp7LAmh6f4wYQiWIWVzs4qp465aPM1QZGHoTQN5g4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Po3MFs90P9c5yASJEh8qdD1dWpkS5Qz99MdrcRIH12o=; b=Xqw4Yd9LygYxtBzEPr76SwQ+HN
 GoeoP1K831h8ZhwzlNryT1eA72LSV0nhS4GlLKGY8Tv0foJEobxtZ4UFr4MxjneSteeink+jJ+9qR
 UPszCRolxtbzY4cu7toRo43hPpQSykG1vnIGW7soI1eICgJisQeeCYf7PfKnyUfcv9jE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w1HKM-0006xS-4G for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Mar 2026 05:14:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 90A3042AC8;
 Sat, 14 Mar 2026 05:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40553C116C6;
 Sat, 14 Mar 2026 05:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773465252;
 bh=5cuoiJFh054oZmahtH93aR6KjeqO2fB4Vi01T90nfcQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=fTM4RtaPvTEglugId0BYoSi7STUOhW1X4DmL9FO5Zlo7KWuix42Ectkcc++rMY65p
 q3e9t3YPURYEBqz7moyTDc+4R6ts24LAUvX5k0zspZJq+tGTFFbyKpintw26clCcRK
 cuD0DB0hpUoBKDlaOaTzUGe9U9gJzSu4e4K2bw7Miv7QwR9mvgsoHf9+sDlDsA5njX
 B1muFDrSGAMqP9y2KRSyMtTlTe0S1AiHV3olKPPr2pQjCEUrai0uU8I1LcNBZr4R15
 raKYVYIQOfN9YmAsjgRzJ2xTec3PZGRsD+V4cNW8ImoNSc1II0Xpy0WgLb2zIt1EMQ
 kgDrgbFA4blKA==
Message-ID: <76d4e46c-5c34-4dc4-8aa4-1efbcbe1415f@kernel.org>
Date: Sat, 14 Mar 2026 13:14:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: 'wallentx <william.allentx@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <20260309103700.489932-1-william.allentx@gmail.com>
 <20260309103700.489932-4-william.allentx@gmail.com>
Content-Language: en-US
In-Reply-To: <20260309103700.489932-4-william.allentx@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/3/9 18:37,
 'wallentx wrote: > From: wallentx <william.allentx@gmail.com>
 > > When CONFIG_F2FS_CHECK_FS=y,
 zoned shared-SIT mode still keeps > per-segment
 cur_valid_map_mir together with auxili [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w1HKM-0006xS-4G
Subject: Re: [f2fs-dev] [RFC PATCH 3/3] f2fs: add mount option to disable
 shared SIT mirror checks
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:william.allentx@gmail.com,m:linux-f2fs-devel@lists.sourceforge.net,m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:williamallentx@gmail.com,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Queue-Id: D704228BBBB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026/3/9 18:37, 'wallentx wrote:
> From: wallentx <william.allentx@gmail.com>
> 
> When CONFIG_F2FS_CHECK_FS=y, zoned shared-SIT mode still keeps
> per-segment cur_valid_map_mir together with auxiliary SIT mirror state
> for runtime consistency checks. After shared SIT maps are introduced,
> that mirror path becomes the next major static memory cost on large
> zoned systems.
> 
> Add shared_sit_check/noshared_sit_check to control that extra mirror
> tracking explicitly. Keep shared_sit_check as the default, limit the
> option to zoned shared-SIT mounts, and reject changing it by remount
> because the mirror state is built at mount time.
> 
> With noshared_sit_check, shared-SIT mode skips cur_valid_map_mir,
> sit_bitmap_mir, and invalid_segmap allocation and their associated
> check paths. This does not disable all CONFIG_F2FS_CHECK_FS behavior; it
> only disables the extra shared-SIT mirror tracking.
> 
> On the same 43-volume HM-SMR test system (~550 TB total) with
> CONFIG_F2FS_CHECK_FS=y, shared SIT with the default mirror path enabled
> reported 27.70 GiB of static F2FS memory. Mounting with
> noshared_sit_check reduced that to 12.10 GiB.

Jaegeuk and me think that we can drop sit bitmap and version bitmap
sanity check, since we haven't got any report for almost a decade.

So how about dropping the bitmaps w/ two separated patch?

Thanks,

> 
> Signed-off-by: wallentx <william.allentx@gmail.com>
> ---
>   Documentation/filesystems/f2fs.rst |  11 ++
>   fs/f2fs/debug.c                    |   7 +-
>   fs/f2fs/f2fs.h                     |  16 +++
>   fs/f2fs/gc.c                       |  29 ++--
>   fs/f2fs/segment.c                  | 213 ++++++++++++++++-------------
>   fs/f2fs/segment.h                  |  28 ++--
>   fs/f2fs/super.c                    |  21 +++
>   7 files changed, 204 insertions(+), 121 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index 7e4031631286..3ca191f92309 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -363,6 +363,17 @@ memory=%s		 Control memory mode. This supports "normal" and "low" modes.
>   			 Because of the nature of low memory devices, in this mode, f2fs
>   			 will try to save memory sometimes by sacrificing performance.
>   			 "normal" mode is the default mode and same as before.
> +shared_sit_check/
> +noshared_sit_check	 Enable or disable extra SIT mirror consistency checks in
> +			 zoned shared-SIT mode. This only affects zoned devices
> +			 mounted with ``mode=lfs``, where shared SIT valid maps are
> +			 used. ``shared_sit_check`` is enabled by default. Setting
> +			 ``noshared_sit_check`` reduces memory usage when the kernel
> +			 is built with ``CONFIG_F2FS_CHECK_FS=y`` by skipping the
> +			 per-segment SIT mirror tracking. This option has no effect
> +			 when shared SIT maps are not in use and cannot be changed
> +			 by remount. To use a different setting, unmount and
> +			 mount again with the new option.
>   age_extent_cache	 Enable an age extent cache based on rb-tree. It records
>   			 data block update frequency of the extent per inode, in
>   			 order to provide better temperature hints for data block
> diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
> index d8bfdac5c1e4..ed6e03b42836 100644
> --- a/fs/f2fs/debug.c
> +++ b/fs/f2fs/debug.c
> @@ -325,9 +325,10 @@ static void update_mem_info(struct f2fs_sb_info *sbi)
>   		si->base_mem += SIT_VBLOCK_MAP_SIZE * 2;
>   		/* Approximate private bitmaps for active logs */
>   		si->base_mem += SIT_VBLOCK_MAP_SIZE * NR_CURSEG_TYPE;
> -#ifdef CONFIG_F2FS_CHECK_FS
> -		si->base_mem += SIT_VBLOCK_MAP_SIZE * MAIN_SEGS(sbi);
> -#endif
> +	#ifdef CONFIG_F2FS_CHECK_FS
> +			if (f2fs_sit_check_enabled(sbi))
> +				si->base_mem += SIT_VBLOCK_MAP_SIZE * MAIN_SEGS(sbi);
> +	#endif
>   		if (f2fs_block_unit_discard(sbi))
>   			si->base_mem += SIT_VBLOCK_MAP_SIZE * MAIN_SEGS(sbi);
>   	} else {
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 11f3601ffd34..d8526103d86a 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -130,6 +130,7 @@ enum f2fs_mount_opt {
>   	F2FS_MOUNT_COMPRESS_CACHE,
>   	F2FS_MOUNT_AGE_EXTENT_CACHE,
>   	F2FS_MOUNT_NAT_BITS,
> +	F2FS_MOUNT_SHARED_SIT_CHECK,
>   	F2FS_MOUNT_INLINECRYPT,
>   	/*
>   	 * Some f2fs environments expect to be able to pass the "lazytime" option
> @@ -4920,6 +4921,21 @@ static inline bool f2fs_use_shared_sit_map(struct f2fs_sb_info *sbi)
>   	return f2fs_sb_has_blkzoned(sbi) && f2fs_lfs_mode(sbi);
>   }
>   
> +/*
> + * shared_sit_check is a mount-time escape hatch for the extra SIT mirror
> + * tracking kept by CONFIG_F2FS_CHECK_FS in zoned shared-SIT mode.
> + */
> +static inline bool f2fs_sit_check_enabled(struct f2fs_sb_info *sbi)
> +{
> +	if (!IS_ENABLED(CONFIG_F2FS_CHECK_FS))
> +		return false;
> +
> +	if (!f2fs_use_shared_sit_map(sbi))
> +		return true;
> +
> +	return test_opt(sbi, SHARED_SIT_CHECK);
> +}
> +
>   static inline bool f2fs_is_sequential_zone_area(struct f2fs_sb_info *sbi,
>   					  block_t blkaddr)
>   {
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 80b8500fa987..1decb0caea1b 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -877,15 +877,16 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
>   		p.offset = segno + p.ofs_unit;
>   		nsearched++;
>   
> -#ifdef CONFIG_F2FS_CHECK_FS
> -		/*
> -		 * skip selecting the invalid segno (that is failed due to block
> -		 * validity check failure during GC) to avoid endless GC loop in
> -		 * such cases.
> -		 */
> -		if (test_bit(segno, sm->invalid_segmap))
> -			goto next;
> -#endif
> +	#ifdef CONFIG_F2FS_CHECK_FS
> +			/*
> +			 * skip selecting the invalid segno (that is failed due to block
> +			 * validity check failure during GC) to avoid endless GC loop in
> +			 * such cases.
> +			 */
> +			if (f2fs_sit_check_enabled(sbi) &&
> +			    test_bit(segno, sm->invalid_segmap))
> +				goto next;
> +	#endif
>   
>   		secno = GET_SEC_FROM_SEG(sbi, segno);
>   
> @@ -1197,18 +1198,20 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
>   	f2fs_folio_put(node_folio, true);
>   
>   	if (source_blkaddr != blkaddr) {
> -#ifdef CONFIG_F2FS_CHECK_FS
> +	#ifdef CONFIG_F2FS_CHECK_FS
>   		unsigned int segno = GET_SEGNO(sbi, blkaddr);
>   		unsigned long offset = GET_BLKOFF_FROM_SEG0(sbi, blkaddr);
>   
> -		if (unlikely(check_valid_map(sbi, segno, offset))) {
> +		if (f2fs_sit_check_enabled(sbi) &&
> +		    unlikely(check_valid_map(sbi, segno, offset))) {
>   			if (!test_and_set_bit(segno, SIT_I(sbi)->invalid_segmap)) {
> -				f2fs_err(sbi, "mismatched blkaddr %u (source_blkaddr %u) in seg %u",
> +				f2fs_err(sbi,
> +					 "mismatched blkaddr %u (source_blkaddr %u) in seg %u",
>   					 blkaddr, source_blkaddr, segno);
>   				set_sbi_flag(sbi, SBI_NEED_FSCK);
>   			}
>   		}
> -#endif
> +	#endif
>   		return false;
>   	}
>   	return true;
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 0dab6b16ba56..dce66eec2a5f 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -38,6 +38,11 @@ struct f2fs_sit_bitmap {
>   	unsigned char map[SIT_VBLOCK_MAP_SIZE];
>   };
>   
> +static inline struct f2fs_sit_bitmap *f2fs_sit_bitmap_from_map(void *map)
> +{
> +	return container_of(map, struct f2fs_sit_bitmap, map);
> +}
> +
>   static void f2fs_free_sit_bitmap_rcu(struct rcu_head *rcu)
>   {
>   	struct f2fs_sit_bitmap *b = container_of(rcu, struct f2fs_sit_bitmap, rcu);
> @@ -45,11 +50,6 @@ static void f2fs_free_sit_bitmap_rcu(struct rcu_head *rcu)
>   	kmem_cache_free(sit_bitmap_slab, b);
>   }
>   
> -static struct f2fs_sit_bitmap *f2fs_sit_bitmap_from_map(void *map)
> -{
> -	return container_of(map, struct f2fs_sit_bitmap, map);
> -}
> -
>   static unsigned long __reverse_ulong(unsigned char *str)
>   {
>   	unsigned long tmp = 0;
> @@ -845,9 +845,10 @@ static void __remove_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
>   		if (valid_blocks == 0) {
>   			clear_bit(GET_SEC_FROM_SEG(sbi, segno),
>   						dirty_i->victim_secmap);
> -#ifdef CONFIG_F2FS_CHECK_FS
> -			clear_bit(segno, SIT_I(sbi)->invalid_segmap);
> -#endif
> +	#ifdef CONFIG_F2FS_CHECK_FS
> +			if (f2fs_sit_check_enabled(sbi))
> +				clear_bit(segno, SIT_I(sbi)->invalid_segmap);
> +	#endif
>   		}
>   		if (__is_large_section(sbi)) {
>   			unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
> @@ -2471,9 +2472,10 @@ static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_ent
>   			memset(b->map, 0xff, SIT_VBLOCK_MAP_SIZE);
>   			rcu_assign_pointer(se->cur_valid_map, b->map);
>   			se->ckpt_valid_map = b->map;
> -#ifdef CONFIG_F2FS_CHECK_FS
> -			memcpy(se->cur_valid_map_mir, b->map, SIT_VBLOCK_MAP_SIZE);
> -#endif
> +	#ifdef CONFIG_F2FS_CHECK_FS
> +			if (f2fs_sit_check_enabled(sbi))
> +				memcpy(se->cur_valid_map_mir, b->map, SIT_VBLOCK_MAP_SIZE);
> +	#endif
>   		} else if (se->cur_valid_map == sit_i->bitmap_zero) {
>   			/* Should not happen, freeing empty segment */
>   			struct f2fs_sit_bitmap *b = f2fs_kmem_cache_alloc(sit_bitmap_slab,
> @@ -2481,23 +2483,27 @@ static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_ent
>   			memset(b->map, 0, SIT_VBLOCK_MAP_SIZE);
>   			rcu_assign_pointer(se->cur_valid_map, b->map);
>   			se->ckpt_valid_map = b->map;
> -#ifdef CONFIG_F2FS_CHECK_FS
> -			memcpy(se->cur_valid_map_mir, b->map, SIT_VBLOCK_MAP_SIZE);
> -#endif
> +	#ifdef CONFIG_F2FS_CHECK_FS
> +			if (f2fs_sit_check_enabled(sbi))
> +				memcpy(se->cur_valid_map_mir, b->map, SIT_VBLOCK_MAP_SIZE);
> +	#endif
>   		}
>   	}
>   
>   	for (i = 0; i < del_count; i++) {
>   		exist = f2fs_test_and_clear_bit(offset + i, se->cur_valid_map);
> -#ifdef CONFIG_F2FS_CHECK_FS
> -		mir_exist = f2fs_test_and_clear_bit(offset + i,
> -						se->cur_valid_map_mir);
> -		if (unlikely(exist != mir_exist)) {
> -			f2fs_err(sbi, "Inconsistent error when clearing bitmap, blk:%u, old bit:%d",
> -				blkaddr + i, exist);
> -			f2fs_bug_on(sbi, 1);
> -		}
> -#endif
> +	#ifdef CONFIG_F2FS_CHECK_FS
> +			if (f2fs_sit_check_enabled(sbi)) {
> +				mir_exist = f2fs_test_and_clear_bit(offset + i,
> +								    se->cur_valid_map_mir);
> +				if (unlikely(exist != mir_exist)) {
> +					f2fs_err(sbi,
> +						 "Inconsistent error when clearing bitmap, blk:%u, old bit:%d",
> +						 blkaddr + i, exist);
> +					f2fs_bug_on(sbi, 1);
> +				}
> +			}
> +	#endif
>   		if (unlikely(!exist)) {
>   			f2fs_err(sbi, "Bitmap was wrongly cleared, blk:%u", blkaddr + i);
>   			f2fs_bug_on(sbi, 1);
> @@ -2559,9 +2565,10 @@ static int update_sit_entry_for_alloc(struct f2fs_sb_info *sbi, struct seg_entry
>   			memset(b->map, 0, SIT_VBLOCK_MAP_SIZE);
>   			rcu_assign_pointer(se->cur_valid_map, b->map);
>   			se->ckpt_valid_map = b->map;
> -#ifdef CONFIG_F2FS_CHECK_FS
> -			memcpy(se->cur_valid_map_mir, b->map, SIT_VBLOCK_MAP_SIZE);
> -#endif
> +	#ifdef CONFIG_F2FS_CHECK_FS
> +			if (f2fs_sit_check_enabled(sbi))
> +				memcpy(se->cur_valid_map_mir, b->map, SIT_VBLOCK_MAP_SIZE);
> +	#endif
>   		} else if (se->cur_valid_map == sit_i->bitmap_full) {
>   			/* Should not happen in LFS alloc, but for safety */
>   			struct f2fs_sit_bitmap *b = f2fs_kmem_cache_alloc(sit_bitmap_slab,
> @@ -2569,22 +2576,26 @@ static int update_sit_entry_for_alloc(struct f2fs_sb_info *sbi, struct seg_entry
>   			memset(b->map, 0xff, SIT_VBLOCK_MAP_SIZE);
>   			rcu_assign_pointer(se->cur_valid_map, b->map);
>   			se->ckpt_valid_map = b->map;
> -#ifdef CONFIG_F2FS_CHECK_FS
> -			memcpy(se->cur_valid_map_mir, b->map, SIT_VBLOCK_MAP_SIZE);
> -#endif
> +	#ifdef CONFIG_F2FS_CHECK_FS
> +			if (f2fs_sit_check_enabled(sbi))
> +				memcpy(se->cur_valid_map_mir, b->map, SIT_VBLOCK_MAP_SIZE);
> +	#endif
>   		}
>   	}
>   
>   	exist = f2fs_test_and_set_bit(offset, se->cur_valid_map);
> -#ifdef CONFIG_F2FS_CHECK_FS
> -	mir_exist = f2fs_test_and_set_bit(offset,
> -					se->cur_valid_map_mir);
> -	if (unlikely(exist != mir_exist)) {
> -		f2fs_err(sbi, "Inconsistent error when setting bitmap, blk:%u, old bit:%d",
> -			blkaddr, exist);
> -		f2fs_bug_on(sbi, 1);
> +	#ifdef CONFIG_F2FS_CHECK_FS
> +	if (f2fs_sit_check_enabled(sbi)) {
> +		mir_exist = f2fs_test_and_set_bit(offset,
> +						  se->cur_valid_map_mir);
> +		if (unlikely(exist != mir_exist)) {
> +			f2fs_err(sbi,
> +				 "Inconsistent error when setting bitmap, blk:%u, old bit:%d",
> +				 blkaddr, exist);
> +			f2fs_bug_on(sbi, 1);
> +		}
>   	}
> -#endif
> +	#endif
>   	if (unlikely(exist)) {
>   		f2fs_err(sbi, "Bitmap was wrongly set, blk:%u", blkaddr);
>   		f2fs_bug_on(sbi, 1);
> @@ -2677,13 +2688,15 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
>   
>   			rcu_assign_pointer(se->cur_valid_map, sit_i->bitmap_zero);
>   			se->ckpt_valid_map = sit_i->bitmap_zero;
> -#ifdef CONFIG_F2FS_CHECK_FS
> -			memset(se->cur_valid_map_mir, 0, SIT_VBLOCK_MAP_SIZE);
> -#endif
> +	#ifdef CONFIG_F2FS_CHECK_FS
> +			if (f2fs_sit_check_enabled(sbi))
> +				memset(se->cur_valid_map_mir, 0, SIT_VBLOCK_MAP_SIZE);
> +	#endif
>   			if (old_map != sit_i->bitmap_zero &&
>   			    old_map != sit_i->bitmap_full) {
> -				call_rcu(&f2fs_sit_bitmap_from_map(old_map)->rcu,
> -					 f2fs_free_sit_bitmap_rcu);
> +				struct f2fs_sit_bitmap *b =
> +					f2fs_sit_bitmap_from_map(old_map);
> +				call_rcu(&b->rcu, f2fs_free_sit_bitmap_rcu);
>   			}
>   		} else if (new_vblocks == BLKS_PER_SEG(sbi) &&
>   				se->cur_valid_map != sit_i->bitmap_full) {
> @@ -2691,13 +2704,15 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
>   
>   			rcu_assign_pointer(se->cur_valid_map, sit_i->bitmap_full);
>   			se->ckpt_valid_map = sit_i->bitmap_full;
> -#ifdef CONFIG_F2FS_CHECK_FS
> -			memset(se->cur_valid_map_mir, 0xff, SIT_VBLOCK_MAP_SIZE);
> -#endif
> +	#ifdef CONFIG_F2FS_CHECK_FS
> +			if (f2fs_sit_check_enabled(sbi))
> +				memset(se->cur_valid_map_mir, 0xff, SIT_VBLOCK_MAP_SIZE);
> +	#endif
>   			if (old_map != sit_i->bitmap_zero &&
>   			    old_map != sit_i->bitmap_full) {
> -				call_rcu(&f2fs_sit_bitmap_from_map(old_map)->rcu,
> -					 f2fs_free_sit_bitmap_rcu);
> +				struct f2fs_sit_bitmap *b =
> +					f2fs_sit_bitmap_from_map(old_map);
> +				call_rcu(&b->rcu, f2fs_free_sit_bitmap_rcu);
>   			}
>   		}
>   	}
> @@ -4701,7 +4716,7 @@ static struct folio *get_next_sit_folio(struct f2fs_sb_info *sbi,
>   	seg_info_to_sit_folio(sbi, folio, start);
>   
>   	folio_mark_dirty(folio);
> -	set_to_next_sit(sit_i, start);
> +				set_to_next_sit(sbi, sit_i, start);
>   
>   	return folio;
>   }
> @@ -4857,11 +4872,12 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>   			int offset, sit_offset;
>   
>   			se = get_seg_entry(sbi, segno);
> -#ifdef CONFIG_F2FS_CHECK_FS
> -			if (memcmp(se->cur_valid_map, se->cur_valid_map_mir,
> -						SIT_VBLOCK_MAP_SIZE))
> +	#ifdef CONFIG_F2FS_CHECK_FS
> +			if (f2fs_sit_check_enabled(sbi) &&
> +			    memcmp(se->cur_valid_map, se->cur_valid_map_mir,
> +				   SIT_VBLOCK_MAP_SIZE))
>   				f2fs_bug_on(sbi, 1);
> -#endif
> +	#endif
>   
>   			/* add discard candidates */
>   			if (!(cpc->reason & CP_DISCARD)) {
> @@ -4953,11 +4969,8 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
>   	if (!sit_i->dirty_sentries_bitmap)
>   		return -ENOMEM;
>   
> -#ifdef CONFIG_F2FS_CHECK_FS
> -	bitmap_size = MAIN_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE * (3 + discard_map);
> -#else
> -	bitmap_size = MAIN_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE * (2 + discard_map);
> -#endif
> +	bitmap_size = MAIN_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE *
> +			(2 + discard_map + f2fs_sit_check_enabled(sbi));
>   
>   	if (share_map) {
>   		sit_i->bitmap_zero = f2fs_kzalloc(sbi, SIT_VBLOCK_MAP_SIZE, GFP_KERNEL);
> @@ -4971,10 +4984,9 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
>   		}
>   		memset(sit_i->bitmap_full, 0xff, SIT_VBLOCK_MAP_SIZE);
>   
> -		bitmap_size = MAIN_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE * discard_map;
> -#ifdef CONFIG_F2FS_CHECK_FS
> -		bitmap_size += MAIN_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE;
> -#endif
> +			bitmap_size = MAIN_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE * discard_map;
> +			if (f2fs_sit_check_enabled(sbi))
> +				bitmap_size += MAIN_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE;
>   		if (bitmap_size) {
>   			sit_i->bitmap = f2fs_kvzalloc(sbi, bitmap_size, GFP_KERNEL);
>   			if (!sit_i->bitmap) {
> @@ -4993,9 +5005,10 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
>   			sit_i->sentries[start].ckpt_valid_map =
>   						sit_i->bitmap_zero;
>   #ifdef CONFIG_F2FS_CHECK_FS
> -			sit_i->sentries[start].cur_valid_map_mir =
> -						bitmap;
> -			bitmap += SIT_VBLOCK_MAP_SIZE;
> +			if (f2fs_sit_check_enabled(sbi)) {
> +				sit_i->sentries[start].cur_valid_map_mir = bitmap;
> +				bitmap += SIT_VBLOCK_MAP_SIZE;
> +			}
>   #endif
>   			if (discard_map) {
>   				sit_i->sentries[start].discard_map = bitmap;
> @@ -5017,8 +5030,10 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
>   			bitmap += SIT_VBLOCK_MAP_SIZE;
>   
>   #ifdef CONFIG_F2FS_CHECK_FS
> -			sit_i->sentries[start].cur_valid_map_mir = bitmap;
> -			bitmap += SIT_VBLOCK_MAP_SIZE;
> +			if (f2fs_sit_check_enabled(sbi)) {
> +				sit_i->sentries[start].cur_valid_map_mir = bitmap;
> +				bitmap += SIT_VBLOCK_MAP_SIZE;
> +			}
>   #endif
>   
>   			if (discard_map) {
> @@ -5052,16 +5067,20 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
>   	if (!sit_i->sit_bitmap)
>   		return -ENOMEM;
>   
> -#ifdef CONFIG_F2FS_CHECK_FS
> -	sit_i->sit_bitmap_mir = kmemdup(src_bitmap,
> -					sit_bitmap_size, GFP_KERNEL);
> -	if (!sit_i->sit_bitmap_mir)
> -		return -ENOMEM;
> +	#ifdef CONFIG_F2FS_CHECK_FS
> +	if (f2fs_sit_check_enabled(sbi)) {
> +		sit_i->sit_bitmap_mir = kmemdup(src_bitmap,
> +						sit_bitmap_size,
> +						GFP_KERNEL);
> +		if (!sit_i->sit_bitmap_mir)
> +			return -ENOMEM;
>   
> -	sit_i->invalid_segmap = f2fs_kvzalloc(sbi,
> -					main_bitmap_size, GFP_KERNEL);
> -	if (!sit_i->invalid_segmap)
> -		return -ENOMEM;
> +		sit_i->invalid_segmap = f2fs_kvzalloc(sbi,
> +						      main_bitmap_size,
> +						      GFP_KERNEL);
> +		if (!sit_i->invalid_segmap)
> +			return -ENOMEM;
> +	}
>   #endif
>   
>   	sit_i->sit_base_addr = le32_to_cpu(raw_super->sit_blkaddr);
> @@ -5200,12 +5219,13 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
>   				rcu_assign_pointer(se->cur_valid_map, map);
>   				se->ckpt_valid_map = map;
>   #ifdef CONFIG_F2FS_CHECK_FS
> -				memcpy(se->cur_valid_map_mir, map, SIT_VBLOCK_MAP_SIZE);
> +				if (f2fs_sit_check_enabled(sbi))
> +					memcpy(se->cur_valid_map_mir, map, SIT_VBLOCK_MAP_SIZE);
>   #endif
>   				se->type = GET_SIT_TYPE(&sit);
>   				se->mtime = le64_to_cpu(sit.mtime);
>   			} else {
> -				seg_info_from_raw_sit(se, &sit);
> +				seg_info_from_raw_sit(sbi, se, &sit);
>   			}
>   
>   			if (se->type >= NR_PERSISTENT_LOG) {
> @@ -5279,15 +5299,19 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
>   
>   			if (vblocks == 0 && !is_active) {
>   				if (map != sit_i->bitmap_zero &&
> -				    map != sit_i->bitmap_full)
> -					kmem_cache_free(sit_bitmap_slab,
> -							f2fs_sit_bitmap_from_map(map));
> +				    map != sit_i->bitmap_full) {
> +					struct f2fs_sit_bitmap *b =
> +						f2fs_sit_bitmap_from_map(map);
> +					kmem_cache_free(sit_bitmap_slab, b);
> +				}
>   				map = sit_i->bitmap_zero;
>   			} else if (vblocks == BLKS_PER_SEG(sbi) && !is_active) {
>   				if (map != sit_i->bitmap_zero &&
> -				    map != sit_i->bitmap_full)
> -					kmem_cache_free(sit_bitmap_slab,
> -							f2fs_sit_bitmap_from_map(map));
> +				    map != sit_i->bitmap_full) {
> +					struct f2fs_sit_bitmap *b =
> +						f2fs_sit_bitmap_from_map(map);
> +					kmem_cache_free(sit_bitmap_slab, b);
> +				}
>   				map = sit_i->bitmap_full;
>   			} else {
>   				if (map == sit_i->bitmap_zero ||
> @@ -5310,12 +5334,13 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
>   			rcu_assign_pointer(se->cur_valid_map, map);
>   			se->ckpt_valid_map = map;
>   #ifdef CONFIG_F2FS_CHECK_FS
> -			memcpy(se->cur_valid_map_mir, map, SIT_VBLOCK_MAP_SIZE);
> +			if (f2fs_sit_check_enabled(sbi))
> +				memcpy(se->cur_valid_map_mir, map, SIT_VBLOCK_MAP_SIZE);
>   #endif
>   			se->type = GET_SIT_TYPE(&sit);
>   			se->mtime = le64_to_cpu(sit.mtime);
>   		} else {
> -			seg_info_from_raw_sit(se, &sit);
> +			seg_info_from_raw_sit(sbi, se, &sit);
>   		}
>   
>   		if (se->type >= NR_PERSISTENT_LOG) {
> @@ -6099,18 +6124,18 @@ static void destroy_sit_info(struct f2fs_sb_info *sbi)
>   		if (f2fs_use_shared_sit_map(sbi)) {
>   			unsigned int start;
>   
> -			for (start = 0; start < MAIN_SEGS(sbi); start++) {
> -				struct seg_entry *se = &sit_i->sentries[start];
> +				for (start = 0; start < MAIN_SEGS(sbi); start++) {
> +					struct seg_entry *se = &sit_i->sentries[start];
>   
> -				if (se->cur_valid_map &&
> -				    se->cur_valid_map != sit_i->bitmap_zero &&
> -				    se->cur_valid_map != sit_i->bitmap_full) {
> -					struct f2fs_sit_bitmap *b;
> +					if (se->cur_valid_map &&
> +					    se->cur_valid_map != sit_i->bitmap_zero &&
> +					    se->cur_valid_map != sit_i->bitmap_full) {
> +						struct f2fs_sit_bitmap *b;
>   
> -					b = f2fs_sit_bitmap_from_map(se->cur_valid_map);
> -					kmem_cache_free(sit_bitmap_slab, b);
> +						b = f2fs_sit_bitmap_from_map(se->cur_valid_map);
> +						kmem_cache_free(sit_bitmap_slab, b);
> +					}
>   				}
> -			}
>   			kfree(sit_i->bitmap_zero);
>   			kfree(sit_i->bitmap_full);
>   			if (sit_i->bitmap)
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index cb45cfa7a658..0f4445375ed1 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -404,15 +404,17 @@ static inline void sanity_check_valid_blocks(struct f2fs_sb_info *sbi,
>   {
>   }
>   #endif
> -static inline void seg_info_from_raw_sit(struct seg_entry *se,
> -					struct f2fs_sit_entry *rs)
> +static inline void seg_info_from_raw_sit(struct f2fs_sb_info *sbi,
> +					 struct seg_entry *se,
> +					 struct f2fs_sit_entry *rs)
>   {
>   	se->valid_blocks = GET_SIT_VBLOCKS(rs);
>   	se->ckpt_valid_blocks = GET_SIT_VBLOCKS(rs);
>   	memcpy(se->cur_valid_map, rs->valid_map, SIT_VBLOCK_MAP_SIZE);
>   	memcpy(se->ckpt_valid_map, rs->valid_map, SIT_VBLOCK_MAP_SIZE);
>   #ifdef CONFIG_F2FS_CHECK_FS
> -	memcpy(se->cur_valid_map_mir, rs->valid_map, SIT_VBLOCK_MAP_SIZE);
> +	if (f2fs_sit_check_enabled(sbi))
> +		memcpy(se->cur_valid_map_mir, rs->valid_map, SIT_VBLOCK_MAP_SIZE);
>   #endif
>   	se->type = GET_SIT_TYPE(rs);
>   	se->mtime = le64_to_cpu(rs->mtime);
> @@ -558,11 +560,12 @@ static inline void get_sit_bitmap(struct f2fs_sb_info *sbi,
>   {
>   	struct sit_info *sit_i = SIT_I(sbi);
>   
> -#ifdef CONFIG_F2FS_CHECK_FS
> -	if (memcmp(sit_i->sit_bitmap, sit_i->sit_bitmap_mir,
> -						sit_i->bitmap_size))
> +	#ifdef CONFIG_F2FS_CHECK_FS
> +	if (f2fs_sit_check_enabled(sbi) &&
> +	    memcmp(sit_i->sit_bitmap, sit_i->sit_bitmap_mir,
> +		   sit_i->bitmap_size))
>   		f2fs_bug_on(sbi, 1);
> -#endif
> +	#endif
>   	memcpy(dst_addr, sit_i->sit_bitmap, sit_i->bitmap_size);
>   }
>   
> @@ -904,8 +907,9 @@ static inline pgoff_t current_sit_addr(struct f2fs_sb_info *sbi,
>   	f2fs_bug_on(sbi, !valid_main_segno(sbi, start));
>   
>   #ifdef CONFIG_F2FS_CHECK_FS
> -	if (f2fs_test_bit(offset, sit_i->sit_bitmap) !=
> -			f2fs_test_bit(offset, sit_i->sit_bitmap_mir))
> +	if (f2fs_sit_check_enabled(sbi) &&
> +	    f2fs_test_bit(offset, sit_i->sit_bitmap) !=
> +				f2fs_test_bit(offset, sit_i->sit_bitmap_mir))
>   		f2fs_bug_on(sbi, 1);
>   #endif
>   
> @@ -929,13 +933,15 @@ static inline pgoff_t next_sit_addr(struct f2fs_sb_info *sbi,
>   	return block_addr + sit_i->sit_base_addr;
>   }
>   
> -static inline void set_to_next_sit(struct sit_info *sit_i, unsigned int start)
> +static inline void set_to_next_sit(struct f2fs_sb_info *sbi,
> +				   struct sit_info *sit_i, unsigned int start)
>   {
>   	unsigned int block_off = SIT_BLOCK_OFFSET(start);
>   
>   	f2fs_change_bit(block_off, sit_i->sit_bitmap);
>   #ifdef CONFIG_F2FS_CHECK_FS
> -	f2fs_change_bit(block_off, sit_i->sit_bitmap_mir);
> +	if (f2fs_sit_check_enabled(sbi))
> +		f2fs_change_bit(block_off, sit_i->sit_bitmap_mir);
>   #endif
>   }
>   
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 83ce88ce12cb..e2bb5d0ab3e1 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -228,6 +228,7 @@ enum {
>   	Opt_gc_merge,
>   	Opt_discard_unit,
>   	Opt_memory_mode,
> +	Opt_shared_sit_check,
>   	Opt_age_extent_cache,
>   	Opt_errors,
>   	Opt_nat_bits,
> @@ -359,6 +360,7 @@ static const struct fs_parameter_spec f2fs_param_specs[] = {
>   	fsparam_flag_no("gc_merge", Opt_gc_merge),
>   	fsparam_enum("discard_unit", Opt_discard_unit, f2fs_param_discard_unit),
>   	fsparam_enum("memory", Opt_memory_mode, f2fs_param_memory_mode),
> +	fsparam_flag_no("shared_sit_check", Opt_shared_sit_check),
>   	fsparam_flag("age_extent_cache", Opt_age_extent_cache),
>   	fsparam_enum("errors", Opt_errors, f2fs_param_errors),
>   	fsparam_enum("lookup_mode", Opt_lookup_mode, f2fs_param_lookup_mode),
> @@ -1217,6 +1219,12 @@ static int f2fs_parse_param(struct fs_context *fc, struct fs_parameter *param)
>   		F2FS_CTX_INFO(ctx).memory_mode = result.uint_32;
>   		ctx->spec_mask |= F2FS_SPEC_memory_mode;
>   		break;
> +	case Opt_shared_sit_check:
> +		if (result.negated)
> +			ctx_clear_opt(ctx, F2FS_MOUNT_SHARED_SIT_CHECK);
> +		else
> +			ctx_set_opt(ctx, F2FS_MOUNT_SHARED_SIT_CHECK);
> +		break;
>   	case Opt_age_extent_cache:
>   		ctx_set_opt(ctx, F2FS_MOUNT_AGE_EXTENT_CACHE);
>   		break;
> @@ -2514,6 +2522,11 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
>   	else if (F2FS_OPTION(sbi).memory_mode == MEMORY_MODE_LOW)
>   		seq_printf(seq, ",memory=%s", "low");
>   
> +	if (test_opt(sbi, SHARED_SIT_CHECK))
> +		seq_puts(seq, ",shared_sit_check");
> +	else
> +		seq_puts(seq, ",noshared_sit_check");
> +
>   	if (F2FS_OPTION(sbi).errors == MOUNT_ERRORS_READONLY)
>   		seq_printf(seq, ",errors=%s", "remount-ro");
>   	else if (F2FS_OPTION(sbi).errors == MOUNT_ERRORS_CONTINUE)
> @@ -2573,6 +2586,7 @@ static void default_options(struct f2fs_sb_info *sbi, bool remount)
>   	F2FS_OPTION(sbi).bggc_mode = BGGC_MODE_ON;
>   	F2FS_OPTION(sbi).memory_mode = MEMORY_MODE_NORMAL;
>   	F2FS_OPTION(sbi).errors = MOUNT_ERRORS_CONTINUE;
> +	set_opt(sbi, SHARED_SIT_CHECK);
>   
>   	set_opt(sbi, INLINE_XATTR);
>   	set_opt(sbi, INLINE_DATA);
> @@ -2782,6 +2796,7 @@ static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
>   	bool no_compress_cache = !test_opt(sbi, COMPRESS_CACHE);
>   	bool block_unit_discard = f2fs_block_unit_discard(sbi);
>   	bool no_nat_bits = !test_opt(sbi, NAT_BITS);
> +	bool shared_sit_check = test_opt(sbi, SHARED_SIT_CHECK);
>   #ifdef CONFIG_QUOTA
>   	int i, j;
>   #endif
> @@ -2904,6 +2919,12 @@ static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
>   		goto restore_opts;
>   	}
>   
> +	if (shared_sit_check != !!test_opt(sbi, SHARED_SIT_CHECK)) {
> +		err = -EINVAL;
> +		f2fs_warn(sbi, "switch shared_sit_check option is not allowed");
> +		goto restore_opts;
> +	}
> +
>   	if ((flags & SB_RDONLY) && test_opt(sbi, DISABLE_CHECKPOINT)) {
>   		err = -EINVAL;
>   		f2fs_warn(sbi, "disabling checkpoint not compatible with read-only");



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
