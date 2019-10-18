Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 66198DBDF1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Oct 2019 08:59:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iLME9-0008Uz-8G; Fri, 18 Oct 2019 06:59:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=187ff726d=shinichiro.kawasaki@wdc.com>)
 id 1iLME8-0008Ua-0I
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Oct 2019 06:59:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CVpqngBf5j//tm9r7Fe4NTTNBz+7YVgWGKARLdb5nuc=; b=ASmR7IoUIGletWiJk//vsjGvjQ
 lwsyTUtj+hOcIH+eG+dcoqvJ6vqsFVX/OPYn2nR69vZoceNyOtfjLjyAAos+6nIrm6zzvrtwhi5XH
 fA9caczVNZ9zv54IDOhrDd/aOWWu4ydUJqHqIAqd2bo5TW2BH5FhhbCStCTzXfEQb+fs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CVpqngBf5j//tm9r7Fe4NTTNBz+7YVgWGKARLdb5nuc=; b=J+yrXIlEHSnMHkv0kXTemIVThE
 uyJHpMIFusMhucN+sFhX3jmHn5o9a+XKmpC5G0oOtndy/a6pwOrmT3ievCW0sfGXi2x2Li6cPVdhs
 B/b7a1ZA5wzKhqQZnDz6BWqLUWqzDf5jAtMUYiY2fdRPBPaavfaskjOf3wsOW2sMaPeQ=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iLME6-006J4B-Mu
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Oct 2019 06:59:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1571382004; x=1602918004;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nSvMBAtNHq1H3f6h/amQSCY4RYzXrUxBB4St7NmTCao=;
 b=AxoO1qQBTVip13fwU8boqbkxEoRvFMej+36NR8zAynj7YdsEIuVi6fPw
 4vZ31xjsw9R6vPeDTRc51hjKHjC/hBMwaULknTGlOhcEy2QJHUAW4FOUD
 rbggMSMO4XUheoQXUIPLyQtEtni0C0uAjWKVmsLa8S6FcB4SW+Y8wNFRV
 xzSQrYPUVYcVrJ/W1bqOzgE6YX17aYhRB2OIVvTJCBWs8FCiQBz4qCrZV
 uoPbDdzUZNUHwKqT9+Tv8fqb2fFPcurbvUhBHG4d44MBs2xXzVeKBrU1o
 I1URzskEw1XR8EvBaim+2t56fmfI3eH0bD/jGrEhuEntRbAwDpv0e89y5 Q==;
IronPort-SDR: jP1c86sdkDOuu3d8OUsVU+mDw2UaaQKQtH3bLkRRk+xIeWRG43Qki9qOJgqp4xBKzDxJ62APsf
 lgSc1d4fVeOFFumaJZxrQ6iE5tXhjqrw46cBbosywAkSQCftdpphAsVXe0BkAWJ2x7qAvouWO4
 NhZVFK+P0Y0KSIEV/FuUXhJ8NP+173E27aLJIfDgR5IDSGWeGHjDt8Kxv9NG1HGT4xk85UmMmf
 FEQBkuJzTzpvv7u3JUp1yNrPYcy7FeNGAF4wTVMN85x2CAJ27WDV+ZC1rpz6E/Qnd9FBamjALg
 KeE=
X-IronPort-AV: E=Sophos;i="5.67,310,1566835200"; d="scan'208";a="221884345"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Oct 2019 14:38:09 +0800
IronPort-SDR: xjTl6qu1S1MFsa+E70OIvztCndFaYbvTzJmEGok9w1jxGPP0DNMFPeiyOpVLIRoAE8WRnwtpBs
 V82Lbue/0RJdAXGdWRa9jj94sSi3WFpHaUEtJyhIg8dbQJqwSzCVm5+BEvJPuefBYIrOvVElqI
 6RJCOffBiYxBBSJHwVLv1dolYTjkF5uuPSvuJg9WouvZSxdXBH9YEYceoX8nFvVm9gyLWCj37e
 vTrcxGhlQRy4o3T585GPAFPynJNyP80F5BcLib0AjR+mEU61IIhkxsSSAgek4TOw9OlUbTp9aJ
 27fbgzfUeBAltBBVYNmsZc0X
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2019 23:33:30 -0700
IronPort-SDR: 0C3C14VnClsJHjvKuJc3OyIfhpdP+nbykL/42PUmxhpgOXYEOUjtlCrqzfjgAyuv6aywyRgjiX
 Ztutm3JSz2OwTJyXxWZb1ltbiBq4D5DswxDTQ3gWXJL17r6KSioDjGI3zu5sUFyNiOVeJ6dUlv
 3ZEgzbK4qK5AghRwu2VoUKfT6MWT+v5ul6rShPVBtAEwtmvnUyFO1ixJJmmRp9wGKIb6Wp1KVL
 misRAhqr54FuLDeleRnjK1qP3V3yWYNZ/o6Rp8JaYpBXrqzt6eZG9sY+yXOBlfc5pJdeADV+Nd
 dBM=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.52.166])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Oct 2019 23:37:46 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 18 Oct 2019 15:37:36 +0900
Message-Id: <20191018063740.2746-5-shinichiro.kawasaki@wdc.com>
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
X-Headers-End: 1iLME6-006J4B-Mu
Subject: [f2fs-dev] [PATCH v5 4/8] fsck: Find free zones instead of blocks
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
