Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD79C1A9C93
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2020 13:36:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOgLc-0003XO-Mf; Wed, 15 Apr 2020 11:36:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1jOgLa-0003X0-KB
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 11:36:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vcGupc0w1OpR0UgbjI2UXdhR7i6mDTANJQQoOiMRVQk=; b=H8hlGPbmclIBYGnYYyAP5USD4D
 ttP3s8X9f3JHX6uNN3EEwA8Q9PSzIapAsQIc64DOCVl8X0/MLyVE+GGHhmhRRTjOgxHW+38fZ201j
 byTYM0uX5FW8Zkw2rvAbmh4Vamay2zGSF9et9O90qmy6w2sFBag5GaQu0WZcmsf+slEo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vcGupc0w1OpR0UgbjI2UXdhR7i6mDTANJQQoOiMRVQk=; b=hpeRrKhfgNG2K+ddBqYD84+pCZ
 NgX4Ou7s2fV25xnpAVBsabGxNK4DuqILGgKgRS9bmuAczsyX+SdgakdVR0Tcp2Ijuw66jj07g1LS7
 9NPwThBCXdopIKIC/ENTA0zVeJOeAs+hA5hNy2ppZvP6iVNxvQjV581fOGWU0Iu9xpbQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jOgLY-000FIM-Fh
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 11:36:50 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4C49220936;
 Wed, 15 Apr 2020 11:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586950603;
 bh=YLXBwgw3/Lm1c+qH8DOQy+FDCzjJEKmau8CPH+MDC5E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QiCK4FXusW5AcJ/AAPFy4hB78r5rogA3Geb5jUh1lpVRD+HhdAg0H+K5332jqv0WU
 psxtlSLb/+IkFoFIiVh9j2VSQ6b8NH5dDKv/5XQURqHIvKqQLSoZjupkBnpebM0MBw
 CjHU3lpxXdbNLLrhXedhrt5ywwg9kaW9ar07SdxA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 15 Apr 2020 07:34:13 -0400
Message-Id: <20200415113445.11881-98-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415113445.11881-1-sashal@kernel.org>
References: <20200415113445.11881-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jOgLY-000FIM-Fh
Subject: [f2fs-dev] [PATCH AUTOSEL 5.6 098/129] f2fs: fix NULL pointer
 dereference in f2fs_verity_work()
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <yuchao0@huawei.com>

[ Upstream commit 79bbefb19f1359fb2cbd144d5a054649e7e583be ]

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
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/compress.c |  2 ++
 fs/f2fs/data.c     | 35 ++++++++++++++++++++++++++++++-----
 2 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 1a86e483b0907..eb84c13c1182c 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -476,6 +476,8 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
 out_vunmap_rbuf:
 	vunmap(dic->rbuf);
 out_free_dic:
+	if (verity)
+		refcount_add(dic->nr_cpages - 1, &dic->ref);
 	if (!verity)
 		f2fs_decompress_end_io(dic->rpages, dic->cluster_size,
 								ret, false);
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index b27b721079116..34990866cfe96 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -191,12 +191,37 @@ static void f2fs_verify_pages(struct page **rpages, unsigned int cluster_size)
 
 static void f2fs_verify_bio(struct bio *bio)
 {
-	struct page *page = bio_first_page_all(bio);
-	struct decompress_io_ctx *dic =
-			(struct decompress_io_ctx *)page_private(page);
+	struct bio_vec *bv;
+	struct bvec_iter_all iter_all;
+
+	bio_for_each_segment_all(bv, bio, iter_all) {
+		struct page *page = bv->bv_page;
+		struct decompress_io_ctx *dic;
+
+		dic = (struct decompress_io_ctx *)page_private(page);
+
+		if (dic) {
+			if (refcount_dec_not_one(&dic->ref))
+				continue;
+			f2fs_verify_pages(dic->rpages,
+						dic->cluster_size);
+			f2fs_free_dic(dic);
+			continue;
+		}
+
+		if (bio->bi_status || PageError(page))
+			goto clear_uptodate;
 
-	f2fs_verify_pages(dic->rpages, dic->cluster_size);
-	f2fs_free_dic(dic);
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
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
