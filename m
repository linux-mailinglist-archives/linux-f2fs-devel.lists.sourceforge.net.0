Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A22C03CB8E8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Jul 2021 16:41:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m4P1R-0004uh-DM; Fri, 16 Jul 2021 14:41:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1m4P1P-0004u2-8k
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Jul 2021 14:40:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=svk8U969b5FypaB8jOWdYM8DxzQzM02tdanstTGrqD8=; b=ak4ugS7as55FpJQ4BHSd4j7v1Z
 wyTqCy7F+lDQA5u66lKPdUMB4A5w6qe9rmY2EA8dQ5ERt2Q5f0RYs+K4NhRQAo9pAbARqvSoUtC78
 3vnc1yS49jD1B6/QeNNhXngoySXs7EMqSAmKAAEDU5ORdlO039qrq4EBpCbasWR+QUqE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=svk8U969b5FypaB8jOWdYM8DxzQzM02tdanstTGrqD8=; b=aKgvhtzEmpA2VXV2MLzO/wZteY
 imeE10xdeG1bPkq/CVb7xhXjNVMOgP7ec0npjKVUmz795zxkSsgM9kovW24272rLwieJRury6dpF4
 ZWjvzC3/n2LfF93VKUYkbn5bOAZ3R4RQvfcsuQfbwNVIWiRKvBeXhDaNssdw/7Vj4i3A=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m4P1I-0004dz-U0
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Jul 2021 14:40:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC271613F5;
 Fri, 16 Jul 2021 14:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626446443;
 bh=88spGNyluutPzDN0JI8idu1yC06Iuwa4Jxi/++a9CYk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C8doAhLjAan/i8YFRaUfyiowMTh/rN3RihH5HgMt25tD4ewCuPx0CuABVSX22g4VJ
 xH1aGdrzb7tpAC71QjMxpUiC9Z0G6SOihgzj4tX/F+EOMZTdGTOXRf1grUNEJEgfIj
 7dSRGWHqC/qELlDVN9pxOynwhqQCMgVZtaihiF/5b/6BbbGfjz2571fBIUbp70yH8N
 1LKcSJt4RB7Y9wioN85kJZ8tAgMKHTgFRf9byyKCLcnlpp3S3q245wplxyJGAQR5Lq
 qKIcgfBOHQs7pRiQe6HCVw8dp2Hg+JnwxuDNbEzM2hPHDbwgxOIMhpgcTGZGdnwTPg
 5vGFchRbPDU+w==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>
Date: Fri, 16 Jul 2021 09:39:11 -0500
Message-Id: <20210716143919.44373-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210716143919.44373-1-ebiggers@kernel.org>
References: <20210716143919.44373-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m4P1I-0004dz-U0
Subject: [f2fs-dev] [PATCH 1/9] f2fs: make f2fs_write_failed() take struct
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
Cc: linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
 Matthew Bobrowski <mbobrowski@mbobrowski.org>,
 Satya Tangirala <satyaprateek2357@gmail.com>,
 Changheun Lee <nanich.lee@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Make f2fs_write_failed() take a 'struct inode' directly rather than a
'struct address_space', as this simplifies it slightly.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/data.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d2cf48c5a2e4..c478964a5695 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3176,9 +3176,8 @@ static int f2fs_write_data_pages(struct address_space *mapping,
 			FS_CP_DATA_IO : FS_DATA_IO);
 }
 
-static void f2fs_write_failed(struct address_space *mapping, loff_t to)
+static void f2fs_write_failed(struct inode *inode, loff_t to)
 {
-	struct inode *inode = mapping->host;
 	loff_t i_size = i_size_read(inode);
 
 	if (IS_NOQUOTA(inode))
@@ -3410,7 +3409,7 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
 
 fail:
 	f2fs_put_page(page, 1);
-	f2fs_write_failed(mapping, pos + len);
+	f2fs_write_failed(inode, pos + len);
 	if (drop_atomic)
 		f2fs_drop_inmem_pages_all(sbi, false);
 	return err;
@@ -3600,7 +3599,7 @@ static ssize_t f2fs_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
 			f2fs_update_iostat(F2FS_I_SB(inode), APP_DIRECT_IO,
 						count - iov_iter_count(iter));
 		} else if (err < 0) {
-			f2fs_write_failed(mapping, offset + count);
+			f2fs_write_failed(inode, offset + count);
 		}
 	} else {
 		if (err > 0)
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
