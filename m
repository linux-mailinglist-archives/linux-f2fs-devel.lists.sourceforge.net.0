Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF7585CBF8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Feb 2024 00:23:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rcZS8-0008A4-FX;
	Tue, 20 Feb 2024 23:23:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rcZS7-00089e-3e
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 23:23:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FNDCuo8gHnBbIjxMwuCG5lt2/Tx9DQTXvuJq2wdjm8A=; b=TPMyBOLUmXk3mL0rNFrqXy/af2
 fJnPj6BuNw4vbzn4MpFPQM0R+okwvbkKtPo0ymo/ihfxVHfnJgYvYtlA09NCoAuo60GizK2eFRQ6R
 lT/rVh15AzCCnEhhKGIdKSIRnT3eeUtwmp4fcgY4aZmeIF2SRnSiLxhS5aVF9yoI9Tro=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FNDCuo8gHnBbIjxMwuCG5lt2/Tx9DQTXvuJq2wdjm8A=; b=OmDRqM01rpjscHEII1xYxihxDV
 Xuq4YmJz/uz/7AMl1RljVCYqZE+Mis5YOjUwYeEAxJahVCZoW0nqUmuZYaiauRDcwkOKIqBNDamkH
 lELXQ9UNwxOI9qhUDqyUUTZ+U9Y2oORkETlqOOtN/Hr/Nrjt+Ja04kTPSRD2FzYtm6Mk=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rcZS2-0001OM-EP for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 23:23:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 17017CE1BA7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 20 Feb 2024 23:22:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ED1AC433C7;
 Tue, 20 Feb 2024 23:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708471371;
 bh=5v8IyxsitkSm3E3j6jmhK8UZ0QzoeYM3vh4aMTemJxM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iv1tVKuuuawAQ4p0vuYR2M1J3RtyHIFgum41/L2Nj8QM8V5PaPq16Vr8Xp65hE3I3
 lYD9JRyweKzVeViTscez6aZeJBPFUZbwGLlNH4E/3C9Rmx0YBSwG0LzTUNvf4ol2xM
 gReZWW3xDHZ9YuDSbU/BCCVs4vjdG9SvDdNXNYbvYSGYuJMWYp8ndIlhifp/jJkWXB
 N4uLFbA/XMnkpx8bEvbAiTBsLXkYcgdi2L0lUqBYX5h/sS8lpGJf3n7orGlPzZ1Y4J
 OAQ3ybQC7f4pK1Zzl2wMaXunMQAZ3wx4TSweW3tCgFhuGpfj9b6ruhf8aYwUcKszIH
 7hiNSkeXnNJCg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 20 Feb 2024 15:22:47 -0800
Message-ID: <20240220232247.2856-3-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
In-Reply-To: <20240220232247.2856-1-jaegeuk@kernel.org>
References: <20240220232247.2856-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Don't block mounting the partition,
 if cap is 100%. Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- fs/f2fs/segment.c | 3 +++ 1 file changed, 
 3 insertions(+) diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c index
 160ee550cbfe..56927b097e30 100644 --- a/fs/f2fs/segment.c +++
 b/fs/f2fs/segment.c
 @@ -894,6 +894,9 @@ int f2fs_disable_cp_again(struct f2fs_sb_ [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rcZS2-0001OM-EP
Subject: [f2fs-dev] [PATCH 3/3] f2fs: allow to mount if cap is 100
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Don't block mounting the partition, if cap is 100%.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/segment.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 160ee550cbfe..56927b097e30 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -894,6 +894,9 @@ int f2fs_disable_cp_again(struct f2fs_sb_info *sbi, block_t unusable)
 {
 	int ovp_hole_segs =
 		(overprovision_segments(sbi) - reserved_segments(sbi));
+
+	if (F2FS_OPTION(sbi).unusable_cap_perc == 100)
+		return 0;
 	if (unusable > F2FS_OPTION(sbi).unusable_cap)
 		return -EAGAIN;
 	if (is_sbi_flag_set(sbi, SBI_CP_DISABLED_QUICK) &&
-- 
2.44.0.rc0.258.g7320e95886-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
