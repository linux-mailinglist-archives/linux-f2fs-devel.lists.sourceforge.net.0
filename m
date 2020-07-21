Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9F8228C63
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Jul 2020 01:01:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jy1Fz-000812-OM; Tue, 21 Jul 2020 23:01:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jy1Fy-00080n-7u
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Jul 2020 23:01:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cxDQg0pMr/08iU4NNOIKZivVlxP0bxRfryGaM4bWkto=; b=i1F91Xd8npw5qQCbO0ABciDv3B
 A0O1IdBY6nFO4LtbSXKYWfZb0Yk9nOdQusUSra2m5R9Ce0IJdT77v7uJvjAX1X/5mLX/wfQb0V/jP
 8PsHWlrIpg//HQOyEf6NpWP1t70nrvABqXQn+/VmPK22DDnzMS1UtVuU0EzBi6FffT0Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cxDQg0pMr/08iU4NNOIKZivVlxP0bxRfryGaM4bWkto=; b=VisvIKPx7NogjuApabH7CAJ4WC
 rZXB3RE6taxHPWmA77Fa1witOOqBuOJed6iNELrS93f/9a0Bc/V9p1M6qwZPmQfTSTdlQgjAtnTAp
 AF6rWrml8xwI3BnMVHhf9NiKWoC2ng6m3wffladPtIehVbEt4X8fn9y1p3s/tGHbrHGE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jy1Fx-003mXX-4J
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Jul 2020 23:01:06 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9616A207BB;
 Tue, 21 Jul 2020 23:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595372459;
 bh=HkY2xoW+5h/KPN4NirPSCI6mZ1dMQTytJsLYKF1i9Kk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k3Gk9VGnsqGB5y+WMg5lND+8JiNxzRrc4VjLmUb1EIy9UlP7HqQV7CTx+ehe/RuD1
 XuaTIIvbwwLc5tFsjkcZoEyxBDu3L+o2yMrmwuMjDcbypkZuUM4Or6eNsG2RGZ5mhI
 VdEvSYtK16hT7PpUn/1yWdPuPeao//sgvXC/ASxo=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Tue, 21 Jul 2020 15:59:18 -0700
Message-Id: <20200721225920.114347-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200721225920.114347-1-ebiggers@kernel.org>
References: <20200721225920.114347-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jy1Fx-003mXX-4J
Subject: [f2fs-dev] [PATCH 3/5] fscrypt: use smp_load_acquire() for
 ->s_master_keys
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
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Normally smp_store_release() or cmpxchg_release() is paired with
smp_load_acquire().  Sometimes smp_load_acquire() can be replaced with
the more lightweight READ_ONCE().  However, for this to be safe, all the
published memory must only be accessed in a way that involves the
pointer itself.  This may not be the case if allocating the object also
involves initializing a static or global variable, for example.

super_block::s_master_keys is a keyring, which is internal to and is
allocated by the keyrings subsystem.  By using READ_ONCE() for it, we're
relying on internal implementation details of the keyrings subsystem.

Remove this fragile assumption by using smp_load_acquire() instead.

(Note: I haven't seen any real-world problems here.  This change is just
fixing the code to be guaranteed correct and less fragile.)

Fixes: 22d94f493bfb ("fscrypt: add FS_IOC_ADD_ENCRYPTION_KEY ioctl")
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/keyring.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/fs/crypto/keyring.c b/fs/crypto/keyring.c
index 7f8ac61a20d6..71d56f8e2870 100644
--- a/fs/crypto/keyring.c
+++ b/fs/crypto/keyring.c
@@ -213,7 +213,11 @@ static int allocate_filesystem_keyring(struct super_block *sb)
 	if (IS_ERR(keyring))
 		return PTR_ERR(keyring);
 
-	/* Pairs with READ_ONCE() in fscrypt_find_master_key() */
+	/*
+	 * Pairs with the smp_load_acquire() in fscrypt_find_master_key().
+	 * I.e., here we publish ->s_master_keys with a RELEASE barrier so that
+	 * concurrent tasks can ACQUIRE it.
+	 */
 	smp_store_release(&sb->s_master_keys, keyring);
 	return 0;
 }
@@ -234,8 +238,13 @@ struct key *fscrypt_find_master_key(struct super_block *sb,
 	struct key *keyring;
 	char description[FSCRYPT_MK_DESCRIPTION_SIZE];
 
-	/* pairs with smp_store_release() in allocate_filesystem_keyring() */
-	keyring = READ_ONCE(sb->s_master_keys);
+	/*
+	 * Pairs with the smp_store_release() in allocate_filesystem_keyring().
+	 * I.e., another task can publish ->s_master_keys concurrently,
+	 * executing a RELEASE barrier.  We need to use smp_load_acquire() here
+	 * to safely ACQUIRE the memory the other task published.
+	 */
+	keyring = smp_load_acquire(&sb->s_master_keys);
 	if (keyring == NULL)
 		return ERR_PTR(-ENOKEY); /* No keyring yet, so no keys yet. */
 
-- 
2.27.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
