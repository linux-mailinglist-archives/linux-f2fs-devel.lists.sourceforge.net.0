Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D84A96842
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Apr 2025 13:57:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u7CFq-0001Gl-G3;
	Tue, 22 Apr 2025 11:57:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u7CFo-0001Gf-VP
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Apr 2025 11:57:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=twxrF7K4I/DD344/etHaRaPMzZxeSfVk8nQl3WpYjug=; b=nB5gyXA7910x/YtE8YG8nfZ/Fe
 zXt3Ni86IIy7ZVmUfOApJPv6kiDk4z4I5ezsZu6D4BtA/pRESpPPt+ksv+D5j4bmx0XqhR1Iddu0K
 1060I7G/Ye3k6zAN0EKMqyETQ0v/NX1/Sd6NN1VWBnl+sjcJ5u7vFPz2K/qRTotLvFeU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=twxrF7K4I/DD344/etHaRaPMzZxeSfVk8nQl3WpYjug=; b=P
 h2hvH668YAskle8rti2FVILYwlao7GvXLU8z1WwM1JaVd8xbVMc/OuyvmLt0ej7jyEsE8DL7dpAZb
 6v2LanSYpNimr/qAozZVRPvTNxeFZqHVVZKArjoOu8E4vNAMJxFg7wuOi7DB/KPditQc1zKxfVaA3
 9RFf16ebyDBamHac=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u7CFY-0001y6-Qf for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Apr 2025 11:57:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 59B2D61362
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Apr 2025 11:56:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EEF4C4CEEA;
 Tue, 22 Apr 2025 11:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745323030;
 bh=RbRloADDTttxIHd8FxjNma67/u13h9Fs54+hvlJV//Q=;
 h=From:To:Cc:Subject:Date:From;
 b=u4uBJGU5NCSyU4nS2ju8iMIy2fM81JDDmd6KtY0MzTBy2AhE6ICOVAhi3H1ZTj6TA
 +BVVVc1aiGKjUMuSNSoXldYTNP/p/V9sK1WEJQgHWMqPsK2fY0tYsdWfVcQ4OSfPWJ
 a6eo7w+0ipT44opn+39gAG3fF12WCnLA3acaVstxaWPFlhEZkSSv1xJZW2pgFU5Tqu
 BTtC6vv3CNUiH8xgjQYpNavpjLii+4feThLiJgv1gcUhgfJ5CrT211ikOmlQFz1dla
 x83mBG7y7armgTfWQEC8LdGenjXUED9JPDqtreKqrkYufejQfIB0JS3WXUBnAbaa9a
 2jZiX9nE0YzpQ==
To: jaegeuk@kernel.org
Date: Tue, 22 Apr 2025 19:57:00 +0800
Message-ID: <20250422115700.126023-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
MIME-Version: 1.0
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Let fsck.f2fs recognize STOP_CP_REASON_CORRUPTED_FREE_BITMAP.
 Signed-off-by: Chao Yu <chao@kernel.org> --- fsck/mount.c | 1 +
 include/f2fs_fs.h
 | 1 + 2 files changed, 2 insertions(+) diff --git a/fsck/mount.c b/fsck/mount.c
 index 4fd26a6..08b2687 100644 --- a/fsck/mount.c +++ b/fsck/mount.c @@ -729, 6
 +729,7 @@ static char *stop_reason_str[] = { [STOP_CP_REASON_UPDATE_INODE]
 = "upd [...] 
 Content analysis details:   (-0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u7CFY-0001y6-Qf
Subject: [f2fs-dev] [PATCH] fsck.f2fs: recognize
 STOP_CP_REASON_CORRUPTED_FREE_BITMAP
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

Let fsck.f2fs recognize STOP_CP_REASON_CORRUPTED_FREE_BITMAP.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/mount.c      | 1 +
 include/f2fs_fs.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/fsck/mount.c b/fsck/mount.c
index 4fd26a6..08b2687 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -729,6 +729,7 @@ static char *stop_reason_str[] = {
 	[STOP_CP_REASON_UPDATE_INODE]		= "update_inode",
 	[STOP_CP_REASON_FLUSH_FAIL]		= "flush_fail",
 	[STOP_CP_REASON_NO_SEGMENT]		= "no_segment",
+	[STOP_CP_REASON_CORRUPTED_FREE_BITMAP]	= "corrupted_free_bitmap",
 };
 
 void print_sb_stop_reason(struct f2fs_super_block *sb)
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 12b08fb..0537dcb 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -739,6 +739,7 @@ enum stop_cp_reason {
 	STOP_CP_REASON_UPDATE_INODE,
 	STOP_CP_REASON_FLUSH_FAIL,
 	STOP_CP_REASON_NO_SEGMENT,
+	STOP_CP_REASON_CORRUPTED_FREE_BITMAP,
 	STOP_CP_REASON_MAX,
 };
 
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
