Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D68FD79DA46
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Sep 2023 22:50:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qgALE-00054x-JY;
	Tue, 12 Sep 2023 20:50:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qgALC-00054o-HA
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Sep 2023 20:50:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/4+DlByDh920r1YDdLeT0aMwBKpfhn5wCDMvPBKPJ0U=; b=hZNWgHnWchuM0i5uww8Vs6paIS
 HntL1plrSlveGjDNB2tsahx14i3MnGdAycWnQw8J02XZdbZDi7ORl2XSIVULeiWj4BYWsvQTblZem
 duFW8py0HVg6N+ywuA8q5jiaPIzzhhBOD6GXQwSkLE/deOjrix/mZizwmbRfQBbM11ks=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/4+DlByDh920r1YDdLeT0aMwBKpfhn5wCDMvPBKPJ0U=; b=W
 ykQ05FyCCpmDMa4Z5r40TDLAXeSd722rMehYiCcVuc4RAHx0RkOoy1mOy/OcP3COG+4dT/0qKqbRZ
 GDx5hwVWjLgzeiOzVm+tLLqP9pe5tFA04zmjvZx/wI3JUIpq9uFdfXSacQUuXVy2PQFrlhcXdInDL
 HfV1xK9wrSVRH8EY=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qgAL6-00006O-Ic for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Sep 2023 20:50:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id A9A7ACE1D43
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 12 Sep 2023 20:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE7B6C433C8;
 Tue, 12 Sep 2023 20:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694551817;
 bh=x7nnTrA5RCHsYOnVqf+Mil/a7Ta+GR6SCAIeYqHvIbc=;
 h=From:To:Cc:Subject:Date:From;
 b=IvTGrqTjYpc66HYNpyca1dKQTqvON4oy3Y5oI1mOmwt4kzgpneZ92CxUSpvK68qBJ
 MgupqzBA/1myQM61eLotXPDMMGlno4OoCZm8uVuANMaP7K/E4gYekyVe7ljJs/bUw/
 DNpxVP9/6T+TE/PxrAtUjH3Mf1ugRH1XcoH6Zap+JQwdCnEqjHJQc/kDYszntCOqJ9
 2PXGfpwDsCvHAmDWZZV5vzfv9WmAH7IEdkKhLWwuytX0Z+gSrY+OgOTFStNy87Mkce
 AFOV0AFeScKfpB6eDCkZPpTYbJRZ1BoYtCF5mPdt1GcxjvPi4mRKSb0fmf36gIKZT0
 4mdj6cBp88Y9Q==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 12 Sep 2023 13:50:15 -0700
Message-ID: <20230912205015.2582133-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Otherwise, we'll get a broken inode. # touch $FILE # f2fs_io
 setflags compression $FILE # f2fs_io set_coption 2 8 $FILE [ 112.227612]
 F2FS-fs (dm-51): sanity_check_compress_inode: inode (ino=8d3fe) has
 unsupported compress level: 0, run fsck to fix 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qgAL6-00006O-Ic
Subject: [f2fs-dev] [PATCH] f2fs: set the default compress_level on ioctl
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Otherwise, we'll get a broken inode.

 # touch $FILE
 # f2fs_io setflags compression $FILE
 # f2fs_io set_coption 2 8 $FILE

[  112.227612] F2FS-fs (dm-51): sanity_check_compress_inode: inode (ino=8d3fe) has unsupported compress level: 0, run fsck to fix

Cc: stable@vger.kernel.org
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/file.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ca5904129b16..09716127e107 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4005,6 +4005,15 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
 	F2FS_I(inode)->i_compress_algorithm = option.algorithm;
 	F2FS_I(inode)->i_log_cluster_size = option.log_cluster_size;
 	F2FS_I(inode)->i_cluster_size = BIT(option.log_cluster_size);
+	/* Set default level */
+	if (F2FS_I(inode)->i_compress_algorithm == COMPRESS_ZSTD)
+		F2FS_I(inode)->i_compress_level = F2FS_ZSTD_DEFAULT_CLEVEL;
+	else
+		F2FS_I(inode)->i_compress_level = 0;
+	/* Adjust mount option level */
+	if (option.algorithm == F2FS_OPTION(sbi).compress_algorithm &&
+	    F2FS_OPTION(sbi).compress_level)
+		F2FS_I(inode)->i_compress_level = F2FS_OPTION(sbi).compress_level;
 	f2fs_mark_inode_dirty_sync(inode, true);
 
 	if (!f2fs_is_compress_backend_ready(inode))
-- 
2.42.0.283.g2d96d420d3-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
