Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D854B18B2D1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2020 12:58:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jEtoc-0005pI-Ek; Thu, 19 Mar 2020 11:58:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jEtob-0005p1-Gk
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Mar 2020 11:58:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yyru5MNVMZOvomYkvqN9B2w8wvmlkiMGd4+/75noMBU=; b=K1h6ibRWjapufDuP2BNdwbrf3/
 GDQpiqBcoNbQj1od2RCzZLvMG+5yqGuK17RxBBzaW9D+WRJ1ztlmOrD21Sajb9f1Wto01f6u+gVLv
 POrG2izVmlkW69Vj/WGKpQ6HaxUhWxj9XcKNnfgVWJWT9lE2oV8vAOo6lXjuJ0siHFkQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Yyru5MNVMZOvomYkvqN9B2w8wvmlkiMGd4+/75noMBU=; b=j25FljCcHHcitngoM4uqshveY/
 hs0ED7CQnNtMeQDSAxHW9X+ac8aXxvEnfGnziDMSm/lJA7p8Mxc/3D3I0pmbhdspF25m+UTM4MlVB
 Mtz46tcuuLQgq0IX+hPK1O0KvVRYxaS95wbb3CRwzKo8J/pWg/TOGrr6vvBhm6dOZoj8=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jEtoZ-008oj5-Qc
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Mar 2020 11:58:21 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id A693FA6BF3FD5995D8B0;
 Thu, 19 Mar 2020 19:58:10 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 19 Mar 2020 19:58:04 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Thu, 19 Mar 2020 19:57:59 +0800
Message-ID: <20200319115800.108926-3-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
In-Reply-To: <20200319115800.108926-1-yuchao0@huawei.com>
References: <20200319115800.108926-1-yuchao0@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jEtoZ-008oj5-Qc
Subject: [f2fs-dev] [PATCH 3/4] f2fs: fix NULL pointer dereference in
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
 fs/f2fs/data.c | 35 ++++++++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 5c5db09324b7..66e49fc1056e 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -187,12 +187,37 @@ static void f2fs_verify_pages(struct page **rpages, unsigned int cluster_size)
 
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
+
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
 
-	f2fs_verify_pages(dic->rpages, dic->cluster_size);
-	f2fs_free_dic(dic);
+		if (bio->bi_status || PageError(page)) {
+			ClearPageUptodate(page);
+			ClearPageError(page);
+		} else {
+			if (fsverity_verify_page(page))
+				SetPageUptodate(page);
+			else
+				SetPageError(page);
+		}
+		unlock_page(page);
+	}
 }
 #endif
 
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
