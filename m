Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EC7FBEAA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Nov 2019 05:45:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iV70I-0008NU-Gm; Thu, 14 Nov 2019 04:45:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=2145628f9=shinichiro.kawasaki@wdc.com>)
 id 1iV70G-0008NL-H5
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Nov 2019 04:45:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7vH1oGRcYFRV4rV5KAMeJJqrgcogyk4fKCieC5TEg7A=; b=mrUmutCt5iyeISNJTusyTytLxY
 //+Q9H3SSDzOJbZMqVZ4EZ6THdgN7Ni4TipBWo1Wv8j+a3LNXNj/jm+G3G/da5VBZKNdELK4c/BOM
 Q7xrAQGWAdRyU5osQDa9FIQfP1ilPpWlgEyseaUALxIqpPdcXgWf3lHb6yAapiKpzuzk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7vH1oGRcYFRV4rV5KAMeJJqrgcogyk4fKCieC5TEg7A=; b=l4D7n8bYvyMKBAkRkpv5zz32BY
 dZ88FlFHIr1k/tM2ZuAREtnZ+KLGDMEdlA/+d0//xeI2c/+sRY7h7rb7K/AKDwC7zPT///H9BDfoV
 jNhAE9Q2PFAN3rXjifnQUc0+N6jCsOTFIoklAL1GuzRFlwqV7DfZz8lPOAxtrGRNlJfg=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iV70F-002ZCm-AP
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Nov 2019 04:45:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1573706708; x=1605242708;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=flIZ5xBD4Pc31EOiRDKdzdEbl1M2F4q/BwketRZtP3o=;
 b=QJu8hm8Qgczs7BG3YCY4ALe7tVepIRxhbHzQ61KOiaFzofPfApZ3Hb4J
 jRBcb87gQhXkSF/ttK590vR5cqb8iJG54GW1P0LmhA68UesaRzzZepEtx
 FLim7JwLP0kx2dbcISR8+h3Ou0nXoHm7eAgX9516SZMivIth83M3mFZOq
 6XxiYni6byhQPSVGTWAkuxElJbxk/hw2+sXjaMS+Nw6NXNszv9g55lwD1
 9M2nNpNPXRcwlxdes+wrVobOSMIu9crU9rZWf+ckPkT3+12wtKFVWCWHG
 nhvUTz/WWci5TTGOeATYwOOJ38f6KTV+E+dmP7bQ+S5A6Sw/iuoqnKsrq Q==;
IronPort-SDR: tkWW2ygcS4l+v38TcNgJ7ca86hwBZyKmcL8H6w+MTlAmHnQu2+SjYk3cKLKmpZdjoF9sbiB5o/
 bHG3YK5h/x4uWtyLpE/14fFZNaRgCrnsh4AZOUq638TbhqpVPe2hrQqRXEW/MQEdP3ZobC7e5l
 T1X8kBzOiUetZ17mPAEebTiaWaPXEvd8qujaBDX3HfenJ0LeF2vkCUqGoTMDRPYu9gf79pNtMG
 sseRjRSpNmmpd7jLcljoqSMIAUZ+eQzdCQ2+6QIHu4OQ2Fw3Kic9vVWW6JwUC2JuFsMpFlCrGe
 7j0=
X-IronPort-AV: E=Sophos;i="5.68,302,1569254400"; d="scan'208";a="127411452"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Nov 2019 12:45:03 +0800
IronPort-SDR: 8/HdXZoiR9biIgKG9qbdFIKo+DXY+sZ+foV+LasN2esdEAN4VqrGu9lYB1RyNLUvltJsgicjaX
 7tgi7df9d5B8fSQuA8GbxxrSpBz80+xVm/yc+m0J8ObaYI5KXCp0JVLe59Vh4Mplwk//yODSNK
 Ajgcasz8U/B2toK7PxLDefVSjQRj0LSCS25cN3xpvaW5lgdMFXlIfuwREjVfjpJD56Wl6NpQY9
 JAwUKx5T14TKCMWAZuL47Med9kAyK79Oro3tt55xELRjd4b1fAbrmIbW0b9RmtbH7VepEoYwdG
 Mb7cW3oeNCgN+JtBMSYMBODS
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2019 20:40:02 -0800
IronPort-SDR: bFDhzBEJu2uQDn7OZ9KgWZMQr2MdObveKdxvDd8yUsXLC/X944K0Oqc9X6YWEcPmnnC/05CYkp
 WP7UHdHEA4CYpAhWzZf2oq4AoyiqDZZzFZXlFgn1nCe1fdfoGUJUaAwuQ3kkE4pGZqFV45H1Vi
 XRDsoBF5RO1qde93Hj24LdU7fTuQ0eKTuiwVxQbClqQJYVJmvoFp4FPSkLwM0hFlznfXQM/uG7
 3mPdf9dsVRRjh9U4+hBOw4DSVk+duH0fpxEUnM/9PpjPZuqMzVd8hhWFePWMyDZp4vf7TaBtx8
 5+g=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.53.87])
 by uls-op-cesaip01.wdc.com with ESMTP; 13 Nov 2019 20:45:03 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 14 Nov 2019 13:44:51 +0900
Message-Id: <20191114044454.200461-6-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191114044454.200461-1-shinichiro.kawasaki@wdc.com>
References: <20191114044454.200461-1-shinichiro.kawasaki@wdc.com>
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iV70F-002ZCm-AP
Subject: [f2fs-dev] [PATCH v7 5/8] fsck: Introduce move_one_curseg_info()
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
