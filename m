Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BE27C6AE2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Oct 2023 12:22:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qqspe-0006Kv-OE;
	Thu, 12 Oct 2023 10:22:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yonggil.song@samsung.com>) id 1qqspd-0006Kp-50
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Oct 2023 10:22:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:To:From:Sender:Reply-To:Subject:Mime-Version:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=acU0J9TSNbIbQcMu1xuBH+sAxB1ljWmdGW+RiRdHfUI=; b=bBGjwOUzzGylrojGFdpJ2obQyt
 St3S/WxjvDVzeL+TMYvcmhzcLu3WV4EicJ2+w0tn9eeXsIyhqGCjbpww2SboP7AZKk3didXU5/uZ7
 NDkfVdRffK7QZ3zNrn0YFvtYOi8J7zOwNOzk+9mAamHjzUOo9EuxUnbgF0WQIGYzbWxk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:To:From
 :Sender:Reply-To:Subject:Mime-Version:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=acU0J9TSNbIbQcMu1xuBH+sAxB1ljWmdGW+RiRdHfUI=; b=j
 unag+o/DZDpZdxzJvU6cqWLDHFH5Gv5uvdOtt8LB6JN8/9SD3CuJsI2ZBjZIuJ4es8q+mdJVVQ4oa
 xCR/hp97HkM8ULqdYzGh2+r53kXiYLaAuUxiXELtNDGF6h7FTf30oHy0cL4uGh+QTw0ubzW/N5Pwv
 UZvOCiwSlnSddE/Q=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qqspY-0007TU-SW for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Oct 2023 10:22:17 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20231012100347epoutp019e8abfd611408b787725e847e226a779~NVAfacudd0536205362epoutp01i
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 12 Oct 2023 10:03:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20231012100347epoutp019e8abfd611408b787725e847e226a779~NVAfacudd0536205362epoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1697105027;
 bh=acU0J9TSNbIbQcMu1xuBH+sAxB1ljWmdGW+RiRdHfUI=;
 h=Subject:Reply-To:From:To:Date:References:From;
 b=GZy1f7D0fxPeeZAOyNVkN1MhnfTRNZy0mCROFJftpzm5SJVAVq69hhjKP93xFE3fp
 /Y1czrYZxs2N9+r0bJYJyrVktB+/mCuViYqdsveYidJwsgngydk4hLzn5hzNO2gIUz
 ZE91oG1951RJcXFUawnHO9tZ+kpAIFXS2jc7SvqM=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20231012100346epcas2p489295c2c23a02b5b04e3f72e5718ffc5~NVAe7pzNw0605806058epcas2p4A;
 Thu, 12 Oct 2023 10:03:46 +0000 (GMT)
Received: from epsmgec2p1-new.samsung.com (unknown [182.195.36.88]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4S5lb61tcFz4x9Pv; Thu, 12 Oct
 2023 10:03:46 +0000 (GMT)
X-AuditID: b6c32a4d-dc5ff70000004c0f-ec-6527c482d61c
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmgec2p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
 54.9F.19471.284C7256; Thu, 12 Oct 2023 19:03:46 +0900 (KST)
Mime-Version: 1.0
From: Yonggil Song <yonggil.song@samsung.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Seokhwan Kim <sukka.kim@samsung.com>, Daejun
 Park <daejun7.park@samsung.com>, Siwoo Jung <siu.jung@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20231012100345epcms2p84b95e24ee5e7965858ab8be99fbc3eff@epcms2p8>
Date: Thu, 12 Oct 2023 19:03:45 +0900
X-CMS-MailID: 20231012100345epcms2p84b95e24ee5e7965858ab8be99fbc3eff
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmplk+LIzCtJLcpLzFFi42LZdljTXLfpiHqqQdtxLovTU88yWTw50M5o
 sepBuMWT9bOYLRa2LWGxuLTI3eLyrjlsFucnvmayWNUxl9GB02PTqk42j90LPjN5LO6bzOrR
 t2UVo8fnTXIBrFHZNhmpiSmpRQqpecn5KZl56bZK3sHxzvGmZgaGuoaWFuZKCnmJuam2Si4+
 AbpumTlA5ygplCXmlAKFAhKLi5X07WyK8ktLUhUy8otLbJVSC1JyCswL9IoTc4tL89L18lJL
 rAwNDIxMgQoTsjPOH/vPWnA8oGLV/M/sDYwb7bsYOTkkBEwk5v79zdLFyMUhJLCHUWLN3F/M
 XYwcHLwCghJ/dwiD1AgLmEpsOb2bDcQWElCSuHaglwUiri+xefEydhCbTUBX4u+G5WC2iMBe
 ZomejzkQ83klZrQ/ZYGwpSW2L9/KCGFrSPxY1ssMYYtK3Fz9lh3Gfn9sPlSNiETrvbNQNYIS
 D37uhopLSiw6dJ4Jws6X+LviOhuEXSOxtaENKq4vca1jI9heXgFfidvNt8HmswioSkzt6GGF
 qHGRmPB4Ddh8ZgF5ie1v54C9ziygKbF+lz6IKSGgLHHkFgtEBZ9Ex+G/7DBf7Zj3BGqTmsTm
 TZuhJspIXHjcBnWlh8T0nduZIKEWKLH0yAK2CYzysxBhOwvJ3lkIexcwMq9ilEotKM5NT002
 KjDUzUsth0dpcn7uJkZwetTy3cH4ev1fvUOMTByMhxglOJiVRHgfZaqkCvGmJFZWpRblxxeV
 5qQWH2I0Bfp6IrOUaHI+MEHnlcQbmlgamJiZGZobmRqYK4nz3mudmyIkkJ5YkpqdmlqQWgTT
 x8TBKdXAZKD2Za/ok9ydehOZkp5NZbs7q9rNML5jc8gDt8W7vhaJT16+7KDPk029z7e43DAz
 KOGe9TDywII2f4tPc81nTFYPVHMOe5Ln4vn71JGYKAUr9h72lHrBZ/mXtKMP9S79EPf/3t6Q
 xd13c49oXww1Vs97cEzOeKWkl/BmoZhZd2vnnPfbv+DWXTubw99FXVdxiKfPf7BJzNR8zu2b
 krNNuSKYJ8bo1FjP900J2Dzvf8OZ824iIe35c9Wz+vc/ki6untz5qGr3z0numef/rfk45dHO
 S93GXxec+t7w1kpzTb7Y+dIr7h2TOa63977kY+BMKbrLf/T4T+cHahmP/iyL7mGZ87bl+V6u
 W20n3T/u41ZiKc5INNRiLipOBAAhp/BiGAQAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231012100345epcms2p84b95e24ee5e7965858ab8be99fbc3eff
References: <CGME20231012100345epcms2p84b95e24ee5e7965858ab8be99fbc3eff@epcms2p8>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Overview ======== Introduce a new way to select the data
 section
 first when selecting a victim in foreground GC. This victim selection method
 works when the prefer_data_victim mount option is enabled. If foreground
 GC [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.24 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qqspY-0007TU-SW
Subject: [f2fs-dev] [PATCH v1] f2fs: New victim selection for GC
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

Introduce a new way to select the data section first when selecting a
victim in foreground GC. This victim selection method works when the
prefer_data_victim mount option is enabled. If foreground GC migrates only
data sections and runs out of free sections, it cleans dirty node sections
to get more free sections.

Problem
=======

If the total amount of nodes is larger than the size of one section, nodes
occupy multiple sections, and node victims are often selected because the
gc cost is lowered by data block migration in foreground gc. Since moving
the data section causes frequent node victim selection, victim threshing
occurs in the node section. This results in an increase in WAF.

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
	  - mount -o prefer_data_victim <conv null_blk> <mount point>
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
 Documentation/filesystems/f2fs.rst |   3 +
 fs/f2fs/f2fs.h                     |   2 +
 fs/f2fs/gc.c                       | 100 +++++++++++++++++++++++------
 fs/f2fs/segment.h                  |   2 +
 fs/f2fs/super.c                    |   9 +++
 5 files changed, 95 insertions(+), 21 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index d32c6209685d..58e6d001d7ab 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -367,6 +367,9 @@ errors=%s		 Specify f2fs behavior on critical errors. This supports modes:
 			 pending node write	drop		keep		N/A
 			 pending meta write	keep		keep		N/A
 			 ====================== =============== =============== ========
+prefer_data_victim	 When selecting victims in foreground GC, victims of data type
+			 are prioritized. This option minimizes GC victim threshing
+			 in the node section to reduce WAF.
 ======================== ============================================================
 
 Debugfs Entries
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 6d688e42d89c..8b31fa2ea09a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -108,6 +108,7 @@ extern const char *f2fs_fault_name[FAULT_MAX];
 #define	F2FS_MOUNT_GC_MERGE		0x02000000
 #define F2FS_MOUNT_COMPRESS_CACHE	0x04000000
 #define F2FS_MOUNT_AGE_EXTENT_CACHE	0x08000000
+#define F2FS_MOUNT_PREFER_DATA_VICTIM	0x10000000
 
 #define F2FS_OPTION(sbi)	((sbi)->mount_opt)
 #define clear_opt(sbi, option)	(F2FS_OPTION(sbi).opt &= ~F2FS_MOUNT_##option)
@@ -1648,6 +1649,7 @@ struct f2fs_sb_info {
 	struct f2fs_mount_info mount_opt;	/* mount options */
 
 	/* for cleaning operations */
+	bool need_node_clean;			/* only used for prefer_data_victim */
 	struct f2fs_rwsem gc_lock;		/*
 						 * semaphore for GC, avoid
 						 * race between GC and GC or CP
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index f550cdeaa663..8a2da808a5fb 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -752,6 +752,8 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
 	unsigned int last_segment;
 	unsigned int nsearched;
 	bool is_atgc;
+	bool is_prefer_data_victim =
+		test_opt(sbi, PREFER_DATA_VICTIM) && gc_type == FG_GC;
 	int ret = 0;
 
 	mutex_lock(&dirty_i->seglist_lock);
@@ -767,6 +769,11 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
 	p.oldest_age = 0;
 	p.min_cost = get_max_cost(sbi, &p);
 
+	if (is_prefer_data_victim) {
+		p.node_min_cost = p.min_cost;
+		p.node_min_segno = p.min_segno;
+	}
+
 	is_atgc = (p.gc_mode == GC_AT || p.alloc_mode == AT_SSR);
 	nsearched = 0;
 
@@ -884,9 +891,25 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
 
 		cost = get_gc_cost(sbi, segno, &p);
 
-		if (p.min_cost > cost) {
-			p.min_segno = segno;
-			p.min_cost = cost;
+		if (is_prefer_data_victim) {
+			if (IS_DATASEG(get_seg_entry(sbi, segno)->type)) {
+				/* update data segments victim */
+				if (p.min_cost > cost) {
+					p.min_segno = segno;
+					p.min_cost = cost;
+				}
+			} else {
+				/* update node segments victim */
+				if (p.node_min_cost > cost) {
+					p.node_min_segno = segno;
+					p.node_min_cost = cost;
+				}
+			}
+		} else {
+			if (p.min_cost > cost) {
+				p.min_segno = segno;
+				p.min_cost = cost;
+			}
 		}
 next:
 		if (nsearched >= p.max_search) {
@@ -901,6 +924,25 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
 		}
 	}
 
+	if (is_prefer_data_victim && sbi->need_node_clean) {
+		/* we need to clean node sections */
+		if (p.min_cost > p.node_min_cost) {
+			p.min_segno = p.node_min_segno;
+			p.min_cost = p.node_min_cost;
+		} else {
+			/*
+			 * data victim cost is the lowest.
+			 * if free sections are enough, stop cleaning node victim.
+			 * if not, it goes on by GCing data victims.
+			 */
+			if (has_enough_free_secs(sbi, prefree_segments(sbi), 0)) {
+				sbi->need_node_clean = false;
+				p.min_segno = NULL_SEGNO;
+				goto out;
+			}
+		}
+	}
+
 	/* get victim for GC_AT/AT_SSR */
 	if (is_atgc) {
 		lookup_victim_by_age(sbi, &p);
@@ -1830,8 +1872,27 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 		goto stop;
 	}
 
+	__get_secs_required(sbi, NULL, &upper_secs, NULL);
+
+	/*
+	 * Write checkpoint to reclaim prefree segments.
+	 * We need more three extra sections for writer's data/node/dentry.
+	 */
+	if (free_sections(sbi) <= upper_secs + NR_GC_CHECKPOINT_SECS) {
+		if (test_opt(sbi, PREFER_DATA_VICTIM)) {
+			sbi->need_node_clean = true;
+		}
+		if (prefree_segments(sbi)) {
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
@@ -1882,7 +1943,17 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 			if (!gc_control->no_bg_gc &&
 			    total_sec_freed < gc_control->nr_free_secs)
 				goto go_gc_more;
-			goto stop;
+			if (test_opt(sbi, PREFER_DATA_VICTIM)) {
+				/*
+				 * If the need_node_clean flag is set
+				 * even though there are enough free
+				 * sections, node cleaning will continue.
+				 */
+				if (!sbi->need_node_clean)
+					goto stop;
+			} else {
+				goto stop;
+			}
 		}
 		if (sbi->skipped_gc_rwsem)
 			skipped_round++;
@@ -1897,21 +1968,6 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
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
@@ -1920,8 +1976,10 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 	SIT_I(sbi)->last_victim[ALLOC_NEXT] = 0;
 	SIT_I(sbi)->last_victim[FLUSH_DEVICE] = gc_control->victim_segno;
 
-	if (gc_type == FG_GC)
+	if (gc_type == FG_GC) {
 		f2fs_unpin_all_sections(sbi, true);
+		sbi->need_node_clean = false;
+	}
 
 	trace_f2fs_gc_end(sbi->sb, ret, total_freed, total_sec_freed,
 				get_pages(sbi, F2FS_DIRTY_NODES),
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 2ca8fb5d0dc4..d55fa1fee2e0 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -197,8 +197,10 @@ struct victim_sel_policy {
 	unsigned int offset;		/* last scanned bitmap offset */
 	unsigned int ofs_unit;		/* bitmap search unit */
 	unsigned int min_cost;		/* minimum cost */
+	unsigned int node_min_cost;	/* minimum cost of node type section */
 	unsigned long long oldest_age;	/* oldest age of segments having the same min cost */
 	unsigned int min_segno;		/* segment # having min. cost */
+	unsigned int node_min_segno;	/* node segment # having min. cost */
 	unsigned long long age;		/* mtime of GCed section*/
 	unsigned long long age_threshold;/* age threshold */
 };
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index a8c8232852bb..133137dd6fd0 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -165,6 +165,7 @@ enum {
 	Opt_memory_mode,
 	Opt_age_extent_cache,
 	Opt_errors,
+	Opt_prefer_data_victim,
 	Opt_err,
 };
 
@@ -245,6 +246,7 @@ static match_table_t f2fs_tokens = {
 	{Opt_memory_mode, "memory=%s"},
 	{Opt_age_extent_cache, "age_extent_cache"},
 	{Opt_errors, "errors=%s"},
+	{Opt_prefer_data_victim, "prefer_data_victim"},
 	{Opt_err, NULL},
 };
 
@@ -1286,6 +1288,13 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			}
 			kfree(name);
 			break;
+		case Opt_prefer_data_victim:
+			if (!f2fs_sb_has_blkzoned(sbi)) {
+				f2fs_err(sbi, "prefer_data_victim is only allowed with zoned block device feature");
+				return -EINVAL;
+			}
+			set_opt(sbi, PREFER_DATA_VICTIM);
+			break;
 		default:
 			f2fs_err(sbi, "Unrecognized mount option \"%s\" or missing value",
 				 p);
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
