Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 501C6B0D197
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Jul 2025 08:03:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zWgtg6UQp87N+IZy3dT/Fx6WWoO5nih3s/R/0m/wFTo=; b=TPDXc6ogkeMnrDkfA1dmK0t5jy
	JYlPoGyHA07pftgFSKJOCuOdW1UnWXelHzi2yCsfG4cPitSG1AMl4dr9ZgUgC5QVkfJ+NmgYST2HM
	UMnc3WMZzBCaNIP3N/9bcZiYAUdDwN2V94Hg5bK0mG/Y53vnpd1mia3HO3lgyrxVlkX4=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ue65V-0001CG-8Y;
	Tue, 22 Jul 2025 06:02:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yohan.joung@sk.com>) id 1ue65T-0001C8-33
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Jul 2025 06:02:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ucSeSNxTp6eqVdHsOz1oJALOTgZXdUKmNx9sSeeqDo4=; b=BpdgPxFxswYEUj8f8Fhf5nAKae
 BHfdTaCkkm9km8CWRH30HPvlcxWzC7zLiFn138C7S3ivBB0ySQQs1cB4IlghsyHIm/gG9fUDiqnzj
 4SW/l1vjTfA2RmyeFGS2VFP+smXIZOY/ua89YxOc4YDG+RFZKZ+ZY7y19lCcRwyg/Hmo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ucSeSNxTp6eqVdHsOz1oJALOTgZXdUKmNx9sSeeqDo4=; b=L
 iIrpc+5gkHpjzipJM5wjfaBp1ybWttcSWfD6gC1yFIs2yZ6+5jKfjdnsXZpRAY8c1uo+2jrjG6fmU
 2zM7oCB44IxHm8Z2Y6vpy+RMs1vSzjRVXHFZ5DRaZZncU3+pTq7/KEKjH9wCS0eUcQVufMVpJal6c
 D0Kiok9+PJr9OAKI=;
Received: from exvmail3.hynix.com ([166.125.252.90] helo=invmail3.skhynix.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1ue65S-0003PX-G4 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Jul 2025 06:02:51 +0000
X-AuditID: a67dfc59-03fff7000000aab6-42-687f298450ec
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 22 Jul 2025 15:02:40 +0900
Message-ID: <20250722060240.1469-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnluLIzCtJLcpLzFFi42LhesuzULdFsz7D4NZXPovTU88yWTxZP4vZ
 4tIid4vLu+awObB4bFrVyeaxe8FnJo/Pm+QCmKO4bFJSczLLUov07RK4MloeRhVs4KrofHeR
 qYFxH0cXIyeHhICJxNITs5lg7Ne9R9hAbDYBDYk/vb3MILaIgKbEkc6Z7F2MXBzMAm2MEu1H
 m1hBEsIC6RJtT2aC2SwCqhLT+7rZQWxeATOJ1pdTWSCGakrs+HKeCSIuKHFy5hOwOLOAvETz
 1tnMEDV3WSUm36qCsCUlDq64wTKBkXcWkpZZSFoWMDKtYhTJzCvLTczMMdYrzs6ozMus0EvO
 z93ECAymZbV/IncwfrsQfIhRgINRiYdXoaEuQ4g1say4MvcQowQHs5II77fdQCHelMTKqtSi
 /Pii0pzU4kOM0hwsSuK8Rt/KU4QE0hNLUrNTUwtSi2CyTBycUg2MlmsPJQX3paRflgrsyxET
 axNsF3l2zGdK9J7TsyfsOSEZZHK32v9YqXR2lMW3z6bWltPOtN5+xlY41zRR+sakcK3LB7n6
 TFduFrLanVISs6pvgpXOq51x+a3+k58vLlGaeObX2/yfzOGOc4u1tCIzPxk9Xeezu01p7y2D
 9HMn2hIWdp3fmGigxFKckWioxVxUnAgANLIxZyICAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJJMWRmVeSWpSXmKPExsXCNUNljm6LZn2GwbTFrBanp55lsniyfhaz
 xaVF7haXd81hs5gw9yqTxfut9xgd2Dw2repk89i94DOTx7fbHh6fN8kFsERx2aSk5mSWpRbp
 2yVwZbQ8jCrYwFXR+e4iUwPjPo4uRk4OCQETide9R9hAbDYBDYk/vb3MILaIgKbEkc6Z7F2M
 XBzMAm2MEu1Hm1hBEsIC6RJtT2aC2SwCqhLT+7rZQWxeATOJ1pdTWSCGakrs+HKeCSIuKHFy
 5hOwOLOAvETz1tnMExi5ZiFJzUKSWsDItIpRJDOvLDcxM8dMrzg7ozIvs0IvOT93EyMwQJbV
 /pm0g/HbZfdDjAIcjEo8vAoNdRlCrIllxZW5hxglOJiVRHi/7QYK8aYkVlalFuXHF5XmpBYf
 YpTmYFES5/UKT00QEkhPLEnNTk0tSC2CyTJxcEo1MG698p3N0mHqRqvmH7cc5k8LOR4SwP9z
 9295pULPncd+ZWouFtk5Tffgma9fjr35MU2ZOdzC2jz0YlvP2i3zSl57Hmd4f51LZZmUIhvL
 9JCon35eKqfORQdEvGYUEbra/jj10enbyoxpZyNXqplr7pxl8Ohi9TNfs9Oib4w28jr3LTNJ
 PBG/ab0SS3FGoqEWc1FxIgDtdD7QDAIAAA==
X-CFilter-Loop: Reflected
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  read for the pinfile using Direct I/O do not wait for dio
 write. Signed-off-by: yohan.joung <yohan.joung@sk.com> --- fs/f2fs/file.c
 | 8 ++++++-- 1 file changed, 6 insertions(+),
 2 deletions(-) diff --git a/fs/f2fs/file.c
 b/fs/f2fs/file.c index 4039ccb5022c..58a4d25eb08f 100644 --- a/fs/f2fs/file.c
 +++ b/fs/f2fs/file.c @@ -4834, 6 +4834,
 7 @@ static ssize_t f2fs_file_read_iter(struct kiocb *io [...] 
 Content analysis details:   (0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.4 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
X-Headers-End: 1ue65S-0003PX-G4
Subject: [f2fs-dev] [PATCH v3] f2fs: zone: wait for inflight dio completion,
 excluding pinned files read using dio
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
Cc: pilhyun.kim@sk.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

read for the pinfile using Direct I/O do not wait for dio write.

Signed-off-by: yohan.joung <yohan.joung@sk.com>
---
 fs/f2fs/file.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 4039ccb5022c..58a4d25eb08f 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4834,6 +4834,7 @@ static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 	struct inode *inode = file_inode(iocb->ki_filp);
 	const loff_t pos = iocb->ki_pos;
 	ssize_t ret;
+	bool dio;
 
 	if (!f2fs_is_compress_backend_ready(inode))
 		return -EOPNOTSUPP;
@@ -4842,12 +4843,15 @@ static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 		f2fs_trace_rw_file_path(iocb->ki_filp, iocb->ki_pos,
 					iov_iter_count(to), READ);
 
+	dio = f2fs_should_use_dio(inode, iocb, to);
+
 	/* In LFS mode, if there is inflight dio, wait for its completion */
 	if (f2fs_lfs_mode(F2FS_I_SB(inode)) &&
-	    get_pages(F2FS_I_SB(inode), F2FS_DIO_WRITE))
+	    get_pages(F2FS_I_SB(inode), F2FS_DIO_WRITE) &&
+		(!f2fs_is_pinned_file(inode) || !dio))
 		inode_dio_wait(inode);
 
-	if (f2fs_should_use_dio(inode, iocb, to)) {
+	if (dio) {
 		ret = f2fs_dio_read_iter(iocb, to);
 	} else {
 		ret = filemap_read(iocb, to, 0);
-- 
2.33.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
