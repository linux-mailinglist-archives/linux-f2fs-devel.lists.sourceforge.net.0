Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 017FEB2459A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Aug 2025 11:39:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WUxI4lhz31WIqq91i+9Azy3AHUakyXSrYF8+r5VRFS8=; b=F1Zv6ntvPRomeWw57LopPzcNGs
	9xKsEquGmvSYfLA4DcfRjrZVukdFjDW5x/d55+Tjx2POKnga/255Tmgr23nODb1agAGS12GcOtNgi
	ALQkHaKeYkK2lcGFqgmkeEWTciXZueqjhyABc1vK0N2XuzDBIcb+TTd1qW5boxTZTr60=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1um7wj-0007qZ-Oz;
	Wed, 13 Aug 2025 09:39:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1um7wh-0007q9-9s
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Aug 2025 09:38:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ditHfv4Xw/qNYECUQApLedQTnsHw0maMoM0hqTAtyU4=; b=IIaM9gjUbzDNjNL/uqNXi+C/p/
 EGQSNC/0iFbj65iNnnTEfrlzJcEC0aaZ3zU1tPpuzwr1+Pz0p7QbQnIKZvoxxHXqmIGtxNlwXolfq
 FUWxTXUn6svHyxyO8p1XM+5FH6gXnd7oVMby6BHcpYLSjP/VHyrA9UDb/39J8YlLQBtA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ditHfv4Xw/qNYECUQApLedQTnsHw0maMoM0hqTAtyU4=; b=DL7j8U3dgeBIDa+bSmETMBJ7uU
 PMVgpZk1aSkbAqb/lMA6b10QTBIMW6p445nFPJ/GgmEN25TwzGxw+qPGF5Zw+opu3Agu1VZGF54LT
 nav+FV+ZLG0BaxldUfGSXzsPgWfNqU23Sj/6HKHVBLik9XQRFJ9NU7T/U4mCex+rNe8U=;
Received: from m16.mail.126.com ([117.135.210.6])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1um7wf-0004VS-KE for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Aug 2025 09:38:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=di
 tHfv4Xw/qNYECUQApLedQTnsHw0maMoM0hqTAtyU4=; b=oCwFiOu90VwXKqWSva
 uMIfP2Wi2tuCSig3RWpFRhsFWg1typFg+nKM8DDMJo0DoZxAOEoriMXHsRuKt4GK
 vpFVGYxoZwoshA6VrDjABAR6OXVsdOA/JTrq10yRLFpXKpTPEm8dPMCEFYerS7RM
 3zPk31f3ke8YvwkrG1ZqQPJwg=
Received: from YLLaptop.. (unknown [])
 by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id
 _____wD3tyv8XJxo_MzyBQ--.54250S11; 
 Wed, 13 Aug 2025 17:38:31 +0800 (CST)
From: Nanzhe Zhao <nzzhao@126.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org
Date: Wed, 13 Aug 2025 17:37:55 +0800
Message-Id: <20250813093755.47599-10-nzzhao@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250813093755.47599-1-nzzhao@126.com>
References: <20250813093755.47599-1-nzzhao@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3tyv8XJxo_MzyBQ--.54250S11
X-Coremail-Antispam: 1Uf129KBjvAXoWfWrWUWw4ktFW7WrykKF1xZrb_yoW5Xr4kGo
 Waqw45Xw409ry3ArWUK3s2qFWUua9xJw1kAFWF9rZ09F9rt34Du3y7Wa17Xa43Xr15GFZ8
 A34xJa15GF4UAF1fn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4RNo7NUUUUU
X-Originating-IP: [58.240.165.118]
X-CM-SenderInfo: xq22xtbr6rjloofrz/1tbiZA6oz2icUlqdGgAEsy
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This commit enables large folios support for F2FS's buffered
 read and write paths. We introduce a helper function `f2fs_set_iomap` to
 handle all the logic that converts a f2fs_map_blocks to iomap. Currently,
 compressed files, encrypted files, and fsverity are not supported with iomap
 large folios. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [117.135.210.6 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1um7wf-0004VS-KE
Subject: [f2fs-dev] [RFC PATCH 9/9] f2fs: Enable buffered read/write path
 large folios support for normal and atomic file with iomap
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
Cc: Nanzhe Zhao <nzzhao@126.com>, Barry Song <21cnbao@gmail.com>,
 Matthew Wilcox <willy@infradead.org>, Yi Zhang <yi.zhang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This commit enables large folios support for F2FS's buffered read and
write paths.

We introduce a helper function `f2fs_set_iomap` to handle all the logic
that converts a f2fs_map_blocks to iomap.

Currently, compressed files, encrypted files, and fsverity are not
supported with iomap large folios.

Since F2FS requires `f2fs_iomap_folio_state` (or a similar equivalent
mechanism) to correctly support the iomap framework, when
`CONFIG_F2FS_IOMAP_FOLIO_STATE` is not enabled, we will not use the
iomap buffered read/write paths.

Note: Since holes reported by f2fs_map_blocks come in two types
(NULL_ADDR and unmapped dnodes).
They requiring different handle logic to set iomap.length,
So we add a new block state flag for f2fs_map_blocks

Signed-off-by: Nanzhe Zhao <nzzhao@126.com>
---
 fs/f2fs/data.c   | 286 +++++++++++++++++++++++++++++++++++++++++++----
 fs/f2fs/f2fs.h   | 120 +++++++++++++-------
 fs/f2fs/file.c   |  33 +++++-
 fs/f2fs/inline.c |  15 ++-
 fs/f2fs/inode.c  |  27 +++++
 fs/f2fs/namei.c  |   7 ++
 fs/f2fs/super.c  |   3 +
 7 files changed, 425 insertions(+), 66 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 37eaf431ab42..243c6305b0c5 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1149,6 +1149,9 @@ void f2fs_update_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr)
 {
 	f2fs_set_data_blkaddr(dn, blkaddr);
 	f2fs_update_read_extent_cache(dn);
+#ifdef CONFIG_F2FS_IOMAP_FOLIO_STATE
+	f2fs_iomap_seq_inc(dn->inode);
+#endif
 }
 
 /* dn->ofs_in_node will be returned with up-to-date last block pointer */
@@ -1182,6 +1185,9 @@ int f2fs_reserve_new_blocks(struct dnode_of_data *dn, blkcnt_t count)
 
 	if (folio_mark_dirty(dn->node_folio))
 		dn->node_changed = true;
+#ifdef CONFIG_F2FS_IOMAP_FOLIO_STATE
+	f2fs_iomap_seq_inc(dn->inode);
+#endif
 	return 0;
 }
 
@@ -1486,6 +1492,7 @@ static int f2fs_map_no_dnode(struct inode *inode,
 		*map->m_next_pgofs = f2fs_get_next_page_offset(dn, pgoff);
 	if (map->m_next_extent)
 		*map->m_next_extent = f2fs_get_next_page_offset(dn, pgoff);
+	map->m_flags |= F2FS_MAP_NODNODE;
 	return 0;
 }
 
@@ -1702,7 +1709,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 		if (blkaddr == NEW_ADDR)
 			map->m_flags |= F2FS_MAP_DELALLOC;
 		/* DIO READ and hole case, should not map the blocks. */
-		if (!(flag == F2FS_GET_BLOCK_DIO && is_hole && !map->m_may_create))
+		if (!(flag == F2FS_GET_BLOCK_DIO && is_hole &&
+		      !map->m_may_create) &&
+		    !(flag == F2FS_GET_BLOCK_IOMAP && is_hole))
 			map->m_flags |= F2FS_MAP_MAPPED;
 
 		map->m_pblk = blkaddr;
@@ -1736,6 +1745,10 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 			goto sync_out;
 
 		map->m_len += dn.ofs_in_node - ofs_in_node;
+		/* Since we successfully reserved blocks, we can update the pblk now.
+		 * No need to perform inefficient look up in write_begin again
+		 */
+		map->m_pblk = dn.data_blkaddr;
 		if (prealloc && dn.ofs_in_node != last_ofs_in_node + 1) {
 			err = -ENOSPC;
 			goto sync_out;
@@ -4255,9 +4268,6 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 	err = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_DIO);
 	if (err)
 		return err;
-
-	iomap->offset = F2FS_BLK_TO_BYTES(map.m_lblk);
-
 	/*
 	 * When inline encryption is enabled, sometimes I/O to an encrypted file
 	 * has to be broken up to guarantee DUN contiguity.  Handle this by
@@ -4272,28 +4282,44 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 	if (WARN_ON_ONCE(map.m_pblk == COMPRESS_ADDR))
 		return -EINVAL;
 
-	if (map.m_flags & F2FS_MAP_MAPPED) {
-		if (WARN_ON_ONCE(map.m_pblk == NEW_ADDR))
-			return -EINVAL;
-
-		iomap->length = F2FS_BLK_TO_BYTES(map.m_len);
-		iomap->type = IOMAP_MAPPED;
-		iomap->flags |= IOMAP_F_MERGED;
-		iomap->bdev = map.m_bdev;
-		iomap->addr = F2FS_BLK_TO_BYTES(map.m_pblk);
-
-		if (flags & IOMAP_WRITE && map.m_last_pblk)
-			iomap->private = (void *)map.m_last_pblk;
+	return f2fs_set_iomap(inode, &map, iomap, flags, offset, length, false);
+}
+int f2fs_set_iomap(struct inode *inode, struct f2fs_map_blocks *map,
+		   struct iomap *iomap, unsigned int flags, loff_t offset,
+		   loff_t length, bool dio)
+{
+	iomap->offset = F2FS_BLK_TO_BYTES(map->m_lblk);
+	if (map->m_flags & F2FS_MAP_MAPPED) {
+		if (dio) {
+			if (WARN_ON_ONCE(map->m_pblk == NEW_ADDR))
+				return -EINVAL;
+		}
+		iomap->length = F2FS_BLK_TO_BYTES(map->m_len);
+		iomap->bdev = map->m_bdev;
+		if (map->m_pblk != NEW_ADDR) {
+			iomap->type = IOMAP_MAPPED;
+			iomap->flags |= IOMAP_F_MERGED;
+			iomap->addr = F2FS_BLK_TO_BYTES(map->m_pblk);
+		} else {
+			iomap->type = IOMAP_UNWRITTEN;
+			iomap->addr = IOMAP_NULL_ADDR;
+		}
+		if (flags & IOMAP_WRITE && map->m_last_pblk)
+			iomap->private = (void *)map->m_last_pblk;
 	} else {
-		if (flags & IOMAP_WRITE)
+		if (dio && flags & IOMAP_WRITE)
 			return -ENOTBLK;
 
-		if (map.m_pblk == NULL_ADDR) {
-			iomap->length = F2FS_BLK_TO_BYTES(next_pgofs) -
-							iomap->offset;
+		if (map->m_pblk == NULL_ADDR) {
+			if (map->m_flags & F2FS_MAP_NODNODE)
+				iomap->length =
+					F2FS_BLK_TO_BYTES(*map->m_next_pgofs) -
+					iomap->offset;
+			else
+				iomap->length = F2FS_BLK_TO_BYTES(map->m_len);
 			iomap->type = IOMAP_HOLE;
-		} else if (map.m_pblk == NEW_ADDR) {
-			iomap->length = F2FS_BLK_TO_BYTES(map.m_len);
+		} else if (map->m_pblk == NEW_ADDR) {
+			iomap->length = F2FS_BLK_TO_BYTES(map->m_len);
 			iomap->type = IOMAP_UNWRITTEN;
 		} else {
 			f2fs_bug_on(F2FS_I_SB(inode), 1);
@@ -4301,7 +4327,7 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 		iomap->addr = IOMAP_NULL_ADDR;
 	}
 
-	if (map.m_flags & F2FS_MAP_NEW)
+	if (map->m_flags & F2FS_MAP_NEW)
 		iomap->flags |= IOMAP_F_NEW;
 	if ((inode->i_state & I_DIRTY_DATASYNC) ||
 	    offset + length > i_size_read(inode))
@@ -4313,3 +4339,217 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 const struct iomap_ops f2fs_iomap_ops = {
 	.iomap_begin	= f2fs_iomap_begin,
 };
+
+/* iomap buffered-io */
+static int f2fs_buffered_read_iomap_begin(struct inode *inode, loff_t offset,
+					  loff_t length, unsigned int flags,
+					  struct iomap *iomap,
+					  struct iomap *srcmap)
+{
+	pgoff_t next_pgofs = 0;
+	int err;
+	struct f2fs_map_blocks map = {};
+
+	map.m_lblk = F2FS_BYTES_TO_BLK(offset);
+	map.m_len = F2FS_BYTES_TO_BLK(offset + length - 1) - map.m_lblk + 1;
+	map.m_next_pgofs = &next_pgofs;
+	map.m_seg_type =
+		f2fs_rw_hint_to_seg_type(F2FS_I_SB(inode), inode->i_write_hint);
+	map.m_may_create = false;
+	if (is_sbi_flag_set(F2FS_I_SB(inode), SBI_IS_SHUTDOWN))
+		return -EIO;
+	/*
+	 * If the blocks being overwritten are already allocated,
+	 * f2fs_map_lock and f2fs_balance_fs are not necessary.
+	 */
+	if (flags & IOMAP_WRITE)
+		return -EINVAL;
+
+	err = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_IOMAP);
+	if (err)
+		return err;
+
+	if (WARN_ON_ONCE(map.m_pblk == COMPRESS_ADDR))
+		return -EINVAL;
+
+	return f2fs_set_iomap(inode, &map, iomap, flags, offset, length, false);
+}
+
+const struct iomap_ops f2fs_buffered_read_iomap_ops = {
+	.iomap_begin = f2fs_buffered_read_iomap_begin,
+};
+
+static void f2fs_iomap_readahead(struct readahead_control *rac)
+{
+	struct inode *inode = rac->mapping->host;
+
+	if (!f2fs_is_compress_backend_ready(inode))
+		return;
+
+	/* If the file has inline data, skip readahead */
+	if (f2fs_has_inline_data(inode))
+		return;
+	iomap_readahead(rac, &f2fs_buffered_read_iomap_ops);
+}
+
+static int f2fs_buffered_write_iomap_begin(struct inode *inode, loff_t offset,
+					   loff_t length, unsigned flags,
+					   struct iomap *iomap,
+					   struct iomap *srcmap)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_map_blocks map = {};
+	struct folio *ifolio = NULL;
+	int err = 0;
+
+	iomap->offset = offset;
+	iomap->bdev = sbi->sb->s_bdev;
+#ifdef CONFIG_F2FS_IOMAP_FOLIO_STATE
+	iomap->validity_cookie = f2fs_iomap_seq_read(inode);
+#endif
+	if (f2fs_has_inline_data(inode)) {
+		if (offset + length <= MAX_INLINE_DATA(inode)) {
+			ifolio = f2fs_get_inode_folio(sbi, inode->i_ino);
+			if (IS_ERR(ifolio)) {
+				err = PTR_ERR(ifolio);
+				goto failed;
+			}
+			set_inode_flag(inode, FI_DATA_EXIST);
+			f2fs_iomap_prepare_read_inline(inode, ifolio, iomap,
+						       offset, length);
+			if (inode->i_nlink)
+				folio_set_f2fs_inline(ifolio);
+
+			f2fs_folio_put(ifolio, 1);
+			goto out;
+		}
+	}
+	block_t start_blk = F2FS_BYTES_TO_BLK(offset);
+	block_t len_blks =
+		F2FS_BYTES_TO_BLK(offset + length - 1) - start_blk + 1;
+	err = f2fs_map_blocks_iomap(inode, start_blk, len_blks, &map);
+	if (map.m_pblk == NULL_ADDR) {
+		err = f2fs_map_blocks_preallocate(inode, map.m_lblk, len_blks,
+						  &map);
+		if (err)
+			goto failed;
+	}
+	if (WARN_ON_ONCE(map.m_pblk == COMPRESS_ADDR))
+		return -EIO; // Should not happen for buffered write prep
+	err = f2fs_set_iomap(inode, &map, iomap, flags, offset, length, false);
+	if (err)
+		return err;
+failed:
+	f2fs_write_failed(inode, offset + length);
+out:
+	return err;
+}
+
+static int f2fs_buffered_write_atomic_iomap_begin(struct inode *inode,
+						  loff_t offset, loff_t length,
+						  unsigned flags,
+						  struct iomap *iomap,
+						  struct iomap *srcmap)
+{
+	struct inode *cow_inode = F2FS_I(inode)->cow_inode;
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_map_blocks map = {};
+	int err = 0;
+
+	iomap->offset = offset;
+	iomap->bdev = sbi->sb->s_bdev;
+#ifdef CONFIG_F2FS_IOMAP_FOLIO_STATE
+	iomap->validity_cookie = f2fs_iomap_seq_read(inode);
+#endif
+	block_t start_blk = F2FS_BYTES_TO_BLK(offset);
+	block_t len_blks =
+		F2FS_BYTES_TO_BLK(offset + length - 1) - start_blk + 1;
+	err = f2fs_map_blocks_iomap(cow_inode, start_blk, len_blks, &map);
+	if (err)
+		return err;
+	if (map.m_pblk == NULL_ADDR &&
+	    is_inode_flag_set(inode, FI_ATOMIC_REPLACE)) {
+		err = f2fs_map_blocks_preallocate(cow_inode, map.m_lblk,
+						  map.m_len, &map);
+		if (err)
+			return err;
+		inc_atomic_write_cnt(inode);
+		goto out;
+	} else if (map.m_pblk != NULL_ADDR) {
+		goto out;
+	}
+	err = f2fs_map_blocks_iomap(inode, start_blk, len_blks, &map);
+	if (err)
+		return err;
+out:
+	if (WARN_ON_ONCE(map.m_pblk == COMPRESS_ADDR))
+		return -EIO;
+
+	return f2fs_set_iomap(inode, &map, iomap, flags, offset, length, false);
+}
+
+static int f2fs_buffered_write_iomap_end(struct inode *inode, loff_t pos,
+					 loff_t length, ssize_t written,
+					 unsigned flags, struct iomap *iomap)
+{
+	return written;
+}
+
+const struct iomap_ops f2fs_buffered_write_iomap_ops = {
+	.iomap_begin = f2fs_buffered_write_iomap_begin,
+	.iomap_end = f2fs_buffered_write_iomap_end,
+};
+
+const struct iomap_ops f2fs_buffered_write_atomic_iomap_ops = {
+	.iomap_begin = f2fs_buffered_write_atomic_iomap_begin,
+};
+
+const struct address_space_operations f2fs_iomap_aops = {
+	.read_folio = f2fs_read_data_folio,
+	.readahead = f2fs_iomap_readahead,
+	.write_begin = f2fs_write_begin,
+	.write_end = f2fs_write_end,
+	.writepages = f2fs_write_data_pages,
+	.dirty_folio = f2fs_dirty_data_folio,
+	.invalidate_folio = f2fs_invalidate_folio,
+	.release_folio = f2fs_release_folio,
+	.migrate_folio = filemap_migrate_folio,
+	.is_partially_uptodate = iomap_is_partially_uptodate,
+	.error_remove_folio = generic_error_remove_folio,
+};
+
+static void f2fs_iomap_put_folio(struct inode *inode, loff_t pos,
+				 unsigned copied, struct folio *folio)
+{
+	if (!copied)
+		goto unlock_out;
+	if (f2fs_is_atomic_file(inode))
+		folio_set_f2fs_atomic(folio);
+
+	if (pos + copied > i_size_read(inode) &&
+	    !f2fs_verity_in_progress(inode)) {
+		if (f2fs_is_atomic_file(inode))
+			f2fs_i_size_write(F2FS_I(inode)->cow_inode,
+					  pos + copied);
+	}
+unlock_out:
+	folio_unlock(folio);
+	folio_put(folio);
+	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
+}
+
+#ifdef CONFIG_F2FS_IOMAP_FOLIO_STATE
+static bool f2fs_iomap_valid(struct inode *inode, const struct iomap *iomap)
+{
+	return iomap->validity_cookie == f2fs_iomap_seq_read(inode);
+}
+#else
+static bool f2fs_iomap_valid(struct inode *inode, const struct iomap *iomap)
+{
+	return 1;
+}
+#endif
+const struct iomap_write_ops f2fs_iomap_write_ops = {
+	.put_folio = f2fs_iomap_put_folio,
+	.iomap_valid = f2fs_iomap_valid
+};
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index ac9a6ac13e1f..1cf12b76b09a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -762,6 +762,7 @@ struct extent_tree_info {
 #define F2FS_MAP_NEW		(1U << 0)
 #define F2FS_MAP_MAPPED		(1U << 1)
 #define F2FS_MAP_DELALLOC	(1U << 2)
+#define F2FS_MAP_NODNODE	(1U << 3)
 #define F2FS_MAP_FLAGS		(F2FS_MAP_NEW | F2FS_MAP_MAPPED |\
 				F2FS_MAP_DELALLOC)
 
@@ -837,49 +838,53 @@ enum {
 
 /* used for f2fs_inode_info->flags */
 enum {
-	FI_NEW_INODE,		/* indicate newly allocated inode */
-	FI_DIRTY_INODE,		/* indicate inode is dirty or not */
-	FI_AUTO_RECOVER,	/* indicate inode is recoverable */
-	FI_DIRTY_DIR,		/* indicate directory has dirty pages */
-	FI_INC_LINK,		/* need to increment i_nlink */
-	FI_ACL_MODE,		/* indicate acl mode */
-	FI_NO_ALLOC,		/* should not allocate any blocks */
-	FI_FREE_NID,		/* free allocated nide */
-	FI_NO_EXTENT,		/* not to use the extent cache */
-	FI_INLINE_XATTR,	/* used for inline xattr */
-	FI_INLINE_DATA,		/* used for inline data*/
-	FI_INLINE_DENTRY,	/* used for inline dentry */
-	FI_APPEND_WRITE,	/* inode has appended data */
-	FI_UPDATE_WRITE,	/* inode has in-place-update data */
-	FI_NEED_IPU,		/* used for ipu per file */
-	FI_ATOMIC_FILE,		/* indicate atomic file */
-	FI_DATA_EXIST,		/* indicate data exists */
-	FI_SKIP_WRITES,		/* should skip data page writeback */
-	FI_OPU_WRITE,		/* used for opu per file */
-	FI_DIRTY_FILE,		/* indicate regular/symlink has dirty pages */
-	FI_PREALLOCATED_ALL,	/* all blocks for write were preallocated */
-	FI_HOT_DATA,		/* indicate file is hot */
-	FI_EXTRA_ATTR,		/* indicate file has extra attribute */
-	FI_PROJ_INHERIT,	/* indicate file inherits projectid */
-	FI_PIN_FILE,		/* indicate file should not be gced */
-	FI_VERITY_IN_PROGRESS,	/* building fs-verity Merkle tree */
-	FI_COMPRESSED_FILE,	/* indicate file's data can be compressed */
-	FI_COMPRESS_CORRUPT,	/* indicate compressed cluster is corrupted */
-	FI_MMAP_FILE,		/* indicate file was mmapped */
-	FI_ENABLE_COMPRESS,	/* enable compression in "user" compression mode */
-	FI_COMPRESS_RELEASED,	/* compressed blocks were released */
-	FI_ALIGNED_WRITE,	/* enable aligned write */
-	FI_COW_FILE,		/* indicate COW file */
-	FI_ATOMIC_COMMITTED,	/* indicate atomic commit completed except disk sync */
-	FI_ATOMIC_DIRTIED,	/* indicate atomic file is dirtied */
-	FI_ATOMIC_REPLACE,	/* indicate atomic replace */
-	FI_OPENED_FILE,		/* indicate file has been opened */
-	FI_DONATE_FINISHED,	/* indicate page donation of file has been finished */
-	FI_MAX,			/* max flag, never be used */
+	FI_NEW_INODE, /* indicate newly allocated inode */
+	FI_DIRTY_INODE, /* indicate inode is dirty or not */
+	FI_AUTO_RECOVER, /* indicate inode is recoverable */
+	FI_DIRTY_DIR, /* indicate directory has dirty pages */
+	FI_INC_LINK, /* need to increment i_nlink */
+	FI_ACL_MODE, /* indicate acl mode */
+	FI_NO_ALLOC, /* should not allocate any blocks */
+	FI_FREE_NID, /* free allocated nide */
+	FI_NO_EXTENT, /* not to use the extent cache */
+	FI_INLINE_XATTR, /* used for inline xattr */
+	FI_INLINE_DATA, /* used for inline data*/
+	FI_INLINE_DENTRY, /* used for inline dentry */
+	FI_APPEND_WRITE, /* inode has appended data */
+	FI_UPDATE_WRITE, /* inode has in-place-update data */
+	FI_NEED_IPU, /* used for ipu per file */
+	FI_ATOMIC_FILE, /* indicate atomic file */
+	FI_DATA_EXIST, /* indicate data exists */
+	FI_SKIP_WRITES, /* should skip data page writeback */
+	FI_OPU_WRITE, /* used for opu per file */
+	FI_DIRTY_FILE, /* indicate regular/symlink has dirty pages */
+	FI_PREALLOCATED_ALL, /* all blocks for write were preallocated */
+	FI_HOT_DATA, /* indicate file is hot */
+	FI_EXTRA_ATTR, /* indicate file has extra attribute */
+	FI_PROJ_INHERIT, /* indicate file inherits projectid */
+	FI_PIN_FILE, /* indicate file should not be gced */
+	FI_VERITY_IN_PROGRESS, /* building fs-verity Merkle tree */
+	FI_COMPRESSED_FILE, /* indicate file's data can be compressed */
+	FI_COMPRESS_CORRUPT, /* indicate compressed cluster is corrupted */
+	FI_MMAP_FILE, /* indicate file was mmapped */
+	FI_ENABLE_COMPRESS, /* enable compression in "user" compression mode */
+	FI_COMPRESS_RELEASED, /* compressed blocks were released */
+	FI_ALIGNED_WRITE, /* enable aligned write */
+	FI_COW_FILE, /* indicate COW file */
+	FI_ATOMIC_COMMITTED, /* indicate atomic commit completed except disk sync */
+	FI_ATOMIC_DIRTIED, /* indicate atomic file is dirtied */
+	FI_ATOMIC_REPLACE, /* indicate atomic replace */
+	FI_OPENED_FILE, /* indicate file has been opened */
+	FI_DONATE_FINISHED, /* indicate page donation of file has been finished */
+	FI_IOMAP, /* indicate whether this inode should enable iomap*/
+	FI_MAX, /* max flag, never be used */
 };
 
 struct f2fs_inode_info {
 	struct inode vfs_inode;		/* serve a vfs inode */
+#ifdef CONFIG_F2FS_IOMAP_FOLIO_STATE
+	atomic64_t i_iomap_seq; /* for iomap_valid sequence number */
+#endif
 	unsigned long i_flags;		/* keep an inode flags for ioctl */
 	unsigned char i_advise;		/* use to give file attribute hints */
 	unsigned char i_dir_level;	/* use for dentry level for large dir */
@@ -2814,6 +2819,16 @@ static inline void inc_page_count(struct f2fs_sb_info *sbi, int count_type)
 		set_sbi_flag(sbi, SBI_IS_DIRTY);
 }
 
+static inline void inc_page_count_multiple(struct f2fs_sb_info *sbi,
+					   int count_type, int npages)
+{
+	atomic_add(npages, &sbi->nr_pages[count_type]);
+
+	if (count_type == F2FS_DIRTY_DENTS || count_type == F2FS_DIRTY_NODES ||
+	    count_type == F2FS_DIRTY_META || count_type == F2FS_DIRTY_QDATA ||
+	    count_type == F2FS_DIRTY_IMETA)
+		set_sbi_flag(sbi, SBI_IS_DIRTY);
+}
 static inline void inode_inc_dirty_pages(struct inode *inode)
 {
 	atomic_inc(&F2FS_I(inode)->dirty_pages);
@@ -3657,6 +3672,10 @@ static inline bool f2fs_is_cow_file(struct inode *inode)
 	return is_inode_flag_set(inode, FI_COW_FILE);
 }
 
+static inline bool f2fs_iomap_inode(struct inode *inode)
+{
+	return is_inode_flag_set(inode, FI_IOMAP);
+}
 static inline void *inline_data_addr(struct inode *inode, struct folio *folio)
 {
 	__le32 *addr = get_dnode_addr(inode, folio);
@@ -3880,7 +3899,17 @@ int f2fs_write_inode(struct inode *inode, struct writeback_control *wbc);
 void f2fs_remove_donate_inode(struct inode *inode);
 void f2fs_evict_inode(struct inode *inode);
 void f2fs_handle_failed_inode(struct inode *inode);
+#ifdef CONFIG_F2FS_IOMAP_FOLIO_STATE
+static inline void f2fs_iomap_seq_inc(struct inode *inode)
+{
+	atomic64_inc(&F2FS_I(inode)->i_iomap_seq);
+}
 
+static inline u64 f2fs_iomap_seq_read(struct inode *inode)
+{
+	return atomic64_read(&F2FS_I(inode)->i_iomap_seq);
+}
+#endif
 /*
  * namei.c
  */
@@ -4248,6 +4277,9 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 				enum iostat_type io_type,
 				int compr_blocks, bool allow_balance);
 void f2fs_write_failed(struct inode *inode, loff_t to);
+int f2fs_set_iomap(struct inode *inode, struct f2fs_map_blocks *map,
+		   struct iomap *iomap, unsigned int flags, loff_t offset,
+		   loff_t length, bool dio);
 void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length);
 bool f2fs_release_folio(struct folio *folio, gfp_t wait);
 bool f2fs_overwrite_io(struct inode *inode, loff_t pos, size_t len);
@@ -4258,6 +4290,11 @@ int f2fs_init_post_read_wq(struct f2fs_sb_info *sbi);
 void f2fs_destroy_post_read_wq(struct f2fs_sb_info *sbi);
 extern const struct iomap_ops f2fs_iomap_ops;
 
+extern const struct iomap_write_ops f2fs_iomap_write_ops;
+extern const struct iomap_ops f2fs_buffered_read_iomap_ops;
+extern const struct iomap_ops f2fs_buffered_write_iomap_ops;
+extern const struct iomap_ops f2fs_buffered_write_atomic_iomap_ops;
+
 /*
  * gc.c
  */
@@ -4540,6 +4577,7 @@ extern const struct file_operations f2fs_dir_operations;
 extern const struct file_operations f2fs_file_operations;
 extern const struct inode_operations f2fs_file_inode_operations;
 extern const struct address_space_operations f2fs_dblock_aops;
+extern const struct address_space_operations f2fs_iomap_aops;
 extern const struct address_space_operations f2fs_node_aops;
 extern const struct address_space_operations f2fs_meta_aops;
 extern const struct inode_operations f2fs_dir_inode_operations;
@@ -4578,7 +4616,9 @@ int f2fs_read_inline_dir(struct file *file, struct dir_context *ctx,
 int f2fs_inline_data_fiemap(struct inode *inode,
 			struct fiemap_extent_info *fieinfo,
 			__u64 start, __u64 len);
-
+void f2fs_iomap_prepare_read_inline(struct inode *inode, struct folio *ifolio,
+				    struct iomap *iomap, loff_t pos,
+				    loff_t length);
 /*
  * shrinker.c
  */
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 42faaed6a02d..6c5b3e632f2b 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4965,7 +4965,14 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
 		if (ret)
 			return ret;
 	}
-
+#ifdef CONFIG_F2FS_IOMAP_FOLIO_STATE
+	/* Buffered write can convert inline file to large normal file
+	 * when convert success, we uses mapping set large folios here
+	 */
+	if (f2fs_should_use_buffered_iomap(inode))
+		mapping_set_large_folios(inode->i_mapping);
+	set_inode_flag(inode, FI_IOMAP);
+#endif
 	/* Do not preallocate blocks that will be written partially in 4KB. */
 	map.m_lblk = F2FS_BLK_ALIGN(pos);
 	map.m_len = F2FS_BYTES_TO_BLK(pos + count);
@@ -4994,6 +5001,24 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
 	return map.m_len;
 }
 
+static ssize_t f2fs_iomap_buffered_write(struct kiocb *iocb, struct iov_iter *i)
+{
+	struct file *file = iocb->ki_filp;
+	struct inode *inode = file_inode(file);
+	ssize_t ret;
+
+	if (f2fs_is_atomic_file(inode)) {
+		ret = iomap_file_buffered_write(iocb, i,
+						&f2fs_buffered_write_atomic_iomap_ops,
+						&f2fs_iomap_write_ops, NULL);
+	} else {
+		ret = iomap_file_buffered_write(iocb, i,
+						&f2fs_buffered_write_iomap_ops,
+						&f2fs_iomap_write_ops, NULL);
+	}
+	return ret;
+}
+
 static ssize_t f2fs_buffered_write_iter(struct kiocb *iocb,
 					struct iov_iter *from)
 {
@@ -5004,7 +5029,11 @@ static ssize_t f2fs_buffered_write_iter(struct kiocb *iocb,
 	if (iocb->ki_flags & IOCB_NOWAIT)
 		return -EOPNOTSUPP;
 
-	ret = generic_perform_write(iocb, from);
+	if (f2fs_iomap_inode(inode)) {
+		ret = f2fs_iomap_buffered_write(iocb, from);
+	} else {
+		ret = generic_perform_write(iocb, from);
+	}
 
 	if (ret > 0) {
 		f2fs_update_iostat(F2FS_I_SB(inode), inode,
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 58ac831ef704..bda338b4fc22 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -13,7 +13,7 @@
 #include "f2fs.h"
 #include "node.h"
 #include <trace/events/f2fs.h>
-
+#include <linux/iomap.h>
 static bool support_inline_data(struct inode *inode)
 {
 	if (f2fs_used_in_atomic_write(inode))
@@ -832,3 +832,16 @@ int f2fs_inline_data_fiemap(struct inode *inode,
 	f2fs_folio_put(ifolio, true);
 	return err;
 }
+/* fill iomap struct for inline data case for
+ *iomap buffered write
+ */
+void f2fs_iomap_prepare_read_inline(struct inode *inode, struct folio *ifolio,
+				    struct iomap *iomap, loff_t pos,
+				    loff_t length)
+{
+	iomap->addr = IOMAP_NULL_ADDR;
+	iomap->length = length;
+	iomap->type = IOMAP_INLINE;
+	iomap->flags = 0;
+	iomap->inline_data = inline_data_addr(inode, ifolio);
+}
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 8c4eafe9ffac..29378270d561 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -23,6 +23,24 @@
 extern const struct address_space_operations f2fs_compress_aops;
 #endif
 
+bool f2fs_should_use_buffered_iomap(struct inode *inode)
+{
+	if (!S_ISREG(inode->i_mode))
+		return false;
+	if (S_ISDIR(inode->i_mode) || S_ISLNK(inode->i_mode))
+		return false;
+	if (inode->i_mapping == NODE_MAPPING(F2FS_I_SB(inode)))
+		return false;
+	if (inode->i_mapping == META_MAPPING(F2FS_I_SB(inode)))
+		return false;
+	if (f2fs_encrypted_file(inode))
+		return false;
+	if (fsverity_active(inode))
+		return false;
+	if (f2fs_compressed_file(inode))
+		return false;
+	return true;
+}
 void f2fs_mark_inode_dirty_sync(struct inode *inode, bool sync)
 {
 	if (is_inode_flag_set(inode, FI_NEW_INODE))
@@ -611,7 +629,16 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
 	} else if (S_ISREG(inode->i_mode)) {
 		inode->i_op = &f2fs_file_inode_operations;
 		inode->i_fop = &f2fs_file_operations;
+#ifdef CONFIG_F2FS_IOMAP_FOLIO_STATE
+		if (f2fs_should_use_buffered_iomap(inode)) {
+			mapping_set_large_folios(inode->i_mapping);
+			set_inode_flag(inode, FI_IOMAP);
+			inode->i_mapping->a_ops = &f2fs_iomap_aops;
+		} else
+			inode->i_mapping->a_ops = &f2fs_dblock_aops;
+#else
 		inode->i_mapping->a_ops = &f2fs_dblock_aops;
+#endif
 	} else if (S_ISDIR(inode->i_mode)) {
 		inode->i_op = &f2fs_dir_inode_operations;
 		inode->i_fop = &f2fs_dir_operations;
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index b882771e4699..2d995860c488 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -328,6 +328,13 @@ static struct inode *f2fs_new_inode(struct mnt_idmap *idmap,
 	f2fs_init_extent_tree(inode);
 
 	trace_f2fs_new_inode(inode, 0);
+#ifdef CONFIG_F2FS_IOMAP_FOLIO_STATE
+	if (f2fs_should_use_buffered_iomap(inode)) {
+		set_inode_flag(inode, FI_IOMAP);
+		mapping_set_large_folios(inode->i_mapping);
+	}
+#endif
+
 	return inode;
 
 fail:
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 2000880b7dca..35a42d6214fe 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1719,6 +1719,9 @@ static struct inode *f2fs_alloc_inode(struct super_block *sb)
 	init_once((void *) fi);
 
 	/* Initialize f2fs-specific inode info */
+#ifdef CONFIG_F2FS_IOMAP_FOLIO_STATE
+	atomic64_set(&fi->i_iomap_seq, 0);
+#endif
 	atomic_set(&fi->dirty_pages, 0);
 	atomic_set(&fi->i_compr_blocks, 0);
 	atomic_set(&fi->open_count, 0);
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
