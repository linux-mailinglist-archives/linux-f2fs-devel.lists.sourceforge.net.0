Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D42997FB5A0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Nov 2023 10:25:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r7uLV-0002b3-98;
	Tue, 28 Nov 2023 09:25:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1r7uLQ-0002Zx-FL
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Nov 2023 09:25:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k1Rlld7fBMsgFCuTG14dU0j6lo25v1qSgNOZfv4f+XM=; b=FM2y9AUKAWhedNLy0Q24XlhKl9
 kKOS1f9xukxpCGKb3pLwF87xftS9jrO/tQEqpwSyQ+iWP5k+mu7jP1xgX00JqFPCRX/TygDOyarLV
 OD0LcFR24GVWR7Vx6qglxljoDNZV++vnuS4wRdn2gGlLmsFiTDr5SHCIWZASrmDUyTlQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=k1Rlld7fBMsgFCuTG14dU0j6lo25v1qSgNOZfv4f+XM=; b=D
 fP9xgdJrY+PyynHjhX78Oq2ATrp8Gd0/1DXTKwjdmsS8CUzPWg/OJCBenmDoZA8x6g1q59uPZTfyK
 ud82qAHTB44BQXmPpF7AuC4lWrPMXc/QzzVYn8TKKObhZP9/pjZKWrNZCc6RewheUrud2ItueheHB
 cuYZ7RDI7mtDyS4U=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r7uLQ-0000cn-8Q for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Nov 2023 09:25:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D02B76164B;
 Tue, 28 Nov 2023 09:25:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCDD1C433C8;
 Tue, 28 Nov 2023 09:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701163522;
 bh=8ei0w6/cvwAZe9ao3KX6VzPIdkZ0HCfTd2duIQACX5w=;
 h=From:To:Cc:Subject:Date:From;
 b=sb2iDi1mjSU6gmZk7txGqQ+SV1xHCgEarAPTn+dDy1TfVwI4JiQMRxQlq0xfKt2Qm
 hzvXi78/1gl35t6SD+gnDpON8kZNOjBVlk3Up6l0sV9BkJkfz4gID+1b5gzC1iYW9I
 A+LNnS5Hy/odSsknkICdXFOKY2hZTmzaK8cclhwJc8G/rODKiBARZWmXela8febKiF
 uQ+p63GW0wyAAfR3DQVicv6HqR6Zoeiu6JhlM+6xpv7J6z15NO5VIEeE/ep/Esta3x
 UGIbGohjtWQi+dtfHUBM0gylYaTIIMgYWJwjdLernpAaBLLHEHQjhX2gYEPbBkJ5+G
 gsCXcVWledjDQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 28 Nov 2023 17:25:16 +0800
Message-Id: <20231128092516.2882629-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: As Al reported in link[1]: f2fs_rename() ... if (old_dir !=
 new_dir && !whiteout) f2fs_set_link(old_inode, old_dir_entry, old_dir_page,
 new_dir); else f2fs_put_page(old_dir_page, 0); You want correct inumber in
 the ".." link. And cross-directory rename does move the source to new parent, 
 even if you'd been asked to leave a whiteout in the old place. 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r7uLQ-0000cn-8Q
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid dirent corruption
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
Cc: Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As Al reported in link[1]:

f2fs_rename()
...
	if (old_dir != new_dir && !whiteout)
		f2fs_set_link(old_inode, old_dir_entry,
					old_dir_page, new_dir);
	else
		f2fs_put_page(old_dir_page, 0);

You want correct inumber in the ".." link.  And cross-directory
rename does move the source to new parent, even if you'd been asked
to leave a whiteout in the old place.

[1] https://lore.kernel.org/all/20231017055040.GN800259@ZenIV/

With below testcase, it may cause dirent corruption, due to it missed
to call f2fs_set_link() to update ".." link to new directory.
- mkdir -p dir/foo
- renameat2 -w dir/foo bar

[ASSERT] (__chk_dots_dentries:1421)  --> Bad inode number[0x4] for '..', parent parent ino is [0x3]
[FSCK] other corrupted bugs                           [Fail]

Fixes: 7e01e7ad746b ("f2fs: support RENAME_WHITEOUT")
Cc: Jan Kara <jack@suse.cz>
Reported-by: Al Viro <viro@zeniv.linux.org.uk>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/namei.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 3b1793cfb002..ede6afb81762 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -1105,7 +1105,7 @@ static int f2fs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 	}
 
 	if (old_dir_entry) {
-		if (old_dir != new_dir && !whiteout)
+		if (old_dir != new_dir)
 			f2fs_set_link(old_inode, old_dir_entry,
 						old_dir_page, new_dir);
 		else
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
