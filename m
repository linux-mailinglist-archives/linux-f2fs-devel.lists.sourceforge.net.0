Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5F8861E37
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Feb 2024 21:55:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rdcaH-0000iR-4p;
	Fri, 23 Feb 2024 20:55:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rdcaF-0000iG-Ma
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Feb 2024 20:55:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LY4nb6aO4XFI9t4oJbOKO3rOm7VYOQsfpcV4tt+nqqk=; b=SdcZqOjjXsNmnC2LSylKYWYUPU
 +4Fz+5gfBzxhlb1m4ISm+HQeVk0hoRSZtqLPVC9SiOuuIva/kXHqSEtZhKBx+sETOFAMqOdvjU2F3
 MdOcRzbIwkDwgVe95bk76mUhs7VE96OSbVbsBex1r6lw/zjgA8NAGoR1qk71YGCH0xdA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LY4nb6aO4XFI9t4oJbOKO3rOm7VYOQsfpcV4tt+nqqk=; b=iVUdxwsHsZTqwzgGnBFlgLCT5T
 9sb4jSyhe9ifOKaOdBAPDlC/qghhdm9kFqbhLOenbK2rED29c8I42X3LmNLNDAPzI0Ss+hQSjD5wI
 0XPBPXweo3RrvrocG5inQoaYE5vCPbOfYJUFsicNGSPdEgeXmAGKARpEbBCHZphPbnBI=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rdcaF-0002pW-Jb for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Feb 2024 20:55:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D53CACE2F1F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 23 Feb 2024 20:55:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D6DAC433F1;
 Fri, 23 Feb 2024 20:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708721739;
 bh=jcqHB3mOguQlmJS0WZkHNVvEJ+LlBmJIQaxT0/mGi48=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SB3mQtoLjZc3slFBxMQrc1O4HtbEMqzWJ/jBNTuPg46FWdAFrTsuEr3EkozkldcV0
 qAaO6BTlVNGrYTROIXCN2Amj4mabG7qG2YHN1PAAzYoipn5o5eQUStaR1qZA7rAGeQ
 jOBs1vmnQXSZ11t341fROSPlKCIb0rk8Xnpu02UC8vzTHnNXzye9LrSr5wuSrq/dVE
 m3D7HdmqSzsJiRwuLbNCeGxKvCAB6R4c1m878ohP4rQso5/gjLA8hX/Gc84Jdm639T
 uaZ/L0JUYTkQvgMfOw4hhZ9ZyTy/QHhGl2/oTZ/FCRK/J/cqy/0cBhrUq3Dm8cdQLn
 0Kdk/h96tmGbQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 23 Feb 2024 12:55:34 -0800
Message-ID: <20240223205535.307307-4-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
In-Reply-To: <20240223205535.307307-1-jaegeuk@kernel.org>
References: <20240223205535.307307-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Don't get stuck in the f2fs_gc loop while disabling
 checkpoint. Instead,
 we have a time-based management. Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org>
 --- fs/f2fs/super.c | 1 + 1 file changed, 1 insertion(+) 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rdcaF-0002pW-Jb
Subject: [f2fs-dev] [PATCH 4/5] f2fs: prevent an f2fs_gc loop during
 disable_checkpoint
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

Don't get stuck in the f2fs_gc loop while disabling checkpoint. Instead, we have
a time-based management.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index fc7f1a9fbbda..7d9b92978709 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2191,6 +2191,7 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
 			.init_gc_type = FG_GC,
 			.should_migrate_blocks = false,
 			.err_gc_skipped = true,
+			.no_bg_gc = true,
 			.nr_free_secs = 1 };
 
 		f2fs_down_write(&sbi->gc_lock);
-- 
2.44.0.rc0.258.g7320e95886-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
