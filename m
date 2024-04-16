Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D7F8A64D3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Apr 2024 09:18:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rwd5a-0007Hv-L9;
	Tue, 16 Apr 2024 07:18:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rwd5Z-0007Hi-2e
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Apr 2024 07:18:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oGBjTA0UCy8ouB7RP2ha+fBJ3P2zF5WZJCWdSzukzzc=; b=Pq2ilwMafFeTU2inKPHYzRa0ih
 2WCTyH/LaAjMxk89bctxGJtmPybwL/YLDCqpkAiKLFpXaQYz5/PAohb/bBv//e6twQ79+9v3i4sj8
 iGkvP31xnV8edmqg3YpLE30XZhFpLHyaP9g8SkwuzVBY7T734Icisdimfc7/mBXeDLTI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=oGBjTA0UCy8ouB7RP2ha+fBJ3P2zF5WZJCWdSzukzzc=; b=f
 h0BAeFMyZdhRCgN/CIXwSRpSEMQRlf/XVCPv21s01jhhlh90aOBHsJ6Qc5ZbWd4pJ5VAb8FeSeLNe
 VwxEqVy+Q7aqjNNpzNAEO3ulyRXFByS8qsIJGudClgpx0mFtuOrZoOfwuna7pa+IKRJkwro/iBG7v
 XeNmXEhUE/NitwZo=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rwd5Y-0002ZD-Qd for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Apr 2024 07:18:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BA680CE0A5E;
 Tue, 16 Apr 2024 07:18:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8E10C32781;
 Tue, 16 Apr 2024 07:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713251911;
 bh=d0vPtkb8u3T+cVx/TcUDIO0p0YQj7ucJVBzKcgcqpGI=;
 h=From:To:Cc:Subject:Date:From;
 b=bENvtoB2fSQ2J8HD5goldWQCa5HwXhNNbpYG9zIkVev1I/xSHAhBAstHMip8pyiT7
 AxwjDAUliYIffU9foMgBW+D3xu/4kEf4pUubIGu5dpEKylGnuajyRFJDFx0QaPunJz
 FX5WozkU8pQ58kTiOnjcrAcyw/4XBjo7HeiwH3z9M4ym45Q5M/NPnVa36sBdmavaR4
 FvVfbappQCqZSjJhhw9o0E4WH3d14LJDk4DuqM7I3s1amZjuF2OUJIvIhkFaHZqQTg
 IzbuAca88gVUrj5shS31uQPGqJB6uTbkiUyZol0vSiummPGz8fsAuaeOOmEzh62sNA
 PE3k0KSg4L3Yg==
From: Chao Yu <chao@kernel.org>
To: Zorro Lang <zlang@redhat.com>
Date: Tue, 16 Apr 2024 15:18:19 +0800
Message-Id: <20240416071819.5004-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -2.0 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Previously, in f2fs,
 sysfile quota feature has different name:
 - "quota" in mkfs.f2fs - and "quota_ino" in dump.f2fs Now, it has unified
 the name to "quota" since commit 92cc5edeb7 ("f2fs-tools: reuse feature_table
 to clean up print_sb_state()"). 
 Content analysis details:   (-2.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -1.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rwd5Y-0002ZD-Qd
Subject: [f2fs-dev] [PATCH] common/quota: fix keywords of quota feature in
 _require_prjquota() for f2fs
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Previously, in f2fs, sysfile quota feature has different name:
- "quota" in mkfs.f2fs
- and "quota_ino" in dump.f2fs

Now, it has unified the name to "quota" since commit 92cc5edeb7
("f2fs-tools: reuse feature_table to clean up print_sb_state()").

It needs to fix keywords in _require_prjquota() for f2fs, Otherwise,
quota testcase will fail.

generic/383 1s ... [not run] quota sysfile not enabled in this device /dev/vdc

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 common/quota | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/common/quota b/common/quota
index 6b529bf4..cfe3276f 100644
--- a/common/quota
+++ b/common/quota
@@ -145,7 +145,7 @@ _require_prjquota()
     if [ "$FSTYP" == "f2fs" ]; then
 	dump.f2fs $_dev 2>&1 | grep -qw project_quota
 	[ $? -ne 0 ] && _notrun "Project quota not enabled in this device $_dev"
-	dump.f2fs $_dev 2>&1 | grep -qw quota_ino
+	dump.f2fs $_dev 2>&1 | grep -qw quota
 	[ $? -ne 0 ] && _notrun "quota sysfile not enabled in this device $_dev"
 	cat /sys/fs/f2fs/features/project_quota | grep -qw supported
 	[ $? -ne 0 ] && _notrun "Installed kernel does not support project quotas"
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
