Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2380450AB6C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Apr 2022 00:19:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhf9L-0008Ar-Hj; Thu, 21 Apr 2022 22:19:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1nhf9J-00089u-UZ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qzzbN48Kl+pUhbltBVHvyiViL4SawscsPlNy2KjwB4w=; b=X9sm8zF1JhvTq4x4KFHdLv96ip
 S467iVVDT+CI/lehAgcFJwpuM668YRvmH9YSerz2QkvKOkZxziims9eAJQBzf/pJ85zH9ixyr7gbH
 ygjMLmtapVBFulRGlR6J9MkRDf8LGpS3F8bSPp0OhKTN/liMS12qYITU11ebX5ABxlQk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qzzbN48Kl+pUhbltBVHvyiViL4SawscsPlNy2KjwB4w=; b=RHQDVQOaHLK+nwuzpg6dPsZ3yV
 GR/N4svn3xjBD1h3MrlQcWqICF6CcfmbIhnwYF6loIeDJ6wL+q1fBa4SW2acMdniPxhuLlhiDsQBT
 0qsXfAyt0zQc2C/7w/Z1/YFj5DBX9SezVA+ljQyioBIzqfEfRhdUCHLC2e60c2bitJ9s=;
Received: from mail-pl1-f181.google.com ([209.85.214.181])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nhf9I-005sTZ-A9
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:40 +0000
Received: by mail-pl1-f181.google.com with SMTP id q3so6789358plg.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Apr 2022 15:19:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qzzbN48Kl+pUhbltBVHvyiViL4SawscsPlNy2KjwB4w=;
 b=0YCroDiCzgtbADotUU5nnq60/GNADZe4JtDDaCVLYIHynXObm9nkNFIuvhPo3dRyjH
 Ud5TceoAVNav9c6P/vWS7fnKpbfQvczeltRg5dS8eGVJyyiI4vRZk3CYAc7nISym64Vw
 UXXca+7y4KeYo32AFTDvBMo1xjSPI6sClozisTU7g6hdkWWRVoayxgrN8s49WIjSVqoi
 1waTr6fmzFaggiTfDJRKsqLJ+Obit8PkYPBJ0eQdclulxyUDZK08NNybQtoHCD8l3HRJ
 Ynje1EbGSTPEqcNbku94ry90HiS4xSr1jvHB8Rdcjf5PtFJN9jXwKGB0xrPKVjJYdUQH
 /Sgw==
X-Gm-Message-State: AOAM5325loxoUv+STZtxEC4Q70HaTboChIogZB9QdKH+jZqEL8RSI8sT
 YtAuMqjV+o6hhSQ7NtdzLU8=
X-Google-Smtp-Source: ABdhPJx2dArRqL+RfAgKOmIjaYvALKYKyOB/K00Sa910h7dKGch8U0RCt69UGUn9pWjORCaroIxMiQ==
X-Received: by 2002:a17:903:40c6:b0:15a:8355:3c3b with SMTP id
 t6-20020a17090340c600b0015a83553c3bmr1587580pld.9.1650579574426; 
 Thu, 21 Apr 2022 15:19:34 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:a034:31d8:ca4e:1f35])
 by smtp.gmail.com with ESMTPSA id
 hi21-20020a17090b30d500b001cd4989ff4csm3794876pjb.19.2022.04.21.15.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 15:19:33 -0700 (PDT)
From: Bart Van Assche <bvanassche@acm.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 21 Apr 2022 15:18:35 -0700
Message-Id: <20220421221836.3935616-31-bvanassche@acm.org>
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
 Content preview: __SANE_USERSPACE_TYPES__ must be defined before
 <linux/types.h>
 is included. Hence this patch that moves the definition of that macro into
 the source files that need it. Signed-off-by: Bart Van Assche
 <bvanassche@acm.org>
 --- include/f2fs_fs.h | 7 ++++--- tools/f2fs_io/f2fs_io.c | 3 +++ 2 files
 changed, 7 insertions(+), 3 deletions(-) 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.181 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.181 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1nhf9I-005sTZ-A9
Subject: [f2fs-dev] [PATCH 30/31] Fix PowerPC format string warnings
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

__SANE_USERSPACE_TYPES__ must be defined before <linux/types.h> is
included. Hence this patch that moves the definition of that macro into
the source files that need it.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 include/f2fs_fs.h       | 7 ++++---
 tools/f2fs_io/f2fs_io.c | 3 +++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index bc57dd07819a..eedb38a6da1c 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -17,6 +17,10 @@
 #ifndef __F2FS_FS_H__
 #define __F2FS_FS_H__
 
+#ifndef __SANE_USERSPACE_TYPES__
+#define __SANE_USERSPACE_TYPES__       /* For PPC64, to get LL64 types */
+#endif
+
 #include <stdio.h>
 #include <stdlib.h>
 #include <stddef.h>
@@ -42,9 +46,6 @@
 
 #include <inttypes.h>
 #ifdef HAVE_LINUX_TYPES_H
-#ifndef __SANE_USERSPACE_TYPES__
-#define __SANE_USERSPACE_TYPES__       /* For PPC64, to get LL64 types */
-#endif
 #include <linux/types.h>
 #endif
 #include <sys/types.h>
diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 6bb094cc7f25..0edac6fedf33 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -18,6 +18,9 @@
 #ifndef O_LARGEFILE
 #define O_LARGEFILE 0
 #endif
+#ifndef __SANE_USERSPACE_TYPES__
+#define __SANE_USERSPACE_TYPES__       /* For PPC64, to get LL64 types */
+#endif
 
 #include <errno.h>
 #include <fcntl.h>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
