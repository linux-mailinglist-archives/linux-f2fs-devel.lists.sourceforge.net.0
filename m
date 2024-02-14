Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E3092854147
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Feb 2024 02:34:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ra4Af-00069a-5s;
	Wed, 14 Feb 2024 01:34:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yonggil.song@samsung.com>) id 1ra4Ad-00069U-Qt
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Feb 2024 01:34:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:To:From:Sender:Reply-To:Subject:Mime-Version:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wl79DqeXUlvsgVNJe52a7LLETNMoxIhqRQaM60zvAPE=; b=kf0r/5GT8tZA9o4x+84PdUF3ip
 6KxAC0Psqs2d+vHydpgaSLOzkTwCjFD/gOVR3PjyhiZppdgaoO+4zh6EOBuzvWl1xO4X2IpDD4HLA
 CcWWl23S8mwO5a6ZEz36bXzvLr7DWH38qbx74iLvWHA5k2bxzIMP5gbZ9a+6LB/Kapag=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:To:From
 :Sender:Reply-To:Subject:Mime-Version:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wl79DqeXUlvsgVNJe52a7LLETNMoxIhqRQaM60zvAPE=; b=M
 PGslF0PiAcw2Weh5bN4w6MnbOoXXr+EJuwFyzvLxrGu78h2JlAR7zTGy50fHYyoy6RGKZDXgkS13K
 Wqb5ky/HChTPXnBZYWR2KA8R0bDltT7iXVcBj1VU/Eg9wDE7QvMVdgsxq8TkYArZjrRkA1h1JiMLy
 daqR3X4KYmXk7JFs=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ra4AY-00080w-UV for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Feb 2024 01:34:43 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20240214013427epoutp0362f16805ea920b9690915e535977af6e~zlseWz8P71104311043epoutp03u
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 Feb 2024 01:34:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20240214013427epoutp0362f16805ea920b9690915e535977af6e~zlseWz8P71104311043epoutp03u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1707874467;
 bh=wl79DqeXUlvsgVNJe52a7LLETNMoxIhqRQaM60zvAPE=;
 h=Subject:Reply-To:From:To:Date:References:From;
 b=NBNI05yECMbyBqdYwZcMf1Nvj+VnsGXa6nKe8nuN6YiHyPOXVmT300DiQ0DzlbXQ4
 5oQvl7xonoo8F2vPDBOfIcXv0E+1OsEGHPKFn6IIPsEsw6xr1vXjz70vTAuUXTxfjb
 Di+TO/ReIC49f+y86fU3jmbGqH/EvKOdTASriSbw=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20240214013427epcas2p4c25ea8c1bf63b77965203e4d6c7e5bf4~zlseDOfWY3148331483epcas2p4l;
 Wed, 14 Feb 2024 01:34:27 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.88]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4TZLMk5cFQz4x9Px; Wed, 14 Feb
 2024 01:34:26 +0000 (GMT)
X-AuditID: b6c32a46-fcdfd70000002596-77-65cc18a20239
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 D4.28.09622.2A81CC56; Wed, 14 Feb 2024 10:34:26 +0900 (KST)
Mime-Version: 1.0
From: Yonggil Song <yonggil.song@samsung.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Dongjin Kim <dongjin_.kim@samsung.com>,
 Daejun Park <daejun7.park@samsung.com>, Siwoo Jung <siu.jung@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20240214013426epcms2p655328452ef7fac82f3df56855d7dd99b@epcms2p6>
Date: Wed, 14 Feb 2024 10:34:26 +0900
X-CMS-MailID: 20240214013426epcms2p655328452ef7fac82f3df56855d7dd99b
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrCKsWRmVeSWpSXmKPExsWy7bCmme4iiTOpBovnalucnnqWyWLVg3CL
 HydNLJ6sn8VscWmRu8XlXXPYLM5PfM1kMfX8ESYHDo9NqzrZPHYv+Mzk0bdlFaPH501yASxR
 2TYZqYkpqUUKqXnJ+SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QDcoKZQl
 5pQChQISi4uV9O1sivJLS1IVMvKLS2yVUgtScgrMC/SKE3OLS/PS9fJSS6wMDQyMTIEKE7Iz
 7l5/ylawwLHizrynrA2Mi4y7GDk5JARMJCb+3s8OYgsJ7GCUWHrKtYuRg4NXQFDi7w5hkLCw
 gKnEm1unoUqUJK4d6GWBiOtLbF68DCzOJqAr8XfDciCbi0NE4D6TxKp/15kg5vNKzGh/ygJh
 S0tsX76VEcLWkPixrJcZwhaVuLn6LTuM/f7YfKgaEYnWe2ehagQlHvzcDRWXlFh06DzU/HyJ
 vyuus0HYNRJbG9qg4voS1zo2gu3lFfCVOD9jPjvIXywCqhK3bshClLhILDz2A2wts4C8xPa3
 c5hBSpgFNCXW79IHMSUElCWO3GKBqOCT6Dj8lx3mqR3znkAtUpPYvGkzK4QtI3HhcRvUkR4S
 RzdNZAQZIyQQKPFxeekERvlZiKCdhWTtLIS1CxiZVzGKpRYU56anFhsVGMEjMzk/dxMjOPlp
 ue1gnPL2g94hRiYOxkOMEhzMSiK8l2acSBXiTUmsrEotyo8vKs1JLT7EaAr070RmKdHkfGD6
 zSuJNzSxNDAxMzM0NzI1MFcS573XOjdFSCA9sSQ1OzW1ILUIpo+Jg1OqgUn/bzvTRJe9Kz7P
 MwieUDiP/09z4zPnb0mRcZ+TJzFIMmXrlZj3TmFdYl1ucFRMsuZXE1Nr9HHnWVFhSww3e/wy
 +S22dOdb1ffvuBR/e085fu9t9x/3jHMizJHC6xbUNrzPvt+1ZpHBlYxHsveYJ0e/2ZK37uke
 xZvVffxOiXMv7zly5qVMhJF21fLfG5JXMIg5BPL9iVC+rZS2UqZe2vN53M1eyyW7QsuWHvp9
 7ILj/BmdzQ80pHSe/VtgNEmY1aUszuti88G+uX/Z7u1dW71SgydzWS+j6fbHPItr6wrTeY+s
 m3nbTm9RFlePIu+jouB3Ww2krm4+HzR57scLB7OipxQGhz1X3S33Yp+PnroSS3FGoqEWc1Fx
 IgD6fPkBBwQAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240214013426epcms2p655328452ef7fac82f3df56855d7dd99b
References: <CGME20240214013426epcms2p655328452ef7fac82f3df56855d7dd99b@epcms2p6>
X-Spam-Score: -3.0 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Overview ======== This patch introduces a new way to
 preference
 data sections when selecting GC victims. Migration of data blocks causes
 invalidation of node blocks. Therefore, in situations where GC is frequent,
 selec [...] 
 Content analysis details:   (-3.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.33 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.33 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ra4AY-00080w-UV
Subject: [f2fs-dev] [PATCH v6] f2fs: New victim selection for GC
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
index 65294e3b0bef..b129f62ba541 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1654,6 +1654,7 @@ struct f2fs_sb_info {
 	struct f2fs_mount_info mount_opt;	/* mount options */
 
 	/* for cleaning operations */
+	bool require_node_gc;			/* flag for node GC */
 	struct f2fs_rwsem gc_lock;		/*
 						 * semaphore for GC, avoid
 						 * race between GC and GC or CP
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index a079eebfb080..53a51a668567 100644
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
+			weight = BLKS_PER_SEC(sbi);
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
@@ -1827,8 +1857,27 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
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
@@ -1863,6 +1912,18 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
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
 	if (seg_freed < 0)
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
