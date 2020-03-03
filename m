Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB881771A7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Mar 2020 09:57:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j93Mq-0001Qh-4C; Tue, 03 Mar 2020 08:57:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j93Mo-0001QV-9E
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Mar 2020 08:57:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QLaGdsS+TbfKUifCXg77+ckABdHrJDsQU7RuFZf71AY=; b=f9UvQnIWL4q7o/4DB5FaLUHq9Q
 zz2JF4mQ+TKy/F/AAQxOOaGczjEeB8tpyLEmBM/DV4tLN1/Tk+bN1IO417zizKtSQiVgHJ2ZpkqRN
 SX7uBS+XrwE7jE7xrgMQ5Pug7v+6EmR3OutFJQiS2ChP/qU0D0473Ueosx/aOaZBQIsE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QLaGdsS+TbfKUifCXg77+ckABdHrJDsQU7RuFZf71AY=; b=N7RD6/IT77m//JurqtSWzqIis7
 okFMSiIOdv7dWnzubJmHTunlmAUgYSCr/BN46y9Rfwg3a7cjkXbKkfKgTWUFRP7NoSGxyWiX4LvoV
 uO1NQWw09g6ADbg87OyL1zNvgJSJH/M3Dk65SOIS/fy1bf9Hpvf+NFD8B8F/bGp39Q4Q=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j93Mm-00BmlU-Np
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Mar 2020 08:57:30 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id C58212A6F2CE941394F8;
 Tue,  3 Mar 2020 16:57:20 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.439.0; Tue, 3 Mar 2020 16:57:10 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 3 Mar 2020 16:57:07 +0800
Message-ID: <20200303085707.45104-2-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
In-Reply-To: <20200303085707.45104-1-yuchao0@huawei.com>
References: <20200303085707.45104-1-yuchao0@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1j93Mm-00BmlU-Np
Subject: [f2fs-dev] [PATCH 2/2] f2fs: compress: add .{init,
 destroy}_decompress_ctx callback
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

Add below two callback interfaces in struct f2fs_compress_ops:

	int (*init_decompress_ctx)(struct decompress_io_ctx *dic);
	void (*destroy_decompress_ctx)(struct decompress_io_ctx *dic);

Which will be used by zstd compress algorithm later.

In addition, this patch adds callback function pointer check, so that
specified algorithm can avoid defining unneeded functions.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/compress.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index b373102ed4af..6688fe091281 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -20,6 +20,8 @@ struct f2fs_compress_ops {
 	int (*init_compress_ctx)(struct compress_ctx *cc);
 	void (*destroy_compress_ctx)(struct compress_ctx *cc);
 	int (*compress_pages)(struct compress_ctx *cc);
+	int (*init_decompress_ctx)(struct decompress_io_ctx *dic);
+	void (*destroy_decompress_ctx)(struct decompress_io_ctx *dic);
 	int (*decompress_pages)(struct decompress_io_ctx *dic);
 };
 
@@ -334,9 +336,11 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 	trace_f2fs_compress_pages_start(cc->inode, cc->cluster_idx,
 				cc->cluster_size, fi->i_compress_algorithm);
 
-	ret = cops->init_compress_ctx(cc);
-	if (ret)
-		goto out;
+	if (cops->init_compress_ctx) {
+		ret = cops->init_compress_ctx(cc);
+		if (ret)
+			goto out;
+	}
 
 	max_len = COMPRESS_HEADER_SIZE + cc->clen;
 	cc->nr_cpages = DIV_ROUND_UP(max_len, PAGE_SIZE);
@@ -398,7 +402,8 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 		cc->cpages[i] = NULL;
 	}
 
-	cops->destroy_compress_ctx(cc);
+	if (cops->destroy_compress_ctx)
+		cops->destroy_compress_ctx(cc);
 
 	cc->nr_cpages = nr_cpages;
 
@@ -418,7 +423,8 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 	kfree(cc->cpages);
 	cc->cpages = NULL;
 destroy_compress_ctx:
-	cops->destroy_compress_ctx(cc);
+	if (cops->destroy_compress_ctx)
+		cops->destroy_compress_ctx(cc);
 out:
 	trace_f2fs_compress_pages_end(cc->inode, cc->cluster_idx,
 							cc->clen, ret);
@@ -452,10 +458,16 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
 		goto out_free_dic;
 	}
 
+	if (cops->init_decompress_ctx) {
+		ret = cops->init_decompress_ctx(dic);
+		if (ret)
+			goto out_free_dic;
+	}
+
 	dic->rbuf = vmap(dic->tpages, dic->cluster_size, VM_MAP, PAGE_KERNEL);
 	if (!dic->rbuf) {
 		ret = -ENOMEM;
-		goto out_free_dic;
+		goto destroy_decompress_ctx;
 	}
 
 	dic->cbuf = vmap(dic->cpages, dic->nr_cpages, VM_MAP, PAGE_KERNEL_RO);
@@ -478,6 +490,9 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
 	vunmap(dic->cbuf);
 out_vunmap_rbuf:
 	vunmap(dic->rbuf);
+destroy_decompress_ctx:
+	if (cops->destroy_decompress_ctx)
+		cops->destroy_decompress_ctx(dic);
 out_free_dic:
 	if (!verity)
 		f2fs_decompress_end_io(dic->rpages, dic->cluster_size,
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
