Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF6D7F97ED
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Nov 2023 04:24:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r7SDz-0004jC-U4;
	Mon, 27 Nov 2023 03:23:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1r7SDx-0004j5-Sz
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Nov 2023 03:23:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jxPFNJnKblW0Z1q1xw1wzDoxjwDvE+ate5AdbDdT+gs=; b=NOrt70TwtY8YOjL7z+twAb45tf
 ekmCqbzI3BGDCEosbsps087uYqXP4Qm9hkb+2qtFexNF5DIfujfwJdM0Xo96bbF8JySJDjHc7wz1x
 8ChbKrWxQfYQhqSbRoEYWlClx2CvYz546xj4e5wyKBUzBChpWp31OlI81TcQozLg+tr0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jxPFNJnKblW0Z1q1xw1wzDoxjwDvE+ate5AdbDdT+gs=; b=C9bJlZt0oPUII6OKs3dYHVBqYl
 hnSfaEvnZRYatne1cl4+XvnAKurs4E31CIBrV7FBJE5Jjt301neU9CKPWxmQaERAwX5M1yLzPctUT
 Yfcg0JZVdehAHE6wfUO5+2pvDvmsAdKURgclLta2Bq0kHDoiBopHTXKtwNyEiiKO6Rdk=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r7SDv-00GQxD-Ce for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Nov 2023 03:23:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 08AEBCE08D4;
 Mon, 27 Nov 2023 03:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55782C433C7;
 Mon, 27 Nov 2023 03:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701055418;
 bh=Eodz2pVLOUXaoWfjoYzlXcohlYoJ3kVQaJUJpSKosJM=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=vJfOh+ximXtmPtldUYzo4a28ZtUogNPKD50qT9PraPzCPfz52oxpPva8HpCyqsGMQ
 UgMHscOJtKCf1yIIFGIe6b1749Y82RZPiVwLCk4gAhdenNw0pW+eRNomxHdIDvrgg4
 +camY5Vw7dSq9W7h9MtmN2Bsa4lweWo+2WkIaN9xCYSynVPQqUFEngbfhkCClJY5fn
 njdN5tPHyQpr2U3jYa9MdTOKp4JZa4WONBza3DS/TMibyatfyaNa1wd+ZHeRzo2qFU
 eIbjDp+lyI8PT9chKSa1O7BvhUIucfJ0NAvE97m0BN7ETFMvCmwCPwGsm1AXAftVbV
 KqxSSFSZR4VJw==
Message-ID: <f59b8c00-3628-6318-ee69-1caf79a03f2b@kernel.org>
Date: Mon, 27 Nov 2023 11:23:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: yonggil.song@samsung.com, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "corbet@lwn.net" <corbet@lwn.net>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Seokhwan Kim <sukka.kim@samsung.com>, Daejun Park
 <daejun7.park@samsung.com>, Siwoo Jung <siu.jung@samsung.com>
References: <20231012100345epcms2p84b95e24ee5e7965858ab8be99fbc3eff@epcms2p8>
 <CGME20231012100345epcms2p84b95e24ee5e7965858ab8be99fbc3eff@epcms2p4>
 <20231026091838epcms2p46f14260fdaf53e27ee6374887ed87f41@epcms2p4>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20231026091838epcms2p46f14260fdaf53e27ee6374887ed87f41@epcms2p4>
X-Spam-Score: -6.0 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Yonggil, On 2023/10/26 17:18,
 Yonggil Song wrote: > Overview
 > ======== > > Introduce a new way to select the data section first when
 selecting a > victim in foreground GC. This victim selection method works
 w [...] Content analysis details:   (-6.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -3.5 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r7SDv-00GQxD-Ce
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: New victim selection for GC
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Yonggil,

On 2023/10/26 17:18, Yonggil Song wrote:
> Overview
> ========
> 
> Introduce a new way to select the data section first when selecting a
> victim in foreground GC. This victim selection method works when the
> prefer_data_victim mount option is enabled. If foreground GC migrates only
> data sections and runs out of free sections, it cleans dirty node sections
> to get more free sections.

What about introducing parameter to adjust cost calculated by get_gc_cost()?

Something like:

get_gc_cost()

	if (p->gc_mode == GC_GREEDY) {
		vblocks = get_valid_blocks();
		if (seg_type is data)
			return vblocks * data_factor;
		return vblock * node_factor;
	}

If we prefer to select data segment during fggc, we can config data/node factor
as 1 and 512?

Thoughts?

Thanks,

> 
> Problem
> =======
> 
> If the total amount of nodes is larger than the size of one section, nodes
> occupy multiple sections, and node victims are often selected because the
> gc cost is lowered by data block migration in foreground gc. Since moving
> the data section causes frequent node victim selection, victim threshing
> occurs in the node section. This results in an increase in WAF.
> 
> Experiment
> ==========
> 
> Test environment is as follows.
> 
> 	System info
> 	  - 3.6GHz, 16 core CPU
> 	  - 36GiB Memory
> 	Device info
> 	  - a conventional null_blk with 228MiB
> 	  - a sequential null_blk with 4068 zones of 8MiB
> 	Format
> 	  - mkfs.f2fs <conv null_blk> -c <seq null_blk> -m -Z 8 -o 3.89
> 	Mount
> 	  - mount -o prefer_data_victim <conv null_blk> <mount point>
> 	Fio script
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
>   Documentation/filesystems/f2fs.rst |   3 +
>   fs/f2fs/f2fs.h                     |   2 +
>   fs/f2fs/gc.c                       | 100 +++++++++++++++++++++++------
>   fs/f2fs/segment.h                  |   2 +
>   fs/f2fs/super.c                    |   9 +++
>   5 files changed, 95 insertions(+), 21 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index d32c6209685d..58e6d001d7ab 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -367,6 +367,9 @@ errors=%s		 Specify f2fs behavior on critical errors. This supports modes:
>   			 pending node write	drop		keep		N/A
>   			 pending meta write	keep		keep		N/A
>   			 ====================== =============== =============== ========
> +prefer_data_victim	 When selecting victims in foreground GC, victims of data type
> +			 are prioritized. This option minimizes GC victim threshing
> +			 in the node section to reduce WAF.
>   ======================== ============================================================
>   
>   Debugfs Entries
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 6d688e42d89c..8b31fa2ea09a 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -108,6 +108,7 @@ extern const char *f2fs_fault_name[FAULT_MAX];
>   #define	F2FS_MOUNT_GC_MERGE		0x02000000
>   #define F2FS_MOUNT_COMPRESS_CACHE	0x04000000
>   #define F2FS_MOUNT_AGE_EXTENT_CACHE	0x08000000
> +#define F2FS_MOUNT_PREFER_DATA_VICTIM	0x10000000
>   
>   #define F2FS_OPTION(sbi)	((sbi)->mount_opt)
>   #define clear_opt(sbi, option)	(F2FS_OPTION(sbi).opt &= ~F2FS_MOUNT_##option)
> @@ -1648,6 +1649,7 @@ struct f2fs_sb_info {
>   	struct f2fs_mount_info mount_opt;	/* mount options */
>   
>   	/* for cleaning operations */
> +	bool need_node_clean;			/* only used for prefer_data_victim */
>   	struct f2fs_rwsem gc_lock;		/*
>   						 * semaphore for GC, avoid
>   						 * race between GC and GC or CP
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index f550cdeaa663..8a2da808a5fb 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -752,6 +752,8 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
>   	unsigned int last_segment;
>   	unsigned int nsearched;
>   	bool is_atgc;
> +	bool is_prefer_data_victim =
> +		test_opt(sbi, PREFER_DATA_VICTIM) && gc_type == FG_GC;
>   	int ret = 0;
>   
>   	mutex_lock(&dirty_i->seglist_lock);
> @@ -767,6 +769,11 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
>   	p.oldest_age = 0;
>   	p.min_cost = get_max_cost(sbi, &p);
>   
> +	if (is_prefer_data_victim) {
> +		p.node_min_cost = p.min_cost;
> +		p.node_min_segno = p.min_segno;
> +	}
> +
>   	is_atgc = (p.gc_mode == GC_AT || p.alloc_mode == AT_SSR);
>   	nsearched = 0;
>   
> @@ -884,9 +891,25 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
>   
>   		cost = get_gc_cost(sbi, segno, &p);
>   
> -		if (p.min_cost > cost) {
> -			p.min_segno = segno;
> -			p.min_cost = cost;
> +		if (is_prefer_data_victim) {
> +			if (IS_DATASEG(get_seg_entry(sbi, segno)->type)) {
> +				/* update data segments victim */
> +				if (p.min_cost > cost) {
> +					p.min_segno = segno;
> +					p.min_cost = cost;
> +				}
> +			} else {
> +				/* update node segments victim */
> +				if (p.node_min_cost > cost) {
> +					p.node_min_segno = segno;
> +					p.node_min_cost = cost;
> +				}
> +			}
> +		} else {
> +			if (p.min_cost > cost) {
> +				p.min_segno = segno;
> +				p.min_cost = cost;
> +			}
>   		}
>   next:
>   		if (nsearched >= p.max_search) {
> @@ -901,6 +924,25 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
>   		}
>   	}
>   
> +	if (is_prefer_data_victim && sbi->need_node_clean) {
> +		/* we need to clean node sections */
> +		if (p.min_cost > p.node_min_cost) {
> +			p.min_segno = p.node_min_segno;
> +			p.min_cost = p.node_min_cost;
> +		} else {
> +			/*
> +			 * data victim cost is the lowest.
> +			 * if free sections are enough, stop cleaning node victim.
> +			 * if not, it goes on by GCing data victims.
> +			 */
> +			if (has_enough_free_secs(sbi, prefree_segments(sbi), 0)) {
> +				sbi->need_node_clean = false;
> +				p.min_segno = NULL_SEGNO;
> +				goto out;
> +			}
> +		}
> +	}
> +
>   	/* get victim for GC_AT/AT_SSR */
>   	if (is_atgc) {
>   		lookup_victim_by_age(sbi, &p);
> @@ -1830,8 +1872,27 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>   		goto stop;
>   	}
>   
> +	__get_secs_required(sbi, NULL, &upper_secs, NULL);
> +
> +	/*
> +	 * Write checkpoint to reclaim prefree segments.
> +	 * We need more three extra sections for writer's data/node/dentry.
> +	 */
> +	if (free_sections(sbi) <= upper_secs + NR_GC_CHECKPOINT_SECS) {
> +		if (test_opt(sbi, PREFER_DATA_VICTIM)) {
> +			sbi->need_node_clean = true;
> +		}
> +		if (prefree_segments(sbi)) {
> +			ret = f2fs_write_checkpoint(sbi, &cpc);
> +			if (ret)
> +				goto stop;
> +			/* Reset due to checkpoint */
> +			sec_freed = 0;
> +		}
> +	}
> +
>   	/* Let's run FG_GC, if we don't have enough space. */
> -	if (has_not_enough_free_secs(sbi, 0, 0)) {
> +	if (gc_type == BG_GC && has_not_enough_free_secs(sbi, 0, 0)) {
>   		gc_type = FG_GC;
>   
>   		/*
> @@ -1882,7 +1943,17 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>   			if (!gc_control->no_bg_gc &&
>   			    total_sec_freed < gc_control->nr_free_secs)
>   				goto go_gc_more;
> -			goto stop;
> +			if (test_opt(sbi, PREFER_DATA_VICTIM)) {
> +				/*
> +				 * If the need_node_clean flag is set
> +				 * even though there are enough free
> +				 * sections, node cleaning will continue.
> +				 */
> +				if (!sbi->need_node_clean)
> +					goto stop;
> +			} else {
> +				goto stop;
> +			}
>   		}
>   		if (sbi->skipped_gc_rwsem)
>   			skipped_round++;
> @@ -1897,21 +1968,6 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>   		goto stop;
>   	}
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
>   go_gc_more:
>   	segno = NULL_SEGNO;
>   	goto gc_more;
> @@ -1920,8 +1976,10 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>   	SIT_I(sbi)->last_victim[ALLOC_NEXT] = 0;
>   	SIT_I(sbi)->last_victim[FLUSH_DEVICE] = gc_control->victim_segno;
>   
> -	if (gc_type == FG_GC)
> +	if (gc_type == FG_GC) {
>   		f2fs_unpin_all_sections(sbi, true);
> +		sbi->need_node_clean = false;
> +	}
>   
>   	trace_f2fs_gc_end(sbi->sb, ret, total_freed, total_sec_freed,
>   				get_pages(sbi, F2FS_DIRTY_NODES),
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 2ca8fb5d0dc4..d55fa1fee2e0 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -197,8 +197,10 @@ struct victim_sel_policy {
>   	unsigned int offset;		/* last scanned bitmap offset */
>   	unsigned int ofs_unit;		/* bitmap search unit */
>   	unsigned int min_cost;		/* minimum cost */
> +	unsigned int node_min_cost;	/* minimum cost of node type section */
>   	unsigned long long oldest_age;	/* oldest age of segments having the same min cost */
>   	unsigned int min_segno;		/* segment # having min. cost */
> +	unsigned int node_min_segno;	/* node segment # having min. cost */
>   	unsigned long long age;		/* mtime of GCed section*/
>   	unsigned long long age_threshold;/* age threshold */
>   };
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index a8c8232852bb..133137dd6fd0 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -165,6 +165,7 @@ enum {
>   	Opt_memory_mode,
>   	Opt_age_extent_cache,
>   	Opt_errors,
> +	Opt_prefer_data_victim,
>   	Opt_err,
>   };
>   
> @@ -245,6 +246,7 @@ static match_table_t f2fs_tokens = {
>   	{Opt_memory_mode, "memory=%s"},
>   	{Opt_age_extent_cache, "age_extent_cache"},
>   	{Opt_errors, "errors=%s"},
> +	{Opt_prefer_data_victim, "prefer_data_victim"},
>   	{Opt_err, NULL},
>   };
>   
> @@ -1286,6 +1288,13 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>   			}
>   			kfree(name);
>   			break;
> +		case Opt_prefer_data_victim:
> +			if (!f2fs_sb_has_blkzoned(sbi)) {
> +				f2fs_err(sbi, "prefer_data_victim is only allowed with zoned block device feature");
> +				return -EINVAL;
> +			}
> +			set_opt(sbi, PREFER_DATA_VICTIM);
> +			break;
>   		default:
>   			f2fs_err(sbi, "Unrecognized mount option \"%s\" or missing value",
>   				 p);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
