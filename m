Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE3324F263
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Aug 2020 08:18:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kA5oS-0002Ce-1p; Mon, 24 Aug 2020 06:18:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kA5oP-0002Bv-9Z
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Aug 2020 06:18:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MP8qlXNuL1EiYOJAiD5rlAIIVRNLl5s58ky8k1GHPlY=; b=YqKtMUb76rC/VEe53McnTpBtnw
 r/3cudeFAPje+kjRLRKxi157Qfn/4HKD9ln0VY3m8WNU9wbJ6wIebIOt7HA2w9lESz4piAMxt9n0L
 oMLhmcIlmNMXcK3WrNg1fZQ8eMG6QEW81uj8yfQMM/ctiLmlkPdtzpwHrH1FhQKrgxlo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MP8qlXNuL1EiYOJAiD5rlAIIVRNLl5s58ky8k1GHPlY=; b=P6ArYrolP3p8fEpj4Ls822GhH5
 rN7Z1VlAJZd389/OAQj7tBAdOv989kozNSuJkopPFg2DqejtqP3lkgJLzEu4aDk5I5RukKKEyJsqS
 +wsmqHlMFMf2tP07AUwhaDemFpHK5Am/0GnZbGah4G/Y8dAqLaLb9DOQZhPgYfUi0iJw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kA5oN-002Evf-Jd
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Aug 2020 06:18:33 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E15422087D;
 Mon, 24 Aug 2020 06:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598249899;
 bh=IH6sTOwkbzPMf4x5Li5gjFgkfm2HNIgk1xMl8TNxDTc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JDKODAQpPTq5huUKShVPhJTG2Df1AHur6QPxO7Njy/ZJwbOEtmt/3AwrwdxS7/TVN
 ZMC92UTKIOeYa+JwpYJPxIO128wY9hOL8oTYduzs1O3YrW9UDLUMuf7TCoC739bDtJ
 CfMQrNc+4ZGVgY9GdtXke3sxODPPYPwCrcKZmOoM=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Sun, 23 Aug 2020 23:17:07 -0700
Message-Id: <20200824061712.195654-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200824061712.195654-1-ebiggers@kernel.org>
References: <20200824061712.195654-1-ebiggers@kernel.org>
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
X-Headers-End: 1kA5oN-002Evf-Jd
Subject: [f2fs-dev] [RFC PATCH 3/8] ext4: remove some #ifdefs in
 ext4_xattr_credits_for_new_inode()
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
Cc: Jeff Layton <jlayton@kernel.org>, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

We don't need #ifdefs for CONFIG_SECURITY and CONFIG_INTEGRITY;
IS_ENABLED() is sufficient.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/ialloc.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/fs/ext4/ialloc.c b/fs/ext4/ialloc.c
index 0cc576005a923..3e9c50eb857be 100644
--- a/fs/ext4/ialloc.c
+++ b/fs/ext4/ialloc.c
@@ -763,13 +763,12 @@ static int ext4_xattr_credits_for_new_inode(struct inode *dir, mode_t mode,
 	}
 #endif
 
-#ifdef CONFIG_SECURITY
-	{
+	if (IS_ENABLED(CONFIG_SECURITY)) {
 		int num_security_xattrs = 1;
 
-#ifdef CONFIG_INTEGRITY
-		num_security_xattrs++;
-#endif
+		if (IS_ENABLED(CONFIG_INTEGRITY))
+			num_security_xattrs++;
+
 		/*
 		 * We assume that security xattrs are never more than 1k.
 		 * In practice they are under 128 bytes.
@@ -779,7 +778,7 @@ static int ext4_xattr_credits_for_new_inode(struct inode *dir, mode_t mode,
 						 NULL /* block_bh */, 1024,
 						 true /* is_create */);
 	}
-#endif
+
 	if (encrypt)
 		nblocks += __ext4_xattr_set_credits(sb,
 						    NULL /* inode */,
-- 
2.28.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
