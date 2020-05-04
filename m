Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F02831C3D7B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 May 2020 16:48:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jVcOk-0000OR-TM; Mon, 04 May 2020 14:48:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jVcOj-0000O3-EE
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 04 May 2020 14:48:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xfRf1+Nu1KQ7VKg3sAoxtbOUpd1Vl1YVp4aNBzBltVs=; b=hg3Q2N8nXa6tfFB/xxcEUKlnUP
 u5RY5EYjJ9DcTg9XkwR1aPgzBZaMTzTHdpWBECnGcHNZpxrlVjrN0xt7Z7Hpiv632Xl7bEiDq2KS1
 UnwUJuxn6dLsapB2pDX25d05kBwE4+UKZUaSgcolK2gH3pRCNRMOwrnZZTGmdzkofeVw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xfRf1+Nu1KQ7VKg3sAoxtbOUpd1Vl1YVp4aNBzBltVs=; b=L
 aw+sdOA/5mfmHLbnxPauuskTynOHIYr1OQy4raMSXq7dwwGeQE/BQ7wezGiPYEQEFSa4bhTHtaolH
 QJCBVUtkmwDdJcVImmnxqEaBxUD6vHrkTCBUAIXsJCNJCUm9P2ogipg8FXfW8i6aCQ5ZJtXQESiW3
 LljskdVtxY+RO5Fc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jVcOh-006xZP-J9
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 04 May 2020 14:48:45 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 85F6F20721;
 Mon,  4 May 2020 14:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588602640;
 bh=npyVMpEkCqP47vK/3mKvzs371ZtGgQITkgOQX9mdQjY=;
 h=From:To:Cc:Subject:Date:From;
 b=eEJaD0ZEz5VfWYlWTVpOTos5fOnwiNG3g/saqcrKdLWp78+xQuLIWaK/+6+jzg7A6
 lUVoRHynjtW/MoTSZCXKP4hBWLOgKLvzHTEAx46W/NXdOqsy+yFe3tqORj1sPjyHsV
 VND1zcREbsOSfw7FDmp+OZpATxcM3scDDKAEmXFU=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon,  4 May 2020 07:30:39 -0700
Message-Id: <20200504143039.155644-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jVcOh-006xZP-J9
Subject: [f2fs-dev] [PATCH] f2fs: change maximum zstd compression buffer size
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

Current zstd compression buffer size is one page and header size less
than cluster size. By this, zstd compression always succeeds even if
the real compression data is failed to fit into the buffer size, and
eventually reading the cluster returns I/O error with the corrupted
compression data.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/compress.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 4c7eaeee52336..a9fa8049b295f 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -313,7 +313,7 @@ static int zstd_init_compress_ctx(struct compress_ctx *cc)
 	cc->private = workspace;
 	cc->private2 = stream;
 
-	cc->clen = cc->rlen - PAGE_SIZE - COMPRESS_HEADER_SIZE;
+	cc->clen = ZSTD_compressBound(PAGE_SIZE << cc->log_cluster_size);
 	return 0;
 }
 
@@ -330,7 +330,7 @@ static int zstd_compress_pages(struct compress_ctx *cc)
 	ZSTD_inBuffer inbuf;
 	ZSTD_outBuffer outbuf;
 	int src_size = cc->rlen;
-	int dst_size = src_size - PAGE_SIZE - COMPRESS_HEADER_SIZE;
+	int dst_size = cc->clen;
 	int ret;
 
 	inbuf.pos = 0;
-- 
2.26.2.526.g744177e7f7-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
