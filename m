Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE08801930
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  2 Dec 2023 01:57:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r9EK4-0001km-T7;
	Sat, 02 Dec 2023 00:57:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <38IBqZQYKAM0wA7Bx6z77z4x.v75@flex--drosen.bounces.google.com>)
 id 1r9EK3-0001kg-5V for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 Dec 2023 00:57:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MQVX8KES95HvH2qkfqcCG8qMIeL1L/y7yTEOd92EKkg=; b=PE7tGcfqYSP8nbCLW4B/L7j6Bz
 ZHLLov8crAwB0A6MDjwEJzq727PPTZuuFU5KaBPVHyQZnybHPxqhwjeFTD3uNwHG21Mo1iX0nrFgv
 tlki5pgOiHj5BHH74Ugo4h2SrSzeYteZBFjsForj1y1eAo24IZ7uWcDOg6VPoAx9yWn0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=MQVX8KES95HvH2qkfqcCG8qMIeL1L/y7yTEOd92EKkg=; b=K
 IG8rVD2gkKHJpRTfDmH1n3likHeo4uyv1bW5I8Wgx5kl+5puzEDYHoYaVivfVsN41XnjyUke41JcR
 ACF8ilCIpC7gvn7EvtFkA7haCKrhgEkpSaOVtZrFh1LiJxgmoRxG78hGkANKOFG8I2Jj8w/WwfuXZ
 OEF24G9k8owFWZBE=;
Received: from mail-yw1-f201.google.com ([209.85.128.201])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1r9EJy-000755-Mp for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 Dec 2023 00:57:31 +0000
Received: by mail-yw1-f201.google.com with SMTP id
 00721157ae682-5ce16bc121aso49420047b3.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 01 Dec 2023 16:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1701478641; x=1702083441;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=MQVX8KES95HvH2qkfqcCG8qMIeL1L/y7yTEOd92EKkg=;
 b=ryDYhnBnyP/P1ykHRmgKvNB7idHK7DQoBprOOfg30udCFMJzkWchBw3k2lVteGD7RB
 vv1XsMZBxC9CzI/Ta2l7W/R2pxH4XrprkRhVbuyk+AVbTVF3ekwX51T4BbtlZrZXbBpU
 +hEhykjnOM/VfatEu6TAELc6VbtoH9xFwY+6+5eb9DJrLVMcy0CJJS/zBrywnqA4TDAq
 x7ZGpbvTi3SacG2PRj0u2Xt/VOVmeql/XnuLvzGOeBKNVn+u7ZH5rEt1gqSwBzL63f+M
 aCaddqjVhPeeAHIe3mLhUhHEwwSr0W/ssrk5y4R7YwdN+TKTngRZZbckkN895sRTPK16
 QKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701478641; x=1702083441;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MQVX8KES95HvH2qkfqcCG8qMIeL1L/y7yTEOd92EKkg=;
 b=ewOyA3wegze+xdMR9I/AtURV/D5kGZMjZ3Aqsh879Cane26rikUsTQ9DRuNVQeV7Ji
 T5yvDTklHUlOmcrX2O/9zL/zPoqN39NBkZpZe4FJn6OgBttbpgp274FxeUVsFWl9DGXP
 0mjVlVKGRoyARvCfk1N2xr/RicJvp4wEjrK/DhzwDZnwjmUVs9G0KH3HWkMLj14iWllV
 nxqL7mlocJWayMeDTckp3MAzdVO9N9+qH5arGG5eN7lTxIEXUgj9VkQZIAdJxTuaMozJ
 YJvPrYXi9m6KzrwMjJu4yLa+neMYf/BC367kp2rDZ6iQy9WRcloKyoE0SjQiQ9yS/rlJ
 j1sA==
X-Gm-Message-State: AOJu0Yz5yb9KkJWCBN7DdIRMsjBrbvr/+rUPc7BiI5D1Z5xwtKgZzOvP
 9BwwuFCmtLncm+15kAryDO9cT0cScIoOohekVu/9aKNw8H8kjETIq6uLyhoS06V7CQv+YAn68nj
 o8+Ulze/98INt/tKkj5bAsAWsOJ1uYBKvLuD/hw/RG1jsw4DN5dXJoA5HCbX0bOQjH6vVRLbALS
 19CkAgzAA=
X-Google-Smtp-Source: AGHT+IFEdAbIxgC2nl8OT3ez8xtE6+SscGgwKACdBGA6KUMg2u8RQR2Zh3OHK7ir/9ygduRd9JrGJLGbGOc=
X-Received: from drosen.mtv.corp.google.com
 ([2620:15c:211:201:e3a2:452f:f377:df27])
 (user=drosen job=sendgmr) by 2002:a25:d883:0:b0:db5:4766:e366 with SMTP id
 p125-20020a25d883000000b00db54766e366mr186611ybg.3.1701478640887; Fri, 01 Dec
 2023 16:57:20 -0800 (PST)
Date: Fri,  1 Dec 2023 16:57:14 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Message-ID: <20231202005714.3722264-1-drosen@google.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Describes the block size option -b. This sets the block size,
 which is restricted to powers of 2. The linux kernel currently requires that
 the block size be equal to the page size to mount. Change-Id:
 I27ec4f909f8d27327b48373f0a4a4e8593626804
 Signed-off-by: Daniel Rosenberg <drosen@google.com> --- man/mkfs.f2fs.8 |
 6 ++++++ 1 file changed, 6 insertions(+) 
 Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.201 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.201 listed in list.dnswl.org]
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1r9EJy-000755-Mp
Subject: [f2fs-dev] [PATCH] man: Add description for mkfs -b option
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com,
 Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Describes the block size option -b. This sets the block size, which is
restricted to powers of 2. The linux kernel currently requires that the
block size be equal to the page size to mount.

Change-Id: I27ec4f909f8d27327b48373f0a4a4e8593626804
Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 man/mkfs.f2fs.8 | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/man/mkfs.f2fs.8 b/man/mkfs.f2fs.8
index 474c401..6670003 100644
--- a/man/mkfs.f2fs.8
+++ b/man/mkfs.f2fs.8
@@ -116,6 +116,12 @@ If the value is equal to 1, each of active log areas are initially
 assigned separately according to the whole volume size.
 The default value is 1.
 .TP
+.BI \-b " block size"
+Specify the block size in bytes. Valid blocksizes are powers of 2.
+Currently, the kernel is only able to mount f2fs filesystems where the
+block size matches the page size.
+The default value is 4096.
+.TP
 .BI \-c " device-list"
 Build f2fs with these additional comma separated devices, so that the user can
 see all the devices as one big volume.
-- 
2.43.0.rc2.451.g8631bc7472-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
