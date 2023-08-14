Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF04577BFD4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Aug 2023 20:29:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qVcKB-0002Hf-Lg;
	Mon, 14 Aug 2023 18:29:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qVcKA-0002HV-5k
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 18:29:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BwFnR5tPjO95NlnfWrn/kIOXkLrDuTTA18kKpvSVtV4=; b=lBIF1PbqQPzxWC6p04gTxin24I
 XyC4j7WgcRzQhxR2StQOezybhYEX4x76Ud+KqZPtVbBsq0d5McKF7nYnnEjCfQSJ2thQbDso6ncIa
 UW1eTIZy3mcPDs9dMguAzIbx+BFh7h2K2YTfNPgVZ+sIaH9L9N/Ze3TyLnJnfGzZwcu8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BwFnR5tPjO95NlnfWrn/kIOXkLrDuTTA18kKpvSVtV4=; b=Vcxe0JIosdQOEEC4Rli1uecQ7x
 gMPchsb6gDs+/3vjnKfW4YSg6PvMSAeSfGi4lGKrDgeKNqsY/ZJTdHEUVw3Te8kKQiKQIzI+uWAxy
 QI6EhTcE//0N5Nzh2NwnxMHBbmEdXNA2df7rNVNluXkHABmlJ/ZWUkezEC5lPPKC1k4k=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qVcK4-005f0H-R0 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 18:29:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D2CE4657BA;
 Mon, 14 Aug 2023 18:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2DCC433C8;
 Mon, 14 Aug 2023 18:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692037777;
 bh=ZmG/XvBXL8nYb0AYKa5yxa3KEb90q7gpbLYhFxe+7hc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RPu3Z7xOTiw1V2P9IGJ3Zq6It/yKQDOl4S8w4vkx/8uUbODyhlazNrBFDQfieMUVR
 6lGqwV/MTV1XwfMAF/HwwqTf7NRlJsfT2gKH+EO7UgwjeTe06UCnFwv9NJCnH8/sPx
 RaLyBmG+bXYvYG26NH9t31zsEISCLes66ViCdisW7axIPpYcUE0FnhTr4vFIPEP36k
 rTa8YfV8vYcsC+tr9E++6x84YjtCGpiYdK+Tq0iSfxgADjUIoxpamwtwvDi8nkud4s
 KX3gTW43S0vV9fDGLakOvExRU/BUGTaWLGjZELMqh0Q780fCr7dkN4A36rOQ3hrpPH
 3FHTRoSqZkmDQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-ext4@vger.kernel.org,
	Theodore Ts'o <tytso@mit.edu>
Date: Mon, 14 Aug 2023 11:29:03 -0700
Message-ID: <20230814182903.37267-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230814182903.37267-1-ebiggers@kernel.org>
References: <20230814182903.37267-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Eric Biggers <ebiggers@google.com> Now that neither
 ext4 nor f2fs allows inodes with the casefold flag to be instantiated when
 unsupported, it's unnecessary to repeatedly check for support later on during
 random filesystem operations. 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qVcK4-005f0H-R0
Subject: [f2fs-dev] [PATCH 3/3] libfs: remove redundant checks of s_encoding
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
Cc: linux-fsdevel@vger.kernel.org, Gabriel Krisman Bertazi <krisman@suse.de>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Now that neither ext4 nor f2fs allows inodes with the casefold flag to
be instantiated when unsupported, it's unnecessary to repeatedly check
for support later on during random filesystem operations.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/libfs.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/fs/libfs.c b/fs/libfs.c
index 5b851315eeed..5197ea8c66d3 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1381,16 +1381,6 @@ bool is_empty_dir_inode(struct inode *inode)
 }
 
 #if IS_ENABLED(CONFIG_UNICODE)
-/*
- * Determine if the name of a dentry should be casefolded.
- *
- * Return: if names will need casefolding
- */
-static bool needs_casefold(const struct inode *dir)
-{
-	return IS_CASEFOLDED(dir) && dir->i_sb->s_encoding;
-}
-
 /**
  * generic_ci_d_compare - generic d_compare implementation for casefolding filesystems
  * @dentry:	dentry whose name we are checking against
@@ -1411,7 +1401,7 @@ static int generic_ci_d_compare(const struct dentry *dentry, unsigned int len,
 	char strbuf[DNAME_INLINE_LEN];
 	int ret;
 
-	if (!dir || !needs_casefold(dir))
+	if (!dir || !IS_CASEFOLDED(dir))
 		goto fallback;
 	/*
 	 * If the dentry name is stored in-line, then it may be concurrently
@@ -1453,7 +1443,7 @@ static int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
 	const struct unicode_map *um = sb->s_encoding;
 	int ret = 0;
 
-	if (!dir || !needs_casefold(dir))
+	if (!dir || !IS_CASEFOLDED(dir))
 		return 0;
 
 	ret = utf8_casefold_hash(um, dentry, str);
-- 
2.41.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
