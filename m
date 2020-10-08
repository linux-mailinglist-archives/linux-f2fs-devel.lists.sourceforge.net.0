Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B41D9287C53
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Oct 2020 21:17:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kQbPt-0000lr-LE; Thu, 08 Oct 2020 19:17:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kQbPr-0000lk-Mu
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 08 Oct 2020 19:17:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n7KS2L6PN3krMBY5ATxY3SGA2G7c97FyL8qU1PJ4Ebk=; b=Jp78oToNRk0KHdMA/Hr8MzaHM3
 i9K6HJfIzIZ3yfbZFf5+27qZY+PZDoG3A8+i+jGymumyXV+PhMTYIbasfe1lYqT7OnITZsl/3Puz8
 Q1uLxPUxxPeluRNr2NugDo9tMAnBSPGJiJphDMM0LU8ed+9paB5yUR0mlApOFYF0u55s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=n7KS2L6PN3krMBY5ATxY3SGA2G7c97FyL8qU1PJ4Ebk=; b=Zwh5WmevxluEdgxRvYAecWFx4g
 grT3g2xiK9ucHFXofl6MHICjKq91t5Q2+Ya0GqyJQKKqI8vP8OtIaTBdNRO8IpNtKDEuKu8ZnU9Hg
 ge/lCal2fiwX6MdgPA0ukZyqjZOkOCx/YxHgKgTUC75fD7MYOpfdJtSoTJnG1Nx6hkvE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kQbPW-007X03-Hj
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 08 Oct 2020 19:17:27 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 868C021789;
 Thu,  8 Oct 2020 19:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602184608;
 bh=lexhJREGzh+/V1ER4S2AHbrxdRthtEv6r0KJwlclks0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qKGAlpbG4OOoEJ39yOZrI0Ynhku9gSvjjvr3ZOqu0wyOMpdNnsWm2vKqewWp6GWdI
 mXQvmSp84eTaMtPevuVefKdF/knNC4TkPArkM1ZVcOuBcOFvL1UHFq53AwuiaeAl47
 hbrrO6ioBdX0157aAcfbyMzkPVkmx92CEZyaJUgw=
From: Eric Biggers <ebiggers@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  8 Oct 2020 12:15:22 -0700
Message-Id: <20201008191522.1948889-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
In-Reply-To: <00000000000085be6f05b12a1366@google.com>
References: <00000000000085be6f05b12a1366@google.com>
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1kQbPW-007X03-Hj
Subject: [f2fs-dev] [PATCH] f2fs: reject CASEFOLD inode flag without
 casefold feature
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
Cc: Daniel Rosenberg <drosen@google.com>, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 syzbot+05139c4039d0679e19ff@syzkaller.appspotmail.com,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

syzbot reported:

    general protection fault, probably for non-canonical address 0xdffffc0000000001: 0000 [#1] PREEMPT SMP KASAN
    KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
    CPU: 0 PID: 6860 Comm: syz-executor835 Not tainted 5.9.0-rc8-syzkaller #0
    Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
    RIP: 0010:utf8_casefold+0x43/0x1b0 fs/unicode/utf8-core.c:107
    [...]
    Call Trace:
     f2fs_init_casefolded_name fs/f2fs/dir.c:85 [inline]
     __f2fs_setup_filename fs/f2fs/dir.c:118 [inline]
     f2fs_prepare_lookup+0x3bf/0x640 fs/f2fs/dir.c:163
     f2fs_lookup+0x10d/0x920 fs/f2fs/namei.c:494
     __lookup_hash+0x115/0x240 fs/namei.c:1445
     filename_create+0x14b/0x630 fs/namei.c:3467
     user_path_create fs/namei.c:3524 [inline]
     do_mkdirat+0x56/0x310 fs/namei.c:3664
     do_syscall_64+0x31/0x70 arch/x86/entry/common.c:46
     entry_SYSCALL_64_after_hwframe+0x44/0xa9
    [...]

The problem is that an inode has F2FS_CASEFOLD_FL set, but the
filesystem doesn't have the casefold feature flag set, and therefore
super_block::s_encoding is NULL.

Fix this by making sanity_check_inode() reject inodes that have
F2FS_CASEFOLD_FL when the filesystem doesn't have the casefold feature.

Reported-by: syzbot+05139c4039d0679e19ff@syzkaller.appspotmail.com
Fixes: 2c2eb7a300cd ("f2fs: Support case-insensitive file name lookups")
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/inode.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 2ed935c13aed..d5664bc7d6c6 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -287,6 +287,13 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 		return false;
 	}
 
+	if ((fi->i_flags & F2FS_CASEFOLD_FL) && !f2fs_sb_has_casefold(sbi)) {
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
+		f2fs_warn(sbi, "%s: inode (ino=%lx) has casefold flag, but casefold feature is off",
+			  __func__, inode->i_ino);
+		return false;
+	}
+
 	if (f2fs_has_extra_attr(inode) && f2fs_sb_has_compression(sbi) &&
 			fi->i_flags & F2FS_COMPR_FL &&
 			F2FS_FITS_IN_INODE(ri, fi->i_extra_isize,

base-commit: db40330b0de9a9d9939178f48cd5fc5e3fab14de
-- 
2.28.0.1011.ga647a8990f-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
