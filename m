Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5FB91A037
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Jun 2024 09:17:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sMjNp-0004cI-1s;
	Thu, 27 Jun 2024 07:17:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sMjNn-0004cA-SN
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jun 2024 07:17:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ixxn0NVbQFe7pGfH3s7cx4unf7dzDXEndfOm3UzTBQU=; b=Unnf3lP3jdatUYwsNQ98LcQfQv
 bQ1YW/gxc3D+a4kTPpHjfocLPVnAzhU9NHxXFCnf4/jHpDFd4JbCoZlzXPB8dI/zAIm05i4HcLaTH
 F2kUfaisK1SpZR+UDklbhUn3jbbhkTw35k6b8MQNWUPbKyMUBY3PiXC2uKDfRQuExGJ0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Ixxn0NVbQFe7pGfH3s7cx4unf7dzDXEndfOm3UzTBQU=; b=Z
 4IIoT1wlP8EdyNBuBolo3bChcN9a0kSrX992LTnqjmkZw0OAnfKMaVrJZ+OCesva5203l0EFNQPdm
 arYymS9p2OBbiqvkHFdBgrp+ZgMXlrRFHKy/bSLqwFKxMkJzxSSHEXKQ1YHyd1/k3fxWbkE4d2uaO
 2CQdvNHPeRO5E7YU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sMjNo-0001O4-Ec for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jun 2024 07:17:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4B9966023E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 27 Jun 2024 07:17:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D3A4C2BBFC;
 Thu, 27 Jun 2024 07:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719472636;
 bh=1SaMfD2tmbpfNXEkMAGBWpGso//fdIqXP6/GKH5prbg=;
 h=From:To:Cc:Subject:Date:From;
 b=mGLI+EBlhln9XA+39mawyx16KBTyQ4k7eF6f/HqJXaqGmsvFObWROwbURkrjeqIdZ
 11MZwSFmAwgPBgvoZB1hCbIiwO9Gy449O98IoL3e6jb1PM+ACTKj1bEIvn9CKMGycz
 RYMaL+X0VoyI0VMW8dO8W1zIqwtMhjwwDKFhKa7fQhCggdL44xdGeP3cNoI5Jh+ojD
 OIfrz9CLlcM2bzvyh8QRLQfe1/I1Uf5lvec/Fp+b63AUqwrhkXdoerxwuDXMYbB3Vq
 lU0D0Rju9+6uhr8QeT1BjsEXJkYUr3ijVcjQVnRuevb+K4HhIRk4QXvy7yJcJsQXI+
 0/p+px7G0kr2Q==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 27 Jun 2024 15:17:11 +0800
Message-Id: <20240627071711.1563420-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: It should wait all existing dio write IOs before block
 removal, 
 otherwise, previous direct write IO may overwrite data in the block which
 may be reused by other inode. Cc: stable@vger.kernel.org Signed-off-by: Chao
 Yu <chao@kernel.org> --- fs/f2fs/file.c | 13 +++++++++++++ 1 file changed,
 13 insertions(+) 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sMjNo-0001O4-Ec
Subject: [f2fs-dev] [PATCH] f2fs: fix to wait dio completion
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

It should wait all existing dio write IOs before block removal,
otherwise, previous direct write IO may overwrite data in the
block which may be reused by other inode.

Cc: stable@vger.kernel.org
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 76a6043caf27..f2d0e0de775f 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1056,6 +1056,13 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 				return err;
 		}
 
+		/*
+		 * wait for inflight dio, blocks should be removed after
+		 * IO completion.
+		 */
+		if (attr->ia_size < old_size)
+			inode_dio_wait(inode);
+
 		f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
 		filemap_invalidate_lock(inode->i_mapping);
 
@@ -1892,6 +1899,12 @@ static long f2fs_fallocate(struct file *file, int mode,
 	if (ret)
 		goto out;
 
+	/*
+	 * wait for inflight dio, blocks should be removed after IO
+	 * completion.
+	 */
+	inode_dio_wait(inode);
+
 	if (mode & FALLOC_FL_PUNCH_HOLE) {
 		if (offset >= inode->i_size)
 			goto out;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
