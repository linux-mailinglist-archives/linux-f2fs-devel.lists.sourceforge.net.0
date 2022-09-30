Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC4D5F1659
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  1 Oct 2022 00:54:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oeOtK-0006z0-Ox;
	Fri, 30 Sep 2022 22:53:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1oeOtJ-0006yu-OW
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Sep 2022 22:53:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3NBet5xzlxyQmzY2wkUm28cYmWLVnXeJ/Ln/fl61FAw=; b=b5FIdfW5RYco+ILTxYoKiGpqpR
 +ANcsIQ7T95WzCcX9J19aScfArdUdtYYHYORwNhu0T+LJGEIhODyKMgSzwS63KSW3N079p8Uo19VT
 hwP/+cRyNjI0IhF+QJAWrx/1AmhNUaIYYrvLkIJs/MnAUTagobUlGg/IErpW/RRdslZ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3NBet5xzlxyQmzY2wkUm28cYmWLVnXeJ/Ln/fl61FAw=; b=X
 GiNb7E0Gz7anvLWIOWt4rvempkc38dZE4CggAIH7eHwK+Xe+Sbrq7SjGi3GAnd47U633crwSU/AnC
 AgLQSUBb8rjEd/s0P8KqX6bMW1v77TA2Y+Rhe9Qs4WsGf3yyZeDlGF3VAPFBieISlQH8xGNzcP1RO
 YcpcIWpj8zCU2wD0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oeOtF-008M2p-G7 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Sep 2022 22:53:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DF57B62521;
 Fri, 30 Sep 2022 22:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F41C433D6;
 Fri, 30 Sep 2022 22:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664578424;
 bh=9EXgBqrR50Mngy3h5BZ5N6yyftKrfXoBYvd3zN2XaC8=;
 h=From:To:Cc:Subject:Date:From;
 b=oiAvvtZoqckXC0j50I1AAJK9Sj52GZMnBzweqAFlDMwx8zRtiZI1ZM8biXckHsCAc
 usYt8weLCpsJDAQ4sYRARnXCJZ2XdOia7MNwYc58+/0hRxTjg7AJY/pvXLRSqKsvoJ
 zqARasueqVLVv+ez0nM3Q4pykRMLRKvePKM3sYhN6lLome/3AGsZWCdT/2SXcZL2Vp
 8rvAKms+uXOpDJxGWu0yJfZbnXm+WjcucQuHUu/I511qM7R2zOHb88Dzp5kNgHEyYL
 JWYGuZt9i9foVEsMyFfygCzhPWKP4QcIa4qpV4V7RBB28XL7rgaIMzNp6RHzIhLG27
 k6ZUodc95znlQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 30 Sep 2022 15:53:42 -0700
Message-Id: <20220930225342.1057276-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This reverts dbf8e63f48af ("f2fs: remove device type check
 for direct IO"), and apply the below first version, since it contributed
 out-of-order DIO writes. For zoned devices, f2fs forbids direct IO and forces
 buffered IO to serialize write IOs. However, the constraint does not apply
 to read IOs. 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oeOtF-008M2p-G7
Subject: [f2fs-dev] [PATCH] f2fs: allow direct read for zoned device
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

This reverts dbf8e63f48af ("f2fs: remove device type check for direct IO"),
and apply the below first version, since it contributed out-of-order DIO writes.

For zoned devices, f2fs forbids direct IO and forces buffered IO
to serialize write IOs. However, the constraint does not apply to
read IOs.

Cc: stable@vger.kernel.org
Fixes: dbf8e63f48af ("f2fs: remove device type check for direct IO")
Signed-off-by: Eunhee Rho <eunhee83.rho@samsung.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/f2fs.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 2ed00111a399..a0b2c8626a75 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4535,7 +4535,12 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
 	/* disallow direct IO if any of devices has unaligned blksize */
 	if (f2fs_is_multi_device(sbi) && !sbi->aligned_blksize)
 		return true;
-
+	/*
+	 * for blkzoned device, fallback direct IO to buffered IO, so
+	 * all IOs can be serialized by log-structured write.
+	 */
+	if (f2fs_sb_has_blkzoned(sbi) && (rw == WRITE))
+		return true;
 	if (f2fs_lfs_mode(sbi) && (rw == WRITE)) {
 		if (block_unaligned_IO(inode, iocb, iter))
 			return true;
-- 
2.38.0.rc1.362.ged0d419d3c-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
