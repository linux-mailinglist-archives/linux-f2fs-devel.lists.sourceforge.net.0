Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C22A5020D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Mar 2025 15:33:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tppoI-00041H-6F;
	Wed, 05 Mar 2025 14:33:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tppoG-00041B-Qv
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Mar 2025 14:33:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=habkmtxbW4H05hMYatQ/OAkb1QCFc+AriNnFHEmiY8g=; b=hS6Js3N3Q6Kq/ZqW0UjVbrnHvA
 uEAD0qLbcXSh1fDTn1VMlicSPYLvYzeG9wPPU16xtmqNPEr7FEkOPrVMbCTfJC9uhyM4fTkYvbqPy
 YHJQl9aZggq2GNQZCFYaAbZIBrw9haIIj4vJXHid1TgfVsbZaVdddVLFF68l4W8bn50U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=habkmtxbW4H05hMYatQ/OAkb1QCFc+AriNnFHEmiY8g=; b=FVD52EcJq2L2SL+xgK0hkts8CS
 +3D/CQxja/IqYQT6h/epDsexGXJ9eqzgheHfZSujeOmwEux7jYwqBvQV8xYgjSY19+v+smHh5ZnZ8
 zEyfF13fAY43hwYk99JxLJh3Cz03vVJAXBrccMciDIRZIjl7Xu2hg64ZO8PnK6YQNwlk=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tppoF-0004Br-2J for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Mar 2025 14:33:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 798EDA457F1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  5 Mar 2025 14:27:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B70FBC4CED1;
 Wed,  5 Mar 2025 14:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741185187;
 bh=xMJaFhhT+0GdGsdZ126ngW0w7y3Be4VvG7zPWmEQJVs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i+BQJ2xv3S/t6Vz7t9/BHJGU3MLl8yb8WakJiwRilIHJRYqrH0ATV0cRMz0MbxoMy
 pWyTT/XUDrFW+hMjJYtVcNcBqtIm5MPDbpyi2Rt/in8KpNhLyXr3l5Pd9437jjtwv2
 TUc4u6ajll1icGQuFkEE6PBo9Ff8x5idDWwobOdlOZG1/oHiHgIUe3wFtncbs+DUmN
 nEfsHLhBivLxZptAQPa8dcM4a6xKxLFg/K20yqix4tno9qLFXrDNWDWEw9LEf17etz
 EZr/OX1c2L6+jhg2+rvuCgqkA25cBXpwJbj6t2Eghl/hycj5+RngwHfqZQn16JK7dI
 fN2wbyBwE2KuQ==
Date: Wed, 5 Mar 2025 14:33:05 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <Z8hgoRHUbdaGxtpz@google.com>
References: <20250305110712.2114200-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250305110712.2114200-1-chao@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Chao, How about disabling nat_bits during mount and removing
 all the relevant codes together? On 03/05, Chao Yu wrote: > It reports that
 there is potential corruption in node footer, > the most suspious feature
 is nat_bits, let's revert recovery > related code. > > Signed-off-by: Chao
 Yu <chao [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tppoF-0004Br-2J
Subject: Re: [f2fs-dev] [PATCH] Revert "f2fs: rebuild nat_bits during umount"
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Chao,

How about disabling nat_bits during mount and removing all the relevant codes
together?

On 03/05, Chao Yu wrote:
> It reports that there is potential corruption in node footer,
> the most suspious feature is nat_bits, let's revert recovery
> related code.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/checkpoint.c |  21 +++------
>  fs/f2fs/f2fs.h       |  32 +++++++++++++-
>  fs/f2fs/node.c       | 101 ++++++++++---------------------------------
>  3 files changed, 59 insertions(+), 95 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index bc9369ea6607..1bc5c2006c56 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1348,21 +1348,13 @@ static void update_ckpt_flags(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>  	struct f2fs_checkpoint *ckpt = F2FS_CKPT(sbi);
>  	unsigned long flags;
>  
> -	if (cpc->reason & CP_UMOUNT) {
> -		if (le32_to_cpu(ckpt->cp_pack_total_block_count) +
> -			NM_I(sbi)->nat_bits_blocks > BLKS_PER_SEG(sbi)) {
> -			clear_ckpt_flags(sbi, CP_NAT_BITS_FLAG);
> -			f2fs_notice(sbi, "Disable nat_bits due to no space");
> -		} else if (!is_set_ckpt_flags(sbi, CP_NAT_BITS_FLAG) &&
> -						f2fs_nat_bitmap_enabled(sbi)) {
> -			f2fs_enable_nat_bits(sbi);
> -			set_ckpt_flags(sbi, CP_NAT_BITS_FLAG);
> -			f2fs_notice(sbi, "Rebuild and enable nat_bits");
> -		}
> -	}
> -
>  	spin_lock_irqsave(&sbi->cp_lock, flags);
>  
> +	if ((cpc->reason & CP_UMOUNT) &&
> +			le32_to_cpu(ckpt->cp_pack_total_block_count) >
> +			sbi->blocks_per_seg - NM_I(sbi)->nat_bits_blocks)
> +		disable_nat_bits(sbi, false);
> +
>  	if (cpc->reason & CP_TRIMMED)
>  		__set_ckpt_flags(ckpt, CP_TRIMMED_FLAG);
>  	else
> @@ -1545,8 +1537,7 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>  	start_blk = __start_cp_next_addr(sbi);
>  
>  	/* write nat bits */
> -	if ((cpc->reason & CP_UMOUNT) &&
> -			is_set_ckpt_flags(sbi, CP_NAT_BITS_FLAG)) {
> +	if (enabled_nat_bits(sbi, cpc)) {
>  		__u64 cp_ver = cur_cp_version(ckpt);
>  		block_t blk;
>  
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 6b4579b05dbf..8d8917b92b5d 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -2231,6 +2231,36 @@ static inline void f2fs_up_write(struct f2fs_rwsem *sem)
>  #endif
>  }
>  
> +static inline void disable_nat_bits(struct f2fs_sb_info *sbi, bool lock)
> +{
> +	unsigned long flags;
> +	unsigned char *nat_bits;
> +
> +	/*
> +	 * In order to re-enable nat_bits we need to call fsck.f2fs by
> +	 * set_sbi_flag(sbi, SBI_NEED_FSCK). But it may give huge cost,
> +	 * so let's rely on regular fsck or unclean shutdown.
> +	 */
> +
> +	if (lock)
> +		spin_lock_irqsave(&sbi->cp_lock, flags);
> +	__clear_ckpt_flags(F2FS_CKPT(sbi), CP_NAT_BITS_FLAG);
> +	nat_bits = NM_I(sbi)->nat_bits;
> +	NM_I(sbi)->nat_bits = NULL;
> +	if (lock)
> +		spin_unlock_irqrestore(&sbi->cp_lock, flags);
> +
> +	kvfree(nat_bits);
> +}
> +
> +static inline bool enabled_nat_bits(struct f2fs_sb_info *sbi,
> +					struct cp_control *cpc)
> +{
> +	bool set = is_set_ckpt_flags(sbi, CP_NAT_BITS_FLAG);
> +
> +	return (cpc) ? (cpc->reason & CP_UMOUNT) && set : set;
> +}
> +
>  static inline void f2fs_lock_op(struct f2fs_sb_info *sbi)
>  {
>  	f2fs_down_read(&sbi->cp_rwsem);
> @@ -3695,7 +3725,6 @@ int f2fs_truncate_inode_blocks(struct inode *inode, pgoff_t from);
>  int f2fs_truncate_xattr_node(struct inode *inode);
>  int f2fs_wait_on_node_pages_writeback(struct f2fs_sb_info *sbi,
>  					unsigned int seq_id);
> -bool f2fs_nat_bitmap_enabled(struct f2fs_sb_info *sbi);
>  int f2fs_remove_inode_page(struct inode *inode);
>  struct page *f2fs_new_inode_page(struct inode *inode);
>  struct page *f2fs_new_node_page(struct dnode_of_data *dn, unsigned int ofs);
> @@ -3723,7 +3752,6 @@ int f2fs_recover_xattr_data(struct inode *inode, struct page *page);
>  int f2fs_recover_inode_page(struct f2fs_sb_info *sbi, struct page *page);
>  int f2fs_restore_node_summary(struct f2fs_sb_info *sbi,
>  			unsigned int segno, struct f2fs_summary_block *sum);
> -void f2fs_enable_nat_bits(struct f2fs_sb_info *sbi);
>  int f2fs_flush_nat_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc);
>  int f2fs_build_node_manager(struct f2fs_sb_info *sbi);
>  void f2fs_destroy_node_manager(struct f2fs_sb_info *sbi);
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 5f512dd5fadf..8c35fd4fa200 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -2311,24 +2311,6 @@ static void __move_free_nid(struct f2fs_sb_info *sbi, struct free_nid *i,
>  	}
>  }
>  
> -bool f2fs_nat_bitmap_enabled(struct f2fs_sb_info *sbi)
> -{
> -	struct f2fs_nm_info *nm_i = NM_I(sbi);
> -	unsigned int i;
> -	bool ret = true;
> -
> -	f2fs_down_read(&nm_i->nat_tree_lock);
> -	for (i = 0; i < nm_i->nat_blocks; i++) {
> -		if (!test_bit_le(i, nm_i->nat_block_bitmap)) {
> -			ret = false;
> -			break;
> -		}
> -	}
> -	f2fs_up_read(&nm_i->nat_tree_lock);
> -
> -	return ret;
> -}
> -
>  static void update_free_nid_bitmap(struct f2fs_sb_info *sbi, nid_t nid,
>  							bool set, bool build)
>  {
> @@ -3010,23 +2992,7 @@ static void __adjust_nat_entry_set(struct nat_entry_set *nes,
>  	list_add_tail(&nes->set_list, head);
>  }
>  
> -static void __update_nat_bits(struct f2fs_nm_info *nm_i, unsigned int nat_ofs,
> -							unsigned int valid)
> -{
> -	if (valid == 0) {
> -		__set_bit_le(nat_ofs, nm_i->empty_nat_bits);
> -		__clear_bit_le(nat_ofs, nm_i->full_nat_bits);
> -		return;
> -	}
> -
> -	__clear_bit_le(nat_ofs, nm_i->empty_nat_bits);
> -	if (valid == NAT_ENTRY_PER_BLOCK)
> -		__set_bit_le(nat_ofs, nm_i->full_nat_bits);
> -	else
> -		__clear_bit_le(nat_ofs, nm_i->full_nat_bits);
> -}
> -
> -static void update_nat_bits(struct f2fs_sb_info *sbi, nid_t start_nid,
> +static void __update_nat_bits(struct f2fs_sb_info *sbi, nid_t start_nid,
>  						struct page *page)
>  {
>  	struct f2fs_nm_info *nm_i = NM_I(sbi);
> @@ -3035,7 +3001,7 @@ static void update_nat_bits(struct f2fs_sb_info *sbi, nid_t start_nid,
>  	int valid = 0;
>  	int i = 0;
>  
> -	if (!is_set_ckpt_flags(sbi, CP_NAT_BITS_FLAG))
> +	if (!enabled_nat_bits(sbi, NULL))
>  		return;
>  
>  	if (nat_index == 0) {
> @@ -3046,36 +3012,17 @@ static void update_nat_bits(struct f2fs_sb_info *sbi, nid_t start_nid,
>  		if (le32_to_cpu(nat_blk->entries[i].block_addr) != NULL_ADDR)
>  			valid++;
>  	}
> -
> -	__update_nat_bits(nm_i, nat_index, valid);
> -}
> -
> -void f2fs_enable_nat_bits(struct f2fs_sb_info *sbi)
> -{
> -	struct f2fs_nm_info *nm_i = NM_I(sbi);
> -	unsigned int nat_ofs;
> -
> -	f2fs_down_read(&nm_i->nat_tree_lock);
> -
> -	for (nat_ofs = 0; nat_ofs < nm_i->nat_blocks; nat_ofs++) {
> -		unsigned int valid = 0, nid_ofs = 0;
> -
> -		/* handle nid zero due to it should never be used */
> -		if (unlikely(nat_ofs == 0)) {
> -			valid = 1;
> -			nid_ofs = 1;
> -		}
> -
> -		for (; nid_ofs < NAT_ENTRY_PER_BLOCK; nid_ofs++) {
> -			if (!test_bit_le(nid_ofs,
> -					nm_i->free_nid_bitmap[nat_ofs]))
> -				valid++;
> -		}
> -
> -		__update_nat_bits(nm_i, nat_ofs, valid);
> +	if (valid == 0) {
> +		__set_bit_le(nat_index, nm_i->empty_nat_bits);
> +		__clear_bit_le(nat_index, nm_i->full_nat_bits);
> +		return;
>  	}
>  
> -	f2fs_up_read(&nm_i->nat_tree_lock);
> +	__clear_bit_le(nat_index, nm_i->empty_nat_bits);
> +	if (valid == NAT_ENTRY_PER_BLOCK)
> +		__set_bit_le(nat_index, nm_i->full_nat_bits);
> +	else
> +		__clear_bit_le(nat_index, nm_i->full_nat_bits);
>  }
>  
>  static int __flush_nat_entry_set(struct f2fs_sb_info *sbi,
> @@ -3094,7 +3041,7 @@ static int __flush_nat_entry_set(struct f2fs_sb_info *sbi,
>  	 * #1, flush nat entries to journal in current hot data summary block.
>  	 * #2, flush nat entries to nat page.
>  	 */
> -	if ((cpc->reason & CP_UMOUNT) ||
> +	if (enabled_nat_bits(sbi, cpc) ||
>  		!__has_cursum_space(journal, set->entry_cnt, NAT_JOURNAL))
>  		to_journal = false;
>  
> @@ -3141,7 +3088,7 @@ static int __flush_nat_entry_set(struct f2fs_sb_info *sbi,
>  	if (to_journal) {
>  		up_write(&curseg->journal_rwsem);
>  	} else {
> -		update_nat_bits(sbi, start_nid, page);
> +		__update_nat_bits(sbi, start_nid, page);
>  		f2fs_put_page(page, 1);
>  	}
>  
> @@ -3172,7 +3119,7 @@ int f2fs_flush_nat_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>  	 * during unmount, let's flush nat_bits before checking
>  	 * nat_cnt[DIRTY_NAT].
>  	 */
> -	if (cpc->reason & CP_UMOUNT) {
> +	if (enabled_nat_bits(sbi, cpc)) {
>  		f2fs_down_write(&nm_i->nat_tree_lock);
>  		remove_nats_in_journal(sbi);
>  		f2fs_up_write(&nm_i->nat_tree_lock);
> @@ -3188,7 +3135,7 @@ int f2fs_flush_nat_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>  	 * entries, remove all entries from journal and merge them
>  	 * into nat entry set.
>  	 */
> -	if (cpc->reason & CP_UMOUNT ||
> +	if (enabled_nat_bits(sbi, cpc) ||
>  		!__has_cursum_space(journal,
>  			nm_i->nat_cnt[DIRTY_NAT], NAT_JOURNAL))
>  		remove_nats_in_journal(sbi);
> @@ -3225,18 +3172,15 @@ static int __get_nat_bitmaps(struct f2fs_sb_info *sbi)
>  	__u64 cp_ver = cur_cp_version(ckpt);
>  	block_t nat_bits_addr;
>  
> +	if (!enabled_nat_bits(sbi, NULL))
> +		return 0;
> +
>  	nm_i->nat_bits_blocks = F2FS_BLK_ALIGN((nat_bits_bytes << 1) + 8);
>  	nm_i->nat_bits = f2fs_kvzalloc(sbi,
>  			F2FS_BLK_TO_BYTES(nm_i->nat_bits_blocks), GFP_KERNEL);
>  	if (!nm_i->nat_bits)
>  		return -ENOMEM;
>  
> -	nm_i->full_nat_bits = nm_i->nat_bits + 8;
> -	nm_i->empty_nat_bits = nm_i->full_nat_bits + nat_bits_bytes;
> -
> -	if (!is_set_ckpt_flags(sbi, CP_NAT_BITS_FLAG))
> -		return 0;
> -
>  	nat_bits_addr = __start_cp_addr(sbi) + BLKS_PER_SEG(sbi) -
>  						nm_i->nat_bits_blocks;
>  	for (i = 0; i < nm_i->nat_bits_blocks; i++) {
> @@ -3253,12 +3197,13 @@ static int __get_nat_bitmaps(struct f2fs_sb_info *sbi)
>  
>  	cp_ver |= (cur_cp_crc(ckpt) << 32);
>  	if (cpu_to_le64(cp_ver) != *(__le64 *)nm_i->nat_bits) {
> -		clear_ckpt_flags(sbi, CP_NAT_BITS_FLAG);
> -		f2fs_notice(sbi, "Disable nat_bits due to incorrect cp_ver (%llu, %llu)",
> -			cp_ver, le64_to_cpu(*(__le64 *)nm_i->nat_bits));
> +		disable_nat_bits(sbi, true);
>  		return 0;
>  	}
>  
> +	nm_i->full_nat_bits = nm_i->nat_bits + 8;
> +	nm_i->empty_nat_bits = nm_i->full_nat_bits + nat_bits_bytes;
> +
>  	f2fs_notice(sbi, "Found nat_bits in checkpoint");
>  	return 0;
>  }
> @@ -3269,7 +3214,7 @@ static inline void load_free_nid_bitmap(struct f2fs_sb_info *sbi)
>  	unsigned int i = 0;
>  	nid_t nid, last_nid;
>  
> -	if (!is_set_ckpt_flags(sbi, CP_NAT_BITS_FLAG))
> +	if (!enabled_nat_bits(sbi, NULL))
>  		return;
>  
>  	for (i = 0; i < nm_i->nat_blocks; i++) {
> -- 
> 2.48.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
