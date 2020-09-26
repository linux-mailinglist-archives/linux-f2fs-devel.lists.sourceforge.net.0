Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7E6279587
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 26 Sep 2020 02:21:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kLxxv-0006oy-Vg; Sat, 26 Sep 2020 00:21:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1kLxxv-0006os-Io
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 26 Sep 2020 00:21:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T1DVnTV/Iyvac1kNC77Y1KhUVre2fhWMO1Q8QNAxYQ4=; b=eHVNgSo8KTpZ6l5XVvjN6JsGtA
 sO1FjmurRlUZcikRLnvLCrzRbTfBFMJDhahUEcmBTmfrr5qVoQhKpU6DMVWhYX7wUSmDYVK0Sqp5y
 pVk5XXtrpoe4lUCc5FAohKAaQ6HPUVIf17iKgfhQMbADDSytsf1d3NQqel7c5+4Ol6/M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=T1DVnTV/Iyvac1kNC77Y1KhUVre2fhWMO1Q8QNAxYQ4=; b=T
 b4DCLvTiT6+1LI63kGsqZh3jLq8VgGkb6XZXRt9Lex3o8tzfnsOowqqdmiGOUBcwyd4GNNmRkBS7r
 GTTVlouU/iKjw+BTv7AjdS5hbqJIpjBl0eAYk0VhSwg5y0PiEhxKIq3RzCPjC2/ofhn4IsMZtXvlF
 80+1H6Pry47DHySg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kLxxr-008WN0-E0
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 26 Sep 2020 00:21:27 +0000
Received: from localhost.localdomain (unknown [49.65.245.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B6ADD20708;
 Sat, 26 Sep 2020 00:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601079670;
 bh=w3xgP3gAwRlU3vYJVUANpQQUeyeF3V/RiVdViNeNL1I=;
 h=From:To:Cc:Subject:Date:From;
 b=MEqMR1fJJSFuBupHaRkT/QxkloTXml0X4aPZtjmQL2HY5wvyhGg0EnRppPBWfEG5w
 MeYrJO/NM/2mMdryIZWeP5L1qRJOwCyX1AHGK2zr2AQyU/dl0gbKCwE63Su1geYdHt
 dxFObno/6muCr3JKV0D0vtz+NXtvKtemEx00aAJI=
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sat, 26 Sep 2020 08:20:46 +0800
Message-Id: <20200926002046.6560-1-chao@kernel.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Spam-Score: -1.3 (-)
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
 -1.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kLxxr-008WN0-E0
Subject: [f2fs-dev] [PATCH] f2fs: remove unneeded parameter in
 find_in_block()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <yuchao0@huawei.com>

We can relocate @res_page assignment in find_in_block() to
its caller, so unneeded parameter could be removed for cleanup.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/dir.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index ceb4431b5669..8d98597d3960 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -190,21 +190,15 @@ static unsigned long dir_block_index(unsigned int level,
 static struct f2fs_dir_entry *find_in_block(struct inode *dir,
 				struct page *dentry_page,
 				const struct f2fs_filename *fname,
-				int *max_slots,
-				struct page **res_page)
+				int *max_slots)
 {
 	struct f2fs_dentry_block *dentry_blk;
-	struct f2fs_dir_entry *de;
 	struct f2fs_dentry_ptr d;
 
 	dentry_blk = (struct f2fs_dentry_block *)page_address(dentry_page);
 
 	make_dentry_ptr_block(dir, &d, dentry_blk);
-	de = f2fs_find_target_dentry(&d, fname, max_slots);
-	if (de)
-		*res_page = dentry_page;
-
-	return de;
+	return f2fs_find_target_dentry(&d, fname, max_slots);
 }
 
 #ifdef CONFIG_UNICODE
@@ -330,10 +324,11 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
 			}
 		}
 
-		de = find_in_block(dir, dentry_page, fname, &max_slots,
-				   res_page);
-		if (de)
+		de = find_in_block(dir, dentry_page, fname, &max_slots);
+		if (de) {
+			*res_page = dentry_page;
 			break;
+		}
 
 		if (max_slots >= s)
 			room = true;
-- 
2.22.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
