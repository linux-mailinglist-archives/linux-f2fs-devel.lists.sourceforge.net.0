Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6867A17A18F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Mar 2020 09:42:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j9m5V-0002os-I6; Thu, 05 Mar 2020 08:42:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1j9m5T-0002ok-VN
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 Mar 2020 08:42:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KC7WweZ5cQHqnSQ0xFLsX89kvU103UFjClvCqNeo0yE=; b=m7xQqERrY28cMa7Xym552uS2FR
 YER1y1A8CxQ97bPOSpj9Erj6bDGnOCFlklozZXkwvy0lf5itMfsIoFvNms7XMywc95FuKoRdhC0H0
 mSB6CynBrCyMGrbOUa24vry1ST+EbKeNIm2eVwwAb7HDiGGKuaLq900irTPIcagPDap0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=KC7WweZ5cQHqnSQ0xFLsX89kvU103UFjClvCqNeo0yE=; b=C
 mHWBYvzf7c+DftNIIg1ZpqaFgC5/Ilk7XwHHKtGFXk8ASOhO/cgviI50Ssl0OXiOIFsOdF2SQ2gVT
 76aeTpmnjPhmZoIVsNzTdGj5l2dl0wPvUscfcEiKsXekVppwJPc3VFeWHZzWRqvihlPUBdz2sULBT
 k/O8yTcI9EF0QFrg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j9m5S-00DmG0-St
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 Mar 2020 08:42:35 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1BF482146E;
 Thu,  5 Mar 2020 08:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583397749;
 bh=K/56YT+etKnoKYjtDmkQrf9U3Pw0mVZKDfdV/kmF4ks=;
 h=From:To:Cc:Subject:Date:From;
 b=R37w+oJeIdHqMiqGjA3IcdEQaYStFgKRJ90nIWmmQIJ+tqio/I6Sjxb5GOyK6x59/
 bZgSoVH/ljq8omzN71BE5Q/8QiGQwxl2qkU0Tx6SPVUHGClNHtsepqWO9Q5SHBFqwQ
 JlrZ/avFlhIJeUfAFnny/KFFFrNFQf04GaSRuMFY=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Thu,  5 Mar 2020 00:41:38 -0800
Message-Id: <20200305084138.653498-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: 0.7 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -1.7 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j9m5S-00DmG0-St
Subject: [f2fs-dev] [PATCH] fscrypt: don't evict dirty inodes after removing
 key
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

After FS_IOC_REMOVE_ENCRYPTION_KEY removes a key, it syncs the
filesystem and tries to get and put all inodes that were unlocked by the
key so that unused inodes get evicted via fscrypt_drop_inode().
Normally, the inodes are all clean due to the sync.

However, after the filesystem is sync'ed, userspace can modify and close
one of the files.  (Userspace is *supposed* to close the files before
removing the key.  But it doesn't always happen, and the kernel can't
assume it.)  This causes the inode to be dirtied and have i_count == 0.
Then, fscrypt_drop_inode() failed to consider this case and indicated
that the inode can be dropped, causing the write to be lost.

On f2fs, other problems such as a filesystem freeze could occur due to
the inode being freed while still on f2fs's dirty inode list.

Fix this bug by making fscrypt_drop_inode() only drop clean inodes.

I've written an xfstest which detects this bug on ext4, f2fs, and ubifs.

Fixes: b1c0ec3599f4 ("fscrypt: add FS_IOC_REMOVE_ENCRYPTION_KEY ioctl")
Cc: <stable@vger.kernel.org> # v5.4+
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/keysetup.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
index 65cb09fa6ead..08c9f216a54d 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -538,6 +538,15 @@ int fscrypt_drop_inode(struct inode *inode)
 		return 0;
 	mk = ci->ci_master_key->payload.data[0];
 
+	/*
+	 * With proper, non-racy use of FS_IOC_REMOVE_ENCRYPTION_KEY, all inodes
+	 * protected by the key were cleaned by sync_filesystem().  But if
+	 * userspace is still using the files, inodes can be dirtied between
+	 * then and now.  We mustn't lose any writes, so skip dirty inodes here.
+	 */
+	if (inode->i_state & I_DIRTY_ALL)
+		return 0;
+
 	/*
 	 * Note: since we aren't holding ->mk_secret_sem, the result here can
 	 * immediately become outdated.  But there's no correctness problem with
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
