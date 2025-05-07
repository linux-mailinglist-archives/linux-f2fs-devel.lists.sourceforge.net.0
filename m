Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE7CAAD477
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 May 2025 06:31:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xdSu7Lt0ZR2S3th1mVnam3MntQTVvcU0tbaVyYY4i+U=; b=EYSB88j16I7SlSJseTIeBehMZt
	cL0PBNfNSkTVlOsSIfupWs8PvRiCy0H7/GcGsRcHUjgNJceZyf7ifTIiFvlYvrLNCh39GJjapt0Pu
	aIiL4X9i7+rACjsUoXI9fGlyKcfgu2bWCP0MtFywnvjbOU3H/z3ITWX3ym+x/UA9fo0Q=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCWRK-0007jL-DB;
	Wed, 07 May 2025 04:31:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yohan.joung@sk.com>) id 1uCWRI-0007jF-3U
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 04:31:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gRKsWJfyQbfENqOrUVjlbiVZqho/2euzJy6lpt5i9VA=; b=WtYDa5O2fuUL8C2YvU/C7TtXba
 Qyea7hHPg6AJBdHxaK7Bzm2DjD6+CBq2Jh3gNFZLW1IKDYNT76uxFWDtxUcOCN2cnx5OVIMax6/EM
 lG7NjYYdaVfBo2rWCUsfNOjo5lEIbNrMA789EMqyQ22SrmSRLOmcdmXHWMDqQOgbjeMs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gRKsWJfyQbfENqOrUVjlbiVZqho/2euzJy6lpt5i9VA=; b=P
 TUc8B/eFRFdM8/8P7gNSE0aol+fOrIOkdHLTrdqx5+jhrN0f8fMQN1z+dV6y4MwebgzPjN3Pof794
 y+F3Ymm8GF8bqPXxNuZ/Cexe5W94lZSRnG2x+zZtaK+L+cJ4xwZjuYNBh/Emu2kSXoxkVtFOYi0cG
 KG6Iz0+s1Le/FbD4=;
Received: from exvmail3.hynix.com ([166.125.252.90] helo=invmail3.skhynix.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1uCWR2-00039F-1G for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 04:31:24 +0000
X-AuditID: a67dfc59-057ff7000000aab6-05-681ae1fcd9fa
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	daehojeong@google.com
Date: Wed,  7 May 2025 13:30:36 +0900
Message-ID: <20250507043038.591-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJLMWRmVeSWpSXmKPExsXC9ZZnoe6/h1IZBlunWFicnnqWyWJq+15G
 iyfrZzFbXFrkbnF51xw2B1aPBZtKPTat6mTz2L3gM5PH501yASxRXDYpqTmZZalF+nYJXBk/
 N01hL9giWNF09C97A+Nivi5GTg4JAROJ+0dWs8DYDcfusYHYbAIaEn96e5lBbBEBJ4n/N9rZ
 uxi5OJgF2hgl2o82sYIkhAWKJVo37gUrYhFQlXjzehpYnFfAVOLMp7mMEEM1JXZ8Oc8EEReU
 ODnzCdgyZgF5ieats5khal6ySuzbmw5hS0ocXHGDZQIj7ywkLbOQtCxgZFrFKJKZV5abmJlj
 rFecnVGZl1mhl5yfu4kRGGDLav9E7mD8diH4EKMAB6MSD++Bn5IZQqyJZcWVuYcYJTiYlUR4
 798HCvGmJFZWpRblxxeV5qQWH2KU5mBREuc1+laeIiSQnliSmp2aWpBaBJNl4uCUamCU7Ape
 I2mRt0Qpf3Xk4x6Ta7w/haNfsV5eZfTBUePmYS0e5kdfpbtEU5eF65SppmxleGtXNVO+UG/a
 +z3/xUSyvWpTpK2SZm5fY9nLv1LsGcfUg5s2fPU6vcgq9oWZjv6MOVl9pYYb3rVPNzBc8Ejv
 5RG5XUoWW3hyZzxy6y19Gh6W/ENVTEyJpTgj0VCLuag4EQA1FDSmLAIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmluLIzCtJLcpLzFFi42LhmqEyR/fPQ6kMg1t32CxOTz3LZDG1fS+j
 xZP1s5gtLi1yt7i8aw6bxYS5V5ks3m+9x+jA7rFgU6nHplWdbB67F3xm8vh228Pj8ya5ANYo
 LpuU1JzMstQifbsEroyfm6awF2wRrGg6+pe9gXExXxcjJ4eEgIlEw7F7bCA2m4CGxJ/eXmYQ
 W0TASeL/jXb2LkYuDmaBNkaJ9qNNrCAJYYFiidaNe8GKWARUJd68ngYW5xUwlTjzaS4jxFBN
 iR1fzjNBxAUlTs58wgJiMwvISzRvnc08gZFrFpLULCSpBYxMqxhFMvPKchMzc8z0irMzKvMy
 K/SS83M3MQKDZlntn0k7GL9ddj/EKMDBqMTDe+CnZIYQa2JZcWXuIUYJDmYlEd7794FCvCmJ
 lVWpRfnxRaU5qcWHGKU5WJTEeb3CUxOEBNITS1KzU1MLUotgskwcnFINjDxzu3+e+XS+eu/i
 qMhNLdNY2J+0MTRnnO94Lza1rSQruD4r0KiPyTzAOHTfO+GzBwSXOmwXzbydKnhXfLtFweTO
 QxsFtnk/LChJnn/5kLbrWY14Fa6nMmbvly+p1pvYkyyq+VjOMPWYR/e+hklqvw6syk5cFt7n
 KepzaIdocOW7V7Jn2y01lFiKMxINtZiLihMBWjlxJBYCAAA=
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
X-Headers-End: 1uCWR2-00039F-1G
Subject: [f2fs-dev] [PATCH v3 1/2] f2fs: add a method for calculating the
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
index 03c0f59be5a8..f5d30f32ebdb 100644
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
+				(segno - GET_START_SEG_FROM_SEC(sbi, segno)) * BLKS_PER_SEG(sbi) -
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
+				(segno - GET_START_SEG_FROM_SEC(sbi, segno)) * BLKS_PER_SEG(sbi) -
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
