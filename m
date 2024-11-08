Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE1A9C1395
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Nov 2024 02:26:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t9DlN-0003Ad-Tk;
	Fri, 08 Nov 2024 01:26:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t9DlN-0003AX-2p
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Nov 2024 01:26:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CD5ohevgD/0CLYCtsLB0bghUakqL6vY+7xdEmGiCSTc=; b=fnrCmHiLQIdDvUH/w1ltRkvxTI
 V5uO3NZFu54xF8/YvMM5NvqbKoEfu9iVt2kkft6VgG46+xviXbMiuBV7mkD+c4zdOG/HUlyIMq1M7
 z4jn1azoX9UNHoDqbiUkleQPe/tCNZ42pzQVniJLZQYZhvAggBAIYQxIbEaiLmbE/E/o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CD5ohevgD/0CLYCtsLB0bghUakqL6vY+7xdEmGiCSTc=; b=Pb5BxTWHYOkO0vmCiva4FJv9Fh
 El46IszeHCxdIIY3kgsaFaz8/1bdX2KOd71jNiAVMqYYyjzAyII5dYvlY3MbmHzpmpZ3JnUtF39/x
 TMuD+AUE1WJxr/77cSvSmLWdq0cY2YnLzNB2MSA+/DeK5QgdXEN8oPHe94ZhNeioTTHg=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t9DlM-0006B1-4V for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Nov 2024 01:26:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A7D27A426AF;
 Fri,  8 Nov 2024 01:24:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6487C4CECE;
 Fri,  8 Nov 2024 01:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731029166;
 bh=z1H8xN41cgBNtfszEpjIbmeQ+MnAkd5Yt6kDRAkWbss=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uRNGA5sysTjVfpmMwZGzPWf0wCt3cjJdz/Y5Q5fR5T1iVQP2MKJqtSWa4zIPCGgPs
 xkcxng2kDyw8KRSJi0RmYAI95siETheMn/pRMvQoM9FC0FlfQmTpfWnXlHEx/jPzuT
 B4d0t3R4yoxpXxAQAJbknUuhRnuOwgQbrNEMTdLPiqgU5dNJXuGLy2p6KVM3rXEDTt
 XIxPnyGjQln2npBJQGzNbY7d4CwPm6o23U5Cyxbxzq3MGp/JYrR40oBSeYjUeM/lUR
 UWzuBqjH95GGv+zqMKs3mZRpVORG10aMHxDD6x2gdK0U1TJ9qImLBLcKQ777JuroGQ
 ApGyJkYGGAnKw==
To: jaegeuk@kernel.org
Date: Fri,  8 Nov 2024 09:25:55 +0800
Message-Id: <20241108012557.572782-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241108012557.572782-1-chao@kernel.org>
References: <20241108012557.572782-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  f2fs doesn't support different blksize in one instance, so
 bytes_to_blks() and blks_to_bytes() are equal to F2FS_BYTES_TO_BLK and
 F2FS_BLK_TO_BYTES, 
 let's use F2FS_BYTES_TO_BLK/F2FS_BLK_TO_BYTES inste [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t9DlM-0006B1-4V
Subject: [f2fs-dev] [PATCH 2/4] f2fs: clean up w/ F2FS_{BLK_TO_BYTES,
 BTYES_TO_BLK}
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
Cc: Zhiguo Niu <zhiguo.niu@unisoc.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

f2fs doesn't support different blksize in one instance, so
bytes_to_blks() and blks_to_bytes() are equal to F2FS_BYTES_TO_BLK
and F2FS_BLK_TO_BYTES, let's use F2FS_BYTES_TO_BLK/F2FS_BLK_TO_BYTES
instead for cleanup.

Reviewed-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 68 +++++++++++++++++++++-----------------------------
 1 file changed, 29 insertions(+), 39 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index b33aca24b9ef..0e8390cbdb5b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1819,16 +1819,6 @@ bool f2fs_overwrite_io(struct inode *inode, loff_t pos, size_t len)
 	return true;
 }
 
-static inline u64 bytes_to_blks(struct inode *inode, u64 bytes)
-{
-	return (bytes >> inode->i_blkbits);
-}
-
-static inline u64 blks_to_bytes(struct inode *inode, u64 blks)
-{
-	return (blks << inode->i_blkbits);
-}
-
 static int f2fs_xattr_fiemap(struct inode *inode,
 				struct fiemap_extent_info *fieinfo)
 {
@@ -1854,7 +1844,7 @@ static int f2fs_xattr_fiemap(struct inode *inode,
 			return err;
 		}
 
-		phys = blks_to_bytes(inode, ni.blk_addr);
+		phys = F2FS_BLK_TO_BYTES(ni.blk_addr);
 		offset = offsetof(struct f2fs_inode, i_addr) +
 					sizeof(__le32) * (DEF_ADDRS_PER_INODE -
 					get_inline_xattr_addrs(inode));
@@ -1886,7 +1876,7 @@ static int f2fs_xattr_fiemap(struct inode *inode,
 			return err;
 		}
 
-		phys = blks_to_bytes(inode, ni.blk_addr);
+		phys = F2FS_BLK_TO_BYTES(ni.blk_addr);
 		len = inode->i_sb->s_blocksize;
 
 		f2fs_put_page(page, 1);
@@ -1948,16 +1938,16 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 			goto out;
 	}
 
-	if (bytes_to_blks(inode, len) == 0)
-		len = blks_to_bytes(inode, 1);
+	if (F2FS_BYTES_TO_BLK(len) == 0)
+		len = F2FS_BLKSIZE;
 
-	start_blk = bytes_to_blks(inode, start);
-	last_blk = bytes_to_blks(inode, start + len - 1);
+	start_blk = F2FS_BYTES_TO_BLK(start);
+	last_blk = F2FS_BYTES_TO_BLK(start + len - 1);
 
 next:
 	memset(&map, 0, sizeof(map));
 	map.m_lblk = start_blk;
-	map.m_len = bytes_to_blks(inode, len);
+	map.m_len = F2FS_BYTES_TO_BLK(len);
 	map.m_next_pgofs = &next_pgofs;
 	map.m_seg_type = NO_CHECK_TYPE;
 
@@ -1974,7 +1964,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 	if (!compr_cluster && !(map.m_flags & F2FS_MAP_FLAGS)) {
 		start_blk = next_pgofs;
 
-		if (blks_to_bytes(inode, start_blk) < maxbytes)
+		if (F2FS_BLK_TO_BYTES(start_blk) < maxbytes)
 			goto prep_next;
 
 		flags |= FIEMAP_EXTENT_LAST;
@@ -2011,14 +2001,14 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 	} else if (compr_appended) {
 		unsigned int appended_blks = cluster_size -
 						count_in_cluster + 1;
-		size += blks_to_bytes(inode, appended_blks);
+		size += F2FS_BLK_TO_BYTES(appended_blks);
 		start_blk += appended_blks;
 		compr_cluster = false;
 	} else {
-		logical = blks_to_bytes(inode, start_blk);
+		logical = F2FS_BLK_TO_BYTES(start_blk);
 		phys = __is_valid_data_blkaddr(map.m_pblk) ?
-			blks_to_bytes(inode, map.m_pblk) : 0;
-		size = blks_to_bytes(inode, map.m_len);
+			F2FS_BLK_TO_BYTES(map.m_pblk) : 0;
+		size = F2FS_BLK_TO_BYTES(map.m_len);
 		flags = 0;
 
 		if (compr_cluster) {
@@ -2026,13 +2016,13 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 			count_in_cluster += map.m_len;
 			if (count_in_cluster == cluster_size) {
 				compr_cluster = false;
-				size += blks_to_bytes(inode, 1);
+				size += F2FS_BLKSIZE;
 			}
 		} else if (map.m_flags & F2FS_MAP_DELALLOC) {
 			flags = FIEMAP_EXTENT_UNWRITTEN;
 		}
 
-		start_blk += bytes_to_blks(inode, size);
+		start_blk += F2FS_BYTES_TO_BLK(size);
 	}
 
 prep_next:
@@ -2070,7 +2060,7 @@ static int f2fs_read_single_page(struct inode *inode, struct folio *folio,
 					struct readahead_control *rac)
 {
 	struct bio *bio = *bio_ret;
-	const unsigned blocksize = blks_to_bytes(inode, 1);
+	const unsigned int blocksize = F2FS_BLKSIZE;
 	sector_t block_in_file;
 	sector_t last_block;
 	sector_t last_block_in_file;
@@ -2080,8 +2070,8 @@ static int f2fs_read_single_page(struct inode *inode, struct folio *folio,
 
 	block_in_file = (sector_t)index;
 	last_block = block_in_file + nr_pages;
-	last_block_in_file = bytes_to_blks(inode,
-			f2fs_readpage_limit(inode) + blocksize - 1);
+	last_block_in_file = F2FS_BYTES_TO_BLK(f2fs_readpage_limit(inode) +
+							blocksize - 1);
 	if (last_block > last_block_in_file)
 		last_block = last_block_in_file;
 
@@ -2181,7 +2171,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 	struct bio *bio = *bio_ret;
 	unsigned int start_idx = cc->cluster_idx << cc->log_cluster_size;
 	sector_t last_block_in_file;
-	const unsigned blocksize = blks_to_bytes(inode, 1);
+	const unsigned int blocksize = F2FS_BLKSIZE;
 	struct decompress_io_ctx *dic = NULL;
 	struct extent_info ei = {};
 	bool from_dnode = true;
@@ -2190,8 +2180,8 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 
 	f2fs_bug_on(sbi, f2fs_cluster_is_empty(cc));
 
-	last_block_in_file = bytes_to_blks(inode,
-			f2fs_readpage_limit(inode) + blocksize - 1);
+	last_block_in_file = F2FS_BYTES_TO_BLK(f2fs_readpage_limit(inode) +
+							blocksize - 1);
 
 	/* get rid of pages beyond EOF */
 	for (i = 0; i < cc->cluster_size; i++) {
@@ -3957,7 +3947,7 @@ static int check_swap_activate(struct swap_info_struct *sis,
 	 * to be very smart.
 	 */
 	cur_lblock = 0;
-	last_lblock = bytes_to_blks(inode, i_size_read(inode));
+	last_lblock = F2FS_BYTES_TO_BLK(i_size_read(inode));
 
 	while (cur_lblock < last_lblock && cur_lblock < sis->max) {
 		struct f2fs_map_blocks map;
@@ -4200,8 +4190,8 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 	pgoff_t next_pgofs = 0;
 	int err;
 
-	map.m_lblk = bytes_to_blks(inode, offset);
-	map.m_len = bytes_to_blks(inode, offset + length - 1) - map.m_lblk + 1;
+	map.m_lblk = F2FS_BYTES_TO_BLK(offset);
+	map.m_len = F2FS_BYTES_TO_BLK(offset + length - 1) - map.m_lblk + 1;
 	map.m_next_pgofs = &next_pgofs;
 	map.m_seg_type = f2fs_rw_hint_to_seg_type(F2FS_I_SB(inode),
 						inode->i_write_hint);
@@ -4212,7 +4202,7 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 	if (err)
 		return err;
 
-	iomap->offset = blks_to_bytes(inode, map.m_lblk);
+	iomap->offset = F2FS_BLK_TO_BYTES(map.m_lblk);
 
 	/*
 	 * When inline encryption is enabled, sometimes I/O to an encrypted file
@@ -4232,21 +4222,21 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 		if (WARN_ON_ONCE(map.m_pblk == NEW_ADDR))
 			return -EINVAL;
 
-		iomap->length = blks_to_bytes(inode, map.m_len);
+		iomap->length = F2FS_BLK_TO_BYTES(map.m_len);
 		iomap->type = IOMAP_MAPPED;
 		iomap->flags |= IOMAP_F_MERGED;
 		iomap->bdev = map.m_bdev;
-		iomap->addr = blks_to_bytes(inode, map.m_pblk);
+		iomap->addr = F2FS_BLK_TO_BYTES(map.m_pblk);
 	} else {
 		if (flags & IOMAP_WRITE)
 			return -ENOTBLK;
 
 		if (map.m_pblk == NULL_ADDR) {
-			iomap->length = blks_to_bytes(inode, next_pgofs) -
-								iomap->offset;
+			iomap->length = F2FS_BLK_TO_BYTES(next_pgofs) -
+							iomap->offset;
 			iomap->type = IOMAP_HOLE;
 		} else if (map.m_pblk == NEW_ADDR) {
-			iomap->length = blks_to_bytes(inode, map.m_len);
+			iomap->length = F2FS_BLK_TO_BYTES(map.m_len);
 			iomap->type = IOMAP_UNWRITTEN;
 		} else {
 			f2fs_bug_on(F2FS_I_SB(inode), 1);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
