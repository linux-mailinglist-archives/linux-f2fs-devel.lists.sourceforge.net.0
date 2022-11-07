Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DE061FD3D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Nov 2022 19:19:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1os6if-0003LK-OY;
	Mon, 07 Nov 2022 18:19:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1os6ie-0003LE-5K
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Nov 2022 18:19:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rdwzSWOHJqcYwcyFc8iIsoKzLu9/kk6q0uAMK5dryzI=; b=JiAwU4r68yjlLaZgWQNbp1dGKQ
 PQkN2gSXKKB2pPTl3dNnmkLq2HxdHX4vNzwUe76JUsVq4AHc86G3hJbqK1rMLYpRP2u34L4eGfDQE
 md9H1UqkXdY4WqX2q/lHwahGj8clwFMP7t2rWqn7pMKEoivThHClkZ28L79e1aY37kmE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rdwzSWOHJqcYwcyFc8iIsoKzLu9/kk6q0uAMK5dryzI=; b=T
 JQliXlVCVdheq2VpTcqKPhh8jNFXm/EFFeD8ZpTUl9kdHD8pnP94sej1UY6EyLBgz8n6NWmKj7T/f
 qbFdCAui/8UXdIebhAeu1cQWv7sFuS7zFREgje1S9geQD4j10v3U5aci9YfjfdaZzpIXi5WYrxg5c
 HfDEa8pdjAl+t+1o=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1os6iZ-0004aK-Ue for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Nov 2022 18:19:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A1EC9B81613;
 Mon,  7 Nov 2022 18:19:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 238AEC433D6;
 Mon,  7 Nov 2022 18:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667845164;
 bh=wLbrU0DRRdx4w58LlSRl76Dc06HHfli1tgQtQg9pkQ4=;
 h=From:To:Cc:Subject:Date:From;
 b=evLUl6/VPoeNP8AiBPRupPhjgwGRi0tkfqweFWCbY4dCxpunFqK3yHB9u+LE3xbB1
 nG22uXdpzobJNXxstOFBMn6rImhY8PbzXEPBNPmwBxaTugEquONzgn7JKPvEXYWSe5
 J7D6nJfqtG+BNB+brf11no4ltAOAo8xiK5fvowjZeAooKbNwFu5rmUYTJ2IWQ7TK/Z
 /Ay2/Bqf+jePpifFrvuyjSUmyh2tsFcv8zrGCZAONJFMctPWNTl2q5ICExW+Vo7Q9B
 lTmhjRUiPpDR6XGdk2Q0i9bDNjSNqGefgsLm94rxIVuBIHXvVoAo3VUzBBFPKidERo
 xoTtab/cMxs9w==
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Date: Mon,  7 Nov 2022 10:18:55 -0800
Message-Id: <20221107181855.62545-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: "Matthew Wilcox (Oracle)" <willy@infradead.org> commit
 4fa0e3ff217f775cb58d2d6d51820ec519243fb9 upstream. The recent change of
 page_cache_ra_unbounded()
 arguments was buggy in the two callers, causing us to readahead the wrong
 pages. Move the definition of ractl down to after the index is set correctly.
 T [...] Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1os6iZ-0004aK-Ue
Subject: [f2fs-dev] [PATCH 5.10] ext4,f2fs: fix readahead of verity data
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
 linux-f2fs-devel@lists.sourceforge.net, Jintao Yin <nicememory@gmail.com>,
 linux-fscrypt@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

commit 4fa0e3ff217f775cb58d2d6d51820ec519243fb9 upstream.

The recent change of page_cache_ra_unbounded() arguments was buggy in the
two callers, causing us to readahead the wrong pages.  Move the definition
of ractl down to after the index is set correctly.  This affected
performance on configurations that use fs-verity.

Link: https://lkml.kernel.org/r/20221012193419.1453558-1-willy@infradead.org
Fixes: 73bb49da50cd ("mm/readahead: make page_cache_ra_unbounded take a readahead_control")
Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reported-by: Jintao Yin <nicememory@gmail.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/verity.c | 3 ++-
 fs/f2fs/verity.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/ext4/verity.c b/fs/ext4/verity.c
index 00e3cbde472e4..35be8e7ec2a04 100644
--- a/fs/ext4/verity.c
+++ b/fs/ext4/verity.c
@@ -370,13 +370,14 @@ static struct page *ext4_read_merkle_tree_page(struct inode *inode,
 					       pgoff_t index,
 					       unsigned long num_ra_pages)
 {
-	DEFINE_READAHEAD(ractl, NULL, inode->i_mapping, index);
 	struct page *page;
 
 	index += ext4_verity_metadata_pos(inode) >> PAGE_SHIFT;
 
 	page = find_get_page_flags(inode->i_mapping, index, FGP_ACCESSED);
 	if (!page || !PageUptodate(page)) {
+		DEFINE_READAHEAD(ractl, NULL, inode->i_mapping, index);
+
 		if (page)
 			put_page(page);
 		else if (num_ra_pages > 1)
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index 15ba36926fad7..cff94d095d0fe 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -261,13 +261,14 @@ static struct page *f2fs_read_merkle_tree_page(struct inode *inode,
 					       pgoff_t index,
 					       unsigned long num_ra_pages)
 {
-	DEFINE_READAHEAD(ractl, NULL, inode->i_mapping, index);
 	struct page *page;
 
 	index += f2fs_verity_metadata_pos(inode) >> PAGE_SHIFT;
 
 	page = find_get_page_flags(inode->i_mapping, index, FGP_ACCESSED);
 	if (!page || !PageUptodate(page)) {
+		DEFINE_READAHEAD(ractl, NULL, inode->i_mapping, index);
+
 		if (page)
 			put_page(page);
 		else if (num_ra_pages > 1)
-- 
2.38.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
