Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8045083809C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jan 2024 03:00:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rS653-0004Qv-8s;
	Tue, 23 Jan 2024 02:00:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yonggil.song@samsung.com>) id 1rS651-0004Q3-6I
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jan 2024 01:59:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NbV57ub5RxC2cw5lolUDPU7EviU8ooY1FLIH2oklQbc=; b=QlJgTEBiXHja5kUifyDLfxw1Ib
 0ju9KceFUL8l156dqtWnyoR/qa/78K65A0NB7wUbnf/U0/On7Sv82DyFHm0eIHWQe60shznOWBC16
 l2/ckQZMS6nwWdbe6SjO6gj6vBjJZtgsVMkDVcbstpXMSaSTh/lrRXrkD/vSO36/lUvE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:CC:To:
 From:Sender:Reply-To:Subject:Mime-Version:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=NbV57ub5RxC2cw5lolUDPU7EviU8ooY1FLIH2oklQbc=; b=W
 /a8aLutBTo0MuzBWVjq9UBS+MCireFnkxThbc51ujEqMe4o7nsIwThv7hYfEQEsYYvbO8LDhHwuk7
 omIJHyjR+syhuZ4rIAIwKwvK1RBtr0rlKy8uRsnJvDM7SW1BPAYHPkjFNdKrw/Zh0mrnVNdakW6sV
 St8HDGB6J8egJArc=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rS64z-0000kO-54 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jan 2024 01:59:59 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20240123015945epoutp02b25250284eee537b884da1d7c23a8f51~s12ScJuXL0845208452epoutp02I
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 23 Jan 2024 01:59:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20240123015945epoutp02b25250284eee537b884da1d7c23a8f51~s12ScJuXL0845208452epoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1705975186;
 bh=NbV57ub5RxC2cw5lolUDPU7EviU8ooY1FLIH2oklQbc=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=R6l4XHZvTM6YhcRFcqJGAQrmPnsvuoQsPkSSi8lIOCsmHk1Ydud2CRHnZHVelebwd
 3+MsscnfkC91JeIQNTYxwr07HN28IsVM2fXFf512Wcahmv5smr2WCjPIbydoGdG4O6
 d6nMA4jt81EzEraXHtuvxGvmRXmiWR9fDhkb7Hu0=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTP id
 20240123015945epcas2p3799d3e57f3a2eb4ebfd830da3fa3b3c8~s12SG7_tW2662726627epcas2p3h;
 Tue, 23 Jan 2024 01:59:45 +0000 (GMT)
Received: from epsmgec2p1-new.samsung.com (unknown [182.195.36.98]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4TJqz507Clz4x9QG; Tue, 23 Jan
 2024 01:59:45 +0000 (GMT)
X-AuditID: b6c32a4d-9f7ff70000004a32-6f-65af1d8f08b1
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
 epsmgec2p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
 46.AC.18994.F8D1FA56; Tue, 23 Jan 2024 10:59:43 +0900 (KST)
Mime-Version: 1.0
From: Yonggil Song <yonggil.song@samsung.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20240123015943epcms2p3adba8a5ad6cb8f01d1265f269f8cb607@epcms2p3>
Date: Tue, 23 Jan 2024 10:59:43 +0900
X-CMS-MailID: 20240123015943epcms2p3adba8a5ad6cb8f01d1265f269f8cb607
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmphk+LIzCtJLcpLzFFi42LZdljTVLdfdn2qwaoVihanp55lslj1INzi
 x0kTiyfrZzFbXFrkbnF51xw2i/MTXzNZTD1/hMmBw2PTqk42j90LPjN59G1ZxejxeZNcAEtU
 tk1GamJKapFCal5yfkpmXrqtkndwvHO8qZmBoa6hpYW5kkJeYm6qrZKLT4CuW2YO0A1KCmWJ
 OaVAoYDE4mIlfTubovzSklSFjPziElul1IKUnALzAr3ixNzi0rx0vbzUEitDAwMjU6DChOyM
 77+msBUccqz4u4yrgfGwcRcjJ4eEgInE4c2zWbsYuTiEBPYwStw/+QjI4eDgFRCU+LtDGKRG
 WMBU4vfWJcwgtpCAksS1A70sEHF9ic2Ll7GD2GwCuhJ/NywHs0UEXjFKnFktCmIzC5RLLLu4
 jh1iF6/EjPanLBC2tMT25VsZIWwNiR/LepkhbFGJm6vfssPY74/Nh6oRkWi9dxaqRlDiwc/d
 UHFJiUWHzjNB2PkSf1dcZ4OwayS2NrRBxfUlrnVsZIF4y1fi4a0okDCLgKrEvdNToM5xkbj8
 uZ0N4mR5ie1v5zCDlDMLaEqs36UPYkoIKEscucUCUcEn0XH4L9xTO+Y9gVqkJrF502ZWCFtG
 4sLjNqgjPSQWvV7FDgnAQIkfG6YxTWBUmIUI5llI9s5C2LuAkXkVo1RqQXFuemqyUYGhbl5q
 OTxyk/NzNzGCk6OW7w7G1+v/6h1iZOJgPMQowcGsJMJ7Q3JdqhBvSmJlVWpRfnxRaU5q8SFG
 U6CvJzJLiSbnA9NzXkm8oYmlgYmZmaG5kamBuZI4773WuSlCAumJJanZqakFqUUwfUwcnFIN
 TF6XHjJ+/C3/vW1NYsLsjn9a+3c8vJ3moKL1JlfqeR/Xo3of/2v2vVf0I64drzoSXbiRs2br
 +fLuynMumhOi76x50dXqVz0pK5Lnc0D8oS1Cl/hu1Hu9i+0O2JTA287yyXXG2tZZXNkvflRL
 Ryb8u9xULPt1+RvnxJ0OalWP5kzvk+lVNbQ7W67FuPCjho3j6WBbv8oa5W2/FEXvSZjf3P7r
 RGftge4K8cw7/yemrXn6uur7lPZb3YXT4pdej5vaNLtD8lOv8ArphLoT18Su3dmu8Cpj5YHd
 D+LOJJuJnZpfOEHUPCTfQPFXwbdXEhfn9gtY/VvR7PO22f6g5Uehm54P/9gk/Nj5PdJOa4Ki
 mBJLcUaioRZzUXEiAGDGZlkXBAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240123015943epcms2p3adba8a5ad6cb8f01d1265f269f8cb607
References: <CGME20240123015943epcms2p3adba8a5ad6cb8f01d1265f269f8cb607@epcms2p3>
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Overview ======== This patch introduces a new way to
 preference
 data sections when selecting GC victims. Migration of data blocks causes
 invalidation of node blocks. Therefore, in situations where GC is frequent,
 selec [...] 
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.25 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rS64z-0000kO-54
Subject: [f2fs-dev] [PATCH v5] f2fs: New victim selection for GC
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
Reply-To: yonggil.song@samsung.com
Cc: Siwoo Jung <siu.jung@samsung.com>, Dongjin Kim <dongjin_.kim@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Overview
========

This patch introduces a new way to preference data sections when selecting
GC victims. Migration of data blocks causes invalidation of node blocks.
Therefore, in situations where GC is frequent, selecting data blocks as
victims can reduce unnecessary block migration by invalidating node blocks.
For exceptional situations where free sections are insufficient, node blocks
are selected as victims instead of data blocks to get extra free sections.

Problem
=======

If the total amount of nodes is larger than the size of one section, nodes
occupy multiple sections, and node victims are often selected because the
gc cost is lowered by data block migration in GC. Since moving the data
section causes frequent node victim selection, victim threshing occurs in
the node section. This results in an increase in WAF.

Experiment
==========

Test environment is as follows.

        System info
          - 3.6GHz, 16 core CPU
          - 36GiB Memory
        Device info
          - a conventional null_blk with 228MiB
          - a sequential null_blk with 4068 zones of 8MiB
        Format
          - mkfs.f2fs <conv null_blk> -c <seq null_blk> -m -Z 8 -o 3.89
        Mount
          - mount <conv null_blk> <mount point>
        Fio script
	  - fio --rw=randwrite --bs=4k --ba=4k --filesize=31187m --norandommap --overwrite=1 --name=job1 --filename=./mnt/sustain --io_size=128g
	WAF calculation
	  - (IOs on conv. null_blk + IOs on seq. null_blk) / random write IOs

Conclusion
==========

This experiment showed that the WAF was reduced by 29% (18.75 -> 13.3) when
the data section was selected first when selecting GC victims. This was
achieved by reducing the migration of the node blocks by 69.4%
(253,131,743 blks -> 77,463,278 blks). It is possible to achieve low WAF
performance with the GC victim selection method in environments where the
section size is relatively small.

Signed-off-by: Yonggil Song <yonggil.song@samsung.com>
---
 fs/f2fs/f2fs.h |  1 +
 fs/f2fs/gc.c   | 96 +++++++++++++++++++++++++++++++++++++++-----------
 fs/f2fs/gc.h   |  6 ++++
 3 files changed, 82 insertions(+), 21 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9043cedfa12b..b2c0adfb2704 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1649,6 +1649,7 @@ struct f2fs_sb_info {
 	struct f2fs_mount_info mount_opt;	/* mount options */
 
 	/* for cleaning operations */
+	bool require_node_gc;			/* flag for node GC */
 	struct f2fs_rwsem gc_lock;		/*
 						 * semaphore for GC, avoid
 						 * race between GC and GC or CP
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index f550cdeaa663..ae1e960eaf5a 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -341,6 +341,14 @@ static unsigned int get_cb_cost(struct f2fs_sb_info *sbi, unsigned int segno)
 	unsigned int i;
 	unsigned int usable_segs_per_sec = f2fs_usable_segs_in_sec(sbi, segno);
 
+	/*
+	 * When BG_GC selects victims based on age, it prevents node victims
+	 * from being selected. This is because node blocks can be invalidated
+	 * by moving data blocks.
+	 */
+	if (__skip_node_gc(sbi, segno))
+		return UINT_MAX;
+
 	for (i = 0; i < usable_segs_per_sec; i++)
 		mtime += get_seg_entry(sbi, start + i)->mtime;
 	vblocks = get_valid_blocks(sbi, segno, true);
@@ -369,10 +377,24 @@ static inline unsigned int get_gc_cost(struct f2fs_sb_info *sbi,
 		return get_seg_entry(sbi, segno)->ckpt_valid_blocks;
 
 	/* alloc_mode == LFS */
-	if (p->gc_mode == GC_GREEDY)
-		return get_valid_blocks(sbi, segno, true);
-	else if (p->gc_mode == GC_CB)
+	if (p->gc_mode == GC_GREEDY) {
+		/*
+		 * If the data block that the node block pointed to is GCed,
+		 * the node block is invalidated. For this reason, we add a
+		 * weight to cost of node victims to give priority to data
+		 * victims during the gc process. However, in a situation
+		 * where we run out of free sections, we remove the weight
+		 * because we need to clean up node blocks.
+		 */
+		unsigned int weight = 0;
+
+		if (__skip_node_gc(sbi, segno))
+			weight = sbi->segs_per_sec << sbi->log_blocks_per_seg;
+
+		return get_valid_blocks(sbi, segno, true) + weight;
+	} else if (p->gc_mode == GC_CB) {
 		return get_cb_cost(sbi, segno);
+	}
 
 	f2fs_bug_on(sbi, 1);
 	return 0;
@@ -557,6 +579,14 @@ static void atgc_lookup_victim(struct f2fs_sb_info *sbi,
 	if (ve->mtime >= max_mtime || ve->mtime < min_mtime)
 		goto skip;
 
+	/*
+	 * When BG_GC selects victims based on age, it prevents node victims
+	 * from being selected. This is because node blocks can be invalidated
+	 * by moving data blocks.
+	 */
+	if (__skip_node_gc(sbi, ve->segno))
+		goto skip;
+
 	/* age = 10000 * x% * 60 */
 	age = div64_u64(accu * (max_mtime - ve->mtime), total_time) *
 								age_weight;
@@ -1830,8 +1860,27 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 		goto stop;
 	}
 
+	__get_secs_required(sbi, NULL, &upper_secs, NULL);
+
+	/*
+	 * Write checkpoint to reclaim prefree segments.
+	 * We need more three extra sections for writer's data/node/dentry.
+	 */
+	if (free_sections(sbi) <= upper_secs + NR_GC_CHECKPOINT_SECS) {
+		sbi->require_node_gc = true;
+
+		if (prefree_segments(sbi)) {
+			stat_inc_cp_call_count(sbi, TOTAL_CALL);
+			ret = f2fs_write_checkpoint(sbi, &cpc);
+			if (ret)
+				goto stop;
+			/* Reset due to checkpoint */
+			sec_freed = 0;
+		}
+	}
+
 	/* Let's run FG_GC, if we don't have enough space. */
-	if (has_not_enough_free_secs(sbi, 0, 0)) {
+	if (gc_type == BG_GC && has_not_enough_free_secs(sbi, 0, 0)) {
 		gc_type = FG_GC;
 
 		/*
@@ -1866,6 +1915,18 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 		goto stop;
 	}
 
+	if (sbi->require_node_gc &&
+	    IS_DATASEG(get_seg_entry(sbi, segno)->type)) {
+		/*
+		 * We need to clean node sections. but, data victim
+		 * cost is the lowest. If free sections are enough,
+		 * stop cleaning node victim. If not, it goes on
+		 * by GCing data victims.
+		 */
+		if (has_enough_free_secs(sbi, sec_freed, 0))
+			goto stop;
+	}
+
 	seg_freed = do_garbage_collect(sbi, segno, &gc_list, gc_type,
 				gc_control->should_migrate_blocks);
 	total_freed += seg_freed;
@@ -1882,7 +1943,13 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 			if (!gc_control->no_bg_gc &&
 			    total_sec_freed < gc_control->nr_free_secs)
 				goto go_gc_more;
-			goto stop;
+			/*
+			 * If require_node_gc flag is set even though there
+			 * are enough free sections, node cleaning will
+			 * continue.
+			 */
+			if (!sbi->require_node_gc)
+				goto stop;
 		}
 		if (sbi->skipped_gc_rwsem)
 			skipped_round++;
@@ -1897,21 +1964,6 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 		goto stop;
 	}
 
-	__get_secs_required(sbi, NULL, &upper_secs, NULL);
-
-	/*
-	 * Write checkpoint to reclaim prefree segments.
-	 * We need more three extra sections for writer's data/node/dentry.
-	 */
-	if (free_sections(sbi) <= upper_secs + NR_GC_CHECKPOINT_SECS &&
-				prefree_segments(sbi)) {
-		stat_inc_cp_call_count(sbi, TOTAL_CALL);
-		ret = f2fs_write_checkpoint(sbi, &cpc);
-		if (ret)
-			goto stop;
-		/* Reset due to checkpoint */
-		sec_freed = 0;
-	}
 go_gc_more:
 	segno = NULL_SEGNO;
 	goto gc_more;
@@ -1920,8 +1972,10 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 	SIT_I(sbi)->last_victim[ALLOC_NEXT] = 0;
 	SIT_I(sbi)->last_victim[FLUSH_DEVICE] = gc_control->victim_segno;
 
-	if (gc_type == FG_GC)
+	if (gc_type == FG_GC) {
 		f2fs_unpin_all_sections(sbi, true);
+		sbi->require_node_gc = false;
+	}
 
 	trace_f2fs_gc_end(sbi->sb, ret, total_freed, total_sec_freed,
 				get_pages(sbi, F2FS_DIRTY_NODES),
diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index 28a00942802c..cd07bf125177 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -166,3 +166,9 @@ static inline bool has_enough_invalid_blocks(struct f2fs_sb_info *sbi)
 		free_user_blocks(sbi) <
 			limit_free_user_blocks(invalid_user_blocks));
 }
+
+static inline bool __skip_node_gc(struct f2fs_sb_info *sbi, unsigned int segno)
+{
+	return (IS_NODESEG(get_seg_entry(sbi, segno)->type) &&
+		!sbi->require_node_gc);
+}
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
