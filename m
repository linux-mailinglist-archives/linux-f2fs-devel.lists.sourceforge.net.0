Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A5B8366AC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jan 2024 16:06:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rRvsN-00081P-TD;
	Mon, 22 Jan 2024 15:06:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1rRvsL-000819-T8
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jan 2024 15:06:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PcKN/NGpDjeYDwZIC/HtVfySgZ9Pny3moVauvLYHh0Q=; b=E+X0xCCmAB7Kt0XMufAYVEAL41
 Joyl/z9XTPku02Jiqdyp+uKCiIacq/BMZktZSq4fFy0a8ZsZ4ybDBVYi2TquElujR4DgtOJP/pLk2
 KRttf5WlfZ0gDDqcpQeGlQp3buaUzYp9VE7dxvjIjMbbGUZUdcv/I84XdxOLkGoritjI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PcKN/NGpDjeYDwZIC/HtVfySgZ9Pny3moVauvLYHh0Q=; b=WyoRx0kQlzuMFGF3n7hmTC3uHN
 yaZZmZDtgFxCA2mNUFxbt/NdIkriCVE+Vv3IGX3pwuX8b/oC/jtmPZPl2RICQxNNi8MMdeJzu7AR9
 T8nx8uiTAMEdOGQKW14J4UKXz0Z2QZcrIHjz/rR+610woXxy8eqZxDHoqbCEH8iH0bcM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rRvsL-0003SL-4t for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jan 2024 15:06:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 568F661532
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 22 Jan 2024 15:06:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52C6FC43390;
 Mon, 22 Jan 2024 15:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705935968;
 bh=1Irrl3whR3uHGgveTPJ/UzYt6DSNqgYXdIW4ybupJ9w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nghyl0osfnAaECeK1m6mMxeD6gdtVmvTzokV+dzIq8w2KVPUMYdFa2+/IFWCF276u
 USFHmMec0QGDj9x1YODJTOFqDIepfW7lWzKDbTDiSe3olbra3bkqsr0JjW0JxoYhGj
 PMpSQd1//siV/9bJlcNO9lBtCVq6K96I8lZJ5QzIghmkvjow+Rl55rK2aXVDVHZd0a
 kgDOC3Lpoilz1+vFwS2GdmFoNzYFlJi5/sCxgKFoTxVnFakIHQ16tQnbl8yPTquNOo
 F4Xh+o9rMOJbq2r9THDTm0xNMvyf1kn8m82s/FQxxkk2POYviMSf5WKShOCQw3Azew
 B0ksgEh559BXQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon, 22 Jan 2024 10:01:51 -0500
Message-ID: <20240122150432.992458-37-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122150432.992458-1-sashal@kernel.org>
References: <20240122150432.992458-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.13
X-Spam-Score: -6.5 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chao Yu <chao@kernel.org> [ Upstream commit
 4961acdd65c956e97c1a000c82d91a8c1cdbe44b
 ] It needs to add missing gcing flag on page during block migration, in order
 to garantee migrated data be persisted during checkpoint,
 otherwise out-of-order
 persistency between data and node may cause [...] 
 Content analysis details:   (-6.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rRvsL-0003SL-4t
Subject: [f2fs-dev] [PATCH AUTOSEL 6.6 37/73] f2fs: fix to tag gcing flag on
 page during block migration
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <chao@kernel.org>

[ Upstream commit 4961acdd65c956e97c1a000c82d91a8c1cdbe44b ]

It needs to add missing gcing flag on page during block migration,
in order to garantee migrated data be persisted during checkpoint,
otherwise out-of-order persistency between data and node may cause
data corruption after SPOR.

Similar issue was fixed by commit 2d1fe8a86bf5 ("f2fs: fix to tag
gcing flag on page during file defragment").

Signed-off-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/compress.c | 4 +++-
 fs/f2fs/file.c     | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 7514661bbfbb..372616ca8fb5 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1029,8 +1029,10 @@ static void set_cluster_dirty(struct compress_ctx *cc)
 	int i;
 
 	for (i = 0; i < cc->cluster_size; i++)
-		if (cc->rpages[i])
+		if (cc->rpages[i]) {
 			set_page_dirty(cc->rpages[i]);
+			set_page_private_gcing(cc->rpages[i]);
+		}
 }
 
 static int prepare_compress_overwrite(struct compress_ctx *cc,
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index a06f03d23762..d6962f4ccad3 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1317,6 +1317,7 @@ static int __clone_blkaddrs(struct inode *src_inode, struct inode *dst_inode,
 			}
 			memcpy_page(pdst, 0, psrc, 0, PAGE_SIZE);
 			set_page_dirty(pdst);
+			set_page_private_gcing(pdst);
 			f2fs_put_page(pdst, 1);
 			f2fs_put_page(psrc, 1);
 
@@ -4054,6 +4055,7 @@ static int redirty_blocks(struct inode *inode, pgoff_t page_idx, int len)
 		f2fs_bug_on(F2FS_I_SB(inode), !page);
 
 		set_page_dirty(page);
+		set_page_private_gcing(page);
 		f2fs_put_page(page, 1);
 		f2fs_put_page(page, 0);
 	}
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
