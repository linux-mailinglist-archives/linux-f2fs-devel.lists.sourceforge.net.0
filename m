Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EB19DB276
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Nov 2024 06:19:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tGWwI-0002q6-VG;
	Thu, 28 Nov 2024 05:19:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tGWwH-0002q0-RL
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Nov 2024 05:19:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iDnz3H/XmyzGleAhs0J7K4Tz2nIwaOQHxstlZ5KpVs0=; b=jGwoPAxo/mmzYd6P0v3reu+as8
 5aHFznRqLarv/QZTdggEk6zVunfweSysYS9QbFcNknoWCRFmKtt5Pxw+tOTfZV2aQVO8qSBKnXrKE
 AxHMuRSCuWm2WztaYmOkCFAp06IJZg4LYJid9e69CD2778/0W5TnBHk0K3MY91GoTIAU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iDnz3H/XmyzGleAhs0J7K4Tz2nIwaOQHxstlZ5KpVs0=; b=JCz+infD1tfkgUpIBhPQC/HmUD
 vaRWYo5DU49cyQON2H52uPIDjZ54mv8TrVFGZ7Jqml6E5FfJbCnWa5zXwhJKUYrffT4JLpzDHRbJh
 2rR2dl40TCaaQZuA8y/8Ucp6KFFsxxCWV8DxJ1ITeOJtzAd7var40U+nT47/tKgtcNsI=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tGWwH-0004fP-6R for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Nov 2024 05:19:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=iDnz3H/XmyzGleAhs0J7K4Tz2nIwaOQHxstlZ5KpVs0=; b=hPj1tYcj87LpkJe2LXuggfT9MS
 KtFzBOyxbxVvU/sCx84CA3Bqrc1JaOARZDHPrqZK7Xdo92tpgrmdFBn0jubw35R8TWscJeU9h8PBr
 /6YsVajgDQCPW4IYDCck9udTr+BcedCMt08Kp4eVnkqtg/WlcPFq7brUKa6pwGkji3/f4QX9vzaYm
 XQXVo0OBp62X0tw90nMY+zXAerwbHoMAsdeAYNxnShfC5x0Gvx3+9rxbyOlgyut1Qt1kyyKKfEqBG
 jmrbIqQtNEaHU/DqjLQNw5U5/BRbrc+xX8xANqgb1k64F0+FhsnSgLkvnfxgpV6jekFTa8JUvv0ja
 wgBd90og==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tGWbr-00000002DG5-0aRk; Thu, 28 Nov 2024 04:58:35 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu, 28 Nov 2024 04:58:23 +0000
Message-ID: <20241128045828.527559-9-willy@infradead.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241128045828.527559-1-willy@infradead.org>
References: <20241128045828.527559-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Cache the result of page_folio(fio->page) in a local variable
 so we don't have to keep calling it. Saves a couple of calls to
 compound_head()
 and removes an access to page->mapping. Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org> --- fs/f2fs/data.c | 8 ++++---- 1 file changed,
 4 insertions(+), 4 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1tGWwH-0004fP-6R
Subject: [f2fs-dev] [PATCH 08/11] f2fs: Use a folio more in
 f2fs_submit_page_bio()
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
Cc: "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Cache the result of page_folio(fio->page) in a local variable so
we don't have to keep calling it.  Saves a couple of calls to
compound_head() and removes an access to page->mapping.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index aa08ab387e58..cae5fa895b97 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -684,6 +684,7 @@ void f2fs_flush_merged_writes(struct f2fs_sb_info *sbi)
 int f2fs_submit_page_bio(struct f2fs_io_info *fio)
 {
 	struct bio *bio;
+	struct folio *fio_folio = page_folio(fio->page);
 	struct page *page = fio->encrypted_page ?
 			fio->encrypted_page : fio->page;
 
@@ -697,8 +698,8 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
 	/* Allocate a new bio */
 	bio = __bio_alloc(fio, 1);
 
-	f2fs_set_bio_crypt_ctx(bio, fio->page->mapping->host,
-			page_folio(fio->page)->index, fio, GFP_NOIO);
+	f2fs_set_bio_crypt_ctx(bio, fio_folio->mapping->host,
+			fio_folio->index, fio, GFP_NOIO);
 
 	if (bio_add_page(bio, page, PAGE_SIZE, 0) < PAGE_SIZE) {
 		bio_put(bio);
@@ -706,8 +707,7 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
 	}
 
 	if (fio->io_wbc && !is_read_io(fio->op))
-		wbc_account_cgroup_owner(fio->io_wbc, page_folio(fio->page),
-					 PAGE_SIZE);
+		wbc_account_cgroup_owner(fio->io_wbc, fio_folio, PAGE_SIZE);
 
 	inc_page_count(fio->sbi, is_read_io(fio->op) ?
 			__read_io_type(page) : WB_DATA_TYPE(fio->page, false));
-- 
2.45.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
