Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E7D91D978
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Jul 2024 09:53:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sOBqd-0004oi-Ll;
	Mon, 01 Jul 2024 07:53:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Yi.Sun@unisoc.com>) id 1sOBqb-0004oc-65
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Jul 2024 07:53:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iIHmEFoKcSBN0mKbLF7zuE3vtHJ+me9Lo0+lTC/F6kM=; b=TVqqpyI4xjJeyp2JnJ+Dv8xpYk
 3RGANieZxb1yoIafU71auhnMdHBBomNthdF0iK5gh3y/bqxPVod0oWz9aZX5RdfMi760+V3UHIKR2
 ei0N96lk4qM4kaP7Ae3oEs0Vn07v8oQjYk9o8G71BwhNaJzauhxAhJsn1sCQfNxUzkQM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iIHmEFoKcSBN0mKbLF7zuE3vtHJ+me9Lo0+lTC/F6kM=; b=WhyvbdF6mtX8umeJQu9TB3OgVG
 vPCu3+yMiS7ETjL+T8AmZpRseTgMbRH91ojczWRgjMBbSV9bdcuLSERkyjiM0DsnZ75yXSAh9ptCy
 /eAdqbO3jP5Rg/Rnqd8gcl0enjYhrkNG9JVIQgVZeKiZO0eJ9FDaodVfMeX9vHGnOSQc=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sOBqb-0006v6-3v for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Jul 2024 07:53:13 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 4617pjuA064749;
 Mon, 1 Jul 2024 15:51:45 +0800 (+08)
 (envelope-from Yi.Sun@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4WCJ5n0qV1z2KKCbl;
 Mon,  1 Jul 2024 15:46:53 +0800 (CST)
Received: from tj10379pcu.spreadtrum.com (10.5.32.15) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Mon, 1 Jul 2024 15:51:42 +0800
From: Yi Sun <yi.sun@unisoc.com>
To: <sunyibuaa@gmail.com>, <tj@kernel.org>, <jiangshanlai@gmail.com>,
 <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Mon, 1 Jul 2024 15:51:38 +0800
Message-ID: <20240701075138.1144575-3-yi.sun@unisoc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240701075138.1144575-1-yi.sun@unisoc.com>
References: <20240701075138.1144575-1-yi.sun@unisoc.com>
MIME-Version: 1.0
X-Originating-IP: [10.5.32.15]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 4617pjuA064749
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The io priority of reading the original data of the
 verity-file
 and reading hash blocks during verification should be consistent. If the
 io priority is not set, when a high-task-priority process reads the verity-file,
 the kworker's io priority may be too low, resulting in delayed reading of
 hash blocks, which eventually causes t [...] 
 Content analysis details:   (-5.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in sa-trusted.bondedsender.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [222.66.158.135 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1sOBqb-0006v6-3v
Subject: [f2fs-dev] [PATCH v2 2/2] f2fs: set io priority for fsverity work
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
Cc: yunlongxing23@gmail.com, ebiggers@google.com, kent.overstreet@linux.dev,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 yi.sun@unisoc.com, Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The io priority of reading the original data of the verity-file
and reading hash blocks during verification should be consistent.

If the io priority is not set, when a high-task-priority process
reads the verity-file, the kworker's io priority may be too low,
resulting in delayed reading of hash blocks, which eventually
causes the high-task-priority process to response slowly.

Signed-off-by: Yi Sun <yi.sun@unisoc.com>
---
 fs/f2fs/data.c   | 17 ++++++++++-------
 fs/f2fs/f2fs.h   |  1 +
 fs/f2fs/verity.c |  5 +++++
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index b9b0debc6b3d..7e8c56a3098b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -110,7 +110,7 @@ enum bio_post_read_step {
 struct bio_post_read_ctx {
 	struct bio *bio;
 	struct f2fs_sb_info *sbi;
-	struct work_struct work;
+	struct io_work iowork;
 	unsigned int enabled_steps;
 	/*
 	 * decompression_attempted keeps track of whether
@@ -168,10 +168,12 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 static void f2fs_verify_bio(struct work_struct *work)
 {
 	struct bio_post_read_ctx *ctx =
-		container_of(work, struct bio_post_read_ctx, work);
+		container_of(to_io_work(work), struct bio_post_read_ctx, iowork);
 	struct bio *bio = ctx->bio;
 	bool may_have_compressed_pages = (ctx->enabled_steps & STEP_DECOMPRESS);
 
+	may_adjust_io_work_task_ioprio(to_io_work(work));
+
 	/*
 	 * fsverity_verify_bio() may call readahead() again, and while verity
 	 * will be disabled for this, decryption and/or decompression may still
@@ -204,6 +206,7 @@ static void f2fs_verify_bio(struct work_struct *work)
 	}
 
 	f2fs_finish_read_bio(bio, true);
+	restore_io_work_task_ioprio(to_io_work(work));
 }
 
 /*
@@ -220,8 +223,8 @@ static void f2fs_verify_and_finish_bio(struct bio *bio, bool in_task)
 	struct bio_post_read_ctx *ctx = bio->bi_private;
 
 	if (ctx && (ctx->enabled_steps & STEP_VERITY)) {
-		INIT_WORK(&ctx->work, f2fs_verify_bio);
-		fsverity_enqueue_verify_work(&ctx->work);
+		INIT_IO_WORK(&ctx->iowork, f2fs_verify_bio);
+		f2fs_enqueue_verify_io_work(&ctx->iowork);
 	} else {
 		f2fs_finish_read_bio(bio, in_task);
 	}
@@ -270,7 +273,7 @@ static void f2fs_handle_step_decompress(struct bio_post_read_ctx *ctx,
 static void f2fs_post_read_work(struct work_struct *work)
 {
 	struct bio_post_read_ctx *ctx =
-		container_of(work, struct bio_post_read_ctx, work);
+		container_of(to_io_work(work), struct bio_post_read_ctx, iowork);
 	struct bio *bio = ctx->bio;
 
 	if ((ctx->enabled_steps & STEP_DECRYPT) && !fscrypt_decrypt_bio(bio)) {
@@ -313,8 +316,8 @@ static void f2fs_read_end_io(struct bio *bio)
 				!f2fs_low_mem_mode(sbi)) {
 			f2fs_handle_step_decompress(ctx, intask);
 		} else if (enabled_steps) {
-			INIT_WORK(&ctx->work, f2fs_post_read_work);
-			queue_work(ctx->sbi->post_read_wq, &ctx->work);
+			INIT_IO_WORK(&ctx->iowork, f2fs_post_read_work);
+			queue_io_work(ctx->sbi->post_read_wq, &ctx->iowork);
 			return;
 		}
 	}
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 1974b6aff397..dc228c50ed30 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4234,6 +4234,7 @@ void f2fs_unregister_sysfs(struct f2fs_sb_info *sbi);
 
 /* verity.c */
 extern const struct fsverity_operations f2fs_verityops;
+void f2fs_enqueue_verify_io_work(struct io_work *iowork);
 
 /*
  * crypto support
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index f7bb0c54502c..fba6aecba9b6 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -292,3 +292,8 @@ const struct fsverity_operations f2fs_verityops = {
 	.read_merkle_tree_page	= f2fs_read_merkle_tree_page,
 	.write_merkle_tree_block = f2fs_write_merkle_tree_block,
 };
+
+void f2fs_enqueue_verify_io_work(struct io_work *iowork)
+{
+	fsverity_enqueue_verify_work(&(iowork->work));
+}
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
