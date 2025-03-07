Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFD4A5705E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Mar 2025 19:22:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tqcKk-0005K6-Rj;
	Fri, 07 Mar 2025 18:22:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tqcKj-0005Jz-MJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Mar 2025 18:22:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nbz+BLNYgFlD4q+RSS71Ot7C9TdXZjDl9SBqkDnbsow=; b=cuLIRKy2BV/+6rv6j8HkvtMcJY
 VWdsy+rbTLkcMMfw8uQuOt1u+5jRhI3SFXrpE675weNnxOhGJ4GPQnSOGy3CmKR+iMpIvOS9/Ps+D
 4LhFL2pHXGNdqekNgHR7TgfO0omnX9UAdH+6/klhnKebeLj4DqsPw3Esc5bF6hRbtTvU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nbz+BLNYgFlD4q+RSS71Ot7C9TdXZjDl9SBqkDnbsow=; b=GUO6aYyBLhIjQWD8PfmL/nEQnJ
 u1JB7Fst3mAY7m2o1ZAEUqcUwQNS4YzbfdeH9imyPhTIxTBx0kpKw9JIdUO5UPDSZkoI807qFDqAa
 t+coEDdF68cwG/ZaqTMCUZhvXzP3ymtuVFmRiJ4uJdESG/j+wqSherqWV5O7WqSYZU0A=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tqcKd-0004Wi-VX for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Mar 2025 18:22:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=nbz+BLNYgFlD4q+RSS71Ot7C9TdXZjDl9SBqkDnbsow=; b=tK00Ypc74Cni9nRFpbdkF6I0mY
 gG1kG5+X6l9qhcDQwHtTqmS2J0+tfNsfrn2ssX2/oKLyZQiyw7Iw6uxk+7oQxNRI/PzPpaJkb4lAk
 0URRbewYsMdOh22cFk9ZlhLZBKotdYhet0hOn8lzmMu9jK+N7PEAuesr1lgAdPTVNLHqoN8K3VeNE
 4aruvX/RkRFpkhgzC9cP/S7dKcP5Uswc1UiUpAxWcL295+KjhRcggBgWUdST7BLJpjjTNv24ilQAY
 MmSlvSygH15wkX7soSE5eeu7xGpU3JGf4E40i1Xqq7wKghAOK8gZZqzbRlHgdY8ED7RuOU/Dk5qAK
 2JA28YsQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tqcKX-0000000EFj8-0hoo; Fri, 07 Mar 2025 18:21:53 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Fri,  7 Mar 2025 18:21:47 +0000
Message-ID: <20250307182151.3397003-2-willy@infradead.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307182151.3397003-1-willy@infradead.org>
References: <20250307182151.3397003-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: We're almost able to remove a_ops->writepage. This check is
 unnecessary as we'll never call into __f2fs_write_data_pages() for character
 devices. Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org> ---
 fs/f2fs/data.c | 4 ---- 1 file changed, 4 deletions(-) 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1tqcKd-0004Wi-VX
Subject: [f2fs-dev] [PATCH 1/4] f2fs: Remove check for ->writepage
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
Cc: linux-fsdevel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We're almost able to remove a_ops->writepage.  This check is unnecessary
as we'll never call into __f2fs_write_data_pages() for character
devices.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index c82d949709f4..a80d5ef9acbb 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3280,10 +3280,6 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
 	int ret;
 	bool locked = false;
 
-	/* deal with chardevs and other special file */
-	if (!mapping->a_ops->writepage)
-		return 0;
-
 	/* skip writing if there is no dirty page in this inode */
 	if (!get_dirty_pages(inode) && wbc->sync_mode == WB_SYNC_NONE)
 		return 0;
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
