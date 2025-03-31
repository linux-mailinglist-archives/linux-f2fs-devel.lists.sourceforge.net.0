Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A1BA75E0D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 05:01:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tz5Oo-0001DS-Df;
	Mon, 31 Mar 2025 03:01:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tz5On-0001DG-88
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 03:01:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TsnnsTrnFJhl8fEYA5FxwatHi5rUFkmCpPMOrVSmzJc=; b=Y2Xo1cYU71jXt3cUp2INnqqsnL
 xuBRLPMZk3pcGZ4dBgDJ8hhgJlia8JXYRN7mzFZPffzhEFa2wTmtZKVoy0P9uA5vddWyrMLDeyef4
 +chdqQ77/HKzlbeHsjtKnGN82KyxjtobuKv/wn+wquIVArsPB25fNV04q5dPfIRGFYKM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TsnnsTrnFJhl8fEYA5FxwatHi5rUFkmCpPMOrVSmzJc=; b=IFx31zqjsetLkbTvvg9JD1pYJg
 VBEyjjDVLA9JsnQQ8Ka5QjjYXm9zlWvJ/43NSjNFwKbwk/FYvoInHIDOknhk5o6P+c8g3YkWEjSoe
 yBgQy8tQSYlY6TJXVKkhz4kLek3oRR65KI1dvHr4Cnv78NXu0XEJepltv7Lyakxq3Fp0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tz5On-0003UZ-Fb for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 03:01:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2ED4A5C4030
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 31 Mar 2025 02:58:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDA74C4CEED;
 Mon, 31 Mar 2025 03:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743390071;
 bh=Jk0lyz1OnD5x5u/g1U1ZQ4V9AbwF9rbffTSHMwqi640=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XJKOlYNU+Wvm+6W370CKif+GShtljqKOyFrz4426JkE10wRclTLtUlcLXkS9Zu6XB
 x6RM/BoFAyyoXqGMPJgaXrhBLyoTpeFB841sQGW5yyhHSHGt+hIkOZvZ6m6k+s0LoI
 FAOnakYjdBYcDXkoY8pyN7G2kmvdGXfdApgos0XShn5AnYhSe/SjcBlSfsbF4Xguxb
 K0Q5ZSdrOOB3vMHugbAT1MGxRVyn//r5qafcHBlF5PWj84tv276fEBjNh0xUzkQaBf
 2Fnp3sB8cq75UJbfRxhgFKnRh0GJuT5vouW8shYdqTFJoW7XbiRyTVH5G3fJWEn1PA
 32HC9dCDZwOnA==
To: jaegeuk@kernel.org
Date: Mon, 31 Mar 2025 11:00:33 +0800
Message-ID: <20250331030034.481423-2-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
In-Reply-To: <20250331030034.481423-1-chao@kernel.org>
References: <20250331030034.481423-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -6.3 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  It missed to print s_encoding_flags in print_raw_sb_info(), 
 fix it. Signed-off-by: Chao Yu <chao@kernel.org> --- fsck/mount.c | 1 + 1
 file changed, 1 insertion(+) diff --git a/fsck/mount.c b/fsck/mount.c index
 0b05f00..e7c4069 100644 --- a/fsck/mount.c +++ b/fsck/mount.c @@ -555, 6 +555,
 7 @@ printout: DISP_u32(sb, qf_ino[PRJQUOTA]); 
 Content analysis details:   (-6.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -1.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tz5On-0003UZ-Fb
Subject: [f2fs-dev] [PATCH 2/3] dump.f2fs: print s_encoding_flags
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

It missed to print s_encoding_flags in print_raw_sb_info(), fix it.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/mount.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fsck/mount.c b/fsck/mount.c
index 0b05f00..e7c4069 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -555,6 +555,7 @@ printout:
 	DISP_u32(sb, qf_ino[PRJQUOTA]);
 
 	DISP_u16(sb, s_encoding);
+	DISP_u16(sb, s_encoding_flags);
 	DISP_u32(sb, crc);
 
 	print_sb_debug_info(sb);
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
