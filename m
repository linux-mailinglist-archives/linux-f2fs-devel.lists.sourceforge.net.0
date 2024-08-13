Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9550D95074F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Aug 2024 16:14:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sdsHq-0007Jt-CZ;
	Tue, 13 Aug 2024 14:14:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sdsHo-0007Jf-3A
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Aug 2024 14:14:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j+iw0zkklSTC2aRDUdvVgf+vxe/jKuhM9JE8Xc6+KuE=; b=OuGOrIXIiVQ1nEIYiI/uKNnAi0
 4uPfNDtFb1V20V/JpM1bMdbWqZYfR40sqKHbLEAE0ifFVkYpgtWCcR6UFp/tTaRL7Z/Ko2FF7s1vi
 QZ1/TohjtW9WXDZuvAKpwycrKvCt6j9RvwgNIhXzhHt7MtKpyZFV/SEO90BvuZoJczmo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j+iw0zkklSTC2aRDUdvVgf+vxe/jKuhM9JE8Xc6+KuE=; b=N9zGzEwS4XZFgdaub0w1i8EIOz
 M6GThrNKqChmqnrQuHSWQ1noOSZgkVrbRj/0pwZTUrYh9LwFy1fUkhze5crHoAxUdRLDDcU3TONNF
 Cwu+s/ToYXEz0UA/PjsoB68LZB6pYarkJUX99eNZw3WvjPACWCxze3ARAw5+Mk7S0ABI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sdsHm-0001DD-SX for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Aug 2024 14:14:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 82B8A6170B;
 Tue, 13 Aug 2024 14:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9E4AC4AF15;
 Tue, 13 Aug 2024 14:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723558436;
 bh=O7pw8vrwHsmRKsgyDC121Jnhb8Pog4l0udno2Rfx5N4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dk2QQ8wPoosbvLg3UHkk0KZRRfPL+3OhTJB3QJvfzwZgmVX2wOIW2nDOmgCG/FfXH
 22onUHZLrgYMlhhMUHd4lPUzN+wC9x30La1GVCGqIpd4fJbnNqm2Ep9zwgiecO+myb
 9DievUR+BqDyjmwoOxV81W69bK0vaZKbtEG+8KWJN2t2ZoUQyfBbFf3lt3Wg5AtMAH
 GWu4m2/nQpw8xT/JFxsKI64dB3bhgIk9UiA4g2/7oP/sNTNPfpNLF6+Br91lt+TU7f
 89ApQROUK0Khm9dr3EIGLPTb2Zl2cn2AGCsKbl05axspxur/QHeQLcO15iqTqHJ2Nf
 SJKKcx2Dnl0EQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 13 Aug 2024 22:13:29 +0800
Message-Id: <20240813141331.417067-7-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240813141331.417067-1-chao@kernel.org>
References: <20240813141331.417067-1-chao@kernel.org>
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
 --- fs/f2fs/checkpoint.c | 13 +++++++------ 1 file changed, 7 insertions(+),
 6 deletions(-) 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sdsHm-0001DD-SX
Subject: [f2fs-dev] [PATCH 7/9] f2fs: convert __f2fs_write_meta_page() to
 use folio
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
 fs/f2fs/checkpoint.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index d73d4d05313e..ffaf295a198a 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -345,30 +345,31 @@ static int __f2fs_write_meta_page(struct page *page,
 				enum iostat_type io_type)
 {
 	struct f2fs_sb_info *sbi = F2FS_P_SB(page);
+	struct folio *folio = page_folio(page);
 
-	trace_f2fs_writepage(page_folio(page), META);
+	trace_f2fs_writepage(folio, META);
 
 	if (unlikely(f2fs_cp_error(sbi))) {
 		if (is_sbi_flag_set(sbi, SBI_IS_CLOSE)) {
-			ClearPageUptodate(page);
+			folio_clear_uptodate(folio);
 			dec_page_count(sbi, F2FS_DIRTY_META);
-			unlock_page(page);
+			folio_unlock(folio);
 			return 0;
 		}
 		goto redirty_out;
 	}
 	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
 		goto redirty_out;
-	if (wbc->for_reclaim && page->index < GET_SUM_BLOCK(sbi, 0))
+	if (wbc->for_reclaim && folio->index < GET_SUM_BLOCK(sbi, 0))
 		goto redirty_out;
 
-	f2fs_do_write_meta_page(sbi, page_folio(page), io_type);
+	f2fs_do_write_meta_page(sbi, folio, io_type);
 	dec_page_count(sbi, F2FS_DIRTY_META);
 
 	if (wbc->for_reclaim)
 		f2fs_submit_merged_write_cond(sbi, NULL, page, 0, META);
 
-	unlock_page(page);
+	folio_unlock(folio);
 
 	if (unlikely(f2fs_cp_error(sbi)))
 		f2fs_submit_merged_write(sbi, META);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
