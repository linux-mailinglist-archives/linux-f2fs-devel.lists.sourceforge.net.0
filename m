Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F00B481EA33
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Dec 2023 22:48:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rIFHS-0005p2-4Y;
	Tue, 26 Dec 2023 21:48:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rIFHQ-0005ow-Dp
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 Dec 2023 21:48:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lI4f1SGAYRW1tb+HUhU/UTZAyIsme8WUgMwQI49BA4A=; b=Y0ukHFlNtg1NFn/VASMccUp9KS
 cxmyPPdO0Fw6INF3mBw0YqJh0M8ZcKwIQqlVIla0ffAslh3qMzYMiTr1J2sn/FBLWTdYTvH0WAZHi
 2D7Szy9gFP4mLcH1STNYJXibNdRL5Om/KXEuDjjX0IM/UBOjDYeActUssTuWoMoGqJTw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lI4f1SGAYRW1tb+HUhU/UTZAyIsme8WUgMwQI49BA4A=; b=BivDOj34V8xwu6hz3wLuV6aUp+
 yTY7uBQ/aSIXp/pIGmFeM/xrSdCMI6PFp5lPcIhc/VIIbYE+wmmrUK4C5LyG/lsPd8yhxhj8Bb+a3
 Ra8ko3PBo3VCwI5CAmTU0myuPLTeZYIN3xNcDMp3sBISwZ61t0/XUPKsg+ePf9b41tmg=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rIFHP-00089g-H5 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 Dec 2023 21:48:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 72631CE10E7;
 Tue, 26 Dec 2023 21:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72FEDC433C8;
 Tue, 26 Dec 2023 21:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703627270;
 bh=zHRernGcxTCpGlVhEeURT8xMzdnXnggLNW5FMF7dkY8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HlyJonp/D/MBuInR3byy4cUiUDKgXM0tmL4JK2wOqgyA06w4upxffOotD0+uOOKBV
 htE6S6v5EXW18+QN6xHQVgX3Hl5FGH5Sqkz4UpSK9RoAkE/BCNqOG7YSlO5ojVxXQe
 QjXPCoGf3yvV2l7nAiyoTrF4pMtWbeMgBQX7dxb+t6t1VW3/pMTwKqOwkFab91O8t6
 vxZczCRCAdKPAy/AY9II3ZbAEx1z2DOUn48qpZbR3716yofQKz4xeBt7dNaEHHy1Ig
 ohP1DeOo6EHz4m2tKpsrDBsabufnFA6RvSYMsEGP/TxqYMexrkgXLPUpSV/Rv0vVFJ
 5cr/MnRy7kbSA==
Date: Tue, 26 Dec 2023 13:47:48 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Yonggil Song <yonggil.song@samsung.com>
Message-ID: <ZYtKBKQtGS7lfBJG@google.com>
References: <CGME20231221055630epcms2p25ae1ac5e4509d5c8ba7f338b51592e53@epcms2p2>
 <20231221055630epcms2p25ae1ac5e4509d5c8ba7f338b51592e53@epcms2p2>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231221055630epcms2p25ae1ac5e4509d5c8ba7f338b51592e53@epcms2p2>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/21, Yonggil Song wrote: > Overview > ======== > > This
 patch introduces a new way to preference data sections when selecting > GC
 victims. Migration of data blocks causes invalidation of node bl [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.9 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rIFHP-00089g-H5
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: New victim selection for GC
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

On 12/21, Yonggil Song wrote:
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
>  fs/f2fs/f2fs.h |   1 +
>  fs/f2fs/gc.c   | 102 +++++++++++++++++++++++++++++++++++++++----------
>  fs/f2fs/gc.h   |   6 +++
>  3 files changed, 88 insertions(+), 21 deletions(-)
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

	bool require_node_gc;

>  	struct f2fs_rwsem gc_lock;		/*
>  						 * semaphore for GC, avoid
>  						 * race between GC and GC or CP
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index f550cdeaa663..da963765e087 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -341,6 +341,14 @@ static unsigned int get_cb_cost(struct f2fs_sb_info *sbi, unsigned int segno)
>  	unsigned int i;
>  	unsigned int usable_segs_per_sec = f2fs_usable_segs_in_sec(sbi, segno);
>  
> +	/*
> +	 * When BG_GC selects victims based on age, it prevents node victims
> +	 * from being selected. This is because node blocks can be invalidated
> +	 * by moving data blocks.
> +	 */
> +	if (is_skip(sbi, segno))
> +		return UINT_MAX;
> +
>  	for (i = 0; i < usable_segs_per_sec; i++)
>  		mtime += get_seg_entry(sbi, start + i)->mtime;
>  	vblocks = get_valid_blocks(sbi, segno, true);
> @@ -369,10 +377,27 @@ static inline unsigned int get_gc_cost(struct f2fs_sb_info *sbi,
>  		return get_seg_entry(sbi, segno)->ckpt_valid_blocks;
>  
>  	/* alloc_mode == LFS */
> -	if (p->gc_mode == GC_GREEDY)
> -		return get_valid_blocks(sbi, segno, true);
> -	else if (p->gc_mode == GC_CB)
> +	if (p->gc_mode == GC_GREEDY) {
> +		unsigned int weight = 0;
> +		unsigned int no_need = sbi->need_node_clean ? 0 : 1;
> +		bool is_node =
> +			IS_NODESEG(get_seg_entry(sbi, segno)->type);
> +
> +		/*
> +		 * If the data block that the node block pointed to is GCed,
> +		 * the node block is invalidated. For this reason, we add a
> +		 * weight to cost of node victims to give priority to data
> +		 * victims during the gc process. However, in a situation
> +		 * where we run out of free sections, we remove the weight
> +		 * because we need to clean up node blocks.
> +		 */
> +		weight = is_node ?
> +			no_need * (sbi->blocks_per_seg * sbi->segs_per_sec) : 0;

		unsigned int cost = get_valid_blocks(sbi, segno, true);

		if (__skip_node_gc())
			return cost + (sbi->segs_per_sec << sbi->log_blocks_per_seg);
		return cost;

> +
> +		return (get_valid_blocks(sbi, segno, true) + weight);
> +	} else if (p->gc_mode == GC_CB) {
>  		return get_cb_cost(sbi, segno);
> +	}
>  
>  	f2fs_bug_on(sbi, 1);
>  	return 0;
> @@ -557,6 +582,14 @@ static void atgc_lookup_victim(struct f2fs_sb_info *sbi,
>  	if (ve->mtime >= max_mtime || ve->mtime < min_mtime)
>  		goto skip;
>  
> +	/*
> +	 * When BG_GC selects victims based on age, it prevents node victims
> +	 * from being selected. This is because node blocks can be invalidated
> +	 * by moving data blocks.
> +	 */
> +	if (is_skip(sbi, ve->segno))
> +		goto skip;
> +
>  	/* age = 10000 * x% * 60 */
>  	age = div64_u64(accu * (max_mtime - ve->mtime), total_time) *
>  								age_weight;
> @@ -913,7 +946,22 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
>  		goto retry;
>  	}
>  
> +
>  	if (p.min_segno != NULL_SEGNO) {
> +		if (sbi->need_node_clean &&
> +		    IS_DATASEG(get_seg_entry(sbi, p.min_segno)->type)) {
> +			 /*
> +			  * We need to clean node sections. but, data victim
> +			  * cost is the lowest. If free sections are enough,
> +			  * stop cleaning node victim. If not, it goes on
> +			  * by GCing data victims.
> +			  */
> +			if (has_enough_free_secs(sbi, prefree_segments(sbi), 0)) {
> +				sbi->need_node_clean = false;
> +				p.min_segno = NULL_SEGNO;
> +				goto out;
> +			}
> +		}
>  got_it:
>  		*result = (p.min_segno / p.ofs_unit) * p.ofs_unit;
>  got_result:
> @@ -1830,8 +1878,27 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
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
> @@ -1882,7 +1949,13 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>  			if (!gc_control->no_bg_gc &&
>  			    total_sec_freed < gc_control->nr_free_secs)
>  				goto go_gc_more;
> -			goto stop;
> +			/*
> +			 * If need_node_clean flag is set even though there
> +			 * are enough free sections, node cleaning will
> +			 * continue.
> +			 */
> +			if (!sbi->need_node_clean)
> +				goto stop;
>  		}
>  		if (sbi->skipped_gc_rwsem)
>  			skipped_round++;
> @@ -1897,21 +1970,6 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
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
> @@ -1920,8 +1978,10 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
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
> diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
> index 28a00942802c..b0af7c086b66 100644
> --- a/fs/f2fs/gc.h
> +++ b/fs/f2fs/gc.h
> @@ -166,3 +166,9 @@ static inline bool has_enough_invalid_blocks(struct f2fs_sb_info *sbi)
>  		free_user_blocks(sbi) <
>  			limit_free_user_blocks(invalid_user_blocks));
>  }
> +
> +static inline bool is_skip(struct f2fs_sb_info *sbi, unsigned int segno)

It looks quite hard to understand what is_skip means. What about __skip_node_gc()?

> +{
> +	return (IS_NODESEG(get_seg_entry(sbi, segno)->type) &&
> +		!sbi->need_node_clean);
> +}
> -- 
> 2.34.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
