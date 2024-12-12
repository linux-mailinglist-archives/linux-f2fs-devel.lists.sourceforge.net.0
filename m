Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D90B9EFA22
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Dec 2024 18:58:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tLnS8-0008L3-4U;
	Thu, 12 Dec 2024 17:58:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dmantipov@yandex.ru>) id 1tLnS4-0008Ks-Vm
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Dec 2024 17:58:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bmH6GuJazNfXe81elplaYoKMoKP4FehDWWNplzyTaKU=; b=KKRlmlLaz84mx/KOGy7eKRSHnL
 ZKVyq+3Cl9vHakMkTtQCsqdwCSFv8gjgriG7MXgeb/v0/lzbnraSIQdQzkfdIBSZfPatphfczrvmc
 tsgTrIDRihghajKVGz3Tbl3muE00Q7yg/ryWDIVvryGWT8CzH5ZiFodB5Wv0v7sTMe7Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bmH6GuJazNfXe81elplaYoKMoKP4FehDWWNplzyTaKU=; b=iK76QkCBF+fijgDaDJO+LptgAf
 Cr6FQZDb9qLKzDgwIIxOdRfT+UZ7FlXpthhHoMEvNyHeJ9G+b0QbWsND0PD89qsTw2UgRFDbxE2tR
 U7cmcFiuVRWTX45fka7iBvgFaR8ltdA3yixppAR44QtCayeCpMRIzzoPfrjCrIsDu1jo=;
Received: from forward101d.mail.yandex.net ([178.154.239.212])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tLnS2-0004WT-Uw for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Dec 2024 17:58:16 +0000
Received: from mail-nwsmtp-smtp-production-main-42.klg.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-42.klg.yp-c.yandex.net
 [IPv6:2a02:6b8:c42:55a0:0:640:1286:0])
 by forward101d.mail.yandex.net (Yandex) with ESMTPS id BED506090C;
 Thu, 12 Dec 2024 20:58:07 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-42.klg.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id 6wsmue1Oc4Y0-50jK10KK; 
 Thu, 12 Dec 2024 20:58:07 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1734026287; bh=bmH6GuJazNfXe81elplaYoKMoKP4FehDWWNplzyTaKU=;
 h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=OO/ksv0Q0glI4U5tWcz6UIGoEyO+R3g7LEEcXGoshn8fjPoBCpCYxIfyMb7AT84Rf
 U/r4e32Hml2Y7qN6tDdsnIzAONLkkFq/Qht7b+p6vssjLFuWGk0yM3aVVN1YiPdEeA
 ZSHuWv1fJqNZjtrzsMcG1zDohHWkJsiSLHWu0DNQ=
Authentication-Results: mail-nwsmtp-smtp-production-main-42.klg.yp-c.yandex.net;
 dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Chao Yu <chao@kernel.org>
Date: Thu, 12 Dec 2024 20:57:48 +0300
Message-ID: <20241212175748.1750854-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <ec2729cc-2846-49c2-b7ca-4c1efe004cd1@kernel.org>
References: <ec2729cc-2846-49c2-b7ca-4c1efe004cd1@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Syzbot has reported the following KMSAN splat: BUG: KMSAN:
 uninit-value in f2fs_new_node_page+0x1494/0x1630
 f2fs_new_node_page+0x1494/0x1630
 f2fs_new_inode_page+0xb9/0x100 f2fs_init_inode_metadata+0x176/0x1e90
 f2fs_add_inline_entry+0x723/0xc90 f2f [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [178.154.239.212 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [178.154.239.212 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [178.154.239.212 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [178.154.239.212 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [dmantipov[at]yandex.ru]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1tLnS2-0004WT-Uw
Subject: [f2fs-dev] [PATCH v2] f2fs: ensure that node info flags are always
 initialized
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
Cc: lvc-project@linuxtesting.org, Dmitry Antipov <dmantipov@yandex.ru>,
 linux-f2fs-devel@lists.sourceforge.net,
 syzbot+5141f6db57a2f7614352@syzkaller.appspotmail.com,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Syzbot has reported the following KMSAN splat:

BUG: KMSAN: uninit-value in f2fs_new_node_page+0x1494/0x1630
 f2fs_new_node_page+0x1494/0x1630
 f2fs_new_inode_page+0xb9/0x100
 f2fs_init_inode_metadata+0x176/0x1e90
 f2fs_add_inline_entry+0x723/0xc90
 f2fs_do_add_link+0x48f/0xa70
 f2fs_symlink+0x6af/0xfc0
 vfs_symlink+0x1f1/0x470
 do_symlinkat+0x471/0xbc0
 __x64_sys_symlink+0xcf/0x140
 x64_sys_call+0x2fcc/0x3d90
 do_syscall_64+0xd9/0x1b0
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Local variable new_ni created at:
 f2fs_new_node_page+0x9d/0x1630
 f2fs_new_inode_page+0xb9/0x100

So adjust 'f2fs_get_node_info()' to ensure that 'flag'
field of 'struct node_info' is always initialized.

Reported-by: syzbot+5141f6db57a2f7614352@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=5141f6db57a2f7614352
Fixes: e05df3b115e7 ("f2fs: add node operations")
Suggested-by: Chao Yu <chao@kernel.org>
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v2: move flag initialization to f2fs_get_node_info() as suggested by Chao
---
 fs/f2fs/node.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 0b900a7a48e5..c04ee1a7ce57 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -558,6 +558,7 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
 	block_t blkaddr;
 	int i;
 
+	ni->flag = 0;
 	ni->nid = nid;
 retry:
 	/* Check nat cache */
-- 
2.47.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
