Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E2ABC4040C0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Sep 2021 23:51:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mO5U2-0003LJ-D0; Wed, 08 Sep 2021 21:51:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ebiggers@kernel.org>) id 1mO5Tt-0003Jy-O7
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Sep 2021 21:51:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fnzI7cFr93knVVqz79APEP5vxEIczO/Hjj+fDnQptVE=; b=Nuaah6udxo8eTTPj9XPC5bDVfh
 j1GyWge3nFCyP4dn6elwcUPZQf92HnCysduj4pAZDEzbY0iao+VxFiACc+DqM4RSS+edIbbkS2lsN
 xp/X0KJDrjRS5dRXAR5q9f/AFN3OcrumTpmzvxL/Bgh6h7C0XcqzFeJfBOy8yU1a1QoM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fnzI7cFr93knVVqz79APEP5vxEIczO/Hjj+fDnQptVE=; b=eWU6kJKkDxHzjVV5WD0T3MxI+s
 ZybSnDEnTw9QEzrKNLXphA9HwvUR2dM8qj5pYzua2gU/fqtxk16ce3HTh2RSK4fj25Kr5zKA6BpQ2
 O+v0fP1T2+1AHiP2rW5a/ZSDqSmGprov5WW6IdxbhPIJ65fCJfUc4EbxHFQ8FIJkwdkw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mO5Tp-0003YT-JZ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Sep 2021 21:51:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0B7E8610F8;
 Wed,  8 Sep 2021 21:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631137889;
 bh=KoVck986relZorHv7Og0MrrnvSEGPQxM/Ce82S4543I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=djxv3m0xGbBVx+UNIvmpHx8cZckH7eE8lOVxji2c4kw6syS4aTOebWeaYfIU2OlZn
 5mkJiQwQN8zUcAHRbz+vHGtcRPj+b80614KfoJND4jKGVBCU4d3AvgDQegdEbV9AGf
 Yvuo/EFdvS1er0WGlHd2sc/7RtLAGNA/ZsivoIl62PXpNoTwuY9zCYS7JiHE2QroN9
 RFIgFr7Er89OvNZwiPXjvCToXflBgNUIHgw6RTrPAqHPNweItKIee4IZEIGZc9zhBD
 g7OLKhrryDH847WLVqTS74OFy4hD0wca7jtZUQ+dRUeTmy+aM3SwpvvAYPdXuj4Fyi
 CHYRZsoHOcKAg==
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Date: Wed,  8 Sep 2021 14:50:31 -0700
Message-Id: <20210908215033.1122580-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
In-Reply-To: <20210908215033.1122580-1-ebiggers@kernel.org>
References: <20210908215033.1122580-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 2.0 (++)
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
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mO5Tp-0003YT-JZ
Subject: [f2fs-dev] [PATCH 2/4] ext4: report correct st_size for encrypted
 symlinks
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
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

commit 8c4bca10ceafc43b1ca0a9fab5fa27e13cbce99e upstream.

The stat() family of syscalls report the wrong size for encrypted
symlinks, which has caused breakage in several userspace programs.

Fix this by calling fscrypt_symlink_getattr() after ext4_getattr() for
encrypted symlinks.  This function computes the correct size by reading
and decrypting the symlink target (if it's not already cached).

For more details, see the commit which added fscrypt_symlink_getattr().

Fixes: f348c252320b ("ext4 crypto: add symlink encryption")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20210702065350.209646-3-ebiggers@kernel.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/symlink.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/fs/ext4/symlink.c b/fs/ext4/symlink.c
index dd05af983092..a9457fed351e 100644
--- a/fs/ext4/symlink.c
+++ b/fs/ext4/symlink.c
@@ -52,10 +52,19 @@ static const char *ext4_encrypted_get_link(struct dentry *dentry,
 	return paddr;
 }
 
+static int ext4_encrypted_symlink_getattr(const struct path *path,
+					  struct kstat *stat, u32 request_mask,
+					  unsigned int query_flags)
+{
+	ext4_getattr(path, stat, request_mask, query_flags);
+
+	return fscrypt_symlink_getattr(path, stat);
+}
+
 const struct inode_operations ext4_encrypted_symlink_inode_operations = {
 	.get_link	= ext4_encrypted_get_link,
 	.setattr	= ext4_setattr,
-	.getattr	= ext4_getattr,
+	.getattr	= ext4_encrypted_symlink_getattr,
 	.listxattr	= ext4_listxattr,
 };
 
-- 
2.33.0.153.gba50c8fa24-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
