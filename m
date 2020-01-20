Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C6014340A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Jan 2020 23:34:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1itfcy-0001aQ-I9; Mon, 20 Jan 2020 22:34:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1itfcx-0001aA-9S
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jan 2020 22:34:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wgB++3ieq6AdT0o05Cl2/MRhzkH2oGAI+GMlWpJM9bU=; b=cNvbCAG9i2txhcEeTXkgFH16k0
 IGrTnxnbK93lU8HRlkMg2HjhcIIR5Igin5cTFeIefjfG22/aykq2I/6QefCRRBmgDgGBvk+plBKw5
 E5vQ92Y9hsmpyEbmhECBAcgdF91HjiUfl5R5VtJhd7wUkgPA6FD7C8dMRBNQl8dvpUns=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wgB++3ieq6AdT0o05Cl2/MRhzkH2oGAI+GMlWpJM9bU=; b=SKEFnOHtQZ5yRvOLyXhTtWghHG
 6usrw4J3L3itd2QimgWHe3TQc01tkTQ6/lHmsxMHmNbiLw6A61ImrblNLUnb9EycmKmmuq2qgQYHc
 jBtrthALAYP8h4ilLKh1u52XKvcSdubTYkutYPetYZlwaFxha60y7FfgZiyx4PgoJ8KE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1itfcw-00Brhg-4K
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jan 2020 22:34:35 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EE59C24654;
 Mon, 20 Jan 2020 22:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579559659;
 bh=a6AglMzuzSADbIykjFsh6WiXfUA9a8BSXSse5YpowJc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CxGsA6XSOH79/Ez1YYKFPwXEuecFLee2D4d34j5HPAbu0KJ494XC9qdVSW62bCxh/
 gg3un57dpwbCJT0BoaNxddQ6mXy41R5m3H+nmpvn5XDzbEb64fyS8RSpBsVTkZZBTi
 etgWdPATptkXqIamnw2Ms4bOtO2E8kcWZ4mwWCDc=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon, 20 Jan 2020 14:32:00 -0800
Message-Id: <20200120223201.241390-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200120223201.241390-1-ebiggers@kernel.org>
References: <20200120223201.241390-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
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
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1itfcw-00Brhg-4K
Subject: [f2fs-dev] [PATCH v5 5/6] ubifs: allow both hash and disk name to
 be provided in no-key names
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
Cc: Daniel Rosenberg <drosen@google.com>,
 Gabriel Krisman Bertazi <krisman@collabora.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

In order to support a new dirhash method that is a secret-keyed hash
over the plaintext filenames (which will be used by encrypted+casefolded
directories on ext4 and f2fs), fscrypt will be switching to a new no-key
name format that always encodes the dirhash in the name.

UBIFS isn't happy with this because it has assertions that verify that
either the hash or the disk name is provided, not both.

Change it to use the disk name if one is provided, even if a hash is
available too; else use the hash.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ubifs/dir.c     | 4 +---
 fs/ubifs/journal.c | 4 ++--
 fs/ubifs/key.h     | 1 -
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 5f937226976a6..ef85ec167a843 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -225,9 +225,7 @@ static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
 		goto done;
 	}
 
-	if (nm.hash) {
-		ubifs_assert(c, fname_len(&nm) == 0);
-		ubifs_assert(c, fname_name(&nm) == NULL);
+	if (fname_name(&nm) == NULL) {
 		if (nm.hash & ~UBIFS_S_KEY_HASH_MASK)
 			goto done; /* ENOENT */
 		dent_key_init_hash(c, &key, dir->i_ino, nm.hash);
diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index a38e18d3ef1d7..3bf8b1fda9d74 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -588,7 +588,7 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
 
 	if (!xent) {
 		dent->ch.node_type = UBIFS_DENT_NODE;
-		if (nm->hash)
+		if (fname_name(nm) == NULL)
 			dent_key_init_hash(c, &dent_key, dir->i_ino, nm->hash);
 		else
 			dent_key_init(c, &dent_key, dir->i_ino, nm);
@@ -646,7 +646,7 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
 	ubifs_add_auth_dirt(c, lnum);
 
 	if (deletion) {
-		if (nm->hash)
+		if (fname_name(nm) == NULL)
 			err = ubifs_tnc_remove_dh(c, &dent_key, nm->minor_hash);
 		else
 			err = ubifs_tnc_remove_nm(c, &dent_key, nm);
diff --git a/fs/ubifs/key.h b/fs/ubifs/key.h
index afa704ff5ca08..8142d9d6fe5da 100644
--- a/fs/ubifs/key.h
+++ b/fs/ubifs/key.h
@@ -150,7 +150,6 @@ static inline void dent_key_init(const struct ubifs_info *c,
 	uint32_t hash = c->key_hash(fname_name(nm), fname_len(nm));
 
 	ubifs_assert(c, !(hash & ~UBIFS_S_KEY_HASH_MASK));
-	ubifs_assert(c, !nm->hash && !nm->minor_hash);
 	key->u32[0] = inum;
 	key->u32[1] = hash | (UBIFS_DENT_KEY << UBIFS_S_KEY_HASH_BITS);
 }
-- 
2.25.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
