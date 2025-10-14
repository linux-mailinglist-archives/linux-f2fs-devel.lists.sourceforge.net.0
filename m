Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1605CBD7908
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Oct 2025 08:28:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/4uId9+w7hzqYbLKLJGVDeCfgXqtqyCeQPxQ8x9WMR4=; b=WI5fvyAv+Bu4Y4jzEzcS1p4C2Z
	6ii2aAzDXq4hnfTZoP3fUrdZr5I4vp+PA3gm7wooOEj6V4I5eBQmLtXDcsNSU/kc8x0UVZjFHtzgB
	+CQPUaqeYbCfpk0EfPG5RJnIA5ctv7xjqEW/xUKON1uCYg8nuwB+HeqXThs/B2sErKFI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v8YVI-0008H0-A4;
	Tue, 14 Oct 2025 06:27:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v8YVG-0008Gt-6h
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 06:27:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w0UF21LErYax9FY/A7OAW/d7WDsDJg6ijqN1COXyeS8=; b=N1LumarAcwFgsrx9W+CrGHQeuh
 OuRqsJdTnaNlKwHKREE9sz7k8YKpxebJbPO+a2n1fT2S8r8tTUqFeSJqQ51JrMyI1qQWJkW3yw/cp
 9pZ+/xYosrjDzNnRfgKiUk6rhF7lz/o+a6AEf6eHNciY6k4NyXeIepODDP/CsZKS2erQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=w0UF21LErYax9FY/A7OAW/d7WDsDJg6ijqN1COXyeS8=; b=F
 rF/I/8SuRdQ1K93SSk2G0dWDvYgjQOuadQ/NE1Za2AYXsAruaP9Uf8LY28p+s0wTId0mLhM4zaHnk
 aN4YQzdWtk5t0+K4DHcLaHM1btQv6RIpGLnrsyCWyBqPc8UhEcceVX6ROMkyEkw09oG8i4Z1KeT0N
 ccVN6mbzLSiwx8Cg=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v8YVE-0001hr-OE for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 06:27:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1370D621BB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Oct 2025 06:27:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D05F6C4CEE7;
 Tue, 14 Oct 2025 06:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760423229;
 bh=5l9A5JJC7HoCgkgNBAkY442qtM7rkd2EIFEaDAIJIMU=;
 h=From:To:Cc:Subject:Date:From;
 b=NPAacUhItq15Y9mwO0PO0P//CUmzJy6k1IhnUl5PjpBvJ8Rb2eiuMo99KULXjHr7m
 dmdH8LdDwV0m/q15FLtUZ6hwFPIaPOYcpNBKHNZ5MPVY7oYSV/sEk0i83/L3oDB5z5
 lBalEoK1fTWkzJ7Vl2zQy0TKtPJWzPSYNal8eRvT8NI8RHJOrWuu+EFKatSim34P4b
 DxKFSaE+QDtyAfjQUXR7u5cd9dkNpdfR6CgrefVF3njgeWgleUTWGBdCE5ODQ+G97O
 ct85EqRY69qJaLBZUs02BcKTXOE8VFyHrr1/oaJufFnN5K7d1mvmkQl0d9WbcnqX3w
 laNZniYJxihxg==
To: jaegeuk@kernel.org
Date: Tue, 14 Oct 2025 14:27:01 +0800
Message-ID: <20251014062704.1734984-1-chao@kernel.org>
X-Mailer: git-send-email 2.51.0.760.g7b8bcc2412-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In add_bio_entry(),
 adding a page to newly allocated bio should
 never fail, let's use bio_add_folio_nofail() instead of bio_add_page() &
 unnecessary error handling for cleanup. Signed-off-by: Chao Yu
 <chao@kernel.org>
 --- fs/f2fs/data.c | 7 +++---- 1 file changed, 3 insertions(+), 4 deletions(-)
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v8YVE-0001hr-OE
Subject: [f2fs-dev] [PATCH 1/4] f2fs: clean up w/ bio_add_folio_nofail()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In add_bio_entry(), adding a page to newly allocated bio should never fail,
let's use bio_add_folio_nofail() instead of bio_add_page() & unnecessary
error handling for cleanup.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 775aa4f63aa3..50538c26c1a1 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -752,7 +752,7 @@ static bool io_is_mergeable(struct f2fs_sb_info *sbi, struct bio *bio,
 }
 
 static void add_bio_entry(struct f2fs_sb_info *sbi, struct bio *bio,
-				struct page *page, enum temp_type temp)
+				struct folio *folio, enum temp_type temp)
 {
 	struct f2fs_bio_info *io = sbi->write_io[DATA] + temp;
 	struct bio_entry *be;
@@ -761,8 +761,7 @@ static void add_bio_entry(struct f2fs_sb_info *sbi, struct bio *bio,
 	be->bio = bio;
 	bio_get(bio);
 
-	if (bio_add_page(bio, page, PAGE_SIZE, 0) != PAGE_SIZE)
-		f2fs_bug_on(sbi, 1);
+	bio_add_folio_nofail(bio, folio, folio_size(folio), 0);
 
 	f2fs_down_write(&io->bio_list_lock);
 	list_add_tail(&be->list, &io->bio_list);
@@ -904,7 +903,7 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 		f2fs_set_bio_crypt_ctx(bio, folio->mapping->host,
 				folio->index, fio, GFP_NOIO);
 
-		add_bio_entry(fio->sbi, bio, &data_folio->page, fio->temp);
+		add_bio_entry(fio->sbi, bio, data_folio, fio->temp);
 	} else {
 		if (add_ipu_page(fio, &bio, &data_folio->page))
 			goto alloc_new;
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
