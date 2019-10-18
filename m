Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E1847DBDF2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Oct 2019 08:59:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iLMEA-0006fm-Nv; Fri, 18 Oct 2019 06:59:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=187ff726d=shinichiro.kawasaki@wdc.com>)
 id 1iLME9-0006fc-5q
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Oct 2019 06:59:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4SBO2rHgMNxX+SMwbao8LFu4RuFhh+8WobtWK5JEOvE=; b=RBBl1I7XWhqhy5QMnFGbFCcQoV
 RvxzkGIlJgdscezJ+34IlWb/llYiJTOlkNykWmVY0EnAiR/AiImAFv/8RMMCXxpJNUVjpCN99SXBt
 6xpreRunmd32quQTpGQisZS4qPwXlo9pYqTUs8oRHf89M0o2jC78XYNIvMQGoO9j47wc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4SBO2rHgMNxX+SMwbao8LFu4RuFhh+8WobtWK5JEOvE=; b=VUcO+Tm98OLs5k0lSKfrfxhfAx
 sVebsuNl2sxNlyVXpL1byvZ8EKP8KHMhsqKQELhoCKy8PezdDYW+JA8y6AU4zowwFC3Ko65IDNiJ8
 m5pCg1w1fko09GwM9h65bHf26PLkLs0UA63xLu2BntSi4DRZ7ziVk/+CclpF5ziQAmlM=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iLME8-006J4B-0N
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Oct 2019 06:59:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1571382006; x=1602918006;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J7b1YhmXzbj73RrVhBrXryXd9AGbVUGb7LFm46IUXCg=;
 b=aUCUnUk47KiDIVtyrtE6C2CoMN4yMtmaf4JGnlsVYn+HJ68fIKsrSLQV
 A73pVH0P5Zy0SrLUri3Nb/notPVFXJj0kJSeVb+N4+Jkf210CBXuVLJdg
 eT/yCkaizIr+eOPYrY5hj24iGsChMZqZnVe6XvlgPpfEz0cE2ldYgqFA4
 Wr71JeOIHxZDMSBcpLMFNT1I98PevvDAGwyMje7CA8zKfKcDJnnELB7v1
 szFFhWNyGI8I96PTxICEAHlAkqb41moWA8V7TSAe94LQ1SFbVRE536rmY
 gzWT6u4BpJ+M6hMFZV0RXmpr7UN0A9Yo0o24mKAT+4TPuQQwM7gfjv/iY w==;
IronPort-SDR: ED9RZylK6QhW8yrjTuRwww4FqW193sswhvbwk5NBqvvtXK0MXdWkUp6E/YYb6glgbvDrpIZfgl
 KOkfsgDQkZuhNuc/yswORKaw7JE1BJs/wuvvQNJdI+IiFi0AIhdbp2UTYWw2qnT4axlKU5h8y0
 EuKY51bJ/703ncadaQKH2fXjsvUbNPeByZ7A7J0mV29gwJhyCw3qFXLlvp4DRJDz01Z3fjO4Aa
 uKMnCpy8qv+YULKaV1QMIzRhuMhC3jiTUbS2w1Hsc1+jtk8wPPm6p42tVdTnXSWz7qzIUF2YGB
 5Cw=
X-IronPort-AV: E=Sophos;i="5.67,310,1566835200"; d="scan'208";a="221884347"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Oct 2019 14:38:10 +0800
IronPort-SDR: J/6B4ZlIum4xXs7eQHRuWYrv1iQrLo3JTDfAl9qwhiIjhOuVhTjvRR4jlqr7CCutL3+1PbtxJz
 K/9zz+62Lcwy3H48W5jwRBBQOq64shk5Yvra1uWa6UmwveQ3AqhIaCEx8cy6DLOi/yLypDi53h
 vljhIVfRfAos4nzmHsxxlrOsote5cE0ryJxPsom7BYPBAmgJKEjEmLvZb/D6803bwLNpuTe5rL
 y1rdpOc8St1QjHvOmsr4AGiKzgbN2nksgjPn+NYWxYb/oPAakLRrjZZn2qiwwAR2j6ZtOUVaBa
 w+SY5VUPKmI3me27gNErle0a
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2019 23:33:31 -0700
IronPort-SDR: mtnK+S3u51EMkw7+eMz+IPauWfMhUcmWNM2166L8ZKID55dB/RcEB2sVtP3+10grtGvFzs0xpM
 bjXNFUeUC7JHiJ69ChPIyvmakp/J68WBiu9sgJFBBVS7GlyoNKvWsWRk6pCQ8lgAW9s36y3DiH
 vSly5fSUTtBM1bRsTudSs9mkopEVTuQ5iyVHgNt9Id8D9735D29WYR4KFT2pT0Z7Zv1HffGu8R
 d2bD+KtZFBTlccCx2H61m0TUxHiXSGxGTzGSStvDrOINBWfX/6f+2QTfmAJf7V16QSw1UPflf3
 Zk0=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.52.166])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Oct 2019 23:37:47 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 18 Oct 2019 15:37:37 +0900
Message-Id: <20191018063740.2746-6-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191018063740.2746-1-shinichiro.kawasaki@wdc.com>
References: <20191018063740.2746-1-shinichiro.kawasaki@wdc.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iLME8-006J4B-0N
Subject: [f2fs-dev] [PATCH v5 5/8] fsck: Introduce move_one_curseg_info()
 function
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When fsck updates one of the current segments, update_curseg_info() is
called specifying a single current segment as its argument. However,
update_curseg_info() calls move_curseg_info() function which updates all
six current segments. Then update_curseg_info() for a single current
segment moves all current segments.

This excessive current segment move causes an issue when a new zone is
assigned to a current segment because of write pointer inconsistency.
Even when a current segment has write pointer inconsistency, all other
current segments should not be moved because they may have fsync data
at their positions.

To avoid the excessive current segment move, introduce
move_one_curseg_info() function which does same work as
move_curseg_info() only for a single current segment. Call
move_one_curseg_info() in place of move_curseg_info() from
update_curseg_info().

Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
 fsck/mount.c | 68 ++++++++++++++++++++++++++++------------------------
 1 file changed, 37 insertions(+), 31 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index 8d2ba55..915f487 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -2532,52 +2532,58 @@ int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left, int want_t
 	return -1;
 }
 
-void move_curseg_info(struct f2fs_sb_info *sbi, u64 from, int left)
+static void move_one_curseg_info(struct f2fs_sb_info *sbi, u64 from, int left,
+				 int i)
 {
-	int i, ret;
+	struct curseg_info *curseg = CURSEG_I(sbi, i);
+	struct f2fs_summary_block buf;
+	u32 old_segno;
+	u64 ssa_blk, to;
+	int ret;
 
-	/* update summary blocks having nullified journal entries */
-	for (i = 0; i < NO_CHECK_TYPE; i++) {
-		struct curseg_info *curseg = CURSEG_I(sbi, i);
-		struct f2fs_summary_block buf;
-		u32 old_segno;
-		u64 ssa_blk, to;
+	/* update original SSA too */
+	ssa_blk = GET_SUM_BLKADDR(sbi, curseg->segno);
+	ret = dev_write_block(curseg->sum_blk, ssa_blk);
+	ASSERT(ret >= 0);
 
-		/* update original SSA too */
-		ssa_blk = GET_SUM_BLKADDR(sbi, curseg->segno);
-		ret = dev_write_block(curseg->sum_blk, ssa_blk);
-		ASSERT(ret >= 0);
+	to = from;
+	ret = find_next_free_block(sbi, &to, left, i,
+				   c.zoned_model == F2FS_ZONED_HM);
+	ASSERT(ret == 0);
 
-		to = from;
-		ret = find_next_free_block(sbi, &to, left, i,
-					   c.zoned_model == F2FS_ZONED_HM);
-		ASSERT(ret == 0);
+	old_segno = curseg->segno;
+	curseg->segno = GET_SEGNO(sbi, to);
+	curseg->next_blkoff = OFFSET_IN_SEG(sbi, to);
+	curseg->alloc_type = c.zoned_model == F2FS_ZONED_HM ? LFS : SSR;
 
-		old_segno = curseg->segno;
-		curseg->segno = GET_SEGNO(sbi, to);
-		curseg->next_blkoff = OFFSET_IN_SEG(sbi, to);
-		curseg->alloc_type = c.zoned_model == F2FS_ZONED_HM ? LFS : SSR;
+	/* update new segno */
+	ssa_blk = GET_SUM_BLKADDR(sbi, curseg->segno);
+	ret = dev_read_block(&buf, ssa_blk);
+	ASSERT(ret >= 0);
 
-		/* update new segno */
-		ssa_blk = GET_SUM_BLKADDR(sbi, curseg->segno);
-		ret = dev_read_block(&buf, ssa_blk);
-		ASSERT(ret >= 0);
+	memcpy(curseg->sum_blk, &buf, SUM_ENTRIES_SIZE);
 
-		memcpy(curseg->sum_blk, &buf, SUM_ENTRIES_SIZE);
+	/* update se->types */
+	reset_curseg(sbi, i);
 
-		/* update se->types */
-		reset_curseg(sbi, i);
+	FIX_MSG("Move curseg[%d] %x -> %x after %"PRIx64"\n",
+		i, old_segno, curseg->segno, from);
+}
 
-		DBG(1, "Move curseg[%d] %x -> %x after %"PRIx64"\n",
-				i, old_segno, curseg->segno, from);
-	}
+void move_curseg_info(struct f2fs_sb_info *sbi, u64 from, int left)
+{
+	int i;
+
+	/* update summary blocks having nullified journal entries */
+	for (i = 0; i < NO_CHECK_TYPE; i++)
+		move_one_curseg_info(sbi, from, left, i);
 }
 
 void update_curseg_info(struct f2fs_sb_info *sbi, int type)
 {
 	if (!relocate_curseg_offset(sbi, type))
 		return;
-	move_curseg_info(sbi, SM_I(sbi)->main_blkaddr, 0);
+	move_one_curseg_info(sbi, SM_I(sbi)->main_blkaddr, 0, type);
 }
 
 void zero_journal_entries(struct f2fs_sb_info *sbi)
-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
