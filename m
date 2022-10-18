Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FE060200A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Oct 2022 02:58:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1okaw9-0004LC-2X;
	Tue, 18 Oct 2022 00:58:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1okaw7-0004L5-Pz
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Oct 2022 00:58:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UHqNkRk4bPYgLLFvmZmG1eW5DjX+Z2iPUVmnW0Nqwb4=; b=iB4nDWPKvac6eN45r/0EHgcCzH
 xzOoWwEXUGQYiwkBpOE0bggvyovtxeH4RqQSZojnjIetXmwWAqZGX1oK5uAgPtOe904vbiSJ45Qh9
 xt5TBzk5tEtPvQykGxwJmz19U8ESookKfmAnoqS7+4hyZuKEPYFaQeasewQLp8Kee60E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=UHqNkRk4bPYgLLFvmZmG1eW5DjX+Z2iPUVmnW0Nqwb4=; b=k
 sD+1CaMOzv2u+KWaIhOaeQhMPuX1ITHSQMhoZQwwk0rZiDWtm52aNDaD2ayjqHugWUAbmImGcKNTA
 Cci8mhGKqYX+JYsiOUmB5AaPF2spavVamxieR9Pfh0AJ734rVXUt62qhHrCCpytx1C3joyuJZETWU
 GQla0GGDfLqph3pM=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1okaw7-007hrb-2P for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Oct 2022 00:58:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D323ACE1A9B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 18 Oct 2022 00:58:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40829C433C1;
 Tue, 18 Oct 2022 00:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666054690;
 bh=EQfYE38gG+3EcKKsQRkrz/TOt3/lj4TBQRUYoSHM1ZA=;
 h=From:To:Cc:Subject:Date:From;
 b=U4vZwFiUKpge2D1EXLJqUATIuJMvFM/JYBRI43lZBV2OCmEfZo1ZFd9L5rR/pdwGK
 oIhgrg4ykO93RQQoM09JiC6oMCo3r/uQY5RvYamimihg88BCNKegNfGEQ4RN3OfljW
 DQgnf0/Qy0kJdgSaZcljHtM312itonP2yMosfsdRHZR1hput9pIUW3LwKQif99cz9u
 3R2UsdYg9Q1No7ymlZuSNYzBDFiCCE0fYHNTkB6trKZxUzFwiZYpzI09fyC2FJvHoP
 s4bKSEiL1WDk48Hkqa4TXjK9IGxHQctCuYSiSMfzuAxV5amG9cNafkF+Vc0H3Qy0BQ
 E6TsKKljkBYHQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 17 Oct 2022 17:58:06 -0700
Message-Id: <20221018005806.892778-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
MIME-Version: 1.0
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: f2fs_unlink -> f2fs_lock_op -> d_invalidate ->
 shrink_dentry_list
 -> iput_final -> f2fs_evict_inode -> f2fs_lock_op Signed-off-by: Jaegeuk
 Kim <jaegeuk@kernel.org> --- fs/f2fs/namei.c | 4 ++-- 1 file changed,
 2 insertions(+), 2 deletions(-) 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1okaw7-007hrb-2P
Subject: [f2fs-dev] [PATCH] f2fs: let's avoid to get cp_rwsem twice by
 f2fs_evict_inode by d_invalidate
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

f2fs_unlink
 -> f2fs_lock_op
 -> d_invalidate
  -> shrink_dentry_list
   -> iput_final
    -> f2fs_evict_inode
     -> f2fs_lock_op

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/namei.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index a389772fd212..e104409c3a0e 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -632,6 +632,8 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
 		goto fail;
 	}
 	f2fs_delete_entry(de, page, dir, inode);
+	f2fs_unlock_op(sbi);
+
 #if IS_ENABLED(CONFIG_UNICODE)
 	/* VFS negative dentries are incompatible with Encoding and
 	 * Case-insensitiveness. Eventually we'll want avoid
@@ -642,8 +644,6 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
 	if (IS_CASEFOLDED(dir))
 		d_invalidate(dentry);
 #endif
-	f2fs_unlock_op(sbi);
-
 	if (IS_DIRSYNC(dir))
 		f2fs_sync_fs(sbi->sb, 1);
 fail:
-- 
2.38.0.413.g74048e4d9e-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
