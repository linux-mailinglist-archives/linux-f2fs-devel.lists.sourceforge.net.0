Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2503650C107
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Apr 2022 23:18:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ni0fz-0002jR-HW; Fri, 22 Apr 2022 21:18:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1ni0fu-0002jE-MD
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Apr 2022 21:18:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QD3848xJLpo4enpAzb8b3EMbvZ2EhizUlyQnn12lsfc=; b=SqwvYI3PL6jD/J9+URhQ5iIien
 Wq/pIrYvF0gaM/gyxD1DDjQW23sI4zM+/D2Uh0VXggTGL4jCJHwXiNdnVSL+PmswaSvaGZAxImTq3
 r61+xGUuMsBd8GYJaObYSfrX3YnxzpwxqEnBXosmjWelXOJdq2YlVisHAvupT5FLg8dY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QD3848xJLpo4enpAzb8b3EMbvZ2EhizUlyQnn12lsfc=; b=Qpj4qXv1T+lievC04IMNNsEr2o
 bMu9A4YC9Yyi4Cru+RVQs54wTkbc5sczQteD3KixyYt7e7fzwkGTsct2iHZftyZ6YKeRhOV4ZwoGk
 4n2mk83AA92Um2ByboljomGu+kbVq0W+CUNwMFY5A4W11VlRwUp0Mmyl5P1f+zFpyzeE=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ni0fp-000714-VN
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Apr 2022 21:18:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 47C7FB8327E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 22 Apr 2022 21:18:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA3B1C385AD;
 Fri, 22 Apr 2022 21:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650662307;
 bh=KjoR+fCMog/P5L03H1QDfhFhH3L4+fi3kgZ2xixNuvM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qQswMW1y6e54W5eosTGgGu64qxgy4VxaPGKyUbOpth+mwnzkMzCnWW4PVgADzgMTj
 Gy9UubCrMahfLK9b2FLJBZl9RwPeJOViq1fcUU43/g6wOUGQ4KTNlbijsYBPCDJdDQ
 Gc03NjR6q3sidfrv7RjRNrN8S+Ghm2MARSfTHw0bl/wGDO35TRCciFRaCq33DbwmVx
 9b+bc+ByQYB7q+wZ33AyuJEdlmhMJ14mnB3JcpB7dTKd6SYMwV91ah7+CrJrPfkhJL
 uNjRQ+xLc7ZIUixfVj9aYeIBUlcr7Donn+4I0GHyd2+Qkni2bFcXs3khC1Rloh/a6D
 iO8iOXkzz6wWA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 22 Apr 2022 14:18:17 -0700
Message-Id: <20220422211819.2230879-4-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
In-Reply-To: <20220422211819.2230879-1-jaegeuk@kernel.org>
References: <20220422211819.2230879-1-jaegeuk@kernel.org>
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
 | 1 + 1 file changed, 1 insertion(+) diff --git a/include/android_config.h
 b/include/android_config.h index 671cab6fb003..5a856a30fd8c 100644 ---
 a/include/android_config.h
 +++ b/include/android_config.h @@ -3,6 +3,7 @@ #define HAVE_BYTE [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
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
X-Headers-End: 1ni0fp-000714-VN
Subject: [f2fs-dev] [PATCH 4/6] f2fs-tools: use fsync() in Android
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
 include/android_config.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/android_config.h b/include/android_config.h
index 671cab6fb003..5a856a30fd8c 100644
--- a/include/android_config.h
+++ b/include/android_config.h
@@ -3,6 +3,7 @@
 #define HAVE_BYTESWAP_H 1
 #define HAVE_FCNTL_H 1
 #define HAVE_FALLOC_H 1
+#define HAVE_FSYNC 1
 #define HAVE_KERNEL_UAPI_LINUX_BLKZONED_H 1
 #define HAVE_LINUX_HDREG_H 1
 #define HAVE_LINUX_LIMITS_H 1
-- 
2.36.0.rc2.479.g8af0fa9b8e-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
