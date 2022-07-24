Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA8E57F5F0
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 24 Jul 2022 18:04:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oFe5H-0002jE-VR; Sun, 24 Jul 2022 16:03:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1oFe5G-0002j8-P0
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 24 Jul 2022 16:03:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vl82IAwq/6TWL+lHwMeexGcEFkch+/ywQHCKZNS6UJM=; b=C67m20DyuYhumfund5oMNaZHFT
 HE8poOxiJNCideUMReazU8dNV1vP0e9S9xx35RuZv8214fXqeclQAfehHDfJ71evSC4A94AZNCjZ5
 yzvmett44V79Nq1cbb6WbLT+/QPFw36pmCxkbYWRHPKOZQZ+eZUEiv7mrg3u0Ss+xF1c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vl82IAwq/6TWL+lHwMeexGcEFkch+/ywQHCKZNS6UJM=; b=K
 iOsO9YxIUgktoIS5EL5M12ABY2nl5rv4VjHpLfwmXpMTDPsX5RdW1mm4gR2So/eTm7XmN7axZ9vXb
 GjP8arixqoS7VAssA0wzRQAUck/2DokzMiqesd8TOlToTliq1d6yOsRel6JlwM5wSTu8WxUhq3cCl
 Yh1qhHOODYT8tuUg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oFe5E-0004Uo-0i
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 24 Jul 2022 16:03:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A67A761173;
 Sun, 24 Jul 2022 16:03:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26739C3411E;
 Sun, 24 Jul 2022 16:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658678630;
 bh=13VMcjVjygTo86YvqnEwgkrcMtl35I1hPD5j3xDOc94=;
 h=From:To:Cc:Subject:Date:From;
 b=p+Hmai7Na7CI4C+GMJnz75wkSGOTCDvIu3ez/57bsx3XZb3xJRegTswBRhHp42JJK
 dMqyG/ekh9ycCLFD735qJGhBIqcXxXI86WzCZu+0l8l7QGeNo8yOZEeDO5mu59ZaXn
 lROdfpbnlp1rb9YohpH1CTEWxNLzprVBXsFn+3pN6RQKL/MMKlOBTmOMwcx1q970Fc
 8fgteLBZorJgvjuBFZHXBOvjVTT2URehn2eb5BiaAP/UnF6+brCgVtn7Ibzv5kOg5q
 CIIPolv3Hf+i24JqVTb+lD7+bWyBQBCwLjuZQ0pzQw++BJgKGr/b9vejcLzPGVa39f
 0RZX75tzfAVxQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 25 Jul 2022 00:03:23 +0800
Message-Id: <20220724160323.18451-1-chao@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chao Yu <chao.yu@oppo.com> As Dipanjan Das
 <mail.dipanjan.das@gmail.com> reported,
 syzkaller found a f2fs bug as below: RIP:
 0010:f2fs_new_node_page+0x19ac/0x1fc0
 fs/f2fs/node.c:1295 Call Trace: write_all_xattrs fs/f2fs/xattr.c:487 [inline]
 __f2fs_setxattr+0xe76/0x2e10 fs/f2fs/xattr.c:743 f2fs_setxattr+0x233/0xab0
 fs/f [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oFe5E-0004Uo-0i
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid use f2fs_bug_on() in
 f2fs_new_node_page()
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
Cc: Dipanjan Das <mail.dipanjan.das@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <chao.yu@oppo.com>

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
---
 fs/f2fs/node.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 095a634436e3..d1928952d371 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1292,7 +1292,11 @@ struct page *f2fs_new_node_page(struct dnode_of_data *dn, unsigned int ofs)
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
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
