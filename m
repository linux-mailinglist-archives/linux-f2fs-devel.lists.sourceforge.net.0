Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBD818E122
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 21 Mar 2020 13:22:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jFd97-0000SM-AV; Sat, 21 Mar 2020 12:22:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1jFd95-0000S5-Rz
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 21 Mar 2020 12:22:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TPQ5soQ5M4AH6aZQTteEUjCLEJ+xeZE7tmk6FZqPxBQ=; b=e108jbCX8zyA4Q9d7p32Rw4lwE
 R9/NZrngkGgB48FcJNQdz6IeEp9BiSCjzfN25BHruYdT3Oxwqa6GAE9fGvKu+zl4MYTaj63Qc/tFd
 /BdRf+aR3EaAdREM67uHVFiVt+lIn5nKKx1CSzDdahm5+AbRtMbtglCM3G3Ra70VWPtc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=TPQ5soQ5M4AH6aZQTteEUjCLEJ+xeZE7tmk6FZqPxBQ=; b=L
 HsI50dTOWRxzXO0l0s5pbJ9KcHLvAkpUvjgUTkIx8gEj/T3vvS1L6L/si4ngrXZo1WCGj/5rn+4sU
 WhSAZJLOxmHo5k2xfImfSLTmSuw62cxlb2Ht4FG3fEsSFLK3SkY2lflFMDIYULWVmVN67zwDv83fr
 2HN9mf6zjKFzHc0Q=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jFd93-00GIha-2M
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 21 Mar 2020 12:22:31 +0000
Received: from localhost.localdomain (unknown [49.65.245.234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D83F720722;
 Sat, 21 Mar 2020 12:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584793343;
 bh=/3nPfZXBKwKIY++A+xEYIPUcMBEvmjAt1f4xiG8QQQU=;
 h=From:To:Cc:Subject:Date:From;
 b=JFmljKSM8w9/MneocFtCjszq19tzQLUtntTjEkg7r6wBDNMD7T8A1AbIhFWOu1Wpn
 yRFtKKuUiHqvhVhVePJR3SwyRBbZNEBzcJAiT4PkEBPC5aevrhdPPOm7Y/Uk/6+Uzn
 Z9HwnHUPCi+NZeILt1EwiwSm9T+SMUoFLuJpmesw=
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sat, 21 Mar 2020 20:21:53 +0800
Message-Id: <20200321122153.22424-1-chao@kernel.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jFd93-00GIha-2M
Subject: [f2fs-dev] [PATCH v2 3/4] f2fs: fix NULL pointer dereference in
 f2fs_verity_work()
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

From: Chao Yu <yuchao0@huawei.com>

If both compression and fsverity feature is on, generic/572 will
report below NULL pointer dereference bug.

 BUG: kernel NULL pointer dereference, address: 0000000000000018
 RIP: 0010:f2fs_verity_work+0x60/0x90 [f2fs]
 #PF: supervisor read access in kernel mode
 Workqueue: fsverity_read_queue f2fs_verity_work [f2fs]
 RIP: 0010:f2fs_verity_work+0x60/0x90 [f2fs]
 Call Trace:
  process_one_work+0x16c/0x3f0
  worker_thread+0x4c/0x440
  ? rescuer_thread+0x350/0x350
  kthread+0xf8/0x130
  ? kthread_unpark+0x70/0x70
  ret_from_fork+0x35/0x40

There are two issue in f2fs_verity_work():
- it needs to traverse and verify all pages in bio.
- if pages in bio belong to non-compressed cluster, accessing
decompress IO context stored in page private will cause NULL
pointer dereference.

Fix them.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v2:
- fix error path of f2fs_verify_bio pointed out by Eric
 fs/f2fs/data.c | 37 ++++++++++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 5c5db09324b7..d5b1eda21519 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -187,12 +187,39 @@ static void f2fs_verify_pages(struct page **rpages, unsigned int cluster_size)
 
 static void f2fs_verify_bio(struct bio *bio)
 {
-	struct page *page = bio_first_page_all(bio);
-	struct decompress_io_ctx *dic =
-			(struct decompress_io_ctx *)page_private(page);
+	struct bio_vec *bv;
+	struct bvec_iter_all iter_all;
+	struct decompress_io_ctx *dic, *pdic = NULL;
+
+	bio_for_each_segment_all(bv, bio, iter_all) {
+		struct page *page = bv->bv_page;
+
+		dic = (struct decompress_io_ctx *)page_private(page);
 
-	f2fs_verify_pages(dic->rpages, dic->cluster_size);
-	f2fs_free_dic(dic);
+		if (dic) {
+			if (dic != pdic) {
+				f2fs_verify_pages(dic->rpages,
+							dic->cluster_size);
+				f2fs_free_dic(dic);
+				pdic = dic;
+			}
+			continue;
+		}
+		pdic = dic;
+
+		if (bio->bi_status || PageError(page))
+			goto clear_uptodate;
+
+		if (fsverity_verify_page(page)) {
+			SetPageUptodate(page);
+			goto unlock;
+		}
+clear_uptodate:
+		ClearPageUptodate(page);
+		ClearPageError(page);
+unlock:
+		unlock_page(page);
+	}
 }
 #endif
 
-- 
2.22.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
