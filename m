Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB602D3B65
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Dec 2020 07:25:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmsvA-0002mu-PE; Wed, 09 Dec 2020 06:25:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kmsv7-0002lz-IZ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Dec 2020 06:25:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MbqYEnSIIySQYFTig2D7YXPDFe3rLebmdHXiSAdEZx4=; b=PTmxNW4ZgzoC+iOxtmmHAlfcek
 JXtRh5SfRPEVdy7TEQN9mMBfd5jOb3ejyRTDyAo3MWXJqF1vY8LAxC6hSzrYXeyd5JItMyHOSTCRS
 qLTM9GO8TbKIWUMle989HbVUFkoyXHkStQwB1JCc7o+Yqh/tTpkYaXdPCYge/7BJjJu0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MbqYEnSIIySQYFTig2D7YXPDFe3rLebmdHXiSAdEZx4=; b=LI1oqb9ndLJFwW7rYL6HPXj4fE
 EIHYEFnHBzD+EheOEiCY4px+G3rhqR7xgG43J5tOk9gOe9qM5UZ+AVDfNPJgyOTNnjn92sLOrhTgX
 HCW+l55XVQkTmXWBwXvTzCQowDLP7qssIJhaulEf+VkutmyfjGiArInUwmu++jGf1lZc=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmsuv-007QnP-AZ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Dec 2020 06:25:49 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CrRq84pStz7Bhp;
 Wed,  9 Dec 2020 14:24:52 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Wed, 9 Dec 2020 14:25:16 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Wed, 9 Dec 2020 14:24:55 +0800
Message-ID: <20201209062457.111907-4-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201209062457.111907-1-yuchao0@huawei.com>
References: <20201209062457.111907-1-yuchao0@huawei.com>
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
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kmsuv-007QnP-AZ
Subject: [f2fs-dev] [PATCH RESEND 4/6] f2fs: compress: deny setting
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
index 8637196dec7c..d128b5cb763d 100644
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
