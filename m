Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE2E957C06
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Aug 2024 05:47:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sgFq8-00061E-H8;
	Tue, 20 Aug 2024 03:47:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sgFq7-00060z-6H
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Aug 2024 03:47:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pVkda070V/cbUxqxCp8oMh9qO6QLojXvPwXoNvqbT50=; b=NSXcCjTM7ka7ewVonjPcyTjsHB
 DpZW1VT1AGdP3mwgSUqvuL9uRttkYJoEIkDj5QHnFjsVMOhzOiY30Y0HgM3XFbD5BjLR0xuMeNBsR
 StYoDYMH+klCaNoiWs7JrihXCnOxG+HTqKwFf0lYCh9CFrwXM7ZQaKJfWgL+Pta0cVvk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pVkda070V/cbUxqxCp8oMh9qO6QLojXvPwXoNvqbT50=; b=i6F15uF2MjqZH8PtWMVljS+B//
 f5bKk20e+wtMytGaBhYmlDM1f0CeWSvRK7wZMrNbbfJZL9A+S0l/AUb4iZ4GtRy3uLwH+50AJJCom
 T5xfme+UqwOa6e+FRKgkjZiTGohoe3yQtxNamM1+9wSn4JFSa0q+lkHecoCG/A20+Vlc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sgFq6-0006Rk-JE for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Aug 2024 03:47:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 42E5160DBD;
 Tue, 20 Aug 2024 03:47:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAEDAC4AF09;
 Tue, 20 Aug 2024 03:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724125632;
 bh=Gv9T9VqQEXP+t9GsufY3LhPD+LhHvt38T1omk9U0JGM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Bl7oIWicgFEGKNiIE52WCqV2xquS6lZe4NR7/ZrT+7l0Ti9k3hfX5WhXNw/57m+ws
 PWhUlShTwj0PkbSaaWLoW9vWz82vY4KZmcsUnOluFC83S+DXwD0K07uhALkdpwieBb
 LOLJR3+f+rt92gEyyzVhRm1bGipkXbjuuyLccvDvtsUyj88tiGInEjk4NBYoijK6eN
 m5W5UpSPSCNNA1C82IM//XDJfl8uV6bMTFmXzVsObWdE0y3gQPOOkNOzSEjMtycTDp
 Ue7DlMUhZNx6L2rAjPK/tHNAyVHRs0mS+Ecev4cgdoAuSif0AkmDeMxP2DTlebC/Mi
 SwEcuFKp13K1A==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 20 Aug 2024 11:46:51 +0800
Message-Id: <20240820034654.698236-5-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240820034654.698236-1-chao@kernel.org>
References: <20240820034654.698236-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Convert to use folio, so that we can get rid of 'page->index'
 to prepare for removal of 'index' field in structure page [1]. [1]
 https://lore.kernel.org/all/Zp8fgUSIBGQ1TN0D@casper.infradead.org/
 Cc: Matthew Wilcox <willy@infradead.org> Signed-off-by: Chao Yu
 <chao@kernel.org>
 --- fs/f2fs/data.c | 9 +++++---- 1 file changed, 5 insertions(+),
 4 deletions(-)
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sgFq6-0006Rk-JE
Subject: [f2fs-dev] [PATCH v2 5/8] f2fs: convert f2fs_write_data_page() to
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
 fs/f2fs/data.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index c57ddee2c7c5..e69097267b99 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2945,22 +2945,23 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 static int f2fs_write_data_page(struct page *page,
 					struct writeback_control *wbc)
 {
+	struct folio *folio = page_folio(page);
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-	struct inode *inode = page->mapping->host;
+	struct inode *inode = folio->mapping->host;
 
 	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
 		goto out;
 
 	if (f2fs_compressed_file(inode)) {
-		if (f2fs_is_compressed_cluster(inode, page->index)) {
-			redirty_page_for_writepage(wbc, page);
+		if (f2fs_is_compressed_cluster(inode, folio->index)) {
+			folio_redirty_for_writepage(wbc, folio);
 			return AOP_WRITEPAGE_ACTIVATE;
 		}
 	}
 out:
 #endif
 
-	return f2fs_write_single_data_page(page_folio(page), NULL, NULL, NULL,
+	return f2fs_write_single_data_page(folio, NULL, NULL, NULL,
 						wbc, FS_DATA_IO, 0, true);
 }
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
