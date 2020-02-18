Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E58A1162475
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2020 11:22:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j401m-0002Ad-8C; Tue, 18 Feb 2020 10:22:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j401i-0002AM-Ag
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 10:22:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/lga67Fc0sly8XtZmfLpdzWRBUrOF62wweVHi98iUO8=; b=IyCbLI1ztZnI8BRC5FZfYS8j0e
 SY3VPGmYB1ZZzWSXew0dkFZW5cbqyvewaviL7ugzSZFeU3wQSiCAKi1LYBo253ukWnKYE6rgXD5i+
 fXTbFEum2jN7ZzZ42oZxUfjIX7HCQW2dD7i3wlFTCC9HeBgDupZ78aPoN8oLtUq7Zrao=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/lga67Fc0sly8XtZmfLpdzWRBUrOF62wweVHi98iUO8=; b=f
 kQ4WpcmItNBkBoayQFvj2DN3jHw5PQ/Du73c4aIdrEceWnrWM1er9SkFquAMHTke1Bk2+BhjYXOeq
 /2LDI9lxX9OCvJILdxo80ve1oCuAkc/wuOSkfNDre9CIkYUwq65B7yr2GUh7xzqyR0eABOQ/VbtD0
 fIgPUyn5T1eGNBXc=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j401d-00GOfz-AN
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 10:22:50 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 8861CB2F2C87A3264F37;
 Tue, 18 Feb 2020 18:22:35 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Tue, 18 Feb 2020 18:22:28 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 18 Feb 2020 18:21:34 +0800
Message-ID: <20200218102136.32150-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1j401d-00GOfz-AN
Subject: [f2fs-dev] [PATCH 1/3] f2fs: avoid __GFP_NOFAIL in f2fs_bio_alloc
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

__f2fs_bio_alloc() won't fail due to memory pool backend, remove unneeded
__GFP_NOFAIL flag in __f2fs_bio_alloc().

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/data.c | 12 ++++--------
 fs/f2fs/f2fs.h |  2 +-
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index baf12318ec64..3a4ece26928c 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -54,17 +54,13 @@ static inline struct bio *__f2fs_bio_alloc(gfp_t gfp_mask,
 	return bio_alloc_bioset(gfp_mask, nr_iovecs, &f2fs_bioset);
 }
 
-struct bio *f2fs_bio_alloc(struct f2fs_sb_info *sbi, int npages, bool no_fail)
+struct bio *f2fs_bio_alloc(struct f2fs_sb_info *sbi, int npages, bool noio)
 {
-	struct bio *bio;
-
-	if (no_fail) {
+	if (noio) {
 		/* No failure on bio allocation */
-		bio = __f2fs_bio_alloc(GFP_NOIO, npages);
-		if (!bio)
-			bio = __f2fs_bio_alloc(GFP_NOIO | __GFP_NOFAIL, npages);
-		return bio;
+		return __f2fs_bio_alloc(GFP_NOIO, npages);
 	}
+
 	if (time_to_inject(sbi, FAULT_ALLOC_BIO)) {
 		f2fs_show_injection_info(sbi, FAULT_ALLOC_BIO);
 		return NULL;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5316ac3eacdf..65f569949d42 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3343,7 +3343,7 @@ void f2fs_destroy_checkpoint_caches(void);
  */
 int __init f2fs_init_bioset(void);
 void f2fs_destroy_bioset(void);
-struct bio *f2fs_bio_alloc(struct f2fs_sb_info *sbi, int npages, bool no_fail);
+struct bio *f2fs_bio_alloc(struct f2fs_sb_info *sbi, int npages, bool noio);
 int f2fs_init_bio_entry_cache(void);
 void f2fs_destroy_bio_entry_cache(void);
 void f2fs_submit_bio(struct f2fs_sb_info *sbi,
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
