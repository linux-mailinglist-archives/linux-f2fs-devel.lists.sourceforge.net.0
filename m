Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C31FC50AB61
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Apr 2022 00:19:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhf95-0001lN-IH; Thu, 21 Apr 2022 22:19:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1nhf93-0001kM-Ji
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q8n3MY43a4J4EbAx1VMm12uBHmK7pzCFOUG6EJXEUw4=; b=hRTW2GSYjNbijuRe2daCsLZP1A
 HhVUCfZktFHX+5zgmTpGVgQ8HhVRfowfHEXGRP/Sd7DlPqhALUFjBiUsHjF1/xd3B4Ssa9zyAIoQe
 GJOjGCVVpcWPAHqe6ipJFRT8hKFrr6vSOX5vIL4gmgCJ/ZTS1eXDnSBpY/Azx37QLmYA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q8n3MY43a4J4EbAx1VMm12uBHmK7pzCFOUG6EJXEUw4=; b=mg/LR9CmMN/Apa3vLbxn467A2M
 VkR+eWhD0z/w07+I7LVLdC//HVKVWeoa2UPZKdNe/qSpW/MVmX69RdkPNtp21HPJS76jWTMuTic8H
 c6xd21RbSbzVi5wYjfMUHgN3fs5PDi1E7hzTyCnwanDiGZwaBu9LwUFdMYdfADEfwAyc=;
Received: from mail-pf1-f178.google.com ([209.85.210.178])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nhf91-005sRC-Eo
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:23 +0000
Received: by mail-pf1-f178.google.com with SMTP id j17so6238048pfi.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Apr 2022 15:19:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q8n3MY43a4J4EbAx1VMm12uBHmK7pzCFOUG6EJXEUw4=;
 b=cO+b7LXxF+dAyuI56J1jVIayTIML3E4NV9qAP7hrgO7o2UOkWKL9gb8a8hx5DlwNs7
 VWnFAAOUZGHmx04dIB31DUioYXaRChTvvE9rNqp8tjmmUEPa26l7y6FYECxsN5KTq2nf
 xPRb/Wmbzsh5hPEYFbDmtE46mQmeELOKDrQA6ny9WAJ67jHu8jlLzP6Qr9kIhISs9ecq
 IJzWe7r0vQKPqDs84I1oToovoy62BPOkQqlIf6Ek4J6ykSbLqhCvCWuiZHuTX6p2iAc8
 hTr4r2xQUqlL4/CVBZ5awGNkFixZXtupmKCoo9n3vMolyupkCQI4dz+JAErwgYFayUpV
 FSZA==
X-Gm-Message-State: AOAM532YRYjINVqc37v+G8w8zT5eH8CnvlS+XkGtBP9b+EosXkc2L0JR
 RlqNIJhgUPh02o8AHVQKE7/qCz/wHO5KTQ==
X-Google-Smtp-Source: ABdhPJyBeDccp6AMRU1OswhRIa+xK78CvJ1RPKLrXYGCMqueiV7LQn4jPyhRv25qL/pqnm1XizeyDA==
X-Received: by 2002:a63:cd07:0:b0:39d:a6cd:cf72 with SMTP id
 i7-20020a63cd07000000b0039da6cdcf72mr1273009pgg.421.1650579557864; 
 Thu, 21 Apr 2022 15:19:17 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:a034:31d8:ca4e:1f35])
 by smtp.gmail.com with ESMTPSA id
 hi21-20020a17090b30d500b001cd4989ff4csm3794876pjb.19.2022.04.21.15.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 15:19:16 -0700 (PDT)
From: Bart Van Assche <bvanassche@acm.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 21 Apr 2022 15:18:24 -0700
Message-Id: <20220421221836.3935616-20-bvanassche@acm.org>
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
 Content preview:  The selinux/android.h header file is available in Android
 but not in the Android NDK. Hence this patch that detects presence of that
 header file at configure time. Signed-off-by: Bart Van Assche
 <bvanassche@acm.org>
 --- configure.ac | 1 + fsck/sload.c | 4 ++-- 2 files changed, 3 insertions(+), 
 2 deletions(-) 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.178 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.178 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1nhf91-005sRC-Eo
Subject: [f2fs-dev] [PATCH 19/31] configure.ac: Detect selinux/android.h
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

The selinux/android.h header file is available in Android but not in the
Android NDK. Hence this patch that detects presence of that header file
at configure time.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 configure.ac | 1 +
 fsck/sload.c | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/configure.ac b/configure.ac
index 317030dad44f..fc094b72b583 100644
--- a/configure.ac
+++ b/configure.ac
@@ -108,6 +108,7 @@ AC_CHECK_HEADERS(m4_flatten([
 	mntent.h
 	pthread_time.h
 	scsi/sg.h
+	selinux/android.h
 	selinux/selinux.h
 	sparse/sparse.h
 	stdlib.h
diff --git a/fsck/sload.c b/fsck/sload.c
index 475ea6dac5f6..00c3403dace0 100644
--- a/fsck/sload.c
+++ b/fsck/sload.c
@@ -31,7 +31,7 @@ typedef void (*fs_config_f)(const char *path, int dir,
 #ifndef _WIN32
 static fs_config_f fs_config_func = NULL;
 
-#ifdef WITH_ANDROID
+#ifdef HAVE_SELINUX_ANDROID_H
 #include <selinux/android.h>
 #include <private/android_filesystem_config.h>
 #include <private/canned_fs_config.h>
@@ -324,7 +324,7 @@ static int configure_files(void)
 #endif
 skip:
 #endif
-#ifdef WITH_ANDROID
+#ifdef HAVE_SELINUX_ANDROID_H
 	/* Load the FS config */
 	if (c.fs_config_file) {
 		int ret = load_canned_fs_config(c.fs_config_file);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
