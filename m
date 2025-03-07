Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D219DA55E30
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Mar 2025 04:19:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tqOFT-0007db-Na;
	Fri, 07 Mar 2025 03:19:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tqOFS-0007dU-B5
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Mar 2025 03:19:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hW63qp44m7k+qi1NCMs08DWFhIOVdfXJFuYB+uJ9034=; b=YTDYUFkADYCv/g9+TQVH7Tpi2E
 GrEnZ6ojV6SL8zCj9gTUgRWeqLj4F14mKZyz/vXqhfMsiuNvRO/F5dAvFhRGK6nQY8uu8XSopwLZK
 6L1XR0D6VFLn7NheOSBPaaJY4uR9/RY6phqehf0PRWKC+2AZNxfVWS+SstjwB08ZYy7c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hW63qp44m7k+qi1NCMs08DWFhIOVdfXJFuYB+uJ9034=; b=R
 /b04FuRNnGmB/GYWC53n9HvI9a2shLLxOTxpsv1S6BMlT7/xVJ+jniVBX+PlB8xLWWR/q6lPTtvtK
 3iAjFh/TF8OhklYyAk4NB7XT8xU4USGvtJlE62LWFTQb3JwvglLwno47XrOzSliRL32OYGnKAytSg
 WdurAvCk5ziw2is8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tqOFI-0004Ua-7R for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Mar 2025 03:19:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0970C5C5B83
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  7 Mar 2025 03:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4A7BC4CEE7;
 Fri,  7 Mar 2025 03:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741317561;
 bh=/keky7JufEKUaL6kOFuuqPbL6o9BiIYlwIBW/tfOt24=;
 h=From:To:Cc:Subject:Date:From;
 b=Odh0RDbVygEDWWz4gVFH7MXY0pbnnggxgqYHPiefWQsNHmnMIln4n7vtO1QaufaYQ
 hFqyeIpwVICnJpBCVEBCuoSRVg+hgKg5CvUq4tzqEOovrpJTrjfK6ujWvkhdgnPD9V
 luZC2zyQJd0MXY0WTBk1nuQOVMp8vCdOtw7dwr8/XhcnnE7bfD3dkVSOrXBjwxt8KD
 xLZKA7KezNLy6e1y6eS4HTi2fyUgBRSt0fCUlaD8Adt1BoKJjgVdjoahI4LoNVG2Nd
 LiCh/fs3WKlVUWognS7rB3U2C0cB3PkI5cyFK3+89YXNXtKv02lqeyHcW4E9Sh9cYx
 gp6jE92VI2VQQ==
To: jaegeuk@kernel.org
Date: Fri,  7 Mar 2025 11:18:38 +0800
Message-Id: <20250307031838.19164-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Let's disable nat_bits by default. Signed-off-by: Chao Yu
 <chao@kernel.org> --- fs/f2fs/node.c | 3 +++ 1 file changed, 3 insertions(+)
 diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c index 56873c41436e..3148d9e44e7f
 100644 --- a/fs/f2fs/node.c +++ b/fs/f2fs/node.c @@ -3286, 6 +3286, 9 @@ static
 int init_node_manager(struct f2fs_sb_info *s [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tqOFI-0004Ua-7R
Subject: [f2fs-dev] [PATCH] f2fs: disalbe nat_bits by default
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

Let's disable nat_bits by default.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/node.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 56873c41436e..3148d9e44e7f 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -3286,6 +3286,9 @@ static int init_node_manager(struct f2fs_sb_info *sbi)
 	if (!nm_i->nat_bitmap)
 		return -ENOMEM;
 
+	/* disable nat_bits feature by default */
+	disable_nat_bits(sbi, true);
+
 	err = __get_nat_bitmaps(sbi);
 	if (err)
 		return err;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
