Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4518621A4
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 24 Feb 2024 02:14:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rdgcT-0002lz-3u;
	Sat, 24 Feb 2024 01:14:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rdgcS-0002lt-Ak
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 24 Feb 2024 01:14:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7/7etoDVxa2GaekHSFIR1OImQmXOmWYVlrE0hdes3cU=; b=flz+1r8O6Mf21cqzzkEs2REGQG
 VSDkKPPJJ90/vycH1KwlGcrxR72IA6fDyU1q+i8Vhww3pnrIYtCemD4GCSUeldjwb5ofO5HRu8vae
 +DpA1712iNTNGHgJ8oELiZ5+ZvV1mtxJdFrW1KeiXmzhOKeyYeb8Y2JOxJAhqRkNppog=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7/7etoDVxa2GaekHSFIR1OImQmXOmWYVlrE0hdes3cU=; b=S
 x4nqZyx0mxf9JMqwudk5eJwwW39DMJWJkQoUnw13Db/8bHAA9xTAV+/8KLwOvFVvBv/lVtNedK/dE
 fQ/bokN1euHTPTLUScQQcphX882vmpKxCkeqFfSCHiNgCSb85zXK7inwJ4orOrn1vHx8MW9gsr8No
 SvjSSauQfihr8geg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rdgcN-0005bc-Ra for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 24 Feb 2024 01:14:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 70683618EA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 24 Feb 2024 01:14:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F8CCC433F1;
 Sat, 24 Feb 2024 01:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708737254;
 bh=t6bpmHREMYzl4Sh4aRRosfkE6F9NITSKrV4bmyBQCfk=;
 h=From:To:Cc:Subject:Date:From;
 b=myU8pj7yDRMWYqCJUNWkiGjFDJHS8OUE670INLraKYknIO/Z09rg/mqRNA9QeOdqK
 WSlNrriituWHgpk/uDvkZFSyw0YJD50VYs2l84v3+ygkuAi9QPlruKb0TgsrCPeQcE
 0pobnviMxRn1QiuxGEng8hI1KIWYzsM23EjIAvluxiCSwYz0QCPvRJopIGOyhdXsEn
 +bLkmXSIYzWyNRvcKxPE5TAjxZQAjiuCFZzI7IxdwJZlS/cobfYqjeiArTSXnbowWb
 irE8M+dmM66awsKHsAEbfQyhySGjr6hF34Lbgm5MFyQgQQidiM4Dk/siNYblmVARwK
 DwOr/7y0lFyPQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 23 Feb 2024 17:14:11 -0800
Message-ID: <20240224011411.3820719-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The reserved segments should be aligned to the section
 boundary.
 Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> --- include/f2fs_fs.h | 3
 ++- 1 file changed, 2 insertions(+),
 1 deletion(-) diff --git a/include/f2fs_fs.h
 b/include/f2fs_fs.h index 9056e02acd29..2e93503cada9 100644 ---
 a/include/f2fs_fs.h +++ b/include/f2fs_fs.h @@ -1771, 7 +1771,
 8 @@ static inline double get_reserved(struc [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rdgcN-0005bc-Ra
Subject: [f2fs-dev] [PATCH] mkfs.f2fs: should give section-aligned reserved
 segments
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

The reserved segments should be aligned to the section boundary.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 include/f2fs_fs.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 9056e02acd29..2e93503cada9 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1771,7 +1771,8 @@ static inline double get_reserved(struct f2fs_super_block *sb, double ovp)
 	else
 		reserved = (100 / ovp + 1 + NR_CURSEG_TYPE) * segs_per_sec;
 
-	return reserved;
+	/* Let's keep the section alignment */
+	return round_up(reserved, segs_per_sec);
 }
 
 static inline double get_best_overprovision(struct f2fs_super_block *sb)
-- 
2.44.0.rc0.258.g7320e95886-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
