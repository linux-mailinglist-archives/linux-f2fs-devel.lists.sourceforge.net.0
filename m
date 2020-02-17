Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B0F160F21
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Feb 2020 10:47:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j3d00-0000TP-6R; Mon, 17 Feb 2020 09:47:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j3czy-0000Sz-M0
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 17 Feb 2020 09:47:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hA6KSPlyHtLaonA72SvpQfXuiRnZscApKvXYKObbNbo=; b=X2ZlvulkAaq++B3iJSfVLukvCP
 KA+WOa6Qzm9OrsZgYcukoDK0mKxkzYkwERJyAOgaS5+MCKfxlHTDUAzaEQQ+QgVvAAzNmsrxpOSlp
 lQOyrRK+qvEugGuacPwEFxYjhPhjD77ABtcMRqyV+5ZzX2Haa0vohgNuhJLVlrr8HT6I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hA6KSPlyHtLaonA72SvpQfXuiRnZscApKvXYKObbNbo=; b=O
 YoNWHh82Uh3QEq1azLmlhq4F83OCrUupXgBz6y76jRFvHWnfkQiaXKruXe8qrA8QYUGPPELXHhlhp
 Ga6he/CiMArZA5QTRxxVi5Xb0NB2P4+TViU5O+1PO3Qr1spD6bZF9PaGY3U+NgM/leEt6J/pX+7CL
 0YUfE/fDYDsdPfUs=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j3czw-005zNT-Vq
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 17 Feb 2020 09:47:30 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 5BE7A4C76B291BB35E5C;
 Mon, 17 Feb 2020 17:47:21 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Mon, 17 Feb 2020 17:47:10 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 17 Feb 2020 17:46:20 +0800
Message-ID: <20200217094620.106582-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1j3czw-005zNT-Vq
Subject: [f2fs-dev] [PATCH] f2fs: add prefix for f2fs slab cache name
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

In order to avoid polluting global slab cache namespace.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/data.c    | 2 +-
 fs/f2fs/node.c    | 8 ++++----
 fs/f2fs/segment.c | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index a877cc50a4c3..baf12318ec64 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3867,7 +3867,7 @@ void f2fs_destroy_post_read_wq(struct f2fs_sb_info *sbi)
 
 int __init f2fs_init_bio_entry_cache(void)
 {
-	bio_entry_slab = f2fs_kmem_cache_create("bio_entry_slab",
+	bio_entry_slab = f2fs_kmem_cache_create("f2fs_bio_entry_slab",
 			sizeof(struct bio_entry));
 	if (!bio_entry_slab)
 		return -ENOMEM;
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index d5edbe2ce4a1..040ffb09a126 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -3193,22 +3193,22 @@ void f2fs_destroy_node_manager(struct f2fs_sb_info *sbi)
 
 int __init f2fs_create_node_manager_caches(void)
 {
-	nat_entry_slab = f2fs_kmem_cache_create("nat_entry",
+	nat_entry_slab = f2fs_kmem_cache_create("f2fs_nat_entry",
 			sizeof(struct nat_entry));
 	if (!nat_entry_slab)
 		goto fail;
 
-	free_nid_slab = f2fs_kmem_cache_create("free_nid",
+	free_nid_slab = f2fs_kmem_cache_create("f2fs_free_nid",
 			sizeof(struct free_nid));
 	if (!free_nid_slab)
 		goto destroy_nat_entry;
 
-	nat_entry_set_slab = f2fs_kmem_cache_create("nat_entry_set",
+	nat_entry_set_slab = f2fs_kmem_cache_create("f2fs_nat_entry_set",
 			sizeof(struct nat_entry_set));
 	if (!nat_entry_set_slab)
 		goto destroy_free_nid;
 
-	fsync_node_entry_slab = f2fs_kmem_cache_create("fsync_node_entry",
+	fsync_node_entry_slab = f2fs_kmem_cache_create("f2fs_fsync_node_entry",
 			sizeof(struct fsync_node_entry));
 	if (!fsync_node_entry_slab)
 		goto destroy_nat_entry_set;
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 1628bc8327f1..fb3e531a36d2 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4832,22 +4832,22 @@ void f2fs_destroy_segment_manager(struct f2fs_sb_info *sbi)
 
 int __init f2fs_create_segment_manager_caches(void)
 {
-	discard_entry_slab = f2fs_kmem_cache_create("discard_entry",
+	discard_entry_slab = f2fs_kmem_cache_create("f2fs_discard_entry",
 			sizeof(struct discard_entry));
 	if (!discard_entry_slab)
 		goto fail;
 
-	discard_cmd_slab = f2fs_kmem_cache_create("discard_cmd",
+	discard_cmd_slab = f2fs_kmem_cache_create("f2fs_discard_cmd",
 			sizeof(struct discard_cmd));
 	if (!discard_cmd_slab)
 		goto destroy_discard_entry;
 
-	sit_entry_set_slab = f2fs_kmem_cache_create("sit_entry_set",
+	sit_entry_set_slab = f2fs_kmem_cache_create("f2fs_sit_entry_set",
 			sizeof(struct sit_entry_set));
 	if (!sit_entry_set_slab)
 		goto destroy_discard_cmd;
 
-	inmem_entry_slab = f2fs_kmem_cache_create("inmem_page_entry",
+	inmem_entry_slab = f2fs_kmem_cache_create("f2fs_inmem_page_entry",
 			sizeof(struct inmem_pages));
 	if (!inmem_entry_slab)
 		goto destroy_sit_entry_set;
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
