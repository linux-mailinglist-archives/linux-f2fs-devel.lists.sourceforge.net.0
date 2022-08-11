Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1A45908CB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Aug 2022 00:55:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oMH58-0005z4-Ol;
	Thu, 11 Aug 2022 22:55:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1oMH57-0005yx-Tu
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Aug 2022 22:55:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tEetL5bBXmULnpR4y7+evQFuTNvhmEP2hxKpkbBoWMs=; b=OKL4Zzq0mgYaeyj/M80dj0P+4c
 hINZj3nYWWWI1Ze0ik+HhzVeB9vbWpMhy/lbpbdKSykph0kXYqTbpsdw5mjPc6p0IKtn6lQPCSNjZ
 LdN3ZHdVSIGanItoa2piPX3Ms1NpCx+vkNpJjcQe+uT3gJqTGNS4OHulEmEKqGWi50M8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=tEetL5bBXmULnpR4y7+evQFuTNvhmEP2hxKpkbBoWMs=; b=I
 uEuoDdW0B8d7rB55X65uoIbOFaap/MyoCeBOefMZepZknRbll6uSig+qJzpD0ke15rrekLs/PHnhr
 GjEcIcKdvVoCX/d6MvwwK3NXOgpcTbWBsStqzy3DZ8zCyFuIxeaGtLWvO3HTyHNXrOAqef/sUZact
 Exm8iSmYbp18SYWM=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oMH56-00CO5Y-3p
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Aug 2022 22:55:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 41F11B82300
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 11 Aug 2022 22:55:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA759C433D6;
 Thu, 11 Aug 2022 22:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660258499;
 bh=ycUQg3EfV3v4qlL6WPECdZb5Kbc9wh21Vkk4bXPCQE8=;
 h=From:To:Cc:Subject:Date:From;
 b=ZfGRPM+5Hbj+TjCjF2RdOsqXvKIrZw4ySN6OMBRbjqaC/OMnx2GDyjQVWH3rdAzZ6
 e8YvFuhtNGzDU+X873B2+VZB4vHoQ5hPil55vppAunZ5XmLWuV6G5xYGSBAjS1u9n3
 Wkb8vLKSRHuxHgrPHLTm+lzXx7J5bQdpOS3OO9LWkF5iOJB92nTu2yjas/9YhpCgWf
 91r9kozclbD8+ApDDsoHBSr7oNBb24OhF1XfyH836cfjLWFFoRTMn7l/rL/KoEQJnU
 dBV/hov2FubePJx9E9MF9+kZapE8eKrROpfGIzqwt0o01MS46ggGChzeerwTSRq45c
 xZ6fTloK9PxFQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 11 Aug 2022 15:54:54 -0700
Message-Id: <20220811225454.2125297-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.37.1.559.g78731f0fdb-goog
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: ATGC is using SSR which violates zoned device. Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- fs/f2fs/super.c | 4 ++++ 1 file changed, 
 4 insertions(+) diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c index
 2451623c05a7..212ec2b4926b
 100644 --- a/fs/f2fs/super.c +++ b/fs/f2fs/super.c @@ -1298,6 +1298,10 @@
 static int parse_options(struct super_block *s [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oMH56-00CO5Y-3p
Subject: [f2fs-dev] [PATCH] f2fs: zoned device does not support ATGC
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

ATGC is using SSR which violates zoned device.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/super.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 2451623c05a7..212ec2b4926b 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1298,6 +1298,10 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			F2FS_OPTION(sbi).discard_unit =
 					DISCARD_UNIT_SECTION;
 		}
+		if (test_opt(sbi, ATGC)) {
+			f2fs_err(sbi, "Zoned block device doesn't support ATGC.");
+			return -EINVAL;
+		}
 	}
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-- 
2.37.1.559.g78731f0fdb-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
