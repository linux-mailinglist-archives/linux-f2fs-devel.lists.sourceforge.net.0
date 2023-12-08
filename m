Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D47C7809EBF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Dec 2023 10:05:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rBWnA-0000vZ-Tc;
	Fri, 08 Dec 2023 09:05:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yonggil.song@samsung.com>) id 1rBWn6-0000vH-TP
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Dec 2023 09:05:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yYMzrKo30mS8dgRGXyEvNMI4KEH0C0IvwnCAtCks3nA=; b=BXr1NS9gOlMaTW/pH1EZBx8pwo
 /jNNmK4D0/bOMIBk3vx6HiLab9kuwBGhNIkdl+UyJrrg4a2XC1/NejDpITykHAwxIwUOeU1aOeUxj
 cVzxorD2HH1ubbY8XFEiPOWljvzBd0McJM2NXS7biisGLxg/jZkLBoUgml2izaJWsSG4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:CC:To:
 From:Sender:Reply-To:Subject:Mime-Version:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=yYMzrKo30mS8dgRGXyEvNMI4KEH0C0IvwnCAtCks3nA=; b=A
 ptbcM2CbBzwCQPPXjVggaxMVqAnoZBWgzy8ZewQjaguT8juklMsLdI2b6t/iUk/5EheKHdHtxbPwd
 sW15pz3CoBL0GbzeCp57MAgTgylTuxcSEE6zZbKILRzvkQHis588/4VllRPQorazkLrOzsMK9FPCR
 tQ96MSrPWruH+9GE=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rBWn4-0005Op-2g for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Dec 2023 09:04:59 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20231208090445epoutp04ffda97c3c8c9d4c157c9e66f2428aa2e~ez_OhtKXn1776417764epoutp04w
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  8 Dec 2023 09:04:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20231208090445epoutp04ffda97c3c8c9d4c157c9e66f2428aa2e~ez_OhtKXn1776417764epoutp04w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1702026285;
 bh=yYMzrKo30mS8dgRGXyEvNMI4KEH0C0IvwnCAtCks3nA=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=FuglznW6sLq896miMfkbrcSQbHHtDuTSWH6NTAjdvHQfHjn6sYZmCFFE1P03fReYz
 Hd3Vd+4azn20pybbeNI/JVxdsIMtlZMoO8aMxbyRKl8b3VgUoXbcYxLSx8cuvj/Wzy
 xGcPWy4utokemCcwmClgfkGGx9gx89OQPhxoP/xU=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTP id
 20231208090445epcas2p3170471713275562791a3debe07f37623~ez_OM1uPD1535915359epcas2p3L;
 Fri,  8 Dec 2023 09:04:45 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.88]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4SmlZh63LXz4x9QB; Fri,  8 Dec
 2023 09:04:44 +0000 (GMT)
X-AuditID: b6c32a47-bfdfa70000002726-da-6572dc2cdbdb
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 3E.EC.10022.C2CD2756; Fri,  8 Dec 2023 18:04:44 +0900 (KST)
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
Message-ID: <20231208090444epcms2p33884216391931d04c1771dfb51a08a44@epcms2p3>
Date: Fri, 08 Dec 2023 18:04:44 +0900
X-CMS-MailID: 20231208090444epcms2p33884216391931d04c1771dfb51a08a44
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmplk+LIzCtJLcpLzFFi42LZdljTQlfnTlGqwfxFehanp55lsnh5SNNi
 1YNwiyfrZzFbXFrkbnF51xw2i/MTXzNZrOqYy2gx9fwRJgdOj02rOtk8di/4zOTRt2UVo8fn
 TXIBLFHZNhmpiSmpRQqpecn5KZl56bZK3sHxzvGmZgaGuoaWFuZKCnmJuam2Si4+AbpumTlA
 hygplCXmlAKFAhKLi5X07WyK8ktLUhUy8otLbJVSC1JyCswL9IoTc4tL89L18lJLrAwNDIxM
 gQoTsjMOrVrPXHDDuuLAhvtsDYxr9LoYOTgkBEwkeqcYdjFycggJ7GCUaD7BCxLmFRCU+LtD
 GCQsLGAqsXXZNCaIEiWJawd6WSDi+hKbFy9jB7HZBHQl/m5YDmaLCLxilDizWhTEZhZYwCjR
 2OgAYksI8ErMaH/KAmFLS2xfvpURwtaQ+LGslxnCFpW4ufotO4z9/th8qBoRidZ7Z6FqBCUe
 /NwNFZeUWHToPBOEnS/xd8V1Ngi7RmJrQxtUXF/iWsdGsL28Ar4SW1Z/AIuzCKhKvH/4Ceoe
 F4nPr9cwQtwsL7H97RxmUDAwC2hKrN+lDwkoZYkjt1ggKvgkOg7/ZYf5qmHjb6zsHfOeQF2g
 JrF502ZWCFtG4sLjNsYJjEqzEOE8C8neWQh7FzAyr2IUSy0ozk1PLTYqMIZHbHJ+7iZGcHrU
 ct/BOOPtB71DjEwcjIcYJTiYlUR4c87npwrxpiRWVqUW5ccXleakFh9iNAX6eCKzlGhyPjBB
 55XEG5pYGpiYmRmaG5kamCuJ895rnZsiJJCeWJKanZpakFoE08fEwSnVwNTH+bD9epSwkf+1
 l83Fcf9t5wpLMG9/e5Iv7/9ldpPFn6eFhnCdmrFUPaNMpdfqXrXlZmEPh8tqf/fMuiJRFHix
 KMDV2LbgV/ppb913XHpVB+5MP+LeZp1V/jmoM2za6VmMT80s5kn63tB8vGSOYWrU5gnT219o
 ixxiULM9tsS1r6dc+sKzxkVrLH3ZY46ab7CLmvQ6N0s3QmF625r85HU1wtO3Ldr0veHMuffT
 1u3qeZnkzjDvIjfzZ8npVoffKkl8LDaWOrywRFBU98Es7l+tZnEHegsu8Mf4Lla/Nl9nbdOK
 UybCygtNiw30D14Lfb9qSoHyfqZjZU3nOTZ/W/jlStrn+gg7HaHq+uwv+5RYijMSDbWYi4oT
 AXzWakcYBAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231208090444epcms2p33884216391931d04c1771dfb51a08a44
References: <CGME20231208090444epcms2p33884216391931d04c1771dfb51a08a44@epcms2p3>
X-Spam-Score: -2.5 (--)
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
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.34 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rBWn4-0005Op-2g
Subject: [f2fs-dev] [PATCH v2] f2fs: New victim selection for GC
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
Cc: Seokhwan Kim <sukka.kim@samsung.com>, Siwoo Jung <siu.jung@samsung.com>
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
 fs/f2fs/gc.c   | 98 ++++++++++++++++++++++++++++++++++++++------------
 2 files changed, 77 insertions(+), 22 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9043cedfa12b..578d57f6022f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1649,6 +1649,7 @@ struct f2fs_sb_info {
 	struct f2fs_mount_info mount_opt;	/* mount options */
 
 	/* for cleaning operations */
+	bool need_node_clean;			/* need to clean dirty nodes */
 	struct f2fs_rwsem gc_lock;		/*
 						 * semaphore for GC, avoid
 						 * race between GC and GC or CP
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index f550cdeaa663..682dcf0de59e 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -368,6 +368,14 @@ static inline unsigned int get_gc_cost(struct f2fs_sb_info *sbi,
 	if (p->alloc_mode == SSR)
 		return get_seg_entry(sbi, segno)->ckpt_valid_blocks;
 
+	/*
+	 * If we don't need to clean dirty nodes,
+	 * we just skip node victims.
+	 */
+	if (IS_NODESEG(get_seg_entry(sbi, segno)->type) &&
+		!sbi->need_node_clean)
+		return get_max_cost(sbi, p);
+
 	/* alloc_mode == LFS */
 	if (p->gc_mode == GC_GREEDY)
 		return get_valid_blocks(sbi, segno, true);
@@ -557,6 +565,14 @@ static void atgc_lookup_victim(struct f2fs_sb_info *sbi,
 	if (ve->mtime >= max_mtime || ve->mtime < min_mtime)
 		goto skip;
 
+	/*
+	 * If we don't need to clean dirty nodes,
+	 * we just skip node victims.
+	 */
+	if (IS_NODESEG(get_seg_entry(sbi, ve->segno)->type) &&
+	    !sbi->need_node_clean)
+		goto skip;
+
 	/* age = 10000 * x% * 60 */
 	age = div64_u64(accu * (max_mtime - ve->mtime), total_time) *
 								age_weight;
@@ -913,7 +929,21 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
 		goto retry;
 	}
 
+
 	if (p.min_segno != NULL_SEGNO) {
+		if (sbi->need_node_clean &&
+		    IS_DATASEG(get_seg_entry(sbi, p.min_segno)->type)) {
+			 /*
+			  * we need to clean node sections.
+			  * but, data victim cost is the lowest.
+			  * if free sections are enough, stop cleaning node victim.
+			  * if not, it goes on by GCing data victims.
+			  */
+			if (has_enough_free_secs(sbi, prefree_segments(sbi), 0)) {
+				p.min_segno = NULL_SEGNO;
+				goto out;
+			}
+		}
 got_it:
 		*result = (p.min_segno / p.ofs_unit) * p.ofs_unit;
 got_result:
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
+		sbi->need_node_clean = true;
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
@@ -1858,10 +1907,22 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 	ret = __get_victim(sbi, &segno, gc_type);
 	if (ret) {
 		/* allow to search victim from sections has pinned data */
-		if (ret == -ENODATA && gc_type == FG_GC &&
-				f2fs_pinned_section_exists(DIRTY_I(sbi))) {
-			f2fs_unpin_all_sections(sbi, false);
-			goto retry;
+		if (ret == -ENODATA && gc_type == FG_GC) {
+			if (f2fs_pinned_section_exists(DIRTY_I(sbi))) {
+				f2fs_unpin_all_sections(sbi, false);
+				goto retry;
+			}
+			/*
+			 * If we have no more data victims, let's start to
+			 * clean dirty nodes.
+			 */
+			if (!sbi->need_node_clean) {
+				sbi->need_node_clean = true;
+				goto retry;
+			}
+			/* node cleaning is over */
+			else if (sbi->need_node_clean)
+				goto stop;
 		}
 		goto stop;
 	}
@@ -1882,7 +1943,13 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 			if (!gc_control->no_bg_gc &&
 			    total_sec_freed < gc_control->nr_free_secs)
 				goto go_gc_more;
-			goto stop;
+			/*
+			 * If the need_node_clean flag is set
+			 * even though there are enough free
+			 * sections, node cleaning will continue.
+			 */
+			if (!sbi->need_node_clean)
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
+		sbi->need_node_clean = false;
+	}
 
 	trace_f2fs_gc_end(sbi->sb, ret, total_freed, total_sec_freed,
 				get_pages(sbi, F2FS_DIRTY_NODES),
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
