Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 437EF1844DB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2020 11:27:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jChXc-0004Fq-9r; Fri, 13 Mar 2020 10:27:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jChXb-0004Ff-7H
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Mar 2020 10:27:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=97GkqtsQf5qucIqVYfj3uAkQkQ6hxQ50pZYJSsUjJIk=; b=Sm0VKcqlRlhwYHPan4sEFMt7OG
 kStS4b/z3A3SHm+rIUof2Hj6KJ4EqjmfGjF43yXriEZMl9yHgasaLS2SB+AqYWST7J2IPl3hJVACK
 /e6VVLJ1VFv8S1F3UR9yNw+/8XIpVcMJsxeKb1gfwiIzK/KMki7yw/2FbrERXGTjrVNA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=97GkqtsQf5qucIqVYfj3uAkQkQ6hxQ50pZYJSsUjJIk=; b=B
 DWFpDg8M0IsSsXSVWrIA3Ts2184i67l6M5Zs9YOwFKa7TKCvO3Wn0KvK6cr4T8Sv+s2XnxcBP9GBr
 PlsM/2UPZHYHcVhkD8vVNijBryUlDvokkI7LSATep/5ia1tQYvb/D6o2fbfsXuPP6V9lZkLZmt6K0
 +ZPgxMyJhCiby/Rw=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jChXX-0004hY-Fh
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Mar 2020 10:27:43 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 096E12A12EEA7BB4DAD2;
 Fri, 13 Mar 2020 18:27:29 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Fri, 13 Mar 2020 18:27:22 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 13 Mar 2020 18:27:20 +0800
Message-ID: <20200313102720.6742-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jChXX-0004hY-Fh
Subject: [f2fs-dev] [PATCH] f2fs: support partial truncation on compressed
 inode
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

Supports to truncate compressed/normal cluster partially on compressed
inode.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/compress.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++
 fs/f2fs/f2fs.h     |  2 ++
 fs/f2fs/file.c     | 19 +++++++++++++-----
 3 files changed, 64 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 744ce2eb6ca7..659c77155ef7 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -956,6 +956,54 @@ bool f2fs_compress_write_end(struct inode *inode, void *fsdata,
 	return first_index;
 }
 
+int f2fs_truncate_partial_cluster(struct inode *inode, u64 from, bool lock)
+{
+	void *fsdata = NULL;
+	struct page *pagep;
+	int log_cluster_size = F2FS_I(inode)->i_log_cluster_size;
+	pgoff_t start_idx = from >> (PAGE_SHIFT + log_cluster_size);
+	int err;
+
+	err = f2fs_is_compressed_cluster(inode, start_idx);
+	if (err < 0)
+		return err;
+
+	/* truncate normal cluster */
+	if (!err)
+		return f2fs_do_truncate_blocks(inode, from, lock);
+
+	/* truncate compressed cluster */
+	err = f2fs_prepare_compress_overwrite(inode, &pagep,
+						start_idx, &fsdata);
+
+	/* should not be a normal cluster */
+	f2fs_bug_on(F2FS_I_SB(inode), err == 0);
+
+	if (err <= 0)
+		return err;
+
+	if (err > 0) {
+		struct page **rpages = fsdata;
+		int cluster_size = F2FS_I(inode)->i_cluster_size;
+		int i;
+
+		for (i = cluster_size - 1; i >= 0; i--) {
+			loff_t start = rpages[i]->index << PAGE_SHIFT;
+
+			if (from <= start) {
+				zero_user_segment(rpages[i], 0, PAGE_SIZE);
+			} else {
+				zero_user_segment(rpages[i], from - start,
+								PAGE_SIZE);
+				break;
+			}
+		}
+
+		f2fs_compress_write_end(inode, fsdata, start_idx, true);
+	}
+	return 0;
+}
+
 static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 					int *submitted,
 					struct writeback_control *wbc,
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 76d2a99520bf..f5c55c966ed7 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3076,6 +3076,7 @@ static inline void f2fs_clear_page_private(struct page *page)
  */
 int f2fs_sync_file(struct file *file, loff_t start, loff_t end, int datasync);
 void f2fs_truncate_data_blocks(struct dnode_of_data *dn);
+int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock);
 int f2fs_truncate_blocks(struct inode *inode, u64 from, bool lock);
 int f2fs_truncate(struct inode *inode);
 int f2fs_getattr(const struct path *path, struct kstat *stat,
@@ -3796,6 +3797,7 @@ int f2fs_prepare_compress_overwrite(struct inode *inode,
 			struct page **pagep, pgoff_t index, void **fsdata);
 bool f2fs_compress_write_end(struct inode *inode, void *fsdata,
 					pgoff_t index, unsigned copied);
+int f2fs_truncate_partial_cluster(struct inode *inode, u64 from, bool lock);
 void f2fs_compress_write_end_io(struct bio *bio, struct page *page);
 bool f2fs_is_compress_backend_ready(struct inode *inode);
 void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 8dfbcf3b4c4c..257b3b629ee1 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -646,9 +646,6 @@ static int truncate_partial_data_page(struct inode *inode, u64 from,
 		return 0;
 	}
 
-	if (f2fs_compressed_file(inode))
-		return 0;
-
 	page = f2fs_get_lock_data_page(inode, index, true);
 	if (IS_ERR(page))
 		return PTR_ERR(page) == -ENOENT ? 0 : PTR_ERR(page);
@@ -664,7 +661,7 @@ static int truncate_partial_data_page(struct inode *inode, u64 from,
 	return 0;
 }
 
-static int do_truncate_blocks(struct inode *inode, u64 from, bool lock)
+int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct dnode_of_data dn;
@@ -732,7 +729,9 @@ static int do_truncate_blocks(struct inode *inode, u64 from, bool lock)
 int f2fs_truncate_blocks(struct inode *inode, u64 from, bool lock)
 {
 	u64 free_from = from;
+	int err;
 
+#ifdef CONFIG_F2FS_FS_COMPRESSION
 	/*
 	 * for compressed file, only support cluster size
 	 * aligned truncation.
@@ -747,8 +746,18 @@ int f2fs_truncate_blocks(struct inode *inode, u64 from, bool lock)
 			free_from++;
 		free_from <<= cluster_shift;
 	}
+#endif
+
+	err = f2fs_do_truncate_blocks(inode, free_from, lock);
+	if (err)
+		return err;
+
+#ifdef CONFIG_F2FS_FS_COMPRESSION
+	if (from != free_from)
+		err = f2fs_truncate_partial_cluster(inode, from, lock);
+#endif
 
-	return do_truncate_blocks(inode, free_from, lock);
+	return err;
 }
 
 int f2fs_truncate(struct inode *inode)
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
