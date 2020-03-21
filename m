Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E81318E126
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 21 Mar 2020 13:24:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jFdAY-0006fj-R6; Sat, 21 Mar 2020 12:24:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1jFdAX-0006ez-A9
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 21 Mar 2020 12:24:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qrc2iJEb5igo5+A9CpNXuPvW8GnXYnuERAEkhVo4+ws=; b=ca5vAWRt9N6JyBjYBBHWub9MPj
 AtAOqUH4b1sQvtnJKtyEY1DKhfdkHYiHteKd5Yx0WZCQTCZz6r+Q93cyw42YmxdxfW/29Mw3ERdWj
 zm0ojbz0NuoNm7c94yI5pa13BwXyhIuN0N6YvkXXlh1pwZIZp/ucdQkRh7fOf1EBPPdQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qrc2iJEb5igo5+A9CpNXuPvW8GnXYnuERAEkhVo4+ws=; b=k
 Q5KZlGFHDBjPn9XkEgtcMWxK+QYxF3cyOcmfgdJYempMh0PwSBQk2ut2V4R/bDU9L3hW7TF/0sai4
 SXGq9pAUYZMjL3/7GCdLtvkfx3iDQRpumPRzitFeV6Xene7Befx/GOqENYfG29mtdtE22K86UJEY1
 tKiWEfThkwDNoNJE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jFdAV-002P8v-Il
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 21 Mar 2020 12:24:01 +0000
Received: from localhost.localdomain (unknown [49.65.245.234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5EB3B20722;
 Sat, 21 Mar 2020 12:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584793431;
 bh=CLphnmsgUdhergwuL7TSo/4QUaTvu2i11XGuraVfcfM=;
 h=From:To:Cc:Subject:Date:From;
 b=qDGl6I5ValARktfRM5ZGaY1/IsvHQoZGLy0jwuPVkjVXk4gbZnWbaIjcPXg3YDy0w
 D06hW/4tHBdCcTCgpb5yHPpvjbjXaeB+jV7GIniNnWc83LKTizyvRsZd4mXl8JuQru
 wng+yST0rRDlle9MUr3Tnn3NunsFjZsAz/xP57/8=
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sat, 21 Mar 2020 20:23:27 +0800
Message-Id: <20200321122327.22522-1-chao@kernel.org>
X-Mailer: git-send-email 2.22.0
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
X-Headers-End: 1jFdAV-002P8v-Il
Subject: [f2fs-dev] [PATCH] f2fs: don't call fscrypt_get_encryption_info()
 explicitly in f2fs_tmpfile()
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

In f2fs_tmpfile(), parent inode's encryption info is only used when
inheriting encryption context to its child inode, however, we have
already called fscrypt_get_encryption_info() in fscrypt_inherit_context()
to get the encryption info, so just removing unneeded one in
f2fs_tmpfile().

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/namei.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 95cfbce062e8..f54119da2217 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -874,12 +874,6 @@ static int f2fs_tmpfile(struct inode *dir, struct dentry *dentry, umode_t mode)
 	if (!f2fs_is_checkpoint_ready(sbi))
 		return -ENOSPC;
 
-	if (IS_ENCRYPTED(dir) || DUMMY_ENCRYPTION_ENABLED(sbi)) {
-		int err = fscrypt_get_encryption_info(dir);
-		if (err)
-			return err;
-	}
-
 	return __f2fs_tmpfile(dir, dentry, mode, NULL);
 }
 
-- 
2.22.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
