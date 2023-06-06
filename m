Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 965FA723772
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Jun 2023 08:19:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6Q2C-0002Pm-A7;
	Tue, 06 Jun 2023 06:19:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q6Q2B-0002Pd-DR
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 06:19:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aSrRl1VKMzdnJGIn1z6OFAGMbXdRUFBYi354p0ptm+g=; b=dWtH+1aJ3Vm3Y1rz2bkj3ILd6l
 +io3q4tDH09fxiuXQOVRktQNBOVYRBL4FZvrW3Bic4HcMPo7FZc0vKrHfZmeKtt/p9ylb9Ss5M41i
 1k11eECoUg9+5wEAhG0WK6qqY0aEhIv7lhSUcz9iAgvqn8eLWQcC+R5vf5YuGGJnngMA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=aSrRl1VKMzdnJGIn1z6OFAGMbXdRUFBYi354p0ptm+g=; b=S
 mEakH6Oez/yxQdkNuQtQsufFSwBK3SrJowoxWdiljNWj4xkVS5ms7+CNHIBZ6W69M3eD+bR++rNal
 r4aJ9tZw0F7JxkwjWxMpU/1G4aTjk9eHjaX3oI2eBDCzslk7uzAOUGzU2KNcquP+0ypFVk8tP+wb0
 RNXbCa4s3DCcWj8c=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q6Q2B-0001Rj-8A for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 06:19:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D38C4624F7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  6 Jun 2023 06:19:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C882C4331F;
 Tue,  6 Jun 2023 06:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686032345;
 bh=C6VkHFq2s9uK+TWCjxzRIUHXr213fU3r8aFIxm4ay+U=;
 h=From:To:Cc:Subject:Date:From;
 b=iRmSnBbpiE3CrgXLfeEeoAGIzXI2Vr1zU2SFIIibUVmjH+Cjkpb6JDLg6sD9nAjKv
 DwwHxdn8dCoFuvXxrEK/5TLodpuuW6VBotbXXJo8TgIK/loUBaCKZZY68hMja+9qgV
 9DJ2AR0LU/XVolkeq6mTEMAkYyd1iZIjoCdttco/DdbVTyuHy3V3bBsIL3if07Eis9
 i1uIbxNkevbUUpAszIf11V3P2sCrsjn2SAixelulzLLiZiBwtmYuJCTlBdC9PkKHoz
 k+qhb8/CJzWkPpCOJ2gDz5Qx7MvZpVo8s6inemrncOs5RuXbHt/WAq4wBD5Nxp+Dig
 9E6j6tP2/pt0Q==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue,  6 Jun 2023 14:19:01 +0800
Message-Id: <20230606061901.1179970-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  freeze_super() can fail, it needs to check its return value
 and do error handling in f2fs_resize_fs(). Fixes: 04f0b2eaa3b3 ("f2fs: ioctl
 for removing a range from F2FS") Fixes: b4b10061ef98 ("f2fs: refactor
 resize_fs
 to avoid meta updates in progress") Signed-off-by: Chao Yu <chao@kernel.org>
 --- fs/f2 [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q6Q2B-0001Rj-8A
Subject: [f2fs-dev] [PATCH] f2fs: check return value of freeze_super()
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

freeze_super() can fail, it needs to check its return value and do
error handling in f2fs_resize_fs().

Fixes: 04f0b2eaa3b3 ("f2fs: ioctl for removing a range from F2FS")
Fixes: b4b10061ef98 ("f2fs: refactor resize_fs to avoid meta updates in progress")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/gc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 8cbe4839f640..de893f4f60e1 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -2271,7 +2271,9 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
 	if (err)
 		return err;
 
-	freeze_super(sbi->sb);
+	err = freeze_super(sbi->sb);
+	if (err)
+		return err;
 
 	if (f2fs_readonly(sbi->sb)) {
 		thaw_super(sbi->sb);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
