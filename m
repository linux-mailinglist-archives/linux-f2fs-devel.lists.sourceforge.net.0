Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A54263D3606
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jul 2021 10:02:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6q8N-0007Rp-Go; Fri, 23 Jul 2021 08:02:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ebiggers@kernel.org>) id 1m6q8K-0007RI-Tj
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 08:02:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XfQQr5pg0PrdjYlGK8JVQSkyO7XdJ+/MFoMWXRzfhyI=; b=M3xzv3q5PqAsu/Nr5tasiUDCgb
 CmjNYas9fiSYnvt7zN+R0p9rSdTZoTTjyJY2VSRgAbyMpFShQfbVjqI3LoGGZSWI2bp81FE4Esv2N
 K6Ec5D6VJ0/GYR9yk84y9q8ZNbDeYiMUZt7qPHR1/77cT8NiRRkmLOEW3e5iLXoGpCaM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XfQQr5pg0PrdjYlGK8JVQSkyO7XdJ+/MFoMWXRzfhyI=; b=VoPGvlpn9CqWUSMyJpq7wwH1gJ
 /fVdpZtVgjCr0I4/yKxbnAkpN0xL+vb1t379uIk4w7tFHokFx7j0tWJPEs0TFwPm2pnbSeV2HjE3M
 UA5VxIlrKjn/f+7n2D14HVwvI1sTZT0NkrFbc6ENCAN04XmiiPDImMEfrNDFF2NnGmRA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m6q8B-0002fE-Ug
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 08:02:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AB5F260EE6;
 Fri, 23 Jul 2021 08:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627027312;
 bh=pi4hrUBDa7s6W23WuzCfJEToyyCAjZ7xECgM6jFKJwk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZtTVyluCjsLRfXTm+eG61MZpba23xqGVLDf6DWV7i+4jJxn87p3qXQXd75DUNbBby
 2OXrsM1Udvp3pZguaRjMt6GfA5wsvJvJ7rnB3/urBv1hAgzFY3ObDG4WexFKiuRRMp
 cz3dxzs9UsAV+C7Y+ubn9vyNUINo6apZur3xUvt2aiDO84ed+7F9xVLtklHaZF7Sgc
 /RGNykF4NCPI4mAO0pCcbbL/SaSzgJSyKLMAJDkv5mhMhIhwAbzal4Sns+ISCCa7Qm
 qWtHad1uKILOOEMR3BqTa2E2kRjWU/zVWwGBv4Mhz7VRVcmUEMAn7y+1Mr9YIrN5tQ
 66oxr3zofV1KA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>
Date: Fri, 23 Jul 2021 00:59:20 -0700
Message-Id: <20210723075921.166705-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210723075921.166705-1-ebiggers@kernel.org>
References: <20210723075921.166705-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m6q8B-0002fE-Ug
Subject: [f2fs-dev] [PATCH v2 1/2] f2fs: implement iomap operations
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
Cc: linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
 Matthew Bobrowski <mbobrowski@mbobrowski.org>,
 Satya Tangirala <satyaprateek2357@gmail.com>,
 Changheun Lee <nanich.lee@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Implement 'struct iomap_ops' for f2fs, in preparation for making f2fs
use iomap for direct I/O.

Note that this may be used for other things besides direct I/O in the
future; however, for now I've only tested it for direct I/O.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/Kconfig |  1 +
 fs/f2fs/data.c  | 58 +++++++++++++++++++++++++++++++++++++++++++++++++
 fs/f2fs/f2fs.h  |  1 +
 3 files changed, 60 insertions(+)

diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
index 7669de7b49ce..031fbb596450 100644
--- a/fs/f2fs/Kconfig
+++ b/fs/f2fs/Kconfig
@@ -7,6 +7,7 @@ config F2FS_FS
 	select CRYPTO_CRC32
 	select F2FS_FS_XATTR if FS_ENCRYPTION
 	select FS_ENCRYPTION_ALGS if FS_ENCRYPTION
+	select FS_IOMAP
 	select LZ4_COMPRESS if F2FS_FS_LZ4
 	select LZ4_DECOMPRESS if F2FS_FS_LZ4
 	select LZ4HC_COMPRESS if F2FS_FS_LZ4HC
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 1967b59a031f..8cc58ae6494f 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -21,6 +21,7 @@
 #include <linux/cleancache.h>
 #include <linux/sched/signal.h>
 #include <linux/fiemap.h>
+#include <linux/iomap.h>
 
 #include "f2fs.h"
 #include "node.h"
@@ -4103,3 +4104,60 @@ void f2fs_destroy_bio_entry_cache(void)
 {
 	kmem_cache_destroy(bio_entry_slab);
 }
+
+static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
+			    unsigned int flags, struct iomap *iomap,
+			    struct iomap *srcmap)
+{
+	struct f2fs_map_blocks map = {};
+	pgoff_t next_pgofs = 0;
+	int err;
+
+	map.m_lblk = bytes_to_blks(inode, offset);
+	map.m_len = bytes_to_blks(inode, offset + length - 1) - map.m_lblk + 1;
+	map.m_next_pgofs = &next_pgofs;
+	map.m_seg_type = f2fs_rw_hint_to_seg_type(inode->i_write_hint);
+	if (flags & IOMAP_WRITE)
+		map.m_may_create = true;
+
+	err = f2fs_map_blocks(inode, &map, flags & IOMAP_WRITE,
+			      F2FS_GET_BLOCK_DIO);
+	if (err)
+		return err;
+
+	iomap->offset = blks_to_bytes(inode, map.m_lblk);
+
+	if (map.m_flags & (F2FS_MAP_MAPPED | F2FS_MAP_UNWRITTEN)) {
+		iomap->length = blks_to_bytes(inode, map.m_len);
+		if (map.m_flags & F2FS_MAP_MAPPED) {
+			iomap->type = IOMAP_MAPPED;
+			iomap->flags |= IOMAP_F_MERGED;
+		} else {
+			iomap->type = IOMAP_UNWRITTEN;
+		}
+		if (WARN_ON_ONCE(!__is_valid_data_blkaddr(map.m_pblk)))
+			return -EINVAL;
+		iomap->addr = blks_to_bytes(inode, map.m_pblk);
+
+		if (WARN_ON_ONCE(f2fs_is_multi_device(F2FS_I_SB(inode))))
+			return -EINVAL;
+		iomap->bdev = inode->i_sb->s_bdev;
+	} else {
+		iomap->length = blks_to_bytes(inode, next_pgofs) -
+				iomap->offset;
+		iomap->type = IOMAP_HOLE;
+		iomap->addr = IOMAP_NULL_ADDR;
+	}
+
+	if (map.m_flags & F2FS_MAP_NEW)
+		iomap->flags |= IOMAP_F_NEW;
+	if ((inode->i_state & I_DIRTY_DATASYNC) ||
+	    offset + length > i_size_read(inode))
+		iomap->flags |= IOMAP_F_DIRTY;
+
+	return 0;
+}
+
+const struct iomap_ops f2fs_iomap_ops = {
+	.iomap_begin	= f2fs_iomap_begin,
+};
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 506382fa3c77..231e3bf2a63e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3644,6 +3644,7 @@ int f2fs_init_post_read_processing(void);
 void f2fs_destroy_post_read_processing(void);
 int f2fs_init_post_read_wq(struct f2fs_sb_info *sbi);
 void f2fs_destroy_post_read_wq(struct f2fs_sb_info *sbi);
+extern const struct iomap_ops f2fs_iomap_ops;
 
 /*
  * gc.c
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
