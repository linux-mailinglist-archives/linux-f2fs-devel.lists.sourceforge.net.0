Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE1A250A28
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Aug 2020 22:40:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kAJGF-0007Ka-Bw; Mon, 24 Aug 2020 20:40:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kAJGE-0007KT-RE
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Aug 2020 20:40:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TMey2BaqufQNu77Nui9BTxAw3aejwxrjr/yC3pKsgq4=; b=gXLS8Hnhq76PgXZuQfV9D52nxl
 66ssia882sCbyYB1Tqxs5S/Lkb3pQgHVN4bYMayd22Ap96Dyq/ZF61rvUVo2MFzC7/YngkzCpuKEc
 VTHi7PBoYuaftlRGQh7CzV/e4zbq8a5faiqnWYeqoHiwOfjFDj8ogRij6VNYk4awi9lc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=TMey2BaqufQNu77Nui9BTxAw3aejwxrjr/yC3pKsgq4=; b=F
 FK9lo8UdGZZp3NLuCTy5TuYPjNkVVrc59dIgnkxDpUuWOD1dSFC7UMiDvYckBlAzzAAEu3kcMGWL/
 /NYjyhdeUiUWjs+bu2JmWmgNgS12/JUJEekWGap6FOMLYYpS6tE3UOOzY8bINUo2duHcDhCdBhhcE
 BMAt6bby+HfOQtSM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kAJG9-00HNL1-R7
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Aug 2020 20:40:10 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 78602204EA;
 Mon, 24 Aug 2020 20:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598301595;
 bh=zHQu1QiHr7iVn0rq76g38CunRcQjlkL2Kf014Bwuc7s=;
 h=From:To:Cc:Subject:Date:From;
 b=cPQ7lTxBHONc8YbjaD0+ygL3GyeWYgL4xN3Pp5d46W7ddtHaJwQBbxIxXNMlq18wo
 7Y5dr0f+5vc/rf/nITn+ry5bzZdlzZfxYI7H/QTZBT99XOu7vC8nGOZ3GNi70aE98k
 YkExiMvQUVnEAkYTJd96mcugbme25lKWhnsOkxCM=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon, 24 Aug 2020 13:38:41 -0700
Message-Id: <20200824203841.1707847-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
MIME-Version: 1.0
X-Spam-Score: -1.1 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1kAJG9-00HNL1-R7
Subject: [f2fs-dev] [PATCH] fscrypt: restrict IV_INO_LBLK_32 to ino_bits <=
 32
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
Cc: Paul Crowley <paulcrowley@google.com>, linux-ext4@vger.kernel.org,
 Jeff Layton <jlayton@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

When an encryption policy has the IV_INO_LBLK_32 flag set, the IV
generation method involves hashing the inode number.  This is different
from fscrypt's other IV generation methods, where the inode number is
either not used at all or is included directly in the IVs.

Therefore, in principle IV_INO_LBLK_32 can work with any length inode
number.  However, currently fscrypt gets the inode number from
inode::i_ino, which is 'unsigned long'.  So currently the implementation
limit is actually 32 bits (like IV_INO_LBLK_64), since longer inode
numbers will have been truncated by the VFS on 32-bit platforms.

Fix fscrypt_supported_v2_policy() to enforce the correct limit.

This doesn't actually matter currently, since only ext4 and f2fs support
IV_INO_LBLK_32, and they both only support 32-bit inode numbers.  But we
might as well fix it in case it matters in the future.

Ideally inode::i_ino would instead be made 64-bit, but for now it's not
needed.  (Note, this limit does *not* prevent filesystems with 64-bit
inode numbers from adding fscrypt support, since IV_INO_LBLK_* support
is optional and is useful only on certain hardware.)

Fixes: e3b1078bedd3 ("fscrypt: add support for IV_INO_LBLK_32 policies")
Reported-by: Jeff Layton <jlayton@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/policy.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/crypto/policy.c b/fs/crypto/policy.c
index 2d73fd39ad96..b92f34523178 100644
--- a/fs/crypto/policy.c
+++ b/fs/crypto/policy.c
@@ -192,10 +192,15 @@ static bool fscrypt_supported_v2_policy(const struct fscrypt_policy_v2 *policy,
 					  32, 32))
 		return false;
 
+	/*
+	 * IV_INO_LBLK_32 hashes the inode number, so in principle it can
+	 * support any ino_bits.  However, currently the inode number is gotten
+	 * from inode::i_ino which is 'unsigned long'.  So for now the
+	 * implementation limit is 32 bits.
+	 */
 	if ((policy->flags & FSCRYPT_POLICY_FLAG_IV_INO_LBLK_32) &&
-	    /* This uses hashed inode numbers, so ino_bits doesn't matter. */
 	    !supported_iv_ino_lblk_policy(policy, inode, "IV_INO_LBLK_32",
-					  INT_MAX, 32))
+					  32, 32))
 		return false;
 
 	if (memchr_inv(policy->__reserved, 0, sizeof(policy->__reserved))) {
-- 
2.28.0.297.g1956fa8f8d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
