Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2E9AB309F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 May 2025 09:37:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3bManL1S4DnewL1QHIqRVi1edps75E24FtB33H9WmxU=; b=dDan12KAVDkvhSIKaZa+oKrw4A
	lqeWeu4W2F0FnrGosiqKCoEzDy2s+FIBSykmJQoEjMeFbVgUEq9f1KfuADobRLwjMo5nQzpC/otwG
	qasSOlyI8vLPxdplmATrgh7AGvo/WSz2WdxlVrQ0xfpAaExGjok9Vl28y/A52WgEmIIY=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uENib-00056i-HT;
	Mon, 12 May 2025 07:36:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yohan.joung@sk.com>) id 1uENia-00056Z-9n
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 May 2025 07:36:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vlYuk+btyi2Cf5/JcFAtLtovKkypDT4IyDqFDMkoprU=; b=JHdRGw22Ng1/OCsfBvjmX7Jgvz
 tx5KU+nhbNFbHebL9xlPeA5t+yBmeyRT7cCFA1XEz+ZiH//U2f8V7QJ9tH3Oj2kxqJFRjuKN7aOL8
 XAhDZ9akLOJPtpP6KfncVXgXLJI2qpoCkT9khc1V34alCv23K2VAQEVedzsCrED75RSA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vlYuk+btyi2Cf5/JcFAtLtovKkypDT4IyDqFDMkoprU=; b=I
 m3A+DCP57c1gTs2g9sILp/ky3NNiHpU7YeYSGUISxXYDVS8fj6sJoQscD95yHNLk7A2zbYrw2D1Z3
 llAzRrKge7l2ZoMegecyslUSByvJw83rPMOjepdPhnIM8x06Rb0rMOQxOM7zBjTWwuW4HJhwpykI/
 H2niA+R3eg6d6IjM=;
Received: from exvmail3.skhynix.com ([166.125.252.90]
 helo=invmail3.skhynix.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1uENiY-0003yY-4X for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 May 2025 07:36:56 +0000
X-AuditID: a67dfc59-03fff7000000aab6-aa-6821a5092cf9
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	daehojeong@google.com
Date: Mon, 12 May 2025 16:36:09 +0900
Message-ID: <20250512073611.718-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJLMWRmVeSWpSXmKPExsXC9ZZnkS7nUsUMgzsHpSxOTz3LZDG1fS+j
 xZP1s5gtLi1yt7i8aw6bA6vHgk2lHptWdbJ57F7wmcnj8ya5AJYoLpuU1JzMstQifbsErowZ
 i3pZCjYJVjStqW5gXMzXxcjJISFgItHWNY0dxr56+SGYzSagIfGnt5cZxBYRcJL4f6MdKM7F
 wSzQxijRfrSJFSQhLFAscfXhYxYQm0VAVeL76WdgzbwCphJLj2xlhhiqKbHjy3kmiLigxMmZ
 T8DqmQXkJZq3zmYGGSoh8JJVYtPvNywQDZISB1fcYJnAyDsLSc8sJD0LGJlWMYpk5pXlJmbm
 GOsVZ2dU5mVW6CXn525iBAbYsto/kTsYv10IPsQowMGoxMObsFYhQ4g1say4MvcQowQHs5II
 71QG+Qwh3pTEyqrUovz4otKc1OJDjNIcLErivEbfylOEBNITS1KzU1MLUotgskwcnFINjJ2i
 ljurnVOPM1+evOnifGtRkad+DpXF/ZXbC2YtVD/RvXVXi9tuU5uyNwabNXo4rvQuUN++tqUt
 cHt+4Vfj51te2/e07Vr1c8qdH/tu1Ez9HN/2jcOy6MGlLTkv4/L3vJ+7Ye+JaA6OmU1S81RK
 5Fq67/6ZFN7tJ/M43GFjTTxn8CrxGy8bapRYijMSDbWYi4oTAVtD1IMsAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpiluLIzCtJLcpLzFFi42LhmqEyR5dzqWKGwYp2XovTU88yWUxt38to
 8WT9LGaLS4vcLS7vmsNmMWHuVSaL91vvMTqweyzYVOqxaVUnm8fuBZ+ZPL7d9vD4vEkugDWK
 yyYlNSezLLVI3y6BK2PGol6Wgk2CFU1rqhsYF/N1MXJySAiYSFy9/JAdxGYT0JD409vLDGKL
 CDhJ/L/RDhTn4mAWaGOUaD/axAqSEBYolrj68DELiM0ioCrx/fQzsGZeAVOJpUe2MkMM1ZTY
 8eU8E0RcUOLkzCdg9cwC8hLNW2czT2DkmoUkNQtJagEj0ypGkcy8stzEzBwzveLsjMq8zAq9
 5PzcTYzAkFlW+2fSDsZvl90PMQpwMCrx8CasVcgQYk0sK67MPcQowcGsJMI7lUE+Q4g3JbGy
 KrUoP76oNCe1+BCjNAeLkjivV3hqgpBAemJJanZqakFqEUyWiYNTqoEx48+ElVePPm1kSap6
 v39HwxQhL/GdsgvfmW7Wn/koc+pqE7nfM04925q8VOtrMePmDY+YFL7/6BEISM9cckGg3KPl
 xIK9UVH7IhZEVlzRCeFh2Gads3Zrv6fizi3qc331qm0vhR3MfKC0wnq/o+/yE5mqJ+pX1ZQ1
 clnHyKg3/VMoXnQi5IWTEktxRqKhFnNRcSIAO1q9hRUCAAA=
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
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
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [166.125.252.90 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [166.125.252.90 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1uENiY-0003yY-4X
Subject: [f2fs-dev] [PATCH v5 1/2] f2fs: add a method for calculating the
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
