Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB2C50AB4E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Apr 2022 00:19:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhf8g-0001cf-Qc; Thu, 21 Apr 2022 22:19:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1nhf8f-0001cU-5Q
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:18:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wD8P8hc0sT0dtI/9hVW9/3GxtOQkC4A/fcWBcj1ShC8=; b=mWK/h4PicQw06L83Qe0TmyQqdB
 hFStWMW7TflymyPh6QD+H1hTrF8gVjQPS4p6pvfkzy99b22Qk5ittp3VmISKsS3Kp/9aefOnRDNw+
 4g9qrR3c+sfbkOfFzOW047KgSWZvngvmdJaf1RxjKyyhH9Jm0d1iY8ZDI61Pe8Rru5B4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wD8P8hc0sT0dtI/9hVW9/3GxtOQkC4A/fcWBcj1ShC8=; b=Apraw92IITuPCaf956S3x+4a2T
 64LBxXKOAKVgEaIFwXlq4Tu2CNBsID/GYt38KQB9JR9Sk3KubvBMDYxMM77TMzfAc8AeNJ2fAykiL
 7I+3EaiqPdAzVT2y0AxU5rrlTpaHuBOhKbGsKaZXcAXXaylCOOsWEL/ZnNK1FNCC/Is4=;
Received: from mail-pf1-f176.google.com ([209.85.210.176])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nhf8Z-005sOc-9L
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:18:59 +0000
Received: by mail-pf1-f176.google.com with SMTP id p3so4910857pfw.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Apr 2022 15:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wD8P8hc0sT0dtI/9hVW9/3GxtOQkC4A/fcWBcj1ShC8=;
 b=rTZjqAmMEakSw2c7mqtEKzZM0Db4w4VD0Vd7NU5nsiNc6+CQNeEmpKzCBWfZOAjuWw
 AQAwSczyWvYJKl3++bmUMVK3HEavT/dwHDyvsYH99vWJnsPz8n6CiUEDejGGOJysvIkm
 cHi5FTffKuQeFPIaly/R1VNIPeumF7/4JpF/VnLSXw2L/MRvjwkd9PudM1JVsP+GIMnn
 RO+cWq+nHo7ugWYl7WDEk5ifBFiTcWt9MI4D2B8PMoUy6w7pGwhDXnVB3sHNXTQli69S
 lGyd/lzG55XgNe0dw+fFFeOMmF7hWDgO2x6tLwy6PPxe2Tb/+RcydBjDoaK8f4XqI1Op
 tDAg==
X-Gm-Message-State: AOAM531izPNi2nbEkONSzxYhtzeICRS+2sHkSPwpmMXob5EEE+G16PL/
 wMA8jkwhd8SvAurP+lkRhODOaftzl5WGXg==
X-Google-Smtp-Source: ABdhPJzD3pmzK4xTPLhoJ+J1+5rQbdUr4DMIXduJe8nQSaNN0JPDpu6Kb3Nxzdj3LRRocp+NRCCmKg==
X-Received: by 2002:a63:3d0b:0:b0:37f:ef34:1431 with SMTP id
 k11-20020a633d0b000000b0037fef341431mr1259630pga.547.1650579529649; 
 Thu, 21 Apr 2022 15:18:49 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:a034:31d8:ca4e:1f35])
 by smtp.gmail.com with ESMTPSA id
 hi21-20020a17090b30d500b001cd4989ff4csm3794876pjb.19.2022.04.21.15.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 15:18:48 -0700 (PDT)
From: Bart Van Assche <bvanassche@acm.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 21 Apr 2022 15:18:06 -0700
Message-Id: <20220421221836.3935616-2-bvanassche@acm.org>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
In-Reply-To: <20220421221836.3935616-1-bvanassche@acm.org>
References: <20220421221836.3935616-1-bvanassche@acm.org>
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Run autoupdate v2.71 to fix the following autogen.sh
 warnings:
 configure.ac:33: warning: The macro `AC_CONFIG_HEADER' is obsolete.
 configure.ac:33:
 You should run autoupdate. ./lib/autoconf/status.m4:719: AC_CONFIG_HEADER
 is expanded from... configure.ac:33: the [...] 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.176 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.176 listed in list.dnswl.org]
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1nhf8Z-005sOc-9L
Subject: [f2fs-dev] [PATCH 01/31] configure.ac: Stop using obsolete macros
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
Cc: Bart Van Assche <bvanassche@acm.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Run autoupdate v2.71 to fix the following autogen.sh warnings:

configure.ac:33: warning: The macro `AC_CONFIG_HEADER' is obsolete.
configure.ac:33: You should run autoupdate.
./lib/autoconf/status.m4:719: AC_CONFIG_HEADER is expanded from...
configure.ac:33: the top level
configure.ac:49: warning: The macro `AC_PROG_LIBTOOL' is obsolete.
configure.ac:49: You should run autoupdate.
m4/libtool.m4:100: AC_PROG_LIBTOOL is expanded from...
configure.ac:49: the top level

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 configure.ac | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure.ac b/configure.ac
index 32e97a25053e..f906be780eb2 100644
--- a/configure.ac
+++ b/configure.ac
@@ -30,7 +30,7 @@ AS_IF([test -d .git],[
 		[f2fs-tools date based on Source releases])])
 
 AC_CONFIG_SRCDIR([config.h.in])
-AC_CONFIG_HEADER([config.h])
+AC_CONFIG_HEADERS([config.h])
 AC_CONFIG_MACRO_DIR([m4])
 AC_CONFIG_AUX_DIR([build-aux])
 AM_INIT_AUTOMAKE([foreign tar-pax dist-xz])
@@ -46,7 +46,7 @@ AC_ARG_WITH([blkid],
 
 # Checks for programs.
 AC_PROG_CC
-AC_PROG_LIBTOOL
+LT_INIT
 AC_PATH_PROG([LDCONFIG], [ldconfig],
        [AC_MSG_ERROR([ldconfig not found])],
        [$PATH:/sbin])


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
