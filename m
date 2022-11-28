Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7528563A48A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Nov 2022 10:16:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ozaFH-0005Ry-6h;
	Mon, 28 Nov 2022 09:16:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+7f5f7765a4bd65a1d96c+7036+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1ozaEs-0005Q6-3e for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:15:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DoK53Ib5g/cHEh9Q1C0KeM8YkfYu0tojguq3JOgGyz8=; b=Yi0m5mFoWUE+PYcAVv5huU1mJK
 BgLcjfomYA/+NU3eQX2grQoC2i5wqvmgrarkRCK5kytxgOetbhb/1NCEUK45f37eErIaJoLgr12YY
 bHgLMGeeoH6L6vyI55sPFywmawIxx/g1g7v4+gM0WMropWfXZRfOI73thWHWZPEa9UnY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DoK53Ib5g/cHEh9Q1C0KeM8YkfYu0tojguq3JOgGyz8=; b=XxsSBK/9Xufn5M97l/vb68c9NP
 qisWFdFok1kI60ZcC4U3mP2n1mxy4c7u5I/icxA1PwkM4g8mpF6vCNlMg2pKlY0tv5rQ3szlKnesl
 FSQUMQFnt96urCRg4NA9Sc05Ayhb/pXnNOTJcMOtnbhHftf5FZmAgYzg6pyYNMBUlIg8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ozaEn-00056R-Er for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:15:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=DoK53Ib5g/cHEh9Q1C0KeM8YkfYu0tojguq3JOgGyz8=; b=XsHL7Xkux2DZADI27YwBFO5BpQ
 kutz5C/W4Yw2FWoXHnkLSRKDZj5dN8mcrFExv+XZKvIM3fJFl8gVM3jd+EUXjZdcxoKVEwxh2o/ug
 o80wmsE9z0sGHGNwJXYUTiGpcKBmjnEkEyv+O8V/49cfjvJDFc0Ma8DvCsQMdSb1M05ZmNfnZlsiz
 afMpSTajycSiAY33pQSv/tQHD/J1pD8GMcHF/vjQBAjBwnNrV+DLrQ6x9y0L1phgGDf9duNaXq41v
 1UcwBlpdpb4PzRnpK3KtDn3vl5RV06rPHsm5hte7sHn0rJYKkByXjIpvTVfqIJAxzaFmEvjtf5lWJ
 +rLxq/aQ==;
Received: from [2001:4bb8:192:26e7:4739:fc09:43a5:2665] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ozaEh-000Yms-He; Mon, 28 Nov 2022 09:15:35 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 28 Nov 2022 10:15:11 +0100
Message-Id: <20221128091523.1242584-4-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221128091523.1242584-1-hch@lst.de>
References: <20221128091523.1242584-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  NEW_ADDR blocks are purely in-memory preallocated blocks,
 and thus equivalent to what the core FS code calls delayed allocations, and
 not unwritten extents which do have on-disk blocks allocated from [...] 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1ozaEn-00056R-Er
Subject: [f2fs-dev] [PATCH 03/15] f2fs: rename F2FS_MAP_UNWRITTEN to
 F2FS_MAP_DELALLOC
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

NEW_ADDR blocks are purely in-memory preallocated blocks, and thus
equivalent to what the core FS code calls delayed allocations, and not
unwritten extents which do have on-disk blocks allocated from which
reads always return zeroes until they are converted to written status.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/data.c | 8 ++++----
 fs/f2fs/f2fs.h | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 541d625d94be42..444865e0cb6397 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1638,9 +1638,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 		bidx = f2fs_target_device_index(sbi, blkaddr);
 
 	if (map->m_len == 0) {
-		/* preallocated unwritten block should be mapped for fiemap. */
+		/* reserved delalloc block should be mapped for fiemap. */
 		if (blkaddr == NEW_ADDR)
-			map->m_flags |= F2FS_MAP_UNWRITTEN;
+			map->m_flags |= F2FS_MAP_DELALLOC;
 		map->m_flags |= F2FS_MAP_MAPPED;
 
 		map->m_pblk = blkaddr;
@@ -1962,7 +1962,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 
 	compr_appended = false;
 	/* In a case of compressed cluster, append this to the last extent */
-	if (compr_cluster && ((map.m_flags & F2FS_MAP_UNWRITTEN) ||
+	if (compr_cluster && ((map.m_flags & F2FS_MAP_DELALLOC) ||
 			!(map.m_flags & F2FS_MAP_FLAGS))) {
 		compr_appended = true;
 		goto skip_fill;
@@ -2008,7 +2008,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 				compr_cluster = false;
 				size += blks_to_bytes(inode, 1);
 			}
-		} else if (map.m_flags & F2FS_MAP_UNWRITTEN) {
+		} else if (map.m_flags & F2FS_MAP_DELALLOC) {
 			flags = FIEMAP_EXTENT_UNWRITTEN;
 		}
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index db2dc3fa73162b..709bfd1c7c409e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -647,9 +647,9 @@ struct extent_tree {
  */
 #define F2FS_MAP_NEW		(1U << 0)
 #define F2FS_MAP_MAPPED		(1U << 1)
-#define F2FS_MAP_UNWRITTEN	(1U << 2)
+#define F2FS_MAP_DELALLOC	(1U << 2)
 #define F2FS_MAP_FLAGS		(F2FS_MAP_NEW | F2FS_MAP_MAPPED |\
-				F2FS_MAP_UNWRITTEN)
+				F2FS_MAP_DELALLOC)
 
 struct f2fs_map_blocks {
 	struct block_device *m_bdev;	/* for multi-device dio */
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
