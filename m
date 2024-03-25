Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AECA88A676
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Mar 2024 16:27:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1romEr-0001iE-NT;
	Mon, 25 Mar 2024 15:27:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1romEq-0001i2-LK
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Mar 2024 15:27:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m15klphnsbQDN34/bcBRuxuVZW7FZKUvc9C/9YQaXGI=; b=hS132/QtBD2MCIBM/y0954uZcu
 oyg9feEk5HHQQoK9UKLguxyuObELHJnh5Kg4CPrVvvFhDde6KCzrgYJv93wRR0rK0i/ieGgAiwUS0
 GpBnLOaj4nCpxAdXeT/9Veo8Q14XLahNeAv+4IXl6/+NXdpFN8mKm88mEOgQZc9rtQco=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m15klphnsbQDN34/bcBRuxuVZW7FZKUvc9C/9YQaXGI=; b=jYCEoHK7ZTpLpLyOsMteBlyYeg
 sQWDVNvHx8CWEJNNZJ6t5enqvR4nbETTja9o+EJ2H5YLIP5prqO1D5w7GtMc23KN1/oC/2X4H55eP
 87QQD+qDJD96VC9DWi2frPBSMbxgm3nl5KkTP6IyXDgr0JE1XBbRnzkrieMa7rQybYNk=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1romEp-0006VQ-Nh for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Mar 2024 15:27:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id F0136CE17F5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 25 Mar 2024 15:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32FA5C43390;
 Mon, 25 Mar 2024 15:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711380458;
 bh=k5vZ5v04kF+SNpJumj+J1Clmo/WK+DuJDJ+dqdGfxgU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nW9eTHNZJQZ4frfnYSFxcHI9Zr4oCSfglPYt26veolD4SXrCiu3HOfvnUTWeFRVLl
 dSAIU7p5MLFBLV6TNensdOPjmK+r0N6yOfqHN9Pqkx8q54xWjgS/16reooZmmb4S/c
 MbOj+ZV2HEZajOVMgi0/hWUESWUGS4UcgS7o9sKOEGF2kJ3l6+4XfTnXX2kB4tTdGx
 exOyBqBOs+BPm1zAPm8d16KxMMt/RpRF+KX2Kzw8/Ct9d6/06cOcZ8aYkpbHQ6ZEbm
 XTaUtAfbPmw1T1kb36HqqDVqkn4sdiICNf4fSzunu6nDu9TkfzqnMrpDjZDDzfBI5W
 o+ROXHrJZtYzA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 25 Mar 2024 23:27:26 +0800
Message-Id: <20240325152726.797423-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325152726.797423-1-chao@kernel.org>
References: <20240325152726.797423-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch supports to map continuous holes or preallocated
 addresses to improve performace of lookuping mapping info during read DIO.
 [testcase 1] xfs_io -f /mnt/f2fs/hole -c "truncate 1m" -c "fsync" xfs_io
 -d /mnt/f2fs/hole -c "pread -b 1m 0 1m" 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1romEp-0006VQ-Nh
Subject: [f2fs-dev] [PATCH 2/2] f2fs: support to map continuous holes or
 preallocated address
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch supports to map continuous holes or preallocated addresses
to improve performace of lookuping mapping info during read DIO.

[testcase 1]
xfs_io -f /mnt/f2fs/hole -c "truncate 1m" -c "fsync"
xfs_io -d /mnt/f2fs/hole -c "pread -b 1m 0 1m"

[before]
f2fs_direct_IO_enter: dev = (253,16), ino = 6 pos = 0 len = 1048576 ki_flags = 20000 ki_ioprio = 0 rw = 0
f2fs_map_blocks: dev = (253,16), ino = 6, file offset = 0, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 1, may_create = 0, multidevice = 0, flag = 3, err = 0
f2fs_map_blocks: dev = (253,16), ino = 6, file offset = 1, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 1, may_create = 0, multidevice = 0, flag = 3, err = 0
f2fs_map_blocks: dev = (253,16), ino = 6, file offset = 2, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 1, may_create = 0, multidevice = 0, flag = 3, err = 0
f2fs_map_blocks: dev = (253,16), ino = 6, file offset = 3, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 1, may_create = 0, multidevice = 0, flag = 3, err = 0
f2fs_map_blocks: dev = (253,16), ino = 6, file offset = 4, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 1, may_create = 0, multidevice = 0, flag = 3, err = 0
f2fs_map_blocks: dev = (253,16), ino = 6, file offset = 5, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 1, may_create = 0, multidevice = 0, flag = 3, err = 0
f2fs_map_blocks: dev = (253,16), ino = 6, file offset = 6, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 1, may_create = 0, multidevice = 0, flag = 3, err = 0
f2fs_map_blocks: dev = (253,16), ino = 6, file offset = 7, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 1, may_create = 0, multidevice = 0, flag = 3, err = 0
f2fs_map_blocks: dev = (253,16), ino = 6, file offset = 8, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 1, may_create = 0, multidevice = 0, flag = 3, err = 0
f2fs_map_blocks: dev = (253,16), ino = 6, file offset = 9, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 1, may_create = 0, multidevice = 0, flag = 3, err = 0
f2fs_map_blocks: dev = (253,16), ino = 6, file offset = 10, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 1, may_create = 0, multidevice = 0, flag = 3, err = 0
f2fs_map_blocks: dev = (253,16), ino = 6, file offset = 11, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 1, may_create = 0, multidevice = 0, flag = 3, err = 0
f2fs_map_blocks: dev = (253,16), ino = 6, file offset = 12, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 1, may_create = 0, multidevice = 0, flag = 3, err = 0
f2fs_map_blocks: dev = (253,16), ino = 6, file offset = 13, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 1, may_create = 0, multidevice = 0, flag = 3, err = 0
f2fs_map_blocks: dev = (253,16), ino = 6, file offset = 14, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 1, may_create = 0, multidevice = 0, flag = 3, err = 0
f2fs_map_blocks: dev = (253,16), ino = 6, file offset = 15, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 1, may_create = 0, multidevice = 0, flag = 3, err = 0
f2fs_map_blocks: dev = (253,16), ino = 6, file offset = 16, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 1, may_create = 0, multidevice = 0, flag = 3, err = 0
......
f2fs_direct_IO_exit: dev = (253,16), ino = 6 pos = 0 len = 1048576 rw = 0 ret = 1048576

[after]
f2fs_direct_IO_enter: dev = (253,16), ino = 6 pos = 0 len = 1048576 ki_flags = 20000 ki_ioprio = 0 rw = 0
f2fs_map_blocks: dev = (253,16), ino = 6, file offset = 0, start blkaddr = 0x0, len = 0x100, flags = 0, seg_type = 1, may_create = 0, multidevice = 0, flag = 3, err = 0
f2fs_direct_IO_exit: dev = (253,16), ino = 6 pos = 0 len = 1048576 rw = 0 ret = 1048576

[testcase 2]
xfs_io -f /mnt/f2fs/preallocated -c "falloc 0 1m" -c "fsync"
xfs_io -d /mnt/f2fs/preallocated -c "pread -b 1m 0 1m"

[before]
f2fs_direct_IO_enter: dev = (253,16), ino = 11 pos = 0 len = 1048576 ki_flags = 20000 ki_ioprio = 0 rw = 0
f2fs_map_blocks: dev = (253,16), ino = 11, file offset = 0, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 1, may_create = 0, multidevice = 0, flag = 3, err = 0
f2fs_map_blocks: dev = (253,16), ino = 11, file offset = 1, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 1, may_create = 0, multidevice = 0, flag = 3, err = 0
f2fs_map_blocks: dev = (253,16), ino = 11, file offset = 2, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 1, may_create = 0, multidevice = 0, flag = 3, err = 0
f2fs_map_blocks: dev = (253,16), ino = 11, file offset = 3, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 1, may_create = 0, multidevice = 0, flag = 3, err = 0
f2fs_map_blocks: dev = (253,16), ino = 11, file offset = 4, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 1, may_create = 0, multidevice = 0, flag = 3, err = 0
f2fs_map_blocks: dev = (253,16), ino = 11, file offset = 5, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 1, may_create = 0, multidevice = 0, flag = 3, err = 0
f2fs_map_blocks: dev = (253,16), ino = 11, file offset = 6, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 1, may_create = 0, multidevice = 0, flag = 3, err = 0
f2fs_map_blocks: dev = (253,16), ino = 11, file offset = 7, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 1, may_create = 0, multidevice = 0, flag = 3, err = 0
f2fs_map_blocks: dev = (253,16), ino = 11, file offset = 8, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 1, may_create = 0, multidevice = 0, flag = 3, err = 0
f2fs_map_blocks: dev = (253,16), ino = 11, file offset = 9, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 1, may_create = 0, multidevice = 0, flag = 3, err = 0
f2fs_map_blocks: dev = (253,16), ino = 11, file offset = 10, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 1, may_create = 0, multidevice = 0, flag = 3, err = 0
f2fs_map_blocks: dev = (253,16), ino = 11, file offset = 11, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 1, may_create = 0, multidevice = 0, flag = 3, err = 0
f2fs_map_blocks: dev = (253,16), ino = 11, file offset = 12, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 1, may_create = 0, multidevice = 0, flag = 3, err = 0
f2fs_map_blocks: dev = (253,16), ino = 11, file offset = 13, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 1, may_create = 0, multidevice = 0, flag = 3, err = 0
f2fs_map_blocks: dev = (253,16), ino = 11, file offset = 14, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 1, may_create = 0, multidevice = 0, flag = 3, err = 0
f2fs_map_blocks: dev = (253,16), ino = 11, file offset = 15, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 1, may_create = 0, multidevice = 0, flag = 3, err = 0
f2fs_map_blocks: dev = (253,16), ino = 11, file offset = 16, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 1, may_create = 0, multidevice = 0, flag = 3, err = 0
......
f2fs_direct_IO_exit: dev = (253,16), ino = 11 pos = 0 len = 1048576 rw = 0 ret = 1048576

[after]
f2fs_direct_IO_enter: dev = (253,16), ino = 11 pos = 0 len = 1048576 ki_flags = 20000 ki_ioprio = 0 rw = 0
f2fs_map_blocks: dev = (253,16), ino = 11, file offset = 0, start blkaddr = 0xffffffff, len = 0x100, flags = 4, seg_type = 1, may_create = 0, multidevice = 0, flag = 3, err = 0
f2fs_direct_IO_exit: dev = (253,16), ino = 11 pos = 0 len = 1048576 rw = 0 ret = 1048576

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 9c000ca4f808..47e9b1bddb9b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1521,6 +1521,9 @@ static bool map_is_mergeable(struct f2fs_sb_info *sbi,
 		return true;
 	if (flag == F2FS_GET_BLOCK_PRE_DIO)
 		return true;
+	if (flag == F2FS_GET_BLOCK_DIO &&
+		map->m_pblk == NULL_ADDR && blkaddr == NULL_ADDR)
+		return true;
 	return false;
 }
 
@@ -1645,6 +1648,10 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 				goto sync_out;
 			}
 			break;
+		case F2FS_GET_BLOCK_DIO:
+			if (map->m_next_pgofs)
+				*map->m_next_pgofs = pgofs + 1;
+			break;
 		default:
 			/* for defragment case */
 			if (map->m_next_pgofs)
@@ -1663,7 +1670,8 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 		/* reserved delalloc block should be mapped for fiemap. */
 		if (blkaddr == NEW_ADDR)
 			map->m_flags |= F2FS_MAP_DELALLOC;
-		map->m_flags |= F2FS_MAP_MAPPED;
+		if (flag != F2FS_GET_BLOCK_DIO || !is_hole)
+			map->m_flags |= F2FS_MAP_MAPPED;
 
 		map->m_pblk = blkaddr;
 		map->m_len = 1;
@@ -4192,12 +4200,13 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 	 * We should never see delalloc or compressed extents here based on
 	 * prior flushing and checks.
 	 */
-	if (WARN_ON_ONCE(map.m_pblk == NEW_ADDR))
-		return -EINVAL;
 	if (WARN_ON_ONCE(map.m_pblk == COMPRESS_ADDR))
 		return -EINVAL;
 
 	if (map.m_flags & F2FS_MAP_MAPPED) {
+		if (WARN_ON_ONCE(map.m_pblk == NEW_ADDR))
+			return -EINVAL;
+
 		iomap->length = blks_to_bytes(inode, map.m_len);
 		iomap->type = IOMAP_MAPPED;
 		iomap->flags |= IOMAP_F_MERGED;
@@ -4206,9 +4215,17 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 	} else {
 		if (flags & IOMAP_WRITE)
 			return -ENOTBLK;
-		iomap->length = blks_to_bytes(inode, next_pgofs) -
-				iomap->offset;
-		iomap->type = IOMAP_HOLE;
+
+		if (map.m_pblk == NULL_ADDR) {
+			iomap->length = blks_to_bytes(inode, next_pgofs) -
+								iomap->offset;
+			iomap->type = IOMAP_HOLE;
+		} else if (map.m_pblk == NEW_ADDR) {
+			iomap->length = blks_to_bytes(inode, map.m_len);
+			iomap->type = IOMAP_UNWRITTEN;
+		} else {
+			f2fs_bug_on(F2FS_I_SB(inode), 1);
+		}
 		iomap->addr = IOMAP_NULL_ADDR;
 	}
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
