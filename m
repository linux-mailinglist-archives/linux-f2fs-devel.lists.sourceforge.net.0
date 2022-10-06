Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D01E65F6A63
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Oct 2022 17:17:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ogScd-00031n-H0;
	Thu, 06 Oct 2022 15:17:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ogScb-00031Z-LR
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Oct 2022 15:17:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zM9PamXmhRxD4THXcCllnuvnojOwt118tl1RibvASgA=; b=Mds01T45WiyciJm6mnWAuHc+y1
 Di48QQaa1e5QhSG5I21BoJ/nEssuUJjnp4Rq/+us8hw9+lBWycNNLiA4i3m75vZ5/P5SH6W98seUq
 842qbQbNUhS2p6I51DfVoXCow0NG9VJWc8FcYmky5xrBpmnLGHkl6ovwXqHCuKpwFRv4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zM9PamXmhRxD4THXcCllnuvnojOwt118tl1RibvASgA=; b=JVbEn7M3IdIZlb3A39O504JuDv
 4ePAGezeUdzc2huHAor31jm6k7ApuCmJ80v4+36kMxZQXZWc3Hw1NKZihCZfS53uUaLy4rPfutmub
 tMMFbpoOB88LpMvxNB3XcOL6u9jagFbyXsuhqocYFEhGa+7pz93YMUCFV9Df7ciImwZM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ogScZ-00Ep7U-SM for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Oct 2022 15:17:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 729E3619C8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  6 Oct 2022 15:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 197D9C4347C;
 Thu,  6 Oct 2022 15:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665069425;
 bh=g3wx+RZOhPXhRIjfDWyZ6lGpd8XdW9G7VNq1Rdx9r6M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kchR08irkxS2ngqqMc0wp2Iz10NooQKxFSUM0KKbAhcE2jOeCnGYbNhNlNZlCJIc/
 26RC5qlK49MDGO9BY/cHcaX+nskN/QMRKjcENioG7Mkf+iDfv1PLK0xxeaDwPykC9i
 vLVtfRkTjagWvHPVaUIaj/NIYZk7BmuGRVnIUCnEGjYxDsvpp4LK+bfZNC/hE3qVZ+
 2IKafzx18whvTTQbxvBx+kbG6/wKW/MF7Qd4/nZuk+UZw/Cdx0HF4hmPoytcgEJdYh
 j9A3+N6IYTXvdslBFiJnqP2geAdq24k3CFcEaNV6okrBuV5100dqy+X3Umg+B6vBVI
 vzi9IH7HLHCqw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu,  6 Oct 2022 23:16:57 +0800
Message-Id: <20221006151657.58336-2-chao@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221006151657.58336-1-chao@kernel.org>
References: <20221006151657.58336-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Change to calculate and export max image size with valid
 blocks
 used of image rather than last used block of image. [FSCK] Max image size:
 xx MB,
 Free space: xx MB Signed-off-by: Chao Yu <chao@kernel.org> --- fsck/f2fs.h
 | 2 ++ fsck/fsck.c | 15 +++++++++++---- include/f2fs_fs.h | 1 -
 lib/libf2fs_io.c
 | 9 --------- 4 files changed, 13 insertions(+), 14 deletions( [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ogScZ-00Ep7U-SM
Subject: [f2fs-dev] [PATCH 2/2] fsck.f2fs: export valid image size
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

Change to calculate and export max image size with valid blocks
used of image rather than last used block of image.

[FSCK] Max image size: xx MB, Free space: xx MB

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/f2fs.h       |  2 ++
 fsck/fsck.c       | 15 +++++++++++----
 include/f2fs_fs.h |  1 -
 lib/libf2fs_io.c  |  9 ---------
 4 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index 2fd241f..703f340 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -421,6 +421,8 @@ static inline block_t __end_block_addr(struct f2fs_sb_info *sbi)
 		sbi->log_blocks_per_seg);
 }
 
+#define BLKS_PER_SEC(sbi)						\
+	((sbi)->segs_per_sec * (sbi)->blocks_per_seg)
 #define GET_ZONENO_FROM_SEGNO(sbi, segno)                               \
 	((segno / sbi->segs_per_sec) / sbi->secs_per_zone)
 
diff --git a/fsck/fsck.c b/fsck/fsck.c
index b1b6722..2f6cc72 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -3179,6 +3179,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
 	struct hard_link_node *node = NULL;
 	bool verify_failed = false;
+	uint64_t max_blks, data_secs, node_secs, free_blks;
 
 	if (c.show_file_map)
 		return 0;
@@ -3229,10 +3230,16 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 		}
 		c.bug_on = 1;
 	}
-	printf("[FSCK] Max image size: %"PRIu64" MB, Free space: %u MB\n",
-		c.max_size >> 20,
-		(sbi->user_block_count - sbi->total_valid_block_count) >>
-		(20 - F2FS_BLKSIZE_BITS));
+
+	data_secs = round_up(sbi->total_valid_node_count, BLKS_PER_SEC(sbi));
+	node_secs = round_up(sbi->total_valid_block_count -
+				sbi->total_valid_node_count, BLKS_PER_SEC(sbi));
+	free_blks = (sbi->total_sections - data_secs - node_secs) *
+							BLKS_PER_SEC(sbi);
+	max_blks = SM_I(sbi)->main_blkaddr + (data_secs + node_secs) *
+							BLKS_PER_SEC(sbi);
+	printf("[FSCK] Max image size: %"PRIu64" MB, Free space: %"PRIu64" MB\n",
+						max_blks >> 8, free_blks >> 8);
 	printf("[FSCK] Unreachable nat entries                       ");
 	if (nr_unref_nid == 0x0) {
 		printf(" [Ok..] [0x%x]\n", nr_unref_nid);
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 509d75a..c36c623 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -480,7 +480,6 @@ struct f2fs_configuration {
 	uint64_t wanted_total_sectors;
 	uint64_t wanted_sector_size;
 	uint64_t target_sectors;
-	uint64_t max_size;
 	uint32_t sectors_per_blk;
 	uint32_t blks_per_seg;
 	__u8 init_version[VERSION_LEN + 1];
diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
index a392255..1a8167d 100644
--- a/lib/libf2fs_io.c
+++ b/lib/libf2fs_io.c
@@ -524,9 +524,6 @@ int dev_read(void *buf, __u64 offset, size_t len)
 	int fd;
 	int err;
 
-	if (c.max_size < (offset + len))
-		c.max_size = offset + len;
-
 	if (c.sparse_mode)
 		return sparse_read_blk(offset / F2FS_BLKSIZE,
 					len / F2FS_BLKSIZE, buf);
@@ -568,9 +565,6 @@ int dev_write(void *buf, __u64 offset, size_t len)
 {
 	int fd;
 
-	if (c.max_size < (offset + len))
-		c.max_size = offset + len;
-
 	if (c.dry_run)
 		return 0;
 
@@ -613,9 +607,6 @@ int dev_fill(void *buf, __u64 offset, size_t len)
 {
 	int fd;
 
-	if (c.max_size < (offset + len))
-		c.max_size = offset + len;
-
 	if (c.sparse_mode)
 		return sparse_write_zeroed_blk(offset / F2FS_BLKSIZE,
 						len / F2FS_BLKSIZE);
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
