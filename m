Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E4910C4A4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Nov 2019 09:00:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iaEis-0003K5-Cr; Thu, 28 Nov 2019 08:00:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=2285f8a38=shinichiro.kawasaki@wdc.com>)
 id 1iaEim-0003HC-EG
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Nov 2019 08:00:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7vH1oGRcYFRV4rV5KAMeJJqrgcogyk4fKCieC5TEg7A=; b=Q7CQyJYStxyU0G57WRcOXkg+bE
 BT5b8kuiM2TN7+Iy0xpkRR8mf8v7NposuB/ezMWMBi11wD9MrybNKnKZpkexJx7Ugr3GZEIyvKW8O
 6WSjhzKjwk+Ex4z0lIFgsNfy6iffxJ3FUrnf+Cqf3BfqpUaT2w26Bl4ic4lP3i7zTqr4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7vH1oGRcYFRV4rV5KAMeJJqrgcogyk4fKCieC5TEg7A=; b=RptJFHeJJpNVY6rbZqMt4EY1ZT
 jZ+wHgUkvJ8LI5BgykSSfmYDxHZPvW/taiatRWnWpn2gPNZoaI4keETy2lX3DMB7nlPoptqofIgPg
 SNPAcKc/cDIITE0qW5KWKqe/Q9nuh+RZHC7cYqnuWVoZYul7Ym/g/+Aatqjyr/eNFzO4=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iaEii-00Fq8f-Db
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Nov 2019 08:00:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1574928071; x=1606464071;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=flIZ5xBD4Pc31EOiRDKdzdEbl1M2F4q/BwketRZtP3o=;
 b=N9AoYTnjWhZA1/ikVCnH1IEkLBoRrfZAdD6hwrad/v9tuYzk/p4LKaz9
 fYyXD6a4w/Q5jdqDDELk17UO8Q5OusKNSio+6suAuwW9MG+WCJcUoVyss
 FdR6UxCuDgujRJ0+5D5mDQ9cNOxeY6Vts19peDa2fQGeu2uyTY3Y7gXgf
 8I7Nw6/SdKSH6xxE0d+aIQvqiXD6lsXNGdk83A5YgTTYHPiO7FaEOvOh6
 +e+xI5+d9qXWlDE//DxhoXUWRFyrX4zVHge1bEIr+yNwdUznyA2mtvzOc
 2mqbZuksk+K9gcxP7OoMt9HAJCEwYXds0yGl8y2WmMYtRmyp+0x8I+Ks5 A==;
IronPort-SDR: SwFjYSpBaNdNzpIgx44ubMP38nF8YgX31vIWzE80ZmOCtuY3k1R+2mEadlI47MDQb8+Tqxp97a
 2fs23iK9HE5DzmxGINStYzXJVEouqFnaMkArDHLvroaMR+9uGs+WVM6bQYsWTtnxOn8vWiwz3k
 T7GTJKGimEDAoBmyFJ0rwUV4RItoNFf7x5yU9EEefi6+TkMdB88zkOrwiiAadUT/PCktYSUKqC
 HH8mUZGlrUFPM8ynZ2O/iHm4jHIGIkx9Pxg9L4OXEsivaB9YTlq3fwuPArz09tOlCkFp8l6rBN
 fl4=
X-IronPort-AV: E=Sophos;i="5.69,252,1571673600"; d="scan'208";a="225597360"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Nov 2019 16:00:47 +0800
IronPort-SDR: HTcvQhlBUhumNKfLmHuBeiADRiEtNqhZRaBq8oJgxdYIkUnyBfJO6vahbhM2m/Krx8HvmXzJJh
 7kJ1ovI8tenOtVo5i5CLjrZ09yUgXml+FC6IK53b7L9njcPETlmyoCejUqfsEY4Do7cmSDXJge
 rG9FHdi5UWrPZrxOCU/eDr8jYUmO2fQQe1en9jkZ8iLa6kyL95qeZJqAv64gnqbodZ0Bj6LfAw
 adTYj7kHrAE2gWHd3Xchg9IRx5W8YcPGXc7kuUQzvwOvLcNLTF/5vcrD4rUoeaokBJlLadyDDX
 /m/TJflS4w/sZk019OiSBZPX
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 23:54:31 -0800
IronPort-SDR: er04u/uBpTMCxY5CpWDFWNKHVBN34rhcZkfqElOdMBxMGlq3XpWy+b5s1U8gn7yJIY77XW2Hmn
 InA6HuBnGgpBIKn8vs7HNGaxWX9GdYjq1o5po+gz22jcFZ5onLfpYy+jpKZyNQVOPq93iYefuC
 EtxwDWeoMPnF98v5wSA7+uDC18+IzG6jXUy9UPGdWOoPUHqnZF7HFQtJYQjGJAqxNjBHrYA3TP
 mUh6xlGwwdSpzzUlD+HVVPE0sKfE3EaV12nC2sX0powoGUGhPxqmmX9NGpHlid0kua262Dx5P8
 BII=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.53.87])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Nov 2019 23:59:56 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 28 Nov 2019 16:59:27 +0900
Message-Id: <20191128075930.467833-6-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191128075930.467833-1-shinichiro.kawasaki@wdc.com>
References: <20191128075930.467833-1-shinichiro.kawasaki@wdc.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iaEii-00Fq8f-Db
Subject: [f2fs-dev] [PATCH v8 5/8] fsck: Introduce move_one_curseg_info()
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
Reviewed-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/mount.c | 68 ++++++++++++++++++++++++++++------------------------
 1 file changed, 37 insertions(+), 31 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index 7ce885c..cd6b51b 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -2548,52 +2548,58 @@ int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left,
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
2.23.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
