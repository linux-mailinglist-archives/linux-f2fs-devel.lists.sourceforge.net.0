Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FE0AFD442
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ac4BoU5RygS6ulQuWOH7ZA6jUW809Azb21k0BPLn9Wc=; b=e1y6RaU8yObkUk5rzxvxPiITve
	JLKI+g01gNbDnkKY400sumT3Q+Pdog00pJBZDFBfwWaPCAkQRNLMdmmXmOm/UX7WKCUY/MULUeVLB
	Bnz6FzBaX3TNyD2Bt3DJT3qMrsf7cm/VuTZnTUb94B2INKUG0qydFZxr+LMp/v0M/z1I=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBjz-0005JM-J8;
	Tue, 08 Jul 2025 17:04:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjv-0005GW-I0
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bgukHcatPI7u3WLj60OCQ+TZn1PjLVraPsXjT02YjvY=; b=iklIgq4xBsN+xPqdVhtHr1Va7L
 ZgGApXZlTyfu/TazHMw6eK2FMJcjbeDolth5PJyWKwo9hZUvzAHbO/5zshqzZVstvEj2vvSHQh0XY
 Zy2BkQM7K1GDt9qQUngROntpFA/hGGt+0H5bxawMT41pYxlCyS+gVVylAyBsfBINdOHE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bgukHcatPI7u3WLj60OCQ+TZn1PjLVraPsXjT02YjvY=; b=LYLKmtH/acoSf5lZVESrgmEwGJ
 GdXK3Lx3vB9zp8+h+vUZJY44fmjcKqzgnQl5ipNClsdf060Pzrd/HlbBhrSv/C0Q5m5yv76CNHTmK
 s4OWN2jKEF/IfdHOVg3eWddPNNutwDEMfqGMT6Uu8i3KanH+Qzsjs7f7a4kz/Z0eoX7M=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjs-0006FB-Mo for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=bgukHcatPI7u3WLj60OCQ+TZn1PjLVraPsXjT02YjvY=; b=genSMQZokuUDSJGRTEaGHN/hKt
 fceFQQCLNyXmdlbSwi8EmLr2FacRRIMCVMhpnEZCB2kXwWDxTcBuX11x0rsrqRX1skuucCkITbrMP
 vkBo4bh3bx0lXLDVY6+/DOaNqWuW7ct0evL0yCDI2p3bpMbJmnsRmhs2YpL7hjRGfBurySBjr0qO1
 iVYRWZaRtmxNmEu7UQSjucC9a0pP7MapZjHJOFL5I8+H4NPMwSJuVJ/1fhjtClrqi6Fv2JNvKN1XV
 MlzM3fZBwFBfPOu4L9tQVQ6rpVvGoBdvKZszE5lubQdLUpV3QA/N+6Pn9Ha2Cv0f3h9aPCvzSmvrZ
 9oPshz8g==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjm-00000000TA4-0n9a;
 Tue, 08 Jul 2025 17:04:10 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:57 +0100
Message-ID: <20250708170359.111653-61-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708170359.111653-1-willy@infradead.org>
References: <20250708170359.111653-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: All callers have been converted to F2FS_F_SB() so delete this
 wrapper. Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org> ---
 fs/f2fs/f2fs.h | 5 ----- 1 file changed,
 5 deletions(-) diff --git a/fs/f2fs/f2fs.h
 b/fs/f2fs/f2fs.h index 3ae1f15205c5..251fe1f7f57d 100644 --- a/fs/f2fs/f2fs.h
 +++ b/fs/f2fs/f2fs.h @@ -2026, 11 +2026, 6 @@ static inline struct f2fs_sb_info
 *F2FS_F_SB(const [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1uZBjs-0006FB-Mo
Subject: [f2fs-dev] [PATCH 60/60] f2fs: Remove F2FS_P_SB()
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

All callers have been converted to F2FS_F_SB() so delete this wrapper.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/f2fs.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 3ae1f15205c5..251fe1f7f57d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2026,11 +2026,6 @@ static inline struct f2fs_sb_info *F2FS_F_SB(const struct folio *folio)
 	return F2FS_M_SB(folio->mapping);
 }
 
-static inline struct f2fs_sb_info *F2FS_P_SB(struct page *page)
-{
-	return F2FS_F_SB(page_folio(page));
-}
-
 static inline struct f2fs_super_block *F2FS_RAW_SUPER(struct f2fs_sb_info *sbi)
 {
 	return (struct f2fs_super_block *)(sbi->raw_super);
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
