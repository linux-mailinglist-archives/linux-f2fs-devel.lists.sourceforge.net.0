Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CC950AB64
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Apr 2022 00:19:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhf97-0005Qm-7P; Thu, 21 Apr 2022 22:19:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1nhf95-0005Pz-Oq
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=47F3YavIqtOahrtYKZfh2cVMDeC/3NDFumH2A5ynDRo=; b=aJSRp4bBnm1mrZd5ZHt3RFxeXp
 m/voNt0ma7LS+x0ap2ZvK2to5QAy0YoqzL6d9Wm8L3nhBMeXS9V6aSI4VdRQ0OYQzai5qvGnZ99x9
 MD8s9UtnhCab+M4EduRG3He8gTtcTYJ+/p1mEzp3iYO/x88dstqp61minl/idgFTqpX8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=47F3YavIqtOahrtYKZfh2cVMDeC/3NDFumH2A5ynDRo=; b=Sp2sfjQjO5tOZE73kI41N8/Eo1
 71WHeOAbtcwD9LsvSEkgCb8t100CfVsVaVMFlhJZXAB7FLqQ6yIi1olA7Tpcy9EDdd/xExnoVcvJJ
 bRXZbuPa2JXCzCcVvNrGNopi0DAQAc0pXZFx5UsG7qQfBxsPHOPD+DfJx2fAe0dCSW5w=;
Received: from mail-pl1-f171.google.com ([209.85.214.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nhf96-0002xc-4N
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:28 +0000
Received: by mail-pl1-f171.google.com with SMTP id n8so6795263plh.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Apr 2022 15:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=47F3YavIqtOahrtYKZfh2cVMDeC/3NDFumH2A5ynDRo=;
 b=YXUid/CHJmhhem5mNKc9RWQ+2z9g/3n19GePzPJ2UNM3OzjJy9uZk8wVHcuotm0B3Z
 YazsimVHOaetgVR5w/nWPE62bbFGSORHY3qOUxJKn+RhD07R2wY05ARnLnAuvfwmr6c9
 JQpsFE3l5sNsd/vx3eFR9i6nnKlcBHUf+hb1YTURWMAnHkDJ8m+povqq4sNExwo+PJiY
 6Hre+hnxaXXRG+PSU4sr3oqcPx5oKGhnWM8ZBoNO3S9FB7SUTpZRDtdtEhxKXU1gCtFc
 IGoEV4Og7S0I9lroit6GZC2MCTAaIr0jjT6IxX2LQ59xTl+P8KFQRhVWV5cIIYR95HDr
 o89Q==
X-Gm-Message-State: AOAM532X2ZGpEwPxztAX/8cucSYIdFL8+irW/YU53gt891A9/k9uLBIa
 84FUdaibmc9S1HjzMPnb5qIJI7AQR0Xb0g==
X-Google-Smtp-Source: ABdhPJxgsxWcPNO2+93Z3+/1LJCFFPXI0TxhEHtRpTnWh2Ba/JyikPPpD5F7iEfInnBjRs/sirBgcg==
X-Received: by 2002:a17:90a:634b:b0:1ca:6c7e:7952 with SMTP id
 v11-20020a17090a634b00b001ca6c7e7952mr12622518pjs.54.1650579562550; 
 Thu, 21 Apr 2022 15:19:22 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:a034:31d8:ca4e:1f35])
 by smtp.gmail.com with ESMTPSA id
 hi21-20020a17090b30d500b001cd4989ff4csm3794876pjb.19.2022.04.21.15.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 15:19:21 -0700 (PDT)
From: Bart Van Assche <bvanassche@acm.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 21 Apr 2022 15:18:27 -0700
Message-Id: <20220421221836.3935616-23-bvanassche@acm.org>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
In-Reply-To: <20220421221836.3935616-1-bvanassche@acm.org>
References: <20220421221836.3935616-1-bvanassche@acm.org>
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Bart Van Assche <bvanassche@acm.org> ---
 tools/f2fscrypt.c
 | 6 ++++++ 1 file changed, 6 insertions(+) diff --git a/tools/f2fscrypt.c
 b/tools/f2fscrypt.c index 0f0650f4dd63..293173fcb5b4 100644 ---
 a/tools/f2fscrypt.c
 +++ b/tools/f2fscrypt.c @@ -45,6 +45,8 @@ #endif #ifdef HAVE_UUID_UUID_H
 #include <uu [...] 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.171 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.171 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1nhf96-0002xc-4N
Subject: [f2fs-dev] [PATCH 22/31] tools/f2fscrypt.c: Fix build without
 uuid/uuid.h header file
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

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 tools/f2fscrypt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/f2fscrypt.c b/tools/f2fscrypt.c
index 0f0650f4dd63..293173fcb5b4 100644
--- a/tools/f2fscrypt.c
+++ b/tools/f2fscrypt.c
@@ -45,6 +45,8 @@
 #endif
 #ifdef HAVE_UUID_UUID_H
 #include <uuid/uuid.h>
+#else
+typedef unsigned char uuid_t[16];
 #endif
 
 #if !defined(HAVE_ADD_KEY) || !defined(HAVE_KEYCTL)
@@ -354,11 +356,13 @@ static void parse_salt(char *salt_str, int flags)
 			perror("F2FS_IOC_GET_ENCRYPTION_PWSALT");
 			exit(1);
 		}
+#ifdef HAVE_UUID_UUID_H
 		if (options & OPT_VERBOSE) {
 			char tmp[80];
 			uuid_unparse(buf, tmp);
 			printf("%s has pw salt %s\n", cp, tmp);
 		}
+#endif
 		salt_len = 16;
 	} else if (strncmp(cp, "f:", 2) == 0) {
 		cp += 2;
@@ -380,8 +384,10 @@ static void parse_salt(char *salt_str, int flags)
 				(((unsigned char)(h - hexchars) << 4) +
 				 (unsigned char)(l - hexchars));
 		}
+#ifdef HAVE_UUID_UUID_H
 	} else if (uuid_parse(cp, buf) == 0) {
 		salt_len = 16;
+#endif
 	} else {
 	invalid_salt:
 		fprintf(stderr, "Invalid salt: %s\n", salt_str);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
