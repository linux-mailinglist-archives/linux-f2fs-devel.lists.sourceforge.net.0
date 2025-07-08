Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E90DBAFD422
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Bl1W+nrh/njVGGIxGGpGFn041Uq+/LZ3wNZonaAl3E=; b=I2R+m0ReAb8izsmj2qVgagwixv
	LkuO3cm1IvKaP8nMvUwZG3aMZj4kUpmdNu5nugeRKzGXJtojIxxViN528iFpeBLR8y+ZmcWTpzkH8
	pKnZ05UZYOhGIHlTk5PiwXMKvDZS+CKoGCk8oClLn2BDVBn4tt/DmegBo5j9YQ8qVyg8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBjn-0005Ul-Nm;
	Tue, 08 Jul 2025 17:04:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjl-0005Ud-RN
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lHMA5fuWA302OzGxfnBwriIQcssxLS6OZf5MmhLTCkM=; b=cQxoioD/SDyVP80a3USYeZuW8o
 cOdNhuvb9NsF/mjYdpnmTwJ0OzQni7Ebex8wV6iQdRBApSWCaz+Un7nSMBduei0tyjtZEhv+DE9Ta
 QWbIJlwab+Df8MkTjPBoGyGE53IT2ZqkPcz2hEzBN4qLFtK2U1Ly9AfU2eOQjOpiViwk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lHMA5fuWA302OzGxfnBwriIQcssxLS6OZf5MmhLTCkM=; b=LysH8mJlxgCCqQPq+7eeSSjN6w
 /iToNgEt2IuWHTqOIMBJ6G2m42kiLbh01bosRVmIecQtdGin41aphN7d0/jGjYWpMmCfV4sikVPYu
 BGMc/NUiMO1J0Fq5RsMLf0iDfievlvDMOZKUB51JAr3lsMNmFotrCLYt8qLLOwgbLJYQ=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjk-0006Du-VP for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=lHMA5fuWA302OzGxfnBwriIQcssxLS6OZf5MmhLTCkM=; b=jCFJKVI4QXpcvGLce+inLJ3r9i
 x2Gdj7CbOr1vuYBzoGpoOVn7DND000PSnHyzpdIp/w15Sy72UIFlcACV9FwwuCxcfPuNlsiALNtjN
 bSKjyrsjuXpq/MYXMGzPnVRiL3YtytvhyKcV1lSFMffbo+8qnstSV4HCqDCLqhPrzhjOdqnoaYfOx
 O6CPHnTVF7lHt/WgCBg5EAFD1tCYTnte3ho7CTu5+ecHpfShya/Sa4ZIMlaGhfjkyVYWByuhJy3UE
 i+ibfdV7IBO+8VXdZqJ7/v4dy8inEptp1wH0I+zl5L5Y+7SN0vmeElHiZt44X8QHuUpSwFNpvCBjR
 QtfArZzQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBje-00000000T3x-2bgW;
 Tue, 08 Jul 2025 17:04:02 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:05 +0100
Message-ID: <20250708170359.111653-9-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708170359.111653-1-willy@infradead.org>
References: <20250708170359.111653-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The only caller has a folio, so pass it in. Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/inline.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-) diff --git a/fs/f2fs/inline.c
 b/fs/f2fs/inline.c index 0d021c638922..fa072e4a5616 100644 ---
 a/fs/f2fs/inline.c
 +++ b/fs/f2fs/inline.c @@ -33,9 +33,9 @@ bool f2fs_may_inline_data(struct
 inode *inode) [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1uZBjk-0006Du-VP
Subject: [f2fs-dev] [PATCH 08/60] f2fs: Pass a folio to inode_has_blocks()
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
 fs/f2fs/inline.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 0d021c638922..fa072e4a5616 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -33,9 +33,9 @@ bool f2fs_may_inline_data(struct inode *inode)
 	return !f2fs_post_read_required(inode);
 }
 
-static bool inode_has_blocks(struct inode *inode, struct page *ipage)
+static bool inode_has_blocks(struct inode *inode, struct folio *ifolio)
 {
-	struct f2fs_inode *ri = F2FS_INODE(ipage);
+	struct f2fs_inode *ri = F2FS_INODE(&ifolio->page);
 	int i;
 
 	if (F2FS_HAS_BLOCKS(inode))
@@ -53,7 +53,7 @@ bool f2fs_sanity_check_inline_data(struct inode *inode, struct folio *ifolio)
 	if (!f2fs_has_inline_data(inode))
 		return false;
 
-	if (inode_has_blocks(inode, &ifolio->page))
+	if (inode_has_blocks(inode, ifolio))
 		return false;
 
 	if (!support_inline_data(inode))
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
