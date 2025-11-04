Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C1DC3208C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 04 Nov 2025 17:24:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+KyiCak6fXSzvjkxsA9xWUSMxWg2vlEBJg5VPK9wr+o=; b=NrXr3nBFSZ+32t4jgEXC7zfpOi
	o67H+cIBp9+2EIkbOubplAxkWBrKUKkPXdyYBrtVBGy0JfwcmmEgFEpn+6ylCXZRB59rMaHRH4B1S
	dW7xE/bI5Psgn9Zf8sSfTyb+evhbvPGMjmjKcwf2bdOurMuO4SshACWfHxlXnijUTqFI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vGJpT-0003MX-SW;
	Tue, 04 Nov 2025 16:24:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1vGJpS-0003MJ-Dp
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Nov 2025 16:24:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t+aFUuc/PhUUnMvNqeA3BrrNlM4VlPvW3HgAoMoPy9c=; b=N4OtFxVDW0cyBk5TqikI70o0SZ
 rq84ikeB28P8D10hp2yJQvjYvQgL9HiaKNfS5tBNaQc0xrQFHLVuZG/YSSqyln5ECwqz6dW2YtSLr
 ZKdx5nUyen39i9g4FaWG/exAH+hWGh0nMqN3vlL/rOsgYShYQYR+jESv90UuT+MlfaDM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=t+aFUuc/PhUUnMvNqeA3BrrNlM4VlPvW3HgAoMoPy9c=; b=f
 PhscIFM1J8TxdMK4WTuUfA3lo9WhhJr7stOpu0TTMA1sVVQfCUwt9TBsE46R4lDUzy5URZdh8k9S6
 ftEfxwFbedAHfG3SMlugCfOyzcgBgDiBjXG6C0hYJ93ff/VJnueI4jEo8F6jv7UkK4LIdCuOFRZhz
 P6nRay/vOAECYE2s=;
Received: from mail-pl1-f170.google.com ([209.85.214.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vGJpR-00074s-VG for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Nov 2025 16:24:19 +0000
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-26d0fbe238bso45783095ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 04 Nov 2025 08:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762273447; x=1762878247; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t+aFUuc/PhUUnMvNqeA3BrrNlM4VlPvW3HgAoMoPy9c=;
 b=BL/5sWEboieXslYohP6PeAseyrUeVG3L4x0Oo0tegNBdXZjzj5StMH4eprfPc6EXRL
 lK1KNkISwOlpLi5VFo/iQZQXWJdZgy0diUaLFQRD21m/tqkKdi5orzhSXhbOzY4Nlyji
 5SizqveuoWGzD8T4c1zjERZCWgdLPQZPKcbKEc9BHSzHWu7FaM5d0NXOvYstNMO952rj
 so/MxqNMPGHYe/AzAKz34NsZN3L367zzLGQCA8OuK+5CI3CfkgOiviC5uNXC09UArW5J
 1hOTgtRmtmSglgLO+ic1dkrBSgsG5SIRCyF38iuKjari4m/qAHLsMAl6tnV4ebrqmGrn
 w7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762273447; x=1762878247;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t+aFUuc/PhUUnMvNqeA3BrrNlM4VlPvW3HgAoMoPy9c=;
 b=Zma9BPFHHkTjiIYs8dtkNhKtnnGcpGmWprNwUgnKXvgqtHNt2X9lcjhLacqlhtOOmz
 zAZiK3ljSuWU/ms8FJXZvx8RRjflqVyidKFkz1tSNq+J7LxPLKN+qFlkOW44CyrWip9Q
 jVy0W/eQT1AKHaT/WdsHho2u36JVagbAWz/PpEJTIxlDkG3xbPV2aps18ftSLWkktcSC
 mdDjoxceB1aHI3kHpsAkzI1qzbDnmwjML2hENqDxfuiWqYxUdMHunxEB00uEu+qghrS8
 8A9ZV3gV/eJ9ehUaeeoOkUbaE+QcX044Z7hfsGaKGmLzX/G501jB7MQvHl3F/OlkDleI
 oCbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcwU7Vf6vwmh/KQ3BNLb4DmVh5QZXDCGtfh2u0SD80ONPpTRch/Ph8OgrZwx6uo1cidRaMtrsRQ6dAvRDofeS+@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxjE+PENUWQXEKXojt2/qz14yfa3URBE2rUenMH6EWIb2mwrAtn
 dKqvqeDdT+P1pWcEBNe52xeZQY/IYYi1lEzDtLTd9PQ6TZf0IYpYc1BS
X-Gm-Gg: ASbGncvzA4obwh6pt3dXCuMrTp2xwaHzylobQA9XfhY3sdqwtIR51Xo1vDBGpLwTDpK
 +aeH9YBSkbiZ8WPkIOi8vCPK/7smTpxHIEPJSs06Da/ioXw9Vbjuqym7grUGk697EVSB8ePuDQC
 AGMBYdmx0ug9F2hBgV9pwt5CBfpoOLHHT3hp2r9K5QoENnVKYE30Cv3phSLcC2fKSQKbtihFgKb
 WzpB0lCPFj2MqZgZEmkIDkUPn6Q+vIrSAPgcbDKH1NdVjAjqgIzxwJE1vZaftK2eEfQKO63HDLc
 tA4cj9hRvp2F9scatQGWjHg7c8WGtajFoNcECEzKM6Tc+GgWl07ST46XUUrKZ5DAV9RgTWDIVW2
 cpD6pYK0auUARe3yF/3GnVWxOFbskDpfwvG/ZzZ42YtUwI7dZirXHEC8dC4PzjTR1stryXDpAFC
 1DVGRmTaFJZhpvwHOgYe27xR7Ky3yrfiD6TgxRa8W5uyQ98dLkhXOHEa1imPGmsNS0ZX3GwdwNB
 5IZfw==
X-Google-Smtp-Source: AGHT+IFuzIb6zSN3gQZI02V0lX7o0v3C33Kxsq7XtI3FJQniceg4vQzXN1auk5zlHOqXKiuALsXuUw==
X-Received: by 2002:a17:902:f602:b0:274:5030:2906 with SMTP id
 d9443c01a7336-2962adb40a5mr2387535ad.46.1762273447115; 
 Tue, 04 Nov 2025 08:24:07 -0800 (PST)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e7c:8:7b63:d7ee:4b43:91a7])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29601998ff7sm31939145ad.44.2025.11.04.08.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 08:24:06 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue,  4 Nov 2025 08:24:02 -0800
Message-ID: <20251104162402.928582-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.51.2.1026.g39e6a42477-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong The recent increase in the number of
 Segment
 Summary Area (SSA) entries from 512 to 2048 was an unintentional change in
 logic of 16kb block support. This commit corrects the issue. 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.170 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vGJpR-00074s-VG
Subject: [f2fs-dev] [PATCH] f2fs: revert summary entry count from 2048 to
 512 in 16kb block support
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

The recent increase in the number of Segment Summary Area (SSA) entries
from 512 to 2048 was an unintentional change in logic of 16kb block
support. This commit corrects the issue.

To better utilize the space available from the erroneous 2048-entry
calculation, we are implementing a solution to share the currently
unused SSA space with neighboring segments. This enhances overall
SSA utilization without impacting the established 8MB segment size.

Fixes: d7e9a9037de2 ("f2fs: Support Block Size == Page Size")
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
v5: add the feature to sysfs feature and feature_list
v4: add a feature to prevent from mounting deprecated format
v3: error handling for a failure of f2fs_get_meta_folio().
v2: detect legacy layout and prevent mount.
---
 fs/f2fs/f2fs.h          |   2 +
 fs/f2fs/gc.c            | 117 +++++++++++++++++++++++-----------------
 fs/f2fs/recovery.c      |   2 +-
 fs/f2fs/segment.c       |  29 ++++++----
 fs/f2fs/segment.h       |   8 ++-
 fs/f2fs/super.c         |  14 +++++
 fs/f2fs/sysfs.c         |   7 +++
 include/linux/f2fs_fs.h |   5 +-
 8 files changed, 121 insertions(+), 63 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b6e35fdd5fd3..c851364de529 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -245,6 +245,7 @@ struct f2fs_mount_info {
 #define F2FS_FEATURE_COMPRESSION		0x00002000
 #define F2FS_FEATURE_RO				0x00004000
 #define F2FS_FEATURE_DEVICE_ALIAS		0x00008000
+#define F2FS_FEATURE_PACKED_SSA			0x00010000
 
 #define __F2FS_HAS_FEATURE(raw_super, mask)				\
 	((raw_super->feature & cpu_to_le32(mask)) != 0)
@@ -4710,6 +4711,7 @@ F2FS_FEATURE_FUNCS(casefold, CASEFOLD);
 F2FS_FEATURE_FUNCS(compression, COMPRESSION);
 F2FS_FEATURE_FUNCS(readonly, RO);
 F2FS_FEATURE_FUNCS(device_alias, DEVICE_ALIAS);
+F2FS_FEATURE_FUNCS(packed_ssa, PACKED_SSA);
 
 #ifdef CONFIG_BLK_DEV_ZONED
 static inline bool f2fs_zone_is_seq(struct f2fs_sb_info *sbi, int devi,
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 8abf521530ff..af2f4d28462c 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1732,7 +1732,7 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 	unsigned char type = IS_DATASEG(get_seg_entry(sbi, segno)->type) ?
 						SUM_TYPE_DATA : SUM_TYPE_NODE;
 	unsigned char data_type = (type == SUM_TYPE_DATA) ? DATA : NODE;
-	int submitted = 0;
+	int submitted = 0, sum_blk_cnt;
 
 	if (__is_large_section(sbi)) {
 		sec_end_segno = rounddown(end_segno, SEGS_PER_SEC(sbi));
@@ -1766,22 +1766,28 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 
 	sanity_check_seg_type(sbi, get_seg_entry(sbi, segno)->type);
 
+	segno = rounddown(segno, SUMS_PER_BLOCK);
+	sum_blk_cnt = DIV_ROUND_UP(end_segno - segno, SUMS_PER_BLOCK);
 	/* readahead multi ssa blocks those have contiguous address */
 	if (__is_large_section(sbi))
 		f2fs_ra_meta_pages(sbi, GET_SUM_BLOCK(sbi, segno),
-					end_segno - segno, META_SSA, true);
+					sum_blk_cnt, META_SSA, true);
 
 	/* reference all summary page */
 	while (segno < end_segno) {
-		struct folio *sum_folio = f2fs_get_sum_folio(sbi, segno++);
+		struct folio *sum_folio = f2fs_get_sum_folio(sbi, segno);
+
+		segno += SUMS_PER_BLOCK;
 		if (IS_ERR(sum_folio)) {
 			int err = PTR_ERR(sum_folio);
 
-			end_segno = segno - 1;
-			for (segno = start_segno; segno < end_segno; segno++) {
+			end_segno = segno - SUMS_PER_BLOCK;
+			segno = rounddown(start_segno, SUMS_PER_BLOCK);
+			while (segno < end_segno) {
 				sum_folio = filemap_get_folio(META_MAPPING(sbi),
 						GET_SUM_BLOCK(sbi, segno));
 				folio_put_refs(sum_folio, 2);
+				segno += SUMS_PER_BLOCK;
 			}
 			return err;
 		}
@@ -1790,68 +1796,83 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 
 	blk_start_plug(&plug);
 
-	for (segno = start_segno; segno < end_segno; segno++) {
-		struct f2fs_summary_block *sum;
+	segno = start_segno;
+	while (segno < end_segno) {
+		unsigned int cur_segno;
 
 		/* find segment summary of victim */
 		struct folio *sum_folio = filemap_get_folio(META_MAPPING(sbi),
 					GET_SUM_BLOCK(sbi, segno));
+		unsigned int block_end_segno = rounddown(segno, SUMS_PER_BLOCK)
+					+ SUMS_PER_BLOCK;
+
+		if (block_end_segno > end_segno)
+			block_end_segno = end_segno;
 
 		if (is_cursec(sbi, GET_SEC_FROM_SEG(sbi, segno))) {
 			f2fs_err(sbi, "%s: segment %u is used by log",
 							__func__, segno);
 			f2fs_bug_on(sbi, 1);
-			goto skip;
+			goto next_block;
 		}
 
-		if (get_valid_blocks(sbi, segno, false) == 0)
-			goto freed;
-		if (gc_type == BG_GC && __is_large_section(sbi) &&
-				migrated >= sbi->migration_granularity)
-			goto skip;
 		if (!folio_test_uptodate(sum_folio) ||
 		    unlikely(f2fs_cp_error(sbi)))
-			goto skip;
+			goto next_block;
 
-		sum = folio_address(sum_folio);
-		if (type != GET_SUM_TYPE((&sum->footer))) {
-			f2fs_err(sbi, "Inconsistent segment (%u) type [%d, %d] in SIT and SSA",
-				 segno, type, GET_SUM_TYPE((&sum->footer)));
-			f2fs_stop_checkpoint(sbi, false,
-				STOP_CP_REASON_CORRUPTED_SUMMARY);
-			goto skip;
-		}
+		for (cur_segno = segno; cur_segno < block_end_segno;
+				cur_segno++) {
+			struct f2fs_summary_block *sum;
 
-		/*
-		 * this is to avoid deadlock:
-		 * - lock_page(sum_page)         - f2fs_replace_block
-		 *  - check_valid_map()            - down_write(sentry_lock)
-		 *   - down_read(sentry_lock)     - change_curseg()
-		 *                                  - lock_page(sum_page)
-		 */
-		if (type == SUM_TYPE_NODE)
-			submitted += gc_node_segment(sbi, sum->entries, segno,
-								gc_type);
-		else
-			submitted += gc_data_segment(sbi, sum->entries, gc_list,
-							segno, gc_type,
-							force_migrate);
+			if (get_valid_blocks(sbi, cur_segno, false) == 0)
+				goto freed;
+			if (gc_type == BG_GC && __is_large_section(sbi) &&
+					migrated >= sbi->migration_granularity)
+				continue;
 
-		stat_inc_gc_seg_count(sbi, data_type, gc_type);
-		sbi->gc_reclaimed_segs[sbi->gc_mode]++;
-		migrated++;
+			sum = SUM_BLK_PAGE_ADDR(sum_folio, cur_segno);
+			if (type != GET_SUM_TYPE((&sum->footer))) {
+				f2fs_err(sbi, "Inconsistent segment (%u) type "
+						"[%d, %d] in SSA and SIT",
+						cur_segno, type,
+						GET_SUM_TYPE((&sum->footer)));
+				f2fs_stop_checkpoint(sbi, false,
+						STOP_CP_REASON_CORRUPTED_SUMMARY);
+				continue;
+			}
 
-freed:
-		if (gc_type == FG_GC &&
-				get_valid_blocks(sbi, segno, false) == 0)
-			seg_freed++;
+			/*
+			 * this is to avoid deadlock:
+			 *  - lock_page(sum_page)     - f2fs_replace_block
+			 *   - check_valid_map()        - down_write(sentry_lock)
+			 *    - down_read(sentry_lock) - change_curseg()
+			 *                               - lock_page(sum_page)
+			 */
+			if (type == SUM_TYPE_NODE)
+				submitted += gc_node_segment(sbi, sum->entries,
+						cur_segno, gc_type);
+			else
+				submitted += gc_data_segment(sbi, sum->entries,
+						gc_list, cur_segno,
+						gc_type, force_migrate);
 
-		if (__is_large_section(sbi))
-			sbi->next_victim_seg[gc_type] =
-				(segno + 1 < sec_end_segno) ?
-					segno + 1 : NULL_SEGNO;
-skip:
+			stat_inc_gc_seg_count(sbi, data_type, gc_type);
+			sbi->gc_reclaimed_segs[sbi->gc_mode]++;
+			migrated++;
+
+freed:
+			if (gc_type == FG_GC &&
+					get_valid_blocks(sbi, cur_segno, false) == 0)
+				seg_freed++;
+
+			if (__is_large_section(sbi))
+				sbi->next_victim_seg[gc_type] =
+					(cur_segno + 1 < sec_end_segno) ?
+					cur_segno + 1 : NULL_SEGNO;
+		}
+next_block:
 		folio_put_refs(sum_folio, 2);
+		segno = block_end_segno;
 	}
 
 	if (submitted)
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 215e442db72c..af72309b9bfc 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -519,7 +519,7 @@ static int check_index_in_prev_nodes(struct f2fs_sb_info *sbi,
 	sum_folio = f2fs_get_sum_folio(sbi, segno);
 	if (IS_ERR(sum_folio))
 		return PTR_ERR(sum_folio);
-	sum_node = folio_address(sum_folio);
+	sum_node = SUM_BLK_PAGE_ADDR(sum_folio, segno);
 	sum = sum_node->entries[blkoff];
 	f2fs_folio_put(sum_folio, true);
 got_it:
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index b45eace879d7..77aa2125b8ca 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2712,7 +2712,10 @@ struct folio *f2fs_get_sum_folio(struct f2fs_sb_info *sbi, unsigned int segno)
 void f2fs_update_meta_page(struct f2fs_sb_info *sbi,
 					void *src, block_t blk_addr)
 {
-	struct folio *folio = f2fs_grab_meta_folio(sbi, blk_addr);
+	struct folio *folio = f2fs_get_meta_folio_retry(sbi, blk_addr);
+
+	if (IS_ERR(folio))
+		return;
 
 	memcpy(folio_address(folio), src, PAGE_SIZE);
 	folio_mark_dirty(folio);
@@ -2720,9 +2723,17 @@ void f2fs_update_meta_page(struct f2fs_sb_info *sbi,
 }
 
 static void write_sum_page(struct f2fs_sb_info *sbi,
-			struct f2fs_summary_block *sum_blk, block_t blk_addr)
+		struct f2fs_summary_block *sum_blk, unsigned int segno)
 {
-	f2fs_update_meta_page(sbi, (void *)sum_blk, blk_addr);
+	struct folio *folio;
+
+	folio = f2fs_get_sum_folio(sbi, segno);
+	if (IS_ERR(folio))
+		return;
+
+	memcpy(SUM_BLK_PAGE_ADDR(folio, segno), sum_blk, sizeof(*sum_blk));
+	folio_mark_dirty(folio);
+	f2fs_folio_put(folio, true);
 }
 
 static void write_current_sum_page(struct f2fs_sb_info *sbi,
@@ -2987,7 +2998,7 @@ static int new_curseg(struct f2fs_sb_info *sbi, int type, bool new_sec)
 	int ret;
 
 	if (curseg->inited)
-		write_sum_page(sbi, curseg->sum_blk, GET_SUM_BLOCK(sbi, segno));
+		write_sum_page(sbi, curseg->sum_blk, segno);
 
 	segno = __get_next_segno(sbi, type);
 	ret = get_new_segment(sbi, &segno, new_sec, pinning);
@@ -3046,7 +3057,7 @@ static int change_curseg(struct f2fs_sb_info *sbi, int type)
 	struct folio *sum_folio;
 
 	if (curseg->inited)
-		write_sum_page(sbi, curseg->sum_blk, GET_SUM_BLOCK(sbi, curseg->segno));
+		write_sum_page(sbi, curseg->sum_blk, curseg->segno);
 
 	__set_test_and_inuse(sbi, new_segno);
 
@@ -3065,7 +3076,7 @@ static int change_curseg(struct f2fs_sb_info *sbi, int type)
 		memset(curseg->sum_blk, 0, SUM_ENTRY_SIZE);
 		return PTR_ERR(sum_folio);
 	}
-	sum_node = folio_address(sum_folio);
+	sum_node = SUM_BLK_PAGE_ADDR(sum_folio, new_segno);
 	memcpy(curseg->sum_blk, sum_node, SUM_ENTRY_SIZE);
 	f2fs_folio_put(sum_folio, true);
 	return 0;
@@ -3154,8 +3165,7 @@ static void __f2fs_save_inmem_curseg(struct f2fs_sb_info *sbi, int type)
 		goto out;
 
 	if (get_valid_blocks(sbi, curseg->segno, false)) {
-		write_sum_page(sbi, curseg->sum_blk,
-				GET_SUM_BLOCK(sbi, curseg->segno));
+		write_sum_page(sbi, curseg->sum_blk, curseg->segno);
 	} else {
 		mutex_lock(&DIRTY_I(sbi)->seglist_lock);
 		__set_test_and_free(sbi, curseg->segno, true);
@@ -3833,8 +3843,7 @@ int f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct folio *folio,
 	if (segment_full) {
 		if (type == CURSEG_COLD_DATA_PINNED &&
 		    !((curseg->segno + 1) % sbi->segs_per_sec)) {
-			write_sum_page(sbi, curseg->sum_blk,
-					GET_SUM_BLOCK(sbi, curseg->segno));
+			write_sum_page(sbi, curseg->sum_blk, curseg->segno);
 			reset_curseg_fields(curseg);
 			goto skip_new_segment;
 		}
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 1ce2c8abaf48..e883f14c228f 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -85,8 +85,12 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
 #define GET_ZONE_FROM_SEG(sbi, segno)				\
 	GET_ZONE_FROM_SEC(sbi, GET_SEC_FROM_SEG(sbi, segno))
 
-#define GET_SUM_BLOCK(sbi, segno)				\
-	((sbi)->sm_info->ssa_blkaddr + (segno))
+#define SUMS_PER_BLOCK (F2FS_BLKSIZE / F2FS_SUM_BLKSIZE)
+#define GET_SUM_BLOCK(sbi, segno)	\
+	(SM_I(sbi)->ssa_blkaddr + (segno / SUMS_PER_BLOCK))
+#define GET_SUM_BLKOFF(segno) (segno % SUMS_PER_BLOCK)
+#define SUM_BLK_PAGE_ADDR(folio, segno)	\
+	(folio_address(folio) + GET_SUM_BLKOFF(segno) * F2FS_SUM_BLKSIZE)
 
 #define GET_SUM_TYPE(footer) ((footer)->entry_type)
 #define SET_SUM_TYPE(footer, type) ((footer)->entry_type = (type))
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 6e52e36c1f1a..707e24551fdd 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4052,6 +4052,20 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 	if (sanity_check_area_boundary(sbi, folio, index))
 		return -EFSCORRUPTED;
 
+	/*
+	 * Check for legacy summary layout on 16KB+ block devices.
+	 * Modern f2fs-tools packs multiple 4KB summary areas into one block,
+	 * whereas legacy versions used one block per summary, leading
+	 * to a much larger SSA.
+	 */
+	if (SUMS_PER_BLOCK > 1 &&
+		    !(__F2FS_HAS_FEATURE(raw_super, F2FS_FEATURE_PACKED_SSA))) {
+		f2fs_info(sbi, "Error: Device formatted with a legacy version. "
+			"Please reformat with a tool supporting the packed ssa "
+			"feature for block sizes larger than 4kb.");
+		return -EOPNOTSUPP;
+	}
+
 	return 0;
 }
 
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 6d2a4fba68a2..5685b454bfd1 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -235,6 +235,9 @@ static ssize_t features_show(struct f2fs_attr *a,
 	if (f2fs_sb_has_compression(sbi))
 		len += sysfs_emit_at(buf, len, "%s%s",
 				len ? ", " : "", "compression");
+	if (f2fs_sb_has_packed_ssa(sbi))
+		len += sysfs_emit_at(buf, len, "%s%s",
+				len ? ", " : "", "packed_ssa");
 	len += sysfs_emit_at(buf, len, "%s%s",
 				len ? ", " : "", "pin_file");
 	len += sysfs_emit_at(buf, len, "\n");
@@ -1296,6 +1299,7 @@ F2FS_FEATURE_RO_ATTR(pin_file);
 #ifdef CONFIG_UNICODE
 F2FS_FEATURE_RO_ATTR(linear_lookup);
 #endif
+F2FS_FEATURE_RO_ATTR(packed_ssa);
 
 #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
 static struct attribute *f2fs_attrs[] = {
@@ -1455,6 +1459,7 @@ static struct attribute *f2fs_feat_attrs[] = {
 #ifdef CONFIG_UNICODE
 	BASE_ATTR_LIST(linear_lookup),
 #endif
+	BASE_ATTR_LIST(packed_ssa),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs_feat);
@@ -1490,6 +1495,7 @@ F2FS_SB_FEATURE_RO_ATTR(casefold, CASEFOLD);
 F2FS_SB_FEATURE_RO_ATTR(compression, COMPRESSION);
 F2FS_SB_FEATURE_RO_ATTR(readonly, RO);
 F2FS_SB_FEATURE_RO_ATTR(device_alias, DEVICE_ALIAS);
+F2FS_SB_FEATURE_RO_ATTR(packed_ssa, PACKED_SSA);
 
 static struct attribute *f2fs_sb_feat_attrs[] = {
 	ATTR_LIST(sb_encryption),
@@ -1507,6 +1513,7 @@ static struct attribute *f2fs_sb_feat_attrs[] = {
 	ATTR_LIST(sb_compression),
 	ATTR_LIST(sb_readonly),
 	ATTR_LIST(sb_device_alias),
+	ATTR_LIST(sb_packed_ssa),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs_sb_feat);
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 6afb4a13b81d..a7880787cad3 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -17,6 +17,7 @@
 #define F2FS_LOG_SECTORS_PER_BLOCK	(PAGE_SHIFT - 9) /* log number for sector/blk */
 #define F2FS_BLKSIZE			PAGE_SIZE /* support only block == page */
 #define F2FS_BLKSIZE_BITS		PAGE_SHIFT /* bits for F2FS_BLKSIZE */
+#define F2FS_SUM_BLKSIZE		4096	/* only support 4096 byte sum block */
 #define F2FS_MAX_EXTENSION		64	/* # of extension entries */
 #define F2FS_EXTENSION_LEN		8	/* max size of extension */
 
@@ -441,7 +442,7 @@ struct f2fs_sit_block {
  * from node's page's beginning to get a data block address.
  * ex) data_blkaddr = (block_t)(nodepage_start_address + ofs_in_node)
  */
-#define ENTRIES_IN_SUM		(F2FS_BLKSIZE / 8)
+#define ENTRIES_IN_SUM		(F2FS_SUM_BLKSIZE / 8)
 #define	SUMMARY_SIZE		(7)	/* sizeof(struct f2fs_summary) */
 #define	SUM_FOOTER_SIZE		(5)	/* sizeof(struct summary_footer) */
 #define SUM_ENTRY_SIZE		(SUMMARY_SIZE * ENTRIES_IN_SUM)
@@ -467,7 +468,7 @@ struct summary_footer {
 	__le32 check_sum;		/* summary checksum */
 } __packed;
 
-#define SUM_JOURNAL_SIZE	(F2FS_BLKSIZE - SUM_FOOTER_SIZE -\
+#define SUM_JOURNAL_SIZE	(F2FS_SUM_BLKSIZE - SUM_FOOTER_SIZE -\
 				SUM_ENTRY_SIZE)
 #define NAT_JOURNAL_ENTRIES	((SUM_JOURNAL_SIZE - 2) /\
 				sizeof(struct nat_journal_entry))
-- 
2.51.2.1026.g39e6a42477-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
