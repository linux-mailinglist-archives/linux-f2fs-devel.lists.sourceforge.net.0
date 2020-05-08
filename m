Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F841CA77F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 May 2020 11:47:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jWzbY-0004zy-4f; Fri, 08 May 2020 09:47:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jWzbW-0004zi-JX
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 May 2020 09:47:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QF1BnuzJ3QXc14SIXUBiukgAs17ymqqqi7kZf1vo0KY=; b=cmJmCKxZGLThLBGXjMpTCjzUXO
 XX381OKt6QcAxXW7bsFxhMU8SFowUl24GafWTc+HQPtsjjkhEQQTamFspq4cRGEOfjZu1YOILFPEz
 QH8J+48wPQG6cFho/BnD8Cgehb2i0XMLyjiHs0mrrGbvYKM/x/lhP9qnNV1ENvtWuz6A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=QF1BnuzJ3QXc14SIXUBiukgAs17ymqqqi7kZf1vo0KY=; b=C
 yTgd9+VAmv2l5v0HeXP3LoeKfBDDd4oNauPsENinP2XNQ+I84pnW6UhgidBGw/0kq7KWXMFd27697
 VfmJVrbRQpzsllUROTE04Z6NQQz/IadzeFGAsUwUcN9hU9Z+ZBOlt6PoQvgjfjjhX99dOWSHdIscm
 /F1mHsJ20c8z7eKk=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jWzbT-001a0t-4U
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 May 2020 09:47:38 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 5F697D520C64F886C4E0;
 Fri,  8 May 2020 17:47:18 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Fri, 8 May 2020 17:47:11 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 8 May 2020 17:47:09 +0800
Message-ID: <20200508094709.40048-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWzbT-001a0t-4U
Subject: [f2fs-dev] [PATCH] f2fs: compress: allow lz4 to compress data
 partially
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

For lz4 worst compress case, caller should allocate buffer with size
of LZ4_compressBound(inputsize) for target compressed data storing.

However lz4 supports partial data compression, so we can get rid of
output buffer size limitation now, then we can avoid 2 * 4KB size
intermediate buffer allocation when log_cluster_size is 2, and avoid
unnecessary compressing work of compressor if we can not save at
least 4KB space.

Suggested-by: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/compress.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 5e4947250262..23825f559bcf 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -228,7 +228,12 @@ static int lz4_init_compress_ctx(struct compress_ctx *cc)
 	if (!cc->private)
 		return -ENOMEM;
 
-	cc->clen = LZ4_compressBound(PAGE_SIZE << cc->log_cluster_size);
+	/*
+	 * we do not change cc->clen to LZ4_compressBound(inputsize) to
+	 * adapt worst compress case, because lz4 algorithm supports partial
+	 * compression.
+	 */
+	cc->clen = cc->rlen - PAGE_SIZE - COMPRESS_HEADER_SIZE;
 	return 0;
 }
 
@@ -244,11 +249,9 @@ static int lz4_compress_pages(struct compress_ctx *cc)
 
 	len = LZ4_compress_default(cc->rbuf, cc->cbuf->cdata, cc->rlen,
 						cc->clen, cc->private);
-	if (!len) {
-		printk_ratelimited("%sF2FS-fs (%s): lz4 compress failed\n",
-				KERN_ERR, F2FS_I_SB(cc->inode)->sb->s_id);
-		return -EIO;
-	}
+	if (!len)
+		return -EAGAIN;
+
 	cc->clen = len;
 	return 0;
 }
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
