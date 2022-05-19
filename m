Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D9452E0CA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 May 2022 01:46:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nrpqe-0005j1-V4; Thu, 19 May 2022 23:46:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nrpqd-0005iv-2K
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 May 2022 23:46:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GqCoieOnyOEfnEdrTrL8YjA1HLhIwwbniQulVpStEDA=; b=SGtKrI+icgwXtqtQZEpbwpyW4p
 7GcVhfrTZRIxIwmr+EO5Tp9JIgsgzPYSqmIxz8hafN/36XCd+N9b3blzd2ARfjYO38GST6HTEZwmO
 T7geaegVkOSvS0ptAfB8o1AY7ufjIAuKczo3nYG3PK8lLlYxf3syzZG5oNOY+Zd6k15Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GqCoieOnyOEfnEdrTrL8YjA1HLhIwwbniQulVpStEDA=; b=LpK0/hgiExx/fbPTMfyqRTln6V
 iAESXtyypbAC3e//tifVIwxFts8/RMn2XjIeI5yaLkG6mytu2BuYRspVatLzZDE2TTqLHE8DKsVOB
 OItHeXaEuv4nC3onlbJwmyMHO5Aeza4YOzI22bddLKTxm9yGz2DFz5PNmRkDxWihrCns=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nrpqb-00B1Yn-CW
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 May 2022 23:46:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 087E06195F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 19 May 2022 23:46:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 578FAC385B8;
 Thu, 19 May 2022 23:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653003971;
 bh=UBsxAojn0DA+iVcYfiMVXNtdUNqJ74aKkbddnpZZaQ0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V1lGXRAvoDOQMfsUX0xDeiQ7WzBgekzmIfIgtZFJvstDLXrtROBWJeGm+48N+t9Mz
 ORryDlDp8xUAF7t3j8vxu+g6132WlgwgL+n9Tqf20U5CNLKFHBOU7/5s+q7lS7pzkv
 St08s89g+lf6lTKh2Qfr2Yj8vIbZPSesFwnG1fM8KF12b+4Uqj944/NHjre8QZeyyE
 atXrygxAKUdVFalrgIRh8KwhVRmHpw8wA8U8GGsOGNuLRNYO1jHE4hTrPrHRxv9fzq
 2T8/SbR36Mli/xQ366AUFn9YAdMqyVU6w9j7tD/nEp5d76tuLkr0YUydlYPJOFrKgT
 NyA8MVxl2NCog==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 19 May 2022 16:46:05 -0700
Message-Id: <20220519234605.633645-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220519234605.633645-1-jaegeuk@kernel.org>
References: <20220519234605.633645-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> ---
 include/android_config.h
 | 2 ++ 1 file changed, 2 insertions(+) diff --git a/include/android_config.h
 b/include/android_config.h index 9a15782dc796..4bcd5890313f 100644 ---
 a/include/android_config.h
 +++ b/include/android_config.h @@ -23,6 +23,7 @@ #define HAVE_SY [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nrpqb-00B1Yn-CW
Subject: [f2fs-dev] [PATCH 2/2] android_config: add missing uuid library
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

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 include/android_config.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/android_config.h b/include/android_config.h
index 9a15782dc796..4bcd5890313f 100644
--- a/include/android_config.h
+++ b/include/android_config.h
@@ -23,6 +23,7 @@
 #define HAVE_SYS_SYSMACROS_H 1
 #define HAVE_SYS_XATTR_H 1
 #define HAVE_UNISTD_H 1
+#define HAVE_UUID_UUID_H 1
 #define HAVE_SCSI_SG_H 1
 
 #define HAVE_FALLOCATE 1
@@ -37,6 +38,7 @@
 #define HAVE_SETMNTENT 1
 #define HAVE_SPARSE_SPARSE_H 1
 #define HAVE_LIBLZ4 1
+#define HAVE_LIBUUID 1
 
 #ifdef WITH_SLOAD
 #define HAVE_LIBSELINUX 1
-- 
2.36.1.124.g0e6072fb45-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
