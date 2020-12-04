Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 098652CF40C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Dec 2020 19:29:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1klFq3-00031G-53; Fri, 04 Dec 2020 18:29:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1klFpy-00030f-An
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 18:29:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XlgDz+ognYhUpsYv51gVfHqW2icXst9AxfcrE8j955E=; b=jcEfvPI9rIiMkIkHFohHYTLn4T
 4eUdgv8QsX2kxZ8+uZik0+7/72Nu0JtFJzENq/N+49sEjHsXtrofKGTqCkFm4hNUIMFyN35OpTiwS
 wsYK0g7x0GDBXxW3/sRWaoxcrIx98ioNBeFtIWEpkXVwtY0YioXCb/Wer/Di1lKj7tHA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XlgDz+ognYhUpsYv51gVfHqW2icXst9AxfcrE8j955E=; b=MEyydFSS8hvozDjQUoNXMU5eRy
 7P+dqmGmvtiz3qloImXgBrVTYBWXRo43S6SGoEjmGATubwN8vjYpPd7SXAyRz9f19w0q12cyazUwc
 3hRVZIcE4Y4RtRIGJEZeA5hEgwrYrGD0bLkUgrdlrc7m+Y/EN0D50rFcLxUFubhN3Q/U=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1klFpp-00FbY3-0v
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 18:29:46 +0000
Date: Fri, 4 Dec 2020 10:29:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607106564;
 bh=mblh6wVY0lJ08ec0XmcY0LDeZa2RfjpHs2gBm6g+oHI=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=ScpVSwVead6yek1MBaQZ5HkQgQ/kQqzZx4af/u2RcpgxYulzVRv3UF9nviUN0CULo
 goo2392zPidcjax15iva9NvjnPH6QbrV5P4Sg+8Ktph1R1YL9HkSO4WxLf6mgKoyj/
 uwfpBySZnjijiOLCbZzT8nrc/30DzMTCREwtuVLeM09RShuUnsBxi06jFh0bbhca1q
 HZRBvBUEQhtqyMiFZatapWNbYJKh/e1p+CC/Tv5RB2DUljBKGJpiGj0E8GH1fPmvr3
 yeXyziperDOAjoGYKvLvNkmPyFsxJrrR7Is6uXyOTvBCr/znc32gkE+TJ+GVkglTxO
 dy2MZa0A3TH/w==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <X8qAAiRah/zmowZB@google.com>
References: <20201204005847.654074-1-daeho43@gmail.com>
 <X8msy1T8uqZ4Z/iR@sol.localdomain>
 <CACOAw_wTFsfgLfrWKRoM1o_HQorJE-=2ztZftQTn+comcpmHxQ@mail.gmail.com>
 <X8m0qbd7rvQyiwOt@sol.localdomain>
 <CACOAw_y2HRE8CDk-HAjA6w_HzGJpRpivPY5zKRMC4_SNYTnTGg@mail.gmail.com>
 <CACOAw_xzKjZcpVTo3aj5sJUQ_BjLr=5ZhnfuyFwYerpyzZu+aw@mail.gmail.com>
 <X8nAParf9GW9LaGV@sol.localdomain>
 <CACOAw_wOShYf23Y0txs6Fk_Qq9JGEjXGRb0MzMxrBxJpzCfLmA@mail.gmail.com>
 <X8nGvfEeTDTLa6FL@sol.localdomain>
 <CACOAw_wfew8xER-CibUtddRKVtcr3k_iGzjQ-bVYxqRUuEVCcw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOAw_wfew8xER-CibUtddRKVtcr3k_iGzjQ-bVYxqRUuEVCcw@mail.gmail.com>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1klFpp-00FbY3-0v
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix race of pending_pages in
 decompression
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
Cc: Eric Biggers <ebiggers@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com, Daeho Jeong <daehojeong@google.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/04, Daeho Jeong wrote:
> Thanks for the explanation about verity.
> I got your point. Thanks~

Possible fix can be like this?

---
 fs/f2fs/compress.c |  2 --
 fs/f2fs/data.c     | 19 +++++++++++++------
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 89f73a7c8667..c5fee4d7ea72 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1491,8 +1491,6 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
 	dic->magic = F2FS_COMPRESSED_PAGE_MAGIC;
 	dic->inode = cc->inode;
 	atomic_set(&dic->pending_pages, cc->nr_cpages);
-	if (fsverity_active(cc->inode))
-		atomic_set(&dic->verity_pages, cc->nr_cpages);
 	dic->cluster_idx = cc->cluster_idx;
 	dic->cluster_size = cc->cluster_size;
 	dic->log_cluster_size = cc->log_cluster_size;
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index e3168f32f943..657fb562d7d4 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1035,7 +1035,8 @@ static inline bool f2fs_need_verity(const struct inode *inode, pgoff_t idx)
 
 static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 				      unsigned nr_pages, unsigned op_flag,
-				      pgoff_t first_idx, bool for_write)
+				      pgoff_t first_idx, bool for_write,
+				      bool for_verity)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct bio *bio;
@@ -1057,7 +1058,7 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 		post_read_steps |= 1 << STEP_DECRYPT;
 	if (f2fs_compressed_file(inode))
 		post_read_steps |= 1 << STEP_DECOMPRESS_NOWQ;
-	if (f2fs_need_verity(inode, first_idx))
+	if (for_verity && f2fs_need_verity(inode, first_idx))
 		post_read_steps |= 1 << STEP_VERITY;
 
 	if (post_read_steps) {
@@ -1087,7 +1088,7 @@ static int f2fs_submit_page_read(struct inode *inode, struct page *page,
 	struct bio *bio;
 
 	bio = f2fs_grab_read_bio(inode, blkaddr, 1, op_flags,
-					page->index, for_write);
+					page->index, for_write, true);
 	if (IS_ERR(bio))
 		return PTR_ERR(bio);
 
@@ -2141,7 +2142,7 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
 	if (bio == NULL) {
 		bio = f2fs_grab_read_bio(inode, block_nr, nr_pages,
 				is_readahead ? REQ_RAHEAD : 0, page->index,
-				false);
+				false, true);
 		if (IS_ERR(bio)) {
 			ret = PTR_ERR(bio);
 			bio = NULL;
@@ -2188,6 +2189,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 	const unsigned blkbits = inode->i_blkbits;
 	const unsigned blocksize = 1 << blkbits;
 	struct decompress_io_ctx *dic = NULL;
+	bool for_verity = false;
 	int i;
 	int ret = 0;
 
@@ -2253,6 +2255,11 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 		goto out_put_dnode;
 	}
 
+	if (fsverity_active(cc->inode)) {
+		atomic_set(&dic->verity_pages, cc->nr_cpages);
+		for_verity = true;
+	}
+
 	for (i = 0; i < dic->nr_cpages; i++) {
 		struct page *page = dic->cpages[i];
 		block_t blkaddr;
@@ -2272,7 +2279,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 		if (!bio) {
 			bio = f2fs_grab_read_bio(inode, blkaddr, nr_pages,
 					is_readahead ? REQ_RAHEAD : 0,
-					page->index, for_write);
+					page->index, for_write, for_verity);
 			if (IS_ERR(bio)) {
 				unsigned int remained = dic->nr_cpages - i;
 				bool release = false;
@@ -2280,7 +2287,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 				ret = PTR_ERR(bio);
 				dic->failed = true;
 
-				if (fsverity_active(inode)) {
+				if (for_verity) {
 					if (!atomic_sub_return(remained,
 						&dic->verity_pages))
 						release = true;
-- 
2.29.2.576.ga3fc446d84-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
