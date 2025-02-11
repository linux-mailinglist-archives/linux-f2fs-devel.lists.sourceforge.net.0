Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 005F2A3044F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Feb 2025 08:17:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1thkWi-0005UB-5W;
	Tue, 11 Feb 2025 07:17:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1thkWg-0005U4-VP
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Feb 2025 07:17:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0vzCU46pQx7X4GIrb22uPO4418w90hTdgZCQT7wI9v8=; b=ZcAHXUKN0Y60e1xjxR4/PMEOCZ
 HybYB2uV5Tnirh1WmPZCTAywS7I+nJv4FLqSQL6cdVkwcxvhA5GhJ99iMzdzTTnau+ORVfZ7/B1LY
 /PT34/sjIbF5qaqvMfOyxlDNSBAQzbhL+ktMiDBN79yLRTo96W+e48XBNJVw0arHs32k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0vzCU46pQx7X4GIrb22uPO4418w90hTdgZCQT7wI9v8=; b=a
 1F791Asmyz3FFqPjP0WYIfXxnhi+6+QjsjtpiVNgs6DSa/aRXkpyEIWtsvHAHFtOyw4PKlwxeYOF8
 srgJ8nTdXiCJuJHsHs6xdbFAzgtmaRGKpdjQcQ0oSjbkWMfnKuGrTdhbOITnRtFvDUup0cCiU5lB6
 aLuyS/sc3Z18y3SA=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1thkWg-0008CG-PK for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Feb 2025 07:17:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 81A6DA400C6;
 Tue, 11 Feb 2025 07:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28AC9C4CEDD;
 Tue, 11 Feb 2025 07:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739258255;
 bh=5RzxvLb5nIJ6JuzhSFBxZcRkYWm59niakiJkEIZELu0=;
 h=From:To:Cc:Subject:Date:From;
 b=M8f5QS+d9ww+ZQzkQFPLG11cVrAm28k/0fKAM0VEKVBQJAnyD9QBvnHKMbt/0fgOU
 2GuTenjp+/PDmuA3w/m6bY4ied/+ChG0kxVfnb55RSm6bqto3/P2VM0TcU0BkuNedb
 WVt7/eu4TgBSCWJXBqXd3/UjgfvkleloQu+N2aL6vznjDNhEZiLMhm8d2YiXZJmSwE
 LF/WptDGOADfJFGZ1KLF5Bud3QyN0UsmyRBHVhJTPyeAF0zYYtnf+jDhGQMA3GIhjo
 nUoC+w8o93Gmh5hHKPYPtx8ByCQ1Qz0HybaTDf24q0oxL4ZT8i9xX4m7poXJS7WtqU
 VRbfwIVF7EL2w==
To: jaegeuk@kernel.org
Date: Tue, 11 Feb 2025 15:17:25 +0800
Message-ID: <20250211071725.457343-1-chao@kernel.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
MIME-Version: 1.0
X-Spam-Score: -4.0 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Leo Stone <leocstone@gmail.com> The syzbot reproducer
 mounts a f2fs image, then tries to unlink an existing file. However, the
 unlinked file already has a link count of 0 when it is read for the first
 time in do_read_inode(). 
 Content analysis details:   (-4.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1thkWg-0008CG-PK
Subject: [f2fs-dev] [PATCH v3 RESEND] f2fs: add check for deleted inode
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: syzbot+b01a36acd7007e273a83@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, Leo Stone <leocstone@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Leo Stone <leocstone@gmail.com>

The syzbot reproducer mounts a f2fs image, then tries to unlink an
existing file. However, the unlinked file already has a link count of 0
when it is read for the first time in do_read_inode().

Add a check to sanity_check_inode() for i_nlink == 0.

[Chao Yu: rebase the code]
Reported-by: syzbot+b01a36acd7007e273a83@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b01a36acd7007e273a83
Fixes: 39a53e0ce0df ("f2fs: add superblock and major in-memory structure")
Signed-off-by: Leo Stone <leocstone@gmail.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
- no logic change, just rebase the code to last dev-test branch
 fs/f2fs/inode.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index d6ad7810df69..543fb942bec1 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -386,6 +386,12 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 		}
 	}
 
+	if (inode->i_nlink == 0) {
+		f2fs_warn(sbi, "%s: inode (ino=%lx) has a link count of 0",
+			  __func__, inode->i_ino);
+		return false;
+	}
+
 	return true;
 }
 
-- 
2.48.1.502.g6dc24dfdaf-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
