Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A36D799F371
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Oct 2024 18:54:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t0kok-0002WU-GQ;
	Tue, 15 Oct 2024 16:54:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1t0koj-0002WN-J3
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Oct 2024 16:54:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XSIuw9t8qqAGU3LASSqlk7DcuPSdOBXbd/e951K8nWg=; b=SEZEW2kTZXJBoqbRmLZWgyAd7O
 TVtF+EIhL6e8W7KyTrSEWuZiByfq9K0IStNGia2nZk2mbPYP8BOjQ1FoWmxtPThVKDIcT1NyTyDLg
 d4ZsEpQeeSW+WmKBbSiU3bBcapO7xnFt5FcZztWtA+tNPMIvpvRwxrLLdjtGPBJtHZNU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=XSIuw9t8qqAGU3LASSqlk7DcuPSdOBXbd/e951K8nWg=; b=d
 us1sq9Ic8oO7Qvga6RGHdke+uEyrQAWo/zqdukRMhC54JpHG4Ft3akHqaXogvN8mvRwr+F/gIcnP6
 jtP0dRL9uRY1O+PcDByJKNsRYWlVCR/SCkNCwD9NvwlEJYiJfMUcrYta6Hy5XgAt8Xg95nxj++7nm
 GriTvedefNyV4uFI=;
Received: from mail-pj1-f46.google.com ([209.85.216.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t0koi-0003Az-8h for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Oct 2024 16:54:40 +0000
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2e2cc47f1d7so34578a91.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 15 Oct 2024 09:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729011274; x=1729616074; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XSIuw9t8qqAGU3LASSqlk7DcuPSdOBXbd/e951K8nWg=;
 b=Kwha6a/O2E5jiXiBvAMbPzkQ2yGT/BQjv69FeHM6u2DBalGYWDkPY/6p07b8+g0XJI
 aEDs+1uY5dvfGsnv2UNsb5OAUeXHhZ7zc1UKG2XbBt55LitoO9lXi6sN4HcwECuyhT/v
 I7hkYg6sMQRqgQmAegIE64Cyc6leHNFj+7IS6djVNdyT/xOklBxGfflVzffA8Ehy7tbs
 9IO8acAOEN/0JagcRrkFaFNw+QQjclcZCEMo5h6UGcpC9Td3P55Ljyo3q6Xq3rFcecDG
 Tkp/iQYknfPDa1ZtJ8O0Ex4w748MA+8AZJL90m27Ttvv/jQfGm6sVsgPW8umqaqxWWCx
 zvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729011274; x=1729616074;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XSIuw9t8qqAGU3LASSqlk7DcuPSdOBXbd/e951K8nWg=;
 b=oA/b6lm4GoY6LfcFhwm1Mh0nrTaeoi/K3KijeQA8BjyiOD9oGT2wMfO6qusQN1d4rX
 cvn2AitGC6vNqDPE7hFVeOHpc0f0ntjgOKSaFcJnzOVtPjknpdlVF4BgFpTYDJ5TMBi3
 0BxEBdbnp7AoYIt4ao+5QztbmjPinAbWbrhFusxxEFvGEueQhWNiB3SKo+aXwVFZwrgM
 7IYhixUTEBrwu7THAQ7ajDkW+CEJtkh9S2kBat1AxS9nTzw00Ctk0Z3qb3MM+4j/wsf1
 /A7izdcgL/SaoQNnMCPq2MMw2qXNRXU0JiBzQmaZIq3f2m742lPHxYdV7ZMMTv2uC5f1
 AayQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6pvlcqhtiEUiLVXpcqahA7Twu5b3JehqoCQrcLwTLoSIQmjdDwocd4446y9WOKLunpl7XUOR4iiiiL9X7tAWR@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzBtBKfWe/gkoOFHfFlDnXtKkdfanSvX0gAfC8AmrOdGcncehZ6
 TKasaEg1v+M6r3R0HgqVtf1MrkB7PlTImJ9ABALwcFPva9n6GOyv
X-Google-Smtp-Source: AGHT+IHjqFnVFN8DEmdFfF7q+IxSajH9xKuy29tur0u0k4werNtpBJCAEGuQa+NVMnyC6hO1bUKQsw==
X-Received: by 2002:a17:90a:34c6:b0:2e2:b94c:d6a2 with SMTP id
 98e67ed59e1d1-2e2f081be2emr23860881a91.0.1729011274442; 
 Tue, 15 Oct 2024 09:54:34 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:efdb:1582:924:51c3])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e392f7559asm2048927a91.52.2024.10.15.09.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 09:54:34 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue, 15 Oct 2024 09:54:27 -0700
Message-ID: <20241015165427.1158782-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Now we reclaim too much space before
 allocating
 pinned space for zoned devices. Signed-off-by: Daeho Jeong --- fs/f2fs/file.c
 | 3 ++- fs/f2fs/gc.h | 1 + fs/f2fs/segment.c | 3 ++- 3 files changed,
 5 insertions(+), 2 deletions(-) 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.46 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.46 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1t0koi-0003Az-8h
Subject: [f2fs-dev] [PATCH] f2fs: decrease spare area for pinned files for
 zoned devices
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

Now we reclaim too much space before allocating pinned space for zoned
devices.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/file.c    | 3 ++-
 fs/f2fs/gc.h      | 1 +
 fs/f2fs/segment.c | 3 ++-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 321d8ffbab6e..7d0591d28b71 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1790,7 +1790,8 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
 
 		map.m_len = sec_blks;
 next_alloc:
-		if (has_not_enough_free_secs(sbi, 0,
+		if (has_not_enough_free_secs(sbi, 0, f2fs_sb_has_blkzoned(sbi) ?
+			ZONED_PIN_SEC_REQUIRED_COUNT :
 			GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi)))) {
 			f2fs_down_write(&sbi->gc_lock);
 			stat_inc_gc_call_count(sbi, FOREGROUND);
diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index 2914b678bf8f..5c1eaf55e127 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -35,6 +35,7 @@
 #define LIMIT_BOOST_ZONED_GC	25 /* percentage over total user space of boosted gc for zoned devices */
 #define DEF_MIGRATION_WINDOW_GRANULARITY_ZONED	3
 #define BOOST_GC_MULTIPLE	5
+#define ZONED_PIN_SEC_REQUIRED_COUNT	1
 
 #define DEF_GC_FAILED_PINNED_FILES	2048
 #define MAX_GC_FAILED_PINNED_FILES	USHRT_MAX
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 1766254279d2..b982e80cedd5 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3237,7 +3237,8 @@ int f2fs_allocate_pinning_section(struct f2fs_sb_info *sbi)
 
 	if (f2fs_sb_has_blkzoned(sbi) && err == -EAGAIN && gc_required) {
 		f2fs_down_write(&sbi->gc_lock);
-		err = f2fs_gc_range(sbi, 0, GET_SEGNO(sbi, FDEV(0).end_blk), true, 1);
+		err = f2fs_gc_range(sbi, 0, GET_SEGNO(sbi, FDEV(0).end_blk),
+				true, ZONED_PIN_SEC_REQUIRED_COUNT);
 		f2fs_up_write(&sbi->gc_lock);
 
 		gc_required = false;
-- 
2.47.0.rc1.288.g06298d1525-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
