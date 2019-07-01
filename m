Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C25DF5C454
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Jul 2019 22:27:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hi2tE-000413-Qu; Mon, 01 Jul 2019 20:27:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hi2tB-00040c-Iw
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jul 2019 20:27:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4UyunLJH8W03sO9mLqXejosf+oxVWrjHBsH8h7Yf1Os=; b=TJ3BtsyJSEQpnsuJSOXdhqlgy8
 a0tgI8lRJ7/BcQVkyFgSx75X5sBIgZ5FoRVp+mIhjFYwH53UIU0qpziixErDFQA6jZfxsjp98UIP1
 AOLhBiXvU53XdEE8PTimrg4Kpm6igc1SSJeJ8lHYD8WWajATEy19NvnefBUjpuigKFkU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4UyunLJH8W03sO9mLqXejosf+oxVWrjHBsH8h7Yf1Os=; b=mcHKQgpBogu2fLcr4BjeLwZpfr
 Qe+i7uzpGbmbZNvT4PbRTyPzIB1WtEmeaAJ4FzepS+LIp+VnND1Sv0CFMf8r1rb00Dq4db3uqkr2B
 n/veGx5ptYKV1ODG8fcncltewX9YpU2fWlJnWgLL7BgHzjJWHiGLJlIUDOH28c4M6JYA=;
Received: from [198.145.29.99] (helo=mail.kernel.org)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hi2tE-003mbI-2c
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jul 2019 20:27:05 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D6BD621841;
 Mon,  1 Jul 2019 20:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562012809;
 bh=fH1qBz8bc9aMV/qeircw6YrBU3Zw3ZRFu8JyT+UZkO4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JPUIMVpM68daxj+LoCTaRcevYYhGNPlgAi5g0Bq52xfRB2hM168VM074YtK0J50mJ
 k73xI0YrsY0ompp9Zk/pCtCeNflGCwtz0ye/4oqgPG0HKb/s6bhHyhutEfqCLFhRwj
 TkeivbS+6hH90iOoYJ/Tp7zrixjaRy6ujstcFHFg=
From: Eric Biggers <ebiggers@kernel.org>
To: "Darrick J . Wong" <darrick.wong@oracle.com>
Date: Mon,  1 Jul 2019 13:26:30 -0700
Message-Id: <20190701202630.43776-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190701202630.43776-1-ebiggers@kernel.org>
References: <20190701202630.43776-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hi2tE-003mbI-2c
Subject: [f2fs-dev] [PATCH 3/3] f2fs: remove redundant check from
 f2fs_setflags_common()
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
Cc: linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Now that f2fs_ioc_setflags() and f2fs_ioc_fssetxattr() call the VFS
helper functions which check for permission to change the immutable and
append-only flags, it's no longer needed to do this check in
f2fs_setflags_common() too.  So remove it.

This is based on a patch from Darrick Wong, but reworked to apply after
commit 360985573b55 ("f2fs: separate f2fs i_flags from fs_flags and ext4
i_flags").

Originally-from: Darrick J. Wong <darrick.wong@oracle.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/file.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ae1a54ecc9fccc..e8b81f6f5c2b15 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1648,19 +1648,12 @@ static int f2fs_file_flush(struct file *file, fl_owner_t id)
 static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
 {
 	struct f2fs_inode_info *fi = F2FS_I(inode);
-	u32 oldflags;
 
 	/* Is it quota file? Do not allow user to mess with it */
 	if (IS_NOQUOTA(inode))
 		return -EPERM;
 
-	oldflags = fi->i_flags;
-
-	if ((iflags ^ oldflags) & (F2FS_APPEND_FL | F2FS_IMMUTABLE_FL))
-		if (!capable(CAP_LINUX_IMMUTABLE))
-			return -EPERM;
-
-	fi->i_flags = iflags | (oldflags & ~mask);
+	fi->i_flags = iflags | (fi->i_flags & ~mask);
 
 	if (fi->i_flags & F2FS_PROJINHERIT_FL)
 		set_inode_flag(inode, FI_PROJ_INHERIT);
-- 
2.22.0.410.gd8fdbe21b5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
