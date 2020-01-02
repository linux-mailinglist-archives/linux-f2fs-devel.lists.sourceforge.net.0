Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AB312EA22
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Jan 2020 20:00:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1in5he-000586-4f; Thu, 02 Jan 2020 19:00:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1in5hc-00057o-9P
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Jan 2020 19:00:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rwC56gV6usBGtJUQAVZY4C73m1MRVZzqWIOqME2vGrM=; b=hzVQlpFQDVKtx7rWUGw/oYjql9
 DivG4cFUfesIAZkO2pWZ0xrvpim371KifaHRPr/xIHHk2PDireUeWjTdmfE6wVNRYK8qCV2cpJv7H
 giRrwdVSqIwS6z57ncCdkSPdTyY6rUxApNg86ZMggP7gyItIDWHgiEcRafLjhqDM2DeY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rwC56gV6usBGtJUQAVZY4C73m1MRVZzqWIOqME2vGrM=; b=a8/IackNMNLOx4ZWttQiwqeH+5
 uCMS6j+G5JQSIAB0rteTzP+V94LJsE84pb6nmGOZ7EkPoSfHZ4JbN4qMIpU7bdN2XfzsPNejgNo5Q
 DT2wRNEXFAJEDflwpiH31HX0ruSYjcnytyH37hvox34XsyVlLQtFyddfyO6aLJUhI0ZY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1in5hZ-0079Qp-Rj
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Jan 2020 19:00:12 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2BA3B21655;
 Thu,  2 Jan 2020 19:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577991604;
 bh=wzd5vGv+NY8rW6icu7fH11OpcK8cT4C3Zrd0wOkIzG4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g1VXVZsqZf4x8H1g5zREfvhpB4fyci+6APWXuWc/91hQHx8g6RbATDJeEGYZNolh0
 U6ohMM39ktNKn+dN3RY6IudS2eVpMNCvS088oCfLcI4Mpqs9zmqJUfq8vD4fbeRLvo
 Vz/SkgBhR3YtdOCK0d8DOiDZNz+CrKD75+9bHU6g=
Date: Thu, 2 Jan 2020 11:00:03 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200102190003.GA7597@jaegeuk-macbookpro.roam.corp.google.com>
References: <20191216062806.112361-1-yuchao0@huawei.com>
 <20191218214619.GA20072@jaegeuk-macbookpro.roam.corp.google.com>
 <c7035795-73b3-d832-948f-deb36213ba07@huawei.com>
 <20191231004633.GA85441@jaegeuk-macbookpro.roam.corp.google.com>
 <7a579223-39d4-7e51-c361-4aa592b2500d@huawei.com>
 <20200102181832.GA1953@jaegeuk-macbookpro.roam.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200102181832.GA1953@jaegeuk-macbookpro.roam.corp.google.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
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
X-Headers-End: 1in5hZ-0079Qp-Rj
Subject: Re: [f2fs-dev] [RFC PATCH v5] f2fs: support data compression
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

On 01/02, Jaegeuk Kim wrote:
> On 12/31, Chao Yu wrote:
> > On 2019/12/31 8:46, Jaegeuk Kim wrote:
> > > On 12/23, Chao Yu wrote:
> > >> Hi Jaegeuk,
> > >>
> > >> Sorry for the delay.
> > >>
> > >> On 2019/12/19 5:46, Jaegeuk Kim wrote:
> > >>> Hi Chao,
> > >>>
> > >>> I still see some diffs from my latest testing version, so please check anything
> > >>> that you made additionally from here.
> > >>>
> > >>> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=25d18e19a91e60837d36368ee939db13fd16dc64
> > >>
> > >> I've checked the diff and picked up valid parts, could you please check and
> > >> comment on it?
> > >>
> > >> ---
> > >>  fs/f2fs/compress.c |  8 ++++----
> > >>  fs/f2fs/data.c     | 18 +++++++++++++++---
> > >>  fs/f2fs/f2fs.h     |  3 +++
> > >>  fs/f2fs/file.c     |  1 -
> > >>  4 files changed, 22 insertions(+), 8 deletions(-)
> > >>
> > >> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> > >> index af23ed6deffd..1bc86a54ad71 100644
> > >> --- a/fs/f2fs/compress.c
> > >> +++ b/fs/f2fs/compress.c
> > >> @@ -593,7 +593,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
> > >>  							fgp_flag, GFP_NOFS);
> > >>  		if (!page) {
> > >>  			ret = -ENOMEM;
> > >> -			goto unlock_pages;
> > >> +			goto release_pages;
> > >>  		}
> > >>
> > >>  		if (PageUptodate(page))
> > >> @@ -608,13 +608,13 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
> > >>  		ret = f2fs_read_multi_pages(cc, &bio, cc->cluster_size,
> > >>  						&last_block_in_bio, false);
> > >>  		if (ret)
> > >> -			goto release_pages;
> > >> +			goto unlock_pages;
> > >>  		if (bio)
> > >>  			f2fs_submit_bio(sbi, bio, DATA);
> > >>
> > >>  		ret = f2fs_init_compress_ctx(cc);
> > >>  		if (ret)
> > >> -			goto release_pages;
> > >> +			goto unlock_pages;
> > >>  	}
> > >>
> > >>  	for (i = 0; i < cc->cluster_size; i++) {
> > >> @@ -762,7 +762,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
> > >>  	if (err)
> > >>  		goto out_unlock_op;
> > >>
> > >> -	psize = (cc->rpages[last_index]->index + 1) << PAGE_SHIFT;
> > >> +	psize = (loff_t)(cc->rpages[last_index]->index + 1) << PAGE_SHIFT;
> > >>
> > >>  	err = f2fs_get_node_info(fio.sbi, dn.nid, &ni);
> > >>  	if (err)
> > >> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > >> index 19cd03450066..f1f5c701228d 100644
> > >> --- a/fs/f2fs/data.c
> > >> +++ b/fs/f2fs/data.c
> > >> @@ -184,13 +184,18 @@ static void f2fs_decompress_work(struct bio_post_read_ctx *ctx)
> > >>  }
> > >>
> > >>  #ifdef CONFIG_F2FS_FS_COMPRESSION
> > >> +void f2fs_verify_pages(struct page **rpages, unsigned int cluster_size)
> > >> +{
> > >> +	f2fs_decompress_end_io(rpages, cluster_size, false, true);
> > >> +}
> > >> +
> > >>  static void f2fs_verify_bio(struct bio *bio)
> > >>  {
> > >>  	struct page *page = bio_first_page_all(bio);
> > >>  	struct decompress_io_ctx *dic =
> > >>  			(struct decompress_io_ctx *)page_private(page);
> > >>
> > >> -	f2fs_decompress_end_io(dic->rpages, dic->cluster_size, false, true);
> > >> +	f2fs_verify_pages(dic->rpages, dic->cluster_size);
> > >>  	f2fs_free_dic(dic);
> > >>  }
> > >>  #endif
> > >> @@ -507,10 +512,16 @@ static bool __has_merged_page(struct bio *bio, struct inode *inode,
> > >>  	bio_for_each_segment_all(bvec, bio, iter_all) {
> > >>  		struct page *target = bvec->bv_page;
> > >>
> > >> -		if (fscrypt_is_bounce_page(target))
> > >> +		if (fscrypt_is_bounce_page(target)) {
> > >>  			target = fscrypt_pagecache_page(target);
> > >> -		if (f2fs_is_compressed_page(target))
> > >> +			if (IS_ERR(target))
> > >> +				continue;
> > >> +		}
> > >> +		if (f2fs_is_compressed_page(target)) {
> > >>  			target = f2fs_compress_control_page(target);
> > >> +			if (IS_ERR(target))
> > >> +				continue;
> > >> +		}
> > >>
> > >>  		if (inode && inode == target->mapping->host)
> > >>  			return true;
> > >> @@ -2039,6 +2050,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
> > >>  	if (ret)
> > >>  		goto out;
> > >>
> > >> +	/* cluster was overwritten as normal cluster */
> > >>  	if (dn.data_blkaddr != COMPRESS_ADDR)
> > >>  		goto out;
> > >>
> > >> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > >> index 5d55cef66410..17d2af4eeafb 100644
> > >> --- a/fs/f2fs/f2fs.h
> > >> +++ b/fs/f2fs/f2fs.h
> > >> @@ -2719,6 +2719,7 @@ static inline void set_compress_context(struct inode *inode)
> > >>  			1 << F2FS_I(inode)->i_log_cluster_size;
> > >>  	F2FS_I(inode)->i_flags |= F2FS_COMPR_FL;
> > >>  	set_inode_flag(inode, FI_COMPRESSED_FILE);
> > >> +	stat_inc_compr_inode(inode);
> > >>  }
> > >>
> > >>  static inline unsigned int addrs_per_inode(struct inode *inode)
> > >> @@ -3961,6 +3962,8 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
> > >>  		return true;
> > >>  	if (f2fs_is_multi_device(sbi))
> > >>  		return true;
> > >> +	if (f2fs_compressed_file(inode))
> > >> +		return true;
> > >>  	/*
> > >>  	 * for blkzoned device, fallback direct IO to buffered IO, so
> > >>  	 * all IOs can be serialized by log-structured write.
> > >> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > >> index bde5612f37f5..9aeadf14413c 100644
> > >> --- a/fs/f2fs/file.c
> > >> +++ b/fs/f2fs/file.c
> > >> @@ -1828,7 +1828,6 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
> > >>  				return -EINVAL;
> > >>
> > >>  			set_compress_context(inode);
> > >> -			stat_inc_compr_inode(inode);
> > > 
> > > As this breaks the count, I'll keep as is.
> > 
> > @@ -2719,6 +2719,7 @@ static inline void set_compress_context(struct inode *inode)
> >  			1 << F2FS_I(inode)->i_log_cluster_size;
> >  	F2FS_I(inode)->i_flags |= F2FS_COMPR_FL;
> >  	set_inode_flag(inode, FI_COMPRESSED_FILE);
> > +	stat_inc_compr_inode(inode);
> > 
> > If I'm not missing anything, stat_inc_compr_inode() should be called inside
> > set_compress_context() in where we convert normal inode to compress one,
> > right?
> 
> I don't care much whether that's right or not. If we want to do that, I found
> another line to remove in f2fs_create(). Let me give it a try.
> 
> Thanks,
> 

This works to me. Could you run fsstress tests on compressed root directory?
It seems still there are some bugs.

---
 fs/f2fs/compress.c | 14 ++++++++++----
 fs/f2fs/data.c     | 25 ++++++++++++++++++++++---
 fs/f2fs/f2fs.h     | 31 +++++++++++++++++--------------
 fs/f2fs/file.c     |  1 -
 fs/f2fs/namei.c    |  1 -
 5 files changed, 49 insertions(+), 23 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index af23ed6deffd..fa67ffd9d79d 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -593,7 +593,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 							fgp_flag, GFP_NOFS);
 		if (!page) {
 			ret = -ENOMEM;
-			goto unlock_pages;
+			goto release_pages;
 		}
 
 		if (PageUptodate(page))
@@ -608,13 +608,13 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 		ret = f2fs_read_multi_pages(cc, &bio, cc->cluster_size,
 						&last_block_in_bio, false);
 		if (ret)
-			goto release_pages;
+			goto unlock_pages;
 		if (bio)
 			f2fs_submit_bio(sbi, bio, DATA);
 
 		ret = f2fs_init_compress_ctx(cc);
 		if (ret)
-			goto release_pages;
+			goto unlock_pages;
 	}
 
 	for (i = 0; i < cc->cluster_size; i++) {
@@ -762,7 +762,13 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 	if (err)
 		goto out_unlock_op;
 
-	psize = (cc->rpages[last_index]->index + 1) << PAGE_SHIFT;
+	for (i = 0; i < cc->cluster_size; i++) {
+		if (datablock_addr(dn.inode, dn.node_page,
+					dn.ofs_in_node + i) == NULL_ADDR)
+			goto out_put_dnode;
+	}
+
+	psize = (loff_t)(cc->rpages[last_index]->index + 1) << PAGE_SHIFT;
 
 	err = f2fs_get_node_info(fio.sbi, dn.nid, &ni);
 	if (err)
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 356642e8c3b3..5476d33f2d76 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -184,13 +184,18 @@ static void f2fs_decompress_work(struct bio_post_read_ctx *ctx)
 }
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
+void f2fs_verify_pages(struct page **rpages, unsigned int cluster_size)
+{
+	f2fs_decompress_end_io(rpages, cluster_size, false, true);
+}
+
 static void f2fs_verify_bio(struct bio *bio)
 {
 	struct page *page = bio_first_page_all(bio);
 	struct decompress_io_ctx *dic =
 			(struct decompress_io_ctx *)page_private(page);
 
-	f2fs_decompress_end_io(dic->rpages, dic->cluster_size, false, true);
+	f2fs_verify_pages(dic->rpages, dic->cluster_size);
 	f2fs_free_dic(dic);
 }
 #endif
@@ -520,10 +525,16 @@ static bool __has_merged_page(struct bio *bio, struct inode *inode,
 	bio_for_each_segment_all(bvec, bio, iter_all) {
 		struct page *target = bvec->bv_page;
 
-		if (fscrypt_is_bounce_page(target))
+		if (fscrypt_is_bounce_page(target)) {
 			target = fscrypt_pagecache_page(target);
-		if (f2fs_is_compressed_page(target))
+			if (IS_ERR(target))
+				continue;
+		}
+		if (f2fs_is_compressed_page(target)) {
 			target = f2fs_compress_control_page(target);
+			if (IS_ERR(target))
+				continue;
+		}
 
 		if (inode && inode == target->mapping->host)
 			return true;
@@ -2049,6 +2060,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 	if (ret)
 		goto out;
 
+	/* cluster was overwritten as normal cluster */
 	if (dn.data_blkaddr != COMPRESS_ADDR)
 		goto out;
 
@@ -2694,12 +2706,16 @@ static int f2fs_write_data_page(struct page *page,
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	struct inode *inode = page->mapping->host;
 
+	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
+		goto out;
+
 	if (f2fs_compressed_file(inode)) {
 		if (f2fs_is_compressed_cluster(inode, page->index)) {
 			redirty_page_for_writepage(wbc, page);
 			return AOP_WRITEPAGE_ACTIVATE;
 		}
 	}
+out:
 #endif
 
 	return f2fs_write_single_data_page(page, NULL, NULL, NULL,
@@ -2809,6 +2825,9 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 					goto result;
 				}
 
+				if (unlikely(f2fs_cp_error(sbi)))
+					goto lock_page;
+
 				if (f2fs_cluster_is_empty(&cc)) {
 					void *fsdata = NULL;
 					struct page *pagep;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index de494fc9d596..a95369e32876 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2707,20 +2707,6 @@ static inline int f2fs_compressed_file(struct inode *inode)
 		is_inode_flag_set(inode, FI_COMPRESSED_FILE);
 }
 
-static inline void set_compress_context(struct inode *inode)
-{
-	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-
-	F2FS_I(inode)->i_compress_algorithm =
-			F2FS_OPTION(sbi).compress_algorithm;
-	F2FS_I(inode)->i_log_cluster_size =
-			F2FS_OPTION(sbi).compress_log_size;
-	F2FS_I(inode)->i_cluster_size =
-			1 << F2FS_I(inode)->i_log_cluster_size;
-	F2FS_I(inode)->i_flags |= F2FS_COMPR_FL;
-	set_inode_flag(inode, FI_COMPRESSED_FILE);
-}
-
 static inline unsigned int addrs_per_inode(struct inode *inode)
 {
 	unsigned int addrs = CUR_ADDRS_PER_INODE(inode) -
@@ -3808,6 +3794,21 @@ static inline struct page *f2fs_compress_control_page(struct page *page)
 }
 #endif
 
+static inline void set_compress_context(struct inode *inode)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+
+	F2FS_I(inode)->i_compress_algorithm =
+			F2FS_OPTION(sbi).compress_algorithm;
+	F2FS_I(inode)->i_log_cluster_size =
+			F2FS_OPTION(sbi).compress_log_size;
+	F2FS_I(inode)->i_cluster_size =
+			1 << F2FS_I(inode)->i_log_cluster_size;
+	F2FS_I(inode)->i_flags |= F2FS_COMPR_FL;
+	set_inode_flag(inode, FI_COMPRESSED_FILE);
+	stat_inc_compr_inode(inode);
+}
+
 static inline u64 f2fs_disable_compressed_file(struct inode *inode)
 {
 	struct f2fs_inode_info *fi = F2FS_I(inode);
@@ -3963,6 +3964,8 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
 		return true;
 	if (f2fs_is_multi_device(sbi))
 		return true;
+	if (f2fs_compressed_file(inode))
+		return true;
 	/*
 	 * for blkzoned device, fallback direct IO to buffered IO, so
 	 * all IOs can be serialized by log-structured write.
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index f66c4cd067f5..cd84b3d9aa17 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1831,7 +1831,6 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
 				return -EINVAL;
 
 			set_compress_context(inode);
-			stat_inc_compr_inode(inode);
 		}
 	}
 	if ((iflags ^ fi->i_flags) & F2FS_NOCOMP_FL) {
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index cf3a286106ed..2aa035422c0f 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -348,7 +348,6 @@ static int f2fs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
 		goto out;
 	f2fs_unlock_op(sbi);
 
-	stat_inc_compr_inode(inode);
 	f2fs_alloc_nid_done(sbi, ino);
 
 	d_instantiate_new(dentry, inode);
-- 
2.24.0.525.g8f36a354ae-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
