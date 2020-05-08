Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1171CA787
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 May 2020 11:50:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jWzeW-0001Kj-19; Fri, 08 May 2020 09:50:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jWzeU-0001KY-Bj
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 May 2020 09:50:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2mD73VTf4SJu5uXawUCv/FYCLco2EBW0qkt+gj2A/y4=; b=QTDBWKvootm1jmeyi/f0r6y/bk
 OZt0/ChSx7bvQjDR4acCk6wWnR+GxzGV93PJrvNvLl0Y7SlFAObgBhHfsJYZr8hyufrO+Ndc/PQLQ
 S6pkL4PClZr/r662h/G/8nSQBZaN2R+zCzufso/KvVHEet2xWIO2GZAOs+YIJlwd8HCE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2mD73VTf4SJu5uXawUCv/FYCLco2EBW0qkt+gj2A/y4=; b=M
 JSRvdfaWapaRbZl3t66FE1sWRJOQfrnN2qCe8x33Ad5X63R2FjJF6Hy9dsm48ig9IWQt+1irKLWiZ
 2dtCLaIxuDRbGRnyRNxkSJUVyYGu2rmMkepkOTCTpTNljOKCS46u6sc5v05OaOtwEE1PzOWzlqu3+
 gjQmtr/gqxcgviRo=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jWzeS-00CKfl-Uw
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 May 2020 09:50:42 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 583B52AEF2203F4EBEDC;
 Fri,  8 May 2020 17:50:31 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Fri, 8 May 2020 17:50:22 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 8 May 2020 17:50:20 +0800
Message-ID: <20200508095020.41025-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWzeS-00CKfl-Uw
Subject: [f2fs-dev] [PATCH v2] f2fs: shrink spinlock coverage
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

In f2fs_try_to_free_nids(), .nid_list_lock spinlock critical region will
increase as expected shrink number increase, to avoid spining other CPUs
for long time, we change to release nid caches with small batch each time
under .nid_list_lock coverage.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v2:
- shrink free nid caches in batch under spinlock coverage.
 fs/f2fs/node.c | 25 +++++++++++++++----------
 fs/f2fs/node.h |  3 +++
 2 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 4da0d8713df5..1db8cabf727e 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2488,7 +2488,6 @@ void f2fs_alloc_nid_failed(struct f2fs_sb_info *sbi, nid_t nid)
 int f2fs_try_to_free_nids(struct f2fs_sb_info *sbi, int nr_shrink)
 {
 	struct f2fs_nm_info *nm_i = NM_I(sbi);
-	struct free_nid *i, *next;
 	int nr = nr_shrink;
 
 	if (nm_i->nid_cnt[FREE_NID] <= MAX_FREE_NIDS)
@@ -2497,17 +2496,23 @@ int f2fs_try_to_free_nids(struct f2fs_sb_info *sbi, int nr_shrink)
 	if (!mutex_trylock(&nm_i->build_lock))
 		return 0;
 
-	spin_lock(&nm_i->nid_list_lock);
-	list_for_each_entry_safe(i, next, &nm_i->free_nid_list, list) {
-		if (nr_shrink <= 0 ||
-				nm_i->nid_cnt[FREE_NID] <= MAX_FREE_NIDS)
-			break;
+	while (nr_shrink && nm_i->nid_cnt[FREE_NID] > MAX_FREE_NIDS) {
+		struct free_nid *i, *next;
+		unsigned int batch = SHRINK_NID_BATCH_SIZE;
 
-		__remove_free_nid(sbi, i, FREE_NID);
-		kmem_cache_free(free_nid_slab, i);
-		nr_shrink--;
+		spin_lock(&nm_i->nid_list_lock);
+		list_for_each_entry_safe(i, next, &nm_i->free_nid_list, list) {
+			if (!nr_shrink || !batch ||
+				nm_i->nid_cnt[FREE_NID] <= MAX_FREE_NIDS)
+				break;
+			__remove_free_nid(sbi, i, FREE_NID);
+			kmem_cache_free(free_nid_slab, i);
+			nr_shrink--;
+			batch--;
+		}
+		spin_unlock(&nm_i->nid_list_lock);
 	}
-	spin_unlock(&nm_i->nid_list_lock);
+
 	mutex_unlock(&nm_i->build_lock);
 
 	return nr - nr_shrink;
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index e05af5df5648..33d677f83569 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -15,6 +15,9 @@
 #define FREE_NID_PAGES	8
 #define MAX_FREE_NIDS	(NAT_ENTRY_PER_BLOCK * FREE_NID_PAGES)
 
+/* size of free nid batch when shrinking */
+#define SHRINK_NID_BATCH_SIZE	8
+
 #define DEF_RA_NID_PAGES	0	/* # of nid pages to be readaheaded */
 
 /* maximum readahead size for node during getting data blocks */
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
