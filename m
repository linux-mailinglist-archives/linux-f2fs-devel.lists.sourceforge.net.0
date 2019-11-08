Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A2065F4620
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Nov 2019 12:40:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iT2ck-0005y7-B3; Fri, 08 Nov 2019 11:40:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1iT2cg-0005xa-Om
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 11:40:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1hA3zR0ptoCgSAYShsVa3weLLVnoSbJzucGpDfl0CbM=; b=C4E3SeacREC0EavfDmjo/nI/cA
 3Vdk0wDwbiWbQokPvpO2dSmmEghUDe6Y917gUfR5Hmp1aW9lTzNH5zn34vCIVYq7pMxpuP/LLxDBb
 hJsTA/JBuWokkr88qeozHHYLUNIrDFmdjwy/MzT2uDgnC56M50L60IwjS/X2eHU+Xf6o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1hA3zR0ptoCgSAYShsVa3weLLVnoSbJzucGpDfl0CbM=; b=TOZboABptFa0G/ROod18AKiG8/
 Nqg9g2BUPRtbPGw2mSLYdoU/0yA1dODcwphbXSckGXkVJrx7eXXDr8CHzgCUFPYSAjGbfop35XjE4
 gBnC+/NhiRbRS7sfTBJUyJD4uuLg5sXy1frqwyYTS1G7W2mT8CO6+ggwNsOTRVhedH08=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iT2cd-006UHb-6r
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 11:40:13 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E85E3222CB;
 Fri,  8 Nov 2019 11:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573213205;
 bh=vhKnsVvdS3bhGTQPSXRiTcKVgFkmQF7EkajVkSUKU9w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cuT0LSJRWH9BxciCOiyfBkBQ8Q8lfEQRsflirBUAORibrVmaTXqvQAu1ZTMXHch2Z
 dIqIUZ3lzO1cGMPg+g6Q3qFSz57+cDIXTMi2mfKPSA32t+tApOBXgfxChFDsTE6H64
 Lel5QzVLRIdJdNoGA17zSdJ6+68EXUsl1IEzy940=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri,  8 Nov 2019 06:35:55 -0500
Message-Id: <20191108113752.12502-88-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191108113752.12502-1-sashal@kernel.org>
References: <20191108113752.12502-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iT2cd-006UHb-6r
Subject: [f2fs-dev] [PATCH AUTOSEL 4.19 088/205] f2fs: avoid wrong decrypted
 data from disk
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Jaegeuk Kim <jaegeuk@kernel.org>

[ Upstream commit 0ded69f632bb717be9aeea3ae74e29050fcb060c ]

1. Create a file in an encrypted directory
2. Do GC & drop caches
3. Read stale data before its bio for metapage was not issued yet

Reviewed-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/data.c    | 18 ++++++++++--------
 fs/f2fs/f2fs.h    |  2 +-
 fs/f2fs/file.c    |  3 +--
 fs/f2fs/segment.c |  6 +++++-
 4 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 9511466bc7857..c61beaedf0789 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -575,9 +575,6 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 		ctx->bio = bio;
 		ctx->enabled_steps = post_read_steps;
 		bio->bi_private = ctx;
-
-		/* wait the page to be moved by cleaning */
-		f2fs_wait_on_block_writeback(sbi, blkaddr);
 	}
 
 	return bio;
@@ -592,6 +589,9 @@ static int f2fs_submit_page_read(struct inode *inode, struct page *page,
 	if (IS_ERR(bio))
 		return PTR_ERR(bio);
 
+	/* wait for GCed page writeback via META_MAPPING */
+	f2fs_wait_on_block_writeback(inode, blkaddr);
+
 	if (bio_add_page(bio, page, PAGE_SIZE, 0) < PAGE_SIZE) {
 		bio_put(bio);
 		return -EFAULT;
@@ -1569,6 +1569,12 @@ submit_and_realloc:
 			}
 		}
 
+		/*
+		 * If the page is under writeback, we need to wait for
+		 * its completion to see the correct decrypted data.
+		 */
+		f2fs_wait_on_block_writeback(inode, block_nr);
+
 		if (bio_add_page(bio, page, blocksize, 0) < blocksize)
 			goto submit_and_realloc;
 
@@ -1637,7 +1643,7 @@ static int encrypt_one_page(struct f2fs_io_info *fio)
 		return 0;
 
 	/* wait for GCed page writeback via META_MAPPING */
-	f2fs_wait_on_block_writeback(fio->sbi, fio->old_blkaddr);
+	f2fs_wait_on_block_writeback(inode, fio->old_blkaddr);
 
 retry_encrypt:
 	fio->encrypted_page = fscrypt_encrypt_page(inode, fio->page,
@@ -2402,10 +2408,6 @@ repeat:
 
 	f2fs_wait_on_page_writeback(page, DATA, false);
 
-	/* wait for GCed page writeback via META_MAPPING */
-	if (f2fs_post_read_required(inode))
-		f2fs_wait_on_block_writeback(sbi, blkaddr);
-
 	if (len == PAGE_SIZE || PageUptodate(page))
 		return 0;
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index fb216488d67a9..6d361c8c61306 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2973,7 +2973,7 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 			struct f2fs_io_info *fio, bool add_list);
 void f2fs_wait_on_page_writeback(struct page *page,
 			enum page_type type, bool ordered);
-void f2fs_wait_on_block_writeback(struct f2fs_sb_info *sbi, block_t blkaddr);
+void f2fs_wait_on_block_writeback(struct inode *inode, block_t blkaddr);
 void f2fs_write_data_summaries(struct f2fs_sb_info *sbi, block_t start_blk);
 void f2fs_write_node_summaries(struct f2fs_sb_info *sbi, block_t start_blk);
 int f2fs_lookup_journal_in_cursum(struct f2fs_journal *journal, int type,
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 8d1eb8dec6058..6972c6d7c3893 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -112,8 +112,7 @@ mapped:
 	f2fs_wait_on_page_writeback(page, DATA, false);
 
 	/* wait for GCed page writeback via META_MAPPING */
-	if (f2fs_post_read_required(inode))
-		f2fs_wait_on_block_writeback(sbi, dn.data_blkaddr);
+	f2fs_wait_on_block_writeback(inode, dn.data_blkaddr);
 
 out_sem:
 	up_read(&F2FS_I(inode)->i_mmap_sem);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 10d5dcdb34be6..d78009694f3fd 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3214,10 +3214,14 @@ void f2fs_wait_on_page_writeback(struct page *page,
 	}
 }
 
-void f2fs_wait_on_block_writeback(struct f2fs_sb_info *sbi, block_t blkaddr)
+void f2fs_wait_on_block_writeback(struct inode *inode, block_t blkaddr)
 {
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct page *cpage;
 
+	if (!f2fs_post_read_required(inode))
+		return;
+
 	if (!is_valid_data_blkaddr(sbi, blkaddr))
 		return;
 
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
