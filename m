Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC1C705206
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 May 2023 17:24:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pywXB-0001MW-ST;
	Tue, 16 May 2023 15:24:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pywX7-0001MQ-LI
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 May 2023 15:24:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s2s/ccMC4Z2K6TRahFRfnzlFlPl6sOgfOEPGE0q3ZR4=; b=Z9YD/PjYWvayoyHP1ox30N8oEM
 nnm9bXDGzNFpfdp3sBP7lr+ko1EpiW8WcOnbz0rUTZxLuBwE1sAkVJezgj2PP/5fmk4ZwDAaNOWWU
 T50wR/ivGc4Slpcg0Tp5q7kYZz1zkU+R7ddUnrDNrnnQvmFZTVYhBB1dJhAMCNg7IdAI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=s2s/ccMC4Z2K6TRahFRfnzlFlPl6sOgfOEPGE0q3ZR4=; b=f
 kAjpL6jpzv/DnO+QO0iy+OK+LcDSHYTBOGAJ3fO7gI1H3/zX5/YjOaxnz25rUZMLzybpX/+9f80hC
 VNDhV3mcA8GzvGqsIU4FZ8EXuRWLLUDaHNynC1sLLuIfyFljmIZFbjH/jOHF1YqoE9OYGPFpISPpW
 XK9ZD/cyfw6WZj00=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pywX7-0007xW-2I for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 May 2023 15:24:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A5B8E62C8C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 May 2023 15:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD6B8C433D2;
 Tue, 16 May 2023 15:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684250647;
 bh=dlpta+O6AiRXSqeDkk4SbGJ4ZUr5sNITboxH95GYYEw=;
 h=From:To:Cc:Subject:Date:From;
 b=kJEA5hI+Wdi20yIxk1fqICrPWnarW0/Ac8m1J/cW04ZVawLaeNW3Ng6SjJdr8anfd
 vnUvCtmhQEFdVdJERDv2ztM79XEg45STq0Agc0zjl5gxL9yTGyqhhjH5G0nmi71NFC
 6/BjUdfKMRn4QUPcAl+mzEyMkgecPDEfxACm5clJ8aosHHQ45MvijrIgwOhrOoIxKC
 jFZAzL63bAnIUWJilQJ4vYfC+uM56FZpmooQzZO8ptTEPivZH1ufuQyrzbzH5YDCK9
 jXUl60Z9ThHS98E50LkUWDAPhVoUBtLRKz9Vokgzh/AbvmOGTr7KtpXI+3ILq6ADYg
 n1hR65mihswjw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 16 May 2023 23:23:46 +0800
Message-Id: <20230516152346.190199-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  We should set noatime bit for quota files, since no one cares
 about atime of quota file, and we should set immutalbe bit as well, due to
 nobody should write to the file through exported interfaces. Meanwhile this
 patch use inode_lock to avoid race condition during inode->i_flags,
 f2fs_inode->i_flags update. 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pywX7-0007xW-2I
Subject: [f2fs-dev] [PATCH] f2fs: fix to set noatime and immutable flag for
 quota file
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

We should set noatime bit for quota files, since no one cares about
atime of quota file, and we should set immutalbe bit as well, due to
nobody should write to the file through exported interfaces.

Meanwhile this patch use inode_lock to avoid race condition during
inode->i_flags, f2fs_inode->i_flags update.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 9f15b03037db..5d3ac196f0d5 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2713,6 +2713,7 @@ static int f2fs_quota_enable(struct super_block *sb, int type, int format_id,
 {
 	struct inode *qf_inode;
 	unsigned long qf_inum;
+	unsigned int qf_flag = F2FS_NOATIME_FL | F2FS_IMMUTABLE_FL;
 	int err;
 
 	BUG_ON(!f2fs_sb_has_quota_ino(F2FS_SB(sb)));
@@ -2728,7 +2729,15 @@ static int f2fs_quota_enable(struct super_block *sb, int type, int format_id,
 	}
 
 	/* Don't account quota for quota files to avoid recursion */
+	inode_lock(qf_inode);
 	qf_inode->i_flags |= S_NOQUOTA;
+
+	if (!(F2FS_I(qf_inode)->i_flags & qf_flag)) {
+		F2FS_I(qf_inode)->i_flags |= qf_flag;
+		f2fs_set_inode_flags(qf_inode);
+	}
+	inode_unlock(qf_inode);
+
 	err = dquot_load_quota_inode(qf_inode, type, format_id, flags);
 	iput(qf_inode);
 	return err;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
