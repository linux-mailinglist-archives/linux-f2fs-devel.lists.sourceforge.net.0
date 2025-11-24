Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A46DDC7F6A3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Nov 2025 09:45:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hzY9MKZ9PID/n7MWK2EQM+uRA/18v4KSby68IyJbrtM=; b=LqTrww7QJE3Wz4HrxqJjrE6in/
	sViaOPCzC8TodlIDLdXrtIYQKQnaqu5e5gTGQQYZRxmgYZAhdSQgwN6ykICwwSXcgMUIZBVnRW2QC
	Dkww+z9ZUKZOh69AwfQspH35G9C1zZDROUurCKyTF8g7kjM1q1kOxemqECLkj1Qap0h8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNSBw-0007pJ-0Y;
	Mon, 24 Nov 2025 08:45:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zangyangyang66@gmail.com>) id 1vNSBs-0007ni-0X
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 08:44:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YWJXlj9nsk5Pd9WsFqenz7IsT6gF8+t2nBJw/QUISqE=; b=UmR0Mrre5RQRf2Ag9IGdBHUqLA
 cwecN4szqs1BjkQUKFYXhhQTmrBQRAd+r5H2KcLQdsjczFk//MENzzVCy1q/45BkI3Lx3bdt8al0a
 IJb2OK0GWAtklVU4BzIGQqVdf8kzzuipv6C6BxLnGLESy5OPCyFJoXdA5qqdDR6St+YQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YWJXlj9nsk5Pd9WsFqenz7IsT6gF8+t2nBJw/QUISqE=; b=O
 pz/8YJ+26TVozpPrG1q/7mgff7sT07cSgniUayhE4Gx1iW1ZtOehVPkYgpBI5KfdIIVktRgD3Mb48
 a35V/87v7Qsyg1doJBrGoCbOZoPdY2pq+v3os7/8SAj7wztmTy52s3yTC0Ffo3bdQdpdgyHGS4dYS
 zJGKfiQ9JFDZ46/Y=;
Received: from mail-pf1-f172.google.com ([209.85.210.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vNSBr-0002XJ-Ec for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 08:44:55 +0000
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-7b8eff36e3bso6345699b3a.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Nov 2025 00:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763973885; x=1764578685; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YWJXlj9nsk5Pd9WsFqenz7IsT6gF8+t2nBJw/QUISqE=;
 b=Ebj2TqD4ihKpg1sRHGz8nM9B5FxFvuTg28vKWfitrz2w3jVwf165IC11d0tUB2UCHx
 LwqZzGhBR+CESbGZEtcftH4eQfXJNnALMUbde4fxUnEc2gOt7HS6BjpbRj1I9FZMoYGR
 N+hPtM6cR2S08BiqL84XMwCHSqqzHQrSWcS+V4H9upeHwkfkuA5CbXffMnaVfui1Go07
 nhCXJ5QP6PEsepYziqn3TXIJkdX2z3H7XD4L9DXT+IW//GvMy3+b9JtgD9+SmYAQLMXz
 Ba5+rJBcY+Y2s/ItUDPT0eRxDgEILk83Ioum00wXjBxcADM2vsynBFk/U2S7awh97JfC
 nJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763973885; x=1764578685;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YWJXlj9nsk5Pd9WsFqenz7IsT6gF8+t2nBJw/QUISqE=;
 b=qL+5F8udE1ZCnaFWc57KuVp1nWeeK13FBjuEpL4KugDBVKpn34KOclBkXKMszJpPk2
 VZPSlHI8jfNhd289GuMqY66qqOgK941mMjsGQ1/nCP1fi0dzWypUmCVsom3qTbalQ++c
 yVGFL0Wls32L+CWSZm20N7RudJLaqdXJ/hRcwnrK6vyWb1O7uRx3SiUnXafzRcGmIsUc
 OU1Knk+I84eg8IPUxsb55Juci9Q0xnrwke2EAkyIl46IOViLexZeVGvYk2kvvHNUJPWB
 1l+LknQFxEeDJzb0DIjhrjKgMqwwdGqNTGdYL3C8EyFHva27QZkuPD3nDlr9Xs24ulGW
 Qnww==
X-Gm-Message-State: AOJu0Yxjh7mjtCCUTwofilkrbSxqpvMC/RAGeQwRL+zOybgJ0MOpNJGC
 w1qcafbfgWpq2gswvfbcsWzMpXKv/BiPqE1W6BY2AbUTGDuoPEzzSvJk6Vqq7w==
X-Gm-Gg: ASbGncuROONOdPlpZYT47c9T3UH1o9ZZ3NU0Elc6CiqJT++8NpbExnAuyHOvum6E81r
 AxP/9olnLIsrXHJ3I0NYpX/MJqPwr8NSDahN9VT2T/2aaAv/lMCfuImT+Zq7/UUdV092ylpg6+x
 2Clv/s5Ltl2Jjx/fUWGG8Cu19+lfJ/PgM6UjHFshVgJYCikuVtPwRdMu7IoLQDO6f1UgYQfiKVw
 aDn+vu/GvzIhUlb8oOkEzqEp/D53mtH/JnLPAl5xRFWiZoDmt1H08tBSRmX22/Mu6ky4yZJGR3s
 AD8HcC2oureQepirgAMdSo55uK4ZfcWepCB/qgxAonZ56VwmpRqDe96hACITfq5zTwFA3b8ILcz
 5I7HfgU4D/+v5Z9NxkcfCA+pGNybGepogQLZot/TDTSocXLuB0KObIbyVb/XTx/D6ae5x+/90jH
 pGeI8J2aX3o4UPVhmEtlIaXeWbt7O00Ltl
X-Google-Smtp-Source: AGHT+IF+x8NGkcFAwytTxiyKAWG8rxsRCIm/YJ7R2huOfwFtmIao+ab567hB2Hmz8NxWFz42Y5RPCA==
X-Received: by 2002:a05:6a20:748b:b0:334:a523:abe7 with SMTP id
 adf61e73a8af0-3614ecf289emr12091671637.27.1763973884719; 
 Mon, 24 Nov 2025 00:44:44 -0800 (PST)
Received: from zyy.mioffice.cn ([43.224.245.240])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7c3f024b4aesm13629212b3a.33.2025.11.24.00.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 00:44:44 -0800 (PST)
From: Yangyang Zang <zangyangyang66@gmail.com>
X-Google-Original-From: Yangyang Zang <zangyangyang1@xiaomi.com>
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Mon, 24 Nov 2025 16:42:55 +0800
Message-ID: <20251124084255.3033493-1-zangyangyang1@xiaomi.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Commit 42482e81248f ("resize.f2fs: add caution message for
 resize") introduced the `-F' option to force resizing f2fs without displaying
 the caution message. And `add_default_options()` implies that ` [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [zangyangyang66(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [zangyangyang66(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.172 listed in wl.mailspike.net]
X-Headers-End: 1vNSBr-0002XJ-Ec
Subject: [f2fs-dev] [PATCH v2] resize.f2fs: add -g to give default options
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
Cc: Yangyang Zang <zangyangyang1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Commit 42482e81248f ("resize.f2fs: add caution message for resize")
introduced the `-F' option to force resizing f2fs without displaying
the caution message. And `add_default_options()` implies that `-g'
enables `-F' for resize by default. However resize.f2fs does not
currently support the `-g' option. This patch adds `-g' for it.

Fixes: 42482e81248f ("resize.f2fs: add caution message for resize")
Signed-off-by: Yangyang Zang <zangyangyang1@xiaomi.com>
---
Changes in v2:
 - Modify the commit message as suggested by shengyong
---
 fsck/main.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/fsck/main.c b/fsck/main.c
index f7ef092..08d38d8 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -145,6 +145,9 @@ void resize_usage()
 	MSG(0, "[options]:\n");
 	MSG(0, "  -d debug level [default:0]\n");
 	MSG(0, "  -H support write hint\n");
+	MSG(0, "  -f ignore errors during resize\n");
+	MSG(0, "  -F force to resize\n");
+	MSG(0, "  -g add default options\n");
 	MSG(0, "  -o overprovision percentage [default:auto]\n");
 	MSG(0, "  -s safe resize (Does not resize metadata)\n");
 	MSG(0, "  -t target sectors [default: device size]\n");
@@ -640,7 +643,7 @@ void f2fs_parse_options(int argc, char *argv[])
 #endif
 	} else if (!strcmp("resize.f2fs", prog)) {
 #ifdef WITH_RESIZE
-		const char *option_string = "d:fFHst:o:V";
+		const char *option_string = "d:fFg:Hst:o:V";
 
 		c.func = RESIZE;
 		while ((option = getopt(argc, argv, option_string)) != EOF) {
@@ -664,6 +667,12 @@ void f2fs_parse_options(int argc, char *argv[])
 				c.force = 1;
 				MSG(0, "Info: Force to resize\n");
 				break;
+                        case 'g':
+                                if (!strcmp(optarg, "android")) {
+                                        c.defset = CONF_ANDROID;
+                                        MSG(0, "Info: Set conf for android\n");
+                                }
+                                break;
 			case 'H':
 				c.need_whint = true;
 				c.whint = WRITE_LIFE_NOT_SET;
-- 
2.43.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
