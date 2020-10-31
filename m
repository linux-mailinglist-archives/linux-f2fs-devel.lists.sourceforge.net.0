Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA4E2A1AFD
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 31 Oct 2020 23:10:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kYz4g-0002Md-16; Sat, 31 Oct 2020 22:10:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kYz4c-0002MP-Ea
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 31 Oct 2020 22:10:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KHu+89nJVo7VN60Q9PDuGueGOdH28hOy1LMlGE2QRnM=; b=KUHLxUZXBIq6Ie+JvWsDhQdMtz
 G1itYKCz1dcTdVsXQDP5dGaSh1HvkPEa6y+gp3trLuG5saw9OAK+MrMcLhnuxEK3xMpplTyBDhmXi
 UFGoQt14h6FEiO4YlZ5sRRd3j6Kts402AZAyRmiVBhVcSeYKx4z+WYsuzZeHsZfaMKdY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KHu+89nJVo7VN60Q9PDuGueGOdH28hOy1LMlGE2QRnM=; b=NJjOVvDeQMiIRA9eqHnKJ6NiX5
 jPwwzmgh5Nv+g+7P8IdBDx7dLLx71fFKX4DlcyQccRScBv2qQ9nwyZBLJ4p5JdPIDuOHDfTJiI9R0
 L9DD/yIza6M5nws6rHjZ7KMalpXNtYdTHl5wHHGqx0vK+5I4uAh3N5KytTYebphEOn8g=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kYz4X-00Ece2-SS
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 31 Oct 2020 22:10:10 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7479D2076D;
 Sat, 31 Oct 2020 22:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604182193;
 bh=mU4u4OeBiyB0ajGFtgXeUtVhy39lvr5DXQg14RZoQVM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tHNjyLqYTwSXhVsJ1eW6WsK8fMTy/PMcW0EWoU2wlHm20ApQrIeE84yGxvMeExIb+
 FADZJdS5CtvF9EgYkt00zoFxOTLxR3ArG0krL6ujh73zsq+v3Xtt3tyiR95YD21kib
 WMQIkNpEBHW8ustesBzYUh5Q0PIpHx9WW669HT/0=
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Date: Sat, 31 Oct 2020 15:05:51 -0700
Message-Id: <20201031220553.1085782-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201031220553.1085782-1-ebiggers@kernel.org>
References: <20201031220553.1085782-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kYz4X-00Ece2-SS
Subject: [f2fs-dev] [PATCH 4.19 3/5] fs,
 fscrypt: clear DCACHE_ENCRYPTED_NAME when unaliasing directory
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 Sarthak Kukreti <sarthakkukreti@chromium.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

commit 0bf3d5c1604ecbbd4e49e9f5b3c79152b87adb0d upstream.

Make __d_move() clear DCACHE_ENCRYPTED_NAME on the source dentry.  This
is needed for when d_splice_alias() moves a directory's encrypted alias
to its decrypted alias as a result of the encryption key being added.

Otherwise, the decrypted alias will incorrectly be invalidated on the
next lookup, causing problems such as unmounting a mount the user just
mount()ed there.

Note that we don't have to support arbitrary moves of this flag because
fscrypt doesn't allow dentries with DCACHE_ENCRYPTED_NAME to be the
source or target of a rename().

Fixes: 28b4c263961c ("ext4 crypto: revalidate dentry after adding or removing the key")
Reported-by: Sarthak Kukreti <sarthakkukreti@chromium.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Theodore Ts'o <tytso@mit.edu>
---
 fs/dcache.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/fs/dcache.c b/fs/dcache.c
index 20370a0997bf9..1897833a46685 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -2712,6 +2712,20 @@ static void copy_name(struct dentry *dentry, struct dentry *target)
 		call_rcu(&old_name->u.head, __d_free_external_name);
 }
 
+/*
+ * When d_splice_alias() moves a directory's encrypted alias to its decrypted
+ * alias as a result of the encryption key being added, DCACHE_ENCRYPTED_NAME
+ * must be cleared.  Note that we don't have to support arbitrary moves of this
+ * flag because fscrypt doesn't allow encrypted aliases to be the source or
+ * target of a rename().
+ */
+static inline void fscrypt_handle_d_move(struct dentry *dentry)
+{
+#if IS_ENABLED(CONFIG_FS_ENCRYPTION)
+	dentry->d_flags &= ~DCACHE_ENCRYPTED_NAME;
+#endif
+}
+
 /*
  * __d_move - move a dentry
  * @dentry: entry to move
@@ -2787,6 +2801,7 @@ static void __d_move(struct dentry *dentry, struct dentry *target,
 	list_move(&dentry->d_child, &dentry->d_parent->d_subdirs);
 	__d_rehash(dentry);
 	fsnotify_update_flags(dentry);
+	fscrypt_handle_d_move(dentry);
 
 	write_seqcount_end(&target->d_seq);
 	write_seqcount_end(&dentry->d_seq);
-- 
2.29.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
