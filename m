Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D36DB1A0AA9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Apr 2020 12:01:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jLl30-0005wy-BB; Tue, 07 Apr 2020 10:01:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jLl2x-0005wG-Ae
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Apr 2020 10:01:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aBlh8EBeGD3PIOp9nfApr6VPmR07teKgh5bQFztOMcc=; b=VhU7qKUJtnqtwqqrUAzsQ6uIfO
 2bilr/XgxPH7nfjwhqO8KTxZCw58Z7on7h4TMJcfanC2rCKGmc0fWTMAMmiZHBcprnyVp9sYJb4WR
 gCV7v6y9PFwP1emVrW5EYMmMvUbynAXvMwtBqZT2k+BhEn80RNFdtmipo16lIYLVrKvM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aBlh8EBeGD3PIOp9nfApr6VPmR07teKgh5bQFztOMcc=; b=H2qRZLYtbdRMvF8VODywl1Nc2Z
 Z7MTQiFpEe6AoaReVwMKkQdrF4gGhEDnVpzL7e0mX9QxCX4n5zp5iqBd+kPE8OeO4BOFGNpBDjrGl
 3RMeVHQnAQeV7PSBQAhVysnaS72+3eEjRpHTrHUP/39Rhr/OqCwq7nv5lXjX0dXoGazE=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jLl2v-005Sg5-HA
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Apr 2020 10:01:31 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 84ECE9FB5B520F172ECB;
 Tue,  7 Apr 2020 18:01:20 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Tue, 7 Apr 2020 18:01:12 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Tue, 7 Apr 2020 18:01:07 +0800
Message-ID: <20200407100107.4356-2-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
In-Reply-To: <20200407100107.4356-1-yuchao0@huawei.com>
References: <20200407100107.4356-1-yuchao0@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jLl2v-005Sg5-HA
Subject: [f2fs-dev] [PATCH 2/2] fsck.f2fs: fix to check validation of
 i_xattr_nid
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
Cc: kilobyte@angband.pl, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Otherwise, fsck.f2fs will access invalid memory address as below:

- fsck_verify
 - dump_node
  - dump_file
   - dump_inode_blk
    - dump_xattr
     - read_all_xattrs
       - get_node_info
        access &(F2FS_FSCK(sbi)->entries[nid])

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/dump.c  |  2 ++
 fsck/fsck.c  |  8 ++++++++
 fsck/fsck.h  |  3 +++
 fsck/mount.c |  8 +++++---
 fsck/xattr.c | 20 ++++++++++++++++++--
 5 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/fsck/dump.c b/fsck/dump.c
index 144c10e..001b7cb 100644
--- a/fsck/dump.c
+++ b/fsck/dump.c
@@ -309,6 +309,8 @@ static void dump_xattr(struct f2fs_sb_info *sbi, struct f2fs_node *node_blk)
 	int ret;
 
 	xattr = read_all_xattrs(sbi, node_blk);
+	if (!xattr)
+		return;
 
 	list_for_each_xattr(ent, xattr) {
 		char *name = strndup(ent->e_name, ent->e_name_len);
diff --git a/fsck/fsck.c b/fsck/fsck.c
index a08a8cb..0389146 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -487,6 +487,14 @@ static int sanity_check_nid(struct f2fs_sb_info *sbi, u32 nid,
 	return 0;
 }
 
+int fsck_sanity_check_nid(struct f2fs_sb_info *sbi, u32 nid,
+			struct f2fs_node *node_blk,
+			enum FILE_TYPE ftype, enum NODE_TYPE ntype,
+			struct node_info *ni)
+{
+	return sanity_check_nid(sbi, nid, node_blk, ftype, ntype, ni);
+}
+
 static int fsck_chk_xattr_blk(struct f2fs_sb_info *sbi, u32 ino,
 					u32 x_nid, u32 *blk_cnt)
 {
diff --git a/fsck/fsck.h b/fsck/fsck.h
index c4432e8..2de6f62 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -144,6 +144,9 @@ static inline bool need_fsync_data_record(struct f2fs_sb_info *sbi)
 extern int fsck_chk_orphan_node(struct f2fs_sb_info *);
 extern int fsck_chk_quota_node(struct f2fs_sb_info *);
 extern int fsck_chk_quota_files(struct f2fs_sb_info *);
+extern int fsck_sanity_check_nid(struct f2fs_sb_info *, u32,
+			struct f2fs_node *, enum FILE_TYPE, enum NODE_TYPE,
+			struct node_info *);
 extern int fsck_chk_node_blk(struct f2fs_sb_info *, struct f2fs_inode *, u32,
 		enum FILE_TYPE, enum NODE_TYPE, u32 *,
 		struct child_info *);
diff --git a/fsck/mount.c b/fsck/mount.c
index 4d16659..0aab071 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -257,10 +257,12 @@ void print_inode_info(struct f2fs_sb_info *sbi,
 	DISP_u32(inode, i_nid[4]);	/* double indirect */
 
 	xattr_addr = read_all_xattrs(sbi, node);
-	list_for_each_xattr(ent, xattr_addr) {
-		print_xattr_entry(ent);
+	if (xattr_addr) {
+		list_for_each_xattr(ent, xattr_addr) {
+			print_xattr_entry(ent);
+		}
+		free(xattr_addr);
 	}
-	free(xattr_addr);
 
 	printf("\n");
 }
diff --git a/fsck/xattr.c b/fsck/xattr.c
index d5350e3..e9dcb52 100644
--- a/fsck/xattr.c
+++ b/fsck/xattr.c
@@ -22,6 +22,22 @@ void *read_all_xattrs(struct f2fs_sb_info *sbi, struct f2fs_node *inode)
 	struct f2fs_xattr_header *header;
 	void *txattr_addr;
 	u64 inline_size = inline_xattr_size(&inode->i);
+	nid_t xnid = le32_to_cpu(inode->i.i_xattr_nid);
+
+	if (xnid) {
+		struct f2fs_node *node_blk = NULL;
+		struct node_info ni;
+		int ret;
+
+		node_blk = (struct f2fs_node *)calloc(BLOCK_SZ, 1);
+		ASSERT(node_blk != NULL);
+
+		ret = fsck_sanity_check_nid(sbi, xnid, node_blk,
+					F2FS_FT_XATTR, TYPE_XATTR, &ni);
+		free(node_blk);
+		if (ret)
+			return NULL;
+	}
 
 	txattr_addr = calloc(inline_size + BLOCK_SZ, 1);
 	ASSERT(txattr_addr);
@@ -30,11 +46,11 @@ void *read_all_xattrs(struct f2fs_sb_info *sbi, struct f2fs_node *inode)
 		memcpy(txattr_addr, inline_xattr_addr(&inode->i), inline_size);
 
 	/* Read from xattr node block. */
-	if (inode->i.i_xattr_nid) {
+	if (xnid) {
 		struct node_info ni;
 		int ret;
 
-		get_node_info(sbi, le32_to_cpu(inode->i.i_xattr_nid), &ni);
+		get_node_info(sbi, xnid, &ni);
 		ret = dev_read_block(txattr_addr + inline_size, ni.blk_addr);
 		ASSERT(ret >= 0);
 	}
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
