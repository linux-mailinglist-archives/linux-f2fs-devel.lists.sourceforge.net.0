Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 205C6653A9D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Dec 2022 03:28:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p8BK6-00046f-9M;
	Thu, 22 Dec 2022 02:28:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <raj.khem@gmail.com>) id 1p8BK4-00046Z-Kj
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Dec 2022 02:28:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lzxnYomd7VaxUFiWhUShEMFjSdOAPazXsBhz/nuG8fE=; b=jMO1Da0pZTBeHhhIBs2GHzFxX0
 Cm4nkH0FaxP5ZQ6M9UlJP5IAMYEqPTEhSwwDf51uTauK3p9c7SbHIlI2sV5REhrPWjQO3zLeTweEM
 LTRf8fwlvDi8c0fp0+B2WY4JtU81JQZCTAML8eEX8fA9gJyBCW6yV87oi8YuTZgJWqTA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lzxnYomd7VaxUFiWhUShEMFjSdOAPazXsBhz/nuG8fE=; b=k
 KMzF+en3IR+uEHcDTOpCiZkk/O+srtHCkxFml3tzvdEsq1iK/26+pQqx1E4pKkHz+1vzxJPezQzJI
 X9Ysn+dcORRtvQH/GzCjka++MNB9G7pkER0EOvO0DxNjkLNt2PW42Ph/3iGmoTCTumCkYsroJ39Ya
 VWQxXCdti53gYNZ4=;
Received: from mail-pj1-f50.google.com ([209.85.216.50])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1p8BK2-007OJu-Nr for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Dec 2022 02:28:40 +0000
Received: by mail-pj1-f50.google.com with SMTP id u5so475204pjy.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 21 Dec 2022 18:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lzxnYomd7VaxUFiWhUShEMFjSdOAPazXsBhz/nuG8fE=;
 b=hJvXeVrqJtwcEuH2AkTjtkTxlgQOXlwYnyEiZLM2xXlbRVR5D9GJMw+uaugjtax5ut
 BD2jQhDy1t64bXGtK4cp7uNmyZmP7t643KTiLyfHJcqi2LBttH1ieeMHFIYtKxUz/AAc
 vVGnI44aretOSs/7g/6L0rduDPcFzzh+jdHnPUXNb7FXz/p41HMBps+xo9QtdR39hC/A
 w14jFkrWI6VzkHtDdqpyk/Xfe4evv4mg4D2NLUQ3Sw8kfkMal3cKgZELsEWiz6Inw/ea
 VNXIJbeMU+n1m9JVZmhCflhaSdHOlXvML8mXHZNZH/QSCb1XvsL7YsvTVphjmjCnuUXZ
 mexQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lzxnYomd7VaxUFiWhUShEMFjSdOAPazXsBhz/nuG8fE=;
 b=Q8S0mrPyO0g2J/2qRd0Kh6tZAmUUTxI4LRHFvOSM9BzqojcKvyiZ/cYeGFqD4pIVbL
 Y95/87iSCp4aqAFfnOKD10apmPYVb7JG1PgjfXlDllsIpbq9Z7W8mkEv1EZn4yYmdxpN
 wTtxVRBQgZl45pYlyUNPfwxSxAjj083tEZ/74kNN9uj+8N/dpDsuTq3pz+9QeddTBZpF
 mPCs8HzmbgzAEbMxtalmHF2q31SmzBzwEsJphdS9uSglMcYoiyImGAjbLUiTZ2ACxm+I
 9+9N4WVns4qPvlQ+z60GgwpkTws+aMmIxfpIBB5J+nhU+FeGgunGTJtBsyeoQQ8Texay
 2Ykw==
X-Gm-Message-State: AFqh2krSzl6RfkoCs2OuMpweT4t4YiTF+J/eGq0T9JlIO9R4gYqQe4Yf
 bLNoP8gctOsttXpCxOt/QES0vkEJpI0=
X-Google-Smtp-Source: AMrXdXtfg3+m75rqCqoNYeiu4Djs+jYKyHdUaQ0jP0uI2mB1CR8E1NITsI6L21Nzg1mrMRE93G9rvg==
X-Received: by 2002:a05:6a21:c007:b0:ad:67fa:8e50 with SMTP id
 bm7-20020a056a21c00700b000ad67fa8e50mr5833278pzc.57.1671676112756; 
 Wed, 21 Dec 2022 18:28:32 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::41f2])
 by smtp.gmail.com with ESMTPSA id
 n20-20020a638f14000000b00478c48cf73csm10521278pgd.82.2022.12.21.18.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 18:28:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 21 Dec 2022 18:28:29 -0800
Message-Id: <20221222022830.976309-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Relative path does not work when searching for include files
 when srcdir != builddir Signed-off-by: Khem Raj --- tools/f2fs_io/Makefile.am
 | 2 +- 1 file changed, 1 insertion(+),
 1 deletion(-) diff --git a/tools/f2fs_io/Makefile.am
 b/tools/f2fs_io/Makefile.am index 6c17db1..bc4f9d0 100644 ---
 a/tools/f2fs_io/Makefile.am
 +++ b/tools/f2fs_io/Makefile.am @@ -1,7 +1,7 @@ ## Makefile.am 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.50 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [raj.khem[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.50 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1p8BK2-007OJu-Nr
Subject: [f2fs-dev] [PATCH 1/2] f2fs_io: Fix out of tree builds
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
Cc: Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Relative path does not work when searching for include files
when srcdir != builddir

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 tools/f2fs_io/Makefile.am | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/f2fs_io/Makefile.am b/tools/f2fs_io/Makefile.am
index 6c17db1..bc4f9d0 100644
--- a/tools/f2fs_io/Makefile.am
+++ b/tools/f2fs_io/Makefile.am
@@ -1,7 +1,7 @@
 ## Makefile.am
 
 if LINUX
-AM_CPPFLAGS = -I../../include
+AM_CPPFLAGS = -I$(top_srcdir)/include
 AM_CFLAGS = -Wall
 sbin_PROGRAMS = f2fs_io
 f2fs_io_SOURCES = f2fs_io.c
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
