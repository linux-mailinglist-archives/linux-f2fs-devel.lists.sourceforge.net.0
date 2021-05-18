Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1B738792E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 May 2021 14:51:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lizCH-0000rn-Ce; Tue, 18 May 2021 12:51:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1lizCF-0000rc-Bw
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 May 2021 12:51:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BiKuXplenooUbZ84yuaUGnur17xxjUNpCG7qa5qJHGM=; b=Qg05u0FIKcYy0GGaianQRc3P02
 eiZ0eZ4YtnYaFvOkpbVa0Of8wnSdCT7cY+uz55Ol+njMvg80Ib53ijjgV/8IFKWi6I5OJJuD2/SWO
 JhfDf9lKz586NbMZPwsE93BEkiEcW4eJlrX5mXikigV9iPiEJi1joCsYog013YnlKSPw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=BiKuXplenooUbZ84yuaUGnur17xxjUNpCG7qa5qJHGM=; b=K
 pCwCOmC0CHGkoa9XQUOn0rz9g/5ulokmyVxQ7SOn8XKQK9OTwjAkxL83Ypv3kRAXLuvlDy2cVg+IJ
 1pFrRn0I4MI0/ZRyJkjDDU4BTLlTExbwn8La5TXxS24tJwPjnXg/mBRqYRoc6pLOrRSmdV6PjDvAR
 mwiRAPNbteZPB4ec=;
Received: from mail-m17635.qiye.163.com ([59.111.176.35])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lizCB-00CgOd-1q
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 May 2021 12:51:41 +0000
Received: from SZ-11126892.vivo.xyz (unknown [58.251.74.232])
 by mail-m17635.qiye.163.com (Hmail) with ESMTPA id F12F140086A;
 Tue, 18 May 2021 20:51:24 +0800 (CST)
From: Fengnan Chang <changfengnan@vivo.com>
To: jaegeuk@kernel.org, chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 18 May 2021 20:51:13 +0800
Message-Id: <20210518125113.1712-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.29.2.windows.2
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQ0xKTFZLHx4eTEpNGExLQhpVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 9ISFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NCo6PQw*Lz8VQitIQxMjUQgo
 PTEKCx5VSlVKTUlKSE9JSUNOT0lJVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WU5DVUlOSlVMT1VJSElZV1kIAVlBTktKQzcG
X-HM-Tid: 0a797f87ed41d991kuwsf12f140086a
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [59.111.176.35 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [59.111.176.35 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lizCB-00CgOd-1q
Subject: [f2fs-dev] [RFC PATCH] f2fs: compress: remove unneeded read when
 rewrite whole cluster
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
Cc: Fengnan Chang <changfengnan@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

For now,when overwrite compressed file, we need read old data to page
cache first and update pages.
But when we need overwrite whole cluster, we don't need old data
anymore.
So, I think we can remove read data  process in this case, I have made
some simple changes to test, tests have shown that this can lead to
significant performance improvements, the speed of sequential write
up to 2x.

I haven't figured out the whole process yet,so the following
modification is a simple and crude, any suggestions are welcome.
I want to know if this idea is workable,if so, I will continue to
improve this patch.
Thanks.

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/compress.c | 12 ++++++------
 fs/f2fs/data.c     |  4 ++--
 fs/f2fs/f2fs.h     |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 925a5ca3744a..7056c009ee9a 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -990,7 +990,7 @@ static void set_cluster_dirty(struct compress_ctx *cc)
 }
 
 static int prepare_compress_overwrite(struct compress_ctx *cc,
-		struct page **pagep, pgoff_t index, void **fsdata)
+		struct page **pagep, pgoff_t index, void **fsdata, int len)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(cc->inode);
 	struct address_space *mapping = cc->inode->i_mapping;
@@ -1007,6 +1007,8 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 	if (ret <= 0)
 		return ret;
 
+	if (len == PAGE_SIZE)
+		return 0;
 	/* compressed case */
 	prealloc = (ret < cc->cluster_size);
 
@@ -1045,7 +1047,6 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 		if (ret)
 			goto out;
 	}
-
 	for (i = 0; i < cc->cluster_size; i++) {
 		f2fs_bug_on(sbi, cc->rpages[i]);
 
@@ -1101,7 +1102,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 }
 
 int f2fs_prepare_compress_overwrite(struct inode *inode,
-		struct page **pagep, pgoff_t index, void **fsdata)
+		struct page **pagep, pgoff_t index, void **fsdata, int len)
 {
 	struct compress_ctx cc = {
 		.inode = inode,
@@ -1111,8 +1112,7 @@ int f2fs_prepare_compress_overwrite(struct inode *inode,
 		.rpages = NULL,
 		.nr_rpages = 0,
 	};
-
-	return prepare_compress_overwrite(&cc, pagep, index, fsdata);
+	return prepare_compress_overwrite(&cc, pagep, index, fsdata, len);
 }
 
 bool f2fs_compress_write_end(struct inode *inode, void *fsdata,
@@ -1155,7 +1155,7 @@ int f2fs_truncate_partial_cluster(struct inode *inode, u64 from, bool lock)
 
 	/* truncate compressed cluster */
 	err = f2fs_prepare_compress_overwrite(inode, &pagep,
-						start_idx, &fsdata);
+						start_idx, &fsdata, 0);
 
 	/* should not be a normal cluster */
 	f2fs_bug_on(F2FS_I_SB(inode), err == 0);
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 009a09fb9d88..9a6b82d8f278 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2916,7 +2916,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 
 					ret2 = f2fs_prepare_compress_overwrite(
 							inode, &pagep,
-							page->index, &fsdata);
+							page->index, &fsdata, 0);
 					if (ret2 < 0) {
 						ret = ret2;
 						done = 1;
@@ -3307,7 +3307,7 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
 		*fsdata = NULL;
 
 		ret = f2fs_prepare_compress_overwrite(inode, pagep,
-							index, fsdata);
+							index, fsdata, len);
 		if (ret < 0) {
 			err = ret;
 			goto fail;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c83d90125ebd..8d4fedf0291b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3932,7 +3932,7 @@ static inline bool f2fs_post_read_required(struct inode *inode)
 bool f2fs_is_compressed_page(struct page *page);
 struct page *f2fs_compress_control_page(struct page *page);
 int f2fs_prepare_compress_overwrite(struct inode *inode,
-			struct page **pagep, pgoff_t index, void **fsdata);
+			struct page **pagep, pgoff_t index, void **fsdata, int len);
 bool f2fs_compress_write_end(struct inode *inode, void *fsdata,
 					pgoff_t index, unsigned copied);
 int f2fs_truncate_partial_cluster(struct inode *inode, u64 from, bool lock);
-- 
2.29.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
