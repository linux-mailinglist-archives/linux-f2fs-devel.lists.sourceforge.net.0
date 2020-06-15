Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BEC1F8CC7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2020 06:00:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jkgIT-0000Hb-UJ; Mon, 15 Jun 2020 04:00:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1jkgIM-0000HN-Ce
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Jun 2020 04:00:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rvlhkCuZ5VUxKKXOuJwsA7QKYoeGB8xhQ9DEWLaKiH0=; b=B2Hxs4r9yJ/qO0+zRs6Bvu1k/y
 91ZYbkNbkVzy9oH+A4CclCjWD10LdIGV4nkC05SG7LK9Fl79O+IGWJzMPtCylzMsvmhNG9HEUOJPM
 qL9czajyEQ+1BneoYozauK9YrtvN6RaL2rgA9jitWRB3dWdtH9u+gI7rvA8JnlShdgK4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rvlhkCuZ5VUxKKXOuJwsA7QKYoeGB8xhQ9DEWLaKiH0=; b=V5EcGedRnoZGg4CIpzJDNCyhbC
 PmlbwwXepIvuYK086Sqf7PX9l4dpVFVkVmEFayJLlRVLkw3OyGaCn0m91XUhdBeE6SLKAEGtGpsBX
 TEISEifJsKgTGK+NOO2RJzr2hUZkhr/zGeXhlTywxqiP/MGfpHNA7RE282srvdXev3J4=;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jkgID-0031DJ-KF
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Jun 2020 04:00:26 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1592193619; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=rvlhkCuZ5VUxKKXOuJwsA7QKYoeGB8xhQ9DEWLaKiH0=;
 b=Tc0X8VyhsyuPP+8vwG6lVeOIMwhPF9XZl06FXZvfzymUjxXF/6P+ZE0qPyfi9Ku6X85IpGKP
 aq1KYVWyHJ1DN/kF9SqnMr7yHwsvWc68Odb5PV+Z1XN3+510PzAXylxUjWBAHwMGTMQSO1dt
 wcgXkwI6MlxmlpGCpBs9GJMDm/c=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5ee6f242356bcc26abf15c4b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Jun 2020 04:00:02
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7C2CBC433A0; Mon, 15 Jun 2020 04:00:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: stummala)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3AB4BC433CA;
 Mon, 15 Jun 2020 03:59:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3AB4BC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 Eric Biggers <ebiggers@kernel.org>, Satya Tangirala <satyat@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 15 Jun 2020 09:29:48 +0530
Message-Id: <1592193588-21701-1-git-send-email-stummala@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [69.72.43.7 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [69.72.43.7 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jkgID-0031DJ-KF
Subject: [f2fs-dev] [PATCH] f2fs: fix use-after-free when accessing
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
Cc: linux-kernel@vger.kernel.or
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

There could be a potential race between these two paths below,
leading to use-after-free when accessing bio->bi_crypt_context.

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
This fix is rebased to the tip of fscrypt git -
https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
branch - inline-encryption

 fs/f2fs/data.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 0dfa8d3..3b53554 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -762,9 +762,10 @@ static void del_bio_entry(struct bio_entry *be)
 	kmem_cache_free(bio_entry_slab, be);
 }
 
-static int add_ipu_page(struct f2fs_sb_info *sbi, struct bio **bio,
-							struct page *page)
+static int add_ipu_page(struct f2fs_io_info *fio, struct bio **bio,
+				struct page *page, int *bio_needs_submit)
 {
+	struct f2fs_sb_info *sbi = fio->sbi;
 	enum temp_type temp;
 	bool found = false;
 	int ret = -EAGAIN;
@@ -780,6 +781,15 @@ static int add_ipu_page(struct f2fs_sb_info *sbi, struct bio **bio,
 				continue;
 
 			found = true;
+			if (*bio && (!page_is_mergeable(sbi, *bio,
+					*fio->last_block, fio->new_blkaddr) ||
+				    !f2fs_crypt_mergeable_bio(*bio,
+					  fio->page->mapping->host,
+					  fio->page->index, fio))) {
+				ret = 0;
+				*bio_needs_submit = 1;
+				break;
+			}
 
 			if (bio_add_page(*bio, page, PAGE_SIZE, 0) ==
 							PAGE_SIZE) {
@@ -864,6 +874,7 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 	struct bio *bio = *fio->bio;
 	struct page *page = fio->encrypted_page ?
 			fio->encrypted_page : fio->page;
+	int bio_needs_submit = 0;
 
 	if (!f2fs_is_valid_blkaddr(fio->sbi, fio->new_blkaddr,
 			__is_meta_io(fio) ? META_GENERIC : DATA_GENERIC))
@@ -872,11 +883,6 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
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
@@ -886,8 +892,12 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 
 		add_bio_entry(fio->sbi, bio, page, fio->temp);
 	} else {
-		if (add_ipu_page(fio->sbi, &bio, page))
+		if (add_ipu_page(fio, &bio, page, &bio_needs_submit))
+			goto alloc_new;
+		if (bio_needs_submit) {
+			f2fs_submit_merged_ipu_write(fio->sbi, &bio, NULL);
 			goto alloc_new;
+		}
 	}
 
 	if (fio->io_wbc)
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
