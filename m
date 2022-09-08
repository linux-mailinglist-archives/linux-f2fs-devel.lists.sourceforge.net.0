Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C16DC5B1AA5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Sep 2022 12:54:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oWFAQ-0001HJ-AN;
	Thu, 08 Sep 2022 10:53:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oWFAN-0001FZ-S6
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Sep 2022 10:53:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AS6kRqFbELJ8wbRmosgjeV7Yq4QLf86p2re/q4hDbX4=; b=Ypg5e4uUT9YWGTehZFscQlY94f
 Z5EYYYi9+0xGlRao/l0duN5xDqn+C0mPCpRFvOOHWra6Ybh33bZLU5EwcGHOKgXGsn8UZk3+mlYwB
 q05QyRS2W6idvQUr5EcrYz4b1lMSNP8vggMDv05+Y/YzmVfMc7+6B/DZJvcetk2/SX3Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=AS6kRqFbELJ8wbRmosgjeV7Yq4QLf86p2re/q4hDbX4=; b=T
 gNx52iz0G8C1HS2Ys/7yoNfxYItJhqh+rtw1Vr8vK9LgSsHD5YwYcyNLctg05P6iEPv5/N6tZ0TVd
 F8uPQPiyrZRLzMu9srPXOYns2lbEvdmQSMXH8HsPBSVLQlNZQQVg0vPEi1/R0lA57aLPOwa0T3jVv
 O+cD3SNVXC5hDXH8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oWFAN-0023sh-6v for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Sep 2022 10:53:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CFE3A61C22;
 Thu,  8 Sep 2022 10:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64DBBC433D6;
 Thu,  8 Sep 2022 10:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662634425;
 bh=/uQGY/TLUWDSIoiHlfo1tz7P2bAvlkNOsxUtduE+0OI=;
 h=From:To:Cc:Subject:Date:From;
 b=gfdFSnqYnme8GldZpLsp33ZY5vG9mm5BTo5f8ffhE5V0sH82s4MhPlZNckpLxblOt
 kSVhHh9kL7h1u606MAINkiwGQLbhfny2LTXS520l8IlnZzHQlw9n8L2A9K7Ny2H1jg
 idaPPN34LdZyIOT4QUQJ37dy6Q+uCuJObFa4R6RIa7u4u0sBTU1BaGHOpa7HrSMB5p
 FnnuaxLV0qSLgDVeo57kEq3u2I0pWLe9c2uINtQO3cLZT3MwRTORn7qx3OsJ2LxrVg
 gvQ4nknJINvPjLajikJkl5aKfHO2Vle/WRMZ8cC4CBw8sZrpsPzOo5fgXs4uSPwTYW
 43IeEa6er2uBw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu,  8 Sep 2022 18:53:34 +0800
Message-Id: <20220908105334.98572-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Sometimes we can get a cached meta_inode which has no aops
 yet. Let's set it all the time to fix the below panic. Unable to handle kernel
 NULL pointer dereference at virtual address 0000000000000000 Mem abort info:
 ESR = 0x0000000086000004 EC = 0x21: IABT (current EL), IL = 32 bits SET =
 0, FnV = 0 EA = 0, S1PTW [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oWFAN-0023sh-6v
Subject: [f2fs-dev] [PATCH] f2fs: fix to detect obsolete inner inode during
 fill_super()
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
Cc: syzbot+775a3440817f74fddb8c@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Sometimes we can get a cached meta_inode which has no aops yet. Let's set it
all the time to fix the below panic.

Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
Mem abort info:
  ESR = 0x0000000086000004
  EC = 0x21: IABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x04: level 0 translation fault
user pgtable: 4k pages, 48-bit VAs, pgdp=0000000109ee4000
[0000000000000000] pgd=0000000000000000, p4d=0000000000000000
Internal error: Oops: 86000004 [#1] PREEMPT SMP
Modules linked in:
CPU: 1 PID: 3045 Comm: syz-executor330 Not tainted 6.0.0-rc2-syzkaller-16455-ga41a877bc12d #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/22/2022
pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : 0x0
lr : folio_mark_dirty+0xbc/0x208 mm/page-writeback.c:2748
sp : ffff800012783970
x29: ffff800012783970 x28: 0000000000000000 x27: ffff800012783b08
x26: 0000000000000001 x25: 0000000000000400 x24: 0000000000000001
x23: ffff0000c736e000 x22: 0000000000000045 x21: 05ffc00000000015
x20: ffff0000ca7403b8 x19: fffffc00032ec600 x18: 0000000000000181
x17: ffff80000c04d6bc x16: ffff80000dbb8658 x15: 0000000000000000
x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
x11: ff808000083e9814 x10: 0000000000000000 x9 : ffff8000083e9814
x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000000000000
x5 : ffff0000cbb19000 x4 : ffff0000cb3d2000 x3 : ffff0000cbb18f80
x2 : fffffffffffffff0 x1 : fffffc00032ec600 x0 : ffff0000ca7403b8
Call trace:
 0x0
 set_page_dirty+0x38/0xbc mm/folio-compat.c:62
 f2fs_update_meta_page+0x80/0xa8 fs/f2fs/segment.c:2369
 do_checkpoint+0x794/0xea8 fs/f2fs/checkpoint.c:1522
 f2fs_write_checkpoint+0x3b8/0x568 fs/f2fs/checkpoint.c:1679

The root cause is, quoted from Jaegeuk:

It turned out there is a bug in reiserfs which doesn't free the root
inode (ino=2). That leads f2fs to find an ino=2 with the previous
superblock point used by reiserfs. That stale inode has no valid
mapping that f2fs can use, result in kernel panic.

This patch adds sanity check in f2fs_iget() to avoid finding stale
inode during inner inode initialization.

Cc: stable@vger.kernel.org
Reported-by: syzbot+775a3440817f74fddb8c@syzkaller.appspotmail.com
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/inode.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index ccb29034af59..df1a82fbfaf2 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -493,6 +493,17 @@ struct inode *f2fs_iget_inner(struct super_block *sb, unsigned long ino)
 	struct inode *inode;
 	int ret = 0;
 
+	if (ino == F2FS_NODE_INO(sbi) || ino == F2FS_META_INO(sbi) ||
+					ino == F2FS_COMPRESS_INO(sbi)) {
+		inode = ilookup(sb, ino);
+		if (inode) {
+			iput(inode);
+			f2fs_err(sbi, "there is obsoleted inner inode %lu cached in hash table",
+					ino);
+			return ERR_PTR(-EFSCORRUPTED);
+		}
+	}
+
 	inode = iget_locked(sb, ino);
 	if (!inode)
 		return ERR_PTR(-ENOMEM);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
