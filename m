Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A54E6C94
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2019 07:55:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iOywM-0000cP-PI; Mon, 28 Oct 2019 06:55:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=1975423da=shinichiro.kawasaki@wdc.com>)
 id 1iOywB-0000c2-NG
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Oct 2019 06:55:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jNiya/aS2tahUiTDMtOYRBzCIDTjTFlS7c6CD3kW838=; b=AyPQsspfP1mJhZ98NIeLq2nw14
 3jsqYLZpTfk2r1GCKXmFtG5rvH19cV+ar/2pvtxbP+5NlmJolzprvkcsjRrCPTCvsin4awAz77VPp
 9kz3mFMoSVvl1o5IEtZ1Z3aE5eFKR18Ynb8p9WEoMuPeEP7HPO0XcmzNcdrWPtWv7les=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jNiya/aS2tahUiTDMtOYRBzCIDTjTFlS7c6CD3kW838=; b=k4K4YOImcclk+dBqyAuBHRfPMO
 +h9eGXmxX1cszTrzflDn6MefxbgPVOYNbj1uOvkfdveOnsA7+EdV+u+GCOZbbboXb8jVRLep9r1By
 3hMV8ejH+BscLsomEn1Wp4xWqOuzweNmfxs27P71Z6lc6LXXuqxrUNlhaCFam5XTH89c=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iOyw9-0067BT-Oz
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Oct 2019 06:55:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1572245734; x=1603781734;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Edw3tCQKU+Lyzl8vfpyK93oKXAB9RTjsxuHEE07HXm8=;
 b=ZX9FcvSMSlOavtBQOMq74uC6gA9Uw6njClrEdO4efIoPvJFaUGIXU+Dp
 e2edYqmksBZLRnuwIt+fR6IAFVPe8fBMVDYElbGgMnpj5CaEj6C1dVPpv
 8DmSm6ZWuF8UXOoFX7P1vIiFUm1QixnBIskbUhkyjqpYxK2BcdAAA7MrN
 bh+Ivqq6h0ANt6j99SZwdBpza1Qpa/OwR3f5H9pNagBYosKjPdfmUdxvy
 JIWTtp/WRagAjhfMg428hrSaPWx8ZFRLvsS5+hc89E3OHlgzZ3Dms1aVr
 uuTpx2ZdzZAGDjPPIfnhAot6yMMm26jLyZZJkZsrj3an4se7DlREn+0uG Q==;
IronPort-SDR: jlLAWosphGG0mZitt/SIKlW/blHpgjOV3W9dRcJEcoFqzxyIGYMAOXx7Wl2cqxUYeuWusbYFkI
 DzFZHgDHoV3NxP7Vv8e2P5pHlC//NBSH0lvhecIuA0A3CHy9CUqzcOrghgtFgmC4YZHNklkrSx
 E6z1O0ogdHLf1Z28LXmRHcBirAHPKUvWc22Y8cbEYzG3n1oRrmJVGn2djbMKhWGSjLsK8gavtM
 Xc09mvd6M1JSlkJSI6tH26JpyPzT65i5otFKqlJTWZOULBDcTIYEWvPwY33nAq21rHJGmAQ3F+
 5Vc=
X-IronPort-AV: E=Sophos;i="5.68,239,1569254400"; d="scan'208";a="125879636"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2019 14:55:25 +0800
IronPort-SDR: YdJz4HSZMuFVJxsGWLmpeROMZp8DJdup9Og5jtMDVM6+Z15yMLsd2BGworqHyjg7ZEVGGJVms5
 V6ZULKixOQpva+o5apqcT5bpwK8nQU+Y+rktEfUDKFmvZwDa0kVFt4R7uwASyMEWI4mBg7vtTW
 /AUwglfjutoWwvGZxNQDUc274GKm56QK+xs62eeGSV5IUyOOH1qMHVLE4AJccTtFsdokPz4L8O
 Icr0zz8e+77UIa/gOYUlFsyYRVgaDN0z6lpwWllJ20AV3CCDJOZMt3JfofBZb/0IVc+ZAocPS4
 wKOlZmQJZmZ0FP+XSkNz2i5x
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2019 23:50:46 -0700
IronPort-SDR: WFFx3KoVhoqg4Yn/InCT1hPx121QSJKDPnnMymWjrXf8/OB8t0P7KzrGesdrSiJFkNP5Wq5plm
 qu6m1FDvGUCPKSaySDksV7nxxzw9CT4D4g81uGUtWTrHNIhgQHwtKaT7xHrCCxOYqN1b/2/7L8
 Rk5wnvafnQfkZvSDd5JV3+Ucfv3A6nRVmZldE23HUjfr/3roqnosqkn3nw1eFNqvw+H7W1Ib8o
 JwAUocZsGbSKyxBEYuXt7XLALsWw71nflgY5NiNFtyz1e8+zxrI4UyuglgZtTNSax1DkmF+DX5
 1XQ=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.52.166])
 by uls-op-cesaip01.wdc.com with ESMTP; 27 Oct 2019 23:55:24 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 28 Oct 2019 15:55:09 +0900
Message-Id: <20191028065512.27876-6-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191028065512.27876-1-shinichiro.kawasaki@wdc.com>
References: <20191028065512.27876-1-shinichiro.kawasaki@wdc.com>
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
X-Headers-End: 1iOyw9-0067BT-Oz
Subject: [f2fs-dev] [PATCH v6 5/8] fsck: Introduce move_one_curseg_info()
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
