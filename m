Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8CF558666
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Jun 2022 20:12:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o4RJZ-0004SH-TL; Thu, 23 Jun 2022 18:12:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1o4RJY-0004S6-4l
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jun 2022 18:12:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eCmB3u9XWRwc4MCQ9di/1b5idBouY1G1OCm3ls371Kw=; b=QX9VLG4f6bonC1/I0p38eGCxxQ
 66GrIp4ln+Qv4/TND8PrLoDAhdgemD1fznwIjax2U9hs7V/YqnPcrL/W4ynVAPEmijWqOVICCvtNl
 QoiXBNNhbeG/0kExQa1QMLX7hgHtDYxjehmNyHG7fgiTmkfEDOeleawhSHKbBDhUvE8E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eCmB3u9XWRwc4MCQ9di/1b5idBouY1G1OCm3ls371Kw=; b=GNqyPUJ7smmfQ5TlrM0CDBAmfa
 MjLoX/OZvkmMq4v7fengN4nyWC0LkYxGgIZvrC+PrfLrwfm/fmkVuxvDntIQEEFM7wwCIIW9IeKSX
 nvIEwa8WCTnyZmxA/IcH2WPi+R3qzoPGLM4Yoi+Z9YO/wSWTES70+g1NPBTNhTqyrLsA=;
Received: from mail-pl1-f169.google.com ([209.85.214.169])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1o4RJY-00BS7t-8A
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jun 2022 18:12:24 +0000
Received: by mail-pl1-f169.google.com with SMTP id n10so1508727plp.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 Jun 2022 11:12:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eCmB3u9XWRwc4MCQ9di/1b5idBouY1G1OCm3ls371Kw=;
 b=jcD4Y2NjbWVQwomsWYvDIqrmDhQQp6C0Ix6kcw8hbeDkE4h3JQUNTU15GyY+pEs/Nt
 ASLUhbfeg7voDtk6DvENlGxrz3Q4uuStcmWQyHDGYcK3jp8/KGfaCEmCUSAwNv0NyNl9
 udnJ6EBp6wwFWnFk2ZX0Hv7e0PIKSFZ7spOlZS7wq79P796h30MHXP0ag7EHn+daWvUi
 TIwzDNoy4b45qi1P84J91TGtPxJH5UyAWpJ+98CDbIPUeZfhZoqZBvMB8FBs+xsgALLE
 TiBYv4a/2riNCv79fhhg0mTqBc75DvM5Sk9/sLPwtBe2ccokMGbOq4wBue7Oo24K5WSP
 z8hg==
X-Gm-Message-State: AJIora9uXPT+fHIkGmJDio5NDkUSyG2tWOtPNVItA4AJd7qolW1oS1R5
 XP1A4e3LD0L5ZupzUoAX6zY=
X-Google-Smtp-Source: AGRyM1tFtcNSXSsU9RAmmTDFtjGQzQOaNUjkcaz6M/h1ysLvVtP9FwHR+wEisAlbpfyQ3O41vk+Jtw==
X-Received: by 2002:a17:903:283:b0:163:be9d:483a with SMTP id
 j3-20020a170903028300b00163be9d483amr39529820plr.166.1656007938610; 
 Thu, 23 Jun 2022 11:12:18 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:70af:1dc5:d20:a563])
 by smtp.gmail.com with ESMTPSA id
 az8-20020a170902a58800b00163d76696e1sm104803plb.102.2022.06.23.11.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 11:12:17 -0700 (PDT)
From: Bart Van Assche <bvanassche@acm.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 23 Jun 2022 11:12:04 -0700
Message-Id: <20220623181208.3596448-2-bvanassche@acm.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220623181208.3596448-1-bvanassche@acm.org>
References: <20220623181208.3596448-1-bvanassche@acm.org>
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Fix the struct f2fs_dentry_block definition on systems for
 which PAGE_SIZE != 4096. This patch does not change the struct
 f2fs_dentry_block
 definition if PAGE_SIZE == 4096. Cc: Peter Collingbourne <pcc@google.com>
 Reported-by: Peter Collingbourne <pcc@google.com> Signed-off-by: Bart Van
 Assche <bvanassche@acm.org> --- include/f2fs_fs.h | 4 ++-- 1 file changed,
 2 insertio [...] 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.169 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.169 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1o4RJY-00BS7t-8A
Subject: [f2fs-dev] [PATCH v2 1/5] Fix the struct f2fs_dentry_block
 definition
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
Cc: Peter Collingbourne <pcc@google.com>, Bart Van Assche <bvanassche@acm.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Fix the struct f2fs_dentry_block definition on systems for which
PAGE_SIZE != 4096. This patch does not change the struct f2fs_dentry_block
definition if PAGE_SIZE == 4096.

Cc: Peter Collingbourne <pcc@google.com>
Reported-by: Peter Collingbourne <pcc@google.com>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 include/f2fs_fs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 21a7e70d952d..fdbf7c7a0b35 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1317,7 +1317,7 @@ typedef __le32	f2fs_hash_t;
 #define SIZE_OF_DIR_ENTRY	11	/* by byte */
 #define SIZE_OF_DENTRY_BITMAP	((NR_DENTRY_IN_BLOCK + BITS_PER_BYTE - 1) / \
 					BITS_PER_BYTE)
-#define SIZE_OF_RESERVED	(PAGE_SIZE - ((SIZE_OF_DIR_ENTRY + \
+#define SIZE_OF_RESERVED	(F2FS_BLKSIZE - ((SIZE_OF_DIR_ENTRY + \
 				F2FS_SLOT_LEN) * \
 				NR_DENTRY_IN_BLOCK + SIZE_OF_DENTRY_BITMAP))
 #define MIN_INLINE_DENTRY_SIZE		40	/* just include '.' and '..' entries */
@@ -1341,7 +1341,7 @@ struct f2fs_dentry_block {
 	__u8 filename[NR_DENTRY_IN_BLOCK][F2FS_SLOT_LEN];
 };
 
-static_assert(sizeof(struct f2fs_dentry_block) == 4096, "");
+static_assert(sizeof(struct f2fs_dentry_block) == F2FS_BLKSIZE, "");
 
 /* for inline stuff */
 #define DEF_INLINE_RESERVED_SIZE	1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
