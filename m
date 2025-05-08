Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C819AAF4F3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 May 2025 09:48:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3bManL1S4DnewL1QHIqRVi1edps75E24FtB33H9WmxU=; b=IGNISFMtSlNPjk3HNlDsu4lHhJ
	5PwRHhOcIxgVump0R2EAIrhD+w2ZTGbuvHG0x5C6D739YzxoNGLJOkKYO7EDu1XVn4rCKrUnGy87b
	2TfgoIT36mmkPQzGSj97jvYjrsVcCFgCYde9VFhrUYqDBS2P1kNhibjkgLx2MX/5BENw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCvzH-00084g-It;
	Thu, 08 May 2025 07:48:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yohan.joung@sk.com>) id 1uCvzF-00084a-D3
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 07:48:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vlYuk+btyi2Cf5/JcFAtLtovKkypDT4IyDqFDMkoprU=; b=L+yoACIWt6BaosdWR9TE+Dl+lg
 yaCkKfrxtkGciQY0Y79HpGvfruwwklmyCG2u99TnckAaQkacvvHPyd4EEjT4INV+6EYsRzYp6TsNR
 MAV3Ep2HE2u/kbfIOJn2Q/HmUMBRC9HQqSCRONI86E+MZrKCpu5AGsFvXRXHHAXF8FT0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vlYuk+btyi2Cf5/JcFAtLtovKkypDT4IyDqFDMkoprU=; b=G
 A01KA/XusU6MNNA26xnqXrCjexSt/TlEJ6qTrzcEMLXyKNhPlgjxikh2+37UXjxxVfxMIkHmVQL8A
 pmci5CIRf17+HHRPSdkbGApUDUYDtxB3XXVzOT7v1MJHn6bPkRHjvvYvRdtkPOWYYoYmXF+t3idnk
 rVvv/h1vEvkR8vKM=;
Received: from exvmail3.skhynix.com ([166.125.252.90]
 helo=invmail3.skhynix.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1uCvzE-0001ns-Gk for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 07:48:09 +0000
X-AuditID: a67dfc59-03fff7000000aab6-9b-681c61b00664
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	daehojeong@google.com
Date: Thu,  8 May 2025 16:47:54 +0900
Message-ID: <20250508074756.693-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBLMWRmVeSWpSXmKPExsXC9ZZnke6GRJkMg9X3dCxOTz3LZDG1fS+j
 xZP1s5gtLi1yt7i8aw6bA6vHgk2lHptWdbJ57F7wmcnj8ya5AJYoLpuU1JzMstQifbsErowZ
 i3pZCjYJVjStqW5gXMzXxcjJISFgIrGkdwc7jH1y4xcmEJtNQEPiT28vM4gtIuAk8f9GO1AN
 FwezQBujRPvRJtYuRg4OYYFiiVObEkFqWARUJbbNeMkIYvMKmErsPPyRGWKmpsSOL+eZIOKC
 EidnPmEBsZkF5CWat85mBpkpIfCWVWL+436oIyQlDq64wTKBkXcWkp5ZSHoWMDKtYhTJzCvL
 TczMMdYrzs6ozMus0EvOz93ECAyvZbV/IncwfrsQfIhRgINRiYfXwVs6Q4g1say4MvcQowQH
 s5IIb1EjUIg3JbGyKrUoP76oNCe1+BCjNAeLkjiv0bfyFCGB9MSS1OzU1ILUIpgsEwenVAMj
 T1BOyjy7gIiN3Ae/dAWaG6j+ks3lDp28bl+2zzdhGTGFea/T9DLf2V2JDXqXVs3y9nPxshc7
 Ez/6Nt2xuc6w5HWGqLwMW3uiawSDS4jhG6XEGSf1VXJPHsh5I1a38emTx4YFVb7fNRbNzV55
 2CIg4ed1e+b3ois4/MpWOYcmb/t5Q8Zg32klluKMREMt5qLiRAB3kw6WKwIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkluLIzCtJLcpLzFFi42LhmqEyR3dDokyGQcsreYvTU88yWUxt38to
 8WT9LGaLS4vcLS7vmsNmMWHuVSaL91vvMTqweyzYVOqxaVUnm8fuBZ+ZPL7d9vD4vEkugDWK
 yyYlNSezLLVI3y6BK2PGol6Wgk2CFU1rqhsYF/N1MXJySAiYSJzc+IUJxGYT0JD409vLDGKL
 CDhJ/L/Rzt7FyMXBLNDGKNF+tIm1i5GDQ1igWOLUpkSQGhYBVYltM14ygti8AqYSOw9/ZIaY
 qSmx48t5Joi4oMTJmU9YQGxmAXmJ5q2zmScwcs1CkpqFJLWAkWkVo0hmXlluYmaOmV5xdkZl
 XmaFXnJ+7iZGYMAsq/0zaQfjt8vuhxgFOBiVeHgdvaUzhFgTy4orcw8xSnAwK4nwFjUChXhT
 EiurUovy44tKc1KLDzFKc7AoifN6hacmCAmkJ5akZqemFqQWwWSZODilGhhbfqfausu8SCow
 cZv+NMDyidX6lfUbXxxe+qTq3EfjzYoVv1d5uC9c+DDLuvnBk/9Z7E7Ln1QJMrE0+/Uta9/4
 638gz7LlT4ODXhtWv92Zarp1mUFY16d387/kM13VOOdx4fh5qR9yDBzJsWcUP+hFz78RO2EB
 5xGZKIcD2R8zymTu3bp12bBWiaU4I9FQi7moOBEAP5yI4BQCAAA=
X-CFilter-Loop: Reflected
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In LFS mode, the previous segment cannot use invalid blocks, 
 so the remaining blocks from the next_blkoff of the current segment to the
 end of the section are calculated. Signed-off-by: yohan.joung
 <yohan.joung@sk.com>
 --- fs/f2fs/segment.h | 23 +++++++++++++++++++---- 1 file changed,
 19 insertions(+), 4 deletions(-) 
 Content analysis details:   (0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.4 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
X-Headers-End: 1uCvzE-0001ns-Gk
Subject: [f2fs-dev] [PATCH v4 1/2] f2fs: add a method for calculating the
 remaining blocks in the current segment in LFS mode.
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
Cc: pilhyun.kim@sk.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In LFS mode, the previous segment cannot use invalid blocks,
so the remaining blocks from the next_blkoff of the current segment
to the end of the section are calculated.

Signed-off-by: yohan.joung <yohan.joung@sk.com>
---
 fs/f2fs/segment.h | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 03c0f59be5a8..5777b385e7d2 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -102,6 +102,8 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
 #define CAP_SEGS_PER_SEC(sbi)					\
 	(SEGS_PER_SEC(sbi) -					\
 	BLKS_TO_SEGS(sbi, (sbi)->unusable_blocks_per_sec))
+#define GET_START_SEG_FROM_SEC(sbi, segno)			\
+	(rounddown(segno, SEGS_PER_SEC(sbi)))
 #define GET_SEC_FROM_SEG(sbi, segno)				\
 	(((segno) == -1) ? -1 : (segno) / SEGS_PER_SEC(sbi))
 #define GET_SEG_FROM_SEC(sbi, secno)				\
@@ -582,8 +584,14 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
 		if (unlikely(segno == NULL_SEGNO))
 			return false;
 
-		left_blocks = CAP_BLKS_PER_SEC(sbi) -
-				get_ckpt_valid_blocks(sbi, segno, true);
+		if (f2fs_lfs_mode(sbi) && __is_large_section(sbi)) {
+			left_blocks = CAP_BLKS_PER_SEC(sbi) -
+				SEGS_TO_BLKS(sbi, (segno - GET_START_SEG_FROM_SEC(sbi, segno))) -
+				CURSEG_I(sbi, i)->next_blkoff;
+		} else {
+			left_blocks = CAP_BLKS_PER_SEC(sbi) -
+					get_ckpt_valid_blocks(sbi, segno, true);
+		}
 
 		blocks = i <= CURSEG_COLD_DATA ? data_blocks : node_blocks;
 		if (blocks > left_blocks)
@@ -596,8 +604,15 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
 	if (unlikely(segno == NULL_SEGNO))
 		return false;
 
-	left_blocks = CAP_BLKS_PER_SEC(sbi) -
-			get_ckpt_valid_blocks(sbi, segno, true);
+	if (f2fs_lfs_mode(sbi) && __is_large_section(sbi)) {
+		left_blocks = CAP_BLKS_PER_SEC(sbi) -
+				SEGS_TO_BLKS(sbi, (segno - GET_START_SEG_FROM_SEC(sbi, segno))) -
+				CURSEG_I(sbi, CURSEG_HOT_DATA)->next_blkoff;
+	} else {
+		left_blocks = CAP_BLKS_PER_SEC(sbi) -
+				get_ckpt_valid_blocks(sbi, segno, true);
+	}
+
 	if (dent_blocks > left_blocks)
 		return false;
 	return true;
-- 
2.33.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
