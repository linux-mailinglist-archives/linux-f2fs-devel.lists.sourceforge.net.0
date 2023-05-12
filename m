Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 734847004A2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 May 2023 12:04:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pxPdV-0001Xb-TR;
	Fri, 12 May 2023 10:04:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pxPdV-0001XV-2A
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 May 2023 10:04:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zJvmdKDWcZPor4XEktqB1zvln09wBdpKlZzkIZkZ0Z0=; b=LJ7ktSv+88SZFlk/XuY8VnI2wF
 At7BwnW+FRHsNybPupoD10H5IM83Btr2x+Fvk3MHf5CTOL45Jkm4eUn3+WTS41g524AM0uVYnQXlQ
 LEE4jMv7FxC7hqi1KIgL6nQ520cUZWvtPX3w+GxMMW0MIfLnaLcSuQIYtiOg5QpsB8Ts=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zJvmdKDWcZPor4XEktqB1zvln09wBdpKlZzkIZkZ0Z0=; b=l2ofkR9gSEDJh9WgNR3jj+WSFX
 9IzZeWlsan2rodKnquDbSPQ9+kGFwyh6fqExQWr8tD9ISS0XuLFV5vaIPdMYSWZOFf3NeUlOJ2Xjm
 L+SVnM0AxqYojsHayQydMtiLJms2tDHib5SHpcYk3OHVTyYPz0jMOZ7HQQ0eErfJ5ntc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pxPdU-0003Ov-Aq for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 May 2023 10:04:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 276D8654BB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 12 May 2023 10:04:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90B0CC433EF;
 Fri, 12 May 2023 10:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683885861;
 bh=fRRt8IpBbE+fHPgkz53zREV8+DuYhsCsjIX+gtD+gw8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HYw4b0tzqDdoMtDlAJtJVjudJf5G60nojl9ismBXZRkWp8+X8kLgjVg6LSChBERuj
 BFje8ZTnjHZfn2DaVTBKgdOEQZK5lrLBEBojq0KgSWn/JrBaqWk9/kYwsEXluQE747
 wrBYrW3OLun8rc7Rjw7+anST10xJeVAE+H4/8cG6QGSEknDeVTdXSX6VOhIFJS0c6I
 kBRruhkYKOrjjwlM6b0cB6eaQOgkQZFKJ0REKTJG+pb1wVoM1jomTmd5lDADa4S4ve
 +A1qpAT6fMqb7exyDf4s+W/3ot8isJWVjhqdz/EzjMNTj0qnBtKEOY+7PG1Hq12b1z
 LcqY+qLf064fA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri, 12 May 2023 18:03:53 +0800
Message-Id: <20230512100354.4072489-3-chao@kernel.org>
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
 Content preview: In order to track details of stat info and repair flow.
 [FSCK]
 valid_block_count matching with CP [Fail] [0x2, 0x0] [FSCK] valid_node_count
 matching with CP (de lookup) [Fail] [0x1, 0x0] [FSCK] valid_node_count matching
 with CP (nat lookup) [Fail] [0x1, 0x [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pxPdU-0003Ov-Aq
Subject: [f2fs-dev] [PATCH 3/4] fsck.f2fs: add more debug info in
 fsck_verify()
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

In order to track details of stat info and repair flow.

[FSCK] valid_block_count matching with CP             [Fail] [0x2, 0x0]
[FSCK] valid_node_count matching with CP (de lookup)  [Fail] [0x1, 0x0]
[FSCK] valid_node_count matching with CP (nat lookup) [Fail] [0x1, 0x0]
[FSCK] valid_inode_count matched with CP              [Fail] [0x1, 0x0]

Info: flush_journal_entries() n_nats: 1, n_sits: 6
Info: write_checkpoint() cur_cp:1
Info: fix_checkpoint() cur_cp:1

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/fsck.c  | 18 +++++++++++++-----
 fsck/mount.c |  7 ++++++-
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 9180deb..3650873 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -2407,6 +2407,8 @@ static void fix_checkpoint(struct f2fs_sb_info *sbi)
 
 	ret = f2fs_fsync_device();
 	ASSERT(ret >= 0);
+
+	MSG(0, "Info: fix_checkpoint() cur_cp:%d\n", sbi->cur_cp);
 }
 
 static void fix_checkpoints(struct f2fs_sb_info *sbi)
@@ -3284,7 +3286,8 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 	if (sbi->total_valid_block_count == fsck->chk.valid_blk_cnt) {
 		printf(" [Ok..] [0x%x]\n", (u32)fsck->chk.valid_blk_cnt);
 	} else {
-		printf(" [Fail] [0x%x]\n", (u32)fsck->chk.valid_blk_cnt);
+		printf(" [Fail] [0x%x, 0x%x]\n", sbi->total_valid_block_count,
+					(u32)fsck->chk.valid_blk_cnt);
 		verify_failed = true;
 	}
 
@@ -3292,7 +3295,8 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 	if (sbi->total_valid_node_count == fsck->chk.valid_node_cnt) {
 		printf(" [Ok..] [0x%x]\n", fsck->chk.valid_node_cnt);
 	} else {
-		printf(" [Fail] [0x%x]\n", fsck->chk.valid_node_cnt);
+		printf(" [Fail] [0x%x, 0x%x]\n", sbi->total_valid_node_count,
+						fsck->chk.valid_node_cnt);
 		verify_failed = true;
 	}
 
@@ -3300,7 +3304,8 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 	if (sbi->total_valid_node_count == fsck->chk.valid_nat_entry_cnt) {
 		printf(" [Ok..] [0x%x]\n", fsck->chk.valid_nat_entry_cnt);
 	} else {
-		printf(" [Fail] [0x%x]\n", fsck->chk.valid_nat_entry_cnt);
+		printf(" [Fail] [0x%x, 0x%x]\n", sbi->total_valid_node_count,
+						fsck->chk.valid_nat_entry_cnt);
 		verify_failed = true;
 	}
 
@@ -3308,7 +3313,8 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 	if (sbi->total_valid_inode_count == fsck->chk.valid_inode_cnt) {
 		printf(" [Ok..] [0x%x]\n", fsck->chk.valid_inode_cnt);
 	} else {
-		printf(" [Fail] [0x%x]\n", fsck->chk.valid_inode_cnt);
+		printf(" [Fail] [0x%x, 0x%x]\n", sbi->total_valid_inode_count,
+						fsck->chk.valid_inode_cnt);
 		verify_failed = true;
 	}
 
@@ -3317,7 +3323,9 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 						fsck->chk.sit_free_segs) {
 		printf(" [Ok..] [0x%x]\n", fsck->chk.sit_free_segs);
 	} else {
-		printf(" [Fail] [0x%x]\n", fsck->chk.sit_free_segs);
+		printf(" [Fail] [0x%x, 0x%x]\n",
+			le32_to_cpu(F2FS_CKPT(sbi)->free_segment_count),
+			fsck->chk.sit_free_segs);
 		verify_failed = true;
 	}
 
diff --git a/fsck/mount.c b/fsck/mount.c
index f0b0072..f19f081 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -2782,8 +2782,11 @@ void flush_journal_entries(struct f2fs_sb_info *sbi)
 	int n_nats = flush_nat_journal_entries(sbi);
 	int n_sits = flush_sit_journal_entries(sbi);
 
-	if (n_nats || n_sits)
+	if (n_nats || n_sits) {
+		MSG(0, "Info: flush_journal_entries() n_nats: %d, n_sits: %d\n",
+							n_nats, n_sits);
 		write_checkpoints(sbi);
+	}
 }
 
 void flush_sit_entries(struct f2fs_sb_info *sbi)
@@ -3259,6 +3262,8 @@ void write_checkpoint(struct f2fs_sb_info *sbi)
 
 	ret = f2fs_fsync_device();
 	ASSERT(ret >= 0);
+
+	MSG(0, "Info: write_checkpoint() cur_cp:%d\n", sbi->cur_cp);
 }
 
 void write_checkpoints(struct f2fs_sb_info *sbi)
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
