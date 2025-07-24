Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 410AAB1005A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Jul 2025 08:00:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZL9JIxONEs1ybmeWnnAWhF75W4FSYQvSyp9EsDJ911k=; b=L/1Subkfem1JUVb2cNogllUKXD
	Y9jpsR2T6ZbiUAYGP1u02TwxAFCJqJnMCQc3V8RekBiuECuilEM1TWeZ/zBQlLxCLuLXxplz8W4Fv
	4qaeNqCkCyXedh9Dp3Rcs/KuOszYFIooVOMU/8BPohEr5n643aeqx0c1rLGZaUkufd5M=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uep0X-0001wW-SO;
	Thu, 24 Jul 2025 06:00:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uep0W-0001wQ-Ks
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 06:00:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=80lTQZbeN58f0xChtMvbGARADZjDJcX9ZgZmXimSMZI=; b=gXqGCUjUnVFR1rqoWW/uCmuTX6
 2M/J50RnxDO29gRS3Ev5qVJ/GVK+r0mUFZMC4QV9mJTWrEXAiGsyoIYgouPiEJq8FPC6S5z4rg51W
 p3kAoCN/Xnck5vgAGC6nDxS+whZGbAA6LgLAUgDKTDU/KUcfx70Jr+h7PyPEPkhaLuj4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=80lTQZbeN58f0xChtMvbGARADZjDJcX9ZgZmXimSMZI=; b=VV3L8UX1sc7Xf0mD1d7b2a4LeS
 4pTgg8pDQw+nkt9MbdeKKsCkzil2PliQoqld1D1JXgAdIC1TGZpcDzf6o4eKKRXEWQMmysM0n84La
 KgOI6TSp75k2xb9s1mM6Ki8/Y3jiYczGAkUkuxlUogOu7TiYqNsKPTM5VZoH02FvTLVw=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uep0W-0007ks-0O for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 06:00:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 594CFA55E7C;
 Thu, 24 Jul 2025 06:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03F19C4CEED;
 Thu, 24 Jul 2025 06:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753336838;
 bh=ZJDG4pk/q5OXiUjzggS/Usi6EspHl53ixtWjfVmGpx4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=FupX6TPYJ1DbiNMZX9ShqDgMuP1fmN6GPp8gN6MkEfGh5r+jeapc4h+2HTxwCiSog
 a50IST3UkVKM+xnyMHVqYwkdKL0hXuYj9XZRX9U9AhbelgMZRmNuuG5fdCzhMWruRN
 /qLYaPu78pCcPIZR9vweGGTX9QJICL9bQV6TitTqYSYxhfibeBPPC5BWBsmtqggkqa
 +4M5NCpqoWXNszHGbvThkR3M4YfD8NPMRNrscYp1ks6agj8BHBoxg7cRB52BLzwan6
 0nu4PJRkJFWPDIb304+szMMNSQBpk/x2V9hXEB+61Qzb10S85ZjqamAr6LZpdaAihV
 OQe6mUzwE5Ecw==
Message-ID: <b17f5401-0462-42c7-8fef-0875814d1064@kernel.org>
Date: Thu, 24 Jul 2025 14:00:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wangzijie <wangzijie1@honor.com>, jaegeuk@kernel.org
References: <20250722143628.430776-1-wangzijie1@honor.com>
Content-Language: en-US
In-Reply-To: <20250722143628.430776-1-wangzijie1@honor.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/22/25 22:36,
 wangzijie wrote: > __lookup_nat_cache follows
 LRU manner to move clean nat entry, when nat > entries are going to be dirty, 
 no need to move them to tail of lru list. > Introduce a pa [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
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
X-Headers-End: 1uep0W-0007ks-0O
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: avoid redundant clean nat entry
 move in lru list
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
Cc: linux-kernel@vger.kernel.org, feng.han@honor.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/22/25 22:36, wangzijie wrote:
> __lookup_nat_cache follows LRU manner to move clean nat entry, when nat
> entries are going to be dirty, no need to move them to tail of lru list.
> Introduce a parameter 'for_dirty' to avoid it.
> 
> Signed-off-by: wangzijie <wangzijie1@honor.com>
> ---
> v2:
> - followed by Jaegeuk's suggestion to add a parameter in __lookup_nat_cache
> ---
>  fs/f2fs/node.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 76aba1961..a23db6238 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -204,14 +204,14 @@ static struct nat_entry *__init_nat_entry(struct f2fs_nm_info *nm_i,
>  	return ne;
>  }
>  
> -static struct nat_entry *__lookup_nat_cache(struct f2fs_nm_info *nm_i, nid_t n)
> +static struct nat_entry *__lookup_nat_cache(struct f2fs_nm_info *nm_i, nid_t n, bool for_dirty)
>  {
>  	struct nat_entry *ne;
>  
>  	ne = radix_tree_lookup(&nm_i->nat_root, n);
>  
> -	/* for recent accessed nat entry, move it to tail of lru list */
> -	if (ne && !get_nat_flag(ne, IS_DIRTY)) {
> +	/* for recent accessed(not used to set dirty) nat entry, move it to tail of lru list */

What do you think of this?

	/*
	 * for recent accessed nat entry which will not be dirtied soon
	 * later, move it to tail of lru list.
	 */

Thanks,

> +	if (ne && !get_nat_flag(ne, IS_DIRTY) && !for_dirty) {
>  		spin_lock(&nm_i->nat_list_lock);
>  		if (!list_empty(&ne->list))
>  			list_move_tail(&ne->list, &nm_i->nat_entries);
> @@ -383,7 +383,7 @@ int f2fs_need_dentry_mark(struct f2fs_sb_info *sbi, nid_t nid)
>  	bool need = false;
>  
>  	f2fs_down_read(&nm_i->nat_tree_lock);
> -	e = __lookup_nat_cache(nm_i, nid);
> +	e = __lookup_nat_cache(nm_i, nid, false);
>  	if (e) {
>  		if (!get_nat_flag(e, IS_CHECKPOINTED) &&
>  				!get_nat_flag(e, HAS_FSYNCED_INODE))
> @@ -400,7 +400,7 @@ bool f2fs_is_checkpointed_node(struct f2fs_sb_info *sbi, nid_t nid)
>  	bool is_cp = true;
>  
>  	f2fs_down_read(&nm_i->nat_tree_lock);
> -	e = __lookup_nat_cache(nm_i, nid);
> +	e = __lookup_nat_cache(nm_i, nid, false);
>  	if (e && !get_nat_flag(e, IS_CHECKPOINTED))
>  		is_cp = false;
>  	f2fs_up_read(&nm_i->nat_tree_lock);
> @@ -414,7 +414,7 @@ bool f2fs_need_inode_block_update(struct f2fs_sb_info *sbi, nid_t ino)
>  	bool need_update = true;
>  
>  	f2fs_down_read(&nm_i->nat_tree_lock);
> -	e = __lookup_nat_cache(nm_i, ino);
> +	e = __lookup_nat_cache(nm_i, ino, false);
>  	if (e && get_nat_flag(e, HAS_LAST_FSYNC) &&
>  			(get_nat_flag(e, IS_CHECKPOINTED) ||
>  			 get_nat_flag(e, HAS_FSYNCED_INODE)))
> @@ -439,7 +439,7 @@ static void cache_nat_entry(struct f2fs_sb_info *sbi, nid_t nid,
>  		return;
>  
>  	f2fs_down_write(&nm_i->nat_tree_lock);
> -	e = __lookup_nat_cache(nm_i, nid);
> +	e = __lookup_nat_cache(nm_i, nid, false);
>  	if (!e)
>  		e = __init_nat_entry(nm_i, new, ne, false);
>  	else
> @@ -460,7 +460,7 @@ static void set_node_addr(struct f2fs_sb_info *sbi, struct node_info *ni,
>  	struct nat_entry *new = __alloc_nat_entry(sbi, ni->nid, true);
>  
>  	f2fs_down_write(&nm_i->nat_tree_lock);
> -	e = __lookup_nat_cache(nm_i, ni->nid);
> +	e = __lookup_nat_cache(nm_i, ni->nid, true);
>  	if (!e) {
>  		e = __init_nat_entry(nm_i, new, NULL, true);
>  		copy_node_info(&e->ni, ni);
> @@ -502,7 +502,7 @@ static void set_node_addr(struct f2fs_sb_info *sbi, struct node_info *ni,
>  
>  	/* update fsync_mark if its inode nat entry is still alive */
>  	if (ni->nid != ni->ino)
> -		e = __lookup_nat_cache(nm_i, ni->ino);
> +		e = __lookup_nat_cache(nm_i, ni->ino, false);
>  	if (e) {
>  		if (fsync_done && ni->nid == ni->ino)
>  			set_nat_flag(e, HAS_FSYNCED_INODE, true);
> @@ -562,7 +562,7 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
>  retry:
>  	/* Check nat cache */
>  	f2fs_down_read(&nm_i->nat_tree_lock);
> -	e = __lookup_nat_cache(nm_i, nid);
> +	e = __lookup_nat_cache(nm_i, nid, false);
>  	if (e) {
>  		ni->ino = nat_get_ino(e);
>  		ni->blk_addr = nat_get_blkaddr(e);
> @@ -2371,7 +2371,7 @@ static bool add_free_nid(struct f2fs_sb_info *sbi,
>  		 *   - __remove_nid_from_list(PREALLOC_NID)
>  		 *                         - __insert_nid_to_list(FREE_NID)
>  		 */
> -		ne = __lookup_nat_cache(nm_i, nid);
> +		ne = __lookup_nat_cache(nm_i, nid, false);
>  		if (ne && (!get_nat_flag(ne, IS_CHECKPOINTED) ||
>  				nat_get_blkaddr(ne) != NULL_ADDR))
>  			goto err_out;
> @@ -2936,7 +2936,7 @@ static void remove_nats_in_journal(struct f2fs_sb_info *sbi)
>  
>  		raw_ne = nat_in_journal(journal, i);
>  
> -		ne = __lookup_nat_cache(nm_i, nid);
> +		ne = __lookup_nat_cache(nm_i, nid, true);
>  		if (!ne) {
>  			ne = __alloc_nat_entry(sbi, nid, true);
>  			__init_nat_entry(nm_i, ne, &raw_ne, true);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
