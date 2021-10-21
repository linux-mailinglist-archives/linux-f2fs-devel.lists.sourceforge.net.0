Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C57AF43645A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Oct 2021 16:34:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mdZ8u-0006iH-1p; Thu, 21 Oct 2021 14:34:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mdZ8s-0006iA-5l
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Oct 2021 14:34:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VYTqvTLLIt1crnlhrhHTCVfJhZ004BCB73osKRZ+awo=; b=R7Pt9R970zRmz6LNA5l77h1Aci
 EKcrOZw6qypUnGH7BJQhhI4lLzuvIpW/PKEVovxA9V45JEWxILMQVUKkREyjOi8SQDBNDRWKeAfXk
 +PRaEZf4fVR2duz9Azb+dW2CPSw5REojOVh60ygtkcZLBNiRUF4Q28E/HdzDeFi+AEfE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VYTqvTLLIt1crnlhrhHTCVfJhZ004BCB73osKRZ+awo=; b=hAkSWWMIcDgeBx2TeVL2NlAES3
 RqL77HHHjazJsCA3szAMHHKBdTlXNF+D94+zYFbS/46+4zlcWi7hrZ7y+Il+i0Mh1A8WbBzF+I99e
 Ix0WZDRQ54nUhCBcJmUwzbYPR942wWtteZtTn/hKVCfqJ9OQgKb5MP2AIgRiYg32YTWU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mdZ8p-0005q6-T9
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Oct 2021 14:34:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 67CA76121F;
 Thu, 21 Oct 2021 14:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634826829;
 bh=/ROjjnoiYwY3ZWNZLnk87GdJc1msK3VKfgjS0/Y9WmE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IOPrVOEXhI8z7NU79HaLJ4+yKWkqNZNWHRl7ItZCMdobHDGZnXZmTBz+XrWu6Tq7l
 3jX/GUHozcrt8ZXsrtS/PnZV3ShlWI8lAogveyTfIaF/M6kA4+ZVr75EbOdblf8w9J
 wSol0Drz6WoXaNRHNVmxUdQ/8ADlyl+CTKfJ69F2h5hssepk2lTShBseF2nEi8D3Eg
 paRXPfbW3OeoBWnGm4NmB74nKdEE0lYBteyaSWyk7wbyTYzIMymxwyVNaP6dEfnqoY
 D0u0jKED+aa38MRclbN33svBaJBiL8SWAVrlpCmy805aZFmAC8Pk3EN4Sl1QMBkEcL
 gcly20+OUUKVg==
Message-ID: <aac61060-2add-bfa0-e25a-f3c836ff1d0b@kernel.org>
Date: Thu, 21 Oct 2021 22:33:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org
References: <20211014131243.148009-1-changfengnan@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20211014131243.148009-1-changfengnan@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/10/14 21:12, Fengnan Chang wrote: > when overwrite
 only first block of cluster, since cluster is not full,
 it > will call f2fs_write_raw_pages
 when f2fs_write_multi_pages, and cause the > whol [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mdZ8p-0005q6-T9
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress: fix overwrite may reduce
 compress ratio unproperly
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/10/14 21:12, Fengnan Chang wrote:
> when overwrite only first block of cluster, since cluster is not full, it
> will call f2fs_write_raw_pages when f2fs_write_multi_pages, and cause the
> whole cluster become uncompressed eventhough data can be compressed.
> this may will make random write bench score reduce a lot.
> 
> root# dd if=/dev/zero of=./fio-test bs=1M count=1
> 
> root# sync
> 
> root# echo 3 > /proc/sys/vm/drop_caches
> 
> root# f2fs_io get_cblocks ./fio-test
> 
> root# dd if=/dev/zero of=./fio-test bs=4K count=1 oflag=direct conv=notrunc
> 
> w/o patch:
> root# f2fs_io get_cblocks ./fio-test
> 189
> 
> w/ patch:
> root# f2fs_io get_cblocks ./fio-test
> 192
> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> ---
>   fs/f2fs/compress.c | 12 ++++++++++++
>   fs/f2fs/data.c     |  7 +++++++
>   fs/f2fs/f2fs.h     |  1 +
>   3 files changed, 20 insertions(+)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index c1bf9ad4c220..c4f36ead6f17 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -857,6 +857,18 @@ void f2fs_end_read_compressed_page(struct page *page, bool failed,
>   		f2fs_decompress_cluster(dic);
>   }
>   
> +bool is_page_same_cluster(struct compress_ctx *cc, struct pagevec *pvec, int index)

Fengnan,

It needs add f2fs prefix for non-static symbol to avoid global namespace
pollution.

Anyway, how about this?

---
  fs/f2fs/compress.c | 19 +++++++++++++++++++
  fs/f2fs/data.c     |  7 ++++---
  fs/f2fs/f2fs.h     |  2 ++
  3 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index c1bf9ad4c220..15d9b89d4df0 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -881,6 +881,25 @@ bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index)
  	return is_page_in_cluster(cc, index);
  }

+bool f2fs_all_cluster_page_loaded(struct compress_ctx *cc, struct pagevec *pvec,
+						int index, int nr_pages)
+{
+	unsigned long pgidx;
+	int i;
+
+	if (nr_pages - index < cc->cluster_size)
+		return false;
+
+	pgidx = pvec->pages[index]->index;
+
+	for (i = 1; i < cc->cluster_size; i++) {
+		if (pvec->pages[index + i]->index != pgidx + i)
+			return false;
+	}
+
+	return true;
+}
+
  static bool cluster_has_invalid_data(struct compress_ctx *cc)
  {
  	loff_t i_size = i_size_read(cc->inode);
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 14fe5c6216cc..b0665f69c093 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3075,9 +3075,10 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
  						done = 1;
  						break;
  					} else if (ret2 &&
-						!f2fs_compress_write_end(inode,
-								fsdata, page->index,
-								1)) {
+						(!f2fs_compress_write_end(inode,
+							fsdata, page->index, 1) ||
+						!f2fs_all_cluster_page_loaded(&cc,
+							&pvec, i, nr_pages))) {
  						retry = 1;
  						break;
  					}
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 7a32c2127945..b8da34198ce0 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4047,6 +4047,8 @@ void f2fs_end_read_compressed_page(struct page *page, bool failed,
  							block_t blkaddr);
  bool f2fs_cluster_is_empty(struct compress_ctx *cc);
  bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index);
+bool f2fs_all_cluster_page_loaded(struct compress_ctx *cc, struct pagevec *pvec,
+						int index, int nr_pages);
  bool f2fs_sanity_check_cluster(struct dnode_of_data *dn);
  void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct page *page);
  int f2fs_write_multi_pages(struct compress_ctx *cc,
-- 
2.32.0




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
