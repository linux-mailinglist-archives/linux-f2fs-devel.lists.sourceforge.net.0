Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CC5129127
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Dec 2019 04:32:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ijESQ-00025r-Eg; Mon, 23 Dec 2019 03:32:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1ijESO-00025f-3i
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Dec 2019 03:32:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0NnpOu8rZb5GP4QeWLUOolb9Yh15CdxWL78Dg56ZvJk=; b=efoYFlBlfiR5v4YidzIqoCXhy5
 0FIDz+XyFeIVJyP7qeLfzdALm5IOQsnkkzcOqlTg7IjfPU0qScgGcFVueQPKBY1FbIkZOLmZD7nW2
 a66z54b9vKcaQsIFBysVmLRTsAT+fg/81C6Jc4GqxsDB/zzCOdFuQugrdX/K2YySmVQw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0NnpOu8rZb5GP4QeWLUOolb9Yh15CdxWL78Dg56ZvJk=; b=HWkRq+F/CV8vAj21xwjSss9z8D
 8RaSPm810THYowzoPSdF9KfVjZR5tu7IhrZSGISr/5xOJDDAgEQLf6L8Y6pUW1owuyftq47tHNhEA
 +avc3ppiaR7FsbGTn+SkfDzSb9howssvNh+N+hR4o32fPu7VoHzrc83XOEfzcAUBmbeE=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ijESK-00CjCQ-F4
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Dec 2019 03:32:32 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 405A5E37A462FA301091;
 Mon, 23 Dec 2019 11:32:19 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 23 Dec
 2019 11:32:14 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20191216062806.112361-1-yuchao0@huawei.com>
 <20191218214619.GA20072@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <c7035795-73b3-d832-948f-deb36213ba07@huawei.com>
Date: Mon, 23 Dec 2019 11:32:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191218214619.GA20072@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1ijESK-00CjCQ-F4
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

Hi Jaegeuk,

Sorry for the delay.

On 2019/12/19 5:46, Jaegeuk Kim wrote:
> Hi Chao,
> 
> I still see some diffs from my latest testing version, so please check anything
> that you made additionally from here.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=25d18e19a91e60837d36368ee939db13fd16dc64

I've checked the diff and picked up valid parts, could you please check and
comment on it?

---
 fs/f2fs/compress.c |  8 ++++----
 fs/f2fs/data.c     | 18 +++++++++++++++---
 fs/f2fs/f2fs.h     |  3 +++
 fs/f2fs/file.c     |  1 -
 4 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index af23ed6deffd..1bc86a54ad71 100644
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
@@ -762,7 +762,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 	if (err)
 		goto out_unlock_op;

-	psize = (cc->rpages[last_index]->index + 1) << PAGE_SHIFT;
+	psize = (loff_t)(cc->rpages[last_index]->index + 1) << PAGE_SHIFT;

 	err = f2fs_get_node_info(fio.sbi, dn.nid, &ni);
 	if (err)
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 19cd03450066..f1f5c701228d 100644
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
@@ -507,10 +512,16 @@ static bool __has_merged_page(struct bio *bio, struct inode *inode,
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
@@ -2039,6 +2050,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 	if (ret)
 		goto out;

+	/* cluster was overwritten as normal cluster */
 	if (dn.data_blkaddr != COMPRESS_ADDR)
 		goto out;

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5d55cef66410..17d2af4eeafb 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2719,6 +2719,7 @@ static inline void set_compress_context(struct inode *inode)
 			1 << F2FS_I(inode)->i_log_cluster_size;
 	F2FS_I(inode)->i_flags |= F2FS_COMPR_FL;
 	set_inode_flag(inode, FI_COMPRESSED_FILE);
+	stat_inc_compr_inode(inode);
 }

 static inline unsigned int addrs_per_inode(struct inode *inode)
@@ -3961,6 +3962,8 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
 		return true;
 	if (f2fs_is_multi_device(sbi))
 		return true;
+	if (f2fs_compressed_file(inode))
+		return true;
 	/*
 	 * for blkzoned device, fallback direct IO to buffered IO, so
 	 * all IOs can be serialized by log-structured write.
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index bde5612f37f5..9aeadf14413c 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1828,7 +1828,6 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
 				return -EINVAL;

 			set_compress_context(inode);
-			stat_inc_compr_inode(inode);
 		}
 	}
 	if ((iflags ^ fi->i_flags) & F2FS_NOCOMP_FL) {
-- 
2.18.0.rc1

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
