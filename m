Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E9B321926
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Feb 2021 14:43:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lEBV3-0001rn-79; Mon, 22 Feb 2021 13:43:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1lEBV2-0001rb-De
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Feb 2021 13:43:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3D+tN6kURIzinZF+xLb37liJsTEdbWeXjABR3Q7cZ1o=; b=Ag17LytlsLz3QxqSCaUraerJmz
 oFZ88eOCVMxdq/Res1uKVOgupzhyzjmya+X/uStyTyf0k05HQZTLtPphoPuUx736RVLnEkshTtnQg
 x5hfC8TFBwdzTLGEIBxT88iJ+T2VhZPgBtizQ7YWZnffxJQH3Gm1F63nia6Nw3jbK2t4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3D+tN6kURIzinZF+xLb37liJsTEdbWeXjABR3Q7cZ1o=; b=OMmI+m8q8PVqKaTSztDJ71vVEl
 T3hdBOkJ9Z1RYjrRTfsHS4J+Dc/NWgoXJGQDxgrb1dpMnm3+Q8RAd7Lj6OW00W2Xatsl+y2FFLB5o
 NnZ4s1AXUzg0Qvo//jAsDDoPm1yqkoHI87wNXFDCtbHqwPxnX3AB53AjhdHtbewrN2qs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lEBUx-0007FX-Je
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Feb 2021 13:43:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 965E464DD0;
 Mon, 22 Feb 2021 13:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614001412;
 bh=Bf/NcxIpzK9yRb/+rvFnNaliEbQA1RDoY0uXTNr/qZs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=nAipNCVxTEd6U6LBtKFH3B3Xcu5OcRHp+V4e8FxfyDWugzlsfSi5x+fcbI/x+2CIQ
 K5lxHmePufQUP6Qxe3Egsuj+HOcNKNaQpu6zSc3glKXrtf14EEjVkRT6isTOdQm8Fk
 UaY/5S3UK4sOSuwGevvz0GvimmBtsEQQjYcstHndowkORQe8A3QxZOyf31aglcjsDi
 2Dy/tUN8HItsmd5QrRP5sivyNBPi/YvH7jX4YvnREXBl2Wqc2JQPIaWbtJSnwsVWA8
 K4ZCDFx2WtObP5rXEnSADOGJNC1nw+7kSdknOXFuMD+oae6n+uwOXbbWmeWgE52Hes
 C4x2kbRjGLyuQ==
To: Chao Yu <yuchao0@huawei.com>, jaegeuk@kernel.org
References: <20210220094052.64905-1-yuchao0@huawei.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <ad627dde-23f9-cbbc-ce58-7c799161f290@kernel.org>
Date: Mon, 22 Feb 2021 21:43:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210220094052.64905-1-yuchao0@huawei.com>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lEBUx-0007FX-Je
Subject: Re: [f2fs-dev] [PATCH RFC] f2fs: fix to avoid selecting full
 segment w/ {AT, }SSR allocator
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

Ping,

On 2021/2/20 17:40, Chao Yu wrote:
> In cp disabling mode, there could be a condition
> - target segment has 128 ckpt valid blocks
> - GC migrates 128 valid blocks to other segment (segment is still in
> dirty list)
> - GC migrates 384 blocks to target segment (segment has 128 cp_vblocks
> and 384 vblocks)
> - If GC selects target segment via {AT,}SSR allocator, however there is
> no free space in targe segment.
> 
> Fixes: 4354994f097d ("f2fs: checkpoint disabling")
> Fixes: 093749e296e2 ("f2fs: support age threshold based garbage collection")
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>   fs/f2fs/f2fs.h    |  1 +
>   fs/f2fs/gc.c      | 17 +++++++++++++----
>   fs/f2fs/segment.c | 20 ++++++++++++++++++++
>   3 files changed, 34 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index ed7807103c8e..9c753eff0814 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3376,6 +3376,7 @@ block_t f2fs_get_unusable_blocks(struct f2fs_sb_info *sbi);
>   int f2fs_disable_cp_again(struct f2fs_sb_info *sbi, block_t unusable);
>   void f2fs_release_discard_addrs(struct f2fs_sb_info *sbi);
>   int f2fs_npages_for_summary_flush(struct f2fs_sb_info *sbi, bool for_ra);
> +bool segment_has_free_slot(struct f2fs_sb_info *sbi, int segno);
>   void f2fs_init_inmem_curseg(struct f2fs_sb_info *sbi);
>   void f2fs_save_inmem_curseg(struct f2fs_sb_info *sbi);
>   void f2fs_restore_inmem_curseg(struct f2fs_sb_info *sbi);
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 86ba8ed0b8a7..a1d8062cdace 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -392,10 +392,6 @@ static void add_victim_entry(struct f2fs_sb_info *sbi,
>   		if (p->gc_mode == GC_AT &&
>   			get_valid_blocks(sbi, segno, true) == 0)
>   			return;
> -
> -		if (p->alloc_mode == AT_SSR &&
> -			get_seg_entry(sbi, segno)->ckpt_valid_blocks == 0)
> -			return;
>   	}
>   
>   	for (i = 0; i < sbi->segs_per_sec; i++)
> @@ -736,6 +732,19 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
>   		if (gc_type == BG_GC && test_bit(secno, dirty_i->victim_secmap))
>   			goto next;
>   
> +		if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
> +			/*
> +			 * to avoid selecting candidate which has below valid
> +			 * block distribution:
> +			 * partial blocks are valid and all left ones are valid
> +			 * in previous checkpoint.
> +			 */
> +			if (p.alloc_mode == SSR || p.alloc_mode == AT_SSR) {
> +				if (!segment_has_free_slot(sbi, segno))
> +					goto next;
> +			}
> +		}
> +
>   		if (is_atgc) {
>   			add_victim_entry(sbi, &p, segno);
>   			goto next;
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 2d5a82c4ca15..deaf57e13125 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2650,6 +2650,26 @@ static void __refresh_next_blkoff(struct f2fs_sb_info *sbi,
>   		seg->next_blkoff++;
>   }
>   
> +bool segment_has_free_slot(struct f2fs_sb_info *sbi, int segno)
> +{
> +	struct sit_info *sit = SIT_I(sbi);
> +	struct seg_entry *se = get_seg_entry(sbi, segno);
> +	int entries = SIT_VBLOCK_MAP_SIZE / sizeof(unsigned long);
> +	unsigned long *target_map = SIT_I(sbi)->tmp_map;
> +	unsigned long *ckpt_map = (unsigned long *)se->ckpt_valid_map;
> +	unsigned long *cur_map = (unsigned long *)se->cur_valid_map;
> +	int i, pos;
> +
> +	down_write(&sit->sentry_lock);
> +	for (i = 0; i < entries; i++)
> +		target_map[i] = ckpt_map[i] | cur_map[i];
> +
> +	pos = __find_rev_next_zero_bit(target_map, sbi->blocks_per_seg, 0);
> +	up_write(&sit->sentry_lock);
> +
> +	return pos < sbi->blocks_per_seg;
> +}
> +
>   /*
>    * This function always allocates a used segment(from dirty seglist) by SSR
>    * manner, so it should recover the existing segment information of valid blocks
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
