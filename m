Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA1EAFD439
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1bffIu/LBhreAtt5Vs7+VJjWFlFUObdYqUXD9Mt0Wk=; b=EgSPuwr9hnvpZgMV41CnyXUONa
	aSayrwO1SQnQAZNF89kEtmWGU3H85DU8fHml5WFRddCCcWkpVp9GtZsBl3v3zsAQT0YDFXt1EOdI3
	cE60Ae5BYFv9uEEetiYOE/hbAMfhN//FfGBfiJr1STnZy+0VRjFYE0JgMtEy79Jq+zzk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBjw-0007MN-MS;
	Tue, 08 Jul 2025 17:04:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjr-0007KR-JZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mGfi2a3Vxh2mre3GX4cdAm7G2SQu+XSxX37NefXdcHA=; b=djsTRwJ2++o8zcc2A6rIgqyAo/
 h0xVDnKjWXTyCmJh0Fl9mKEgrnNY6x2KxrD2aSR53EiGUGhEcocWo9VneSpw8+uLBEwAAeicHhaD5
 holIEJwEczcYQF1xM/5vtjOWPlGVYD3VqUv2bdKxwKISlYx56dHCiQZjU7/W2G5nm1is=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mGfi2a3Vxh2mre3GX4cdAm7G2SQu+XSxX37NefXdcHA=; b=ND1MXhnAMll+C1FDe40nmgwNdd
 1y41OejSHeYo/iAuCtxmzn1LezlBiXkV0AHJEvnf4HQG2olO1vIk1KpvBZ9WxC4NIuEZ/0LYcM/DD
 Zm33oCRekVOUSKTLyFCNUlMILRXghNUCmlI5FW3yqqrcNzSAY+ppHe8Kyq1V+KpCJRPo=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjp-0006EP-Rg for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=mGfi2a3Vxh2mre3GX4cdAm7G2SQu+XSxX37NefXdcHA=; b=b7W1p3wqEf8YuMNkgJG8EDcs2d
 IvGHC9vF7GtuqRMnEVMcv7wBzwdDtdZkEV1wAE9jWA020PbHSFbt7BDRz0hLFjGBeqfxGgAArM5yw
 5030pLdREG6fG3CYTIH/OOiSq00sYi9xVpf+b9/tn0lDjIfKYks3+z5zcChRk6kW8l6IVVch1PpzY
 BSFDxDeJYdZMJgXvDt6KRmp4TPvDu1nj1BSjRFUiM6ELcM8i+Mz05IplIRl80otc46JWrZBQHoCE6
 qFcFU4a4/SFuuzB6DZpbCw0b8Eu2ystCf4/HaE/RfC0QLex0qKOZa00dENSVY/sM86szVj0s6GVrt
 87McMF6A==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBje-00000000T3n-1mmR;
 Tue, 08 Jul 2025 17:04:02 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:04 +0100
Message-ID: <20250708170359.111653-8-willy@infradead.org>
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
 Content preview:  The only caller has a folio, so pass it in. Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/f2fs.h | 2 +-
 fs/f2fs/inline.c
 | 4 ++-- fs/f2fs/inode.c | 2 +- 3 files changed, 4 insertions(+),
 4 deletions(-)
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
X-Headers-End: 1uZBjp-0006EP-Rg
Subject: [f2fs-dev] [PATCH 07/60] f2fs: Pass a folio to
 f2fs_sanity_check_inline_data()
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

The only caller has a folio, so pass it in.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/f2fs.h   | 2 +-
 fs/f2fs/inline.c | 4 ++--
 fs/f2fs/inode.c  | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index d278b5117629..0e33c971aff7 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4308,7 +4308,7 @@ extern struct kmem_cache *f2fs_inode_entry_slab;
  * inline.c
  */
 bool f2fs_may_inline_data(struct inode *inode);
-bool f2fs_sanity_check_inline_data(struct inode *inode, struct page *ipage);
+bool f2fs_sanity_check_inline_data(struct inode *inode, struct folio *ifolio);
 bool f2fs_may_inline_dentry(struct inode *inode);
 void f2fs_do_read_inline_data(struct folio *folio, struct folio *ifolio);
 void f2fs_truncate_inline_inode(struct inode *inode, struct folio *ifolio,
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 901c630685ce..0d021c638922 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -48,12 +48,12 @@ static bool inode_has_blocks(struct inode *inode, struct page *ipage)
 	return false;
 }
 
-bool f2fs_sanity_check_inline_data(struct inode *inode, struct page *ipage)
+bool f2fs_sanity_check_inline_data(struct inode *inode, struct folio *ifolio)
 {
 	if (!f2fs_has_inline_data(inode))
 		return false;
 
-	if (inode_has_blocks(inode, ipage))
+	if (inode_has_blocks(inode, &ifolio->page))
 		return false;
 
 	if (!support_inline_data(inode))
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 6b91531f79a4..b7324c583683 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -354,7 +354,7 @@ static bool sanity_check_inode(struct inode *inode, struct folio *node_folio)
 		}
 	}
 
-	if (f2fs_sanity_check_inline_data(inode, &node_folio->page)) {
+	if (f2fs_sanity_check_inline_data(inode, node_folio)) {
 		f2fs_warn(sbi, "%s: inode (ino=%lx, mode=%u) should not have inline_data, run fsck to fix",
 			  __func__, inode->i_ino, inode->i_mode);
 		return false;
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
