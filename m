Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7C5AFD43F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gOAsK25WrAK51DKnbApwGW+DnDAfpf2lNQI+skhG9c4=; b=nRc7elkh+oAHyca8QaI/VO57wL
	poSplhFXIEe7UanaQzvs6m9SL20W449nthMJZFkY1gs5OfsNBhTe7mi71AiV5FJRMqe0pNf7oHRPn
	Ezfjw9zv3EHQ6jlp4ryvXVfSnFD+/zCLzHI7iKGjtMbeO6tnVOIWtVmQBHacQsdFO+tc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBjy-0002qr-Ih;
	Tue, 08 Jul 2025 17:04:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBju-0002oR-IW
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jxc9JkfbDlhY0MvWMKGgV1p2btr6liuXJUnesIf2h8U=; b=Pu919/26T6U8HNHWDpvoe94El2
 o9Wm68aO/mOlQVO58Ks3b1ALI6R2dHmFbEeiFXYxDPtnZgSdetEWMjj0kqPqTBe8xZY9ZgOZCt2Qt
 +0BIKsTYMkszQxsH1CYRInxpiJBdRjqqOJoOKczTFQlBltYDeRVs7oGU2X1QsFnzWjUk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jxc9JkfbDlhY0MvWMKGgV1p2btr6liuXJUnesIf2h8U=; b=QkP5+F22FhtGlUO/Pe9DEQY1et
 gT1hkI59HU/4gcGTz6kXSg+jL5ErFQssVd6d61ciLqCcqUG3Cn7DIPr/ro+J7u7e0Ii8yD7JFo61h
 U07W29qIGkmp7QVaYzNnMD1IFV034Gg4yOEGGsIVp2awQO2bjKcbGeTvrAMeJYVqWIP4=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjr-0006Eq-Nw for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=jxc9JkfbDlhY0MvWMKGgV1p2btr6liuXJUnesIf2h8U=; b=j2I1DLAG1pt0agKj3bzQ9uvw+r
 KCLSIsyOOXQs7Qgcmb+G1936XxVkkuL7thNTxalu0KphIaSAK4uNTWOxmNypQWvOOd8sIdW8ly5yw
 cPyM8L1xpn0bDpKSVP1a4Sf/OHMr9YXpXMi9xqFE8aMwx5hgp81LZ5UiCUrJATasaWPo8Wf+qTuMg
 noG7fj0XoMnd2avEir/WybUNqWXdD67Sh3DaQvkLOyFHXNwVmuLNT+RpJ2j5iJHFxVFgalSfeCww7
 UVAOlNqi6C1Mb+a9J1mBaBUILMRvCLkI17qPnMs0N22XbGP3yOTXeHUv6ZqNBHWVUFsPmvlirv0Y1
 7mzWmaOA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjl-00000000T8y-1HGo;
 Tue, 08 Jul 2025 17:04:09 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:51 +0100
Message-ID: <20250708170359.111653-55-willy@infradead.org>
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
 Content preview: Use a folio instead of a page when dealing with the page
 cache.
 Removes a hidden call to compound_head(). Signed-off-by: Matthew Wilcox
 (Oracle)
 <willy@infradead.org> --- fs/f2fs/namei.c | 12 ++++++------ 1 file changed,
 6 insertions(+), 6 deletions(-) 
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
X-Headers-End: 1uZBjr-0006Eq-Nw
Subject: [f2fs-dev] [PATCH 54/60] f2fs: Use a folio in
 f2fs_encrypted_get_link()
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

Use a folio instead of a page when dealing with the page cache.  Removes
a hidden call to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/namei.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 07e333ee21b7..b882771e4699 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -1298,19 +1298,19 @@ static const char *f2fs_encrypted_get_link(struct dentry *dentry,
 					   struct inode *inode,
 					   struct delayed_call *done)
 {
-	struct page *page;
+	struct folio *folio;
 	const char *target;
 
 	if (!dentry)
 		return ERR_PTR(-ECHILD);
 
-	page = read_mapping_page(inode->i_mapping, 0, NULL);
-	if (IS_ERR(page))
-		return ERR_CAST(page);
+	folio = read_mapping_folio(inode->i_mapping, 0, NULL);
+	if (IS_ERR(folio))
+		return ERR_CAST(folio);
 
-	target = fscrypt_get_symlink(inode, page_address(page),
+	target = fscrypt_get_symlink(inode, folio_address(folio),
 				     inode->i_sb->s_blocksize, done);
-	put_page(page);
+	folio_put(folio);
 	return target;
 }
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
