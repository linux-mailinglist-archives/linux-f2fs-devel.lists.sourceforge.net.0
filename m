Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0381B64DD3A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Dec 2022 16:04:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p5pmA-00028b-Lq;
	Thu, 15 Dec 2022 15:03:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1p5pm0-00028M-N4
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Dec 2022 15:03:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ddqcWl9djDGmRaVcjcRwrBsXdNCed8EFy9fIXc09C2k=; b=VNwB/F/dEgGHyXhKWskhlLtTGC
 CjaP0Q/sfSwEJ+fjN000b7kCq2VaaUx3kFYLs8KOdb4pQJez+YeSiI0Yy4T4YRENY09iPqACSGYuL
 td0zbYRXp9HXMAuiSBVAFshTzNnbZAUQ5FoxiDc9hqBLb4hN+ad/EXof/OXCm0HFzIXw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ddqcWl9djDGmRaVcjcRwrBsXdNCed8EFy9fIXc09C2k=; b=R
 GlgZA/ugp1mhf+5xBLxp5kyn9/1OkycHCpOGobaoa3R696s2Z4pEezo0FvEre+wEbRbM6kXTxr6HP
 IEAF9q2NL364yuhHyxCkbJNWCfZJBZK0WXuu9vtPXaxkN3gGF3vzZha1BSmx2fP8uUrFL6wvzBrAq
 pERQso6iCmcT803w=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p5ply-000YA5-OT for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Dec 2022 15:03:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 729C0B81BB1;
 Thu, 15 Dec 2022 15:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E355C433D2;
 Thu, 15 Dec 2022 15:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671116619;
 bh=in5CD1zMVADf1W0JGm7pLPBBonN1e05ohjCzNE+pQKY=;
 h=From:To:Cc:Subject:Date:From;
 b=N0gJMnnV22ePOdxgEKgpMWrhNDqEdffrWTnDAtsLLXSyRKLVMB9IHXaXxDCvLhUXp
 IhTok1aPSo6HRj795Dp2Y/SVaPbis8AEIXBOokvIEDmdIWE3jtgdaFAvx3BcCcOh7k
 w8XU/WwHtB7FMXKecAOOEkLyGKYn/Hb0ZYfq4tlrYxsCBK3GabxChEu/6gzD/zUYuZ
 fPaHGwSdOvgjGZHBNS4oVST/7muEs9pnlBvQ5mj5loK15I72joVcVcHNxvxmk4TJH8
 /x23FGAx/gbby3hq3J4TEcPyyhaHUnZx6xCWNupdiuNSkmJqeZ9CHY8AIfZROL7tb+
 06zcy6kXPw1bQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 15 Dec 2022 23:03:30 +0800
Message-Id: <20221215150330.39240-1-chao@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: We supported configuring fault injection parameter via sysfs
 w/ below commits, however, we forgot to add doc entry,
 fix it. commit 087968974fcd
 ("f2fs: add fault injection to sysfs") /sys/fs/f2fs/fault_injection/fault_*
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p5ply-000YA5-OT
Subject: [f2fs-dev] [PATCH v2] f2fs: add missing doc for fault injection
 sysfs
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

We supported configuring fault injection parameter via sysfs w/
below commits, however, we forgot to add doc entry, fix it.

commit 087968974fcd ("f2fs: add fault injection to sysfs")
/sys/fs/f2fs/fault_injection/fault_*

commit 1ecc0c5c50ce ("f2fs: support configuring fault injection per superblock")
/sys/fs/f2fs/<device>/fault_*

Cc: Sheng Yong <shengyong@oppo.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- fix to handle merge conflict correctly.
 Documentation/ABI/testing/sysfs-fs-f2fs | 39 +++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 9e3756625a81..aaa379bb8a8f 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -669,3 +669,42 @@ Contact:	"Ping Xiong" <xiongping1@xiaomi.com>
 Description:	When DATA SEPARATION is on, it controls the age threshold to indicate
 		the data blocks as warm. By default it was initialized as 2621440 blocks
 		(equals to 10GB).
+
+What:		/sys/fs/f2fs/<disk>/fault_rate
+Date:		May 2016
+Contact:	"Sheng Yong" <shengyong@oppo.com>
+Contact:	"Chao Yu" <chao@kernel.org>
+Description:	Enable fault injection in all supported types with
+		specified injection rate.
+
+What:		/sys/fs/f2fs/<disk>/fault_type
+Date:		May 2016
+Contact:	"Sheng Yong" <shengyong@oppo.com>
+Contact:	"Chao Yu" <chao@kernel.org>
+Description:	Support configuring fault injection type, should be
+		enabled with fault_injection option, fault type value
+		is shown below, it supports single or combined type.
+
+		===================      ===========
+		Type_Name                Type_Value
+		===================      ===========
+		FAULT_KMALLOC            0x000000001
+		FAULT_KVMALLOC           0x000000002
+		FAULT_PAGE_ALLOC         0x000000004
+		FAULT_PAGE_GET           0x000000008
+		FAULT_ALLOC_BIO          0x000000010 (obsolete)
+		FAULT_ALLOC_NID          0x000000020
+		FAULT_ORPHAN             0x000000040
+		FAULT_BLOCK              0x000000080
+		FAULT_DIR_DEPTH          0x000000100
+		FAULT_EVICT_INODE        0x000000200
+		FAULT_TRUNCATE           0x000000400
+		FAULT_READ_IO            0x000000800
+		FAULT_CHECKPOINT         0x000001000
+		FAULT_DISCARD            0x000002000
+		FAULT_WRITE_IO           0x000004000
+		FAULT_SLAB_ALLOC         0x000008000
+		FAULT_DQUOT_INIT         0x000010000
+		FAULT_LOCK_OP            0x000020000
+		FAULT_BLKADDR            0x000040000
+		===================      ===========
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
