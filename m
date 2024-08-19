Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9309560DA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Aug 2024 03:21:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sfr57-0006Pk-9D;
	Mon, 19 Aug 2024 01:21:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sfr56-0006Pe-Bo
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Aug 2024 01:21:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=loFIPCariodcezIm7vURmikq8qlYJs1bGmAvOLs/g68=; b=nAB5HsqF/rQEKq47uw02/hDp82
 4da4VV9JIgQ5DZg6WD4EF/UD1pV2/x4lG4Mc4hwfVQnJKbaBC9mB01tHESH5LgCxErcWGCM1XIsf5
 HkITLjQ6gL2B1iwgPpfDjCEtQbYfGU/qCr23cnaeaVK1twohe+aSmjy+bhsbB02Imvzw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=loFIPCariodcezIm7vURmikq8qlYJs1bGmAvOLs/g68=; b=bhEFoti+Oqc1Ei+Akxwp6+moy0
 i/R1dYvupDkiejS9JRytQD+cjM3fE4q0yQINNMAI89JCMHhBs1EXeaKMeAbKX9izOgaCYpybNRrJE
 l5+XfnJsiOpYRl4Qejr4tMAAj2CfSwF0thl9ugVMRTk9d81Hp8jjKYReG2PFQnbHqSmU=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sfr55-0003Zp-7I for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Aug 2024 01:21:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 516A4CE0918;
 Mon, 19 Aug 2024 01:21:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79264C4AF0F;
 Mon, 19 Aug 2024 01:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724030463;
 bh=kXH69VauKPWX1aj+cT6JMgD13fkLJ9/JjHzU17y6Nko=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dUKrUfhcpOfGXfk1uInYHej6JA0dyGjBkCMuJrjvVXcBIgXNtZ/XOiEDsN0K7gGaZ
 FMaqm4Eba+8bojSXs+rByMQv8YEtMTiYtG1+eh2QReDVC9TAR8Fsm/iiAEha5plGd3
 6zl9EQnnBg2m2A/F6ZfV6JG6dI0YVHXRJzKANT0UVuPE+Y9ssLRQWw/KHpCC2sF+xR
 gA+gl1ZAne6NKInS6BGQWa8qShmmdrMLPwrEPEYos4IuMqn80uHa11LDwMnHsPyIxt
 sH4l1vtrQBv2g5YbhtkZe6pY63mwGhSrZIarep9Zb5rySNaAg1T6eabGyaqtzUpBUT
 AXu+RmSLwHPlQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 19 Aug 2024 09:20:21 +0800
Message-Id: <20240819012023.3871272-6-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240819012023.3871272-1-chao@kernel.org>
References: <20240819012023.3871272-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Convert to use folio, so that we can get rid of 'page->index'
 to prepare for removal of 'index' field in structure page [1]. [1]
 https://lore.kernel.org/all/Zp8fgUSIBGQ1TN0D@casper.infradead.org/
 Cc: Matthew Wilcox <willy@infradead.org> Signed-off-by: Chao Yu
 <chao@kernel.org>
 --- fs/f2fs/node.c | 19 ++++++++++--------- 1 file changed, 10 insertions(+), 
 9 deletions(-) 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sfr55-0003Zp-7I
Subject: [f2fs-dev] [PATCH 6/8] f2fs: convert __write_node_page() to use
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
Cc: linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Convert to use folio, so that we can get rid of 'page->index' to
prepare for removal of 'index' field in structure page [1].

[1] https://lore.kernel.org/all/Zp8fgUSIBGQ1TN0D@casper.infradead.org/

Cc: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/node.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 7beaa3690e03..aeda3eecc9e2 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1608,6 +1608,7 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
 				enum iostat_type io_type, unsigned int *seq_id)
 {
 	struct f2fs_sb_info *sbi = F2FS_P_SB(page);
+	struct folio *folio = page_folio(page);
 	nid_t nid;
 	struct node_info ni;
 	struct f2fs_io_info fio = {
@@ -1624,15 +1625,15 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
 	};
 	unsigned int seq;
 
-	trace_f2fs_writepage(page_folio(page), NODE);
+	trace_f2fs_writepage(folio, NODE);
 
 	if (unlikely(f2fs_cp_error(sbi))) {
 		/* keep node pages in remount-ro mode */
 		if (F2FS_OPTION(sbi).errors == MOUNT_ERRORS_READONLY)
 			goto redirty_out;
-		ClearPageUptodate(page);
+		folio_clear_uptodate(folio);
 		dec_page_count(sbi, F2FS_DIRTY_NODES);
-		unlock_page(page);
+		folio_unlock(folio);
 		return 0;
 	}
 
@@ -1646,7 +1647,7 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
 
 	/* get old block addr of this node page */
 	nid = nid_of_node(page);
-	f2fs_bug_on(sbi, page->index != nid);
+	f2fs_bug_on(sbi, folio->index != nid);
 
 	if (f2fs_get_node_info(sbi, nid, &ni, !do_balance))
 		goto redirty_out;
@@ -1660,10 +1661,10 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
 
 	/* This page is already truncated */
 	if (unlikely(ni.blk_addr == NULL_ADDR)) {
-		ClearPageUptodate(page);
+		folio_clear_uptodate(folio);
 		dec_page_count(sbi, F2FS_DIRTY_NODES);
 		f2fs_up_read(&sbi->node_write);
-		unlock_page(page);
+		folio_unlock(folio);
 		return 0;
 	}
 
@@ -1684,7 +1685,7 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
 			*seq_id = seq;
 	}
 
-	set_page_writeback(page);
+	folio_start_writeback(folio);
 
 	fio.old_blkaddr = ni.blk_addr;
 	f2fs_do_write_node_page(nid, &fio);
@@ -1697,7 +1698,7 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
 		submitted = NULL;
 	}
 
-	unlock_page(page);
+	folio_unlock(folio);
 
 	if (unlikely(f2fs_cp_error(sbi))) {
 		f2fs_submit_merged_write(sbi, NODE);
@@ -1711,7 +1712,7 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
 	return 0;
 
 redirty_out:
-	redirty_page_for_writepage(wbc, page);
+	folio_redirty_for_writepage(wbc, folio);
 	return AOP_WRITEPAGE_ACTIVATE;
 }
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
