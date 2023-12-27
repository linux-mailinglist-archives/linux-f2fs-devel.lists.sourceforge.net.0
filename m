Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3372B81F0D2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Dec 2023 18:17:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rIXXH-0006Gc-Nj;
	Wed, 27 Dec 2023 17:17:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1rIXXE-0006GL-89
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 Dec 2023 17:17:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rT0UQHqIOE2IGmgRzBCUSjAfiG5EgDUZFc8MtiojQ/4=; b=j4FStJGK9X8w9VuRrsyNhqydBI
 2MzhMFCWP6vPMvpT4KDSFvsoe5mYrGghVpBAjlV6KhZ3bnbQaQgt8BKA+d4a9NwR+f+cTtx3u8Z8k
 GKEl3Y8NK02YTyLBmB/YsqAofNKTnPB8Yopi9XozFQbYyb72ozTNoGhBaUpS4hkrX1d0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rT0UQHqIOE2IGmgRzBCUSjAfiG5EgDUZFc8MtiojQ/4=; b=YBSwEPQ3QtLH56NWk3cNOiV/9E
 Edg4vPW7rT5m8o6RwjU/Cyz9xhNZgydoWy+x0Nj3nGSS4u9eAZ2jzo8Oo9uGqDV1zBWBexYFrCOst
 jnuOf3Ic7dePgl+2GIATbYVVnFqil7aqP/1bn3mT37O73UW7fjtZ3WB3Z/nda1Lrcskw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rIXXE-0003NG-44 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 Dec 2023 17:17:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ABFF460F72;
 Wed, 27 Dec 2023 17:17:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1888C433C8;
 Wed, 27 Dec 2023 17:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703697445;
 bh=oMd6cyuWC44jmJeHw6DO++liI/GMxog3sPxf3VWV6yo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=umWhZju6J+3h2OeKVr6EpIyoI+lVYboEc5FBxoXG4nRMbDK2you3mgrHLbSLEGqEx
 v5TJbAoOB5GsKdKsAs40VXE5LeOGcMqaY4qKOCUUQQXPYU53vBXrmAbHxJVCG0adZN
 DL9T3H0YrsbhOTJlEH56Ew8WYkw2bRJ75TVcAE3g3Ljsl78Qw5Fw2cytlDEG8ycd/3
 1TnhDrSuooc04NdQ1UDs3PcJplG97mdxu2/g13mI7dmJDf3wnUMK1ajm192QvtSYeb
 LeQ2eCmipmcpzmW268aLMreocA1PWHKf2x0I8TvjMuEs9tL1jusH1flupng/oa8eer
 nHSPVZLe7Y2Hg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Wed, 27 Dec 2023 11:14:29 -0600
Message-ID: <20231227171429.9223-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231227171429.9223-1-ebiggers@kernel.org>
References: <20231227171429.9223-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -8.0 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Josef Bacik <josef@toxicpanda.com> btrfs has a variety
 of asynchronous things we do with inodes that can potentially last until
 ->put_super, when we shut everything down and clean up all of our async work.
 Due to this we need to move f [...] 
 Content analysis details:   (-8.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rIXXE-0003NG-44
Subject: [f2fs-dev] [PATCH v2 2/2] fs: move fscrypt keyring destruction to
 after ->put_super
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
Cc: linux-fsdevel@vger.kernel.org, Neal Gompa <neal@gompa.dev>,
 Christoph Hellwig <hch@lst.de>, Josef Bacik <josef@toxicpanda.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Josef Bacik <josef@toxicpanda.com>

btrfs has a variety of asynchronous things we do with inodes that can
potentially last until ->put_super, when we shut everything down and
clean up all of our async work.  Due to this we need to move
fscrypt_destroy_keyring() to after ->put_super, otherwise we get
warnings about still having active references on the master key.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/super.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/super.c b/fs/super.c
index 076392396e724..faf7d248145d2 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -674,34 +674,34 @@ void generic_shutdown_super(struct super_block *sb)
 		/* Evict all inodes with zero refcount. */
 		evict_inodes(sb);
 
 		/*
 		 * Clean up and evict any inodes that still have references due
 		 * to fsnotify or the security policy.
 		 */
 		fsnotify_sb_delete(sb);
 		security_sb_delete(sb);
 
-		/*
-		 * Now that all potentially-encrypted inodes have been evicted,
-		 * the fscrypt keyring can be destroyed.
-		 */
-		fscrypt_destroy_keyring(sb);
-
 		if (sb->s_dio_done_wq) {
 			destroy_workqueue(sb->s_dio_done_wq);
 			sb->s_dio_done_wq = NULL;
 		}
 
 		if (sop->put_super)
 			sop->put_super(sb);
 
+		/*
+		 * Now that all potentially-encrypted inodes have been evicted,
+		 * the fscrypt keyring can be destroyed.
+		 */
+		fscrypt_destroy_keyring(sb);
+
 		if (CHECK_DATA_CORRUPTION(!list_empty(&sb->s_inodes),
 				"VFS: Busy inodes after unmount of %s (%s)",
 				sb->s_id, sb->s_type->name)) {
 			/*
 			 * Adding a proper bailout path here would be hard, but
 			 * we can at least make it more likely that a later
 			 * iput_final() or such crashes cleanly.
 			 */
 			struct inode *inode;
 
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
