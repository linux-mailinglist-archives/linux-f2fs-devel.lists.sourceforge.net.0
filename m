Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C3016A4C7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Feb 2020 12:20:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6BnD-0005Q4-0Z; Mon, 24 Feb 2020 11:20:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j6BnB-0005Pr-8S
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 11:20:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RwaFgbX+pbOI9qFi+MUvItEY234CheDsnBkoN1N1uHM=; b=MGnPEiFUWJOl8s4z0bd1q8xWfm
 hsse8t2LiHkrczmNvcSfy10VeRKLigDKwPCALXSLlclXod49mhEVFWkhUSqa4KoSaV59vtBq3cmLc
 HpgcntjzKhE45rohQWWgHRd/ZRieSpaxX0LHun+CTqgp+1bW9INoxsBwWJsVvPoMyPmE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RwaFgbX+pbOI9qFi+MUvItEY234CheDsnBkoN1N1uHM=; b=mHddp8A/4NTRH94wW7WRPCU44o
 JoASmdbOr2UiJBbyc5R9rABpZdPqvu1KXxVPINSYapWn1HeedwVmtZFikmOsqJfRt+azxAAynkBY0
 c31/Tr+RflRS91cn9N61SPUFD1Xu59+oK83bqXoGCR7g3dSpwoKB4IsgAZR4W0L2zTso=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j6Bn8-00F19A-Mc
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 11:20:53 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 7472383E962AEED00A5C;
 Mon, 24 Feb 2020 19:20:36 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.439.0; Mon, 24 Feb 2020 19:20:28 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 24 Feb 2020 19:20:18 +0800
Message-ID: <20200224112019.93829-4-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
In-Reply-To: <20200224112019.93829-1-yuchao0@huawei.com>
References: <20200224112019.93829-1-yuchao0@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1j6Bn8-00F19A-Mc
Subject: [f2fs-dev] [PATCH 4/5] f2fs: recycle unused compress_data.chksum
 feild
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

In Struct compress_data, chksum field was never used, remove it.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/compress.c | 1 -
 fs/f2fs/f2fs.h     | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 864035549329..e8b88f7bb7a5 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -380,7 +380,6 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 	}
 
 	cc->cbuf->clen = cpu_to_le32(cc->clen);
-	cc->cbuf->chksum = cpu_to_le32(0);
 
 	for (i = 0; i < COMPRESS_DATA_RESERVED_SIZE; i++)
 		cc->cbuf->reserved[i] = cpu_to_le32(0);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 468f807fd917..bd264d8cddaf 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1233,10 +1233,9 @@ enum compress_algorithm_type {
 	COMPRESS_MAX,
 };
 
-#define COMPRESS_DATA_RESERVED_SIZE		4
+#define COMPRESS_DATA_RESERVED_SIZE		5
 struct compress_data {
 	__le32 clen;			/* compressed data size */
-	__le32 chksum;			/* checksum of compressed data */
 	__le32 reserved[COMPRESS_DATA_RESERVED_SIZE];	/* reserved */
 	u8 cdata[];			/* compressed data */
 };
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
