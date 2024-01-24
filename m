Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9604783AC46
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jan 2024 15:45:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rSeVF-00070h-QN;
	Wed, 24 Jan 2024 14:45:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rSeVD-00070b-VC
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jan 2024 14:45:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nsEXfTgUZdb7O/1sIzQN1ud74814hofAGDkAZxkm5U8=; b=WOXMvH++KVHs+mTJd4IfTl46q1
 ROR4x4oJAhFygYrYiJqTf4lsILajefPY+hcsdQCI8DlioI9MfUE6TlFrMpXhm1CRgf3z6VS6isciq
 8yNodIkk3IWQ+ycIpYBb4EnrIp7GnkUfPl3LPoGYtQ23CJJuDxq5/N/sa/F5pTpHw3m0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=nsEXfTgUZdb7O/1sIzQN1ud74814hofAGDkAZxkm5U8=; b=a
 gW8EFdPYpmrUrp9iv5xu1beZ0JhzSyeg36wMpMn49svDQCeKz4vQYH3qPGYNkgURmBo7/usRoUr0Y
 fizgWzwO5yS07md0b6O3nBqWVUolwCXJfgPaQj7Y8aolHnqZ6myRLoUe+dJppRyVAJSfkULf0QwFy
 T49unWp5AaHEvHHE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rSeVB-0008TB-HU for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jan 2024 14:45:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8734F61DAB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Jan 2024 14:45:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B78C43399;
 Wed, 24 Jan 2024 14:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706107512;
 bh=GmaYoIhCc4vPw5Lo1/sPZc2Sy8eWLhDLcOKDvMVTJ2w=;
 h=From:To:Cc:Subject:Date:From;
 b=JqkQ1rzSk81G/5oXUF5vcMSH2UZHazJHBuWisp7JuQJHVG2oIqbzkFhkn0rXELxgQ
 G5R2uXqeV+zN1N3MbpQSqsOz423fo50SAHbHP+2ItzD+9au1VGqrk1k75NPAJTT5W6
 a5dtFwkf8kHu8bKIMmoVrmyPeAFAVOL8jRwfiSy59udfUX15cAKoa66i9Yubaj/seC
 pqwSXow7WXuXHh7C2c8AaJCjpEyyuX9C4aZ5OnW5G8IQzKK6ZGnd+8TOzeomNgKUhB
 FXN8ufRsme/VIWKSsFeAjINnzFaji1xRpNpvBZkHhJFNtc3Jkqd1zfVP2Xer3tFtHc
 ViUBKDhj5lm/w==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed, 24 Jan 2024 22:45:06 +0800
Message-Id: <20240124144506.15052-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -6.7 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Use printk_ratelimited() instead of f2fs_err() in
 f2fs_record_stop_reason(), 
 and f2fs_record_errors() to avoid redundant logs. Signed-off-by: Chao Yu
 <chao@kernel.org> --- fs/f2fs/super.c | 9 ++++++--- 1 file changed,
 6 insertions(+), 3 deletions(-) 
 Content analysis details:   (-6.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rSeVB-0008TB-HU
Subject: [f2fs-dev] [PATCH] f2fs: use printk_ratelimited to avoid redundant
 logs
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use printk_ratelimited() instead of f2fs_err() in f2fs_record_stop_reason(),
and f2fs_record_errors() to avoid redundant logs.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index e2c066fbc0fa..7e437aea268e 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4091,7 +4091,9 @@ static void f2fs_record_stop_reason(struct f2fs_sb_info *sbi)
 
 	f2fs_up_write(&sbi->sb_lock);
 	if (err)
-		f2fs_err(sbi, "f2fs_commit_super fails to record err:%d", err);
+		printk_ratelimited(
+			"%sF2FS-fs (%s): f2fs_commit_super fails to record stop_reason, err:%d\n",
+			KERN_ERR, sbi->sb->s_id, err);
 }
 
 void f2fs_save_errors(struct f2fs_sb_info *sbi, unsigned char flag)
@@ -4134,8 +4136,9 @@ static void f2fs_record_errors(struct f2fs_sb_info *sbi, unsigned char error)
 
 	err = f2fs_commit_super(sbi, false);
 	if (err)
-		f2fs_err(sbi, "f2fs_commit_super fails to record errors:%u, err:%d",
-								error, err);
+		printk_ratelimited(
+			"%sF2FS-fs (%s): f2fs_commit_super fails to record errors:%u, err:%d\n",
+			KERN_ERR, sbi->sb->s_id, error, err);
 out_unlock:
 	f2fs_up_write(&sbi->sb_lock);
 }
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
