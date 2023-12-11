Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D87E880DE8B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Dec 2023 23:48:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rCp4A-0002dc-SV;
	Mon, 11 Dec 2023 22:47:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rCp48-0002dQ-I2
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Dec 2023 22:47:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UbHdz3I7p00C/04trgrJWlXNUG3QkB/8qEyuJ25b/+0=; b=FekdR4JoTLoqxmT1AlG+VUEIg/
 +eFZ9Lwr1uGdpTnynyTp11EJWKbS9XXsPoIawrdQdC3gzaoIp/fJlAtF1zbTZC/qwjSWrcSRVg8Ez
 +NaZ3BatzrUoGaxabNfUpmtug1DyaRU1FntO2hRLv8dTEpC+cRztXV4aANBUfo1eeitc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UbHdz3I7p00C/04trgrJWlXNUG3QkB/8qEyuJ25b/+0=; b=WqrJ/8tqn3a+fpFnUvoPxLOa6E
 23iksf07kYWHwXgzBDG5V7TnIgsltGFmPH14yRjwyWGxFx7HVUJOnluIgPPRtzZ70P8GNP3gkEAck
 vxvL+jOH7Fk4Dkw5D70n6/JssZvFYTSnnrs4Sxv++wN4xw6W/wG4ETRVIJQX9kSMFeuk=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rCp45-0008Ge-TW for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Dec 2023 22:47:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 08D4ECE11BD;
 Mon, 11 Dec 2023 22:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F5A4C433C8;
 Mon, 11 Dec 2023 22:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702334866;
 bh=34tnQX9ctCBczkyhWp459H2RBzFpA5vSI+uY7xIEEhs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S34qGgIX+VOjSl98nrnGR6MzsYZbUiNVAeKCJ4TrF1uISKJo36bMCBAnzoOzmMGr7
 oZBhmXvFJjCPIF31qM0WRkPrZBRd9EoXcdtWX4Mt9gQ7TGkBFwzT2eVR3MnZaVgq/4
 YOfemhdPwNmj+9FyecWIQ9/R7tb7AKsn4V67Q9dYC8ZcIOxT4v7GuOMKHvYe++sPjw
 wF3SugfP0GUB58TxxivrkSYlst/FPKtBY/frIq1hx7PIcL+wmnLgqHQkKlg1d1Mext
 xLjYgMbzs2sCKz05QdN1lyNOOPrPlG/7FWoeiNbfgLMI9/u/qPEESUxtnJYCTyuj1i
 RwVzFJkNe1rgA==
Date: Mon, 11 Dec 2023 14:47:44 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Yonggil Song <yonggil.song@samsung.com>
Message-ID: <ZXeRkAoQTtTpf1dg@google.com>
References: <CGME20231208090444epcms2p33884216391931d04c1771dfb51a08a44@epcms2p3>
 <20231208090444epcms2p33884216391931d04c1771dfb51a08a44@epcms2p3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231208090444epcms2p33884216391931d04c1771dfb51a08a44@epcms2p3>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/08, Yonggil Song wrote: > Overview > ======== > > This
 patch introduces a new way to preference data sections when selecting > GC
 victims. Migration of data blocks causes invalidation of node bl [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rCp45-0008Ge-TW
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: New victim selection for GC
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Siwoo Jung <siu.jung@samsung.com>,
 Seokhwan Kim <sukka.kim@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/08, Yonggil Song wrote:
> Overview
> ========
> 
> This patch introduces a new way to preference data sections when selecting
> GC victims. Migration of data blocks causes invalidation of node blocks.
> Therefore, in situations where GC is frequent, selecting data blocks as
> victims can reduce unnecessary block migration by invalidating node blocks.
> For exceptional situations where free sections are insufficient, node blocks
> are selected as victims instead of data blocks to get extra free sections.
> 
> Problem
> =======
> 
> If the total amount of nodes is larger than the size of one section, nodes
> occupy multiple sections, and node victims are often selected because the
> gc cost is lowered by data block migration in GC. Since moving the data
> section causes frequent node victim selection, victim threshing occurs in
> the node section. This results in an increase in WAF.
> 
> Experiment
> ==========
> 
> Test environment is as follows.
> 
>         System info
>           - 3.6GHz, 16 core CPU
>           - 36GiB Memory
>         Device info
>           - a conventional null_blk with 228MiB
>           - a sequential null_blk with 4068 zones of 8MiB
>         Format
>           - mkfs.f2fs <conv null_blk> -c <seq null_blk> -m -Z 8 -o 3.89
>         Mount
>           - mount <conv null_blk> <mount point>
>         Fio script
> 	  - fio --rw=randwrite --bs=4k --ba=4k --filesize=31187m --norandommap --overwrite=1 --name=job1 --filename=./mnt/sustain --io_size=128g
> 	WAF calculation
> 	  - (IOs on conv. null_blk + IOs on seq. null_blk) / random write IOs
> 
> Conclusion
> ==========
> 
> This experiment showed that the WAF was reduced by 29% (18.75 -> 13.3) when
> the data section was selected first when selecting GC victims. This was
> achieved by reducing the migration of the node blocks by 69.4%
> (253,131,743 blks -> 77,463,278 blks). It is possible to achieve low WAF
> performance with the GC victim selection method in environments where the
> section size is relatively small.
> 
> Signed-off-by: Yonggil Song <yonggil.song@samsung.com>
> ---
>  fs/f2fs/f2fs.h |  1 +
>  fs/f2fs/gc.c   | 98 ++++++++++++++++++++++++++++++++++++++------------
>  2 files changed, 77 insertions(+), 22 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 9043cedfa12b..578d57f6022f 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1649,6 +1649,7 @@ struct f2fs_sb_info {
>  	struct f2fs_mount_info mount_opt;	/* mount options */
>  
>  	/* for cleaning operations */
> +	bool need_node_clean;			/* need to clean dirty nodes */
>  	struct f2fs_rwsem gc_lock;		/*
>  						 * semaphore for GC, avoid
>  						 * race between GC and GC or CP
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index f550cdeaa663..682dcf0de59e 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -368,6 +368,14 @@ static inline unsigned int get_gc_cost(struct f2fs_sb_info *sbi,
>  	if (p->alloc_mode == SSR)
>  		return get_seg_entry(sbi, segno)->ckpt_valid_blocks;
>  
> +	/*
> +	 * If we don't need to clean dirty nodes,
> +	 * we just skip node victims.
> +	 */
> +	if (IS_NODESEG(get_seg_entry(sbi, segno)->type) &&
> +		!sbi->need_node_clean)
> +		return get_max_cost(sbi, p);

How about differentiating the gc cost between data vs. node by adding some
weights? By default, data is preferred, while node is better in the worst case?

> +
>  	/* alloc_mode == LFS */
>  	if (p->gc_mode == GC_GREEDY)
>  		return get_valid_blocks(sbi, segno, true);
> @@ -557,6 +565,14 @@ static void atgc_lookup_victim(struct f2fs_sb_info *sbi,
>  	if (ve->mtime >= max_mtime || ve->mtime < min_mtime)
>  		goto skip;
>  
> +	/*
> +	 * If we don't need to clean dirty nodes,
> +	 * we just skip node victims.
> +	 */
> +	if (IS_NODESEG(get_seg_entry(sbi, ve->segno)->type) &&
> +	    !sbi->need_node_clean)
> +		goto skip;
> +
>  	/* age = 10000 * x% * 60 */
>  	age = div64_u64(accu * (max_mtime - ve->mtime), total_time) *
>  								age_weight;
> @@ -913,7 +929,21 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
>  		goto retry;
>  	}
>  
> +
>  	if (p.min_segno != NULL_SEGNO) {
> +		if (sbi->need_node_clean &&
> +		    IS_DATASEG(get_seg_entry(sbi, p.min_segno)->type)) {
> +			 /*
> +			  * we need to clean node sections.
> +			  * but, data victim cost is the lowest.
> +			  * if free sections are enough, stop cleaning node victim.
> +			  * if not, it goes on by GCing data victims.
> +			  */
> +			if (has_enough_free_secs(sbi, prefree_segments(sbi), 0)) {
> +				p.min_segno = NULL_SEGNO;
> +				goto out;
> +			}
> +		}
>  got_it:
>  		*result = (p.min_segno / p.ofs_unit) * p.ofs_unit;
>  got_result:
> @@ -1830,8 +1860,27 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>  		goto stop;
>  	}
>  
> +	__get_secs_required(sbi, NULL, &upper_secs, NULL);
> +
> +	/*
> +	 * Write checkpoint to reclaim prefree segments.
> +	 * We need more three extra sections for writer's data/node/dentry.
> +	 */
> +	if (free_sections(sbi) <= upper_secs + NR_GC_CHECKPOINT_SECS) {
> +		sbi->need_node_clean = true;
> +
> +		if (prefree_segments(sbi)) {
> +			stat_inc_cp_call_count(sbi, TOTAL_CALL);
> +			ret = f2fs_write_checkpoint(sbi, &cpc);
> +			if (ret)
> +				goto stop;
> +			/* Reset due to checkpoint */
> +			sec_freed = 0;
> +		}
> +	}
> +
>  	/* Let's run FG_GC, if we don't have enough space. */
> -	if (has_not_enough_free_secs(sbi, 0, 0)) {
> +	if (gc_type == BG_GC && has_not_enough_free_secs(sbi, 0, 0)) {
>  		gc_type = FG_GC;
>  
>  		/*
> @@ -1858,10 +1907,22 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>  	ret = __get_victim(sbi, &segno, gc_type);
>  	if (ret) {
>  		/* allow to search victim from sections has pinned data */
> -		if (ret == -ENODATA && gc_type == FG_GC &&
> -				f2fs_pinned_section_exists(DIRTY_I(sbi))) {
> -			f2fs_unpin_all_sections(sbi, false);
> -			goto retry;
> +		if (ret == -ENODATA && gc_type == FG_GC) {
> +			if (f2fs_pinned_section_exists(DIRTY_I(sbi))) {
> +				f2fs_unpin_all_sections(sbi, false);
> +				goto retry;
> +			}
> +			/*
> +			 * If we have no more data victims, let's start to
> +			 * clean dirty nodes.
> +			 */
> +			if (!sbi->need_node_clean) {
> +				sbi->need_node_clean = true;
> +				goto retry;
> +			}
> +			/* node cleaning is over */
> +			else if (sbi->need_node_clean)
> +				goto stop;
>  		}
>  		goto stop;
>  	}
> @@ -1882,7 +1943,13 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>  			if (!gc_control->no_bg_gc &&
>  			    total_sec_freed < gc_control->nr_free_secs)
>  				goto go_gc_more;
> -			goto stop;
> +			/*
> +			 * If the need_node_clean flag is set
> +			 * even though there are enough free
> +			 * sections, node cleaning will continue.
> +			 */
> +			if (!sbi->need_node_clean)
> +				goto stop;
>  		}
>  		if (sbi->skipped_gc_rwsem)
>  			skipped_round++;
> @@ -1897,21 +1964,6 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>  		goto stop;
>  	}
>  
> -	__get_secs_required(sbi, NULL, &upper_secs, NULL);
> -
> -	/*
> -	 * Write checkpoint to reclaim prefree segments.
> -	 * We need more three extra sections for writer's data/node/dentry.
> -	 */
> -	if (free_sections(sbi) <= upper_secs + NR_GC_CHECKPOINT_SECS &&
> -				prefree_segments(sbi)) {
> -		stat_inc_cp_call_count(sbi, TOTAL_CALL);
> -		ret = f2fs_write_checkpoint(sbi, &cpc);
> -		if (ret)
> -			goto stop;
> -		/* Reset due to checkpoint */
> -		sec_freed = 0;
> -	}
>  go_gc_more:
>  	segno = NULL_SEGNO;
>  	goto gc_more;
> @@ -1920,8 +1972,10 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>  	SIT_I(sbi)->last_victim[ALLOC_NEXT] = 0;
>  	SIT_I(sbi)->last_victim[FLUSH_DEVICE] = gc_control->victim_segno;
>  
> -	if (gc_type == FG_GC)
> +	if (gc_type == FG_GC) {
>  		f2fs_unpin_all_sections(sbi, true);
> +		sbi->need_node_clean = false;
> +	}
>  
>  	trace_f2fs_gc_end(sbi->sb, ret, total_freed, total_sec_freed,
>  				get_pages(sbi, F2FS_DIRTY_NODES),
> -- 
> 2.34.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
