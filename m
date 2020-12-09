Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A0C2D3DC3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Dec 2020 09:44:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmv5A-0002qV-Lz; Wed, 09 Dec 2020 08:44:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kmv5A-0002qM-28
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Dec 2020 08:44:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RGvXrE8BrACGIvb26r90e+sh2ME9Tisq2RPdl1WBt08=; b=XKTv4wopvml8TLhjHluTxSvKNz
 VTRzAWQEdKr3q62740ukpxTqOZ/g7O7dKUeuJmcO9lM3Vu80t3Hj1Sr2KkcTqNPJeVDiO2pTSCfkm
 p46OMWicFTIFTBZV2ZEll/gNyWqCNaY4TBbrEp9vTTAFcNj8fsgvFFHLOJYeKVomM7tY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RGvXrE8BrACGIvb26r90e+sh2ME9Tisq2RPdl1WBt08=; b=V+kZdMMq/t1QgIDTnitFTn2wHe
 jxhoRyQaciEnE/gV96hD/YibYtl/bI0lqvtwRKxlOwQJnQ417d/8ARe02qySBWRoRKcgZSs+uTJPE
 AirU4DAvjbEC0RD/iy72Z7noL/7wSAMtJkcAUbpwhzfHi9btXkcK4osuSun9qOPgwkXI=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmv51-007X1A-I5
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Dec 2020 08:44:19 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CrVtr1kDLzkmFM;
 Wed,  9 Dec 2020 16:43:16 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Wed, 9 Dec 2020 16:43:46 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Wed, 9 Dec 2020 16:43:26 +0800
Message-ID: <20201209084328.30416-3-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201209084328.30416-1-yuchao0@huawei.com>
References: <20201209084328.30416-1-yuchao0@huawei.com>
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
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kmv51-007X1A-I5
Subject: [f2fs-dev] [PATCH RESEND v2 3/5] f2fs: compress: deny setting
 unsupported compress algorithm
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

If kernel doesn't support certain kinds of compress algorithm, deny to set
them as compress algorithm of f2fs via 'compress_algorithm=%s' mount option.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/super.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 7c5c880a97be..fe077ef88768 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -936,9 +936,14 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			if (!name)
 				return -ENOMEM;
 			if (!strcmp(name, "lzo")) {
+#ifdef CONFIG_F2FS_FS_LZO
 				F2FS_OPTION(sbi).compress_algorithm =
 								COMPRESS_LZO;
+#else
+				f2fs_info(sbi, "kernel doesn't support lzo compression");
+#endif
 			} else if (!strncmp(name, "lz4", 3)) {
+#ifdef CONFIG_F2FS_FS_LZ4
 				ret = f2fs_compress_set_level(sbi, name,
 								COMPRESS_LZ4);
 				if (ret) {
@@ -947,7 +952,11 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 				}
 				F2FS_OPTION(sbi).compress_algorithm =
 								COMPRESS_LZ4;
+#else
+				f2fs_info(sbi, "kernel doesn't support lz4 compression");
+#endif
 			} else if (!strncmp(name, "zstd", 4)) {
+#ifdef CONFIG_F2FS_FS_ZSTD
 				ret = f2fs_compress_set_level(sbi, name,
 								COMPRESS_ZSTD);
 				if (ret) {
@@ -956,9 +965,16 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 				}
 				F2FS_OPTION(sbi).compress_algorithm =
 								COMPRESS_ZSTD;
+#else
+				f2fs_info(sbi, "kernel doesn't support zstd compression");
+#endif
 			} else if (!strcmp(name, "lzo-rle")) {
+#ifdef CONFIG_F2FS_FS_LZORLE
 				F2FS_OPTION(sbi).compress_algorithm =
 								COMPRESS_LZORLE;
+#else
+				f2fs_info(sbi, "kernel doesn't support lzorle compression");
+#endif
 			} else {
 				kfree(name);
 				return -EINVAL;
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
