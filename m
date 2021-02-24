Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E63323C2A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Feb 2021 13:51:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lEtdh-0001NX-P4; Wed, 24 Feb 2021 12:51:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1lEtdg-0001NP-8o
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Feb 2021 12:51:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y3qyqQ2Lo380tGMtSGvGNjQzDwYxRl2+wc4xlO7y358=; b=KZoR9boN7Y8zmXBOvi1jj4qMM/
 Rt1Y/nSl0ZOl2ClQVtpREjJxvsaVYMscghAo5l0N6UhYrEzF5+38wVcOLXX+SpRk/yDJHPOjy1fT2
 SbGze5HHb7PzHVKIEHXyBpwlAZqQel0IH0v6jwJm/ka2Sk8ZXpMR1SzNP1Od44zrA0MI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y3qyqQ2Lo380tGMtSGvGNjQzDwYxRl2+wc4xlO7y358=; b=VRuFiyc5EMt8+Tqd9E11n+YndO
 tjHQe5HoUAmxU9tZjkdzBSpKUNAQ69ezUxKKWXnolTsgarzplUGufz9ddnRHbIdJ3FxudawNCzoh3
 2zh0Wa1m+Lt/hNay5LNexbKj+CmUBEi4L0DV5o3rSD2egBgkpuRITYJN2BHqkHbHYa+s=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lEtdd-003gKl-4s
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Feb 2021 12:51:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2CCEB64DD3;
 Wed, 24 Feb 2021 12:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614171083;
 bh=FXmGM1ooEssuDdSf7p7UmMUFP3S6LlN04pHCgAIs4IY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jIQfBRg2HbNDNKOigWmYCGGfqkcIW+iRHfwpfenr28uVOn/i1ZjnihqZYSaTE58T+
 1+og3Mimu0hrngNJmeGXpw4YIGfRQPu7JxMQkfOz/LLH8vPDu5D5pxnU2B1YWBNHc+
 cqpcuPYojy5fnGVlShY9qSjaRPUzsZQ99AO3wklSrWUTawQ/uC7ks+YJxUDEEAsm+C
 2ZgVmnrAPZmjqFVQgXKXvDC31AH54GCrRDvTBvL1mnE/IYDg3Cs00i5fmScMpI9ioj
 myhUcvEM290yjTNEC0cair16OYxuFz4QnvqO0jY0doUu+4P4luyn4I8JpZnu1PNIrr
 j9GLJ5V1UJL/A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 24 Feb 2021 07:50:00 -0500
Message-Id: <20210224125026.481804-42-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210224125026.481804-1-sashal@kernel.org>
References: <20210224125026.481804-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.1 (/)
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lEtdd-003gKl-4s
Subject: [f2fs-dev] [PATCH AUTOSEL 5.11 42/67] f2fs: fix to set/clear
 I_LINKABLE under i_lock
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <yuchao0@huawei.com>

[ Upstream commit 46085f37fc9e12d5c3539fb768b5ad7951e72acf ]

fsstress + fault injection test case reports a warning message as
below:

WARNING: CPU: 13 PID: 6226 at fs/inode.c:361 inc_nlink+0x32/0x40
Call Trace:
 f2fs_init_inode_metadata+0x25c/0x4a0 [f2fs]
 f2fs_add_inline_entry+0x153/0x3b0 [f2fs]
 f2fs_add_dentry+0x75/0x80 [f2fs]
 f2fs_do_add_link+0x108/0x160 [f2fs]
 f2fs_rename2+0x6ab/0x14f0 [f2fs]
 vfs_rename+0x70c/0x940
 do_renameat2+0x4d8/0x4f0
 __x64_sys_renameat2+0x4b/0x60
 do_syscall_64+0x33/0x80
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

Following race case can cause this:
Thread A				Kworker
- f2fs_rename
 - f2fs_create_whiteout
  - __f2fs_tmpfile
   - f2fs_i_links_write
    - f2fs_mark_inode_dirty_sync
     - mark_inode_dirty_sync
					- writeback_single_inode
					 - __writeback_single_inode
					  - spin_lock(&inode->i_lock)
   - inode->i_state |= I_LINKABLE
					  - inode->i_state &= ~dirty
					  - spin_unlock(&inode->i_lock)
 - f2fs_add_link
  - f2fs_do_add_link
   - f2fs_add_dentry
    - f2fs_add_inline_entry
     - f2fs_init_inode_metadata
      - f2fs_i_links_write
       - inc_nlink
        - WARN_ON(!(inode->i_state & I_LINKABLE))

Fix to add i_lock to avoid i_state update race condition.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/namei.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 6edb1ab579a18..8878049685769 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -855,7 +855,11 @@ static int __f2fs_tmpfile(struct inode *dir, struct dentry *dentry,
 
 	if (whiteout) {
 		f2fs_i_links_write(inode, false);
+
+		spin_lock(&inode->i_lock);
 		inode->i_state |= I_LINKABLE;
+		spin_unlock(&inode->i_lock);
+
 		*whiteout = inode;
 	} else {
 		d_tmpfile(dentry, inode);
@@ -1041,7 +1045,11 @@ static int f2fs_rename(struct inode *old_dir, struct dentry *old_dentry,
 		err = f2fs_add_link(old_dentry, whiteout);
 		if (err)
 			goto put_out_dir;
+
+		spin_lock(&whiteout->i_lock);
 		whiteout->i_state &= ~I_LINKABLE;
+		spin_unlock(&whiteout->i_lock);
+
 		iput(whiteout);
 	}
 
-- 
2.27.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
