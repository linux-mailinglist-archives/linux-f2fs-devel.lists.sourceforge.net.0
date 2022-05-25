Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9185534705
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 May 2022 01:35:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nu0XL-0006qo-Lj; Wed, 25 May 2022 23:35:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nu0XK-0006qf-AJ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 May 2022 23:35:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gtSN5CBHGOf3GsAzSQTKgrK58VlpleWi2gaUGlusx/4=; b=fcrDdWRE3Phsb01/TaRoX+ruaD
 SiD4OrJdbUocwk0vruFXzvzdbmeOVIU1oF7JZso3a1pHyFfSfSvs/6FRy79zakoLARuMH6533qv8i
 jTxsMAh04ns/PYdS6Qvo9/gxJ5Vb19peYel880dYWgvtybeHKednLPAowgyz5WSw1+JQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gtSN5CBHGOf3GsAzSQTKgrK58VlpleWi2gaUGlusx/4=; b=Yd+5PFOCQ21D25MfB3eHW8VJ96
 MdgUDMIS9BpvNM2pfq+B+qXebLEpAzgZtjgM1xBNuZsQkl1cMnqZ0X1QFmcBihR/Vb88XOkYYF8TZ
 A74oI1Z21uODspo+qV0gOcGcRsnd2EFY4XuIjY7nPFTwX5255nLTjqLOYu5ff7VS+gCE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nu0XF-0007QL-0O
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 May 2022 23:35:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 50BC5615AF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 May 2022 23:35:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F3CC385B8;
 Wed, 25 May 2022 23:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653521716;
 bh=upTPXFbqhgz0nn9rcT+BQ5pdqS2sN6HP3vrTzzPDk94=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SGwXV+/w/uOYlTJ8TxY7EBB5S3/NXUB/IOnz97SNDFmTKmcS8LUgSaWVj0k8w/zSt
 O7mS+3UPKw9ZA9UieoI1E7h8Ra0hfPYzVGEJIbUhdeLntt5iunpW8gXm79hml+y7Lp
 aIoT8bwzLN5wqppMXAbhYbDJNR/lugVFOSBQC4Evd632tKkVT0SMdoU6hSltHD9ax8
 i0OTayN6pX4HW8499wQ+KDfbBLU9g/92L/2Riibkrza3hgt/mezZq8TkTq8fyUYX4w
 DhYzWU8lro/P1ebp3yS4oakGTPEUZwui4+56b9qNOLBoSMsD96c3quW5SveGbixnZv
 ePiq6GUFynOzQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 25 May 2022 16:35:10 -0700
Message-Id: <20220525233510.4023217-4-jaegeuk@kernel.org>
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
 Content preview:  libf2fs.c:883:12: warning: unused function 'is_power_of_2'
 [-Wunused-function] Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> ---
 lib/libf2fs.c | 2 ++ 1 file changed,
 2 insertions(+) diff --git a/lib/libf2fs.c b/lib/libf2fs.c
 index ad8d1bd03509..36b8c25980ab 100644 --- a/lib/libf2fs.c +++
 b/lib/libf2fs.c
 @@ -880,10 +880,12 @@ static int open_check_fs(char *path, int flag) return
 o [...] Content analysis details:   (-5.9 points, 6.0 required)
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
X-Headers-End: 1nu0XF-0007QL-0O
Subject: [f2fs-dev] [PATCH 4/4] avoid unnecessary function
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

libf2fs.c:883:12: warning: unused function 'is_power_of_2' [-Wunused-function]

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 lib/libf2fs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index ad8d1bd03509..36b8c25980ab 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -880,10 +880,12 @@ static int open_check_fs(char *path, int flag)
 	return open(path, O_RDONLY | flag);
 }
 
+#ifdef __linux__
 static int is_power_of_2(unsigned long n)
 {
 	return (n != 0 && ((n & (n - 1)) == 0));
 }
+#endif
 
 int get_device_info(int i)
 {
-- 
2.36.1.124.g0e6072fb45-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
