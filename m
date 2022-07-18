Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD35C577D35
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Jul 2022 10:11:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oDLqf-0002UP-93; Mon, 18 Jul 2022 08:11:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <duguoweisz@gmail.com>) id 1oDLqP-0002RU-5q
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 Jul 2022 08:11:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=koJtdu2xGKY/BDY+kAcaq9hS2IfMj226ck1h8XVx8nc=; b=KP0ZCALCNG2/QFe1cL93ZhFp93
 NomT/s4PcyA49UxT8qasl31fLEdTX8IJd+cEVvKUm2+aWGZpCgcvTz/Qc8Ux8xpMjDSpdJ5P2B3o7
 +MzyDcDRHpdUwswfzGQqlUQvECse8ZMsL8X2fF6dDuisJpHULHryfONg168MUV8SCTao=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=koJtdu2xGKY/BDY+kAcaq9hS2IfMj226ck1h8XVx8nc=; b=O
 mrh7W+juDtxZN9wGyRyJpt8CpEaNFLIGIkUmThf4oHIfpbOt5GgmeeB3QxARWAGSFxdUUqDvw0mqY
 3IuZiRfvVJqfV7/6bfdRt/21F/1IlauWVhcpLuDlqGE38KfHzaIwTL30FSDzrW/AzAHNZBThNHGkS
 s5pM1t8j+mC1hkTs=;
Received: from mail-pg1-f180.google.com ([209.85.215.180])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1oDLqK-002U7B-OC
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 Jul 2022 08:11:08 +0000
Received: by mail-pg1-f180.google.com with SMTP id 72so9937624pge.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 18 Jul 2022 01:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=koJtdu2xGKY/BDY+kAcaq9hS2IfMj226ck1h8XVx8nc=;
 b=YPfCzd+LWX6tGDrhIg8VyeRtxSwuQnIytXKBmgqlJU+EP1t3GV3USjvadSwh21GTWn
 bIxC9/uswSeopFMkbYMOtzFJVtEA3ZGrZBZC69To+Tp+or9+gD9lUJJ3MIahxw+6p7Gx
 r0ogkc0Ppp4Pv8PTWZmNkCDUCuyjHUVHeVFiqx5Y9FHWpGQrfLEyaZXSkfaAASPZ/lgH
 vYj3As3RcWhFUBLOB/naxgsoKzkpo54qn/TWlDqmuOe7+TgtZqKkPU9F2fFjnOlOLkcM
 LsK/QN+01r/wML+H8xKfxZyYepasaICMvcZr4oF7lS7S3Hj1r8jyPeeadjNbz1FrzRxL
 5IhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=koJtdu2xGKY/BDY+kAcaq9hS2IfMj226ck1h8XVx8nc=;
 b=7KCA7vajpTp/LIh0FgFC3CIEvlxY0/Uxm8ialwn/0bORa3dsN9aF59fW0LCcm13Zui
 3V6+DMSTEc58jRPUCh4VQ9Hh/DpCC0rs/e223x8jPDyIE/eDYjt8usqjEvkqAx2a7Ajs
 ND7rrwhTefaZSUBJfqoMsmI/dP3BuruhWEiwICX+xXffVbXDnftXCMXAifDMfzhgSLSS
 8diHSbl5aCFJ5NA3YbYOQ9sKPYu6hBpsIa5khEmHS06et4c/KUCt7+bmnRLAZu7H66Ne
 TWLOqGmN5U1bmP4c56w/rgKuP6wfWsOmm7oVXUl8bifxp53DEzPdvvXI9Djussk1x5a4
 9Vgg==
X-Gm-Message-State: AJIora/kvMtKNnVA+9PKLmaKG29+FM4v4aidXCt1ss4sDwlFgnHfGfxM
 R+cCgA8iTn1uBPcyW2GG3yc=
X-Google-Smtp-Source: AGRyM1s1EKjylolsXMIuvJO65KwmrcIJ8rMJh/CjiItqMsskcy1K0pyvsDM0UwUrI7oSMmx+Ha9VmQ==
X-Received: by 2002:a63:6a82:0:b0:419:de8c:8ca with SMTP id
 f124-20020a636a82000000b00419de8c08camr14123782pgc.467.1658131859151; 
 Mon, 18 Jul 2022 01:10:59 -0700 (PDT)
Received: from mi-HP-ProDesk-680-G4-MT.mioffice.cn ([43.224.245.232])
 by smtp.gmail.com with ESMTPSA id
 ng8-20020a17090b1a8800b001ef9479373fsm11047865pjb.4.2022.07.18.01.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 01:10:58 -0700 (PDT)
From: Guowei Du <duguoweisz@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 18 Jul 2022 16:10:38 +0800
Message-Id: <20220718081038.2279-1-duguoweisz@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: duguowei If there are more than one f2fs sbi, there
 will be more discard threads. But the comm is too long to show dev minor.
 So, change the default prefix of thread from "f2fs_discard" to "f2fs_dcd".
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.180 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [duguoweisz[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.180 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oDLqK-002U7B-OC
Subject: [f2fs-dev] [PATCH] f2fs: modify task name prefix
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
Cc: linux-kernel@vger.kernel.org, duguowei <duguowei@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: duguowei <duguowei@xiaomi.com>

If there are more than one f2fs sbi, there will be more
discard threads. But the comm is too long to show dev
minor. So, change the default prefix of thread from
"f2fs_discard" to "f2fs_dcd".

Before:
$ ps -e | grep f2fs
1628 ?        00:00:00 f2fs_ckpt-7:10
1629 ?        00:00:00 f2fs_flush-7:10
1630 ?        00:00:00 f2fs_discard-7:
1631 ?        00:00:00 f2fs_gc-7:10
2030 ?        00:00:00 f2fs_ckpt-7:27
2031 ?        00:00:00 f2fs_flush-7:27
2032 ?        00:00:00 f2fs_discard-7:
2033 ?        00:00:00 f2fs_gc-7:27

After:
$ ps -e | grep f2fs
1628 ?        00:00:00 f2fs_ckpt-7:10
1629 ?        00:00:00 f2fs_flush-7:10
1630 ?        00:00:00 f2fs_dcd-7:10
1631 ?        00:00:00 f2fs_gc-7:10
2030 ?        00:00:00 f2fs_ckpt-7:27
2031 ?        00:00:00 f2fs_flush-7:27
2032 ?        00:00:00 f2fs_dcd-7:27
2033 ?        00:00:00 f2fs_gc-7:27

Signed-off-by: duguowei <duguowei@xiaomi.com>
---
 fs/f2fs/segment.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 874c1b9c41a2..2eeefcbe62db 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2018,7 +2018,7 @@ int f2fs_start_discard_thread(struct f2fs_sb_info *sbi)
 		return 0;
 
 	dcc->f2fs_issue_discard = kthread_run(issue_discard_thread, sbi,
-				"f2fs_discard-%u:%u", MAJOR(dev), MINOR(dev));
+				"f2fs_dcd-%u:%u", MAJOR(dev), MINOR(dev));
 	if (IS_ERR(dcc->f2fs_issue_discard))
 		err = PTR_ERR(dcc->f2fs_issue_discard);
 
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
