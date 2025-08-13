Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D346EB24594
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Aug 2025 11:38:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1g/BtojX2gXGqRTSVA+8/R1eg/JwNrZ+SpmJMAbpb8I=; b=RoTWOcKBiItIiKiJdmZP3TIqVi
	84ud0/dh9v7+UxGX6te4v0/hA5Yg4o/sVsFaFZkU/gk+jEbBgCy68e89ehri0yu2iTnOVmV9hy0vz
	HRSURs8m8Mykpmk42sBAVp0rF1n1rot0yM/ZPTPelfNkawMMQ91XZ1Fz4klEY7IPUqJE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1um7wc-0000YQ-Jr;
	Wed, 13 Aug 2025 09:38:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1um7wb-0000YG-Lw
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Aug 2025 09:38:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=16xZxNhapx1zmrqQvDVTERS6UOfNY3zsXg4rsnEQ910=; b=QQIu4QLmYSWmQLyr4GjnytepG6
 wAMVPuxPuSgCI9WslQkNn5dHiViMyIDETQQ4go65pG6BFAKn7kIkRhKWHUVXLQt/Ksz6VdX63auWo
 yvYIIiI2FhDFTSygYN6GoR7pYM5nKDW/ocq+/Hl8yf7MdD6IFFL5kSim6OlS00uzebmE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=16xZxNhapx1zmrqQvDVTERS6UOfNY3zsXg4rsnEQ910=; b=dclnxH2DQpx7Kh2ArnJumc5D/q
 VGB/jR8UMhetjVnSJ9q36BqxWownxdRSqGN5uazSuOynIlSmqd0o/8VVxwfazjkh9CdrCZ6I03UU5
 Axcf1HmUkO4nIfFehmOmZy/Pcw5LTLk+8xbEBb8Hl8mgOKLKxaJv/MhveamMMMBfy0iM=;
Received: from m16.mail.126.com ([220.197.31.7])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1um7wa-0004V2-NC for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Aug 2025 09:38:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=16
 xZxNhapx1zmrqQvDVTERS6UOfNY3zsXg4rsnEQ910=; b=ClvGGN57mNF4WAPJEs
 UfRl8twLY5O2SD/h2CodjCFFx6pDel9FfgeQsOFfEjkbMA5vYXoB/dXq3RmkEWDA
 iiE4zoc+Zt3SA8LzJw3qpDJIufdxlCUUKesWDqS0ym1iHnJJJrmieP2gy8K9l6W/
 i36Oj5ZqA42Uy5DOIVn1khFp4=
Received: from YLLaptop.. (unknown [])
 by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id
 _____wD3tyv8XJxo_MzyBQ--.54250S10; 
 Wed, 13 Aug 2025 17:38:30 +0800 (CST)
From: Nanzhe Zhao <nzzhao@126.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org
Date: Wed, 13 Aug 2025 17:37:54 +0800
Message-Id: <20250813093755.47599-9-nzzhao@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250813093755.47599-1-nzzhao@126.com>
References: <20250813093755.47599-1-nzzhao@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3tyv8XJxo_MzyBQ--.54250S10
X-Coremail-Antispam: 1Uf129KBjvJXoWxKFyDXFy3ZF43WF4DKw1rZwb_yoW7Gw4DpF
 yDAF1rGrs0grWxWF4fta1Uur1S9r1Ik3W7Ca93X3s8G3yqqr1SqFnYya43u3Z8tr4fJr1q
 qFs8K348KayxGFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziUDGOUUUUU=
X-Originating-IP: [58.240.165.118]
X-CM-SenderInfo: xq22xtbr6rjloofrz/1tbiExSoz2icVjtiagAAsx
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Introduce the `F2FS_GET_BLOCK_IOMAP` flag for `f2fs_ma
 p_blocks`.
 With this flag, holes encountered during buffered I/O iterative mapping can
 now be merged under `map_is_mergeable`. Furthermor e, when this flag is passed,
 `f2fs_map_blocks` will by default store the [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [220.197.31.7 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1um7wa-0004V2-NC
Subject: [f2fs-dev] [RFC PATCH 8/9] f2fs: Introduce F2FS_GET_BLOCK_IOMAP and
 map_blocks he lpers
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

    Introduce the `F2FS_GET_BLOCK_IOMAP` flag for `f2fs_ma
p_blocks`.

    With this flag, holes encountered during buffered I/O
iterative mapping
    can now be merged under `map_is_mergeable`. Furthermor
e, when this flag
    is passed, `f2fs_map_blocks` will by default store the
 mapped block
    information (from the `f2fs_map_blocks` structure) int
o the extent cache,
    provided the resulting extent size is greater than the
 minimum allowed
    length for the f2fs extent cache.
    Notably, both holes and `NEW_ADDR`
    extents will also be cached under the influence of thi
s flag.
    This improves buffered write performance for sparse fi
les.

    Additionally, two helper functions are introduced:
    - `f2fs_map_blocks_iomap`: A simple wrapper for `f2fs_
map_blocks` that
      enables the `F2FS_GET_BLOCK_IOMAP` flag.
    - `f2fs_map_blocks_prealloc`: A simple wrapper for usi
ng
      `f2fs_map_blocks` to preallocate blocks.

Signed-off-by: Nanzhe Zhao <nzzhao@126.com>
---
 fs/f2fs/data.c | 49 +++++++++++++++++++++++++++++++++++++++++++------
 fs/f2fs/f2fs.h |  5 +++++
 2 files changed, 48 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 5ecd08a3dd0b..37eaf431ab42 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1537,8 +1537,11 @@ static bool map_is_mergeable(struct f2fs_sb_info *sbi,
 		return true;
 	if (flag == F2FS_GET_BLOCK_PRE_DIO)
 		return true;
-	if (flag == F2FS_GET_BLOCK_DIO &&
-		map->m_pblk == NULL_ADDR && blkaddr == NULL_ADDR)
+	if (flag == F2FS_GET_BLOCK_DIO && map->m_pblk == NULL_ADDR &&
+	    blkaddr == NULL_ADDR)
+		return true;
+	if (flag == F2FS_GET_BLOCK_IOMAP && map->m_pblk == NULL_ADDR &&
+	    blkaddr == NULL_ADDR)
 		return true;
 	return false;
 }
@@ -1676,6 +1679,10 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 			if (map->m_next_pgofs)
 				*map->m_next_pgofs = pgofs + 1;
 			break;
+		case F2FS_GET_BLOCK_IOMAP:
+			if (map->m_next_pgofs)
+				*map->m_next_pgofs = pgofs + 1;
+			break;
 		default:
 			/* for defragment case */
 			if (map->m_next_pgofs)
@@ -1741,8 +1748,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 	else if (dn.ofs_in_node < end_offset)
 		goto next_block;
 
-	if (flag == F2FS_GET_BLOCK_PRECACHE) {
-		if (map->m_flags & F2FS_MAP_MAPPED) {
+	if (flag == F2FS_GET_BLOCK_PRECACHE || flag == F2FS_GET_BLOCK_IOMAP) {
+		if (map->m_flags & F2FS_MAP_MAPPED &&
+		    map->m_len > F2FS_MIN_EXTENT_LEN) {
 			unsigned int ofs = start_pgofs - map->m_lblk;
 
 			f2fs_update_read_extent_cache_range(&dn,
@@ -1786,8 +1794,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 		}
 	}
 
-	if (flag == F2FS_GET_BLOCK_PRECACHE) {
-		if (map->m_flags & F2FS_MAP_MAPPED) {
+	if (flag == F2FS_GET_BLOCK_PRECACHE || flag == F2FS_GET_BLOCK_IOMAP) {
+		if (map->m_flags & F2FS_MAP_MAPPED &&
+		    map->m_len > F2FS_MIN_EXTENT_LEN) {
 			unsigned int ofs = start_pgofs - map->m_lblk;
 
 			f2fs_update_read_extent_cache_range(&dn,
@@ -1808,6 +1817,34 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 	return err;
 }
 
+int f2fs_map_blocks_iomap(struct inode *inode, block_t start, block_t len,
+			  struct f2fs_map_blocks *map)
+{
+	int err = 0;
+
+	map->m_lblk = start; // Logical block number for the start pos
+	map->m_len = len; // Length in blocks
+	map->m_may_create = false;
+	map->m_seg_type =
+		f2fs_rw_hint_to_seg_type(F2FS_I_SB(inode), inode->i_write_hint);
+	err = f2fs_map_blocks(inode, map, F2FS_GET_BLOCK_IOMAP);
+	return err;
+}
+
+int f2fs_map_blocks_preallocate(struct inode *inode, block_t start, block_t len,
+				struct f2fs_map_blocks *map)
+{
+	int err = 0;
+
+	map->m_lblk = start;
+	map->m_len = len; // Length in blocks
+	map->m_may_create = true;
+	map->m_seg_type =
+		f2fs_rw_hint_to_seg_type(F2FS_I_SB(inode), inode->i_write_hint);
+	err = f2fs_map_blocks(inode, map, F2FS_GET_BLOCK_PRE_AIO);
+	return err;
+}
+
 bool f2fs_overwrite_io(struct inode *inode, loff_t pos, size_t len)
 {
 	struct f2fs_map_blocks map;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c6b23fa63588..ac9a6ac13e1f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -788,6 +788,7 @@ enum {
 	F2FS_GET_BLOCK_PRE_DIO,
 	F2FS_GET_BLOCK_PRE_AIO,
 	F2FS_GET_BLOCK_PRECACHE,
+	F2FS_GET_BLOCK_IOMAP,
 };
 
 /*
@@ -4232,6 +4233,10 @@ struct folio *f2fs_get_new_data_folio(struct inode *inode,
 			struct folio *ifolio, pgoff_t index, bool new_i_size);
 int f2fs_do_write_data_page(struct f2fs_io_info *fio);
 int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag);
+int f2fs_map_blocks_iomap(struct inode *inode, block_t start, block_t len,
+			  struct f2fs_map_blocks *map);
+int f2fs_map_blocks_preallocate(struct inode *inode, block_t start, block_t len,
+				struct f2fs_map_blocks *map);
 int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 			u64 start, u64 len);
 int f2fs_encrypt_one_page(struct f2fs_io_info *fio);
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
