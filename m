Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DoVaN63qL2r1IwUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 14:06:05 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEF4685F77
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 14:06:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=LeShmZc9;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=YsQGuneU;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=R1RsvYRE;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=iGC4xb96;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gwVjEOd33J4t/AIYm64Dmd+9ihUMLLZAhsFDEarC99A=; b=LeShmZc9DByqaSDdcRXRAXqywB
	9G8dxAAcIi+Lq1yPNlQKtl5RzaOUBrkO9zEBASSqMeaK63P3ybdQMyHK8V6R5631Trr6lPhzurd2o
	nZ+R7jKaOkqow0rEaqKPm7CJOaVrMyqE0VlR2PQ7x0Vxu+4Q4cPOveeCoZf2WYDvOvQM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZ64o-0004wd-35;
	Mon, 15 Jun 2026 12:06:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wZ64n-0004wU-C2
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 12:06:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bHEK7AHzGeyy8h5AhoI4sxRQ48gHAcAxjxYhNNiH+8s=; b=YsQGuneUC65bZSACq81yn8ARkf
 ZVfThoYhVbEJtye/LPPXm4DGIQZ30sR2/PauzEwdc1M51vd30PSvcjuowiXax59TDPqRp15/hgjPk
 paddnKCpnVUsqswHGnnsq9Y2dTX8785eEC0VJ+/QcbrnuIqGdnmZ6bxtTphPfCGz2KnI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bHEK7AHzGeyy8h5AhoI4sxRQ48gHAcAxjxYhNNiH+8s=; b=R1RsvYREfr07VDrCuyX1ssAn3z
 NhyCx86W1W8Oi9AQuMoPPFQ5Ger8ngwczKf+/k71s67YSwIw4UNWYZ6nvW1zElhBxqn6NQ+nb/ocI
 LztfegHa2EJK+VXkRqdOG/3oO4PNuR7vduSvmmezO4J2SLyqOSz+M42zGHYcGppIqAXM=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZ64l-0002nw-Ay for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 12:06:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 4120B6008A;
 Mon, 15 Jun 2026 12:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B83561F000E9;
 Mon, 15 Jun 2026 12:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781525149;
 bh=bHEK7AHzGeyy8h5AhoI4sxRQ48gHAcAxjxYhNNiH+8s=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=iGC4xb96PYuMifmNxyd0Tai/UHrHnZUqeN41IXu6zRSOxDrIYO3lQEoZ/g5czvbz7
 kqXNhu8E7ApKIXwVQQRDVuPCeu3eOR7MQCZy6O29tHMMeMscLfqFRhx2zv7eetfgTH
 LybYfqRvMdik2GcGqaNVs0X5tk+TeXVxPcvUyMkg24v1Wn8XAIKRcoMWGRrGIIZf9g
 XGE239nKAGihEqgDMU9RYl+iWRwPnvmMwciNGsrUuVPTC479P0GqlFUfSJ44EX/5Bc
 7SQRukcWMOw7Fe4QEqeKFPnfFC9Y65y5eEn+T4mFblqmVZeB2j3tkTyTTTAuvj9IX9
 Lm/fbbxd6K5Dw==
Message-ID: <b2560939-82ef-4d1b-82fd-fa90388c3316@kernel.org>
Date: Mon, 15 Jun 2026 20:05:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260612115839.2065903-2-yangyongpeng.storage@gmail.com>
 <20260612115839.2065903-5-yangyongpeng.storage@gmail.com>
Content-Language: en-US
In-Reply-To: <20260612115839.2065903-5-yangyongpeng.storage@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/12/26 19:58, Yongpeng Yang wrote: > From: Yongpeng Yang
 <yangyongpeng@xiaomi.com> > > Introduce enum extent_access_mode to classify
 how each extent node > is accessed or created (READ, WRITE, PRE [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wZ64l-0002nw-Ay
Subject: Re: [f2fs-dev] [PATCH RESEND 4/5] f2fs: add extent_access_mode to
 track extent cache access patterns
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
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yangyongpeng.storage@gmail.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,m:yangyongpengstorage@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5DEF4685F77

On 6/12/26 19:58, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> Introduce enum extent_access_mode to classify how each extent node
> is accessed or created (READ, WRITE, PRECACHE, TRUNCATE, LARGEST).
> This metadata optimize LRU eviction decisions:

Can you please give some numbers for this change?

> 
> 1. Extents only accessed as the largest extent (never read-hit) are
> deprioritized in the LRU list since reads can still use the largest
> extent directly.
> 
> 2. Sparse single-block write extents that were never merged are moved
> to the head of LRU for earlier reclaim, preserving extents with
> better continuity and higher read-hit probability.
> 
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> ---
>  fs/f2fs/data.c         |  4 ++--
>  fs/f2fs/extent_cache.c | 29 ++++++++++++++++++++++++++++-
>  fs/f2fs/f2fs.h         | 14 +++++++++++++-
>  fs/f2fs/file.c         |  6 ++++--
>  4 files changed, 47 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 9c6440a7db0e..2d38135005fe 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1873,7 +1873,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
>  
>  			f2fs_update_read_extent_cache_range(&dn,
>  				start_pgofs, map->m_pblk + ofs,
> -				map->m_len - ofs);
> +				map->m_len - ofs, EX_ACCESS_PRECACHE);
>  		}
>  	}
>  
> @@ -1919,7 +1919,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
>  			if (map->m_len > ofs)
>  				f2fs_update_read_extent_cache_range(&dn,
>  					start_pgofs, map->m_pblk + ofs,
> -					map->m_len - ofs);
> +					map->m_len - ofs, EX_ACCESS_PRECACHE);
>  		}
>  		if (map->m_next_extent)
>  			*map->m_next_extent = is_hole ? pgofs + 1 : pgofs;
> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> index 82d84c4e98b2..e141ffb64e5f 100644
> --- a/fs/f2fs/extent_cache.c
> +++ b/fs/f2fs/extent_cache.c
> @@ -142,6 +142,7 @@ static void __try_update_largest_extent(struct extent_tree *et,
>  	if (en->ei.len <= et->largest.len)
>  		return;
>  
> +	en->ei.last_access_mode = EX_ACCESS_LARGEST;
>  	et->largest = en->ei;
>  	et->largest_updated = true;
>  }
> @@ -518,6 +519,7 @@ static bool __lookup_extent_tree(struct inode *inode, pgoff_t pgofs,
>  		stat_inc_rbtree_node_hit(sbi, type);
>  
>  	*ei = en->ei;
> +	en->ei.last_access_mode = EX_ACCESS_READ;
>  	spin_lock(&eti->extent_lock);
>  	if (!list_empty(&en->list)) {
>  		list_move_tail(&en->list, &eti->extent_list);
> @@ -624,6 +626,21 @@ static struct extent_node *__insert_extent_tree(struct f2fs_sb_info *sbi,
>  
>  	/* update in global extent list */
>  	spin_lock(&eti->extent_lock);
> +	/*
> +	 * 1. For the largest extent, if subsequent writes are not merged into
> +	 * it, the write path will most likely not use the largest extent_node,
> +	 * while read requests can still access the mapping through the largest
> +	 * extent.
> +	 *
> +	 * 2. For sparse writes, if the extent length is 1 and no extent merging
> +	 * occurs, this extent should be reclaimed with higher priority to avoid
> +	 * evicting extents with better continuity and higher read-hit.
> +	 */
> +	if (et->type == EX_READ && et->cached_en &&
> +		(et->cached_en->ei.last_access_mode == EX_ACCESS_LARGEST ||
> +		 (et->cached_en->ei.len == 1 &&
> +		  et->cached_en->ei.last_access_mode == EX_ACCESS_WRITE)))
> +		list_move(&et->cached_en->list, &eti->extent_list);
>  	list_add_tail(&en->list, &eti->extent_list);
>  	et->cached_en = en;
>  	spin_unlock(&eti->extent_lock);
> @@ -747,6 +764,8 @@ static void __update_extent_tree_range(struct inode *inode,
>  		if (fofs > dei.fofs && (type != EX_READ ||
>  				fofs - dei.fofs >= F2FS_MIN_EXTENT_LEN)) {
>  			en->ei.len = fofs - en->ei.fofs;
> +			if (type == EX_READ)
> +				en->ei.last_access_mode = EX_ACCESS_TRUNCATE;
>  			prev_en = en;
>  			parts = 1;
>  		}
> @@ -761,6 +780,8 @@ static void __update_extent_tree_range(struct inode *inode,
>  					end - dei.fofs + dei.blk, false,
>  					dei.age, dei.last_blocks,
>  					type);
> +				if (type == EX_READ)
> +					ei.last_access_mode = EX_ACCESS_TRUNCATE;
>  				en1 = __insert_extent_tree(sbi, et, &ei,
>  							NULL, NULL, true);
>  				next_en = en1;
> @@ -770,6 +791,8 @@ static void __update_extent_tree_range(struct inode *inode,
>  					en->ei.blk + (end - dei.fofs), true,
>  					dei.age, dei.last_blocks,
>  					type);
> +				if (type == EX_READ)
> +					en->ei.last_access_mode = EX_ACCESS_TRUNCATE;
>  				next_en = en;
>  			}
>  			parts++;
> @@ -808,6 +831,7 @@ static void __update_extent_tree_range(struct inode *inode,
>  	if (tei->blk) {
>  		__set_extent_info(&ei, fofs, len, tei->blk, false,
>  				  0, 0, EX_READ);
> +		ei.last_access_mode = tei->last_access_mode;
>  		if (!__try_merge_extent_node(sbi, et, &ei, prev_en, next_en))
>  			__insert_extent_tree(sbi, et, &ei,
>  					insert_p, insert_parent, leftmost);
> @@ -978,6 +1002,7 @@ static void __update_extent_cache(struct dnode_of_data *dn, enum extent_type typ
>  			ei.blk = NULL_ADDR;
>  		else
>  			ei.blk = dn->data_blkaddr;
> +		ei.last_access_mode = EX_ACCESS_WRITE;
>  	} else if (type == EX_BLOCK_AGE) {
>  		if (__get_new_block_age(dn->inode, &ei, dn->data_blkaddr))
>  			return;
> @@ -1091,12 +1116,14 @@ void f2fs_update_read_extent_cache(struct dnode_of_data *dn)
>  }
>  
>  void f2fs_update_read_extent_cache_range(struct dnode_of_data *dn,
> -				pgoff_t fofs, block_t blkaddr, unsigned int len)
> +				pgoff_t fofs, block_t blkaddr, unsigned int len,
> +				enum extent_access_mode access_mode)
>  {
>  	struct extent_info ei = {
>  		.fofs = fofs,
>  		.len = len,
>  		.blk = blkaddr,
> +		.last_access_mode = access_mode,
>  	};
>  
>  	if (!__may_extent_tree(dn->inode, EX_READ))
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index fffb516b78f4..1588b64d04a3 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -763,6 +763,15 @@ enum extent_type {
>  	NR_EXTENT_CACHES,
>  };
>  
> +/* extent acces mode for cache hit or extent add */
> +enum extent_access_mode {
> +	EX_ACCESS_READ,
> +	EX_ACCESS_WRITE,
> +	EX_ACCESS_PRECACHE,
> +	EX_ACCESS_TRUNCATE,
> +	EX_ACCESS_LARGEST,
> +};
> +
>  /*
>   * Reserved value to mark invalid age extents, hence valid block range
>   * from 0 to ULLONG_MAX-1
> @@ -781,6 +790,8 @@ struct extent_info {
>  			/* physical extent length of compressed blocks */
>  			unsigned int c_len;
>  #endif
> +			/* record last access mode */
> +			enum extent_access_mode last_access_mode;

As we know, memory is expensive, :P, I'd like to know if we can enable this
optionally if there is benefits.

Thanks,


>  		};
>  		/* block age extent_cache */
>  		struct {
> @@ -4577,7 +4588,8 @@ bool f2fs_lookup_read_extent_cache_block(struct inode *inode, pgoff_t index,
>  			block_t *blkaddr);
>  void f2fs_update_read_extent_cache(struct dnode_of_data *dn);
>  void f2fs_update_read_extent_cache_range(struct dnode_of_data *dn,
> -			pgoff_t fofs, block_t blkaddr, unsigned int len);
> +				pgoff_t fofs, block_t blkaddr, unsigned int len,
> +				enum extent_access_mode access_mode);
>  unsigned int f2fs_shrink_read_extent_tree(struct f2fs_sb_info *sbi,
>  			int nr_shrink);
>  
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 633e9ade654f..a3a5d499eadf 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -733,7 +733,8 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
>  		 */
>  		fofs = f2fs_start_bidx_of_node(ofs_of_node(dn->node_folio),
>  							dn->inode) + ofs;
> -		f2fs_update_read_extent_cache_range(dn, fofs, 0, len);
> +		f2fs_update_read_extent_cache_range(dn, fofs, 0, len,
> +							EX_ACCESS_TRUNCATE);
>  		f2fs_update_age_extent_cache_range(dn, fofs, len);
>  		dec_valid_block_count(sbi, dn->inode, nr_free);
>  	}
> @@ -1672,7 +1673,8 @@ static int f2fs_do_zero_range(struct dnode_of_data *dn, pgoff_t start,
>  
>  	if (index > start) {
>  		f2fs_update_read_extent_cache_range(dn, start, 0,
> -							index - start);
> +							index - start,
> +							EX_ACCESS_TRUNCATE);
>  		f2fs_update_age_extent_cache_range(dn, start, index - start);
>  	}
>  



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
