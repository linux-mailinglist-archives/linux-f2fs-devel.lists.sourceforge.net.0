Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8437A379368
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 May 2021 18:10:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lg8Tw-0000fz-PC; Mon, 10 May 2021 16:10:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lg8Tv-0000fr-6N
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 16:10:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uQHnJrtktALEqem+hCPibbBCdIujn04Aiu/7JrYjIqQ=; b=PwXDVOxNyrOp9UmrE8l8/WDO5P
 RuhtMnqdxMwydTfnTi8IJKhYl6ysxWCLyehcnJqFzIXYsyqtErpYC7qmIsOjcXcJQBvcArbBwMxqf
 tnFYgrN7tR+jwCIDLzDtquXfweOAMsH8vLiJDSIbfradN3AsGakrllhwOjMhyw4iNjQ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uQHnJrtktALEqem+hCPibbBCdIujn04Aiu/7JrYjIqQ=; b=N0sZHRcsiwa7RCqt9WN/4MGwKy
 Ni6nh4R1Ra1Hgs7nl8NG1DapaaDsEkditKrkK16VtfXbDH4E1UiFXJnLAVx/JDmu+TQSyh+oFphqU
 oAV9Lzg5vg/mlDjokx3fuycViOiuQVOFN0KksowMtZkyGpoyLU9mmS+nkCNJzYXZiyAQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lg8Tn-002NuT-1w
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 16:10:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 78ED96108B;
 Mon, 10 May 2021 16:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620662993;
 bh=OeMcOYr8TZ/o6MhIlP2/j3/CcS6n961yxSdIDXmvodI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u+0D1TxUJGcewnlne7UdPyqxTkt+b4C6AX9EoG0X22OZvUHeaD3lh84zEHdt1dLkj
 545rmDbAAeHQCSl8/J/HvuBD54SFgIw+3t5pW1CdbIW3PK0xC+b/peCgTgfCyyh+mo
 N1bXUF1c2x3FEj76lGhK87BIFOWHbWn7a+diyBtz+4J3qzBsXew+OV7gmV2BpNeH/j
 4oPAQXlWgMszQJ5N2mMSGKUXwk3YX8aSNfhQ3bkVgv/x6GJVGQ6KycfStolZ3isX6O
 HppxZH5bznmqvzZNWhH+tmCZyPlAmV4kDxyqze2prsMT4qa90vViPYxp83dIC7lFlh
 Sc1weUMravF6g==
Date: Mon, 10 May 2021 09:09:51 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YJlaz20Atq+TUnHu@google.com>
References: <20210510093032.35466-1-yuchao0@huawei.com>
 <20210510093032.35466-3-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210510093032.35466-3-yuchao0@huawei.com>
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
X-Headers-End: 1lg8Tn-002NuT-1w
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs: compress: fix to assign
 cc.cluster_idx correctly
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

On 05/10, Chao Yu wrote:
> In f2fs_destroy_compress_ctx(), after f2fs_destroy_compress_ctx(),
> cc.cluster_idx will be cleared w/ NULL_CLUSTER, f2fs_cluster_blocks()
> may check wrong cluster metadata, fix it.
> 
> Fixes: 4c8ff7095bef ("f2fs: support data compression")
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fs/f2fs/compress.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 340815cd0887..30b003447510 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1066,6 +1066,8 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
>  			f2fs_put_rpages(cc);
>  			f2fs_unlock_rpages(cc, i + 1);
>  			f2fs_destroy_compress_ctx(cc);
> +			cc->cluster_idx = index >>
> +					F2FS_I(cc->inode)->i_log_cluster_size;

I didn't test tho, how about this?

From 904abb77e82ea982f68960148b75d0a12f771c2e Mon Sep 17 00:00:00 2001
From: Chao Yu <yuchao0@huawei.com>
Date: Mon, 10 May 2021 17:30:32 +0800
Subject: [PATCH] f2fs: compress: fix to assign cc.cluster_idx correctly

In f2fs_destroy_compress_ctx(), after f2fs_destroy_compress_ctx(),
cc.cluster_idx will be cleared w/ NULL_CLUSTER, f2fs_cluster_blocks()
may check wrong cluster metadata, fix it.

Fixes: 4c8ff7095bef ("f2fs: support data compression")
Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/compress.c | 17 +++++++++--------
 fs/f2fs/data.c     |  6 +++---
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 79348bc56e35..925a5ca3744a 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -145,13 +145,14 @@ int f2fs_init_compress_ctx(struct compress_ctx *cc)
 	return cc->rpages ? 0 : -ENOMEM;
 }
 
-void f2fs_destroy_compress_ctx(struct compress_ctx *cc)
+void f2fs_destroy_compress_ctx(struct compress_ctx *cc, bool reuse)
 {
 	page_array_free(cc->inode, cc->rpages, cc->cluster_size);
 	cc->rpages = NULL;
 	cc->nr_rpages = 0;
 	cc->nr_cpages = 0;
-	cc->cluster_idx = NULL_CLUSTER;
+	if (!reuse)
+		cc->cluster_idx = NULL_CLUSTER;
 }
 
 void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct page *page)
@@ -1034,7 +1035,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 		ret = f2fs_read_multi_pages(cc, &bio, cc->cluster_size,
 					&last_block_in_bio, false, true);
 		f2fs_put_rpages(cc);
-		f2fs_destroy_compress_ctx(cc);
+		f2fs_destroy_compress_ctx(cc, true);
 		if (ret)
 			goto out;
 		if (bio)
@@ -1061,7 +1062,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 release_and_retry:
 			f2fs_put_rpages(cc);
 			f2fs_unlock_rpages(cc, i + 1);
-			f2fs_destroy_compress_ctx(cc);
+			f2fs_destroy_compress_ctx(cc, true);
 			goto retry;
 		}
 	}
@@ -1094,7 +1095,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 unlock_pages:
 	f2fs_put_rpages(cc);
 	f2fs_unlock_rpages(cc, i);
-	f2fs_destroy_compress_ctx(cc);
+	f2fs_destroy_compress_ctx(cc, true);
 out:
 	return ret;
 }
@@ -1130,7 +1131,7 @@ bool f2fs_compress_write_end(struct inode *inode, void *fsdata,
 		set_cluster_dirty(&cc);
 
 	f2fs_put_rpages_wbc(&cc, NULL, false, 1);
-	f2fs_destroy_compress_ctx(&cc);
+	f2fs_destroy_compress_ctx(&cc, false);
 
 	return first_index;
 }
@@ -1350,7 +1351,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 	f2fs_put_rpages(cc);
 	page_array_free(cc->inode, cc->cpages, cc->nr_cpages);
 	cc->cpages = NULL;
-	f2fs_destroy_compress_ctx(cc);
+	f2fs_destroy_compress_ctx(cc, false);
 	return 0;
 
 out_destroy_crypt:
@@ -1512,7 +1513,7 @@ int f2fs_write_multi_pages(struct compress_ctx *cc,
 	err = f2fs_write_raw_pages(cc, submitted, wbc, io_type);
 	f2fs_put_rpages_wbc(cc, wbc, false, 0);
 destroy_out:
-	f2fs_destroy_compress_ctx(cc);
+	f2fs_destroy_compress_ctx(cc, false);
 	return err;
 }
 
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 96f1a354f89f..33e56ae84e35 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2287,7 +2287,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
 							max_nr_pages,
 							&last_block_in_bio,
 							rac != NULL, false);
-				f2fs_destroy_compress_ctx(&cc);
+				f2fs_destroy_compress_ctx(&cc, false);
 				if (ret)
 					goto set_error_page;
 			}
@@ -2332,7 +2332,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
 							max_nr_pages,
 							&last_block_in_bio,
 							rac != NULL, false);
-				f2fs_destroy_compress_ctx(&cc);
+				f2fs_destroy_compress_ctx(&cc, false);
 			}
 		}
 #endif
@@ -3033,7 +3033,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 		}
 	}
 	if (f2fs_compressed_file(inode))
-		f2fs_destroy_compress_ctx(&cc);
+		f2fs_destroy_compress_ctx(&cc, false);
 #endif
 	if (retry) {
 		index = 0;
-- 
2.31.1.607.g51e8a6a459-goog


>  			goto retry;
>  		}
>  	}
> -- 
> 2.29.2


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
