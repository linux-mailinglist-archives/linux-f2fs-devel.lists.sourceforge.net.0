Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 166A71FBEA9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2020 21:02:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jlGql-0006Ek-QW; Tue, 16 Jun 2020 19:02:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jlGqj-0006Eb-IQ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Jun 2020 19:02:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p8OVMYzQbfR1s22FV5072+dGydzzv+IYU1liviXN3M0=; b=kMRMNi/fp3YzcvI7htb1LZZq+C
 pFtApwRwmc/ckb8KqrVW+A46RQtgaAxRwj7vcBnM45rK/xUqf5+WNidndieZ3SRbou3Xql33KxjLL
 r6GfUZouCdzozpdvqE9oLn09qDmh7KhNi5NXjuC/6ilIu1EQ8PQalJhXxbPXccrMa74c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=p8OVMYzQbfR1s22FV5072+dGydzzv+IYU1liviXN3M0=; b=a
 zjXTNaLV/DfRaxHSAEVOPEynyNWx/VxA2zYpYF79EHyOG5JqCvBUY2x1wEe3llFW1AxNbFFcZN2EU
 2rd4EVFDmftUtjN4cbgqbup046hJxkZMVQob53u3pieweNmX+iVAwc8KVShjDpfl6koA7yarYUKMs
 ufOmKxuIOZ1upcQQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jlGqd-005h4r-Gn
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Jun 2020 19:02:21 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0B7E720B1F;
 Tue, 16 Jun 2020 19:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592334130;
 bh=6C54LEMm6tqkAKhNPEqK9zytbvYMYwufDD8ydBfabkU=;
 h=From:To:Cc:Subject:Date:From;
 b=uwNu/TASBPqqXi5PzxB79pLj2zqp321gHhSiY79uM113hFDQqa6Ad4+Z2Z9EmaFfF
 hp9DBtOlWGbAMDqs6bGhlngfiMV5d2xB7wCN4S5ooL4DPg0GatCCfeqnvl2Ce2ht0i
 Lds5H2EJwxMuuQncnDEfCDUFytWCAY+BdUuhtz18=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue, 16 Jun 2020 12:02:08 -0700
Message-Id: <20200616190208.206595-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.27.0.290.gba653c62da-goog
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
X-Headers-End: 1jlGqd-005h4r-Gn
Subject: [f2fs-dev] [PATCH] f2fs: avoid checkpatch error
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

ERROR:INITIALISED_STATIC: do not initialise statics to NULL

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/compress.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 1e02a8c106b0a..4dca9e4567348 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -506,7 +506,7 @@ bool f2fs_is_compress_backend_ready(struct inode *inode)
 	return f2fs_cops[F2FS_I(inode)->i_compress_algorithm];
 }
 
-static mempool_t *compress_page_pool = NULL;
+static mempool_t *compress_page_pool;
 static int num_compress_pages = 512;
 module_param(num_compress_pages, uint, 0444);
 MODULE_PARM_DESC(num_compress_pages,
-- 
2.27.0.290.gba653c62da-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
