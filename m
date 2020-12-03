Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D32522CCD56
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Dec 2020 04:33:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkfNH-0002nv-4V; Thu, 03 Dec 2020 03:33:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kkfNF-0002no-MP
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 03:33:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iznV7FbIvtImhDNzpGwJ7zSw0TWZ36xYiBwcYPuQwTw=; b=WY7kzC020pnaOY/G3kUeRELZiM
 QqpAtrqSd9aP5/dUcyUK8FsLry7CoSr68ZnGIEvxd0/EXsysC+crsNURS1JHpzdaiCT7BIP2v1yGH
 Slu25NtHE6tB0NXN+80UD8iQZg9129T1v/R2B6K2inHb9WHgzBiOGW/gGJJLwtZq8UGQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=iznV7FbIvtImhDNzpGwJ7zSw0TWZ36xYiBwcYPuQwTw=; b=l
 FcAJiLjrKB8HqASj4wOAIQ1llmOTxWVYXqqNHSn/6qHHOT4DJ1icnM2yZQI1+S9lleAW4fzxbijIH
 pqMnf9Bh8mAbZV7gP2x+hhlEXWWMt1v4rBCPIQIcGFp86iqYhBsaEXb2jUKc4GbyaeuMgl/fRR0Kh
 fPC8k7ggFYEONHM4=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kkfN5-00CXG2-SA
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 03:33:41 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CmhHZ2HnbzhhMd;
 Thu,  3 Dec 2020 11:32:58 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Thu, 3 Dec 2020 11:33:14 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Thu, 3 Dec 2020 11:33:09 +0800
Message-ID: <20201203033309.42734-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1kkfN5-00CXG2-SA
Subject: [f2fs-dev] [PATCH] f2fs: compress: deny setting unsupported
 compress algorithm
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

If kernel doesn't support certain kinds of compress algorithm, deny to
set them as compress algorithm of f2fs via 'compress_algorithm=%s' mount
option.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/super.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 6e186e365efc..1b9d2592b1ac 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -504,15 +504,10 @@ static int f2fs_compress_set_level(struct f2fs_sb_info *sbi, const char *str,
 		return 0;
 #endif
 	} else if (type == COMPRESS_ZSTD) {
-#ifdef CONFIG_F2FS_FS_ZSTD
 		if (!level || level > ZSTD_maxCLevel()) {
 			f2fs_info(sbi, "invalid zstd compress level: %d", level);
 			return -EINVAL;
 		}
-#else
-		f2fs_info(sbi, "doesn't support zstd compression");
-		return 0;
-#endif
 	}
 	F2FS_OPTION(sbi).compress_level = level;
 	return 0;
@@ -937,9 +932,14 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			if (!name)
 				return -ENOMEM;
 			if (!strcmp(name, "lzo")) {
+#ifdef CONFIG_F2FS_FS_LZO
 				F2FS_OPTION(sbi).compress_algorithm =
 								COMPRESS_LZO;
+#else
+				f2fs_info(sbi, "Image doesn't support lzo compression");
+#endif
 			} else if (!strncmp(name, "lz4", 3)) {
+#ifdef CONFIG_F2FS_FS_LZ4
 				ret = f2fs_compress_set_level(sbi, name,
 								COMPRESS_LZ4);
 				if (ret) {
@@ -948,7 +948,11 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 				}
 				F2FS_OPTION(sbi).compress_algorithm =
 								COMPRESS_LZ4;
+#else
+				f2fs_info(sbi, "Image doesn't support lz4 compression");
+#endif
 			} else if (!strncmp(name, "zstd", 4)) {
+#ifdef CONFIG_F2FS_FS_ZSTD
 				ret = f2fs_compress_set_level(sbi, name,
 								COMPRESS_ZSTD);
 				if (ret) {
@@ -957,9 +961,16 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 				}
 				F2FS_OPTION(sbi).compress_algorithm =
 								COMPRESS_ZSTD;
+#else
+				f2fs_info(sbi, "Image doesn't support zstd compression");
+#endif
 			} else if (!strcmp(name, "lzo-rle")) {
+#ifdef CONFIG_F2FS_FS_LZORLE
 				F2FS_OPTION(sbi).compress_algorithm =
 								COMPRESS_LZORLE;
+#else
+				f2fs_info(sbi, "Image doesn't support lzorle compression");
+#endif
 			} else {
 				kfree(name);
 				return -EINVAL;
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
