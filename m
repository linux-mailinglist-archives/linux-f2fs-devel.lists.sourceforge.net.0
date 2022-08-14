Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F18B5923FF
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 14 Aug 2022 18:27:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oNGSd-0004bE-IK;
	Sun, 14 Aug 2022 16:27:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1oNGSc-0004b7-3n
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Aug 2022 16:27:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xzx7zJRhLf1PG6hnk6eh5JK5DhdjeFEdcEqQAp8LaKA=; b=cehpp+SQ4QxjDRuZvIZJrCRjz8
 ym52Ru50upkazzrWJdb/yQK+fTrFhTP2bSqceagprRr3BEZaMmx/3FJmOf2HpMPlb6A02HnT5SOnP
 FZz9Xfpx4uzHBVxaH1WbMHlFObzMUoCyI07gQ3jMQnAbqdHRiJ+rszG1DUi9uuuw+U30=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Xzx7zJRhLf1PG6hnk6eh5JK5DhdjeFEdcEqQAp8LaKA=; b=DX4ehWX/6FUZgD/vbQaO3Tb9lM
 XlV8lY6erEqk4zLtAcDYNwBgN+ATAUOenyN53kaxgH0WRI3biK4oPzLn86DiYvh2KPc6lSUG3oyx2
 DVHOZSPJHiKKH6sfgDlh/P03wjmlWCovLZ8uweVDCbPiCk2JaRd5oaY7W843YwqqQ68I=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oNGSb-00007m-DE for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Aug 2022 16:27:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 85940B80B79;
 Sun, 14 Aug 2022 16:27:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FAA8C433C1;
 Sun, 14 Aug 2022 16:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660494444;
 bh=/jfp8U8V850bZODnU1RZhL/AMJJd513LUtYsEK6JinA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UNaW8HHtR4Q/eV4ogm6ByyLdtOVK1h+7H4rY8ngbtDF9DJv0QWIvSnM7dZUbhSMUY
 rJBxKX2XTkyJvbkMuhJ433t8r1MmtOc5qyi1abfkvTftzd/qMPMtUDTyNMBV+LI8jY
 B3vYZeAD0ss5NFR6+gPMeBzGSGX2+yiEdwb5OXCsFqc47h3n2pPck4JZrzpJJgrM09
 DfLkd8TXmjUJgOyK+0XHk+cysGfqjJwsRrmG6jRCVRS7tpEyIavI9gUCPmiFubxoKB
 /SLrajnzjEkDsWUEBO2balb3yHzj3sefpwBJXfsfvS2lYwoQ3jH+c08wWC4w62nU7V
 td2t+vYQNwkKg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sun, 14 Aug 2022 12:26:02 -0400
Message-Id: <20220814162610.2397644-22-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814162610.2397644-1-sashal@kernel.org>
References: <20220814162610.2397644-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chao Yu <chao.yu@oppo.com> [ Upstream commit
 141170b759e03958f296033bb7001be62d1d363b
 ] As Dipanjan Das <mail.dipanjan.das@gmail.com> reported, syzkaller found
 a f2fs bug as below: 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oNGSb-00007m-DE
Subject: [f2fs-dev] [PATCH AUTOSEL 5.15 22/28] f2fs: fix to avoid use
 f2fs_bug_on() in f2fs_new_node_page()
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
Cc: Sasha Levin <sashal@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 Dipanjan Das <mail.dipanjan.das@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <chao.yu@oppo.com>

[ Upstream commit 141170b759e03958f296033bb7001be62d1d363b ]

As Dipanjan Das <mail.dipanjan.das@gmail.com> reported, syzkaller
found a f2fs bug as below:

RIP: 0010:f2fs_new_node_page+0x19ac/0x1fc0 fs/f2fs/node.c:1295
Call Trace:
 write_all_xattrs fs/f2fs/xattr.c:487 [inline]
 __f2fs_setxattr+0xe76/0x2e10 fs/f2fs/xattr.c:743
 f2fs_setxattr+0x233/0xab0 fs/f2fs/xattr.c:790
 f2fs_xattr_generic_set+0x133/0x170 fs/f2fs/xattr.c:86
 __vfs_setxattr+0x115/0x180 fs/xattr.c:182
 __vfs_setxattr_noperm+0x125/0x5f0 fs/xattr.c:216
 __vfs_setxattr_locked+0x1cf/0x260 fs/xattr.c:277
 vfs_setxattr+0x13f/0x330 fs/xattr.c:303
 setxattr+0x146/0x160 fs/xattr.c:611
 path_setxattr+0x1a7/0x1d0 fs/xattr.c:630
 __do_sys_lsetxattr fs/xattr.c:653 [inline]
 __se_sys_lsetxattr fs/xattr.c:649 [inline]
 __x64_sys_lsetxattr+0xbd/0x150 fs/xattr.c:649
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x46/0xb0

NAT entry and nat bitmap can be inconsistent, e.g. one nid is free
in nat bitmap, and blkaddr in its NAT entry is not NULL_ADDR, it
may trigger BUG_ON() in f2fs_new_node_page(), fix it.

Reported-by: Dipanjan Das <mail.dipanjan.das@gmail.com>
Signed-off-by: Chao Yu <chao.yu@oppo.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/node.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 69c6bcaf5aae..0e6e73bc42d4 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1291,7 +1291,11 @@ struct page *f2fs_new_node_page(struct dnode_of_data *dn, unsigned int ofs)
 		dec_valid_node_count(sbi, dn->inode, !ofs);
 		goto fail;
 	}
-	f2fs_bug_on(sbi, new_ni.blk_addr != NULL_ADDR);
+	if (unlikely(new_ni.blk_addr != NULL_ADDR)) {
+		err = -EFSCORRUPTED;
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
+		goto fail;
+	}
 #endif
 	new_ni.nid = dn->nid;
 	new_ni.ino = dn->inode->i_ino;
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
