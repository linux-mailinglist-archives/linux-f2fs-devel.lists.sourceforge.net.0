Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6130BA59332
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Mar 2025 12:57:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1trblK-00078A-Rm;
	Mon, 10 Mar 2025 11:57:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1trblI-000783-Uj
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Mar 2025 11:57:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fH2vtS3fv4v3awYAF8Ypwb4QYDBtFZqYsjC+yhbm0jw=; b=af9qhoAuqZv2IYBd83ZIqMTFnO
 mquoFk0T9d/579DQPk7RGjVa5hQzZ3oLLOpEVm1DIvgTFkXGLihNVwVYAUL8aAEwqP3d8AomSV8N+
 ukf4hTaPzF8EVe8OaQYV+EmediS/jkHQ++Xf9zK0eJvz/sI54GAzs5mqn3X3rjjE72Cw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fH2vtS3fv4v3awYAF8Ypwb4QYDBtFZqYsjC+yhbm0jw=; b=mfQZKzYzq27I14o9qiIAOrESKD
 S4NWBJv9wZiqeftxVOuJMEqRszglxDSU5fYjoQlxcg14DoIpfDpl+1ZnfR6Jh1u2C/3Y3+1DyGBHz
 uD1PHKTpozaMBUM7D9Xl9mv5XTWdvXFDyLf14JTGOouhDsMOgJGSqSAvvtFLQndHiIAM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1trblH-0001CC-6A for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Mar 2025 11:57:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3006C5C5FA9;
 Mon, 10 Mar 2025 11:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F32FC4CEEF;
 Mon, 10 Mar 2025 11:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741607842;
 bh=APeSVQrXiPnNxYprcQjSueJT4IeOKzONOtuiiyk7ccg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gYNgfe4DdC0I6mGTorwXb4AwNSt9FvSx7wjvo6i2EfOcNW/YLlqqXbHkMI7zQA4ZT
 we1Wx/1kVE/Zt75TvFMg4NkCiqf7iHGgFwlMASxxtCf44KB3rEtB8ROH/BMMJDA1BU
 jIWOf6rsuTJVvMOqs6zAJTWEIHYL5m94KvrO7LcF/27+ScktWTBsgd/ucHNaP4y6k8
 TnX+USBWptYGGYN8C/eQiPAT4dUN43f0hj/8moparKNp1OyTgbMK9EOyobk2eDL1HI
 kihnr6QMOUMzWff4IGZzdkbm6XZtCKaYZuOFnEGsmH8LGxUszj6rqremdKbhRJxpQP
 x8aCsuN7PZ0TQ==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Mon, 10 Mar 2025 19:56:20 +0800
Message-ID: <20250310115621.3441518-3-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
In-Reply-To: <20250310115621.3441518-1-chao@kernel.org>
References: <20250310115621.3441518-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Support f2fs in _repair_scratch_fs(), and use -f to repair
 the image forcely. Cc: Jaegeuk Kim <jaegeuk@kernel.org> Signed-off-by: Chao
 Yu <chao@kernel.org> Reviewed-by: David Disseldorp <ddiss@suse.de> --- v2:
 - no changes common/rc | 3 +++ 1 file changed, 3 insertions(+) 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1trblH-0001CC-6A
Subject: [f2fs-dev] [PATCH v2 3/4] common/rc: support f2fs in
 _repair_scratch_fs
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
Cc: jaegeuk@kernel.org, David Disseldorp <ddiss@suse.de>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Support f2fs in _repair_scratch_fs(), and use -f to repair the image
forcely.

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
Reviewed-by: David Disseldorp <ddiss@suse.de>
---
v2:
- no changes
 common/rc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/common/rc b/common/rc
index ca755055..bf24da4e 100644
--- a/common/rc
+++ b/common/rc
@@ -1500,6 +1500,9 @@ _repair_scratch_fs()
 	# want the test to fail:
 	_check_scratch_fs
 	;;
+    f2fs)
+	fsck -t $FSTYP -f $SCRATCH_DEV
+	;;
     *)
 	local dev=$SCRATCH_DEV
 	local fstyp=$FSTYP
-- 
2.48.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
