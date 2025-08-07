Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D058CB1D0FC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Aug 2025 04:45:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OFNo3VYITbV8dOBSklovIO/eujRN3qGHAlAc8OO7yyw=; b=I33ohjD/uupFXIAHitYrikVVQ+
	+aBYNNf11KCucrzFfCjLel5IoU7V5H604VvauNONn+sK7k2TahSTbMiVH0Fpo1yGmvUA+MG6EBXg5
	sWzjZ7jbU2LRnmi10pyEPOWInbkJerAKYW2assn/oGk2LZpPnwCO/wndXMkWDPM0qwBk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ujqd5-0008G2-Kq;
	Thu, 07 Aug 2025 02:45:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ujqct-0008Fm-0b
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Aug 2025 02:45:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jzmDjHM17c0w8xglS9Ysqt7WPVVJTDMTk+/bJE6Mxrg=; b=jm9fr402hS0jEcKpl1+2dpcXUa
 2ts9+MTQzg83WkefPhoao5lx3KSzptPaXe6rUqHOKKHbX7BsiRlNTi5iHndAmlh+B+wgfpDgpYVeM
 UZQeINPEIoysTz4Cng8NSAQ9qBqaKMCgXO8qS27o9k8N08IreLyVQVTgcthQ350xWvi8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jzmDjHM17c0w8xglS9Ysqt7WPVVJTDMTk+/bJE6Mxrg=; b=D
 43Bi8uN+WwNx3ZNW3362y+8UveYrl16WcYlUUPvUeVWBXpGD4imBamDI/GBZEoBSomcD4Qv5u8ipQ
 aXLS7FFVg/ZKyNt9E2JZpUF+3ZT1Z8Lgb9FgLNLMF4RP5NQKnr6sKHVnZPwjVTTHMCFi84F5RvAtU
 0Vv6rN2oylOOw3F0=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ujqcr-0000vx-CS for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Aug 2025 02:45:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C467EA4DF0C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  7 Aug 2025 02:44:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A009FC4CEE7;
 Thu,  7 Aug 2025 02:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754534699;
 bh=0sowud6qST+D3ZS+he0aoMOuInDl2T+G5Py2Sdm/UBY=;
 h=From:To:Cc:Subject:Date:From;
 b=dNsDXSnhG679iVa7bTJ6GYecajsraxHQK/Th4n/wfjl29rYAWgO2uVywJPfeBXdNm
 MsuQB+vHvDZ0ykblwPJbqhls+s32IAgNPhstToCRluhIsb26StjXDjNRF2w71TvVqV
 ahn+K0jvIZvmD25baOh3ilS/XgRD0ogWxu49JGg3F4gBXAu8WK5H255jXDL4HlWohV
 18exdt08jna6VJJlewZr+o17jdfqNIXn9h1EMvfGOEo2GI3YI6xGkbMJ6eeWgUtUy1
 qz8Tew9dej0q7MK6w68DBGzjqT7JmYNyEOGCkjAKQcN0xktBONGCP+zAqc4kA4AA9X
 /9YbINeO9pyUw==
To: jaegeuk@kernel.org
Date: Thu,  7 Aug 2025 10:44:50 +0800
Message-ID: <20250807024451.3805388-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Let fsck recognize STOP_CP_REASON_CORRUPTED_NID for repair.
 Signed-off-by: Chao Yu <chao@kernel.org> --- fsck/mount.c | 1 +
 include/f2fs_fs.h
 | 1 + 2 files changed, 2 insertions(+) diff --git a/fsck/mount.c b/fsck/mount.c
 index a1c4cbb..5399f16 100644 --- a/fsck/mount.c +++ b/fsck/mount.c @@ -730, 6
 +730,7 @@ static char *stop_reason_str[] = { [STOP_CP_REASON_FLUSH_FAIL]
 = "flush [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ujqcr-0000vx-CS
Subject: [f2fs-dev] [PATCH] fsck.f2fs: recognize STOP_CP_REASON_CORRUPTED_NID
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Let fsck recognize STOP_CP_REASON_CORRUPTED_NID for repair.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/mount.c      | 1 +
 include/f2fs_fs.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/fsck/mount.c b/fsck/mount.c
index a1c4cbb..5399f16 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -730,6 +730,7 @@ static char *stop_reason_str[] = {
 	[STOP_CP_REASON_FLUSH_FAIL]		= "flush_fail",
 	[STOP_CP_REASON_NO_SEGMENT]		= "no_segment",
 	[STOP_CP_REASON_CORRUPTED_FREE_BITMAP]	= "corrupted_free_bitmap",
+	[STOP_CP_REASON_CORRUPTED_NID]		= "corrupted nid",
 };
 
 void print_sb_stop_reason(struct f2fs_super_block *sb)
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index e7b2971..1686b9a 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -741,6 +741,7 @@ enum stop_cp_reason {
 	STOP_CP_REASON_FLUSH_FAIL,
 	STOP_CP_REASON_NO_SEGMENT,
 	STOP_CP_REASON_CORRUPTED_FREE_BITMAP,
+	STOP_CP_REASON_CORRUPTED_NID,
 	STOP_CP_REASON_MAX,
 };
 
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
