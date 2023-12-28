Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E2781F529
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Dec 2023 07:45:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rIk93-0006um-Tq;
	Thu, 28 Dec 2023 06:45:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yonggil.song@samsung.com>) id 1rIk91-0006ug-JW
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Dec 2023 06:45:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X7yZK13nwyDzs58dDzp+M/6sU3bq6c/zRPLxOpxegOI=; b=RZepqIcwnA0sQ0IYI31O2ioWa7
 bpvr3szIweLpZLBn289mPy7/Ws4aWn1/7+6E2ZFV3Z+sXheKa6yBSHwf8I5mcWZ2cLXQTyBdX/vHk
 A/HBbem+grjUgaRuJ3kskm4xuUeV+IEsd1BsJJUt9ByqOapU8P61kSkuK/xwo47ejjCg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:CC:To:
 From:Sender:Reply-To:Subject:Mime-Version:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=X7yZK13nwyDzs58dDzp+M/6sU3bq6c/zRPLxOpxegOI=; b=k
 i4HG/6SxYThygLhgwLoMSnS2Zvf/kqihZuDJkBAqHkdBLWat7WX+DlGp+J5s/eU9431z6Co+FwghQ
 TQ6JhexvQdz5NZntl/sV3bY7vjdesAYi0euXjBwRRtoONEb7dHsVnq8wC4Fk1gezEEL7PRdmN1ktD
 9ppb85wroDywZWaw=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rIk8u-0006JC-JQ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Dec 2023 06:45:26 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20231228064510epoutp03508ff30e2d3ee617be5ed62ff31b01ca~k6_DipfVx1142811428epoutp03I
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 28 Dec 2023 06:45:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20231228064510epoutp03508ff30e2d3ee617be5ed62ff31b01ca~k6_DipfVx1142811428epoutp03I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1703745910;
 bh=X7yZK13nwyDzs58dDzp+M/6sU3bq6c/zRPLxOpxegOI=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=IJHkBY5WyqB6axb1bqsEQY1N8ajAp2leRpgNyuDlDk4mWvJaF5qK1ns/yIukeireD
 6RTFOr6Uche5EFNZ8tPg2D+ULLV5Eu3xwD2VD5UNOPrD9zgiodDAGED0g0wwlYYJPI
 K025CVjVzWoVej31kk6NDfLGs9atKR9lH+qTekjA=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20231228064509epcas2p1016b4762c56f044319ce2fc190e755db~k6_DJIUwX3025530255epcas2p1M;
 Thu, 28 Dec 2023 06:45:09 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.70]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4T0zXP0P87z4x9Pv; Thu, 28 Dec
 2023 06:45:09 +0000 (GMT)
X-AuditID: b6c32a45-3ebfd70000002716-da-658d19740c43
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 C1.6C.10006.4791D856; Thu, 28 Dec 2023 15:45:08 +0900 (KST)
Mime-Version: 1.0
From: Yonggil Song <yonggil.song@samsung.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Seokhwan Kim <sukka.kim@samsung.com>, Daejun
 Park <daejun7.park@samsung.com>, Siwoo Jung <siu.jung@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20231228064508epcms2p1f74a30f7b615716d678950c0d5bc0748@epcms2p1>
Date: Thu, 28 Dec 2023 15:45:08 +0900
X-CMS-MailID: 20231228064508epcms2p1f74a30f7b615716d678950c0d5bc0748
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpik+LIzCtJLcpLzFFi42LZdljTTLdEsjfVoGWhhcXpqWeZLFY9CLd4
 sn4Ws8WlRe4Wl3fNYbM4P/E1ULhjLqPF1PNHmBw4PDat6mTz2L3gM5NH35ZVjB6fN8kFsERl
 22SkJqakFimk5iXnp2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYAHaGkUJaY
 UwoUCkgsLlbSt7Mpyi8tSVXIyC8usVVKLUjJKTAv0CtOzC0uzUvXy0stsTI0MDAyBSpMyM7Y
 ++c1c8Eb54obK84zNzAuMO1i5OSQEDCRODdvJWMXIxeHkMAORonzO7YDORwcvAKCEn93CIPU
 CAuYSuy72soCYgsJKElcO9DLAhHXl9i8eBk7iM0moCvxd8NyMFtE4C6TRF+3O4jNLKAtsXH2
 WSaIXbwSM9qfskDY0hLbl29lhLA1JH4s62WGsEUlbq5+yw5jvz82H6pGRKL13lmoGkGJBz93
 Q8UlJRYdOg81P1/i74rrbBB2jcTWhjaouL7EtY6NYHt5BXwl3n+dD/Yii4CqxJIJqRAlLhLf
 7x9ngzhZXmL72znMICXMApoS63fpg5gSAsoSR26xQFTwSXQc/ssO89SOeU+gFqlJbN60mRXC
 lpG48LgN6kgPiT0T/7BDAjBQ4uyDN4wTGBVmIYJ5FpK9sxD2LmBkXsUollpQnJueWmxUYAiP
 2eT83E2M4MSo5bqDcfLbD3qHGJk4GA8xSnAwK4nwHhftSRXiTUmsrEotyo8vKs1JLT7EaAr0
 8ERmKdHkfGBqziuJNzSxNDAxMzM0NzI1MFcS573XOjdFSCA9sSQ1OzW1ILUIpo+Jg1OqgUnt
 lyybZdajI90rpE3m2+ifDIyLEF6x687p7RKrCsQzX68OubVBdQXXultm95iFw/2D7rxn2i3m
 rM7YNdXEOm6V7xJpocqdf/bbTX4kq/6o6bz0++czL/65PXNviFu9aWPlqaiZbzIi3fceXptZ
 Lh3LZFHl6hGx9PF0U89wWaVrXCI+2p7vQ5o+TKxN0Xv+JJhNxvv6xg6W7Y/N1whWvNDcYtck
 VXSQK6tlb7SB+XvdJbyf7r4/ImD8iCt5a8Fyw4frPjocPXR42Zxp8aHR3Vd8j89lmslQdkjJ
 eJO/XrC/1P+Jm+axrHj7evru+HsF/9sEDlbzLWjPlrfOSGPzurZz1pxjVxpfyccc2bbAqEqJ
 pTgj0VCLuag4EQDf7lbKFQQAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231228064508epcms2p1f74a30f7b615716d678950c0d5bc0748
References: <CGME20231228064508epcms2p1f74a30f7b615716d678950c0d5bc0748@epcms2p1>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From d08b97183bc830779c82b83d94f8b75ad11cb29a Mon Sep 17
 00:00:00
 2001 From: Yonggil Song <yonggil.song@samsung.com> Date: Thu, 7 Dec 2023
 16:34:38 +0900 Subject: [PATCH v4] f2fs: New victim selection [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.33 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.33 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rIk8u-0006JC-JQ
Subject: [f2fs-dev] [PATCH v4] f2fs: New victim selection for GC
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

From d08b97183bc830779c82b83d94f8b75ad11cb29a Mon Sep 17 00:00:00 2001
From: Yonggil Song <yonggil.song@samsung.com>
Date: Thu, 7 Dec 2023 16:34:38 +0900
Subject: [PATCH v4] f2fs: New victim selection for GC

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
 fs/f2fs/gc.c   | 99 +++++++++++++++++++++++++++++++++++++++-----------
 fs/f2fs/gc.h   |  6 +++
 3 files changed, 85 insertions(+), 21 deletions(-)

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
index f550cdeaa663..d8a81a6ed325 100644
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
+		unsigned int cost = get_valid_blocks(sbi, segno, true);
+
+		if (__skip_node_gc(sbi, segno))
+			return cost +
+				(sbi->segs_per_sec << sbi->log_blocks_per_seg);
+		return cost;
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
@@ -913,7 +943,22 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
 		goto retry;
 	}
 
+
 	if (p.min_segno != NULL_SEGNO) {
+		if (sbi->require_node_gc &&
+		    IS_DATASEG(get_seg_entry(sbi, p.min_segno)->type)) {
+			 /*
+			  * We need to clean node sections. but, data victim
+			  * cost is the lowest. If free sections are enough,
+			  * stop cleaning node victim. If not, it goes on
+			  * by GCing data victims.
+			  */
+			if (has_enough_free_secs(sbi, prefree_segments(sbi), 0)) {
+				sbi->require_node_gc = false;
+				p.min_segno = NULL_SEGNO;
+				goto out;
+			}
+		}
 got_it:
 		*result = (p.min_segno / p.ofs_unit) * p.ofs_unit;
 got_result:
@@ -1830,8 +1875,27 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
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
@@ -1882,7 +1946,13 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
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
@@ -1897,21 +1967,6 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
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
@@ -1920,8 +1975,10 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
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
