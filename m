Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C204FD2E59B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Jan 2026 09:56:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HR7cD0Xsfrer55xr1Tkzgg+FcmovtQS9kxYB4e64jsg=; b=UI348hlTTj9iUDHSq69CD9Ssmw
	2h/8+vUTqS+UxBu7zUE20a8TcXdQcDKODtteGCEAQXdiBgAWuBtLOv3RomLZZqkX65qjLv9GgsckK
	iPCyNb7p1TmEkQIyRTGB0twJslAfCIg9/WmU9UpVWlqoOpZPxqyC0TrO6poYZuUVyj3k=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgfdR-0001Nk-19;
	Fri, 16 Jan 2026 08:56:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vgfdP-0001NX-LH
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Jan 2026 08:56:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0gMbAlcevmy0lBe3Gyvwf9enQ+FP6WQGkL+upC3bf60=; b=HpZRJLWLWCMYGRhVv4/XFm8wPi
 zuufy6TCrX9gUSSmvJa5lCi9RMZ5N2c+5ZK1xQk3P9FSk5YK4nrvIVkrOLxH/Kqs6od2FE1RZAhzV
 qVoRDAr/3QhwJ93g5q3hZ/tXtf6yUSPnrT1MS6JjNpgBzvpaN2NaHbVZODGvOOyico7I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0gMbAlcevmy0lBe3Gyvwf9enQ+FP6WQGkL+upC3bf60=; b=K
 CB7mb5C58yh07mhh41QeRdwbwEfiQ/pv+dMkSrwXEcXkA7NCsGRYFqqv+SR5AZjd6P8QIB44/Cgdh
 jBche5O+xKkZLL5tYwLT2vLMLfOr+SxXWiZFrLB3EmTgBtn45SA6vuLm1PZjf2bLHawWLYP5n8hg+
 7iAR0uVan9Sgwf6A=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgfdP-0001RN-Sb for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Jan 2026 08:56:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 80FF54241E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 16 Jan 2026 08:56:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA683C2BC87;
 Fri, 16 Jan 2026 08:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768553797;
 bh=+NSrvHV2SSmOt34FNA1uBu+Z49H6BSnu+ZwmaZA+U0s=;
 h=From:To:Cc:Subject:Date:From;
 b=HTfWov/7OCvStTyIlSkjhgXYTkOp4ZWnD0j1YX38sX/EtbRj7QcGIPvJOmLUoqKX/
 x1ywBPeKtQnFI3El9jgSWwSLfG1IcJDBpmFOA6JVEfBNxMiSRsKTlDv5N9qqBiyyPe
 TyZ86hDc88+DDgf7BBvzXBF5VTe7tLlBursBPVoeJIOrfBfBTIvj5uuNF4VPc6XVKq
 rYZIe9EGj0SQWcMJr7P+3RDe6wAzZctAuYfRcfW22VkUrHq+BCgtNlIUb4XO71dTfE
 7Sjg+WkQ2435aP1kMQeKViP2Kz0eg3VByWlJGVtakVb/E1gh8BcOCD8uZEhBJat7dx
 chVCKB8cL9lPQ==
To: jaegeuk@kernel.org
Date: Fri, 16 Jan 2026 14:29:27 +0800
Message-Id: <20260116062927.21725-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In error path of f2fs_read_data_large_folio(),
 if bio is valid, 
 it may submit bio twice, fix it. Signed-off-by: Chao Yu <chao@kernel.org>
 --- v2: - rebase the code fs/f2fs/data.c | 7 ++----- 1 file changed,
 2 insertions(+), 5 deletions(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vgfdP-0001RN-Sb
Subject: [f2fs-dev] [PATCH v2] f2fs: fix error path handling in
 f2fs_read_data_large_folio()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In error path of f2fs_read_data_large_folio(), if bio is valid, it
may submit bio twice, fix it.

Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- rebase the code
 fs/f2fs/data.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 5b4832956196..d685c889f7b6 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2577,17 +2577,14 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 		folio_end_read(folio, !ret);
 		return ret;
 	}
-
+out:
+	f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
 	if (ret) {
-		f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
-
 		/* Wait bios and clear uptodate. */
 		folio_lock(folio);
 		folio_clear_uptodate(folio);
 		folio_unlock(folio);
 	}
-out:
-	f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
 	return ret;
 }
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
