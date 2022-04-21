Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA0C50AB5D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Apr 2022 00:19:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhf8w-0005Kk-CH; Thu, 21 Apr 2022 22:19:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1nhf8u-0005Jx-Lu
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x1QHoKycHIeH7zm2tT8ZUFD0G1KEa2qr986FVc/PA0c=; b=PBdSUE030iIVhKRSPTHlb7K0K1
 gaEDfdqBtsIfeHPO8A0vYGSBRgzo7R30TtSJQUKN6h1pZy/ZknYho8i788Tz7VCv2rmlQXGqrPBC9
 YzY1nMpdnVzgeLBzTeVBzA+RknkuVBgVq6z/y4NZ4K2U0U3R0dQU0UwYJ2j2vJVbT+Do=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x1QHoKycHIeH7zm2tT8ZUFD0G1KEa2qr986FVc/PA0c=; b=IM2/01weIRvrt8ZcjcDq4KPtoX
 lGfGqaAB1jbAm96VaRQvK5oib2QmRFzE7+0GypkX97I6tEcq1LiJwAmIWHIt3E21T4c9cfP4tdZPD
 pSNGRLVmSnJGCXTV4cf8XV7l9cbrwFUmTYISASfQo4hs5Z5bkK8drMDyjTQT/Gpj6/jI=;
Received: from mail-pl1-f170.google.com ([209.85.214.170])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nhf8v-005sQF-0J
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:17 +0000
Received: by mail-pl1-f170.google.com with SMTP id j8so6755529pll.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Apr 2022 15:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x1QHoKycHIeH7zm2tT8ZUFD0G1KEa2qr986FVc/PA0c=;
 b=YJW5sVUjD9lfVT2WFzqK+78YtG3y/qBe6n9mp+crxCxkidj3D8xTEOH5crSWJWXmpZ
 0txsaofxW5PHVJW+I/5isrBwHqWKFFn/d0ZdPjCjttpbKcZi2BIc90VC0MRUEtR3yTmf
 ef7qMGt8YmEY42AM0E6uhFpQMoCDmXEEz4du2rHr0GZYvP0JhSdZd6eqFzmKPk300UaJ
 BeV0jS4pZ9+S5lSMZQtXmTDi4BNjNuR2OaQgVvXR0mYZZvXEa/ezJFGgka8TCBvRVe9+
 5M3anI8ISIFbjAnBMrtDAnvT89EaKksqQuKncr9miJjVXIveDzBXTBlmiMdSNtRM7jfs
 SynQ==
X-Gm-Message-State: AOAM533pFfziBOcnGis4OZhNKT+YEE7Ry1SDezq7b9kLXl5HCX4jJeKf
 V8pMoFyFKggwznwdwGrD1Jo=
X-Google-Smtp-Source: ABdhPJxD4RB6B34Uub+O4vn+lOuMv9zcGSceOo+YTCQfjyBIPsDwzGt5nTwuAdhs39PNqVFDWJgiQg==
X-Received: by 2002:a17:902:76ca:b0:157:1c6:5660 with SMTP id
 j10-20020a17090276ca00b0015701c65660mr1545488plt.105.1650579551306; 
 Thu, 21 Apr 2022 15:19:11 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:a034:31d8:ca4e:1f35])
 by smtp.gmail.com with ESMTPSA id
 hi21-20020a17090b30d500b001cd4989ff4csm3794876pjb.19.2022.04.21.15.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 15:19:10 -0700 (PDT)
From: Bart Van Assche <bvanassche@acm.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 21 Apr 2022 15:18:20 -0700
Message-Id: <20220421221836.3935616-16-bvanassche@acm.org>
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
 Content preview: Prepare for enabling -Wmacro-redefined. Signed-off-by: Bart
 Van Assche <bvanassche@acm.org> --- fsck/f2fs.h | 2 +- include/f2fs_fs.h
 | 5 +---- 2 files changed, 2 insertions(+),
 5 deletions(-) diff --git a/fsck/f2fs.h
 b/fsck/f2fs.h index eacfd42478b8..e5130ba19961 100644 --- a/fsck/f2fs.h +++
 b/fsck/f2fs.h @@ -15, 6 +15,
 7 @@ #include <unistd.h> #include <stdio.h> #include
 <stdbool.h> +#inclu [...] 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.170 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.170 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1nhf8v-005sQF-0J
Subject: [f2fs-dev] [PATCH 15/31] Include <stddef.h> instead of defining
 offsetof()
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

Prepare for enabling -Wmacro-redefined.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 fsck/f2fs.h       | 2 +-
 include/f2fs_fs.h | 5 +----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index eacfd42478b8..e5130ba19961 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -15,6 +15,7 @@
 #include <unistd.h>
 #include <stdio.h>
 #include <stdbool.h>
+#include <stddef.h>
 #include <errno.h>
 #include <fcntl.h>
 #include <string.h>
@@ -37,7 +38,6 @@
 		typecheck(unsigned long long, b) &&                     \
 		((long long)((a) - (b)) > 0))
 
-#define offsetof(TYPE, MEMBER) ((size_t) &((TYPE *)0)->MEMBER)
 #define container_of(ptr, type, member) ({			\
 	const typeof(((type *)0)->member) * __mptr = (ptr);	\
 	(type *)((char *)__mptr - offsetof(type, member)); })
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 60b6dfced74b..dd62bc89a926 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -19,6 +19,7 @@
 
 #include <stdio.h>
 #include <stdlib.h>
+#include <stddef.h>
 #include <string.h>
 #include <time.h>
 #ifdef HAVE_CONFIG_H
@@ -914,10 +915,6 @@ static_assert(sizeof(struct f2fs_extent) == 12, "");
 #define F2FS_PIN_FILE		0x40	/* file should not be gced */
 #define F2FS_COMPRESS_RELEASED	0x80	/* file released compressed blocks */
 
-#if !defined(offsetof)
-#define offsetof(TYPE, MEMBER) ((size_t) &((TYPE *)0)->MEMBER)
-#endif
-
 #define F2FS_EXTRA_ISIZE_OFFSET				\
 	offsetof(struct f2fs_inode, i_extra_isize)
 #define F2FS_TOTAL_EXTRA_ATTR_SIZE			\


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
