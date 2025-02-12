Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B64A31B9A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Feb 2025 02:55:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ti1y2-0000Ug-Fy;
	Wed, 12 Feb 2025 01:55:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ti1xz-0000Ua-4F
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Feb 2025 01:55:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OhmtyhZeVx7zqirQmPnCxn6b3XjN8LEBW3k/m7pafTU=; b=Ce8h+KfOAU+IO/b9Cl8zOblqw1
 PQaIBgZlFcFHD3ikcyB2HSQk91JcYsoeomOVMun0dc3WCaTurYP7ITAUP02Gzc18YUJK0CeJKSyKT
 jIUjhhZqnosKkyuTKBsB4UJ9mGXY+valqDHMZ2qYVu5d5/+PDT7WK0/EzjEqaWWHnfFI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OhmtyhZeVx7zqirQmPnCxn6b3XjN8LEBW3k/m7pafTU=; b=G8I9+HVPfVesPM0p/GNZ0ScQRI
 KJ4SzowNVc7ssymK/1MM5GvJrNVqDI3AA22tQsMJrj7Y8QaWaXfmcT5hu4o7m+8rKQmtJZTA7/8zk
 SNa6R7FDBROa2YhuNWL1b0HDRkVuxeQNlzNB/uNEY4sl0qomObHGNRADp2WnUBBzfMPc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ti1xy-0006nf-Gt for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Feb 2025 01:55:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9553E5C59F3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Feb 2025 01:54:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEAB9C4CEE5;
 Wed, 12 Feb 2025 01:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739325295;
 bh=K4ihjAlWy2h4llZLGypkm22M0Vmbx1QNncg3WdOCYpg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HDtEYgV9OLcFn3FVEl44az+67gxXQd1OuWCFOw8DWKz0Xad4vHDwNb0P9fGHez4ik
 mH06Y+NPQq1JYf0SGR4WpxyC+YiRTsd633I+Oc40/ARLeDK8CqhUx/3UdGlfLfzWMd
 Y4B8o1rORaln24eyyl1ujVkv8HP+9hrJEWbb0KWlwrJIUuibckKKN8cO32P7yz194g
 E0furaTOXRNOFHcKfpseMtjkX4wRnQ3O27/Hnv3mZn9eSXWO9eZNo/mIeQ2XsglNeO
 r8KnvU07RkIgGs73Bh0lfJn7tVCsvnqyoCUB/IbYcoJw5yFNuWXMspuNz8CAe33zfm
 FWn26e3rE8uRQ==
To: jaegeuk@kernel.org
Date: Wed, 12 Feb 2025 09:54:13 +0800
Message-ID: <20250212015413.666375-2-chao@kernel.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
In-Reply-To: <20250212015413.666375-1-chao@kernel.org>
References: <20250212015413.666375-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -6.7 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  To show call stack, so that we can see who causes critical
 error, note that it won't call dump_stack() for shutdown path. Signed-off-by:
 Chao Yu <chao@kernel.org> --- fs/f2fs/super.c | 2 ++ 1 file changed,
 2 insertions(+)
 Content analysis details:   (-6.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ti1xy-0006nf-Gt
Subject: [f2fs-dev] [PATCH 2/2] f2fs: add dump_stack() in
 f2fs_handle_critical_error()
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

To show call stack, so that we can see who causes critical error, note
that it won't call dump_stack() for shutdown path.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 24ded06c8980..1af78b75906b 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4221,6 +4221,8 @@ void f2fs_handle_critical_error(struct f2fs_sb_info *sbi, unsigned char reason)
 
 	if (shutdown)
 		set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
+	else
+		dump_stack();
 
 	/*
 	 * Continue filesystem operators if errors=continue. Should not set
-- 
2.48.1.502.g6dc24dfdaf-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
