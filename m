Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A68072D4F9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jun 2023 01:32:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q8r1C-0003wr-OU;
	Mon, 12 Jun 2023 23:32:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1q8r1B-0003wk-64
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 23:32:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TPeia39v+EiP9jqTHQk/tojPH+ZLqHSXGdrzE/iakQw=; b=mSTh/JnJFs9gB7NiSm/uWxJ/0O
 BCgsNoBNyYDC1x/MHzG3nQifaxAcUd7Mf5679uvVomnsxybH4qk+6gONtglUUzb8RVRHpLUlYdwQq
 zujonsj+jayA7702eT5uLu9ChPPTmisdtwDoWy4dIQ5uEAqBuYFEHqaRYpnMQDe2dIaU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=TPeia39v+EiP9jqTHQk/tojPH+ZLqHSXGdrzE/iakQw=; b=C
 2kfWVkyxZez6P6d8N/4dkJNMx90MxnmoAhid3j3+EOt2X/lGQ2z99SNusIiZd43pC7n+WnqOqmmH2
 ykL8YweE1GjYxmolrHaElUIXX9cI48UwpwoApzbiRl7CwTBQEoniyHeufvRGRxKIzxFjt5ekMX9A9
 RSyWSO78nMJJaj3E=;
Received: from mail-pf1-f171.google.com ([209.85.210.171])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q8r1B-0019kz-Cx for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 23:32:14 +0000
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-652328c18d5so3854267b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 Jun 2023 16:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686612728; x=1689204728;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TPeia39v+EiP9jqTHQk/tojPH+ZLqHSXGdrzE/iakQw=;
 b=N7Yvf4tWx5Db4/mAHrlIvxz1qBlk7NKGCqgpGfNtFkeJ69P3pddmrjYym+OrioqC/w
 dF6prjJKse2fnS0Ww4z2vI7OXq2uL4hTcmtuPPoNTjbSByTZU5c5MjnfSFL3ATOPzxPW
 7T2LSeAYIyy1SeMpg3fcbRV8zHwA5U74Wau166T7Aa78wR41FAIAVG4aFznWaoHzHaZA
 ue5wVMcqMEkf6WCUGYrDMOv+mcAlxHfoQTAJ+P8D7FNSVr6jNHeO1MohNh4S3M4wE/gh
 SRhqxVrzftmCqBI2CyLgl/Zrkcfs8OKu98fg5rUDEJCSWsx1j8PrUSC7MtheUIKYF9gZ
 biUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686612728; x=1689204728;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TPeia39v+EiP9jqTHQk/tojPH+ZLqHSXGdrzE/iakQw=;
 b=SgDqYXR6dOyBEp0YTakwtTwbDyeGxRq/0yVKMgCjJaSEjH6BCnywKbAugU6UNw0kMx
 5ByoAeVrLn63B+2RFHLHZc3a2xIk0zlib4DRh9m+kecyQbRI/2X52z8zi7NUlId0ToZe
 At/7OnHZKORohj8JRmrqtwE8cut6E1zSOage1UiN9UT2l8nzTR5WvtVoS8xGiasQCI+H
 8y+OPCO5H5p960TIFShjacEo3Ha+hKKE+PaJl/S3x+Y57QMAcjcr93njyhkkUPnYgzn3
 3Et6OAXvP67mISFxfno/gM593ABjRactJkOt/N8ZKxgsjuIcaQwebcOKlCYcZ7vk/Cvx
 TNdg==
X-Gm-Message-State: AC+VfDyMK5wZP0XOGRMJdCnPGcY7oozRdlsnvRaWG9SYxaYfcS+aT1Km
 ISV8fXoApcKrIzs1GFSu/Jk=
X-Google-Smtp-Source: ACHHUZ730IisPrEKiU6v+rRJWAEGp8A/xLA/4fYUsjQNLB7j4DZenY5JNBrWImQPt/Fs9D2hcLEOmQ==
X-Received: by 2002:a05:6a00:80e:b0:64a:2dd6:4f18 with SMTP id
 m14-20020a056a00080e00b0064a2dd64f18mr13417925pfk.13.1686612727701; 
 Mon, 12 Jun 2023 16:32:07 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:b77c:cb6:36fb:d85b])
 by smtp.gmail.com with ESMTPSA id
 c9-20020a62e809000000b0064d48d98260sm7388267pfi.156.2023.06.12.16.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 16:32:07 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon, 12 Jun 2023 16:32:03 -0700
Message-ID: <20230612233203.1571983-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong We don't need to report an issue, when the
 zone write pointer already points to the end of the zone, since the zone
 mismatch is already taken care. Signed-off-by: Daeho Jeong ---
 fs/f2fs/segment.c
 | 8 ++++++-- 1 file changed, 6 insertions(+), 2 deletions(-) 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.171 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.171 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q8r1B-0019kz-Cx
Subject: [f2fs-dev] [PATCH] f2fs: check zone write pointer points to the end
 of zone
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

We don't need to report an issue, when the zone write pointer already
points to the end of the zone, since the zone mismatch is already taken
care.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/segment.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 0c0c033c4bdd..8c7af8b4fc47 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4888,8 +4888,12 @@ static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
 			break;
 	}
 
-	// The write pointer matches with the valid blocks
-	if (last_valid_block + 1 == wp_block)
+	/*
+	 * The write pointer matches with the valid blocks or
+	 * already points to the end of the zone.
+	 */
+	if ((last_valid_block + 1 == wp_block) ||
+			(zone->wp == zone->start + zone->len))
 		return 0;
 
 	if (last_valid_block + 1 == zone_block) {
-- 
2.41.0.162.gfafddb0af9-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
