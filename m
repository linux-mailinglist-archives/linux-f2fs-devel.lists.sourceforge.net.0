Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5B62EA1B9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Jan 2021 01:55:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kwada-0008QX-0i; Tue, 05 Jan 2021 00:55:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kwadX-0008Q2-Rw
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Jan 2021 00:55:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CHPRcnjlwgZxLZAEUBnLsGbjkHFKxmeyVRt9FfKW6tg=; b=Tjf7ijZbVw+l2h4qmQy+AI/ZIM
 dBCd1DCbIkyeKbQs//RuPjr7iu/cH5wZZUL5DEIXqFLu9OjHmKlaUmRtUT6SMWrve9Yi1r4b6pSAc
 x+9EwHmV3r+Ycv8R7TmdrqnwfRSCNwN+5KcgxTmT/SlfGKK0iso2o/SokI35TQI01veg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CHPRcnjlwgZxLZAEUBnLsGbjkHFKxmeyVRt9FfKW6tg=; b=Tui7JnnA0yYpNYDyl968wP/PVC
 vdk1nMjfB5a7woT1uHlaeX4E2qnR/TJPYLBVFKBpHqxtnbPccfWmcPaydbFKQcrZT5q34WBA2eSkS
 yE779Fp6icWRzwkg33H0Y19r4GS+8iUbI3A+E6aZyOt63gV+Cp/hcwf1Rc0SzlLHnrH4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kwadO-008HmH-QL
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Jan 2021 00:55:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 28656225A9;
 Tue,  5 Jan 2021 00:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609808109;
 bh=Ad7xLAZQk7GaC9BkYrLopltjaA0micO7CKVPyWiuAIc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a9pN6k7eZWDzKxMNTAL16e24puJANBJqgUATkSeVAFTD1NZ47idpUHJlSPEqpBGkK
 UqoR0jDQJOR+ODkJotclMYzN9qCk1aAU0iTIOL/17YsRFdJzHij3FPqqu6srKMpgnK
 lcEM7vhAEfE+jrUnJyv5rdeTitXFHJKs6xmCvuKB/adz9aAiENsqhnSa3YyytLjVem
 nXDWtC3fxXJqwb4wXSh5nX2URUIYWMazymEm3+pfyQZcF2nmpB+fVPZM5uZW2d7Sz/
 igWIQnJAFW8cLT0v2qBsM+KXzZWW25sbQYF2d1mkJqke9RyEBq3TuiZ0lSbTFEMlUi
 Zk5ZRbFXOQr8g==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon,  4 Jan 2021 16:54:47 -0800
Message-Id: <20210105005452.92521-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210105005452.92521-1-ebiggers@kernel.org>
References: <20210105005452.92521-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kwadO-008HmH-QL
Subject: [f2fs-dev] [PATCH 08/13] ext4: simplify i_state checks in
 __ext4_update_other_inode_time()
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
Cc: linux-xfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Christoph Hellwig <hch@lst.de>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Since I_DIRTY_TIME and I_DIRTY_INODE are mutually exclusive in i_state,
there's no need to check for I_DIRTY_TIME && !I_DIRTY_INODE.  Just check
for I_DIRTY_TIME.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/inode.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 4cc6c7834312f..9e34541715968 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -4962,14 +4962,12 @@ static void __ext4_update_other_inode_time(struct super_block *sb,
 		return;
 
 	if ((inode->i_state & (I_FREEING | I_WILL_FREE | I_NEW |
-			       I_DIRTY_INODE)) ||
-	    ((inode->i_state & I_DIRTY_TIME) == 0))
+			       I_DIRTY_TIME)) != I_DIRTY_TIME)
 		return;
 
 	spin_lock(&inode->i_lock);
-	if (((inode->i_state & (I_FREEING | I_WILL_FREE | I_NEW |
-				I_DIRTY_INODE)) == 0) &&
-	    (inode->i_state & I_DIRTY_TIME)) {
+	if ((inode->i_state & (I_FREEING | I_WILL_FREE | I_NEW |
+			       I_DIRTY_TIME)) != I_DIRTY_TIME) {
 		struct ext4_inode_info	*ei = EXT4_I(inode);
 
 		inode->i_state &= ~I_DIRTY_TIME;
-- 
2.30.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
