Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DA864EE2A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Dec 2022 16:50:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p6Cyc-0001OH-OR;
	Fri, 16 Dec 2022 15:50:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1p6Cyb-0001O4-Dx
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Dec 2022 15:50:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UPNia1sEOACnWj0K5Xzdv2RF5SPs1bhDCmM/JTdz4aQ=; b=hhmEFSHtaDsqGtSf8IjwpxspKf
 TznBvnjI/TpQQ4Er+I/8plcGE8jOt+4iAXWg1Gm2VO3DzR4Qx6XuNhObUt2S7M7+uQWCJd+WK/oBt
 sQZB6SQpYK7g0AzrymwIJQ3dZFfn5OipFe1vLOCefcVblhbZtx8e2KbLlFtJMyLncmoM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=UPNia1sEOACnWj0K5Xzdv2RF5SPs1bhDCmM/JTdz4aQ=; b=E
 1ymDm5IME0BACIXdZ75kgkRqJHFhON0Dfsyulz82cg4FT81DIQC2RmOQ0XVavdtQ8f1vCo9pKA9PC
 Kj/HR7JznYGXDe5ggjJE3RPQHTvXc4DYkWDjnq/epbHHiQzzIMptm9pI1C2txiYoZtdV1FfwCiYhQ
 HFRsCDL8kkXD5Opc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p6CyX-0001Ri-54 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Dec 2022 15:50:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B926762157;
 Fri, 16 Dec 2022 15:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A00F8C433D2;
 Fri, 16 Dec 2022 15:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671205811;
 bh=xZloe09AW17HVtjG+PDx0+BDGoNg91KCvWJB7A5php0=;
 h=From:To:Cc:Subject:Date:From;
 b=WvmalPl1UE2rei7ENXwYAxg7Q6rJ4dC4d+Xj3y6Sc/j6a/8J5daQlQNSjd5X8pAaa
 iKbj6oef4Knm+xJPDyWAvB8aGf0lD7LISQIKNxZCXcividtmVvzM4eoAF7VcWcqv9m
 Vu/Evr0j7/3K36nbWRcwio0XL9NdCtDZFzYTqdKDjS4L9kj2QNyAjQVWVA/gIS1SAu
 ho6/dKnm1XxiKsci2/K6xYnkqB5rUfrTbS3+7Aq3XpqLJRqfWKjPVSWwbQSVG5q7br
 l0S8v84MlpLboLAxe0VfgJAdQAudojXmVJIdwoxx3wpKqAtX5MxPGSN8y1qVn6sbbu
 e8pKMwfbfbFAA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri, 16 Dec 2022 23:50:00 +0800
Message-Id: <20221216155000.3204-1-chao@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  There is a potential deadlock reported by syzbot as below:
 F2FS-fs (loop2): invalid crc value F2FS-fs (loop2): Found nat_bits in
 checkpoint
 F2FS-fs (loop2): Mounted with checkpoint version = 48b305e4
 ======================================================
 WARN [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p6CyX-0001Ri-54
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid potential deadlock
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
Cc: syzbot+4793f6096d174c90b4f7@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

There is a potential deadlock reported by syzbot as below:

F2FS-fs (loop2): invalid crc value
F2FS-fs (loop2): Found nat_bits in checkpoint
F2FS-fs (loop2): Mounted with checkpoint version = 48b305e4
======================================================
WARNING: possible circular locking dependency detected
6.1.0-rc8-syzkaller-33330-ga5541c0811a0 #0 Not tainted
------------------------------------------------------
syz-executor.2/32123 is trying to acquire lock:
ffff0000c0e1a608 (&mm->mmap_lock){++++}-{3:3}, at: __might_fault+0x54/0xb4 mm/memory.c:5644

but task is already holding lock:
ffff0001317c6088 (&sbi->sb_lock){++++}-{3:3}, at: f2fs_down_write fs/f2fs/f2fs.h:2205 [inline]
ffff0001317c6088 (&sbi->sb_lock){++++}-{3:3}, at: f2fs_ioc_get_encryption_pwsalt fs/f2fs/file.c:2334 [inline]
ffff0001317c6088 (&sbi->sb_lock){++++}-{3:3}, at: __f2fs_ioctl+0x1370/0x3318 fs/f2fs/file.c:4151

which lock already depends on the new lock.

Chain exists of:
  &mm->mmap_lock --> &nm_i->nat_tree_lock --> &sbi->sb_lock

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&sbi->sb_lock);
                               lock(&nm_i->nat_tree_lock);
                               lock(&sbi->sb_lock);
  lock(&mm->mmap_lock);

Let's try to avoid above deadlock condition by moving __might_fault()
out of sbi->sb_lock coverage.

Fixes: 95fa90c9e5a7 ("f2fs: support recording errors into superblock")
Link: https://lore.kernel.org/linux-f2fs-devel/000000000000cd5fe305ef617fe2@google.com/T/#u
Reported-by: syzbot+4793f6096d174c90b4f7@syzkaller.appspotmail.com
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index cad4bdd6f097..4bc98dbe8292 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2336,6 +2336,7 @@ static int f2fs_ioc_get_encryption_pwsalt(struct file *filp, unsigned long arg)
 {
 	struct inode *inode = file_inode(filp);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	u8 encrypt_pw_salt[16];
 	int err;
 
 	if (!f2fs_sb_has_encrypt(sbi))
@@ -2360,12 +2361,14 @@ static int f2fs_ioc_get_encryption_pwsalt(struct file *filp, unsigned long arg)
 		goto out_err;
 	}
 got_it:
-	if (copy_to_user((__u8 __user *)arg, sbi->raw_super->encrypt_pw_salt,
-									16))
-		err = -EFAULT;
+	memcpy(encrypt_pw_salt, sbi->raw_super->encrypt_pw_salt, 16);
 out_err:
 	f2fs_up_write(&sbi->sb_lock);
 	mnt_drop_write_file(filp);
+
+	if (!err && copy_to_user((__u8 __user *)arg, encrypt_pw_salt, 16))
+		err = -EFAULT;
+
 	return err;
 }
 
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
