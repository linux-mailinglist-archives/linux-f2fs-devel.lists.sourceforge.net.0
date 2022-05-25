Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F8E534702
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 May 2022 01:35:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nu0XO-000527-Dk; Wed, 25 May 2022 23:35:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nu0XM-00051w-6b
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 May 2022 23:35:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ONNOFNF4nh3cFwCgmgAI9TaKzkdKMUUmQesoEIUv3n0=; b=Cblo1oSFtZb1wlBz7OSq11qiem
 Mdx3ms+I3moiVLYj6YA7kazL//rRms67R2o3/lru4CgCme7c+mxkG2d6JD7LRB74LvlS39oypDeHc
 h0fmts9aQLze4ykP9acwo/7K49RQVT+ikTfkcqeb8S8vUAr3B+hToZPUrNOBG0MY0PmE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ONNOFNF4nh3cFwCgmgAI9TaKzkdKMUUmQesoEIUv3n0=; b=nTlKqCswP6nFAW8o/YPO8o7vNd
 UcQIpkv2VdH0xn4SyIhdYth6zmHznikBdImOHpqloWUMGOIh9f9tvWiVlq0yypuPzngglMB5jkm4h
 rDbYCMbbUpHP6JC9vnK8XMOYuSRJRDMl1c8zv3sx7iHoBidRw9gwcIHQ/d0LWkjVFneM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nu0XF-0007Pe-0N
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 May 2022 23:35:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2733961568;
 Wed, 25 May 2022 23:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E13F0C34114;
 Wed, 25 May 2022 23:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653521716;
 bh=9tFJgOMB/CwSaGwkQCwZv14DYDwYLB/gyf/aR5Rc1UM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gpaQvDzs4lLhGvFxnFRLyOW550nAZ8kd3DLPv5EQ/T12L6A15lAj+qY4s6Dsr1lp4
 mxXBtbKhI9OvdGGPcvLYHd3/EBShtRj6JiWQ0mCP+xN20ecuehTcr+Eij2XeyoULJI
 afxSsMvOvF4IudP2Ot6mBgBTzVYFh796maU2UdJrmCkxP/vDPg4ZaN0tqeQNJuRZon
 2u59m4WZe+EPMNgHbAJHkD3lnEDcpRID+W9DDl24mnFsxeyRCHekQKPhJtv+zSWKXR
 aoaQsYVk6nTyjzM4nAct4eNJ6/qEMn6Bl9V9XAiHSgCAksJ5vokkoiYKhDLGaS/ogi
 U/rO23+b8SMpg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 25 May 2022 16:35:09 -0700
Message-Id: <20220525233510.4023217-3-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220525233510.4023217-1-jaegeuk@kernel.org>
References: <20220525233510.4023217-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Martin Stjernholm <mast@google.com> This reverts commit
 adcec10b4dee ("Support zoned device if libc exists). Signed-off-by: Martin
 Stjernholm <mast@google.com> Signed-off-by: Jaegeuk Kim <jaegeuk@google.com>
 --- include/android_config.h | 3 +-- 1 file changed, 1 insertion(+),
 2 deletions(-)
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nu0XF-0007Pe-0N
Subject: [f2fs-dev] [PATCH 3/4] Fix dependencies on linux/blkzoned.h when
 using Bionic.
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
Cc: Jaegeuk Kim <jaegeuk@google.com>, Martin Stjernholm <mast@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Martin Stjernholm <mast@google.com>

This reverts commit adcec10b4dee ("Support zoned device if libc exists).

Signed-off-by: Martin Stjernholm <mast@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@google.com>
---
 include/android_config.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/android_config.h b/include/android_config.h
index 07440874188c..21eed28669e1 100644
--- a/include/android_config.h
+++ b/include/android_config.h
@@ -41,8 +41,7 @@
 #define HAVE_LIBSELINUX 1
 #endif
 
-#ifdef WITH_LIBC
-#define HAVE_KERNEL_UAPI_LINUX_BLKZONED_H 1
+#if defined(__BIONIC__)
 #define HAVE_LINUX_BLKZONED_H 1
 #endif
 
-- 
2.36.1.124.g0e6072fb45-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
