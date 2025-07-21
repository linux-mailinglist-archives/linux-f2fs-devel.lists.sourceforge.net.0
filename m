Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C39B0B9DE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Jul 2025 04:03:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lcX5AE7W1FXXkiHfrvRBlsQELScOTBPBADgZUUY8BwA=; b=izieoIrntTn62l20otLE1YjFkg
	G4h3BHVQUZfYfQ06t19LukuH/7ZJszzrO2l7C0t7Ja+4avGD9ogaKoRGaQcOf9sMlpeVPvHFoK5TH
	yQ/XdfT9l2ArtUxM1bdHSZNnH9ON5dUBNQMCEru/s+JNzY8grbOme2bbMMR322woq7oI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1udfrc-0001EY-Bp;
	Mon, 21 Jul 2025 02:02:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1udfrb-0001EJ-25
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Jul 2025 02:02:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wsqLbv9Gtadisggs1YKmAW8YXkzpuNvpUUCzKWvhz9g=; b=f4RFW25WDXZAgn+mUxHUD5kLoC
 RmsYBojiGMACOu4A7vLXee3xDzLlYlKQZms6ox9lbhcUcERKk2nihsTfgeOsUHDh60eK1EDtPM9Ot
 0Jx+gs42pi/798por3YxDgfADAdQpTqOlgW00oG+eX6Zl7NyQhor3OwitjZ64nZp6q4M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wsqLbv9Gtadisggs1YKmAW8YXkzpuNvpUUCzKWvhz9g=; b=K
 lSBDWlozC7Dy1hD5CCLQ75+PU8ZB8tVYsj3Fiv0OxiF9VWP+fxOAQOb10sP2IzFyEAAEZ7dTCzujx
 6YHZ1bI+5Qw693R4t4hvb0xKndXEAhd0GV4T0aA/ZLnnxnzMdVMzcvM4qiTJRWkzImf+pL4mkcYQS
 GcayXd7S10s/wE2g=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1udfrb-0005qj-7h for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Jul 2025 02:02:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B6ACC5C576A;
 Mon, 21 Jul 2025 02:02:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BCF8C4CEE7;
 Mon, 21 Jul 2025 02:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753063356;
 bh=orgIy60XqVsfiS5IU3qqmpU4wxTQIGlZQlY3DE3J6MU=;
 h=From:To:Cc:Subject:Date:From;
 b=D9tmU4+M/NAp/JVFUz4UwFAy/9inC5hULK0lxrJQFC/86mpu1nZtwxtZW7J7UIpPZ
 TbpDl3Sf3TZvLgwhgHoFZoB+VvWOn84Q8EEUOzNjQZdOKokyX6ZjZXp6VMKEBH5GqB
 hMIA2y+KtyLLjPJfg7iAnM0zn5odatiI0iPBtqQiOE2HezZEPKks1v4XoSzqCnGmLX
 wtckpb9vgPbxEeAzpbMpyWzekVt2RSfNim8L823le1+NdZFE8o2amRAXgKn8xy2FXs
 t+NWrRAhPkw/14D3+oYnmS92Fa1P7+LrFvbjg2t5dZd3cyDPt0UrDcw6SngmIIGpxm
 gAXwKWA5geEeQ==
To: jaegeuk@kernel.org
Date: Mon, 21 Jul 2025 10:02:31 +0800
Message-ID: <20250721020231.2482090-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Commit 0638a3197c19 ("f2fs: avoid unused block when dio write
 in LFS mode") has fixed unused block issue for dio write in lfs mode. However, 
 f2fs_map_blocks() may break and return smaller extent when last allocated
 block locates in the end of section, even allocator can allocate contiguous
 blocks across sections. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1udfrb-0005qj-7h
Subject: [f2fs-dev] [PATCH] f2fs: don't break allocation when crossing
 contiguous sections
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Commit 0638a3197c19 ("f2fs: avoid unused block when dio write in LFS
mode") has fixed unused block issue for dio write in lfs mode.

However, f2fs_map_blocks() may break and return smaller extent when
last allocated block locates in the end of section, even allocator
can allocate contiguous blocks across sections.

Actually, for the case that allocator returns a block address which is
not contiguous w/ current extent, we can record the block address in
iomap->private, in the next round, skip reallocating for the last
allocated block, then we can fix unused block issue, meanwhile, also,
we can allocates contiguous physical blocks as much as possible for dio
write in lfs mode.

Testcase:
- mkfs.f2fs -f /dev/vdb
- mount -o mode=lfs /dev/vdb /mnt/f2fs
- dd if=/dev/zero of=/mnt/f2fs/file bs=1M count=3; sync;
- dd if=/dev/zero of=/mnt/f2fs/dio bs=2M count=1 oflag=direct;
- umount /mnt/f2fs

Before:
f2fs_map_blocks: dev = (253,16), ino = 4, file offset = 0, start blkaddr = 0x0, len = 0x100, flags = 1, seg_type = 8, may_create = 1, multidevice = 0, flag = 5, err = 0
f2fs_map_blocks: dev = (253,16), ino = 4, file offset = 256, start blkaddr = 0x0, len = 0x100, flags = 1, seg_type = 8, may_create = 1, multidevice = 0, flag = 5, err = 0
f2fs_map_blocks: dev = (253,16), ino = 4, file offset = 512, start blkaddr = 0x0, len = 0x100, flags = 1, seg_type = 8, may_create = 1, multidevice = 0, flag = 5, err = 0
f2fs_map_blocks: dev = (253,16), ino = 5, file offset = 0, start blkaddr = 0x4700, len = 0x100, flags = 3, seg_type = 1, may_create = 1, multidevice = 0, flag = 3, err = 0
f2fs_map_blocks: dev = (253,16), ino = 5, file offset = 256, start blkaddr = 0x4800, len = 0x100, flags = 3, seg_type = 1, may_create = 1, multidevice = 0, flag = 3, err = 0

After:
f2fs_map_blocks: dev = (253,16), ino = 4, file offset = 0, start blkaddr = 0x0, len = 0x100, flags = 1, seg_type = 8, may_create = 1, multidevice = 0, flag = 5, err = 0
f2fs_map_blocks: dev = (253,16), ino = 4, file offset = 256, start blkaddr = 0x0, len = 0x100, flags = 1, seg_type = 8, may_create = 1, multidevice = 0, flag = 5, err = 0
f2fs_map_blocks: dev = (253,16), ino = 4, file offset = 512, start blkaddr = 0x0, len = 0x100, flags = 1, seg_type = 8, may_create = 1, multidevice = 0, flag = 5, err = 0
f2fs_map_blocks: dev = (253,16), ino = 5, file offset = 0, start blkaddr = 0x4700, len = 0x200, flags = 3, seg_type = 1, may_create = 1, multidevice = 0, flag = 3, err = 0

Cc: Daejun Park <daejun7.park@samsung.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 28 ++++++++++++++++++----------
 fs/f2fs/f2fs.h |  1 +
 2 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d1a2616d41be..4e62f7f00b70 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1550,10 +1550,14 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 	unsigned int start_pgofs;
 	int bidx = 0;
 	bool is_hole;
+	bool lfs_dio_write;
 
 	if (!maxblocks)
 		return 0;
 
+	lfs_dio_write = (flag == F2FS_GET_BLOCK_DIO && f2fs_lfs_mode(sbi) &&
+				map->m_may_create);
+
 	if (!map->m_may_create && f2fs_map_blocks_cached(inode, map, flag))
 		goto out;
 
@@ -1600,7 +1604,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 	/* use out-place-update for direct IO under LFS mode */
 	if (map->m_may_create && (is_hole ||
 		(flag == F2FS_GET_BLOCK_DIO && f2fs_lfs_mode(sbi) &&
-		!f2fs_is_pinned_file(inode)))) {
+		!f2fs_is_pinned_file(inode) && map->m_last_pblk != blkaddr))) {
 		if (unlikely(f2fs_cp_error(sbi))) {
 			err = -EIO;
 			goto sync_out;
@@ -1684,10 +1688,15 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 
 		if (map->m_multidev_dio)
 			map->m_bdev = FDEV(bidx).bdev;
+
+		if (lfs_dio_write)
+			map->m_last_pblk = NULL_ADDR;
 	} else if (map_is_mergeable(sbi, map, blkaddr, flag, bidx, ofs)) {
 		ofs++;
 		map->m_len++;
 	} else {
+		if (lfs_dio_write && !f2fs_is_pinned_file(inode))
+			map->m_last_pblk = blkaddr;
 		goto sync_out;
 	}
 
@@ -1712,14 +1721,6 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 		dn.ofs_in_node = end_offset;
 	}
 
-	if (flag == F2FS_GET_BLOCK_DIO && f2fs_lfs_mode(sbi) &&
-	    map->m_may_create) {
-		/* the next block to be allocated may not be contiguous. */
-		if (GET_SEGOFF_FROM_SEG0(sbi, blkaddr) % BLKS_PER_SEC(sbi) ==
-		    CAP_BLKS_PER_SEC(sbi) - 1)
-			goto sync_out;
-	}
-
 	if (pgofs >= end)
 		goto sync_out;
 	else if (dn.ofs_in_node < end_offset)
@@ -4162,7 +4163,7 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 			    unsigned int flags, struct iomap *iomap,
 			    struct iomap *srcmap)
 {
-	struct f2fs_map_blocks map = {};
+	struct f2fs_map_blocks map = { NULL, };
 	pgoff_t next_pgofs = 0;
 	int err;
 
@@ -4171,6 +4172,10 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 	map.m_next_pgofs = &next_pgofs;
 	map.m_seg_type = f2fs_rw_hint_to_seg_type(F2FS_I_SB(inode),
 						inode->i_write_hint);
+	if (flags & IOMAP_WRITE && iomap->private) {
+		map.m_last_pblk = (unsigned long)iomap->private;
+		iomap->private = NULL;
+	}
 
 	/*
 	 * If the blocks being overwritten are already allocated,
@@ -4209,6 +4214,9 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 		iomap->flags |= IOMAP_F_MERGED;
 		iomap->bdev = map.m_bdev;
 		iomap->addr = F2FS_BLK_TO_BYTES(map.m_pblk);
+
+		if (flags & IOMAP_WRITE && map.m_last_pblk)
+			iomap->private = (void *)map.m_last_pblk;
 	} else {
 		if (flags & IOMAP_WRITE)
 			return -ENOTBLK;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index dfddb66910b3..97c1a2a3fbd7 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -732,6 +732,7 @@ struct f2fs_map_blocks {
 	block_t m_lblk;
 	unsigned int m_len;
 	unsigned int m_flags;
+	unsigned long m_last_pblk;	/* last allocated block, only used for DIO in LFS mode */
 	pgoff_t *m_next_pgofs;		/* point next possible non-hole pgofs */
 	pgoff_t *m_next_extent;		/* point to next possible extent */
 	int m_seg_type;
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
