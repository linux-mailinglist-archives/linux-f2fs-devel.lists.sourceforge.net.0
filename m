Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91328AD544A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Jun 2025 13:43:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4w0+sRhjgUQXOWOAJeLUDJIKDiyn2ExMset9LDTH1Xc=; b=dq21QYcENw4q3aoHLI3+wIc3J8
	jms+jWJOoYfEfChTAYRguLYHnlqXrGm8DkCEt9TP1JI9/yzPZO7RQ1vVr72zHfSn4XYWYWbWdHTf7
	+fQuEQNZY4Txf01MYJSOKP3FAS8SF7Ef7p9GUPZzvh+BzGQp44NiCikORWa89haI39oo=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPJr3-0000OK-Rb;
	Wed, 11 Jun 2025 11:42:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uPJr1-0000OD-Lg
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jun 2025 11:42:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C9GIjb+NYDVPJR6A7/uUjHk01P6P/ieYqP3PHzY/H2g=; b=khgRUznOqXw29aXT/9IQo5CEPN
 Qs8ce9B/VHW1YG+QuVjFCeyTGjT1NKlYpsv4hdyuhpV5q6b/nRSehbbM477uh6IkQqsF7810X7PtT
 bGQ86tYvBpoNviUo6pAmC1M4b/lJiMAR45Ul3Iei/HWZwd3Fuw8czS0124MR00Bno2lQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C9GIjb+NYDVPJR6A7/uUjHk01P6P/ieYqP3PHzY/H2g=; b=OFR9/Ic7pMP7ucx5+A8WK7aEGq
 rCes5a6C6Kd5jqKci6IOPHzc667ATUbTghQoLbQVk6PNy86ixu28vIEtGEOZk8tDHLx4TyPY2pxcg
 O/7xiwqt1mfU5y90uuRZ5YS/9Is0zhJZD8hNfdYWM5wN+3cfhopoT4+LwVmXt6g33sCE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uPJr0-00029i-Tp for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jun 2025 11:42:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D638F5C464A;
 Wed, 11 Jun 2025 11:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28ABEC4CEF1;
 Wed, 11 Jun 2025 11:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749642165;
 bh=QoUf94qvO1VE6p9VZa/RcosEz6ZL2E3t4U2OvJ5KuPw=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=criMSsKnSR2aLFf/kasl2DEjMXDUrXgG2+AFut9u/bcmQbjyeHwZPeayGggHXlyeH
 gajPt2Rh4m27P6Ia3eQVlbdZeg2lrv3VIuvcueaiNmeDmdWvPHSEiSnOHH22n/l46w
 BiNd58aCXqZNjVrnS9ekC8iMrJbbYwWyU1oKRxeiZl0z7h2YYTsA/L1SxFW3m5x3Ub
 0PcsztRDjX7qAGdQZ+NO9TF9dOQ95Qzkvh8yr0T6o1xaop3MYuaLbeZ7VREaxEhfuU
 vykdsF+74UzFk5zeDUu4ycNVs/hdRrrT/Y1z5JKiay6XbiM3zlIq9316XeRFAuEomO
 cdFJRNcHWfOTw==
Message-ID: <e60e5264-3365-4a23-b8a6-968a3692c155@kernel.org>
Date: Wed, 11 Jun 2025 19:42:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sheng Yong <shengyong2021@gmail.com>, jaegeuk@kernel.org
References: <20250610123743.667183-1-shengyong1@xiaomi.com>
 <20250610123743.667183-8-shengyong1@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20250610123743.667183-8-shengyong1@xiaomi.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/10/25 20:37,
 Sheng Yong wrote: > From: Sheng Yong <shengyong1@xiaomi.com>
 > > Previously when injecting sit/nat entry, we only inject SIT/NAT pack.
 > If the valid target is in journal, the inject [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uPJr0-00029i-Tp
Subject: Re: [f2fs-dev] [RFC PATCH v2 07/32] inject.f2fs: fix injecting
 sit/nat in journal
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
Cc: shengyong1@xiaomi.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 6/10/25 20:37, Sheng Yong wrote:
> From: Sheng Yong <shengyong1@xiaomi.com>
> 
> Previously when injecting sit/nat entry, we only inject SIT/NAT pack.
> If the valid target is in journal, the injection has no effect. So we
> have to check whether the valid target is in journal, and inject the
> target at its valid position.
> 
> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
> ---
>  fsck/inject.c | 181 ++++++++++++++++++++++++++++++++++++--------------
>  1 file changed, 132 insertions(+), 49 deletions(-)
> 
> diff --git a/fsck/inject.c b/fsck/inject.c
> index bd6ab8480972..b3228621de48 100644
> --- a/fsck/inject.c
> +++ b/fsck/inject.c
> @@ -10,6 +10,7 @@
>   */
>  
>  #include <getopt.h>
> +#include "f2fs.h"
>  #include "node.h"
>  #include "inject.h"
>  
> @@ -533,6 +534,31 @@ out:
>  	return ret;
>  }
>  
> +static void rewrite_nat_in_journal(struct f2fs_sb_info *sbi, u32 nid,
> +				   struct f2fs_nat_entry *nat)
> +{
> +	struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
> +	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_HOT_DATA);
> +	struct f2fs_journal *journal = F2FS_SUMMARY_BLOCK_JOURNAL(curseg->sum_blk);
> +	block_t blkaddr;
> +	int ret, i;
> +
> +	for (i = 0; i < nats_in_cursum(journal); i++) {
> +		if (nid_in_journal(journal, i) == nid) {
> +			memcpy(&nat_in_journal(journal, i), nat, sizeof(*nat));
> +			break;
> +		}
> +	}
> +
> +	if (is_set_ckpt_flags(cp, CP_UMOUNT_FLAG))
> +		blkaddr = sum_blk_addr(sbi, NR_CURSEG_TYPE, CURSEG_HOT_DATA);
> +	else
> +		blkaddr = sum_blk_addr(sbi, NR_CURSEG_DATA_TYPE, CURSEG_HOT_DATA);
> +
> +	ret = dev_write_block(curseg->sum_blk, blkaddr, WRITE_LIFE_NONE);
> +	ASSERT(ret >= 0);
> +}
> +
>  static int inject_nat(struct f2fs_sb_info *sbi, struct inject_option *opt)
>  {
>  	struct f2fs_nm_info *nm_i = NM_I(sbi);
> @@ -541,7 +567,7 @@ static int inject_nat(struct f2fs_sb_info *sbi, struct inject_option *opt)
>  	struct f2fs_nat_entry *ne;
>  	block_t blk_addr;
>  	unsigned int offs;
> -	bool is_set;
> +	bool is_set, in_journal = false;
>  	int ret;
>  
>  	if (!IS_VALID_NID(sbi, opt->nid)) {
> @@ -555,38 +581,49 @@ static int inject_nat(struct f2fs_sb_info *sbi, struct inject_option *opt)
>  	nat_blk = calloc(F2FS_BLKSIZE, 1);
>  	ASSERT(nat_blk);
>  
> -	/* change NAT version bitmap temporarily to select specified pack */
> -	is_set = f2fs_test_bit(opt->nid, nm_i->nat_bitmap);
> -	if (opt->nat == 0) {
> -		opt->nat = is_set ? 2 : 1;
> +	if (lookup_nat_in_journal(sbi, opt->nid, &nat_blk->entries[0]) >= 0) {

Yong,

If we found an existed nat entry in journal, what about getting log_type
from return value of lookup_nat_in_journal, and then call
rewrite_nat_in_journal(, log_type) to rewrite nat entry to original position?

> +		offs = 0;
> +		in_journal = true;
>  	} else {
> -		if (opt->nat == 1)
> -			f2fs_clear_bit(opt->nid, nm_i->nat_bitmap);
> -		else
> -			f2fs_set_bit(opt->nid, nm_i->nat_bitmap);
> +		/*
> +		 * read nat entry from NAT area, change NAT version bitmap
> +		 * temporarily to select specified pack
> +		 */
> +		is_set = f2fs_test_bit(opt->nid, nm_i->nat_bitmap);
> +		if (opt->nat == 0) {
> +			opt->nat = is_set ? 2 : 1;
> +		} else {
> +			if (opt->nat == 1)
> +				f2fs_clear_bit(opt->nid, nm_i->nat_bitmap);
> +			else
> +				f2fs_set_bit(opt->nid, nm_i->nat_bitmap);
> +		}
> +		blk_addr = current_nat_addr(sbi, opt->nid, NULL);
> +		ret = dev_read_block(nat_blk, blk_addr);
> +		ASSERT(ret >= 0);
> +		offs = opt->nid % NAT_ENTRY_PER_BLOCK;
>  	}
> -
> -	blk_addr = current_nat_addr(sbi, opt->nid, NULL);
> -
> -	ret = dev_read_block(nat_blk, blk_addr);
> -	ASSERT(ret >= 0);
> -
> -	offs = opt->nid % NAT_ENTRY_PER_BLOCK;
>  	ne = &nat_blk->entries[offs];
>  
>  	if (!strcmp(opt->mb, "version")) {
>  		MSG(0, "Info: inject nat entry version of nid %u "
> -		    "in pack %d: %d -> %d\n", opt->nid, opt->nat,
> +		    "in %s %d: %d -> %d\n", opt->nid,
> +		    in_journal ? "journal" : "pack",
> +		    in_journal ? 0 : opt->nat,
>  		    ne->version, (u8)opt->val);
>  		ne->version = (u8)opt->val;
>  	} else if (!strcmp(opt->mb, "ino")) {
>  		MSG(0, "Info: inject nat entry ino of nid %u "
> -		    "in pack %d: %d -> %d\n", opt->nid, opt->nat,
> +		    "in %s %d: %d -> %d\n", opt->nid,
> +		    in_journal ? "journal" : "pack",
> +		    in_journal ? 0 : opt->nat,
>  		    le32_to_cpu(ne->ino), (nid_t)opt->val);
>  		ne->ino = cpu_to_le32((nid_t)opt->val);
>  	} else if (!strcmp(opt->mb, "block_addr")) {
>  		MSG(0, "Info: inject nat entry block_addr of nid %u "
> -		    "in pack %d: 0x%x -> 0x%x\n", opt->nid, opt->nat,
> +		    "in %s %d: 0x%x -> 0x%x\n", opt->nid,
> +		    in_journal ? "journal" : "pack",
> +		    in_journal ? 0 : opt->nat,
>  		    le32_to_cpu(ne->block_addr), (block_t)opt->val);
>  		ne->block_addr = cpu_to_le32((block_t)opt->val);
>  	} else {
> @@ -596,16 +633,45 @@ static int inject_nat(struct f2fs_sb_info *sbi, struct inject_option *opt)
>  	}
>  	print_raw_nat_entry_info(ne);
>  
> -	ret = dev_write_block(nat_blk, blk_addr, WRITE_LIFE_NONE);
> -	ASSERT(ret >= 0);
> -	/* restore NAT version bitmap */
> -	if (is_set)
> -		f2fs_set_bit(opt->nid, nm_i->nat_bitmap);
> -	else
> -		f2fs_clear_bit(opt->nid, nm_i->nat_bitmap);
> +	if (in_journal) {
> +		rewrite_nat_in_journal(sbi, opt->nid, ne);
> +	} else {
> +		ret = dev_write_block(nat_blk, blk_addr, WRITE_LIFE_NONE);
> +		ASSERT(ret >= 0);
> +		/* restore NAT version bitmap */
> +		if (is_set)
> +			f2fs_set_bit(opt->nid, nm_i->nat_bitmap);
> +		else
> +			f2fs_clear_bit(opt->nid, nm_i->nat_bitmap);
> +	}
>  
>  	free(nat_blk);
> -	return ret;
> +	return 0;
> +}
> +
> +static void rewrite_sit_in_journal(struct f2fs_sb_info *sbi, unsigned int segno,
> +				   struct f2fs_sit_entry *sit)
> +{
> +	struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
> +	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_COLD_DATA);
> +	struct f2fs_journal *journal = F2FS_SUMMARY_BLOCK_JOURNAL(curseg->sum_blk);
> +	block_t blkaddr;
> +	int ret, i;
> +
> +	for (i = 0; i < sits_in_cursum(journal); i++) {
> +		if (segno_in_journal(journal, i) == segno) {
> +			memcpy(&sit_in_journal(journal, i), sit, sizeof(*sit));
> +			break;
> +		}
> +	}
> +
> +	if (is_set_ckpt_flags(cp, CP_UMOUNT_FLAG))
> +		blkaddr = sum_blk_addr(sbi, NR_CURSEG_TYPE, CURSEG_COLD_DATA);
> +	else
> +		blkaddr = sum_blk_addr(sbi, NR_CURSEG_DATA_TYPE, CURSEG_COLD_DATA);
> +
> +	ret = dev_write_block(curseg->sum_blk, blkaddr, WRITE_LIFE_NONE);
> +	ASSERT(ret >= 0);
>  }
>  
>  static int inject_sit(struct f2fs_sb_info *sbi, struct inject_option *opt)
> @@ -614,7 +680,7 @@ static int inject_sit(struct f2fs_sb_info *sbi, struct inject_option *opt)
>  	struct f2fs_sit_block *sit_blk;
>  	struct f2fs_sit_entry *sit;
>  	unsigned int segno, offs;
> -	bool is_set;
> +	bool is_set, in_journal = false;
>  
>  	if (!f2fs_is_valid_blkaddr(sbi, opt->blk, DATA_GENERIC)) {
>  		ERR_MSG("Invalid blkaddr 0x%x (valid range [0x%x:0x%lx])\n",
> @@ -627,29 +693,39 @@ static int inject_sit(struct f2fs_sb_info *sbi, struct inject_option *opt)
>  	ASSERT(sit_blk);
>  
>  	segno = GET_SEGNO(sbi, opt->blk);
> -	/* change SIT version bitmap temporarily to select specified pack */
> -	is_set = f2fs_test_bit(segno, sit_i->sit_bitmap);
> -	if (opt->sit == 0) {
> -		opt->sit = is_set ? 2 : 1;
> +	if (lookup_sit_in_journal(sbi, segno, &sit_blk->entries[0]) >= 0) {

Ditto,

Thanks,

> +		offs = 0;
> +		in_journal = true;
>  	} else {
> -		if (opt->sit == 1)
> -			f2fs_clear_bit(segno, sit_i->sit_bitmap);
> -		else
> -			f2fs_set_bit(segno, sit_i->sit_bitmap);
> +		/*
> +		 * read sit entry from SIT area, change SIT version bitmap
> +		 * temporarily to select specified pack
> +		 */
> +		is_set = f2fs_test_bit(segno, sit_i->sit_bitmap);
> +		if (opt->sit == 0) {
> +			opt->sit = is_set ? 2 : 1;
> +		} else {
> +			if (opt->sit == 1)
> +				f2fs_clear_bit(segno, sit_i->sit_bitmap);
> +			else
> +				f2fs_set_bit(segno, sit_i->sit_bitmap);
> +		}
> +		get_current_sit_page(sbi, segno, sit_blk);
> +		offs = SIT_ENTRY_OFFSET(sit_i, segno);
>  	}
> -	get_current_sit_page(sbi, segno, sit_blk);
> -	offs = SIT_ENTRY_OFFSET(sit_i, segno);
>  	sit = &sit_blk->entries[offs];
>  
>  	if (!strcmp(opt->mb, "vblocks")) {
>  		MSG(0, "Info: inject sit entry vblocks of block 0x%x "
> -		    "in pack %d: %u -> %u\n", opt->blk, opt->sit,
> +		    "in %s %d: %u -> %u\n", opt->blk,
> +		    in_journal ? "journal" : "pack",
> +		    in_journal ? 0 : opt->sit,
>  		    le16_to_cpu(sit->vblocks), (u16)opt->val);
>  		sit->vblocks = cpu_to_le16((u16)opt->val);
>  	} else if (!strcmp(opt->mb, "valid_map")) {
>  		if (opt->idx == -1) {
> -			MSG(0, "Info: auto idx = %u\n", offs);
> -			opt->idx = offs;
> +			opt->idx = OFFSET_IN_SEG(sbi, opt->blk);
> +			MSG(0, "Info: auto idx = %u\n", opt->idx);
>  		}
>  		if (opt->idx >= SIT_VBLOCK_MAP_SIZE) {
>  			ERR_MSG("invalid idx %u of valid_map[]\n", opt->idx);
> @@ -657,8 +733,10 @@ static int inject_sit(struct f2fs_sb_info *sbi, struct inject_option *opt)
>  			return -ERANGE;
>  		}
>  		MSG(0, "Info: inject sit entry valid_map[%d] of block 0x%x "
> -		    "in pack %d: 0x%02x -> 0x%02x\n", opt->idx, opt->blk,
> -		    opt->sit, sit->valid_map[opt->idx], (u8)opt->val);
> +		    "in %s %d: 0x%02x -> 0x%02x\n", opt->idx, opt->blk,
> +		    in_journal ? "journal" : "pack",
> +		    in_journal ? 0 : opt->sit,
> +		    sit->valid_map[opt->idx], (u8)opt->val);
>  		sit->valid_map[opt->idx] = (u8)opt->val;
>  	} else if (!strcmp(opt->mb, "mtime")) {
>  		MSG(0, "Info: inject sit entry mtime of block 0x%x "
> @@ -672,12 +750,17 @@ static int inject_sit(struct f2fs_sb_info *sbi, struct inject_option *opt)
>  	}
>  	print_raw_sit_entry_info(sit);
>  
> -	rewrite_current_sit_page(sbi, segno, sit_blk);
> -	/* restore SIT version bitmap */
> -	if (is_set)
> -		f2fs_set_bit(segno, sit_i->sit_bitmap);
> -	else
> -		f2fs_clear_bit(segno, sit_i->sit_bitmap);
> +	if (in_journal) {
> +		rewrite_sit_in_journal(sbi, segno, sit);
> +	} else {
> +		rewrite_current_sit_page(sbi, segno, sit_blk);
> +
> +		/* restore SIT version bitmap */
> +		if (is_set)
> +			f2fs_set_bit(segno, sit_i->sit_bitmap);
> +		else
> +			f2fs_clear_bit(segno, sit_i->sit_bitmap);
> +	}
>  
>  	free(sit_blk);
>  	return 0;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
