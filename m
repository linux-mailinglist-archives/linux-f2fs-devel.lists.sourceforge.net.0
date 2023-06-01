Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5E0719A63
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Jun 2023 12:58:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4g15-00021S-0w;
	Thu, 01 Jun 2023 10:58:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1q4g12-00020w-3X
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 10:58:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MzXOzo95g617qUk7Z949h4EoD3WLK3t1qcqqyGoLxTU=; b=J1kKwzPhIqzr+g8XorrA/C7MVz
 4Oi5HF1Hiu0e6uwv9Sfbg0rVf40+UM7O4bkr777+D5sjsky5R2lfhABUMZnjhlG4BhFqJQ7YjqCPE
 mdDzcgCOrcuRXzgGZpglWYLIQtYTHBSHGvKghIfH8+o2CQL4eofRxNJ0JXJLfy5sKOXE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MzXOzo95g617qUk7Z949h4EoD3WLK3t1qcqqyGoLxTU=; b=Ya5CbbU2cY4k0F7N6jt1JAXpZN
 X5A2I0fH1eLDzoZY/JCf90nT6x8Ac7O+MKmq78iOGmH8NLeFWlou0nJeTGroOvAUgxy+muSCBwf04
 istgG4x9oQlUgVJq7PJHQ4KHvJYUEpEkNAIICjgnmXzFfryezXwKFeZMTwVMXzfkT8Us=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q4g0z-0005t3-9l for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 10:58:48 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1FFBE1FD99;
 Thu,  1 Jun 2023 10:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1685617111; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MzXOzo95g617qUk7Z949h4EoD3WLK3t1qcqqyGoLxTU=;
 b=JnxZsTeRlkpGAeNVzMjBvMt7Um93iLPpsI45FFwBn30paVGGbNnEWH9M38MdENSm/kGngr
 DioDvnCcG1CcHf7FQaY8W0HEFG7aKNjvivi3Ap/HmVOb0RlNIIEAtXneeUIB3XUbbBvMbk
 zXCS+ZxYtK5OM8dZmOv8TRYohjVDer8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1685617111;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MzXOzo95g617qUk7Z949h4EoD3WLK3t1qcqqyGoLxTU=;
 b=12MljAV3Jn4lWXoFOIkKiAO7uA5l6sXWVPVfp8DSkd5pTHVzE2MnGWF2CEZjuth948cp5s
 BtU9qfzM+5cVWrBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 122FA13A34;
 Thu,  1 Jun 2023 10:58:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mmNoBNd5eGSCWAAAMHmgww
 (envelope-from <jack@suse.cz>); Thu, 01 Jun 2023 10:58:31 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 2CDDBA0764; Thu,  1 Jun 2023 12:58:30 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: Al Viro <viro@ZenIV.linux.org.uk>
Date: Thu,  1 Jun 2023 12:58:26 +0200
Message-Id: <20230601105830.13168-6-jack@suse.cz>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230601104525.27897-1-jack@suse.cz>
References: <20230601104525.27897-1-jack@suse.cz>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2200; i=jack@suse.cz;
 h=from:subject; bh=yzjONH0NaYO0JExUsRNFVNqF61b/6Z8qTkqJfHdGKlg=;
 b=owEBbQGS/pANAwAIAZydqgc/ZEDZAcsmYgBkeHnRAOKwOpYmoYaDVDZoAJJC7iZvp0hWjbPFBMUr
 e9B2zauJATMEAAEIAB0WIQSrWdEr1p4yirVVKBycnaoHP2RA2QUCZHh50QAKCRCcnaoHP2RA2ZLRB/
 9A5mErZNr1GSw4bvqyRiHpBJmYLCWR4lihVK9MrTDZk08vVOCpc8BAsxg5oODQk0iMm3VyWYYLKWrR
 tZpGfLNVVN9J+mp08tZRHTqzVmO2Vg1q/2eiHEQkWYSPHnJHAmAPXsS2XuUUkxDmK5B+rPgf+hKsFQ
 5qg5tUZAuaUsZGy1zMAqXObFZSzjefBZrc251g++8ukB03T/LNLAVwtjvKgGmesBoq8BJdO93TYFlB
 INP8z2ollQ8Oqi7hSsJH2uhrQleqLb+y1+OfV/Ocf+LM4vBCuWoJGtGua+7Rg5bpG/kpJEXZmghiEY
 6HGqXDo1+FmRvBPkx7nJT/lFffiE8I
X-Developer-Key: i=jack@suse.cz; a=openpgp;
 fpr=93C6099A142276A28BBE35D815BC833443038D8C
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Currently lock_two_nondirectories() is skipping any passed
 directories. After vfs_rename() uses lock_two_inodes(), all the remaining
 four users of this function pass only regular files to it. So drop [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q4g0z-0005t3-9l
Subject: [f2fs-dev] [PATCH v2 6/6] fs: Restrict lock_two_nondirectories() to
 non-directory inodes
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
Cc: Christian Brauner <brauner@kernel.org>, Ted Tso <tytso@mit.edu>,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J. Wong" <djwong@kernel.org>,
 Jan Kara <jack@suse.cz>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Currently lock_two_nondirectories() is skipping any passed directories.
After vfs_rename() uses lock_two_inodes(), all the remaining four users
of this function pass only regular files to it. So drop the somewhat
unusual "skip directory" logic and instead warn if anybody passes
directory to it. This also allows us to use lock_two_inodes() in
lock_two_nondirectories() to concentrate the lock ordering logic in less
places.

Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/inode.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/fs/inode.c b/fs/inode.c
index 4000ab08bbc0..e8d10fd18378 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -1148,7 +1148,7 @@ void lock_two_inodes(struct inode *inode1, struct inode *inode2,
 /**
  * lock_two_nondirectories - take two i_mutexes on non-directory objects
  *
- * Lock any non-NULL argument that is not a directory.
+ * Lock any non-NULL argument. Passed objects must not be directories.
  * Zero, one or two objects may be locked by this function.
  *
  * @inode1: first inode to lock
@@ -1156,13 +1156,9 @@ void lock_two_inodes(struct inode *inode1, struct inode *inode2,
  */
 void lock_two_nondirectories(struct inode *inode1, struct inode *inode2)
 {
-	if (inode1 > inode2)
-		swap(inode1, inode2);
-
-	if (inode1 && !S_ISDIR(inode1->i_mode))
-		inode_lock(inode1);
-	if (inode2 && !S_ISDIR(inode2->i_mode) && inode2 != inode1)
-		inode_lock_nested(inode2, I_MUTEX_NONDIR2);
+	WARN_ON_ONCE(S_ISDIR(inode1->i_mode));
+	WARN_ON_ONCE(S_ISDIR(inode2->i_mode));
+	lock_two_inodes(inode1, inode2, I_MUTEX_NORMAL, I_MUTEX_NONDIR2);
 }
 EXPORT_SYMBOL(lock_two_nondirectories);
 
@@ -1173,9 +1169,11 @@ EXPORT_SYMBOL(lock_two_nondirectories);
  */
 void unlock_two_nondirectories(struct inode *inode1, struct inode *inode2)
 {
-	if (inode1 && !S_ISDIR(inode1->i_mode))
+	WARN_ON_ONCE(S_ISDIR(inode1->i_mode));
+	WARN_ON_ONCE(S_ISDIR(inode2->i_mode));
+	if (inode1)
 		inode_unlock(inode1);
-	if (inode2 && !S_ISDIR(inode2->i_mode) && inode2 != inode1)
+	if (inode2 && inode2 != inode1)
 		inode_unlock(inode2);
 }
 EXPORT_SYMBOL(unlock_two_nondirectories);
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
