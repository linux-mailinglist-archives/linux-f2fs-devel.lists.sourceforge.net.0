Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE43981F91D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Dec 2023 15:32:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rIrQp-0003ZB-Gr;
	Thu, 28 Dec 2023 14:32:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rIrQo-0003Z5-E3
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Dec 2023 14:32:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I7XXUYIr8Q9KF+4scUbYcSJk+NkBf5I8stoKQ5y70L8=; b=K0MTjjKx8dbXFYsWG4ngV3Q+Fo
 mZIygYhgoosWs5mdhLw1hCgzivHxZrG55xxj8OtEzuDQMRJy6vNVATIkz8c36QQr1172iG1QzxMZI
 6gB3NXqNSCuzX/8+FMDaLipHyiCv0jYDyWGfdRkHhz1J3A6cxhBXft/vCTR9dtReSf4Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I7XXUYIr8Q9KF+4scUbYcSJk+NkBf5I8stoKQ5y70L8=; b=NJuNq47bZLMlI4fwe/bCbCn/D1
 Fqr+j9lKGTBpa/dZ17btb7EEja4hsUzeWcGA0H9VQBikUFhQIWaNo2kf4PqCkDUpeWHd8qVruuztO
 4XCYxIoKRNV2vtfCfrqvSkBbmGCmGhqjLV8/TEuq6kmpdcTVsqWTnKPlhnfISml80wL0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rIrQm-0000zM-PN for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Dec 2023 14:32:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5AC0860FFB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 28 Dec 2023 14:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9777DC433C9;
 Thu, 28 Dec 2023 14:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703773926;
 bh=/uXMDvSOj4ElzaKYgiipftBm0qNMtUebJdjXyJwsNz0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KbL/mcEp6TTfyO6ngjT22PS7q4xzi+uVlJnUWiUE6+Lad500sZw+hkyeIF2jx0jMh
 S3//2yv+6t5dC/rAMejbCiK/h30KLr+9LQgThbN8oyH45LKus/kS5aa/4en7zxybGj
 5yR7Sx0HWr5+Iy5MNXeMiARK61DzVOYcay4jXxhlZBZsRHt3qiiG/BmBVUdgk3Rd4Z
 JZ81dAfN4Lws9PwMTqW+CBzZ8i/dyn1HOT6P07RfzpZ6RxzUspMjSIcrXuKBBB8uiO
 VRuk+9wdHU+U5AJWsXbJvz+n+/1Iu8epGMprZ7+0ZjJM5r4gGUOmOM6HAlOLhH9Jds
 rK0j1Kbvw1gFw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 28 Dec 2023 22:31:48 +0800
Message-Id: <20231228143152.1543509-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231228143152.1543509-1-chao@kernel.org>
References: <20231228143152.1543509-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -8.2 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When we overwrite compressed cluster w/ normal cluster, we
 should not unlock cp_rwsem during f2fs_write_raw_pages(), otherwise data
 will be corrupted if partial blocks were persisted before CP & SPOR, [...]
 Content analysis details:   (-8.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rIrQm-0000zM-PN
Subject: [f2fs-dev] [PATCH v3 2/6] f2fs: compress: fix to cover normal
 cluster write with cp_rwsem
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

When we overwrite compressed cluster w/ normal cluster, we should
not unlock cp_rwsem during f2fs_write_raw_pages(), otherwise data
will be corrupted if partial blocks were persisted before CP & SPOR,
due to cluster metadata wasn't updated atomically.

Fixes: 4c8ff7095bef ("f2fs: support data compression")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/compress.c | 20 ++++++++++++++------
 fs/f2fs/data.c     |  3 ++-
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 9940b7886e5d..bf4cfab67aec 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1448,7 +1448,8 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
 					enum iostat_type io_type)
 {
 	struct address_space *mapping = cc->inode->i_mapping;
-	int _submitted, compr_blocks, ret, i;
+	struct f2fs_sb_info *sbi = F2FS_M_SB(mapping);
+	int _submitted, compr_blocks, ret = 0, i;
 
 	compr_blocks = f2fs_compressed_blocks(cc);
 
@@ -1463,6 +1464,10 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
 	if (compr_blocks < 0)
 		return compr_blocks;
 
+	/* overwrite compressed cluster w/ normal cluster */
+	if (compr_blocks > 0)
+		f2fs_lock_op(sbi);
+
 	for (i = 0; i < cc->cluster_size; i++) {
 		if (!cc->rpages[i])
 			continue;
@@ -1495,26 +1500,29 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
 				unlock_page(cc->rpages[i]);
 				ret = 0;
 			} else if (ret == -EAGAIN) {
+				ret = 0;
 				/*
 				 * for quota file, just redirty left pages to
 				 * avoid deadlock caused by cluster update race
 				 * from foreground operation.
 				 */
 				if (IS_NOQUOTA(cc->inode))
-					return 0;
-				ret = 0;
+					goto out;
 				f2fs_io_schedule_timeout(DEFAULT_IO_TIMEOUT);
 				goto retry_write;
 			}
-			return ret;
+			goto out;
 		}
 
 		*submitted += _submitted;
 	}
 
-	f2fs_balance_fs(F2FS_M_SB(mapping), true);
+out:
+	if (compr_blocks > 0)
+		f2fs_unlock_op(sbi);
 
-	return 0;
+	f2fs_balance_fs(sbi, true);
+	return ret;
 }
 
 int f2fs_write_multi_pages(struct compress_ctx *cc,
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 81f9e2cc49e2..b171a9980f6a 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2839,7 +2839,7 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 		.encrypted_page = NULL,
 		.submitted = 0,
 		.compr_blocks = compr_blocks,
-		.need_lock = LOCK_RETRY,
+		.need_lock = compr_blocks ? LOCK_DONE : LOCK_RETRY,
 		.post_read = f2fs_post_read_required(inode) ? 1 : 0,
 		.io_type = io_type,
 		.io_wbc = wbc,
@@ -2920,6 +2920,7 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 	if (err == -EAGAIN) {
 		err = f2fs_do_write_data_page(&fio);
 		if (err == -EAGAIN) {
+			f2fs_bug_on(sbi, compr_blocks);
 			fio.need_lock = LOCK_REQ;
 			err = f2fs_do_write_data_page(&fio);
 		}
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
