Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F293117932
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Dec 2019 23:24:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ieRRs-0000qq-TN; Mon, 09 Dec 2019 22:24:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1ieRRg-0000qJ-4k
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Dec 2019 22:24:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fFF7e7h3DtwxxK/I8kZqCSXjdTxklEkeVMuPrKHhILY=; b=EosJ1do4xCzsh8h26nwBF4mOQW
 KpwIbtM5/AT7DAhL7rYUI96uuPOrIAgNn9Ym69pD0PAp0xPEQHylBPZ12jPSlwWiBwEmRQz58RH+S
 8c8X2DZBVKf4e97nw90H/ZAiv6OwjCNWmtB3dhX/MlF2hX3h5l485EqZe7yi1xb1cbhc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fFF7e7h3DtwxxK/I8kZqCSXjdTxklEkeVMuPrKHhILY=; b=cEWzmcy8YvM4xTWB/EAZQsk0Mo
 Xvo5fx1d42/af90tx/zP0qRNtY+jSObL7bdfyIkL6F3op1pGgbD5g+kgFgbhTZY9uCf5dO7MwM2FV
 XpkJWgCOST0AT3gdp7aTRnx75Fg4MkfCc09fFJJeDgTv7pSDTrY9LBt9tKuNdTEEiZT4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ieRRb-00FuaL-2n
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Dec 2019 22:24:00 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 639452073D;
 Mon,  9 Dec 2019 22:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575930229;
 bh=ykugJ2eieunWA0CHzN374ybGGCg0r8ToS1fcjPjb/xY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jaE8O8zr+C2s+h1/Su5IFdcLdGo1d/EsWYL0LkzG32xL+47VVnA8rHlpdUBQyx9NK
 hnd3BGA3BzIXiFS4p8L6kT7R19G0PJeJJQclA6YRjUq5+sA9Dk60cluMI1cjx838Fh
 ljvQKHDdjL/I+1sCOQhBYFyyah9LzukZCv2ddKRU=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  9 Dec 2019 14:23:44 -0800
Message-Id: <20191209222345.1078-5-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
In-Reply-To: <20191209222345.1078-1-jaegeuk@kernel.org>
References: <20191209222345.1078-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1ieRRb-00FuaL-2n
Subject: [f2fs-dev] [PATCH 5/6] f2fs: set GFP_NOFS when moving inline
 dentries
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Otherwise, it can cause circular locking dependency reported by mm.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/inline.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 896db0416f0e..52f85ed07a15 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -368,7 +368,7 @@ static int f2fs_move_inline_dirents(struct inode *dir, struct page *ipage,
 	struct f2fs_dentry_ptr src, dst;
 	int err;
 
-	page = f2fs_grab_cache_page(dir->i_mapping, 0, false);
+	page = f2fs_grab_cache_page(dir->i_mapping, 0, true);
 	if (!page) {
 		f2fs_put_page(ipage, 1);
 		return -ENOMEM;
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
