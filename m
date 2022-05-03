Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2AC519069
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 May 2022 23:47:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nm0N5-0001yH-Sy; Tue, 03 May 2022 21:47:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nm0N4-0001yB-8d
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 May 2022 21:47:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OlQ8XPH4TLeZBiWUxT1cUr21ZoJAByoNJb5UxNC2S7M=; b=TWUKcGAadM7bXQ0uhpFs/WEPDz
 Lo2Y6Kb2nLb8J6ra4W/L4oQQqf9+HOgRJgx/G8b+21YmYp+RFwHllB/lRPfa5NYwoqrzme9PNFzlU
 syKjNe7w1usfRwjf0aMmmb63dJTZ+FmNdHDrYaV7ThseiRAf2W//un+Kcztd1D6tQ00s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OlQ8XPH4TLeZBiWUxT1cUr21ZoJAByoNJb5UxNC2S7M=; b=B963oRCQ5RfiH4+pOG5rTbu9nR
 GqkixbptINYh1GhjtgslNrmc8XxQbKs/OT860U8vmDYqNYZqmFOtxgaal7PxA1U4JlBKmjmTdd5KG
 xQcKryxin9WxvjL9K1Bg5w69OFCrqhfgL5K03dtN+sNzkJUJlOJGwg9qxJp8cTGxdSyc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nm0N3-0007PX-RJ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 May 2022 21:47:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 687C761605;
 Tue,  3 May 2022 21:47:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F5F5C385A4;
 Tue,  3 May 2022 21:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651614456;
 bh=xu/ipDrWtO0M9sX1SA/GGTi8sdux3sdCc33WwLe0J+w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jlmkyRvkSJ/p/nVRzru5cfIQ9fpCf+Ri7BvbnAbqwoWIaS8kkPK95lNGP+HcBmySf
 W+h3lFGoewASnScODyhEC+FlX5F1vF3FfAACePxnhGDfj+Jww261EPRzD+gkftYACh
 yC776/frzD8Xh2sxhVIgS5sD8kDQ52lEWHCOAiBYsoix4yN/ylHe7zvOaf4l7BVCa0
 /6giD/Urb71n5OfO9hSWVLW6vlzxV/Ocnuc3ZjMXfyZy+3C6klNAUIo9DqS1h7er6h
 giBdiIw22OjGyxM0YO9DSPgHgfJ/vCzJQE8uSg4DX4V9w0xwkbELyRQkUD5ye8JntP
 AN+cEvDTl8jVw==
Date: Tue, 3 May 2022 14:47:34 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YnGi9va0RW/vcwXi@google.com>
References: <20220429144456.22232-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220429144456.22232-1-chao@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/29, Chao Yu wrote: > As Yanming reported in bugzilla:
 > > https://bugzilla.kernel.org/show_bug.cgi?id=215916 > > The kernel message
 is shown below: > > kernel BUG at fs/f2fs/segment.c:2560! > Ca [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nm0N3-0007PX-RJ
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to do sanity check on
 total_data_blocks
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
Cc: Ming Yan <yanming@tju.edu.cn>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 04/29, Chao Yu wrote:
> As Yanming reported in bugzilla:
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=215916
> 
> The kernel message is shown below:
> 
> kernel BUG at fs/f2fs/segment.c:2560!
> Call Trace:
>  allocate_segment_by_default+0x228/0x440
>  f2fs_allocate_data_block+0x13d1/0x31f0
>  do_write_page+0x18d/0x710
>  f2fs_outplace_write_data+0x151/0x250
>  f2fs_do_write_data_page+0xef9/0x1980
>  move_data_page+0x6af/0xbc0
>  do_garbage_collect+0x312f/0x46f0
>  f2fs_gc+0x6b0/0x3bc0
>  f2fs_balance_fs+0x921/0x2260
>  f2fs_write_single_data_page+0x16be/0x2370
>  f2fs_write_cache_pages+0x428/0xd00
>  f2fs_write_data_pages+0x96e/0xd50
>  do_writepages+0x168/0x550
>  __writeback_single_inode+0x9f/0x870
>  writeback_sb_inodes+0x47d/0xb20
>  __writeback_inodes_wb+0xb2/0x200
>  wb_writeback+0x4bd/0x660
>  wb_workfn+0x5f3/0xab0
>  process_one_work+0x79f/0x13e0
>  worker_thread+0x89/0xf60
>  kthread+0x26a/0x300
>  ret_from_fork+0x22/0x30
> RIP: 0010:new_curseg+0xe8d/0x15f0
> 
> The root cause is: ckpt.valid_block_count is inconsistent with SIT table,
> stat info indicates filesystem has free blocks, but SIT table indicates
> filesystem has no free segment.
> 
> So that during garbage colloection, it triggers panic when LFS allocator
> fails to find free segment.
> 
> This patch tries to fix this issue by checking consistency in between
> ckpt.valid_block_count and block accounted from SIT.
> 
> Cc: stable@vger.kernel.org
> Reported-by: Ming Yan <yanming@tju.edu.cn>
> Signed-off-by: Chao Yu <chao.yu@oppo.com>
> ---
>  fs/f2fs/segment.c | 24 +++++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 8c17fed8987e..eddaf3b45b25 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -4462,6 +4462,7 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
>  	unsigned int readed, start_blk = 0;
>  	int err = 0;
>  	block_t total_node_blocks = 0;
> +	block_t total_data_blocks = 0;
>  
>  	do {
>  		readed = f2fs_ra_meta_pages(sbi, start_blk, BIO_MAX_VECS,
> @@ -4488,6 +4489,8 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
>  			seg_info_from_raw_sit(se, &sit);
>  			if (IS_NODESEG(se->type))
>  				total_node_blocks += se->valid_blocks;
> +			else
> +				total_data_blocks += se->valid_blocks;
>  
>  			if (f2fs_block_unit_discard(sbi)) {
>  				/* build discard map only one time */
> @@ -4529,6 +4532,8 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
>  		old_valid_blocks = se->valid_blocks;
>  		if (IS_NODESEG(se->type))
>  			total_node_blocks -= old_valid_blocks;
> +		else
> +			total_data_blocks -= old_valid_blocks;
>  
>  		err = check_block_count(sbi, start, &sit);
>  		if (err)
> @@ -4536,6 +4541,8 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
>  		seg_info_from_raw_sit(se, &sit);
>  		if (IS_NODESEG(se->type))
>  			total_node_blocks += se->valid_blocks;
> +		else
> +			total_data_blocks += se->valid_blocks;
>  
>  		if (f2fs_block_unit_discard(sbi)) {
>  			if (is_set_ckpt_flags(sbi, CP_TRIMMED_FLAG)) {
> @@ -4557,13 +4564,24 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
>  	}
>  	up_read(&curseg->journal_rwsem);
>  
> -	if (!err && total_node_blocks != valid_node_count(sbi)) {
> +	if (err)
> +		return err;
> +
> +	if (total_node_blocks != valid_node_count(sbi)) {
>  		f2fs_err(sbi, "SIT is corrupted node# %u vs %u",
>  			 total_node_blocks, valid_node_count(sbi));
> -		err = -EFSCORRUPTED;
> +		return -EFSCORRUPTED;
>  	}
>  
> -	return err;
> +	if (total_data_blocks + total_node_blocks !=
> +				valid_user_blocks(sbi)) {
> +		f2fs_err(sbi, "SIT is corrupted data# %u vs %u",
> +			 total_data_blocks,
> +			 valid_user_blocks(sbi) - total_node_blocks);

This doesn't work, since some NEW_ADDR is not counted from SIT.

> +		return -EFSCORRUPTED;
> +	}
> +
> +	return 0;
>  }
>  
>  static void init_free_segmap(struct f2fs_sb_info *sbi)
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
