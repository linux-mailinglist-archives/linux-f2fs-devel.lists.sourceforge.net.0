Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E91D1F945B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2020 12:11:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jkm5p-0008Vi-0x; Mon, 15 Jun 2020 10:11:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1jkm5n-0008VU-Ji
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Jun 2020 10:11:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dLNkkb4smtmoselpWMZR4QCq3/ssl+2heJjtaJdJDAo=; b=iNRMDuqWOfVHHAF9XlUxHlDsUd
 DeSNXXV9ybKLkD1DkyBLS1jT6+BAqc0FJv/Cl1zNBuLhPQnxL1xsBB1rEl+qTrIrL6GPhAS6zwaAm
 gob226fKxYSa8xO8iFa9uHFMQ4/02i3s5LcOn/o44AszHc84sweiyVXBP1uzRhvcQpIE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dLNkkb4smtmoselpWMZR4QCq3/ssl+2heJjtaJdJDAo=; b=GGhtxOEz8OOM5nrCdptlbegYY2
 pcq/Ysb4IZbL2l6Z5tQtHfHM/z87U8PS0OM9254c4cklmx7WFhvoL/lPYRu37s2s1uL/X51PqhPjt
 1DhoYrMowkEODyrOEaqnN/zTil/3JAZ/3LaA3RkXwyhrNnPnRm1iOaedkstk/Sb6L8kQ=;
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jkm5k-003Gq8-1m
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Jun 2020 10:11:51 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1592215910; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=dLNkkb4smtmoselpWMZR4QCq3/ssl+2heJjtaJdJDAo=;
 b=manFQp7MR61RYPxzWd9CVQBkMKXu2iH1Wai7eI90GpIohTWjJFZvZX82iW6QDvpBaUMuZQrU
 xi32IHRzFIe4Gjvoe87JDXoywTYZqS2aHX9DkQtgLlMTBrFX9nu02gQPYKW1SsLNED52L4hP
 NtcwQxUV7bi+Hj07bLFtBWEh21Y=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5ee7495aad153efa3416ae4b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Jun 2020 10:11:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 04021C43387; Mon, 15 Jun 2020 10:11:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: stummala)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E5B0BC433CA;
 Mon, 15 Jun 2020 10:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E5B0BC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 Eric Biggers <ebiggers@kernel.org>, Satya Tangirala <satyat@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 15 Jun 2020 15:41:27 +0530
Message-Id: <1592215887-2744-1-git-send-email-stummala@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [104.130.122.27 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [104.130.122.27 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jkm5k-003Gq8-1m
Subject: [f2fs-dev] [PATCH v3] f2fs: fix use-after-free when accessing
 bio->bi_crypt_context
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
Cc: linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

There could be a potential race between these two paths below,
leading to use-after-free when accessing  bio->bi_crypt_context.

f2fs_write_cache_pages
->f2fs_do_write_data_page on page#1
  ->f2fs_inplace_write_data
    ->f2fs_merge_page_bio
      ->add_bio_entry
->f2fs_do_write_data_page on page#2
  ->f2fs_inplace_write_data
    ->f2fs_merge_page_bio
      ->f2fs_crypt_mergeable_bio
        ->fscrypt_mergeable_bio
  				       f2fs_write_begin on page#1
				       ->f2fs_wait_on_page_writeback
				         ->f2fs_submit_merged_ipu_write
					   ->__submit_bio
					The bio gets completed, calling
					bio_endio
					->bio_uninit
					  ->bio_crypt_free_ctx
	  ->use-after-free issue

Fix this by moving f2fs_crypt_mergeable_bio() check within
add_ipu_page() so that it's done under bio_list_lock to prevent
the above race.

Fixes: 15e76ad23e72 ("f2fs: add inline encryption support")
Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
---
v3:
  - remove duplicate bio_add_page(), which was missed in v2 by mistake

v2:
  - simplify the logic as per Eric's suggestion to submit the bio in
    add_ipu_page() itself instead of using f2fs_submit_merged_ipu_write()

 fs/f2fs/data.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 0dfa8d3..ea543f6 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -762,9 +762,10 @@ static void del_bio_entry(struct bio_entry *be)
 	kmem_cache_free(bio_entry_slab, be);
 }
 
-static int add_ipu_page(struct f2fs_sb_info *sbi, struct bio **bio,
+static int add_ipu_page(struct f2fs_io_info *fio, struct bio **bio,
 							struct page *page)
 {
+	struct f2fs_sb_info *sbi = fio->sbi;
 	enum temp_type temp;
 	bool found = false;
 	int ret = -EAGAIN;
@@ -780,14 +781,18 @@ static int add_ipu_page(struct f2fs_sb_info *sbi, struct bio **bio,
 				continue;
 
 			found = true;
-
-			if (bio_add_page(*bio, page, PAGE_SIZE, 0) ==
-							PAGE_SIZE) {
+			if (page_is_mergeable(sbi, *bio, *fio->last_block,
+						fio->new_blkaddr) &&
+			    f2fs_crypt_mergeable_bio(*bio,
+						    fio->page->mapping->host,
+						    fio->page->index, fio) &&
+			    bio_add_page(*bio, page, PAGE_SIZE, 0) ==
+					    PAGE_SIZE) {
 				ret = 0;
 				break;
 			}
 
-			/* bio is full */
+			/* page can't be merged into bio; submit the bio */
 			del_bio_entry(be);
 			__submit_bio(sbi, *bio, DATA);
 			break;
@@ -872,11 +877,6 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 	trace_f2fs_submit_page_bio(page, fio);
 	f2fs_trace_ios(fio, 0);
 
-	if (bio && (!page_is_mergeable(fio->sbi, bio, *fio->last_block,
-				       fio->new_blkaddr) ||
-		    !f2fs_crypt_mergeable_bio(bio, fio->page->mapping->host,
-					      fio->page->index, fio)))
-		f2fs_submit_merged_ipu_write(fio->sbi, &bio, NULL);
 alloc_new:
 	if (!bio) {
 		bio = __bio_alloc(fio, BIO_MAX_PAGES);
@@ -886,7 +886,7 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 
 		add_bio_entry(fio->sbi, bio, page, fio->temp);
 	} else {
-		if (add_ipu_page(fio->sbi, &bio, page))
+		if (add_ipu_page(fio, &bio, page))
 			goto alloc_new;
 	}
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
