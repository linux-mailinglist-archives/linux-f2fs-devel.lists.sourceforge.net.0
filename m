Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC492E78D2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Dec 2020 14:03:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kub8t-0007mn-60; Wed, 30 Dec 2020 13:03:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1kub8q-0007mT-Oz
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Dec 2020 13:03:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=By3nIMVi1uaGccWfaxAHFa5abLtuXVMDsA+t03NVPcA=; b=E21ZkosC/s+sMUcMn9IVDI2lDf
 pDITmKe7xrmXxsVjbGVdgk6p2wPFxvnTxn6eemtmuIYiTKBMVCF97wf7Dzhg7LIvTKqJFhepU7H2h
 AIRGOHwpYgL4MHirpkY7NaZgeLVDQFSE/qbUc1iShn77p0uqxBCZASlRcrXznA41W1hs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=By3nIMVi1uaGccWfaxAHFa5abLtuXVMDsA+t03NVPcA=; b=Yeut7KwqblDwRJ/Q50nZkHsIdj
 X+TKYUCao1nNnGJTphwYCmmnhOJ6ixMhRfV2UeC1D0Kds7mcD0OmJQ20/7VQi37KWuDQNEEuc0VW7
 qbpmvCZy5zjX606VfFyawGZf+vdfrS1W3z+fZK4Wx9CHKUtrg519+1Bwg1cy+sn48mYA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kub8a-00CaGV-EO
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Dec 2020 13:03:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 58914223C8;
 Wed, 30 Dec 2020 13:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609333411;
 bh=OYgoxwaQo+Hv7D5mPmTO4XJqWeAnsjRU3BLSa0axZcY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jurUJduDwiNbGPvAc8p8lTImOXJLbO8BCKnawyqW8d/y02C7jMpzqUpp4Oxtg1OKQ
 4cdIE5LcQWo2PdHj+1f5OCW3wEFg/b6f+baqQmhzdXuyqf58kgSCDzEtPPANufZcmV
 EMggk+4CVpivup0U4z37oBiP7Hn9W7neeLP08gXaJuomHLNb5mydDdCLLm4nQUKcxA
 Rd6Ktxd4br/0OMeAo6FOdy5khHOX1XCarhKbYt2WCJDvDb/O8T6beWVCU+0G0dKDlx
 qracPdCf3obExFbctqhA55PWTFbMcCXWqvcObN5tOZiAmllU/NDm4Czv9eOLeWefKx
 YntiqKHS1pUhw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 30 Dec 2020 08:02:54 -0500
Message-Id: <20201230130314.3636961-12-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201230130314.3636961-1-sashal@kernel.org>
References: <20201230130314.3636961-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kub8a-00CaGV-EO
Subject: [f2fs-dev] [PATCH AUTOSEL 5.10 12/31] f2fs: fix race of
 pending_pages in decompression
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
 Daeho Jeong <daehojeong@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

[ Upstream commit 6422a71ef40e4751d59b8c9412e7e2dafe085878 ]

I found out f2fs_free_dic() is invoked in a wrong timing, but
f2fs_verify_bio() still needed the dic info and it triggered the
below kernel panic. It has been caused by the race condition of
pending_pages value between decompression and verity logic, when
the same compression cluster had been split in different bios.
By split bios, f2fs_verify_bio() ended up with decreasing
pending_pages value before it is reset to nr_cpages by
f2fs_decompress_pages() and caused the kernel panic.

[ 4416.564763] Unable to handle kernel NULL pointer dereference
               at virtual address 0000000000000000
...
[ 4416.896016] Workqueue: fsverity_read_queue f2fs_verity_work
[ 4416.908515] pc : fsverity_verify_page+0x20/0x78
[ 4416.913721] lr : f2fs_verify_bio+0x11c/0x29c
[ 4416.913722] sp : ffffffc019533cd0
[ 4416.913723] x29: ffffffc019533cd0 x28: 0000000000000402
[ 4416.913724] x27: 0000000000000001 x26: 0000000000000100
[ 4416.913726] x25: 0000000000000001 x24: 0000000000000004
[ 4416.913727] x23: 0000000000001000 x22: 0000000000000000
[ 4416.913728] x21: 0000000000000000 x20: ffffffff2076f9c0
[ 4416.913729] x19: ffffffff2076f9c0 x18: ffffff8a32380c30
[ 4416.913731] x17: ffffffc01f966d97 x16: 0000000000000298
[ 4416.913732] x15: 0000000000000000 x14: 0000000000000000
[ 4416.913733] x13: f074faec89ffffff x12: 0000000000000000
[ 4416.913734] x11: 0000000000001000 x10: 0000000000001000
[ 4416.929176] x9 : ffffffff20d1f5c7 x8 : 0000000000000000
[ 4416.929178] x7 : 626d7464ff286b6b x6 : ffffffc019533ade
[ 4416.929179] x5 : 000000008049000e x4 : ffffffff2793e9e0
[ 4416.929180] x3 : 000000008049000e x2 : ffffff89ecfa74d0
[ 4416.929181] x1 : 0000000000000c40 x0 : ffffffff2076f9c0
[ 4416.929184] Call trace:
[ 4416.929187]  fsverity_verify_page+0x20/0x78
[ 4416.929189]  f2fs_verify_bio+0x11c/0x29c
[ 4416.929192]  f2fs_verity_work+0x58/0x84
[ 4417.050667]  process_one_work+0x270/0x47c
[ 4417.055354]  worker_thread+0x27c/0x4d8
[ 4417.059784]  kthread+0x13c/0x320
[ 4417.063693]  ret_from_fork+0x10/0x18

Chao pointed this can happen by the below race condition.

Thread A        f2fs_post_read_wq          fsverity_wq
- f2fs_read_multi_pages()
  - f2fs_alloc_dic
   - dic->pending_pages = 2
   - submit_bio()
   - submit_bio()
               - f2fs_post_read_work() handle first bio
                - f2fs_decompress_work()
                 - __read_end_io()
                  - f2fs_decompress_pages()
                   - dic->pending_pages--
                - enqueue f2fs_verity_work()
                                           - f2fs_verity_work() handle first bio
                                            - f2fs_verify_bio()
                                             - dic->pending_pages--
               - f2fs_post_read_work() handle second bio
                - f2fs_decompress_work()
                - enqueue f2fs_verity_work()
                                            - f2fs_verify_pages()
                                            - f2fs_free_dic()

                                          - f2fs_verity_work() handle second bio
                                           - f2fs_verfy_bio()
                                                 - use-after-free on dic

Signed-off-by: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/compress.c |  2 --
 fs/f2fs/data.c     | 58 +++++++++++++++++++++++++++++++++++++---------
 fs/f2fs/f2fs.h     |  1 +
 3 files changed, 48 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 14262e0f1cd60..c5fee4d7ea72f 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -798,8 +798,6 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
 	if (cops->destroy_decompress_ctx)
 		cops->destroy_decompress_ctx(dic);
 out_free_dic:
-	if (verity)
-		atomic_set(&dic->pending_pages, dic->nr_cpages);
 	if (!verity)
 		f2fs_decompress_end_io(dic->rpages, dic->cluster_size,
 								ret, false);
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index be4da52604edc..b29243ee1c3e5 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -202,7 +202,7 @@ static void f2fs_verify_bio(struct bio *bio)
 		dic = (struct decompress_io_ctx *)page_private(page);
 
 		if (dic) {
-			if (atomic_dec_return(&dic->pending_pages))
+			if (atomic_dec_return(&dic->verity_pages))
 				continue;
 			f2fs_verify_pages(dic->rpages,
 						dic->cluster_size);
@@ -1027,7 +1027,8 @@ static inline bool f2fs_need_verity(const struct inode *inode, pgoff_t idx)
 
 static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 				      unsigned nr_pages, unsigned op_flag,
-				      pgoff_t first_idx, bool for_write)
+				      pgoff_t first_idx, bool for_write,
+				      bool for_verity)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct bio *bio;
@@ -1049,7 +1050,7 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 		post_read_steps |= 1 << STEP_DECRYPT;
 	if (f2fs_compressed_file(inode))
 		post_read_steps |= 1 << STEP_DECOMPRESS_NOWQ;
-	if (f2fs_need_verity(inode, first_idx))
+	if (for_verity && f2fs_need_verity(inode, first_idx))
 		post_read_steps |= 1 << STEP_VERITY;
 
 	if (post_read_steps) {
@@ -1079,7 +1080,7 @@ static int f2fs_submit_page_read(struct inode *inode, struct page *page,
 	struct bio *bio;
 
 	bio = f2fs_grab_read_bio(inode, blkaddr, 1, op_flags,
-					page->index, for_write);
+					page->index, for_write, true);
 	if (IS_ERR(bio))
 		return PTR_ERR(bio);
 
@@ -2133,7 +2134,7 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
 	if (bio == NULL) {
 		bio = f2fs_grab_read_bio(inode, block_nr, nr_pages,
 				is_readahead ? REQ_RAHEAD : 0, page->index,
-				false);
+				false, true);
 		if (IS_ERR(bio)) {
 			ret = PTR_ERR(bio);
 			bio = NULL;
@@ -2180,6 +2181,8 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 	const unsigned blkbits = inode->i_blkbits;
 	const unsigned blocksize = 1 << blkbits;
 	struct decompress_io_ctx *dic = NULL;
+	struct bio_post_read_ctx *ctx;
+	bool for_verity = false;
 	int i;
 	int ret = 0;
 
@@ -2245,10 +2248,29 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 		goto out_put_dnode;
 	}
 
+	/*
+	 * It's possible to enable fsverity on the fly when handling a cluster,
+	 * which requires complicated error handling. Instead of adding more
+	 * complexity, let's give a rule where end_io post-processes fsverity
+	 * per cluster. In order to do that, we need to submit bio, if previous
+	 * bio sets a different post-process policy.
+	 */
+	if (fsverity_active(cc->inode)) {
+		atomic_set(&dic->verity_pages, cc->nr_cpages);
+		for_verity = true;
+
+		if (bio) {
+			ctx = bio->bi_private;
+			if (!(ctx->enabled_steps & (1 << STEP_VERITY))) {
+				__submit_bio(sbi, bio, DATA);
+				bio = NULL;
+			}
+		}
+	}
+
 	for (i = 0; i < dic->nr_cpages; i++) {
 		struct page *page = dic->cpages[i];
 		block_t blkaddr;
-		struct bio_post_read_ctx *ctx;
 
 		blkaddr = data_blkaddr(dn.inode, dn.node_page,
 						dn.ofs_in_node + i + 1);
@@ -2264,17 +2286,31 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 		if (!bio) {
 			bio = f2fs_grab_read_bio(inode, blkaddr, nr_pages,
 					is_readahead ? REQ_RAHEAD : 0,
-					page->index, for_write);
+					page->index, for_write, for_verity);
 			if (IS_ERR(bio)) {
+				unsigned int remained = dic->nr_cpages - i;
+				bool release = false;
+
 				ret = PTR_ERR(bio);
 				dic->failed = true;
-				if (!atomic_sub_return(dic->nr_cpages - i,
-							&dic->pending_pages)) {
+
+				if (for_verity) {
+					if (!atomic_sub_return(remained,
+						&dic->verity_pages))
+						release = true;
+				} else {
+					if (!atomic_sub_return(remained,
+						&dic->pending_pages))
+						release = true;
+				}
+
+				if (release) {
 					f2fs_decompress_end_io(dic->rpages,
-							cc->cluster_size, true,
-							false);
+						cc->cluster_size, true,
+						false);
 					f2fs_free_dic(dic);
 				}
+
 				f2fs_put_dnode(&dn);
 				*bio_ret = NULL;
 				return ret;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 14ace0e21d389..72a25387f49bc 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1412,6 +1412,7 @@ struct decompress_io_ctx {
 	size_t rlen;			/* valid data length in rbuf */
 	size_t clen;			/* valid data length in cbuf */
 	atomic_t pending_pages;		/* in-flight compressed page count */
+	atomic_t verity_pages;		/* in-flight page count for verity */
 	bool failed;			/* indicate IO error during decompression */
 	void *private;			/* payload buffer for specified decompression algorithm */
 	void *private2;			/* extra payload buffer */
-- 
2.27.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
