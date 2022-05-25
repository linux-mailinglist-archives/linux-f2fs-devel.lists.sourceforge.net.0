Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A3F5339EF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 May 2022 11:30:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ntnLR-0004pV-7j; Wed, 25 May 2022 09:30:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <yuyufen@huawei.com>) id 1ntnLO-0004pP-Na
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 May 2022 09:30:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XcuMGcarAM/kA0nynpzsZEGafbKWxJXPrXUZikOjaXc=; b=KNFLT/IZwE0rCauZbt/TQRWTpM
 VL3YcthHSqla2kfLIxLnCWfKAE8lydnEiFll6Iw+APx0L+48HKlqMWZlegttjdZHMGS4HRjliM0EO
 etcADn//241Jdgk0VuVHm4vDqde6k/7iReM5hJzOlynPFtVqUmPqYOvMNK1iCrO9pdds=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XcuMGcarAM/kA0nynpzsZEGafbKWxJXPrXUZikOjaXc=; b=SC2jQzZLjL8dRnySjwtltE0rBs
 bicNfn5/gzqy+88uugTC1PjMP+jVZWyXAK7fwBR9SplhZBkXWdOHpByf181AfjZfdQgWey/aE2AUG
 mdUUWHnwBPQ9ykoiqucl+rK/8/+lErpRYFqZRjnfyjx1u5uOF8uk5ZIK5piovQ+CgPEg=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ntnLM-008eCn-Uh
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 May 2022 09:30:18 +0000
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4L7Qgv51XDzQkGP;
 Wed, 25 May 2022 17:27:07 +0800 (CST)
Received: from dggpeml500009.china.huawei.com (7.185.36.209) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 25 May 2022 17:30:08 +0800
Received: from huawei.com (10.175.127.227) by dggpeml500009.china.huawei.com
 (7.185.36.209) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 25 May
 2022 17:30:07 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Wed, 25 May 2022 17:43:36 +0800
Message-ID: <20220525094336.2489995-2-yuyufen@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220525094336.2489995-1-yuyufen@huawei.com>
References: <20220525094336.2489995-1-yuyufen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500009.china.huawei.com (7.185.36.209)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Almost all other initialization of variables in
 f2fs_fill_super
 are extraced to a single function. Also do it for write_io[], which can make
 code more clean. This patch just refactors the code, theres no functional
 change. Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.188 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1ntnLM-008eCn-Uh
Subject: [f2fs-dev] [PATCH 2/2] f2fs: add f2fs_init_write_merge_io function
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
From: Yufen Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yufen Yu <yuyufen@huawei.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Almost all other initialization of variables in f2fs_fill_super are
extraced to a single function. Also do it for write_io[], which can
make code more clean.

This patch just refactors the code, theres no functional change.

Signed-off-by: Yufen Yu <yuyufen@huawei.com>
---
 fs/f2fs/data.c  | 30 ++++++++++++++++++++++++++++++
 fs/f2fs/f2fs.h  |  1 +
 fs/f2fs/super.c | 27 +++------------------------
 3 files changed, 34 insertions(+), 24 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 9a1a526f2092..ca560c046559 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -585,6 +585,36 @@ static bool __has_merged_page(struct bio *bio, struct inode *inode,
 	return false;
 }
 
+int f2fs_init_write_merge_io(struct f2fs_sb_info *sbi)
+{
+	int i;
+
+	for (i = 0; i < NR_PAGE_TYPE; i++) {
+		int n = (i == META) ? 1 : NR_TEMP_TYPE;
+		int j;
+
+		sbi->write_io[i] =
+			f2fs_kmalloc(sbi,
+					 array_size(n,
+						sizeof(struct f2fs_bio_info)),
+					 GFP_KERNEL);
+		if (!sbi->write_io[i])
+			return -ENOMEM;
+
+		for (j = HOT; j < n; j++) {
+			init_f2fs_rwsem(&sbi->write_io[i][j].io_rwsem);
+			sbi->write_io[i][j].sbi = sbi;
+			sbi->write_io[i][j].bio = NULL;
+			spin_lock_init(&sbi->write_io[i][j].io_lock);
+			INIT_LIST_HEAD(&sbi->write_io[i][j].io_list);
+			INIT_LIST_HEAD(&sbi->write_io[i][j].bio_list);
+			init_f2fs_rwsem(&sbi->write_io[i][j].bio_list_lock);
+		}
+	}
+
+	return 0;
+}
+
 static void __f2fs_submit_merged_write(struct f2fs_sb_info *sbi,
 				enum page_type type, enum temp_type temp)
 {
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 2b2b3c87e45e..02e2dc17938c 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3719,6 +3719,7 @@ int f2fs_init_bio_entry_cache(void);
 void f2fs_destroy_bio_entry_cache(void);
 void f2fs_submit_bio(struct f2fs_sb_info *sbi,
 				struct bio *bio, enum page_type type);
+int f2fs_init_write_merge_io(struct f2fs_sb_info *sbi);
 void f2fs_submit_merged_write(struct f2fs_sb_info *sbi, enum page_type type);
 void f2fs_submit_merged_write_cond(struct f2fs_sb_info *sbi,
 				struct inode *inode, struct page *page,
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 912e99bc92e5..557c68956240 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4070,30 +4070,9 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	set_sbi_flag(sbi, SBI_POR_DOING);
 	spin_lock_init(&sbi->stat_lock);
 
-	for (i = 0; i < NR_PAGE_TYPE; i++) {
-		int n = (i == META) ? 1 : NR_TEMP_TYPE;
-		int j;
-
-		sbi->write_io[i] =
-			f2fs_kmalloc(sbi,
-				     array_size(n,
-						sizeof(struct f2fs_bio_info)),
-				     GFP_KERNEL);
-		if (!sbi->write_io[i]) {
-			err = -ENOMEM;
-			goto free_bio_info;
-		}
-
-		for (j = HOT; j < n; j++) {
-			init_f2fs_rwsem(&sbi->write_io[i][j].io_rwsem);
-			sbi->write_io[i][j].sbi = sbi;
-			sbi->write_io[i][j].bio = NULL;
-			spin_lock_init(&sbi->write_io[i][j].io_lock);
-			INIT_LIST_HEAD(&sbi->write_io[i][j].io_list);
-			INIT_LIST_HEAD(&sbi->write_io[i][j].bio_list);
-			init_f2fs_rwsem(&sbi->write_io[i][j].bio_list_lock);
-		}
-	}
+	err = f2fs_init_write_merge_io(sbi);
+	if (err)
+		goto free_bio_info;
 
 	init_f2fs_rwsem(&sbi->cp_rwsem);
 	init_f2fs_rwsem(&sbi->quota_sem);
-- 
2.31.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
