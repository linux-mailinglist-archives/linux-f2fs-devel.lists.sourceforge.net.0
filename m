Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C622BAA978
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Sep 2025 22:22:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WgCAQvEOjR92kn7aqqRWdUrD5Ip/UygHqC32WMq4ptQ=; b=Fj6RkB490zySifAgPCCtLQWXvQ
	nVQTXAsIus8NIi7IkZFoEo+0d6rHfs225YU5mnrNV14ux+K4zOdOD4aBnucUG5rb5/NwJGAeSDkyT
	GGT7QDc0lTp9SygwiQfIB9nfLnh3EOjiZ8pOnWEV1XG/N5DFRQV8H7JXAQpcMvylgbks=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v3KNu-0004LX-4d;
	Mon, 29 Sep 2025 20:22:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1v3KNs-0004LP-BF
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Sep 2025 20:22:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T2sm/vRhjsyfLR7g1OTpoheSk+lSLNpkJYuUCogkU54=; b=Lf/tQowHw/kgQDEW3F3xrxcXKX
 R8IPSE+FChRTv8BoWRmPfrZLSg9e5bcfIAt7JbFC4V7RQ8mbXPLQqujCLgQtpFOl7Om37StDiYagL
 xWYkV/N6SHAKxkQIKPTFDrwNi+reUJQwtYImEOzuwf+n3Uvp0eD+2WnbYVMvk675/rRA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=T2sm/vRhjsyfLR7g1OTpoheSk+lSLNpkJYuUCogkU54=; b=d
 P6cANJykYnyJ3YaNIawzd+0R/dIRFSvXFsHndGAO6SwIFQPBOuDcMgi64zz5KYm1XjnHDQoQIKX75
 FsGBYNFKVynb2/dxPY774QBtm+P01kjWmJXSGUO1zmfZy0mCDtPYdG/LYX78mGh7tLFQmNKVxD5Xu
 AHVpCKnZcnvhW2OU=;
Received: from mail-pf1-f179.google.com ([209.85.210.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v3KNs-00078n-14 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Sep 2025 20:22:08 +0000
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-782023ca359so2546113b3a.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 Sep 2025 13:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759177317; x=1759782117; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T2sm/vRhjsyfLR7g1OTpoheSk+lSLNpkJYuUCogkU54=;
 b=FD1ZmupCDeoJJsP8FuUEswjfEbcjJYDv6pHpzakZcdxJRmaKwqWlFvytCsUdSFjoCE
 Jg3tFfZhXP0dsHq3iEoQTjdNHjt4edyYRGXE/J7BRdID3g1nOyD8pp0AyHUbrqYFRAmU
 XjVeCb6wVxp61W5oUi1Sqgo4gaMrqFfxCZhwfNT1+Tc3F99KC1Uo71WrQtAgn+NN96dh
 f/EvoZ7kZWba7BHFvmoYN9BY5ATw5KcAEbZnADKSVPrH3N7rWDv9+OM9sI8l6bbwyIWz
 i49+22ZUXIUKghOgZGegxogGu6ntwkb8cfvfBYi8PpAJ9x3SGzrpIW9wUPL4FdYecnE1
 AYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759177317; x=1759782117;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T2sm/vRhjsyfLR7g1OTpoheSk+lSLNpkJYuUCogkU54=;
 b=boKMtunbf6ymuqgnRHC71/Kv/c3xkim05x5PPUQNeTg7aeB4a4dJPHvNjMMJVEW2tS
 s3/K9JayesuTp7mrYfNMDb6rUp24WbSzuM1OTGaLwoaiY+mR/9yJKMxbk2e91NdY/uaG
 hw3mx5h3C/zSW3rAIvZaGq4dbMu9sayusfRxZSjKQ4swQqRGHDZC95ZIGvSRFeby0hmP
 V3Owt8Y9ok6ik/pw6j3o8/IR5DGT7OtW1W9MUBEFz4/jAn3e8Ji8k9g9XIj9uZR1X7Sk
 AG5YWiVZPaCWGseIG1+aGn/AXWoyyONLKPUoBCJzyN5IJej8w5QwN5naZg7g5Phx6hA8
 uLzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUX2zSMd49LTixrnGGy9PypAg7xUQP8tPwRwAAkpd0iscHgONn6DeiwvPrOUAb9aCp/E61LKTHlZM7PsiL81wC0@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyPYgPwpENWl1AQIkoIRKohNV/6WFfZaoNBhYA9sz+BOdlFY1sX
 qH/1gs5yazR/rohNvPl8oFb6awLsd7bKLVisKPtgeE80SpnQOaefvF28
X-Gm-Gg: ASbGncsQXNSvgF0k0jx61Y8q/qyGBKavr24jrLzXeCVOE2ZAnUn3dWNEh9ltnMI0mRm
 +TxHuojiK7q4nRRr+gmjHcBkL819nCR+q9DDOwoBsUBovnyUXBPDn9LG3BpU7lUWd2sstthlook
 fcsdADV6VL8sh2tqOf+CKwpzv+z/qLrbk1LJQOD0Xp674lldlXvPW+tjyOSfjVgYwwwQ5nSChiq
 GhguTE1BXP6lMcxaXMoOIrJlH//Cbi3ku9PbMrsyPRTGiK/1Jpl/4asNjOaSb+WO86S0C6BLJ7p
 iOfiercXF7R8NuW/37tdtrB8xqvnJyy4KrV1PF8Qp0g99ttDKT0Ajc+igH/J7Fc3Bo650J/veJi
 aUyK1c+dQ9pLNeCqOv9ZLvFkvmuPqf+GNXv1B36EBRvglb55qpz+rxQ9j7eANKJVtqrZCcUf5lB
 yqP5uRGPp21favOte+7TQlxRijUACMZhQ9YSw=
X-Google-Smtp-Source: AGHT+IEdVlb4qOYCZymoh3CgEoyRLCFD1N86KzkJdDtLXrCSDr2EYOIbGHKmT9oEVBeoLU6KMtggEQ==
X-Received: by 2002:a05:6a20:a11c:b0:2f9:dc8d:d2a2 with SMTP id
 adf61e73a8af0-2f9dc8dd60emr15418044637.2.1759177317351; 
 Mon, 29 Sep 2025 13:21:57 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e7c:8:34c3:b64f:90cb:9625])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b57c55a2c45sm11843310a12.45.2025.09.29.13.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 13:21:56 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon, 29 Sep 2025 13:21:52 -0700
Message-ID: <20250929202152.2984080-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.51.0.570.gb178f27e6d-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong total_valid_blks_available is already a
 multiple of c.blks_per_seg. So,
 we don't need an additional alignment adjustment.
 Signed-off-by: Daeho Jeong Reviewed-by: Chao Yu --- v2: add ASSERT() to ensure
 total_valid_blks_available is a multiple of c.blks_per_seg ---
 mkfs/f2fs_format.c | 9 +++++---- 1 file changed, 5 ins [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.179 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1v3KNs-00078n-14
Subject: [f2fs-dev] [PATCH v2] f2fs-tools: remove unnecessary alignment for
 blocks_for_ssa
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

total_valid_blks_available is already a multiple of c.blks_per_seg.
So, we don't need an additional alignment adjustment.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
Reviewed-by: Chao Yu <chao@kernel.org>
---
v2: add ASSERT() to ensure total_valid_blks_available is a multiple of
    c.blks_per_seg
---
 mkfs/f2fs_format.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index b98976c..6deb671 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -497,11 +497,12 @@ static int f2fs_prepare_super_block(void)
 			get_sb(segment_count_nat))) *
 			c.blks_per_seg;
 
-	if (c.feature & F2FS_FEATURE_RO)
+	if (c.feature & F2FS_FEATURE_RO) {
 		blocks_for_ssa = 0;
-	else
-		blocks_for_ssa = total_valid_blks_available /
-				c.blks_per_seg + 1;
+	} else {
+		ASSERT((total_valid_blks_available % c.blks_per_seg) == 0);
+		blocks_for_ssa = total_valid_blks_available / c.blks_per_seg;
+	}
 
 	set_sb(segment_count_ssa, SEG_ALIGN(blocks_for_ssa));
 
-- 
2.51.0.570.gb178f27e6d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
