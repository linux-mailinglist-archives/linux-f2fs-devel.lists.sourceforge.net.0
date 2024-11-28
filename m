Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 226F29DB275
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Nov 2024 06:19:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tGWw8-0006ZA-Eu;
	Thu, 28 Nov 2024 05:19:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tGWw6-0006Z1-KL
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Nov 2024 05:19:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DMYCD6A5DU3wmKj4OpzUGVB06E/Ax6cvClbm1RVzyrc=; b=PQJZW8t2v0jdXjRRMD0D4C5+pZ
 D1KFcJyIS6S6chA7aiXi+EtdKCdV+jBxSluU7lN2uNBxh0N4EhUCoUCjXr2w4FguPe2SvUGKTe9S+
 Z+5ehpSCl6Sur+6WKvorkp+aqngxsglQrm/iBQdbRrrrh9H7wAUNyrGsFPVPoYGcq31U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DMYCD6A5DU3wmKj4OpzUGVB06E/Ax6cvClbm1RVzyrc=; b=FMbOihgXf8GDzP6qjdjh7BLM2J
 aajfJ1eUN6b5rZXhsRsIoubnOsi0Qz3cGaAI01TUIgWSrzsCwGy/78iR2kElUOyxayifCN+s+yDxz
 rK1PF99KBiB3vC76Pfm6WnEt3/HVl+w1HyOhuwhU4vuPW6AFfcHUfDr5+jLwVGij8wvk=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tGWw5-0004e1-94 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Nov 2024 05:19:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=DMYCD6A5DU3wmKj4OpzUGVB06E/Ax6cvClbm1RVzyrc=; b=M0Agvb8Nba2mWZ+k42lL7sHVL9
 CRDaZuSS+tl1UoESlZ2S1AN7XPnIn//G4wLuhDhvZMMqTOPxsM9DXbIcZjbutaP0u/ZoRBSecbWay
 WggwB9TSKbBmnTTkjal4qfwQs7fUSXHN5IKximkgYZfZcj41lU8w6Z57ryCjNzGC16JeaML619TOj
 6zRLeFi90qUD9/x8qloJXYJQzJBEwVESvx0eMh2vdBcJuVj/JSW8cqTw+0hnxIN5UzpuwLwXKADWD
 KUyVB6HpeLYvzwTXAf0eiqx1npJLwZn72UKgetBLik6kYDKAMxGoB6rmjJVLg57c64xhTAa6VDNuI
 ELyeaOOQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tGWbr-00000002DGB-19Db; Thu, 28 Nov 2024 04:58:35 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu, 28 Nov 2024 04:58:24 +0000
Message-ID: <20241128045828.527559-10-willy@infradead.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241128045828.527559-1-willy@infradead.org>
References: <20241128045828.527559-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Remove a call to compound_head(). We can call
 bio_add_folio_nofail()
 here because we just allocated the bio, so we know it can't fail and thus
 the error path can never be taken. Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org> --- fs/f2fs/data.c | 14 +++++--------- 1 file changed,
 5 insertions(+), 9 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [90.155.50.34 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1tGWw5-0004e1-94
Subject: [f2fs-dev] [PATCH 09/11] f2fs: Use a data folio in
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

Remove a call to compound_head().  We can call bio_add_folio_nofail()
here because we just allocated the bio, so we know it can't fail and
thus the error path can never be taken.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index cae5fa895b97..30d727808c92 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -685,32 +685,28 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
 {
 	struct bio *bio;
 	struct folio *fio_folio = page_folio(fio->page);
-	struct page *page = fio->encrypted_page ?
-			fio->encrypted_page : fio->page;
+	struct folio *data_folio = fio->encrypted_page ?
+			page_folio(fio->encrypted_page) : fio_folio;
 
 	if (!f2fs_is_valid_blkaddr(fio->sbi, fio->new_blkaddr,
 			fio->is_por ? META_POR : (__is_meta_io(fio) ?
 			META_GENERIC : DATA_GENERIC_ENHANCE)))
 		return -EFSCORRUPTED;
 
-	trace_f2fs_submit_folio_bio(page_folio(page), fio);
+	trace_f2fs_submit_folio_bio(data_folio, fio);
 
 	/* Allocate a new bio */
 	bio = __bio_alloc(fio, 1);
 
 	f2fs_set_bio_crypt_ctx(bio, fio_folio->mapping->host,
 			fio_folio->index, fio, GFP_NOIO);
-
-	if (bio_add_page(bio, page, PAGE_SIZE, 0) < PAGE_SIZE) {
-		bio_put(bio);
-		return -EFAULT;
-	}
+	bio_add_folio_nofail(bio, data_folio, folio_size(data_folio), 0);
 
 	if (fio->io_wbc && !is_read_io(fio->op))
 		wbc_account_cgroup_owner(fio->io_wbc, fio_folio, PAGE_SIZE);
 
 	inc_page_count(fio->sbi, is_read_io(fio->op) ?
-			__read_io_type(page) : WB_DATA_TYPE(fio->page, false));
+			__read_io_type(&data_folio->page) : WB_DATA_TYPE(fio->page, false));
 
 	if (is_read_io(bio_op(bio)))
 		f2fs_submit_read_bio(fio->sbi, bio, fio->type);
-- 
2.45.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
