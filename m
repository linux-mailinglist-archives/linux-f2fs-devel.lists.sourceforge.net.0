Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4672E50C106
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Apr 2022 23:18:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ni0fu-00014O-Qh; Fri, 22 Apr 2022 21:18:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1ni0fs-00014B-W3
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Apr 2022 21:18:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gq7uL/6GS2MgLx7SNSNMNHU0/R0Zsiez1jxIaEAQ6bQ=; b=FspTxjmdlW7kObcOXQ9g44Vt2n
 n7t7GdXaYZB+ti56Sa6SgCWKUcagqrSpjy1IPOvG/hcHw7FlbXoA6JcGkUjOIbGhcNn7Ldo45EbJ5
 WxUKg31bSe1XnLIQaypiSFjHpk5Js5S7ktXw8wcghQAUJvy3LTHTJ8oTnKaCT1tkF+lA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gq7uL/6GS2MgLx7SNSNMNHU0/R0Zsiez1jxIaEAQ6bQ=; b=LPG6TC5FOkHD/5HZqZwVzTu7bR
 e3Qa2Jb2Z1V/0Zkt7fZiMJB1hHlsWUMIq6ToJ5sjrrxVhX+VE2irWowAzCTbta6KN1JyWotmUen74
 TUeEnHCOkMbjhhk9yppM1eXK0a3ECiWFgKnbGZ4SDyWPH3u+cPCq6b+VsRoCIfjDKkuI=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ni0fp-006rCE-E2
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Apr 2022 21:18:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D0EEAB83276
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 22 Apr 2022 21:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B89FC385A0;
 Fri, 22 Apr 2022 21:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650662306;
 bh=GQhCouHqWpVHnE7ypMnsjgUEbsJapGv6lkm/bnFo8ZQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SIW0pMg45sXTQCeZ46v8SGugRGGEUINxZYpXtq+GvqtoMcBbMNtTfhvkZU02acyd3
 MFbGe2tIjIC6XvZO5Hjvf6fe8vXJp7TQli2gjW6zAD2I2rMb/hjZncqO2D6Y/hpte5
 siLqLeKx9xtJs+yaM9ZPc6DcdUrxU9j/VWX6FbCakdpegfh6pY0R91Q9WYj1nWy4Kn
 P2YdfYNAJfv61NHWD/AkFyLr0lboeKjZkzyHbyKK4uit12hpnZJo6TMpyuFtBru0Kx
 Ps0TrOMbtwQ+p2DS1VuFymlg6srgsxj3duAvXP4cm5kEVZoEEUvYVmkBCbG/ZWgyFf
 nQTbaxJp8fvNA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 22 Apr 2022 14:18:15 -0700
Message-Id: <20220422211819.2230879-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
In-Reply-To: <20220422211819.2230879-1-jaegeuk@kernel.org>
References: <20220422211819.2230879-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> ---
 include/android_config.h
 | 2 ++ 1 file changed, 2 insertions(+) diff --git a/include/android_config.h
 b/include/android_config.h index 865e4087ccfe..ce6723309447 100644 ---
 a/include/android_config.h
 +++ b/include/android_config.h @@ -31,6 +31,7 @@ #define HAVE_SE [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ni0fp-006rCE-E2
Subject: [f2fs-dev] [PATCH 2/6] android_config.h: add missing liblz4
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
index 865e4087ccfe..ce6723309447 100644
--- a/include/android_config.h
+++ b/include/android_config.h
@@ -31,6 +31,7 @@
 #define HAVE_SELINUX_ANDROID_H 1
 #define HAVE_SETMNTENT 1
 #define HAVE_SPARSE_SPARSE_H 1
+#define HAVE_LIBLZ4 1
 
 #ifdef WITH_SLOAD
 #define HAVE_LIBSELINUX 1
@@ -57,6 +58,7 @@
 #define HAVE_GETMNTENT 1
 #define HAVE_LLSEEK 1
 #define HAVE_MEMSET 1
+#define HAVE_LIBLZ4 1
 
 #ifdef WITH_SLOAD
 #define HAVE_LIBSELINUX 1
-- 
2.36.0.rc2.479.g8af0fa9b8e-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
