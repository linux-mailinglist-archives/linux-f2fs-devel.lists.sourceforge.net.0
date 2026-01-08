Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 953BED00943
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 08 Jan 2026 02:46:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4Ukvftw9bIEn7S/E9WS7GsqwgLIiqdLba5YGdLo5aFY=; b=NqU6cjPAtEpMFRV8upCgRCDCu6
	Vd7KSsu2AQOaTXNM+VUc3SciZ0A51yJh6/RB2wKyGXA0n25ETNK0gFCohfw3SQiIwUVHc7D0WKbE2
	dPODM/LHSwmRJ1eB0j2bETlF1Lm5jDoJfs5daP37Mks6QIxS5Bz0hGej2tfCZ8jbWd0k=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdf6f-000637-Od;
	Thu, 08 Jan 2026 01:46:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1vdf6e-00062z-Ne
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jan 2026 01:46:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rGp7TLe8E0amemyucX7lIELOGrV/f5pltE7+toa8DH8=; b=DWEYWDGr1yudUQlFT460/4mbOS
 +TynbKQKbDXjw9nso65BN5GFtKbDiNAfq7nfmVrp0MLrT1Ypbs8Ng1V57FDfWfk+yYjQOdgFBsGIk
 0IOHpjfMbA2HOXUI13buWnW2LroQB3SHmFkoxLsZZhd87Ar3RiFBy8dAXp5FtDiNUs+k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rGp7TLe8E0amemyucX7lIELOGrV/f5pltE7+toa8DH8=; b=j
 I7ppq8B89dZ71zMqpsSjbRL2CDO3xC5bWnO84vEa6cj4w05pYcu+5wnj5tXHUWENs3hSlfKwT58I9
 nJbszSUOQtWbKT3e47S+sr1gYl0Qp79qI/N+EIUlI2CfSS0KsgSF5buCQj/UvzXbuN5eTtpO9djgX
 zWZKZrdDmqmH4zVY=;
Received: from mail-dy1-f177.google.com ([74.125.82.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vdf6d-0001Wi-90 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jan 2026 01:46:32 +0000
Received: by mail-dy1-f177.google.com with SMTP id
 5a478bee46e88-2b0ea1edf11so5100161eec.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 07 Jan 2026 17:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767836786; x=1768441586; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rGp7TLe8E0amemyucX7lIELOGrV/f5pltE7+toa8DH8=;
 b=bRUjJQMDPeOa33bkWFpeJpE1/4KQ8xNVqOug4KUxOrisJ+vgDp17NSIXowFENL1PwE
 P93DQuG2/8Je3heZ91Zpg58EAn0QlaS+xQIycTsNkkHVFxAqO3Z4sw7KoafJDR/C/gQd
 uPS/xRrbsHqyMd/xpOzfhyBzPH6DlnvxFmBVGI2S4nYk72ssv6Iawn7ztciXErOmomft
 NYI8Uu4LwUs3/ojpwbL4p/zzkwB8N7C5Jfr62af1u5X8aFpYHJ+Cc+sW+NYDz7N35QCe
 tz89cIM0PZE2m6bE2zWmQJPOjuFRcnrtuONhctHx2FMvUeyhseD5ZNVmwMJmhkPy3ZMj
 v7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767836786; x=1768441586;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rGp7TLe8E0amemyucX7lIELOGrV/f5pltE7+toa8DH8=;
 b=NOzTxqbRwxO849oJx29OTxM54Elce3tSTD1Q5WajSfXUl0u01qIumxN+VqjThuS22P
 JPUAjIvd34+CUT5WCNanmnCJp9iuLmr+XSKXdsEgTC8CriDJNOGnzctZnCWqAu9CPaj1
 /L+RuEJpnQnX8Wq0OJpPTBhYJdtbQXfiZxvMhPkuDn/0rTVS1+rEhbu9U3b7Rahd7yQq
 7+QhzRGFcVVsF8l8EaORZZ3bdG4Pbxp4WB+/W/ogCx1DudkhTeYAVoFmGmIjTylEnuIe
 SP7VcCyC/jJJW9/soHQmJdsa//rRCavl5gkWfIQXjo5+WCxbAj8P8dNUnbGwwTp0/vlg
 zYtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpKZPe/uxmDzxrNMbWxsOmKE7IdR2K7qpBHE+K4qxWGOhSZVSqj/xsTzotCP2vpTZDdt6lI5v6aCCZRndgVj+2@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwFEBiXwUVXu8+Eq3/JUZOv2GeuUBHIvEzOuwpbBgezxaqNHeyd
 tH2G94o4FRkjHRXSNoCtMxdZsr4LluEX+p9tj0g2tm6duWj2Eqzlv7Lz
X-Gm-Gg: AY/fxX61vlCwhNGjTY4dHU6Bp66Q+9iXpTLyLHDuaVhO8aZN9s/dvgRg3TtXApeS9Df
 jHA5qwYIc+ckuIRn9sFCj6U4dxAW4FtU4qp9EMcZmdmNEnoiBXGrxjU6iMWJKf4hWqibV7bUYDg
 GFPwxxHyYI+XuRZyM6MSQqlrANka9/AKAb6/txEKro7yr3XjFGhmktBngU7H6VGU/o0yk2ZTNDZ
 0rSBIx7UXxBlGFBNhER7bvRMWNSOf5mu5sWKyN6LY8HDGpm+tlf52lHZi5KV/Rl5CyK+rmT9muG
 59bKwKdJThjwC/gc+mLFBi+BEtXMXlAVicCLuIrh386d+U8BD4NCw1ndUsWGGQheh5h9LNqiC5+
 wHznvuAhxPdlNZa6nCyqLWXhiODHIIrIWaWON2uu75z0JgPFQibLgVKLGzNMYtMmoYhY2WFmGaC
 HMNab18uI8xHXehz2okxki2+ApF91cicNnV2eofjJxbvZiPvRv0wlFvtmmucFF1K68ugz+zuE/W
 GKU3jyP3b3Iwvhb1rWmSbWXTEmz98z4YvLdYqf3PfzDX7ilNA==
X-Google-Smtp-Source: AGHT+IGlU4YIFWORLOqau6M224B6+1b+ZG/fO72vVzbqmASMG6/J2tw+1wegUVjF9ZC8g05La/VjtA==
X-Received: by 2002:a05:7301:3fa0:b0:2ae:5b27:d182 with SMTP id
 5a478bee46e88-2b17d24c077mr2219564eec.12.1767836785351; 
 Wed, 07 Jan 2026 17:46:25 -0800 (PST)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e7c:8:89cb:f18d:de6a:be40])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b170673271sm7776916eec.3.2026.01.07.17.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 17:46:24 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Wed,  7 Jan 2026 17:46:19 -0800
Message-ID: <20260108014619.1034975-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong Currently, F2FS requires the packed_ssa
 feature to be enabled when utilizing non-4KB block sizes (e.g., 16KB). This
 restriction limits the flexibility of filesystem formatting options. 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [74.125.82.177 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vdf6d-0001Wi-90
Subject: [f2fs-dev] [PATCH] f2fs: support non-4KB block size without
 packed_ssa feature
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

Currently, F2FS requires the packed_ssa feature to be enabled when
utilizing non-4KB block sizes (e.g., 16KB). This restriction limits
the flexibility of filesystem formatting options.

This patch allows F2FS to support non-4KB block sizes even when the
packed_ssa feature is disabled. It adjusts the SSA calculation logic to
correctly handle summary entries in larger blocks without the packed
layout.

Fixes: 7ee8bc3942f2 ("f2fs: revert summary entry count from 2048 to 512 in 16kb block support")
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/f2fs.h          | 56 +++++++++++++++++++--------
 fs/f2fs/gc.c            | 23 +++++------
 fs/f2fs/node.c          | 12 +++---
 fs/f2fs/recovery.c      |  6 +--
 fs/f2fs/segment.c       | 86 ++++++++++++++++++++++-------------------
 fs/f2fs/segment.h       | 10 ++---
 fs/f2fs/super.c         | 14 -------
 include/linux/f2fs_fs.h | 73 ++++++++++++++++++++--------------
 8 files changed, 157 insertions(+), 123 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 20edbb99b814..0ceae7d83a48 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -521,13 +521,36 @@ struct fsync_inode_entry {
 #define nats_in_cursum(jnl)		(le16_to_cpu((jnl)->n_nats))
 #define sits_in_cursum(jnl)		(le16_to_cpu((jnl)->n_sits))
 
-#define nat_in_journal(jnl, i)		((jnl)->nat_j.entries[i].ne)
-#define nid_in_journal(jnl, i)		((jnl)->nat_j.entries[i].nid)
-#define sit_in_journal(jnl, i)		((jnl)->sit_j.entries[i].se)
-#define segno_in_journal(jnl, i)	((jnl)->sit_j.entries[i].segno)
-
-#define MAX_NAT_JENTRIES(jnl)	(NAT_JOURNAL_ENTRIES - nats_in_cursum(jnl))
-#define MAX_SIT_JENTRIES(jnl)	(SIT_JOURNAL_ENTRIES - sits_in_cursum(jnl))
+#define nat_in_journal(jnl, i) \
+	(((struct nat_journal_entry *)(jnl)->nat_j.entries)[i].ne)
+#define nid_in_journal(jnl, i) \
+	(((struct nat_journal_entry *)(jnl)->nat_j.entries)[i].nid)
+#define sit_in_journal(jnl, i) \
+	(((struct sit_journal_entry *)(jnl)->sit_j.entries)[i].se)
+#define segno_in_journal(jnl, i) \
+	(((struct sit_journal_entry *)(jnl)->sit_j.entries)[i].segno)
+
+#define F2FS_SUM_BLKSIZE(sbi) \
+	(F2FS_HAS_FEATURE(sbi, F2FS_FEATURE_PACKED_SSA) ? 4096 : (sbi)->blocksize)
+#define ENTRIES_IN_SUM(sbi)	(F2FS_SUM_BLKSIZE(sbi) / 8)
+#define SUM_ENTRY_SIZE(sbi)	(SUMMARY_SIZE * ENTRIES_IN_SUM(sbi))
+#define SUM_JOURNAL_SIZE(sbi)	(F2FS_SUM_BLKSIZE(sbi) - SUM_FOOTER_SIZE - \
+				SUM_ENTRY_SIZE(sbi))
+#define NAT_JOURNAL_ENTRIES(sbi)	((SUM_JOURNAL_SIZE(sbi) - 2) / \
+					sizeof(struct nat_journal_entry))
+#define SIT_JOURNAL_ENTRIES(sbi)	((SUM_JOURNAL_SIZE(sbi) - 2) / \
+					sizeof(struct sit_journal_entry))
+
+#define sum_entries(sum)	((struct f2fs_summary *)(sum))
+#define sum_journal(sbi, sum) \
+	((struct f2fs_journal *)((char *)(sum) + \
+	(ENTRIES_IN_SUM(sbi) * sizeof(struct f2fs_summary))))
+#define sum_footer(sbi, sum) \
+	((struct summary_footer *)((char *)(sum) + F2FS_SUM_BLKSIZE(sbi) - \
+	sizeof(struct summary_footer)))
+
+#define MAX_NAT_JENTRIES(sbi, jnl)	(NAT_JOURNAL_ENTRIES(sbi) - nats_in_cursum(jnl))
+#define MAX_SIT_JENTRIES(sbi, jnl)	(SIT_JOURNAL_ENTRIES(sbi) - sits_in_cursum(jnl))
 
 static inline int update_nats_in_cursum(struct f2fs_journal *journal, int i)
 {
@@ -545,14 +568,6 @@ static inline int update_sits_in_cursum(struct f2fs_journal *journal, int i)
 	return before;
 }
 
-static inline bool __has_cursum_space(struct f2fs_journal *journal,
-							int size, int type)
-{
-	if (type == NAT_JOURNAL)
-		return size <= MAX_NAT_JENTRIES(journal);
-	return size <= MAX_SIT_JENTRIES(journal);
-}
-
 /* for inline stuff */
 #define DEF_INLINE_RESERVED_SIZE	1
 static inline int get_extra_isize(struct inode *inode);
@@ -2813,6 +2828,14 @@ static inline block_t __start_sum_addr(struct f2fs_sb_info *sbi)
 	return le32_to_cpu(F2FS_CKPT(sbi)->cp_pack_start_sum);
 }
 
+static inline bool __has_cursum_space(struct f2fs_sb_info *sbi,
+			struct f2fs_journal *journal, int size, int type)
+{
+	if (type == NAT_JOURNAL)
+		return size <= MAX_NAT_JENTRIES(sbi, journal);
+	return size <= MAX_SIT_JENTRIES(sbi, journal);
+}
+
 extern void f2fs_mark_inode_dirty_sync(struct inode *inode, bool sync);
 static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
 					struct inode *inode, bool is_inode)
@@ -3956,7 +3979,8 @@ void f2fs_wait_on_block_writeback_range(struct inode *inode, block_t blkaddr,
 								block_t len);
 void f2fs_write_data_summaries(struct f2fs_sb_info *sbi, block_t start_blk);
 void f2fs_write_node_summaries(struct f2fs_sb_info *sbi, block_t start_blk);
-int f2fs_lookup_journal_in_cursum(struct f2fs_journal *journal, int type,
+int f2fs_lookup_journal_in_cursum(struct f2fs_sb_info *sbi,
+			struct f2fs_journal *journal, int type,
 			unsigned int val, int alloc);
 void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc);
 int f2fs_check_and_fix_write_pointer(struct f2fs_sb_info *sbi);
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 384fa7e2085b..65c819d08807 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1769,8 +1769,8 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 
 	sanity_check_seg_type(sbi, get_seg_entry(sbi, segno)->type);
 
-	segno = rounddown(segno, SUMS_PER_BLOCK);
-	sum_blk_cnt = DIV_ROUND_UP(end_segno - segno, SUMS_PER_BLOCK);
+	segno = rounddown(segno, SUMS_PER_BLOCK(sbi));
+	sum_blk_cnt = DIV_ROUND_UP(end_segno - segno, SUMS_PER_BLOCK(sbi));
 	/* readahead multi ssa blocks those have contiguous address */
 	if (__is_large_section(sbi))
 		f2fs_ra_meta_pages(sbi, GET_SUM_BLOCK(sbi, segno),
@@ -1780,17 +1780,17 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 	while (segno < end_segno) {
 		struct folio *sum_folio = f2fs_get_sum_folio(sbi, segno);
 
-		segno += SUMS_PER_BLOCK;
+		segno += SUMS_PER_BLOCK(sbi);
 		if (IS_ERR(sum_folio)) {
 			int err = PTR_ERR(sum_folio);
 
-			end_segno = segno - SUMS_PER_BLOCK;
-			segno = rounddown(start_segno, SUMS_PER_BLOCK);
+			end_segno = segno - SUMS_PER_BLOCK(sbi);
+			segno = rounddown(start_segno, SUMS_PER_BLOCK(sbi));
 			while (segno < end_segno) {
 				sum_folio = filemap_get_folio(META_MAPPING(sbi),
 						GET_SUM_BLOCK(sbi, segno));
 				folio_put_refs(sum_folio, 2);
-				segno += SUMS_PER_BLOCK;
+				segno += SUMS_PER_BLOCK(sbi);
 			}
 			return err;
 		}
@@ -1806,8 +1806,8 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 		/* find segment summary of victim */
 		struct folio *sum_folio = filemap_get_folio(META_MAPPING(sbi),
 					GET_SUM_BLOCK(sbi, segno));
-		unsigned int block_end_segno = rounddown(segno, SUMS_PER_BLOCK)
-					+ SUMS_PER_BLOCK;
+		unsigned int block_end_segno = rounddown(segno, SUMS_PER_BLOCK(sbi))
+					+ SUMS_PER_BLOCK(sbi);
 
 		if (block_end_segno > end_segno)
 			block_end_segno = end_segno;
@@ -1833,12 +1833,13 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 					migrated >= sbi->migration_granularity)
 				continue;
 
-			sum = SUM_BLK_PAGE_ADDR(sum_folio, cur_segno);
-			if (type != GET_SUM_TYPE((&sum->footer))) {
+			sum = SUM_BLK_PAGE_ADDR(sbi, sum_folio, cur_segno);
+			if (type != GET_SUM_TYPE(sum_footer(sbi, sum))) {
 				f2fs_err(sbi, "Inconsistent segment (%u) type "
 						"[%d, %d] in SSA and SIT",
 						cur_segno, type,
-						GET_SUM_TYPE((&sum->footer)));
+						GET_SUM_TYPE(
+						sum_footer(sbi, sum)));
 				f2fs_stop_checkpoint(sbi, false,
 						STOP_CP_REASON_CORRUPTED_SUMMARY);
 				continue;
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 482a362f2625..f78d53ec59d4 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -606,7 +606,7 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
 		goto retry;
 	}
 
-	i = f2fs_lookup_journal_in_cursum(journal, NAT_JOURNAL, nid, 0);
+	i = f2fs_lookup_journal_in_cursum(sbi, journal, NAT_JOURNAL, nid, 0);
 	if (i >= 0) {
 		ne = nat_in_journal(journal, i);
 		node_info_from_raw_nat(ni, &ne);
@@ -2937,7 +2937,7 @@ int f2fs_restore_node_summary(struct f2fs_sb_info *sbi,
 	/* scan the node segment */
 	last_offset = BLKS_PER_SEG(sbi);
 	addr = START_BLOCK(sbi, segno);
-	sum_entry = &sum->entries[0];
+	sum_entry = sum_entries(sum);
 
 	for (i = 0; i < last_offset; i += nrpages, addr += nrpages) {
 		nrpages = bio_max_segs(last_offset - i);
@@ -3078,7 +3078,7 @@ static int __flush_nat_entry_set(struct f2fs_sb_info *sbi,
 	 * #2, flush nat entries to nat page.
 	 */
 	if (enabled_nat_bits(sbi, cpc) ||
-		!__has_cursum_space(journal, set->entry_cnt, NAT_JOURNAL))
+		!__has_cursum_space(sbi, journal, set->entry_cnt, NAT_JOURNAL))
 		to_journal = false;
 
 	if (to_journal) {
@@ -3101,7 +3101,7 @@ static int __flush_nat_entry_set(struct f2fs_sb_info *sbi,
 		f2fs_bug_on(sbi, nat_get_blkaddr(ne) == NEW_ADDR);
 
 		if (to_journal) {
-			offset = f2fs_lookup_journal_in_cursum(journal,
+			offset = f2fs_lookup_journal_in_cursum(sbi, journal,
 							NAT_JOURNAL, nid, 1);
 			f2fs_bug_on(sbi, offset < 0);
 			raw_ne = &nat_in_journal(journal, offset);
@@ -3172,7 +3172,7 @@ int f2fs_flush_nat_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	 * into nat entry set.
 	 */
 	if (enabled_nat_bits(sbi, cpc) ||
-		!__has_cursum_space(journal,
+		!__has_cursum_space(sbi, journal,
 			nm_i->nat_cnt[DIRTY_NAT], NAT_JOURNAL))
 		remove_nats_in_journal(sbi);
 
@@ -3183,7 +3183,7 @@ int f2fs_flush_nat_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 		set_idx = setvec[found - 1]->set + 1;
 		for (idx = 0; idx < found; idx++)
 			__adjust_nat_entry_set(setvec[idx], &sets,
-						MAX_NAT_JENTRIES(journal));
+					MAX_NAT_JENTRIES(sbi, journal));
 	}
 
 	/* flush dirty nats in nat entry set */
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index c3415ebb9f50..a6bfc8e759cf 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -514,7 +514,7 @@ static int check_index_in_prev_nodes(struct f2fs_sb_info *sbi,
 		struct curseg_info *curseg = CURSEG_I(sbi, i);
 
 		if (curseg->segno == segno) {
-			sum = curseg->sum_blk->entries[blkoff];
+			sum = sum_entries(curseg->sum_blk)[blkoff];
 			goto got_it;
 		}
 	}
@@ -522,8 +522,8 @@ static int check_index_in_prev_nodes(struct f2fs_sb_info *sbi,
 	sum_folio = f2fs_get_sum_folio(sbi, segno);
 	if (IS_ERR(sum_folio))
 		return PTR_ERR(sum_folio);
-	sum_node = SUM_BLK_PAGE_ADDR(sum_folio, segno);
-	sum = sum_node->entries[blkoff];
+	sum_node = SUM_BLK_PAGE_ADDR(sbi, sum_folio, segno);
+	sum = sum_entries(sum_node)[blkoff];
 	f2fs_folio_put(sum_folio, true);
 got_it:
 	/* Use the locked dnode page and inode */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index c26424f47686..9a73b979b2e6 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2685,12 +2685,12 @@ int f2fs_npages_for_summary_flush(struct f2fs_sb_info *sbi, bool for_ra)
 			valid_sum_count += f2fs_curseg_valid_blocks(sbi, i);
 	}
 
-	sum_in_page = (PAGE_SIZE - 2 * SUM_JOURNAL_SIZE -
+	sum_in_page = (F2FS_SUM_BLKSIZE(sbi) - 2 * SUM_JOURNAL_SIZE(sbi) -
 			SUM_FOOTER_SIZE) / SUMMARY_SIZE;
 	if (valid_sum_count <= sum_in_page)
 		return 1;
 	else if ((valid_sum_count - sum_in_page) <=
-		(PAGE_SIZE - SUM_FOOTER_SIZE) / SUMMARY_SIZE)
+		(F2FS_SUM_BLKSIZE(sbi) - SUM_FOOTER_SIZE) / SUMMARY_SIZE)
 		return 2;
 	return 3;
 }
@@ -2710,7 +2710,7 @@ void f2fs_update_meta_page(struct f2fs_sb_info *sbi,
 {
 	struct folio *folio;
 
-	if (SUMS_PER_BLOCK == 1)
+	if (!f2fs_sb_has_packed_ssa(sbi))
 		folio = f2fs_grab_meta_folio(sbi, blk_addr);
 	else
 		folio = f2fs_get_meta_folio_retry(sbi, blk_addr);
@@ -2728,7 +2728,7 @@ static void write_sum_page(struct f2fs_sb_info *sbi,
 {
 	struct folio *folio;
 
-	if (SUMS_PER_BLOCK == 1)
+	if (!f2fs_sb_has_packed_ssa(sbi))
 		return f2fs_update_meta_page(sbi, (void *)sum_blk,
 				GET_SUM_BLOCK(sbi, segno));
 
@@ -2736,7 +2736,8 @@ static void write_sum_page(struct f2fs_sb_info *sbi,
 	if (IS_ERR(folio))
 		return;
 
-	memcpy(SUM_BLK_PAGE_ADDR(folio, segno), sum_blk, sizeof(*sum_blk));
+	memcpy(SUM_BLK_PAGE_ADDR(sbi, folio, segno), sum_blk,
+			F2FS_SUM_BLKSIZE(sbi));
 	folio_mark_dirty(folio);
 	f2fs_folio_put(folio, true);
 }
@@ -2755,11 +2756,11 @@ static void write_current_sum_page(struct f2fs_sb_info *sbi,
 	mutex_lock(&curseg->curseg_mutex);
 
 	down_read(&curseg->journal_rwsem);
-	memcpy(&dst->journal, curseg->journal, SUM_JOURNAL_SIZE);
+	memcpy(sum_journal(sbi, dst), curseg->journal, SUM_JOURNAL_SIZE(sbi));
 	up_read(&curseg->journal_rwsem);
 
-	memcpy(dst->entries, src->entries, SUM_ENTRY_SIZE);
-	memcpy(&dst->footer, &src->footer, SUM_FOOTER_SIZE);
+	memcpy(sum_entries(dst), sum_entries(src), SUM_ENTRY_SIZE(sbi));
+	memcpy(sum_footer(sbi, dst), sum_footer(sbi, src), SUM_FOOTER_SIZE);
 
 	mutex_unlock(&curseg->curseg_mutex);
 
@@ -2932,7 +2933,7 @@ static void reset_curseg(struct f2fs_sb_info *sbi, int type, int modified)
 	curseg->next_blkoff = 0;
 	curseg->next_segno = NULL_SEGNO;
 
-	sum_footer = &(curseg->sum_blk->footer);
+	sum_footer = sum_footer(sbi, curseg->sum_blk);
 	memset(sum_footer, 0, sizeof(struct summary_footer));
 
 	sanity_check_seg_type(sbi, seg_type);
@@ -3078,11 +3079,11 @@ static int change_curseg(struct f2fs_sb_info *sbi, int type)
 	sum_folio = f2fs_get_sum_folio(sbi, new_segno);
 	if (IS_ERR(sum_folio)) {
 		/* GC won't be able to use stale summary pages by cp_error */
-		memset(curseg->sum_blk, 0, SUM_ENTRY_SIZE);
+		memset(curseg->sum_blk, 0, SUM_ENTRY_SIZE(sbi));
 		return PTR_ERR(sum_folio);
 	}
-	sum_node = SUM_BLK_PAGE_ADDR(sum_folio, new_segno);
-	memcpy(curseg->sum_blk, sum_node, SUM_ENTRY_SIZE);
+	sum_node = SUM_BLK_PAGE_ADDR(sbi, sum_folio, new_segno);
+	memcpy(curseg->sum_blk, sum_node, SUM_ENTRY_SIZE(sbi));
 	f2fs_folio_put(sum_folio, true);
 	return 0;
 }
@@ -3814,7 +3815,7 @@ int f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct folio *folio,
 
 	f2fs_wait_discard_bio(sbi, *new_blkaddr);
 
-	curseg->sum_blk->entries[curseg->next_blkoff] = *sum;
+	sum_entries(curseg->sum_blk)[curseg->next_blkoff] = *sum;
 	if (curseg->alloc_type == SSR) {
 		curseg->next_blkoff = f2fs_find_next_ssr_block(sbi, curseg);
 	} else {
@@ -4183,7 +4184,7 @@ void f2fs_do_replace_block(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 	}
 
 	curseg->next_blkoff = GET_BLKOFF_FROM_SEG0(sbi, new_blkaddr);
-	curseg->sum_blk->entries[curseg->next_blkoff] = *sum;
+	sum_entries(curseg->sum_blk)[curseg->next_blkoff] = *sum;
 
 	if (!recover_curseg || recover_newaddr) {
 		if (!from_gc)
@@ -4303,12 +4304,12 @@ static int read_compacted_summaries(struct f2fs_sb_info *sbi)
 
 	/* Step 1: restore nat cache */
 	seg_i = CURSEG_I(sbi, CURSEG_HOT_DATA);
-	memcpy(seg_i->journal, kaddr, SUM_JOURNAL_SIZE);
+	memcpy(seg_i->journal, kaddr, SUM_JOURNAL_SIZE(sbi));
 
 	/* Step 2: restore sit cache */
 	seg_i = CURSEG_I(sbi, CURSEG_COLD_DATA);
-	memcpy(seg_i->journal, kaddr + SUM_JOURNAL_SIZE, SUM_JOURNAL_SIZE);
-	offset = 2 * SUM_JOURNAL_SIZE;
+	memcpy(seg_i->journal, kaddr + SUM_JOURNAL_SIZE(sbi), SUM_JOURNAL_SIZE(sbi));
+	offset = 2 * SUM_JOURNAL_SIZE(sbi);
 
 	/* Step 3: restore summary entries */
 	for (i = CURSEG_HOT_DATA; i <= CURSEG_COLD_DATA; i++) {
@@ -4330,9 +4331,9 @@ static int read_compacted_summaries(struct f2fs_sb_info *sbi)
 			struct f2fs_summary *s;
 
 			s = (struct f2fs_summary *)(kaddr + offset);
-			seg_i->sum_blk->entries[j] = *s;
+			sum_entries(seg_i->sum_blk)[j] = *s;
 			offset += SUMMARY_SIZE;
-			if (offset + SUMMARY_SIZE <= PAGE_SIZE -
+			if (offset + SUMMARY_SIZE <= F2FS_SUM_BLKSIZE(sbi) -
 						SUM_FOOTER_SIZE)
 				continue;
 
@@ -4388,7 +4389,7 @@ static int read_normal_summaries(struct f2fs_sb_info *sbi, int type)
 
 	if (IS_NODESEG(type)) {
 		if (__exist_node_summaries(sbi)) {
-			struct f2fs_summary *ns = &sum->entries[0];
+			struct f2fs_summary *ns = sum_entries(sum);
 			int i;
 
 			for (i = 0; i < BLKS_PER_SEG(sbi); i++, ns++) {
@@ -4408,11 +4409,13 @@ static int read_normal_summaries(struct f2fs_sb_info *sbi, int type)
 
 	/* update journal info */
 	down_write(&curseg->journal_rwsem);
-	memcpy(curseg->journal, &sum->journal, SUM_JOURNAL_SIZE);
+	memcpy(curseg->journal, sum_journal(sbi, sum), SUM_JOURNAL_SIZE(sbi));
 	up_write(&curseg->journal_rwsem);
 
-	memcpy(curseg->sum_blk->entries, sum->entries, SUM_ENTRY_SIZE);
-	memcpy(&curseg->sum_blk->footer, &sum->footer, SUM_FOOTER_SIZE);
+	memcpy(sum_entries(curseg->sum_blk), sum_entries(sum),
+			SUM_ENTRY_SIZE(sbi));
+	memcpy(sum_footer(sbi, curseg->sum_blk), sum_footer(sbi, sum),
+			SUM_FOOTER_SIZE);
 	curseg->next_segno = segno;
 	reset_curseg(sbi, type, 0);
 	curseg->alloc_type = ckpt->alloc_type[type];
@@ -4456,8 +4459,8 @@ static int restore_curseg_summaries(struct f2fs_sb_info *sbi)
 	}
 
 	/* sanity check for summary blocks */
-	if (nats_in_cursum(nat_j) > NAT_JOURNAL_ENTRIES ||
-			sits_in_cursum(sit_j) > SIT_JOURNAL_ENTRIES) {
+	if (nats_in_cursum(nat_j) > NAT_JOURNAL_ENTRIES(sbi) ||
+			sits_in_cursum(sit_j) > SIT_JOURNAL_ENTRIES(sbi)) {
 		f2fs_err(sbi, "invalid journal entries nats %u sits %u",
 			 nats_in_cursum(nat_j), sits_in_cursum(sit_j));
 		return -EINVAL;
@@ -4481,13 +4484,13 @@ static void write_compacted_summaries(struct f2fs_sb_info *sbi, block_t blkaddr)
 
 	/* Step 1: write nat cache */
 	seg_i = CURSEG_I(sbi, CURSEG_HOT_DATA);
-	memcpy(kaddr, seg_i->journal, SUM_JOURNAL_SIZE);
-	written_size += SUM_JOURNAL_SIZE;
+	memcpy(kaddr, seg_i->journal, SUM_JOURNAL_SIZE(sbi));
+	written_size += SUM_JOURNAL_SIZE(sbi);
 
 	/* Step 2: write sit cache */
 	seg_i = CURSEG_I(sbi, CURSEG_COLD_DATA);
-	memcpy(kaddr + written_size, seg_i->journal, SUM_JOURNAL_SIZE);
-	written_size += SUM_JOURNAL_SIZE;
+	memcpy(kaddr + written_size, seg_i->journal, SUM_JOURNAL_SIZE(sbi));
+	written_size += SUM_JOURNAL_SIZE(sbi);
 
 	/* Step 3: write summary entries */
 	for (i = CURSEG_HOT_DATA; i <= CURSEG_COLD_DATA; i++) {
@@ -4500,7 +4503,7 @@ static void write_compacted_summaries(struct f2fs_sb_info *sbi, block_t blkaddr)
 				written_size = 0;
 			}
 			summary = (struct f2fs_summary *)(kaddr + written_size);
-			*summary = seg_i->sum_blk->entries[j];
+			*summary = sum_entries(seg_i->sum_blk)[j];
 			written_size += SUMMARY_SIZE;
 
 			if (written_size + SUMMARY_SIZE <= PAGE_SIZE -
@@ -4545,8 +4548,9 @@ void f2fs_write_node_summaries(struct f2fs_sb_info *sbi, block_t start_blk)
 	write_normal_summaries(sbi, start_blk, CURSEG_HOT_NODE);
 }
 
-int f2fs_lookup_journal_in_cursum(struct f2fs_journal *journal, int type,
-					unsigned int val, int alloc)
+int f2fs_lookup_journal_in_cursum(struct f2fs_sb_info *sbi,
+			struct f2fs_journal *journal, int type,
+			unsigned int val, int alloc)
 {
 	int i;
 
@@ -4555,13 +4559,13 @@ int f2fs_lookup_journal_in_cursum(struct f2fs_journal *journal, int type,
 			if (le32_to_cpu(nid_in_journal(journal, i)) == val)
 				return i;
 		}
-		if (alloc && __has_cursum_space(journal, 1, NAT_JOURNAL))
+		if (alloc && __has_cursum_space(sbi, journal, 1, NAT_JOURNAL))
 			return update_nats_in_cursum(journal, 1);
 	} else if (type == SIT_JOURNAL) {
 		for (i = 0; i < sits_in_cursum(journal); i++)
 			if (le32_to_cpu(segno_in_journal(journal, i)) == val)
 				return i;
-		if (alloc && __has_cursum_space(journal, 1, SIT_JOURNAL))
+		if (alloc && __has_cursum_space(sbi, journal, 1, SIT_JOURNAL))
 			return update_sits_in_cursum(journal, 1);
 	}
 	return -1;
@@ -4709,8 +4713,8 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	 * entries, remove all entries from journal and add and account
 	 * them in sit entry set.
 	 */
-	if (!__has_cursum_space(journal, sit_i->dirty_sentries, SIT_JOURNAL) ||
-								!to_journal)
+	if (!__has_cursum_space(sbi, journal,
+			sit_i->dirty_sentries, SIT_JOURNAL) || !to_journal)
 		remove_sits_in_journal(sbi);
 
 	/*
@@ -4727,7 +4731,8 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 		unsigned int segno = start_segno;
 
 		if (to_journal &&
-			!__has_cursum_space(journal, ses->entry_cnt, SIT_JOURNAL))
+			!__has_cursum_space(sbi, journal, ses->entry_cnt,
+				SIT_JOURNAL))
 			to_journal = false;
 
 		if (to_journal) {
@@ -4755,7 +4760,7 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 			}
 
 			if (to_journal) {
-				offset = f2fs_lookup_journal_in_cursum(journal,
+				offset = f2fs_lookup_journal_in_cursum(sbi, journal,
 							SIT_JOURNAL, segno, 1);
 				f2fs_bug_on(sbi, offset < 0);
 				segno_in_journal(journal, offset) =
@@ -4962,12 +4967,13 @@ static int build_curseg(struct f2fs_sb_info *sbi)
 
 	for (i = 0; i < NO_CHECK_TYPE; i++) {
 		mutex_init(&array[i].curseg_mutex);
-		array[i].sum_blk = f2fs_kzalloc(sbi, PAGE_SIZE, GFP_KERNEL);
+		array[i].sum_blk = f2fs_kzalloc(sbi, F2FS_SUM_BLKSIZE(sbi),
+							GFP_KERNEL);
 		if (!array[i].sum_blk)
 			return -ENOMEM;
 		init_rwsem(&array[i].journal_rwsem);
 		array[i].journal = f2fs_kzalloc(sbi,
-				sizeof(struct f2fs_journal), GFP_KERNEL);
+				SUM_JOURNAL_SIZE(sbi), GFP_KERNEL);
 		if (!array[i].journal)
 			return -ENOMEM;
 		array[i].seg_type = log_type_to_seg_type(i);
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 07dcbcbeb7c6..8b38f3693b1a 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -90,12 +90,12 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
 #define GET_ZONE_FROM_SEG(sbi, segno)				\
 	GET_ZONE_FROM_SEC(sbi, GET_SEC_FROM_SEG(sbi, segno))
 
-#define SUMS_PER_BLOCK (F2FS_BLKSIZE / F2FS_SUM_BLKSIZE)
+#define SUMS_PER_BLOCK(sbi)	((sbi)->blocksize / F2FS_SUM_BLKSIZE(sbi))
 #define GET_SUM_BLOCK(sbi, segno)	\
-	(SM_I(sbi)->ssa_blkaddr + (segno / SUMS_PER_BLOCK))
-#define GET_SUM_BLKOFF(segno) (segno % SUMS_PER_BLOCK)
-#define SUM_BLK_PAGE_ADDR(folio, segno)	\
-	(folio_address(folio) + GET_SUM_BLKOFF(segno) * F2FS_SUM_BLKSIZE)
+	(SM_I(sbi)->ssa_blkaddr + (segno / SUMS_PER_BLOCK(sbi)))
+#define GET_SUM_BLKOFF(sbi, segno) (segno % SUMS_PER_BLOCK(sbi))
+#define SUM_BLK_PAGE_ADDR(sbi, folio, segno)	\
+	(folio_address(folio) + GET_SUM_BLKOFF(sbi, segno) * F2FS_SUM_BLKSIZE(sbi))
 
 #define GET_SUM_TYPE(footer) ((footer)->entry_type)
 #define SET_SUM_TYPE(footer, type) ((footer)->entry_type = (type))
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index c4c225e09dc4..253a23a7b67d 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4080,20 +4080,6 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 	if (sanity_check_area_boundary(sbi, folio, index))
 		return -EFSCORRUPTED;
 
-	/*
-	 * Check for legacy summary layout on 16KB+ block devices.
-	 * Modern f2fs-tools packs multiple 4KB summary areas into one block,
-	 * whereas legacy versions used one block per summary, leading
-	 * to a much larger SSA.
-	 */
-	if (SUMS_PER_BLOCK > 1 &&
-		    !(__F2FS_HAS_FEATURE(raw_super, F2FS_FEATURE_PACKED_SSA))) {
-		f2fs_info(sbi, "Error: Device formatted with a legacy version. "
-			"Please reformat with a tool supporting the packed ssa "
-			"feature for block sizes larger than 4kb.");
-		return -EOPNOTSUPP;
-	}
-
 	return 0;
 }
 
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index a7880787cad3..394f7af3a102 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -17,7 +17,6 @@
 #define F2FS_LOG_SECTORS_PER_BLOCK	(PAGE_SHIFT - 9) /* log number for sector/blk */
 #define F2FS_BLKSIZE			PAGE_SIZE /* support only block == page */
 #define F2FS_BLKSIZE_BITS		PAGE_SHIFT /* bits for F2FS_BLKSIZE */
-#define F2FS_SUM_BLKSIZE		4096	/* only support 4096 byte sum block */
 #define F2FS_MAX_EXTENSION		64	/* # of extension entries */
 #define F2FS_EXTENSION_LEN		8	/* max size of extension */
 
@@ -442,10 +441,8 @@ struct f2fs_sit_block {
  * from node's page's beginning to get a data block address.
  * ex) data_blkaddr = (block_t)(nodepage_start_address + ofs_in_node)
  */
-#define ENTRIES_IN_SUM		(F2FS_SUM_BLKSIZE / 8)
 #define	SUMMARY_SIZE		(7)	/* sizeof(struct f2fs_summary) */
 #define	SUM_FOOTER_SIZE		(5)	/* sizeof(struct summary_footer) */
-#define SUM_ENTRY_SIZE		(SUMMARY_SIZE * ENTRIES_IN_SUM)
 
 /* a summary entry for a block in a segment */
 struct f2fs_summary {
@@ -468,22 +465,6 @@ struct summary_footer {
 	__le32 check_sum;		/* summary checksum */
 } __packed;
 
-#define SUM_JOURNAL_SIZE	(F2FS_SUM_BLKSIZE - SUM_FOOTER_SIZE -\
-				SUM_ENTRY_SIZE)
-#define NAT_JOURNAL_ENTRIES	((SUM_JOURNAL_SIZE - 2) /\
-				sizeof(struct nat_journal_entry))
-#define NAT_JOURNAL_RESERVED	((SUM_JOURNAL_SIZE - 2) %\
-				sizeof(struct nat_journal_entry))
-#define SIT_JOURNAL_ENTRIES	((SUM_JOURNAL_SIZE - 2) /\
-				sizeof(struct sit_journal_entry))
-#define SIT_JOURNAL_RESERVED	((SUM_JOURNAL_SIZE - 2) %\
-				sizeof(struct sit_journal_entry))
-
-/* Reserved area should make size of f2fs_extra_info equals to
- * that of nat_journal and sit_journal.
- */
-#define EXTRA_INFO_RESERVED	(SUM_JOURNAL_SIZE - 2 - 8)
-
 /*
  * frequently updated NAT/SIT entries can be stored in the spare area in
  * summary blocks
@@ -498,9 +479,16 @@ struct nat_journal_entry {
 	struct f2fs_nat_entry ne;
 } __packed;
 
+/*
+ * The nat_journal structure is a placeholder whose actual size varies depending
+ * on the use of packed_ssa. Therefore, it must always be accessed only through
+ * specific sets of macros, and size calculations should use size-related macros
+ * instead of sizeof().
+ * Relevant macros: NAT_JOURNAL_ENTRIES, nat_in_journal, nid_in_journal,
+ * MAX_NAT_JENTRIES.
+ */
 struct nat_journal {
-	struct nat_journal_entry entries[NAT_JOURNAL_ENTRIES];
-	__u8 reserved[NAT_JOURNAL_RESERVED];
+	struct nat_journal_entry entries[0];
 } __packed;
 
 struct sit_journal_entry {
@@ -508,14 +496,21 @@ struct sit_journal_entry {
 	struct f2fs_sit_entry se;
 } __packed;
 
+/*
+ * The sit_journal structure is a placeholder whose actual size varies depending
+ * on the use of packed_ssa. Therefore, it must always be accessed only through
+ * specific sets of macros, and size calculations should use size-related macros
+ * instead of sizeof().
+ * Relevant macros: SIT_JOURNAL_ENTRIES, sit_in_journal, segno_in_journal,
+ * MAX_SIT_JENTRIES.
+ */
 struct sit_journal {
-	struct sit_journal_entry entries[SIT_JOURNAL_ENTRIES];
-	__u8 reserved[SIT_JOURNAL_RESERVED];
+	struct sit_journal_entry entries[0];
 } __packed;
 
 struct f2fs_extra_info {
 	__le64 kbytes_written;
-	__u8 reserved[EXTRA_INFO_RESERVED];
+	__u8 reserved[];
 } __packed;
 
 struct f2fs_journal {
@@ -531,11 +526,33 @@ struct f2fs_journal {
 	};
 } __packed;
 
-/* Block-sized summary block structure */
+/*
+ * Block-sized summary block structure
+ *
+ * The f2fs_summary_block structure is a placeholder whose actual size varies
+ * depending on the use of packed_ssa. Therefore, it must always be accessed
+ * only through specific sets of macros, and size calculations should use
+ * size-related macros instead of sizeof().
+ * Relevant macros: F2FS_SUM_BLKSIZE, ENTRIES_IN_SUM, SUM_ENTRY_SIZE,
+ * sum_entries, sum_journal, sum_footer.
+ *
+ * Summary Block Layout
+ *
+ * +-----------------------+ <--- Block Start
+ * | struct f2fs_summary   |
+ * | entries[0]            |
+ * | ...                   |
+ * | entries[N-1]          |
+ * +-----------------------+
+ * | struct f2fs_journal   |
+ * +-----------------------+
+ * | struct summary_footer |
+ * +-----------------------+ <--- Block End
+ */
 struct f2fs_summary_block {
-	struct f2fs_summary entries[ENTRIES_IN_SUM];
-	struct f2fs_journal journal;
-	struct summary_footer footer;
+	struct f2fs_summary entries[0];
+	// struct f2fs_journal journal;
+	// struct summary_footer footer;
 } __packed;
 
 /*
-- 
2.52.0.351.gbe84eed79e-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
