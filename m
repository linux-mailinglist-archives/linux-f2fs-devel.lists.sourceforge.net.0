Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B225C911BB4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Jun 2024 08:28:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sKXkY-0007A3-VJ;
	Fri, 21 Jun 2024 06:27:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Yi.Sun@unisoc.com>) id 1sKXkX-00079w-Qj
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Jun 2024 06:27:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZmPGPlcByAYd2NWqNYdveqrwqnNx26k1juQa+7BnkR0=; b=M4ZI5oOTotSS1AN48ChsSN06qx
 m9++wACTPAACMUzjZlBv65KACGl/Ql4iWfnlkDYgmLIg95brvPke0KTj3+bUvnDTgDmiRHTkjxqZ0
 9M1XDFoitL/zeDwplAX3uDwxF7/muP2xi5hJFRL0XeGLrG1piU2Nj9sQE7Ir+P2Qk4gU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZmPGPlcByAYd2NWqNYdveqrwqnNx26k1juQa+7BnkR0=; b=ZGwkPReO94BNiWh0rJPreIquyj
 5YqnITvmFpsmvMSwtl6o7jMViLXYr6zXBY7bBSzkgQ4USMciQz+xNcYw+56b4MIYiqYbxBOc8GbP8
 6Ljwqh91M6fqp7OPfnJPB/krY2Sgb44x9ZGrrEV8jBGLDKKrMVUwCvLu2GtOuYjBkPNs=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sKXkW-0005d5-UY for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Jun 2024 06:27:54 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 45L6QWPL041450;
 Fri, 21 Jun 2024 14:26:32 +0800 (+08)
 (envelope-from Yi.Sun@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4W56hS1zfhz2SFCkm;
 Fri, 21 Jun 2024 14:22:00 +0800 (CST)
Received: from tj10379pcu.spreadtrum.com (10.5.32.15) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Fri, 21 Jun 2024 14:26:30 +0800
From: Yi Sun <yi.sun@unisoc.com>
To: <sunyibuaa@gmail.com>, <tj@kernel.org>, <jaegeuk@kernel.org>,
 <chao@kernel.org>
Date: Fri, 21 Jun 2024 14:26:17 +0800
Message-ID: <20240621062617.595007-3-yi.sun@unisoc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240621062617.595007-1-yi.sun@unisoc.com>
References: <20240621062617.595007-1-yi.sun@unisoc.com>
MIME-Version: 1.0
X-Originating-IP: [10.5.32.15]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 45L6QWPL041450
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
 io priority is not set, when a high-task-priority process reads [...] 
 Content analysis details:   (-5.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [222.66.158.135 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sKXkW-0005d5-UY
Subject: [f2fs-dev] [PATCH 2/2] f2fs: set f2fs verify work io priority
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
 jiangshanlai@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Hao_hao.Wang@unisoc.com
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
 fs/f2fs/data.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index b9b0debc6b3d..705a2bdf0848 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -172,6 +172,8 @@ static void f2fs_verify_bio(struct work_struct *work)
 	struct bio *bio = ctx->bio;
 	bool may_have_compressed_pages = (ctx->enabled_steps & STEP_DECOMPRESS);
 
+	may_adjust_work_task_ioprio(work);
+
 	/*
 	 * fsverity_verify_bio() may call readahead() again, and while verity
 	 * will be disabled for this, decryption and/or decompression may still
@@ -204,6 +206,8 @@ static void f2fs_verify_bio(struct work_struct *work)
 	}
 
 	f2fs_finish_read_bio(bio, true);
+
+	restore_work_task_ioprio(work);
 }
 
 /*
@@ -221,6 +225,7 @@ static void f2fs_verify_and_finish_bio(struct bio *bio, bool in_task)
 
 	if (ctx && (ctx->enabled_steps & STEP_VERITY)) {
 		INIT_WORK(&ctx->work, f2fs_verify_bio);
+		set_work_ioprio(&ctx->work, bio->bi_ioprio);
 		fsverity_enqueue_verify_work(&ctx->work);
 	} else {
 		f2fs_finish_read_bio(bio, in_task);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
