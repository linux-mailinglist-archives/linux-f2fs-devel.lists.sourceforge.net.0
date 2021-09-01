Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB093FD4E1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Sep 2021 10:06:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mLLGe-00019D-RQ; Wed, 01 Sep 2021 08:06:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mLLGd-00018l-3s
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Sep 2021 08:06:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pblvpa1XiHJljoQs8KOWJQEidfESGx7IO3ScQM/D3sw=; b=Wt+jCSEdbwwDvSjc4M2ODiAV2w
 hW2WugyfKrAMc5X104ayTeETLQoergaBDV2mmCGwG2UnyGBtMTd1jXcREOvKomAE9iNfTgaNujf33
 ujA5esB5SChvOP6Gi4yyjnD3/+igjZ+n6XgwAI8Rpy7N0qIYtyliHlzK7iyphqsVDlHI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Pblvpa1XiHJljoQs8KOWJQEidfESGx7IO3ScQM/D3sw=; b=U
 2AplAqfaj2bZWmHFlacUsJufD8yUASPwwaSKA4y9ZmvhqRxAhS9/3K5DMQk3CGoTlMt53yaROU1T5
 IBQa+4o3RrkIu3BwqZLPyB0HkyGUcML02D+mlxd/tAGLSi+pOLfNPHf7PEmd7RsrPNFi6ldOwzyJB
 /iUwxFSlVKVZkIxY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mLLGc-00A8Al-Fd
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Sep 2021 08:06:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C5C06103D;
 Wed,  1 Sep 2021 08:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630483589;
 bh=HFXW2CXUVuj9t9Ig1elcp8R+lAYqA68TQyV8IJQJvmA=;
 h=From:To:Cc:Subject:Date:From;
 b=PrGxvohdSMKpxmdJwW5SPfczCcjE5fL6gAUWGavIuNT7hu0PyUfwKybImG0WvaXn2
 z6nig86cxvCyPjpfz5yZUO20j9538S1kNeoDCyH/GkInabkNG0+Xz4WFvbgCUj+M23
 rlhVNBwclhRUhpt1ReCG9oiLeAClaia2Vp8yZ2RCgxmFi4kIGLfZkNO62TylLX0dFC
 Z03oFieXanxlH0WK1lRf5yvL/FvgayU4z2FOeY9BEgM8YKhHRMk0MgZnq1eFv8EHZm
 65B5ZtdSWg+hyWNPERdua/0Q9JNMx5TZU6Ule3BpLYY+Sl2lh57XqawNLMw7GDofPr
 LOin7K0sJnF4A==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed,  1 Sep 2021 16:06:21 +0800
Message-Id: <20210901080621.110319-1-chao@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Quoted from [1] "I do remember that I've added this code back
 then because otherwise orphan cleanup was losing updates to quota files.
 But you're right that now I don't see how that could be happening and it would
 be [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mLLGc-00A8Al-Fd
Subject: [f2fs-dev] [PATCH v2] f2fs: avoid attaching SB_ACTIVE flag during
 mount
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
Cc: Jan Kara <jack@suse.cz>, Zhang Yi <yi.zhang@huawei.com>,
 Chao Yu <chao.yu@linux.dev>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Quoted from [1]

"I do remember that I've added this code back then because otherwise
orphan cleanup was losing updates to quota files. But you're right
that now I don't see how that could be happening and it would be nice
if we could get rid of this hack"

[1] https://lore.kernel.org/linux-ext4/99cce8ca-e4a0-7301-840f-2ace67c551f3@huawei.com/T/#m04990cfbc4f44592421736b504afcc346b2a7c00

Related fix in ext4 by
commit 72ffb49a7b62 ("ext4: do not set SB_ACTIVE in ext4_orphan_cleanup()").

f2fs has the same hack implementation in
- f2fs_recover_orphan_inodes()
- f2fs_recover_fsync_data()

Let's get rid of this hack as well in f2fs.

Cc: Zhang Yi <yi.zhang@huawei.com>
Cc: Jan Kara <jack@suse.cz>
Acked-by: Jan Kara <jack@suse.cz>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- don't bother checkpoint disabling path
 fs/f2fs/checkpoint.c | 3 ---
 fs/f2fs/recovery.c   | 8 ++------
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 83e9bc0f91ff..7d8803a4cbc2 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -705,9 +705,6 @@ int f2fs_recover_orphan_inodes(struct f2fs_sb_info *sbi)
 	}
 
 #ifdef CONFIG_QUOTA
-	/* Needed for iput() to work correctly and not trash data */
-	sbi->sb->s_flags |= SB_ACTIVE;
-
 	/*
 	 * Turn on quotas which were not enabled for read-only mounts if
 	 * filesystem has quota feature, so that they are updated correctly.
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 04655511d7f5..706ddb3c95c0 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -787,8 +787,6 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
 	}
 
 #ifdef CONFIG_QUOTA
-	/* Needed for iput() to work correctly and not trash data */
-	sbi->sb->s_flags |= SB_ACTIVE;
 	/* Turn on quotas so that they are updated correctly */
 	quota_enabled = f2fs_enable_quota_files(sbi, s_flags & SB_RDONLY);
 #endif
@@ -816,10 +814,8 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
 	err = recover_data(sbi, &inode_list, &tmp_inode_list, &dir_list);
 	if (!err)
 		f2fs_bug_on(sbi, !list_empty(&inode_list));
-	else {
-		/* restore s_flags to let iput() trash data */
-		sbi->sb->s_flags = s_flags;
-	}
+	else
+		f2fs_bug_on(sbi, sbi->sb->s_flags & SB_ACTIVE);
 skip:
 	fix_curseg_write_pointer = !check_only || list_empty(&inode_list);
 
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
