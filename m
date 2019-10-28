Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3511E6C90
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2019 07:55:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iOywB-00043X-Po; Mon, 28 Oct 2019 06:55:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=1975423da=shinichiro.kawasaki@wdc.com>)
 id 1iOyw9-00043P-PU
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Oct 2019 06:55:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lZydG7ttdu3ZdzBjYiVkwn9DU7SK0A0725RIrA47OQo=; b=VKlw+eCIB3VScqIwVPRz6OzudH
 araryK2rhJxQqno07tpUY/Cj74ftvq0rIYpC909Z22agnCVhprpobfZ9OoqSmz9qiyph/DEMAxagD
 uW8R6Eml5/4cHnbyJvCKcZAlCk8sv4TylvqHrVI8PMfSa3doqy0hvwjQ6Ztm6IYNdn7o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lZydG7ttdu3ZdzBjYiVkwn9DU7SK0A0725RIrA47OQo=; b=WUcQ5VGRfbeKdSkBgq/cBlwxUM
 cstKgDXSZ/7Oi1i0Xd0k8vzlN+FBca/1zzsDSxC+bEY+AWk1tj4uWHGFS1/Vz7lNi2pQPxCP6phz6
 Q4VIrTfOTAv3hMfZR/W5y4uL3tidlqczTO0vgcDSEtqZMgCaUfA2LiqbO09fobp5ll1M=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iOyw7-0067BT-Sr
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Oct 2019 06:55:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1572245732; x=1603781732;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sT/ctuKgiVaD5HqznExRw1lq28Sns7DO2XRtn2el/bw=;
 b=ouf/RR3iKvtQRcx6kJox0HohWPMNor+MHJXZcv00glFIPELfF3PjoTRb
 I8MKpTXdyCcQrcp59pjIirMfuxUm2ZCAUONB+WPjORhzmqeOzBGGFf6cx
 txUekdoZkkpZe0jS5BUX3/+McQUtbm113xc+x0D7daed4ITk1Lt8Y4KX1
 5Xcdu/agy4Kk9L6Pj9UrVSRDsZBakJiH2oRksaUaGHNR6P3vkjAx6BAlW
 RTQPwI7WjGAkgmD0rHWffYJaN4tQIf9chb6qBzLKZbSYdUyaiFKlyn6jc
 e25Wg0gbE0W+u9Nzpms6YREl+o0FBYy6gfpcwiV13Y9owJ45UjRZamf1+ g==;
IronPort-SDR: 04um3v5gZS4JsXKrtXcQypOuGKQKqLTu4fgnEWwwzxXRK9cELh0evwaSmLbjAolHaKk3HbtyiZ
 0turuSV7RtbHaXyVubdDfNeH0kxRxeVjCcKYwc7v6kJGE+FYJTlnRhvn1lercKyN6AfMjlhnIT
 cMWzvpoY9sp9YZqB7Us14Kp/5uPzL2SYOru6PypVnskail4uTcY42X6cyKuthXS6Y6A4THd48s
 Mo/QofyRuH96UfoZJypD/YT9Ap0vHVX4XJzZBIk7xdgPAlqpjmBXR6Y/4vY4mu5MK2YRYRDokm
 J1M=
X-IronPort-AV: E=Sophos;i="5.68,239,1569254400"; d="scan'208";a="125879635"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2019 14:55:24 +0800
IronPort-SDR: P1xZbEGqUi8XgBFcc9GKVqnK4H1LjF0rKX26SjiWcqchiG05wqCXM2EoHRqgy06PgCodnCImK4
 PqiBMqjeyd9BrRMBnvv0m3V2mKzu49R75gSl6+SidzsX284uM9UtyjVO0Asv5QxPyvm50vLjD0
 raWNuNsEuljSivSGn2N6GrBwFEQFOjy1Apm/p2kv0LBbfGYT5nBt9tyzv+DLU7k8N98Xv/NNqk
 LI9KiXsRkLFU9w6cYi6yVvenGW5F2JE03is8ooOIqw4yYqlTFbcbDxhLKAxfcfxO9wD7w7iORQ
 HjwmBbsDubJa1apmjm57Q7dK
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2019 23:50:45 -0700
IronPort-SDR: o9LHygAmTn0w0/GgzkWkMP37I0mElTYcug2VxsO/+M4ecHgAPdj685msC1gTEs1wK9fA4z1QWq
 T3lyoRwCLw69Twbt+uyfooBP2zfZ7LpR5kUUFGeVYvQTV4ekbz/qanEhA+nD4Tx1rQ/n/2O5RD
 w6fd176T8Ry8++CKL3u51p4fozpCTKGQ6r2WX/kYEe6IHZTE/QNagN6O0iTHIYwkg5BgkRN5n/
 xEPiNvp2GnjcTt5ko1p0+nq7FLfjQ7x+IR/WR65NaFUIXx7+R/nkkXYlgUp7PuGFXRWDkSDnpa
 uZM=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.52.166])
 by uls-op-cesaip01.wdc.com with ESMTP; 27 Oct 2019 23:55:23 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 28 Oct 2019 15:55:08 +0900
Message-Id: <20191028065512.27876-5-shinichiro.kawasaki@wdc.com>
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iOyw7-0067BT-Sr
Subject: [f2fs-dev] [PATCH v6 4/8] fsck: Find free zones instead of blocks
 to assign to current segments
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

When fsck needs to assign a new area to a curreng segment, it calls
find_next_free_block() function to find a new block to assign. For zoned
block devices, fsck checks write pointer consistency with current
segments' positions. In case a curseg is inconsistent with the
write pointer of the zone it points to, fsck should assign not a new free
block but a new free zone/section with write pointer at the zone start,
so that next write to the current segment succeeds without error.

To extend find_next_free_block() function's capability to find not only
a block but also a zone/section, add new_sec flag to
find_next_free_block() function. When new_sec flag is true, skip check
for each block's availability so that the check is done with unit of
section. Note that it is ensured that one zone has one section for f2fs
on zoned block devices. Then the logic to find a new free section is good
to find a new free zone.

When fsck target devices have ZONED_HM model, set new_sec flag true to
call find_next_free_block() from move_curseg_info(). Set curseg's
alloc_type not SSR but LFS for the devices with ZONED_HM model, because
SSR block allocation is not allowed for zoned block devices. Also skip
relocate_curseg_offset() for the devices with ZONED_HM model for the
same reason.

Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Reviewed-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/defrag.c  |  2 +-
 fsck/fsck.h    |  2 +-
 fsck/mount.c   | 12 ++++++++----
 fsck/segment.c |  2 +-
 4 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/fsck/defrag.c b/fsck/defrag.c
index fc6b7cf..3473637 100644
--- a/fsck/defrag.c
+++ b/fsck/defrag.c
@@ -77,7 +77,7 @@ int f2fs_defragment(struct f2fs_sb_info *sbi, u64 from, u64 len, u64 to, int lef
 		if (!f2fs_test_bit(offset, (const char *)se->cur_valid_map))
 			continue;
 
-		if (find_next_free_block(sbi, &target, left, se->type)) {
+		if (find_next_free_block(sbi, &target, left, se->type, false)) {
 			MSG(0, "Not enough space to migrate blocks");
 			return -1;
 		}
diff --git a/fsck/fsck.h b/fsck/fsck.h
index ccf4a39..8da0ebb 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -191,7 +191,7 @@ extern void zero_journal_entries(struct f2fs_sb_info *);
 extern void flush_sit_entries(struct f2fs_sb_info *);
 extern void move_curseg_info(struct f2fs_sb_info *, u64, int);
 extern void write_curseg_info(struct f2fs_sb_info *);
-extern int find_next_free_block(struct f2fs_sb_info *, u64 *, int, int);
+extern int find_next_free_block(struct f2fs_sb_info *, u64 *, int, int, bool);
 extern void duplicate_checkpoint(struct f2fs_sb_info *);
 extern void write_checkpoint(struct f2fs_sb_info *);
 extern void write_checkpoints(struct f2fs_sb_info *);
diff --git a/fsck/mount.c b/fsck/mount.c
index 4814dfe..8d2ba55 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -2430,6 +2430,9 @@ int relocate_curseg_offset(struct f2fs_sb_info *sbi, int type)
 	struct seg_entry *se = get_seg_entry(sbi, curseg->segno);
 	unsigned int i;
 
+	if (c.zoned_model == F2FS_ZONED_HM)
+		return -EINVAL;
+
 	for (i = 0; i < sbi->blocks_per_seg; i++) {
 		if (!f2fs_test_bit(i, (const char *)se->cur_valid_map))
 			break;
@@ -2462,7 +2465,7 @@ void set_section_type(struct f2fs_sb_info *sbi, unsigned int segno, int type)
 	}
 }
 
-int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left, int want_type)
+int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left, int want_type, bool new_sec)
 {
 	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
 	struct seg_entry *se;
@@ -2520,7 +2523,7 @@ int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left, int want_t
 			}
 		}
 
-		if (type == want_type &&
+		if (type == want_type && !new_sec &&
 			!f2fs_test_bit(offset, (const char *)bitmap))
 			return 0;
 
@@ -2546,13 +2549,14 @@ void move_curseg_info(struct f2fs_sb_info *sbi, u64 from, int left)
 		ASSERT(ret >= 0);
 
 		to = from;
-		ret = find_next_free_block(sbi, &to, left, i);
+		ret = find_next_free_block(sbi, &to, left, i,
+					   c.zoned_model == F2FS_ZONED_HM);
 		ASSERT(ret == 0);
 
 		old_segno = curseg->segno;
 		curseg->segno = GET_SEGNO(sbi, to);
 		curseg->next_blkoff = OFFSET_IN_SEG(sbi, to);
-		curseg->alloc_type = SSR;
+		curseg->alloc_type = c.zoned_model == F2FS_ZONED_HM ? LFS : SSR;
 
 		/* update new segno */
 		ssa_blk = GET_SUM_BLKADDR(sbi, curseg->segno);
diff --git a/fsck/segment.c b/fsck/segment.c
index e3a90da..ccde05f 100644
--- a/fsck/segment.c
+++ b/fsck/segment.c
@@ -52,7 +52,7 @@ int reserve_new_block(struct f2fs_sb_info *sbi, block_t *to,
 
 	blkaddr = SM_I(sbi)->main_blkaddr;
 
-	if (find_next_free_block(sbi, &blkaddr, 0, type)) {
+	if (find_next_free_block(sbi, &blkaddr, 0, type, false)) {
 		ERR_MSG("Can't find free block");
 		ASSERT(0);
 	}
-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
