Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEF09DB277
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Nov 2024 06:19:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tGWwP-000416-Sy;
	Thu, 28 Nov 2024 05:19:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tGWwN-00040y-TM
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Nov 2024 05:19:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SJIcrqwYpxuO704JLFnwLpuGWhIyh/wiS2FicWYLn/0=; b=l5Uu1pGsHoulcXeiXfQkjtEYU/
 bCOnajl/tzIcz4pzyYvWtXp4AvmdybVmlShw016fx8scTXiDLDQUMKxAT0kPmdHsGBDRkLKuPQw63
 a02xGP8rhMTtZR0sYQHGpsDQH9Gk3uY5S61zb5pH0kvW01YoGoL/feFOkkYY4/rXniT8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SJIcrqwYpxuO704JLFnwLpuGWhIyh/wiS2FicWYLn/0=; b=fVAPSlXtVh0Na09f3S9/leSUpQ
 D7CyylZaNopCoQbpl7Jx/1sp1ehNX7ZdCgEnkzWuJ9BZbkk7b7NshsTe/SeAJMT4Qd90+xzbkQqkD
 3aC1Eeuey8tRWxTqdhqestXUns9As0OL3GEgCEWlkzs92hinx1oj1O6j81JMc1mqv2Bg=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tGWwO-0004g2-3C for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Nov 2024 05:19:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=SJIcrqwYpxuO704JLFnwLpuGWhIyh/wiS2FicWYLn/0=; b=RJQ4Zef2XQZwrhDfQnJeb1eMqX
 45UxYoB2fyVdYhgEXBe88UTpF2b1xvOAnARsHKUDa2muAAoyaz3H8+6dUv/4xQ60hZ2z8xM8Ztstj
 uZp48W/lABlSxwkflyuzXNdJupbe3UZlW40A/wX3Y+OG+7UiHCMiyWuS8dbwV1HPk+NvNXr4VeFKF
 qKT9GUWidSA5iug0yRYJuHqLsX28wqWwmi/oGrJNHmEUjoy/q0PYl4ugcT6DfxQqMBO4voIYXn+tW
 XawS+iLSaXWEZHji2dxNHPQkRhqiutKZFG7k0KS12CWywa8xd/7ZveKS/9vPCgYOdzP0UiyFrpqGQ
 QyY3/stg==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tGWbr-00000002DGH-1kcH; Thu, 28 Nov 2024 04:58:35 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu, 28 Nov 2024 04:58:25 +0000
Message-ID: <20241128045828.527559-11-willy@infradead.org>
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
 Content preview: Remove the last call to page_file_mapping() as both callers
 can now pass in a folio. Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/data.c | 8 ++++---- 1 file changed, 4 insertions(+), 4 deletions(-)
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1tGWwO-0004g2-3C
Subject: [f2fs-dev] [PATCH 10/11] f2fs: Convert __read_io_type() to take a
 folio
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

Remove the last call to page_file_mapping() as both callers can now pass
in a folio.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 30d727808c92..e68a4dd9bc17 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -70,9 +70,9 @@ bool f2fs_is_cp_guaranteed(struct page *page)
 	return false;
 }
 
-static enum count_type __read_io_type(struct page *page)
+static enum count_type __read_io_type(struct folio *folio)
 {
-	struct address_space *mapping = page_file_mapping(page);
+	struct address_space *mapping = folio->mapping;
 
 	if (mapping) {
 		struct inode *inode = mapping->host;
@@ -150,7 +150,7 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 			continue;
 		}
 
-		dec_page_count(F2FS_F_SB(folio), __read_io_type(&folio->page));
+		dec_page_count(F2FS_F_SB(folio), __read_io_type(folio));
 		folio_end_read(folio, bio->bi_status == 0);
 	}
 
@@ -706,7 +706,7 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
 		wbc_account_cgroup_owner(fio->io_wbc, fio_folio, PAGE_SIZE);
 
 	inc_page_count(fio->sbi, is_read_io(fio->op) ?
-			__read_io_type(&data_folio->page) : WB_DATA_TYPE(fio->page, false));
+			__read_io_type(data_folio) : WB_DATA_TYPE(fio->page, false));
 
 	if (is_read_io(bio_op(bio)))
 		f2fs_submit_read_bio(fio->sbi, bio, fio->type);
-- 
2.45.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
