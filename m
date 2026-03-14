Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGQtGJjttGm/uQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Mar 2026 06:09:44 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F9328BB34
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Mar 2026 06:09:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o1kR/UPfNur88tSAd6rE83H2/12R0ZZ843ttVOk7l1k=; b=dm/+qcWUXSvNTLuLkCPYWgtjNB
	AFhOaJ1ojPLjruSRkUwrFZ9SAySyYS/x1nWNkWoJhEs1N1YGmIHTDP7eySGFuDpC7MnurLffTy9PG
	sgBNY/erqhR1tHfDBIW/EMe34PlTNOZJHJvvpizIKa6hazYLacJYQl/XvlYMLoZLouhE=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w1HFh-0006Q4-Bf;
	Sat, 14 Mar 2026 05:09:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w1HFI-0006Pg-GN
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Mar 2026 05:09:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kgFG1kvy6Jbh9OaRYPLTAbMn66ovmyAmd9yEBd2R8z4=; b=kcKQKqA60id8ioIiMWMjOapuOF
 X/rlG7ZD1JDl2eSvcbehqsrS9W9CTFmEtN2rGCPWYAY6f4e+zg8894siyf8M0Q0jocdJnlNAetB4b
 bwllVSCq3gWUw4RaWwQU2qH/NeVNiCK2paNr7d9dsVcmQmxGX70XHVUMYQfLZXwgi9HU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kgFG1kvy6Jbh9OaRYPLTAbMn66ovmyAmd9yEBd2R8z4=; b=ICB6GWMActMKrrxAAPRDmteTI9
 hO7aIO30WcfnIdMI7BZfOU7ZkTLRRKpzpwU4R1dl7viM3ft0AQJQDHNrC1VaefigvgsjePjYqJVGQ
 PXS+mUUolXd26x/StHni1gcNIfSlpdgUW0IZ9qOiOecb9oK6ZUUIkmihVBWnUqLce22o=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w1HFH-0006ni-88 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Mar 2026 05:09:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CFDBD43F6A;
 Sat, 14 Mar 2026 05:08:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB925C116C6;
 Sat, 14 Mar 2026 05:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773464937;
 bh=sKtgvvDVtYCDDAfL3Sx9aLvQ7XN5tQXioO8IdQDv354=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=pcKzVe83sFqtHcOcmgd4D8ucbqaWo0G4EwnFvyhoLt2h96UHb8wktAxoKGdekJbSH
 45gmeJ99KuxIQzthK3HrOsnb/PvxsmwKd48vhJgzceTBMgqU6pgFHkLVuRzhxdv3l6
 D2YW00sJ6tMjyHh7wx7qvTYoYqBG0yt9IQfShDUGiL+2iGMgWw+VwIpuBpc5DEJ5qj
 vn3W4gFkXohAEyiSZRogdpOaNGzJzeZV5lI9OuL7veLDOLh1sYHcG5M5OTxJCMhlMI
 886Poi/glAQwkajgbY6bU8NeGb0ESlgEhPXERffN5hiV2bLewLzxSx2tV9rIfPkZFJ
 RB7RUJVLtt1VQ==
Message-ID: <66ab8be1-606a-416e-88cd-ced415867473@kernel.org>
Date: Sat, 14 Mar 2026 13:08:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: 'wallentx <william.allentx@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <20260309103700.489932-1-william.allentx@gmail.com>
 <20260309103700.489932-3-william.allentx@gmail.com>
Content-Language: en-US
In-Reply-To: <20260309103700.489932-3-william.allentx@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi wallentx, Thanks for your contribution! On 2026/3/9 18:36,
 'wallentx wrote: > From: wallentx <william.allentx@gmail.com> > > For zoned
 devices, F2FS only allows LFS mode. In that configuration SSR > is not used,
 IPU is not allowed, and disc [...] 
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
X-Headers-End: 1w1HFH-0006ni-88
Subject: Re: [f2fs-dev] [RFC PATCH 2/3] f2fs: reduce zoned LFS memory by
 sharing SIT valid maps
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
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:william.allentx@gmail.com,m:linux-f2fs-devel@lists.sourceforge.net,m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:williamallentx@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
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
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Queue-Id: 62F9328BB34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi wallentx,

Thanks for your contribution!

On 2026/3/9 18:36, 'wallentx wrote:
> From: wallentx <william.allentx@gmail.com>
> 
> For zoned devices, F2FS only allows LFS mode. In that configuration SSR
> is not used, IPU is not allowed, and discard defaults to section
> granularity. Even so, F2FS still allocates per-segment cur/ckpt valid
> maps for every segment, including the common cases where a segment is
> trivially empty or trivially full.
> 
> Reduce that overhead by introducing shared zero/full SIT valid maps for
> zoned LFS. Empty inactive segments point at the shared zero map, full
> inactive segments point at the shared full map, and only active or
> partially valid segments keep private maps. Update SIT rebuild and
> runtime updates to move segments between shared and private maps safely,
> and retire replaced private maps with RCU.
> 
> Also invalidate scanned SIT metadata pages after mount-time rebuild so
> META_MAPPING does not retain the full SIT scan, update memory reporting
> to reflect the new layout, and reject checkpoint=disable because its
> checkpoint-era validity accounting does not fit the collapsed shared-SIT
> representation.

I think that will be a problem, since checkpoint=disable is used in Android
product, we can not fail to apply mount option for shared sit map.

Can we make this feature optional?

Thanks,

> 
> On a test system with 43 HM-SMR zoned volumes (~550 TB total),
> CONFIG_F2FS_CHECK_FS=y, and this patch applied on top of jaegeuk/f2fs
> dev at 5f04e90eedd0, static F2FS memory dropped from 58.91 GiB to
> 27.70 GiB.
> 
> Signed-off-by: wallentx <william.allentx@gmail.com>
> ---
>   fs/f2fs/debug.c   |  20 ++-
>   fs/f2fs/f2fs.h    |   6 +
>   fs/f2fs/segment.c | 338 ++++++++++++++++++++++++++++++++++++++++++----
>   fs/f2fs/segment.h |   3 +
>   fs/f2fs/super.c   |   4 +
>   fs/f2fs/sysfs.c   |   3 +-
>   6 files changed, 341 insertions(+), 33 deletions(-)
> 
> diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
> index af88db8fdb71..d8bfdac5c1e4 100644
> --- a/fs/f2fs/debug.c
> +++ b/fs/f2fs/debug.c
> @@ -319,9 +319,23 @@ static void update_mem_info(struct f2fs_sb_info *sbi)
>   	si->base_mem += sizeof(struct sit_info);
>   	si->base_mem += MAIN_SEGS(sbi) * sizeof(struct seg_entry);
>   	si->base_mem += f2fs_bitmap_size(MAIN_SEGS(sbi));
> -	si->base_mem += 2 * SIT_VBLOCK_MAP_SIZE * MAIN_SEGS(sbi);
> -	si->base_mem += SIT_VBLOCK_MAP_SIZE * MAIN_SEGS(sbi);
> -	si->base_mem += SIT_VBLOCK_MAP_SIZE;
> +
> +	if (f2fs_use_shared_sit_map(sbi)) {
> +		/* shared cur/ckpt maps (zero + full bitmaps) */
> +		si->base_mem += SIT_VBLOCK_MAP_SIZE * 2;
> +		/* Approximate private bitmaps for active logs */
> +		si->base_mem += SIT_VBLOCK_MAP_SIZE * NR_CURSEG_TYPE;
> +#ifdef CONFIG_F2FS_CHECK_FS
> +		si->base_mem += SIT_VBLOCK_MAP_SIZE * MAIN_SEGS(sbi);
> +#endif
> +		if (f2fs_block_unit_discard(sbi))
> +			si->base_mem += SIT_VBLOCK_MAP_SIZE * MAIN_SEGS(sbi);
> +	} else {
> +		si->base_mem += 2 * SIT_VBLOCK_MAP_SIZE * MAIN_SEGS(sbi);
> +		si->base_mem += SIT_VBLOCK_MAP_SIZE * MAIN_SEGS(sbi);
> +		si->base_mem += SIT_VBLOCK_MAP_SIZE;
> +	}
> +
>   	if (__is_large_section(sbi))
>   		si->base_mem += MAIN_SECS(sbi) * sizeof(struct sec_entry);
>   	si->base_mem += __bitmap_size(sbi, SIT_BITMAP);
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 8942b2a63cfd..11f3601ffd34 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4914,6 +4914,12 @@ static inline bool f2fs_lfs_mode(struct f2fs_sb_info *sbi)
>   	return F2FS_OPTION(sbi).fs_mode == FS_MODE_LFS;
>   }
>   
> +/* Share SIT valid maps only for zoned LFS. */
> +static inline bool f2fs_use_shared_sit_map(struct f2fs_sb_info *sbi)
> +{
> +	return f2fs_sb_has_blkzoned(sbi) && f2fs_lfs_mode(sbi);
> +}
> +
>   static inline bool f2fs_is_sequential_zone_area(struct f2fs_sb_info *sbi,
>   					  block_t blkaddr)
>   {
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index c9cfc8f17698..0dab6b16ba56 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -31,6 +31,24 @@ static struct kmem_cache *discard_entry_slab;
>   static struct kmem_cache *discard_cmd_slab;
>   static struct kmem_cache *sit_entry_set_slab;
>   static struct kmem_cache *revoke_entry_slab;
> +static struct kmem_cache *sit_bitmap_slab;
> +
> +struct f2fs_sit_bitmap {
> +	struct rcu_head rcu;
> +	unsigned char map[SIT_VBLOCK_MAP_SIZE];
> +};
> +
> +static void f2fs_free_sit_bitmap_rcu(struct rcu_head *rcu)
> +{
> +	struct f2fs_sit_bitmap *b = container_of(rcu, struct f2fs_sit_bitmap, rcu);
> +
> +	kmem_cache_free(sit_bitmap_slab, b);
> +}
> +
> +static struct f2fs_sit_bitmap *f2fs_sit_bitmap_from_map(void *map)
> +{
> +	return container_of(map, struct f2fs_sit_bitmap, map);
> +}
>   
>   static unsigned long __reverse_ulong(unsigned char *str)
>   {
> @@ -2444,6 +2462,31 @@ static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_ent
>   
>   	f2fs_bug_on(sbi, GET_SEGNO(sbi, blkaddr) != GET_SEGNO(sbi, blkaddr + del_count - 1));
>   
> +	if (f2fs_use_shared_sit_map(sbi)) {
> +		struct sit_info *sit_i = SIT_I(sbi);
> +
> +		if (se->cur_valid_map == sit_i->bitmap_full) {
> +			struct f2fs_sit_bitmap *b = f2fs_kmem_cache_alloc(sit_bitmap_slab,
> +						GFP_NOFS, true, sbi);
> +			memset(b->map, 0xff, SIT_VBLOCK_MAP_SIZE);
> +			rcu_assign_pointer(se->cur_valid_map, b->map);
> +			se->ckpt_valid_map = b->map;
> +#ifdef CONFIG_F2FS_CHECK_FS
> +			memcpy(se->cur_valid_map_mir, b->map, SIT_VBLOCK_MAP_SIZE);
> +#endif
> +		} else if (se->cur_valid_map == sit_i->bitmap_zero) {
> +			/* Should not happen, freeing empty segment */
> +			struct f2fs_sit_bitmap *b = f2fs_kmem_cache_alloc(sit_bitmap_slab,
> +						GFP_NOFS, true, sbi);
> +			memset(b->map, 0, SIT_VBLOCK_MAP_SIZE);
> +			rcu_assign_pointer(se->cur_valid_map, b->map);
> +			se->ckpt_valid_map = b->map;
> +#ifdef CONFIG_F2FS_CHECK_FS
> +			memcpy(se->cur_valid_map_mir, b->map, SIT_VBLOCK_MAP_SIZE);
> +#endif
> +		}
> +	}
> +
>   	for (i = 0; i < del_count; i++) {
>   		exist = f2fs_test_and_clear_bit(offset + i, se->cur_valid_map);
>   #ifdef CONFIG_F2FS_CHECK_FS
> @@ -2478,10 +2521,18 @@ static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_ent
>   				f2fs_test_and_clear_bit(offset + i, se->discard_map))
>   			sbi->discard_blks++;
>   
> -		if (!f2fs_test_bit(offset + i, se->ckpt_valid_map)) {
> -			se->ckpt_valid_blocks -= 1;
> -			if (__is_large_section(sbi))
> -				get_sec_entry(sbi, segno)->ckpt_valid_blocks -= 1;
> +		if (se->cur_valid_map != se->ckpt_valid_map) {
> +			if (!f2fs_test_bit(offset + i, se->ckpt_valid_map)) {
> +				se->ckpt_valid_blocks -= 1;
> +				if (__is_large_section(sbi))
> +					get_sec_entry(sbi, segno)->ckpt_valid_blocks -= 1;
> +			}
> +		} else {
> +			if (exist) {
> +				se->ckpt_valid_blocks -= 1;
> +				if (__is_large_section(sbi))
> +					get_sec_entry(sbi, segno)->ckpt_valid_blocks -= 1;
> +			}
>   		}
>   	}
>   
> @@ -2499,6 +2550,31 @@ static int update_sit_entry_for_alloc(struct f2fs_sb_info *sbi, struct seg_entry
>   	bool mir_exist;
>   #endif
>   
> +	if (f2fs_use_shared_sit_map(sbi)) {
> +		struct sit_info *sit_i = SIT_I(sbi);
> +
> +		if (se->cur_valid_map == sit_i->bitmap_zero) {
> +			struct f2fs_sit_bitmap *b = f2fs_kmem_cache_alloc(sit_bitmap_slab,
> +						GFP_NOFS, true, sbi);
> +			memset(b->map, 0, SIT_VBLOCK_MAP_SIZE);
> +			rcu_assign_pointer(se->cur_valid_map, b->map);
> +			se->ckpt_valid_map = b->map;
> +#ifdef CONFIG_F2FS_CHECK_FS
> +			memcpy(se->cur_valid_map_mir, b->map, SIT_VBLOCK_MAP_SIZE);
> +#endif
> +		} else if (se->cur_valid_map == sit_i->bitmap_full) {
> +			/* Should not happen in LFS alloc, but for safety */
> +			struct f2fs_sit_bitmap *b = f2fs_kmem_cache_alloc(sit_bitmap_slab,
> +						GFP_NOFS, true, sbi);
> +			memset(b->map, 0xff, SIT_VBLOCK_MAP_SIZE);
> +			rcu_assign_pointer(se->cur_valid_map, b->map);
> +			se->ckpt_valid_map = b->map;
> +#ifdef CONFIG_F2FS_CHECK_FS
> +			memcpy(se->cur_valid_map_mir, b->map, SIT_VBLOCK_MAP_SIZE);
> +#endif
> +		}
> +	}
> +
>   	exist = f2fs_test_and_set_bit(offset, se->cur_valid_map);
>   #ifdef CONFIG_F2FS_CHECK_FS
>   	mir_exist = f2fs_test_and_set_bit(offset,
> @@ -2525,14 +2601,23 @@ static int update_sit_entry_for_alloc(struct f2fs_sb_info *sbi, struct seg_entry
>   	 * or newly invalidated.
>   	 */
>   	if (!is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
> -		if (!f2fs_test_and_set_bit(offset, se->ckpt_valid_map)) {
> -			se->ckpt_valid_blocks++;
> -			if (__is_large_section(sbi))
> -				get_sec_entry(sbi, segno)->ckpt_valid_blocks++;
> +		if (se->cur_valid_map != se->ckpt_valid_map) {
> +			if (!f2fs_test_and_set_bit(offset, se->ckpt_valid_map)) {
> +				se->ckpt_valid_blocks++;
> +				if (__is_large_section(sbi))
> +					get_sec_entry(sbi, segno)->ckpt_valid_blocks++;
> +			}
> +		} else {
> +			if (!exist) {
> +				se->ckpt_valid_blocks++;
> +				if (__is_large_section(sbi))
> +					get_sec_entry(sbi, segno)->ckpt_valid_blocks++;
> +			}
>   		}
>   	}
>   
> -	if (!f2fs_test_bit(offset, se->ckpt_valid_map)) {
> +	if (se->cur_valid_map != se->ckpt_valid_map &&
> +	    !f2fs_test_bit(offset, se->ckpt_valid_map)) {
>   		se->ckpt_valid_blocks += del;
>   		if (__is_large_section(sbi))
>   			get_sec_entry(sbi, segno)->ckpt_valid_blocks += del;
> @@ -2582,6 +2667,40 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
>   
>   	if (__is_large_section(sbi))
>   		get_sec_entry(sbi, segno)->valid_blocks += del;
> +
> +	if (f2fs_use_shared_sit_map(sbi)) {
> +		struct sit_info *sit_i = SIT_I(sbi);
> +
> +		if (new_vblocks == 0 &&
> +		    se->cur_valid_map != sit_i->bitmap_zero) {
> +			void *old_map = se->cur_valid_map;
> +
> +			rcu_assign_pointer(se->cur_valid_map, sit_i->bitmap_zero);
> +			se->ckpt_valid_map = sit_i->bitmap_zero;
> +#ifdef CONFIG_F2FS_CHECK_FS
> +			memset(se->cur_valid_map_mir, 0, SIT_VBLOCK_MAP_SIZE);
> +#endif
> +			if (old_map != sit_i->bitmap_zero &&
> +			    old_map != sit_i->bitmap_full) {
> +				call_rcu(&f2fs_sit_bitmap_from_map(old_map)->rcu,
> +					 f2fs_free_sit_bitmap_rcu);
> +			}
> +		} else if (new_vblocks == BLKS_PER_SEG(sbi) &&
> +				se->cur_valid_map != sit_i->bitmap_full) {
> +			void *old_map = se->cur_valid_map;
> +
> +			rcu_assign_pointer(se->cur_valid_map, sit_i->bitmap_full);
> +			se->ckpt_valid_map = sit_i->bitmap_full;
> +#ifdef CONFIG_F2FS_CHECK_FS
> +			memset(se->cur_valid_map_mir, 0xff, SIT_VBLOCK_MAP_SIZE);
> +#endif
> +			if (old_map != sit_i->bitmap_zero &&
> +			    old_map != sit_i->bitmap_full) {
> +				call_rcu(&f2fs_sit_bitmap_from_map(old_map)->rcu,
> +					 f2fs_free_sit_bitmap_rcu);
> +			}
> +		}
> +	}
>   }
>   
>   void f2fs_invalidate_blocks(struct f2fs_sb_info *sbi, block_t addr,
> @@ -4812,6 +4931,7 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
>   	char *src_bitmap, *bitmap;
>   	unsigned int bitmap_size, main_bitmap_size, sit_bitmap_size;
>   	unsigned int discard_map = f2fs_block_unit_discard(sbi) ? 1 : 0;
> +	bool share_map = f2fs_use_shared_sit_map(sbi);
>   
>   	/* allocate memory for SIT information */
>   	sit_i = f2fs_kzalloc(sbi, sizeof(struct sit_info), GFP_KERNEL);
> @@ -4838,28 +4958,73 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
>   #else
>   	bitmap_size = MAIN_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE * (2 + discard_map);
>   #endif
> -	sit_i->bitmap = f2fs_kvzalloc(sbi, bitmap_size, GFP_KERNEL);
> -	if (!sit_i->bitmap)
> -		return -ENOMEM;
> -
> -	bitmap = sit_i->bitmap;
>   
> -	for (start = 0; start < MAIN_SEGS(sbi); start++) {
> -		rcu_assign_pointer(sit_i->sentries[start].cur_valid_map,
> -				   bitmap);
> -		bitmap += SIT_VBLOCK_MAP_SIZE;
> +	if (share_map) {
> +		sit_i->bitmap_zero = f2fs_kzalloc(sbi, SIT_VBLOCK_MAP_SIZE, GFP_KERNEL);
> +		if (!sit_i->bitmap_zero)
> +			return -ENOMEM;
> +		sit_i->bitmap_full = f2fs_kzalloc(sbi, SIT_VBLOCK_MAP_SIZE, GFP_KERNEL);
> +		if (!sit_i->bitmap_full) {
> +			kfree(sit_i->bitmap_zero);
> +			sit_i->bitmap_zero = NULL;
> +			return -ENOMEM;
> +		}
> +		memset(sit_i->bitmap_full, 0xff, SIT_VBLOCK_MAP_SIZE);
>   
> -		sit_i->sentries[start].ckpt_valid_map = bitmap;
> -		bitmap += SIT_VBLOCK_MAP_SIZE;
> +		bitmap_size = MAIN_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE * discard_map;
> +#ifdef CONFIG_F2FS_CHECK_FS
> +		bitmap_size += MAIN_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE;
> +#endif
> +		if (bitmap_size) {
> +			sit_i->bitmap = f2fs_kvzalloc(sbi, bitmap_size, GFP_KERNEL);
> +			if (!sit_i->bitmap) {
> +				kfree(sit_i->bitmap_full);
> +				kfree(sit_i->bitmap_zero);
> +				sit_i->bitmap_full = NULL;
> +				sit_i->bitmap_zero = NULL;
> +				return -ENOMEM;
> +			}
> +			bitmap = sit_i->bitmap;
> +		}
>   
> +		for (start = 0; start < MAIN_SEGS(sbi); start++) {
> +			rcu_assign_pointer(sit_i->sentries[start].cur_valid_map,
> +					   sit_i->bitmap_zero);
> +			sit_i->sentries[start].ckpt_valid_map =
> +						sit_i->bitmap_zero;
>   #ifdef CONFIG_F2FS_CHECK_FS
> -		sit_i->sentries[start].cur_valid_map_mir = bitmap;
> -		bitmap += SIT_VBLOCK_MAP_SIZE;
> +			sit_i->sentries[start].cur_valid_map_mir =
> +						bitmap;
> +			bitmap += SIT_VBLOCK_MAP_SIZE;
>   #endif
> +			if (discard_map) {
> +				sit_i->sentries[start].discard_map = bitmap;
> +				bitmap += SIT_VBLOCK_MAP_SIZE;
> +			}
> +		}
> +	} else {
> +		sit_i->bitmap = f2fs_kvzalloc(sbi, bitmap_size, GFP_KERNEL);
> +		if (!sit_i->bitmap)
> +			return -ENOMEM;
> +
> +		bitmap = sit_i->bitmap;
> +
> +		for (start = 0; start < MAIN_SEGS(sbi); start++) {
> +			rcu_assign_pointer(sit_i->sentries[start].cur_valid_map, bitmap);
> +			bitmap += SIT_VBLOCK_MAP_SIZE;
>   
> -		if (discard_map) {
> -			sit_i->sentries[start].discard_map = bitmap;
> +			sit_i->sentries[start].ckpt_valid_map = bitmap;
>   			bitmap += SIT_VBLOCK_MAP_SIZE;
> +
> +#ifdef CONFIG_F2FS_CHECK_FS
> +			sit_i->sentries[start].cur_valid_map_mir = bitmap;
> +			bitmap += SIT_VBLOCK_MAP_SIZE;
> +#endif
> +
> +			if (discard_map) {
> +				sit_i->sentries[start].discard_map = bitmap;
> +				bitmap += SIT_VBLOCK_MAP_SIZE;
> +			}
>   		}
>   	}
>   
> @@ -5009,7 +5174,39 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
>   			err = check_block_count(sbi, start, &sit);
>   			if (err)
>   				return err;
> -			seg_info_from_raw_sit(se, &sit);
> +
> +			if (f2fs_use_shared_sit_map(sbi)) {
> +				unsigned int vblocks = GET_SIT_VBLOCKS(&sit);
> +				unsigned char *map = NULL;
> +				bool is_active = is_curseg(sbi, start);
> +
> +				if (vblocks == 0 && !is_active) {
> +					map = sit_i->bitmap_zero;
> +				} else if (vblocks == BLKS_PER_SEG(sbi) && !is_active) {
> +					map = sit_i->bitmap_full;
> +				} else {
> +					struct f2fs_sit_bitmap *b =
> +						f2fs_kmem_cache_alloc(sit_bitmap_slab,
> +								      GFP_KERNEL,
> +								      false, sbi);
> +					if (!b)
> +						return -ENOMEM;
> +					map = b->map;
> +					memcpy(map, sit.valid_map, SIT_VBLOCK_MAP_SIZE);
> +				}
> +
> +				se->valid_blocks = vblocks;
> +				se->ckpt_valid_blocks = vblocks;
> +				rcu_assign_pointer(se->cur_valid_map, map);
> +				se->ckpt_valid_map = map;
> +#ifdef CONFIG_F2FS_CHECK_FS
> +				memcpy(se->cur_valid_map_mir, map, SIT_VBLOCK_MAP_SIZE);
> +#endif
> +				se->type = GET_SIT_TYPE(&sit);
> +				se->mtime = le64_to_cpu(sit.mtime);
> +			} else {
> +				seg_info_from_raw_sit(se, &sit);
> +			}
>   
>   			if (se->type >= NR_PERSISTENT_LOG) {
>   				f2fs_err(sbi, "Invalid segment type: %u, segno: %u",
> @@ -5039,6 +5236,15 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
>   				get_sec_entry(sbi, start)->valid_blocks +=
>   							se->valid_blocks;
>   		}
> +		if (f2fs_use_shared_sit_map(sbi)) {
> +			pgoff_t start_addr = sit_i->sit_base_addr + start_blk;
> +			pgoff_t end_addr = start_addr + readed - 1;
> +			pgoff_t alt_start_addr = start_addr + sit_i->sit_blocks;
> +			pgoff_t alt_end_addr = alt_start_addr + readed - 1;
> +
> +			invalidate_mapping_pages(META_MAPPING(sbi), start_addr, end_addr);
> +			invalidate_mapping_pages(META_MAPPING(sbi), alt_start_addr, alt_end_addr);
> +		}
>   		start_blk += readed;
>   	} while (start_blk < sit_blk_cnt);
>   
> @@ -5065,7 +5271,52 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
>   		err = check_block_count(sbi, start, &sit);
>   		if (err)
>   			break;
> -		seg_info_from_raw_sit(se, &sit);
> +
> +		if (f2fs_use_shared_sit_map(sbi)) {
> +			unsigned int vblocks = GET_SIT_VBLOCKS(&sit);
> +			unsigned char *map = se->cur_valid_map;
> +			bool is_active = is_curseg(sbi, start);
> +
> +			if (vblocks == 0 && !is_active) {
> +				if (map != sit_i->bitmap_zero &&
> +				    map != sit_i->bitmap_full)
> +					kmem_cache_free(sit_bitmap_slab,
> +							f2fs_sit_bitmap_from_map(map));
> +				map = sit_i->bitmap_zero;
> +			} else if (vblocks == BLKS_PER_SEG(sbi) && !is_active) {
> +				if (map != sit_i->bitmap_zero &&
> +				    map != sit_i->bitmap_full)
> +					kmem_cache_free(sit_bitmap_slab,
> +							f2fs_sit_bitmap_from_map(map));
> +				map = sit_i->bitmap_full;
> +			} else {
> +				if (map == sit_i->bitmap_zero ||
> +				    map == sit_i->bitmap_full) {
> +					struct f2fs_sit_bitmap *b =
> +						f2fs_kmem_cache_alloc(sit_bitmap_slab,
> +								      GFP_KERNEL,
> +								      false, sbi);
> +					if (!b) {
> +						up_read(&curseg->journal_rwsem);
> +						return -ENOMEM;
> +					}
> +					map = b->map;
> +				}
> +				memcpy(map, sit.valid_map, SIT_VBLOCK_MAP_SIZE);
> +			}
> +
> +			se->valid_blocks = vblocks;
> +			se->ckpt_valid_blocks = vblocks;
> +			rcu_assign_pointer(se->cur_valid_map, map);
> +			se->ckpt_valid_map = map;
> +#ifdef CONFIG_F2FS_CHECK_FS
> +			memcpy(se->cur_valid_map_mir, map, SIT_VBLOCK_MAP_SIZE);
> +#endif
> +			se->type = GET_SIT_TYPE(&sit);
> +			se->mtime = le64_to_cpu(sit.mtime);
> +		} else {
> +			seg_info_from_raw_sit(se, &sit);
> +		}
>   
>   		if (se->type >= NR_PERSISTENT_LOG) {
>   			f2fs_err(sbi, "Invalid segment type: %u, segno: %u",
> @@ -5844,8 +6095,30 @@ static void destroy_sit_info(struct f2fs_sb_info *sbi)
>   	if (!sit_i)
>   		return;
>   
> -	if (sit_i->sentries)
> -		kvfree(sit_i->bitmap);
> +	if (sit_i->sentries) {
> +		if (f2fs_use_shared_sit_map(sbi)) {
> +			unsigned int start;
> +
> +			for (start = 0; start < MAIN_SEGS(sbi); start++) {
> +				struct seg_entry *se = &sit_i->sentries[start];
> +
> +				if (se->cur_valid_map &&
> +				    se->cur_valid_map != sit_i->bitmap_zero &&
> +				    se->cur_valid_map != sit_i->bitmap_full) {
> +					struct f2fs_sit_bitmap *b;
> +
> +					b = f2fs_sit_bitmap_from_map(se->cur_valid_map);
> +					kmem_cache_free(sit_bitmap_slab, b);
> +				}
> +			}
> +			kfree(sit_i->bitmap_zero);
> +			kfree(sit_i->bitmap_full);
> +			if (sit_i->bitmap)
> +				kvfree(sit_i->bitmap);
> +		} else {
> +			kvfree(sit_i->bitmap);
> +		}
> +	}
>   	kfree(sit_i->tmp_map);
>   
>   	kvfree(sit_i->sentries);
> @@ -5898,8 +6171,16 @@ int __init f2fs_create_segment_manager_caches(void)
>   			sizeof(struct revoke_entry));
>   	if (!revoke_entry_slab)
>   		goto destroy_sit_entry_set;
> +
> +	sit_bitmap_slab = f2fs_kmem_cache_create("f2fs_sit_bitmap",
> +						 sizeof(struct f2fs_sit_bitmap));
> +	if (!sit_bitmap_slab)
> +		goto destroy_revoke_entry;
> +
>   	return 0;
>   
> +destroy_revoke_entry:
> +	kmem_cache_destroy(revoke_entry_slab);
>   destroy_sit_entry_set:
>   	kmem_cache_destroy(sit_entry_set_slab);
>   destroy_discard_cmd:
> @@ -5916,4 +6197,5 @@ void f2fs_destroy_segment_manager_caches(void)
>   	kmem_cache_destroy(discard_cmd_slab);
>   	kmem_cache_destroy(discard_entry_slab);
>   	kmem_cache_destroy(revoke_entry_slab);
> +	kmem_cache_destroy(sit_bitmap_slab);
>   }
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 068845660b0f..cb45cfa7a658 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -233,6 +233,9 @@ struct sit_info {
>   	unsigned long long dirty_max_mtime;	/* rerange candidates in GC_AT */
>   
>   	unsigned int last_victim[MAX_GC_POLICY]; /* last victim segment # */
> +
> +	unsigned char *bitmap_zero;		/* shared zero bitmap */
> +	unsigned char *bitmap_full;		/* shared full bitmap */
>   };
>   
>   struct free_segmap_info {
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 8774c60b4be4..83ce88ce12cb 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2617,6 +2617,10 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
>   		f2fs_err(sbi, "checkpoint=disable on readonly fs");
>   		return -EINVAL;
>   	}
> +	if (f2fs_use_shared_sit_map(sbi)) {
> +		f2fs_err(sbi, "checkpoint=disable is not supported in zoned shared SIT mode");
> +		return -EOPNOTSUPP;
> +	}
>   	sbi->sb->s_flags |= SB_ACTIVE;
>   
>   	/* check if we need more GC first */
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 9c79f7b63583..2baf349721c9 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -1788,8 +1788,7 @@ static int __maybe_unused segment_bits_seq_show(struct seq_file *seq,
>   		seq_printf(seq, "%d|%-3u|", se->type, se->valid_blocks);
>   
>   		rcu_read_lock();
> -		memcpy(map, rcu_dereference(se->cur_valid_map),
> -		       SIT_VBLOCK_MAP_SIZE);
> +		memcpy(map, rcu_dereference(se->cur_valid_map), SIT_VBLOCK_MAP_SIZE);
>   		rcu_read_unlock();
>   
>   		for (j = 0; j < SIT_VBLOCK_MAP_SIZE; j++)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
