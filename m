Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 577F2ABFD7B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 May 2025 21:41:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iVFe02w03W3uVpt4dONeu3Bk9YUnAcHMoG+xT6wHPZA=; b=NOgwcZ5ROAQkc56LzM1B7pczEe
	sF7mtXXlNKUeWmF05QwsNL+EFyk35EgHk5XuZceXPQEb3cMays5Cv8IbWqsrZ4x/7T5/wEHTM3n/S
	0S7a25tFdnvge3hzS8425PlIjiUHtsnB8NE1cwS8qizXSMYxUyBqjb9FgkL0ihaKiyFo=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uHpJX-0006n2-DU;
	Wed, 21 May 2025 19:41:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1uHpJW-0006mw-E6
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 May 2025 19:41:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4xoEcX9Glc+doxMDVDNuceQpM6MovW7t4DTCzMcR2Xs=; b=MF5lxAz9H99OHjXYk5vYc6XTC2
 bH18Qa0Lk7zrfK07Oq6967soEbb+SPrawbN0y7JfZqtbFvT8J9wLcZGgb+nQZl7PoyC+m6Sf5ImdD
 C/yq5PGaMUvZyR6LA/r8Ma1HYc7SzTVqobsixsq9eh2QsRlQYJdyPlHO+d0jZNeermXM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4xoEcX9Glc+doxMDVDNuceQpM6MovW7t4DTCzMcR2Xs=; b=g
 TpgEAA2pH6Mc0O9C6/cwFqafy5TmQRPp1g4oh85Ur3mp8fouw3AC0GJKCrZv6OwezsdyMJyntwraG
 ZVm7CUrUUFl1N1V803OsqM2uiJyzplDoAvpuPnnRDD9a/x4MMKT0AuY5RoTMgSdhp+Xk0zilPfZNR
 B0RQM2qtgAF55txU=;
Received: from mail-pf1-f169.google.com ([209.85.210.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uHpJV-0002HJ-V6 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 May 2025 19:41:18 +0000
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-7398d65476eso5572127b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 21 May 2025 12:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747856467; x=1748461267; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4xoEcX9Glc+doxMDVDNuceQpM6MovW7t4DTCzMcR2Xs=;
 b=hC7ilgpnVt/YgCv4hSDQ4aVdFDhRNfqipRNPzZ+U+yzHeWxFQQHa7u+/6se9ja5D4s
 v9qiYK/qM/aqJkahs1qkrOFwY+7roUmlS+kf1M9jgmvABzdh/1tI6cPYJhcAOEuBAXxX
 ZJALdOoiga/qKJHaujssFvSGS8o6nHYk2Rhk1Eq8HDOCPmS6xlKk6XN5YqnrMR9l9d3N
 ZxInQeIHxDE/P/bVxkhztj/YH89odyIfphgcJBBzVk7qEgfhZ9Y+JgZrs/6UyZhCrF4y
 8cBJNt9V5hMXCdsuYsBsz7HDYPDdzFE7E5pnmftCBxKDs6T8Mio5qFgP72RLuikXjZIY
 DJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747856467; x=1748461267;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4xoEcX9Glc+doxMDVDNuceQpM6MovW7t4DTCzMcR2Xs=;
 b=Ysj8ftWH504TSxdoJ0URRnQn9npB6tPPTSgo8X1DokPdJvyyIt6o5YIRrczuYeCqmz
 MS35RHtZChpiFoG87M4A03uvGAoYxdowvLlwl/CGeWH6KlUcX0UjL7SID+Tv1wUvz9XR
 +DPo/iM2BLmBJPZclpHDczI8aSfqb+YvslIwatw4KCnJCEg2MuPaf6GKWJdxoFYQ5/SC
 O8djxLc/8ExOgfj19JPiJ7AHKknSjqjirQ+6qI/slHENmLjGm/IRDRUlWQkFZLkxB041
 fcKHfjI2KyNS+hr6C0h6ollTKbkSSxfBhHi2WK+zUXc2JDHmVmIQCBVV+8LItLS59eae
 5X2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIxY2TiJmKn0ntzThr/VTbywUT1g/Z2/ue25pApFM/RuPdBLLgQocYCbPxCmn91S+hn9uCi8QnzW9YBBjKyMmR@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz1CpNYITSvbb76Xk9/wzyCnqXvZga9x42ZU8pdbQk14hOrkMnM
 rtBN2Nwlm8cyg+wsqSURrurVzIt0Oj156mya97MIvEtkgQFjJPTDfdi+
X-Gm-Gg: ASbGncsrjnyI50IRnuzYiCiaHmgbIv6kp3zjyWy6RBsVsI5QeaI2TnMbMqzXPZARa8K
 j5Gn3Z9PpoPbiNyyGJYynYtWfT2DUvdZra6O+wO84vG2EAG5GSXaOgu+l8JZxGl3NpFDuJtibBa
 UEEkb/9Fe4r/pCK2JbmhD9ckctesIWzhQhVYvC/RAqxr0D6tteciZL2lRM9sh3xOMC+8gpbuwPK
 9qcDLSMQO0/XXir5zh9x9f/VUHCcWeYFWke1b9otSXgKIp3zYYxg1x2VF3HSvj9Ia+4MDKHVc1i
 o4dl5l4tNfdA+M9/k3dGPlY4TAq5LOdBMQ8BqtB5Vn9AGUTWR5IbBAKB6vabIdRzcya50ZCin7O
 43VJnD3grrf9MCRfSa38WhmgEBwOIDUTTHnltrtQ2Oug=
X-Google-Smtp-Source: AGHT+IFhMRxZV8JlSsA11qtEApD30y4j3LsC1f3X7v7BlDfnc7+l1GBtGmlbSKVghVRBzOcQBIaQ7Q==
X-Received: by 2002:a05:6a21:168c:b0:1f0:e6db:b382 with SMTP id
 adf61e73a8af0-2160d5f2f0dmr38020648637.8.1747856467169; 
 Wed, 21 May 2025 12:41:07 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:a588:8662:c254:867b])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b26eb084650sm9977857a12.61.2025.05.21.12.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 12:41:06 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Wed, 21 May 2025 12:41:00 -0700
Message-ID: <20250521194100.1407220-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.49.0.1143.g0be31eac6b-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Make fsck use dev_fill_block() with zeroed
 buffer instead of dev_fill(). Signed-off-by: Daeho Jeong --- fsck/fsck.c
 | 17 ++++++++++++----- 1 file changed, 12 insertions(+), 5 deletions(-) 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.169 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.169 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uHpJV-0002HJ-V6
Subject: [f2fs-dev] [PATCH] fsck.f2fs: fix null buffer error with dev_fill
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

Make fsck use dev_fill_block() with zeroed buffer instead of dev_fill().

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fsck/fsck.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 893eea7..4d05e1b 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -3526,15 +3526,22 @@ static int chk_and_fix_wp_with_sit(int UNUSED(i), void *blkzone, void *opaque)
 
 	ret = f2fs_finish_zone(wpd->dev_index, blkz);
 	if (ret) {
+		u8 buffer[F2FS_BLKSIZE] = {};
+		u64 blk_addr = wp_block;
 		u64 fill_sects = blk_zone_length(blkz) -
 			(blk_zone_wp_sector(blkz) - blk_zone_sector(blkz));
+		size_t len = fill_sects >> log_sectors_per_block;
 		struct seg_entry *se = get_seg_entry(sbi, wp_segno);
+		enum rw_hint whint = f2fs_io_type_to_rw_hint(se->type);
+
 		printf("[FSCK] Finishing zone failed: %s\n", dev->path);
-		ret = dev_fill(NULL, wp_block * F2FS_BLKSIZE,
-			(fill_sects >> log_sectors_per_block) * F2FS_BLKSIZE,
-			f2fs_io_type_to_rw_hint(se->type));
-		if (ret)
-			printf("[FSCK] Fill up zone failed: %s\n", dev->path);
+		while (len--) {
+			ret = dev_fill_block(buffer, blk_addr++, whint);
+			if (ret) {
+				printf("[FSCK] Fill up zone failed: %s\n", dev->path);
+				break;
+			}
+		}
 	}
 
 	if (!ret)
-- 
2.49.0.1143.g0be31eac6b-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
