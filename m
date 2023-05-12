Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F24A47004A5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 May 2023 12:04:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pxPdX-0001cv-FP;
	Fri, 12 May 2023 10:04:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pxPdV-0001cW-56
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 May 2023 10:04:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WdRpcVU/uDzaHy+1nROgUt2/ZVf5zUCuFUOpgv1Liiw=; b=PxsYesPXv4S0qGmaa1eWAxudn/
 LaAUadJAqQMj6CBVNZyw4239UFwndfju1w4Tbcc1KQ/REECoTAk1uT+nlrq5qNuRrzbNGEja2r9CA
 Ab/tfBRUyvL9zCg7tlNLDLrtW6XQ7eVKHcraySNuhnfEmO4NH5dkDa4Yy9qYs92Tj4s8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WdRpcVU/uDzaHy+1nROgUt2/ZVf5zUCuFUOpgv1Liiw=; b=koEobWBqoZ3eBIhChm7y/5fvXC
 t5vZSM2aSemCUcISrogO+EcYtSUH/1pxqOofJ75h5MM8xi5IMKu0VxwuZqSQvEzNO+7UiU+UEYWkG
 LOXaQlOqslGoqoBpl0k49so8jfbaJc0XEgPGJCue2xqELmUfR1l/IbLI1p6I65nq6gA8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pxPdV-004Lee-2M for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 May 2023 10:04:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AB0E4654C0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 12 May 2023 10:04:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B7FC4339B;
 Fri, 12 May 2023 10:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683885863;
 bh=jV6GcFxI8VpmtBhdUqsK6u0LDXfmx2m/ww1aJrYz1IQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fenXtwVs0OOJ8kY/Lx7FJwKqc9E7qXQRd0aZP04MPC7tub3PgtJK89OQeZLyQVra8
 05wXkqDioJaPgemjYTZACTEjRiPx9UuaR5pW5zUPY5jR0mxNqv8smEXYw+gqbiaq4u
 PUdFvG05XfdKyan1WkMSloDCbFNtmpC6TVPqhrhgE1hbLgViF/Ey5vAyxPZGdHIBVS
 Vxy+ziFHYUdUZct4NC/DapUU3FiOVYe6AkrgdeZ0md0QPutUm2bYVyjGtCwxUWIYxX
 qj1sK4Ls4XzQwZfnB5cvrIS4jPzUXWD2XRnxKWmwsBGpSuduRaQl96sqfjQjKFGS38
 AgErPIZ61TmoQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri, 12 May 2023 18:03:54 +0800
Message-Id: <20230512100354.4072489-4-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230512100354.4072489-1-chao@kernel.org>
References: <20230512100354.4072489-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: As Stephanos reported in mailing list: Info: checkpoint state
 = 1 : unmount [ASSERT] (sanity_check_nid: 362) --> nid[0x3] ino is 0 The
 root cause is root inode's nat entry is corrupted, this patch add logic to
 search root inode from all node blocks, try to relink root inode's nat to
 target node block. 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pxPdV-004Lee-2M
Subject: [f2fs-dev] [PATCH 4/4] fsck.f2fs: lookup and relink root inode
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

As Stephanos reported in mailing list:

Info: checkpoint state = 1 :  unmount
[ASSERT] (sanity_check_nid: 362)  --> nid[0x3] ino is 0

The root cause is root inode's nat entry is corrupted, this patch
add logic to search root inode from all node blocks, try to relink
root inode's nat to target node block.

Before:

Info: checkpoint state = 185 :  trimmed nat_bits compacted_summary unmount
[lookup_nat_in_journal:3085] ==> Found nid [0x3] in nat cache
[ASSERT] (sanity_check_nat: 404)  --> nid->blk_addr is 0x0. [0x3]
Info: root inode is corrupted, search and relink it
Info: possible root inode blkaddr: 0x5a00
[lookup_nat_in_journal:3085] ==> Found nid [0x3] in nat cache
[ASSERT] (sanity_check_nat: 404)  --> nid->blk_addr is 0x0. [0x3]

[FSCK] Max image size: 94 MB, Free space: 12194 MB
[FSCK] Unreachable nat entries                        [Ok..] [0x0]
[FSCK] SIT valid block bitmap checking                [Fail]
[FSCK] Hard link checking for regular file            [Ok..] [0x0]
[FSCK] valid_block_count matching with CP             [Fail] [0x2, 0x0]
[FSCK] valid_node_count matching with CP (de lookup)  [Fail] [0x1, 0x0]
[FSCK] valid_node_count matching with CP (nat lookup) [Fail] [0x1, 0x0]
[FSCK] valid_inode_count matched with CP              [Fail] [0x1, 0x0]
[FSCK] free segment_count matched with CP             [Ok..] [0x17cd]
[FSCK] next block offset is free                      [Ok..]
[FSCK] fixing SIT types
[FSCK] other corrupted bugs                           [Fail]
Do you want to fix this partition? [Y/N] Y

After:

Info: checkpoint state = 185 :  trimmed nat_bits compacted_summary unmount
[lookup_nat_in_journal:3085] ==> Found nid [0x3] in nat cache
[ASSERT] (sanity_check_nat: 404)  --> nid->blk_addr is 0x0. [0x3]
Info: root inode is corrupted, search and relink it
Info: possible root inode blkaddr: 0x5a00
[FIX] (fsck_chk_root_inode: 730)  --> Relink root inode, blkaddr: 0x5a00
update nat(nid:3) blkaddr [0x5a00] in journal
[fsck_chk_dentry_blk:1978] [  1] Dentry Block [0x6000] Done : dentries:0 in 214 slots (len:255)

[fsck_chk_inode_blk:1244] Directory Inode: 0x3 [] depth: 1 has 0 files

[FSCK] Max image size: 94 MB, Free space: 12194 MB
[FSCK] Unreachable nat entries                        [Ok..] [0x0]
[FSCK] SIT valid block bitmap checking                [Ok..]
[FSCK] Hard link checking for regular file            [Ok..] [0x0]
[FSCK] valid_block_count matching with CP             [Ok..] [0x2]
[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [0x1]
[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [0x1]
[FSCK] valid_inode_count matched with CP              [Ok..] [0x1]
[FSCK] free segment_count matched with CP             [Ok..] [0x17cd]
[FSCK] next block offset is free                      [Ok..]
[FSCK] fixing SIT types
[FSCK] other corrupted bugs                           [Fail]
Info: flush_journal_entries() n_nats: 1, n_sits: 6
Info: Duplicate valid checkpoint to mirror position 512 -> 1024
[write_nat_bits:1737] 	Writing NAT bits pages, at offset 0x000003ff
Info: Write valid nat_bits in checkpoint
Info: write_checkpoint() cur_cp:1
[write_nat_bits:1737] 	Writing NAT bits pages, at offset 0x000003ff
Info: Write valid nat_bits in checkpoint
Info: fix_checkpoint() cur_cp:1

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/fsck.c  | 148 ++++++++++++++++++++++++++++++++++++++++++++++++---
 fsck/fsck.h  |   4 ++
 fsck/main.c  |   4 ++
 fsck/mount.c |  18 +++++++
 4 files changed, 167 insertions(+), 7 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 3650873..d03f1da 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -386,14 +386,9 @@ err:
 	return -1;
 }
 
-static int sanity_check_nid(struct f2fs_sb_info *sbi, u32 nid,
-			struct f2fs_node *node_blk,
-			enum FILE_TYPE ftype, enum NODE_TYPE ntype,
-			struct node_info *ni)
+static int sanity_check_nat(struct f2fs_sb_info *sbi, u32 nid,
+						struct node_info *ni)
 {
-	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
-	int ret;
-
 	if (!IS_VALID_NID(sbi, nid)) {
 		ASSERT_MSG("nid is not valid. [0x%x]", nid);
 		return -EINVAL;
@@ -415,6 +410,28 @@ static int sanity_check_nid(struct f2fs_sb_info *sbi, u32 nid,
 		return -EINVAL;
 	}
 
+	return 0;
+}
+
+int fsck_sanity_check_nat(struct f2fs_sb_info *sbi, u32 nid)
+{
+	struct node_info ni;
+
+	return sanity_check_nat(sbi, nid, &ni);
+}
+
+static int sanity_check_nid(struct f2fs_sb_info *sbi, u32 nid,
+			struct f2fs_node *node_blk,
+			enum FILE_TYPE ftype, enum NODE_TYPE ntype,
+			struct node_info *ni)
+{
+	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
+	int ret;
+
+	ret = sanity_check_nat(sbi, nid, ni);
+	if (ret)
+		return ret;
+
 	ret = dev_read_block(node_blk, ni->blk_addr);
 	ASSERT(ret >= 0);
 
@@ -609,6 +626,123 @@ err:
 	return -EINVAL;
 }
 
+static bool is_sit_bitmap_set(struct f2fs_sb_info *sbi, u32 blk_addr)
+{
+	struct seg_entry *se;
+	u32 offset;
+
+	se = get_seg_entry(sbi, GET_SEGNO(sbi, blk_addr));
+	offset = OFFSET_IN_SEG(sbi, blk_addr);
+
+	return f2fs_test_bit(offset,
+			(const char *)se->cur_valid_map) != 0;
+}
+
+int fsck_chk_root_inode(struct f2fs_sb_info *sbi)
+{
+	struct f2fs_node *node_blk;
+	int segment_count = SM_I(sbi)->main_segments;
+	int segno;
+	bool valid_bitmap = true;
+	block_t last_blkaddr = NULL_ADDR;
+	nid_t root_ino = sbi->root_ino_num;
+	u64 last_ctime = 0;
+	u32 last_ctime_nsec = 0;
+	int ret = -EINVAL;
+
+	node_blk = calloc(BLOCK_SZ, 1);
+	ASSERT(node_blk);
+
+	MSG(0, "Info: root inode is corrupted, search and relink it\n");
+
+retry:
+	for (segno = 0; segno < segment_count; segno++) {
+		struct seg_entry *se = get_seg_entry(sbi, segno);
+		block_t blkaddr = START_BLOCK(sbi, segno);
+		int ret;
+		int i;
+
+		if (IS_DATASEG(se->type))
+			continue;
+
+		dev_readahead(blkaddr << F2FS_BLKSIZE_BITS,
+				sbi->blocks_per_seg << F2FS_BLKSIZE_BITS);
+
+		for (i = 0; i < sbi->blocks_per_seg; i++, blkaddr++) {
+			if (valid_bitmap ^ is_sit_bitmap_set(sbi, blkaddr))
+				continue;
+
+			ret = dev_read_block(node_blk, blkaddr);
+			ASSERT(ret >= 0);
+
+			if (le32_to_cpu(node_blk->footer.ino) !=
+					root_ino ||
+				le32_to_cpu(node_blk->footer.nid) !=
+					root_ino)
+				continue;
+
+			if (!IS_INODE(node_blk))
+				continue;
+
+			if (le32_to_cpu(node_blk->i.i_generation) ||
+					le32_to_cpu(node_blk->i.i_namelen))
+				continue;
+			break;
+		}
+
+		if (i == sbi->blocks_per_seg)
+			continue;
+
+		if (valid_bitmap) {
+			last_blkaddr = blkaddr;
+			MSG(0, "Info: possible root inode blkaddr: 0x%x\n",
+								last_blkaddr);
+			goto fix;
+		}
+
+		if (last_blkaddr == NULL_ADDR)
+			goto init;
+		if (le64_to_cpu(node_blk->i.i_ctime) < last_ctime)
+			continue;
+		if (le64_to_cpu(node_blk->i.i_ctime) == last_ctime &&
+			le32_to_cpu(node_blk->i.i_ctime_nsec) <=
+			last_ctime_nsec)
+			continue;
+init:
+		last_blkaddr = blkaddr;
+		last_ctime = le64_to_cpu(node_blk->i.i_ctime);
+		last_ctime_nsec = le32_to_cpu(node_blk->i.i_ctime_nsec);
+
+		MSG(0, "Info: possible root inode blkaddr: %u\n",
+							last_blkaddr);
+	}
+
+	if (valid_bitmap) {
+		valid_bitmap = false;
+		goto retry;
+	}
+fix:
+	if (!last_blkaddr) {
+		MSG(0, "Info: there is no valid root inode\n");
+	} else if (c.fix_on) {
+		struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
+
+		FIX_MSG("Relink root inode, blkaddr: 0x%x", last_blkaddr);
+		update_nat_journal_blkaddr(sbi, root_ino, last_blkaddr);
+		update_nat_blkaddr(sbi, root_ino, root_ino, last_blkaddr);
+
+		if (f2fs_test_bit(root_ino, fsck->nat_area_bitmap))
+			f2fs_clear_bit(root_ino, fsck->nat_area_bitmap);
+		fsck->chk.valid_nat_entry_cnt++;
+
+		if (!f2fs_test_sit_bitmap(sbi, last_blkaddr))
+			f2fs_set_sit_bitmap(sbi, last_blkaddr);
+		ret = 0;
+	}
+	free(node_blk);
+	return ret;
+}
+
 static inline void get_extent_info(struct extent_info *ext,
 					struct f2fs_extent *i_ext)
 {
diff --git a/fsck/fsck.h b/fsck/fsck.h
index 89b1c6e..0f7caf4 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -167,9 +167,11 @@ extern int fsck_chk_quota_node(struct f2fs_sb_info *);
 extern int fsck_chk_quota_files(struct f2fs_sb_info *);
 extern int fsck_sanity_check_nid(struct f2fs_sb_info *, u32,
 					enum FILE_TYPE, enum NODE_TYPE);
+extern int fsck_sanity_check_nat(struct f2fs_sb_info *sbi, u32 nid);
 extern int fsck_chk_node_blk(struct f2fs_sb_info *, struct f2fs_inode *, u32,
 		enum FILE_TYPE, enum NODE_TYPE, u32 *,
 		struct f2fs_compr_blk_cnt *, struct child_info *);
+extern int fsck_chk_root_inode(struct f2fs_sb_info *);
 extern void fsck_chk_inode_blk(struct f2fs_sb_info *, u32, enum FILE_TYPE,
 		struct f2fs_node *, u32 *, struct f2fs_compr_blk_cnt *,
 		struct node_info *, struct child_info *);
@@ -208,6 +210,8 @@ extern void update_sum_entry(struct f2fs_sb_info *, block_t,
 				struct f2fs_summary *);
 extern void get_node_info(struct f2fs_sb_info *, nid_t, struct node_info *);
 extern void nullify_nat_entry(struct f2fs_sb_info *, u32);
+extern void update_nat_journal_blkaddr(struct f2fs_sb_info *sbi, u32 nid,
+					block_t blkaddr);
 extern void rewrite_sit_area_bitmap(struct f2fs_sb_info *);
 extern void build_nat_area_bitmap(struct f2fs_sb_info *);
 extern void build_sit_area_bitmap(struct f2fs_sb_info *);
diff --git a/fsck/main.c b/fsck/main.c
index b01b52c..e8c3dc4 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -885,6 +885,10 @@ static int do_fsck(struct f2fs_sb_info *sbi)
 		}
 	}
 	fsck_chk_orphan_node(sbi);
+
+	if (fsck_sanity_check_nat(sbi, sbi->root_ino_num))
+		fsck_chk_root_inode(sbi);
+
 	fsck_chk_node_blk(sbi, NULL, sbi->root_ino_num,
 			F2FS_FT_DIR, TYPE_INODE, &blk_cnt, &cbc, NULL);
 	fsck_chk_quota_files(sbi);
diff --git a/fsck/mount.c b/fsck/mount.c
index f19f081..4c74888 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -3132,6 +3132,24 @@ void nullify_nat_entry(struct f2fs_sb_info *sbi, u32 nid)
 	free(nat_block);
 }
 
+void update_nat_journal_blkaddr(struct f2fs_sb_info *sbi, u32 nid,
+					block_t blkaddr)
+{
+	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_HOT_DATA);
+	struct f2fs_journal *journal = &curseg->sum_blk->journal;
+	int i;
+
+	for (i = 0; i < nats_in_cursum(journal); i++) {
+		if (le32_to_cpu(nid_in_journal(journal, i)) == nid) {
+			nat_in_journal(journal, i).block_addr =
+						cpu_to_le32(blkaddr);
+			MSG(0, "update nat(nid:%d) blkaddr [0x%x] in journal\n",
+							nid, blkaddr);
+			return;
+		}
+	}
+}
+
 void duplicate_checkpoint(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
