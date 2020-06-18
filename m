Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3591FDAE0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jun 2020 03:09:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jlj38-0004Sa-SC; Thu, 18 Jun 2020 01:09:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1jlj36-0004SF-6f
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 01:09:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YX0+EyvzS0HPB0nX1PA7XmwYKhluB26e1CnepWsUJZs=; b=VaK+KnOa6yuvlT6Mt8eqS1W8jb
 Rsqb8ceGDN3UYsAQHvhqY+DgI8C99ZNXHWeWjYNpI/OD4ofRiGt9AHkVzdE59o6XgFcTIL95KFWXR
 D7hXxGBofDfegCETsqU9fHw7x5tA1IUV3rcoHheZe4GA5rny/n4CHznlBXJV6SW9Ap98=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YX0+EyvzS0HPB0nX1PA7XmwYKhluB26e1CnepWsUJZs=; b=k0EY8Dbka0J15D9st+q7cSQAik
 rSZ8n8+eW6xMhbEXKvobHWX9urChDZC2NYF9MzAdFmP6/5nC3ApzmxxGyMNvO9CeZVxDtTLTv5Z3r
 CxeCZxdI/ZaqgdsfxtqRztjRFqLSm6eAt4Nw5QMNTtQJ6WjT68RRfznsY58WFbWXysP8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jlj35-00A00b-4z
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 01:09:00 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D8E721D7A;
 Thu, 18 Jun 2020 01:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592442533;
 bh=3nkSWgAAPcJChv3MakksNPZN+UPpc4ypgp0uwpNGb5c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qLVmMrDVP/M2tb2i+qV4wKgGY769x3RjaabNWibOX1SbPeev9hyh8G688TxP7A82X
 Ib9IULJw3I687icBR9W5YxfD/bzkzk0rgE++BjkLCP1roEF0w5qk1e6L8QEUnveF8u
 WbTB9ivPQmmWsKE3vWgKVLfICnaRzAyNWxiyVq4Y=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 17 Jun 2020 21:02:13 -0400
Message-Id: <20200618010805.600873-36-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618010805.600873-1-sashal@kernel.org>
References: <20200618010805.600873-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jlj35-00A00b-4z
Subject: [f2fs-dev] [PATCH AUTOSEL 5.7 036/388] f2fs: report delalloc
 reserve as non-free in statfs for project quota
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
Cc: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>

[ Upstream commit baaa7ebf25c78c5cb712fac16b7f549100beddd3 ]

This reserved space isn't committed yet but cannot be used for
allocations. For userspace it has no difference from used space.

See the same fix in ext4 commit f06925c73942 ("ext4: report delalloc
reserve as non-free in statfs for project quota").

Fixes: ddc34e328d06 ("f2fs: introduce f2fs_statfs_project")
Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
Reviewed-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/super.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index f2dfc21c6abb..c5e8cb31626f 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1292,7 +1292,8 @@ static int f2fs_statfs_project(struct super_block *sb,
 		limit >>= sb->s_blocksize_bits;
 
 	if (limit && buf->f_blocks > limit) {
-		curblock = dquot->dq_dqb.dqb_curspace >> sb->s_blocksize_bits;
+		curblock = (dquot->dq_dqb.dqb_curspace +
+			    dquot->dq_dqb.dqb_rsvspace) >> sb->s_blocksize_bits;
 		buf->f_blocks = limit;
 		buf->f_bfree = buf->f_bavail =
 			(buf->f_blocks > curblock) ?
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
