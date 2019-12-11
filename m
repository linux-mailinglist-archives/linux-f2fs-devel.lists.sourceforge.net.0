Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B29F11B11E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Dec 2019 16:29:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1if3vA-0005Kr-Sy; Wed, 11 Dec 2019 15:29:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1if3v9-0005Kb-L7
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Dec 2019 15:28:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vqgI18IO225E0s2RfaMaBRtBWMdkV+spvZuSMN7iapI=; b=XnkJncofgkzwLqMMV6+G6P1my/
 6b0zGuFUlSRYw44CQP0KD1HOAXwYnXj1L8snzf8sXhM3sCJueB3PkCk5wgJvu34A/tck3Tj+MXFkb
 qy+mlxBv7GfdZ5Y+iFlvlw7fNADocdXYiDm/8D+jmpTLblqUaDnD2aQ8irz4z70C5jTY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vqgI18IO225E0s2RfaMaBRtBWMdkV+spvZuSMN7iapI=; b=ZWkvrb5cMJozGqjKOWMp69LeZE
 ecUfNVLmgwKfXTD3CkphDiue3MfZJsIOAHGrdWJU+PnI0kPMghfYPr8EHeWMTuKtE8RaOC8UpjCM9
 7vSSVgHzbeNpd9jO3yV6wzK4jn2VLcyTvC2WqMKuEXf3grtiVCm50ptWiqP46+sbt24I=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1if3v8-0012uY-GN
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Dec 2019 15:28:59 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3124E222C4;
 Wed, 11 Dec 2019 15:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576078132;
 bh=4y9xGbhnrjK2hjcSMbEbcwqhZJeI4tF5cKVYU0MuI1E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f/X2jir1knQ9bv45wXF7kFjnLsCKK2egs71nxb+bQ6/KC3oFNCQBEzGIn04kwhVD2
 GaMMJlZnZh2XT2Fvq15ANlTSoIsHrP7WY7ma9UJG/Brn3xJq/tJJLTGfHUOWWHs2er
 L3beCITZes4WDuwqdEleWN3qi0vjz/R3UHh2Ug6g=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 11 Dec 2019 10:27:53 -0500
Message-Id: <20191211152831.23507-20-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191211152831.23507-1-sashal@kernel.org>
References: <20191211152831.23507-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.5 (/)
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1if3v8-0012uY-GN
Subject: [f2fs-dev] [PATCH AUTOSEL 4.14 20/58] f2fs: fix to update dir's
 i_pino during cross_rename
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
Cc: Eric Biggers <ebiggers@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <yuchao0@huawei.com>

[ Upstream commit 2a60637f06ac94869b2e630eaf837110d39bf291 ]

As Eric reported:

RENAME_EXCHANGE support was just added to fsstress in xfstests:

	commit 65dfd40a97b6bbbd2a22538977bab355c5bc0f06
	Author: kaixuxia <xiakaixu1987@gmail.com>
	Date:   Thu Oct 31 14:41:48 2019 +0800

	    fsstress: add EXCHANGE renameat2 support

This is causing xfstest generic/579 to fail due to fsck.f2fs reporting errors.
I'm not sure what the problem is, but it still happens even with all the
fs-verity stuff in the test commented out, so that the test just runs fsstress.

generic/579 23s ... 	[10:02:25]
[    7.745370] run fstests generic/579 at 2019-11-04 10:02:25
_check_generic_filesystem: filesystem on /dev/vdc is inconsistent
(see /results/f2fs/results-default/generic/579.full for details)
 [10:02:47]
Ran: generic/579
Failures: generic/579
Failed 1 of 1 tests
Xunit report: /results/f2fs/results-default/result.xml

Here's the contents of 579.full:

_check_generic_filesystem: filesystem on /dev/vdc is inconsistent
*** fsck.f2fs output ***
[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x24] for '..', parent parent ino is [0xd10]

The root cause is that we forgot to update directory's i_pino during
cross_rename, fix it.

Fixes: 32f9bc25cbda0 ("f2fs: support ->rename2()")
Signed-off-by: Chao Yu <yuchao0@huawei.com>
Tested-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/namei.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index b80e7db3b55b5..b13383948fca3 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -862,7 +862,8 @@ static int f2fs_rename(struct inode *old_dir, struct dentry *old_dentry,
 	if (!old_dir_entry || whiteout)
 		file_lost_pino(old_inode);
 	else
-		F2FS_I(old_inode)->i_pino = new_dir->i_ino;
+		/* adjust dir's i_pino to pass fsck check */
+		f2fs_i_pino_write(old_inode, new_dir->i_ino);
 	up_write(&F2FS_I(old_inode)->i_sem);
 
 	old_inode->i_ctime = current_time(old_inode);
@@ -1027,7 +1028,11 @@ static int f2fs_cross_rename(struct inode *old_dir, struct dentry *old_dentry,
 	f2fs_set_link(old_dir, old_entry, old_page, new_inode);
 
 	down_write(&F2FS_I(old_inode)->i_sem);
-	file_lost_pino(old_inode);
+	if (!old_dir_entry)
+		file_lost_pino(old_inode);
+	else
+		/* adjust dir's i_pino to pass fsck check */
+		f2fs_i_pino_write(old_inode, new_dir->i_ino);
 	up_write(&F2FS_I(old_inode)->i_sem);
 
 	old_dir->i_ctime = current_time(old_dir);
@@ -1042,7 +1047,11 @@ static int f2fs_cross_rename(struct inode *old_dir, struct dentry *old_dentry,
 	f2fs_set_link(new_dir, new_entry, new_page, old_inode);
 
 	down_write(&F2FS_I(new_inode)->i_sem);
-	file_lost_pino(new_inode);
+	if (!new_dir_entry)
+		file_lost_pino(new_inode);
+	else
+		/* adjust dir's i_pino to pass fsck check */
+		f2fs_i_pino_write(new_inode, old_dir->i_ino);
 	up_write(&F2FS_I(new_inode)->i_sem);
 
 	new_dir->i_ctime = current_time(new_dir);
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
