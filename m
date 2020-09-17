Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3A526D21B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Sep 2020 06:13:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kIlIT-0002u0-TY; Thu, 17 Sep 2020 04:13:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kIlIT-0002tr-2P
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Sep 2020 04:13:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nct/UYfmbFRrdijtx6r1D0d1EQjJ0aQJ9pfY5fJ3TZc=; b=Cgw0D1dlNS9DMgarmoUSebjj9O
 zi+YyzqdyjFZmxthIsjPzlrwGo3fD5InXqbKkmIb7L3AIdaeGh3TkmDxmY9W4GrP5/ypygR7Qb1YB
 FJlrzvXSFCjUfLX89ed0ruLUdexQ6PsB1YWPhzXdhvzo+q4yfoF2XWMIrooTD6Gr1GRM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nct/UYfmbFRrdijtx6r1D0d1EQjJ0aQJ9pfY5fJ3TZc=; b=a7QU2TTOrNlKNifyTavQ4qVRY7
 RhozVkeSzvvxZ1QMmRsTAmk/RX+CbiWPxpC+KoKVty1wuoHT8ITNp77lnky1yt0SBFDKuj8bq4kLu
 vP4VWfm/XeImNQOs7wnC8N2vxbU5v/8FwQt2vifWX8ht5pfwghB096fwwkmSc837lrhM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kIlIN-00DZbu-4K
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Sep 2020 04:13:25 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB72121973;
 Thu, 17 Sep 2020 04:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600315988;
 bh=b+br3C3cbfnBLBIC6l48f9MznNCXZDVFxP9oBuV6fkI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZU8LAn6Ou/W4N6ND26oun8qG5aZepZ6dTFMZDxiaRflydZRTsHZ35RWxtI5H1+IQl
 jmabDjvBJmMyQLQLBdXsgOZF4nY7Q7UNVBsq4RqsPzZiP4praeOA9Jzs90s2IcJ8eS
 +dfaFJXD+as/p7uWPMk6QpIGUokQ9QuvJWYc1YoM=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Wed, 16 Sep 2020 21:11:26 -0700
Message-Id: <20200917041136.178600-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917041136.178600-1-ebiggers@kernel.org>
References: <20200917041136.178600-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -3.1 (---)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1kIlIN-00DZbu-4K
Subject: [f2fs-dev] [PATCH v3 03/13] ext4: use fscrypt_prepare_new_inode()
 and fscrypt_set_context()
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
Cc: Daniel Rosenberg <drosen@google.com>, Jeff Layton <jlayton@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Convert ext4 to use the new functions fscrypt_prepare_new_inode() and
fscrypt_set_context().  This avoids calling
fscrypt_get_encryption_info() from within a transaction, which can
deadlock because fscrypt_get_encryption_info() isn't GFP_NOFS-safe.

For more details about this problem, see the earlier patch
"fscrypt: add fscrypt_prepare_new_inode() and fscrypt_set_context()".

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/ialloc.c | 37 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/fs/ext4/ialloc.c b/fs/ext4/ialloc.c
index 0cc576005a923..698ca4a4db5f7 100644
--- a/fs/ext4/ialloc.c
+++ b/fs/ext4/ialloc.c
@@ -819,7 +819,7 @@ struct inode *__ext4_new_inode(handle_t *handle, struct inode *dir,
 	ext4_group_t i;
 	ext4_group_t flex_group;
 	struct ext4_group_info *grp;
-	int encrypt = 0;
+	bool encrypt = false;
 
 	/* Cannot create files in a deleted directory */
 	if (!dir || !dir->i_nlink)
@@ -831,24 +831,6 @@ struct inode *__ext4_new_inode(handle_t *handle, struct inode *dir,
 	if (unlikely(ext4_forced_shutdown(sbi)))
 		return ERR_PTR(-EIO);
 
-	if ((IS_ENCRYPTED(dir) || DUMMY_ENCRYPTION_ENABLED(sbi)) &&
-	    (S_ISREG(mode) || S_ISDIR(mode) || S_ISLNK(mode)) &&
-	    !(i_flags & EXT4_EA_INODE_FL)) {
-		err = fscrypt_get_encryption_info(dir);
-		if (err)
-			return ERR_PTR(err);
-		if (!fscrypt_has_encryption_key(dir))
-			return ERR_PTR(-ENOKEY);
-		encrypt = 1;
-	}
-
-	if (!handle && sbi->s_journal && !(i_flags & EXT4_EA_INODE_FL)) {
-		ret2 = ext4_xattr_credits_for_new_inode(dir, mode, encrypt);
-		if (ret2 < 0)
-			return ERR_PTR(ret2);
-		nblocks += ret2;
-	}
-
 	ngroups = ext4_get_groups_count(sb);
 	trace_ext4_request_inode(dir, mode);
 	inode = new_inode(sb);
@@ -878,10 +860,25 @@ struct inode *__ext4_new_inode(handle_t *handle, struct inode *dir,
 	else
 		ei->i_projid = make_kprojid(&init_user_ns, EXT4_DEF_PROJID);
 
+	if (!(i_flags & EXT4_EA_INODE_FL)) {
+		err = fscrypt_prepare_new_inode(dir, inode, &encrypt);
+		if (err)
+			goto out;
+	}
+
 	err = dquot_initialize(inode);
 	if (err)
 		goto out;
 
+	if (!handle && sbi->s_journal && !(i_flags & EXT4_EA_INODE_FL)) {
+		ret2 = ext4_xattr_credits_for_new_inode(dir, mode, encrypt);
+		if (ret2 < 0) {
+			err = ret2;
+			goto out;
+		}
+		nblocks += ret2;
+	}
+
 	if (!goal)
 		goal = sbi->s_inode_goal;
 
@@ -1174,7 +1171,7 @@ struct inode *__ext4_new_inode(handle_t *handle, struct inode *dir,
 	 * prevent its deduplication.
 	 */
 	if (encrypt) {
-		err = fscrypt_inherit_context(dir, inode, handle, true);
+		err = fscrypt_set_context(inode, handle);
 		if (err)
 			goto fail_free_drop;
 	}
-- 
2.28.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
