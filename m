Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A891E9FB001
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Dec 2024 15:35:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tPjWM-0001nB-Fl;
	Mon, 23 Dec 2024 14:34:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tPjWK-0001n2-TA
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Dec 2024 14:34:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RhZ4gz5XfqjzAHzlYGAvounA/w4eoQ9oa5T2h3IDaQM=; b=D28Ljun9vwdwyHBVNSdGELMviR
 vtsq+U2sStp4IOrSgE5TgnuHi6nKC1pUrNuA1y4QDARtnuKbha2QZe47+pNxjc5xY/Jm8u1zawwPI
 VH0/uP5q3KNwi94RTHUye623bk9PV792n8oRz1w4OXM/yiBTtuWRIUv7arni6noEijcs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=RhZ4gz5XfqjzAHzlYGAvounA/w4eoQ9oa5T2h3IDaQM=; b=M
 gQaQiDQeaRJF1sZkycZ4NAwM4uolZPgZFDA+Cy/cE5m7DhH4D8sW5OKpAE/m++E/BVGr6H+lHwXm7
 PlBBSALDg5EgXQwKrkxqmdRpbjlEuTLQaKwdH8ZxflIawnkE8Y4WcGx+R82yuKeQCA3fq/NYlFzf6
 WZwn4BzvUZg2Ti28=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tPjWK-0004CO-8m for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Dec 2024 14:34:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6C360A40F8B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 23 Dec 2024 14:32:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C811AC4CED3;
 Mon, 23 Dec 2024 14:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734964485;
 bh=bo1NMs4/YFWYdMJuYiGmiCfBcLSkozOTWwUXUhPmLa4=;
 h=From:To:Cc:Subject:Date:From;
 b=pIX178mmbdMEG91W9KDTnkDkLeDx/KModlvqyWdQm6CAwBUqn0BYPQYQgYpywH5on
 jP84xltWDfx6iVKlwt+bdx+/kpjYg/2ieYAsLYtlhVSg94bctrGOIL4oYyAB+FNZre
 UI7YwYg9UC5qSsGtarGmc+7tTeSM8HClR1w0NVBhnVgKFDY/+crClDlopnAMj/SoTR
 zHR+Pwh+f6sdUne2f5hPxhG+UrNwEprrchxFaVhXF0mCpUs0CGv5LnRxaROEiN3CDe
 Lt/9om+stuEJRoG6iYBlNtpn50U1BJQtcTymjnA3gYDxAIdSA8ySPD4InatpcUn1qE
 lee+hrqyZ6ksw==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Sat, 21 Dec 2024 16:23:44 +0800
Message-Id: <20241221082345.196029-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Then, f2fs/* testcases can use this wrapped common helper
 instead of raw codes. Suggested-by: Zorro Lang <zlang@kernel.org>
 Signed-off-by:
 Chao Yu <chao@kernel.org> --- v3: - adapt _mkfs_dev() to support f2fs,
 preparing
 for following use in f2fs/008. common/rc | 3 +++ 1 file chan [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tPjWK-0004CO-8m
Subject: [f2fs-dev] [PATCH v3 1/2] common/rc: support f2fs in _mkfs_dev()
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Then, f2fs/* testcases can use this wrapped common helper instead of
raw codes.

Suggested-by: Zorro Lang <zlang@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v3:
- adapt _mkfs_dev() to support f2fs, preparing for following use
in f2fs/008.
 common/rc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/common/rc b/common/rc
index 7b5bc0b4..ecac2de8 100644
--- a/common/rc
+++ b/common/rc
@@ -833,6 +833,9 @@ _try_mkfs_dev()
     ext2|ext3|ext4)
 	$MKFS_PROG -t $FSTYP -- -F $MKFS_OPTIONS $*
 	;;
+    f2fs)
+	$MKFS_PROG -t $FSTYP -- -f $MKFS_OPTIONS $*
+	;;
     xfs)
 	$MKFS_PROG -t $FSTYP -- -f $MKFS_OPTIONS $*
 	;;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
