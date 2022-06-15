Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1C754CF1B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Jun 2022 18:56:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o1WJg-0008R7-D9; Wed, 15 Jun 2022 16:56:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1o1WJW-0008Qv-G2
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jun 2022 16:56:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7Q/g5b06Ebqwv99WBlxn/WFltcjl+42ArXlVCwUJ4vM=; b=lHC2cywcdQzBdpbAiJAoGYLvpv
 VUnfxg65Ee3QEhESwJT5vLRpylwANrgcZ+3L8/ZpodyWrQQuWRhwbFrhC/JGBerU/dxS8okB4pYFo
 eqmxYI7EpvmvMbMV5I5fmFHGzaHsPMCF3hRm5cCvyJFw61Y9KwFElTFvVYJliD3Ypbko=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7Q/g5b06Ebqwv99WBlxn/WFltcjl+42ArXlVCwUJ4vM=; b=M
 JSUS6FW7joP4IyHM6ls03yG/epI6KvpznVZ8ZmCoRJb/WttzNEZ1EFyxV4shgrGw3xu2KO3VCCgqi
 z7gpELv3kbiTmNewLfDU9rG4bP9UqTxIEHis8PbGFJrmTwsHIrbSAvG9qO28rUvZKm1JYhwWPKRs3
 Qgzm73gKTZJQLlIk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o1WJW-002dJC-E4
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jun 2022 16:56:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 12C0E6199C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 15 Jun 2022 16:56:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF32C34115;
 Wed, 15 Jun 2022 16:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655312172;
 bh=RSQfPwWSH7Evwwf5KW/iqcSrbk9IZvbpCfpPYFtlIJM=;
 h=From:To:Cc:Subject:Date:From;
 b=IILVQMDTd5CSWidx/Qki4swpstpKF7A2uN7RjAdpsp+Ara13ztIOnpStRuMmgui9m
 IbeP8//8EmE/WEyGNdotYGcKvAgjAhO9ghTk1VXr6KLAUXzTU9x2UyrQ92H3L/lxp6
 /eZIaRBb0YVGk9BVejGSPRZWYghLCcir6Oo3Fggc6+5HrLN4Qw6WdY20eot2J/D0hr
 n8yeUva2O1Jrb4js6CHZcP/bpnlULgk7uVTCdDkV9sjv9yWP18mEAOAnaCFDrnnOOU
 X3RrhZjTDNeVvjBUj0EI88p/GlrzBZsbgppknu0VOQBhnAnV0WcrG6LKmg2EP7VDD4
 JrIrHJYJIVjcw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 15 Jun 2022 09:56:09 -0700
Message-Id: <20220615165610.1074259-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
MIME-Version: 1.0
X-Spam-Score: -6.4 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This allows f2fs_io report latency. Signed-off-by: Jaegeuk
 Kim <jaegeuk@kernel.org> --- include/android_config.h | 2 ++ 1 file changed,
 2 insertions(+) diff --git a/include/android_config.h
 b/include/android_config.h
 index 21eed28669e1..67e5d5871bf8 100644 --- a/include/android_config.h +++
 b/include/android_config.h @@ -22,6 +22,8 @@ #define HAVE_SY [...] 
 Content analysis details:   (-6.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o1WJW-002dJC-E4
Subject: [f2fs-dev] [PATCH 1/2] android_config: add time headers
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

This allows f2fs_io report latency.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 include/android_config.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/android_config.h b/include/android_config.h
index 21eed28669e1..67e5d5871bf8 100644
--- a/include/android_config.h
+++ b/include/android_config.h
@@ -22,6 +22,8 @@
 #define HAVE_SYS_XATTR_H 1
 #define HAVE_UNISTD_H 1
 #define HAVE_UUID_UUID_H 1
+#define HAVE_CLOCK_GETTIME 1
+#define HAVE_CLOCK_BOOTTIME 1
 
 #define HAVE_FALLOCATE 1
 #define HAVE_FSETXATTR 1
-- 
2.36.1.476.g0c4daa206d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
