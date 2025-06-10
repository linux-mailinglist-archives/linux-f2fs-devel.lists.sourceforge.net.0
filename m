Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DC1AD3D1D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jun 2025 17:30:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zqfs9QtrkrdQnK40S5C5UBqW3TwT5dwMtJ2cXFf0Rr8=; b=LWVGbERcfK/3SAD+fA+902XJ+9
	iwNftYD8rAzF6jzsUh66EHxUoUdY1UJmZSCouSekkolPDgxtmM91wENriBKlc/F6KrvRJEUYZAo0y
	8Bt4rjuhHnlKm+3W3HRQ4uKBdaK4kul/QhYNPfOwROiQwS4H5LuEcXt7TgVL0qKqlizE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uP0va-0004Xe-Fn;
	Tue, 10 Jun 2025 15:30:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uP0vQ-0004XL-5p
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:30:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vlyqkARjRFzS7xVeONss8SgN+pa5WOxnIY8CyZDWUog=; b=CGmlakLA8+A9KdviQ8848B11P9
 PLbE9RCjx4Z2//IrO6YQtR2Y97qZtcjvYr/l9jWBEydGBbBNk0wcGIq05u9K6AYmz+BM0HnyDWW04
 +oHZcJj7JxPts0ywn6WtT88k/NJ0XHwezBuji5TX8CvubLTCdvFGWDr5YYL3WxDAFeHg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vlyqkARjRFzS7xVeONss8SgN+pa5WOxnIY8CyZDWUog=; b=IgghiukGBB/WNBnwmH8JMFCn26
 HYo0TNGyzpsR4776iCrwMpixhN3/F9hUi2CFWk14OHmtJiuSEuzjcRQvKS3nQi1L1SEewPgq46Ok9
 3MkCCFP0sDvTKSmmGTr7ueY+0xWcZXRu5ow7XRuMBCVRq7q/P5PMdOBL+TUYj55d9zQ4=;
Received: from mail-qk1-f172.google.com ([209.85.222.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uP0vP-00056b-Qq for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:30:08 +0000
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-7d094d1fd7cso729376585a.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Jun 2025 08:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749569397; x=1750174197; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vlyqkARjRFzS7xVeONss8SgN+pa5WOxnIY8CyZDWUog=;
 b=gMskkC+I0qIClBuKUnIvMv3IpmUcuQYkEQfWRn60jbAiJin+KAgXQt+6TnVz+4aBEB
 APQqyfOOrnfNyIfjgKF5+JB0oY2Kch1Oet7fhUIzOAxLZIvB0ADFiQpQ3HGm1SRw5k3z
 k0Je9JwFXy9I4El6qZb+RnaOfAvU7o4Bcws4KTi4qfnNV8TNSxYxRb3WorTrbvu6Oh3s
 vzHUUfXD8Vhc9ZVS/3mAlesOC91gA/NKm7tCxqnaZrL8vdA31vMxcQJwwYAeMe4LWR+m
 YbCQnKacE5WpRB//oSM+rF3+8Iy0Pltj/CAFlwrlTKGC1v5ByZBgQFR53dgXTzgPdCWY
 KTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749569397; x=1750174197;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vlyqkARjRFzS7xVeONss8SgN+pa5WOxnIY8CyZDWUog=;
 b=Y5go+z//AFjfX5WgPjbNbh7N78q4YMJmnE5r+jkZDcZ6MRGLmiNWKOqd/bDNSAkcLW
 V8GCyscEB3sBlRUE8siI3xP8wGRXM2BApjv8/puKUlAUnMS62LWhSOPQU1MarP+M0A5p
 0AT4973bWG3ldwhRdfyFdIWWG7BftAZIY6SKn+wviTagJIsPDcvZdO1VakI938B734Pl
 ieGhd7bBpjv7Afrhwi9adjGz56NL1T0JsUqRtmfWOakSiavTJhXb/G/iLhBx3SZG//SC
 uwcxFmki0vMasIOIhnLjHmPu9tc72aNVLAty63TUyiRvXYQDpmNy5KL3smnTxRXw0fSO
 /WiA==
X-Gm-Message-State: AOJu0YyakrUyrmEEB1pt7f9kHlo3+e8OTZe10NiVIpHyO/dwti0eVr5H
 wq6rQyHoQqxDAIKyqEbfOCFOR4vymCfgqhQnO5e0Uk20TOEEOBzLMH+hOBPthQ==
X-Gm-Gg: ASbGncs2cMLEeip8lAXW/EwO3LCVh+2i8uC1J3Z8Jit/QdPPS4IVfBGroVScuQuuhqZ
 fE6/bIeNSEbelwext1g3QgbwDCxyUZgA57BwaqoZe3jNQ2gwSgL+POyoVqC/TNMKKQOhP5xfm9m
 WjHBJKEyVkW0pXbjKdNlIML8UWjdTCtRLBLM5iCRRavJl2w0vLiGPSfAug/vX1fvUcuU6EwIkg1
 rKZa8hrR64THa91W+UdtY4ulgsME6SqgGKFYuQ9eGS4npW9LtOi2v6H8zupnR6uTskGcW2xoUTb
 EKQhkXsI3yqD4jc9R277WcrYUkHA4ywedpOrsXte4fJL+RLPX42kNApx90DpX5JCEco5
X-Google-Smtp-Source: AGHT+IHA9rhnbNOrCxpTXVG2evO1Atajk+hgnj/GeCVadd44cQ91R8EbD36ES4G8LL0bxgYc1SMj7g==
X-Received: by 2002:aa7:9306:0:b0:748:2ff7:5e22 with SMTP id
 d2e1a72fcca58-7482ff761d1mr18598011b3a.10.1749559113918; 
 Tue, 10 Jun 2025 05:38:33 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0847aesm7539815b3a.105.2025.06.10.05.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:38:33 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 10 Jun 2025 20:37:26 +0800
Message-ID: <20250610123743.667183-17-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610123743.667183-1-shengyong1@xiaomi.com>
References: <20250610123743.667183-1-shengyong1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Sheng Yong Signed-off-by: Sheng Yong ---
 tests/f_sb_errors/README
 | 5 +++++ tests/f_sb_errors/expect.in | 7 +++++++ tests/f_sb_errors/script
 | 22 ++++++++++++++++++++++ 3 files changed, 34 insertions(+) create [...]
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.172 listed in wl.mailspike.net]
X-Headers-End: 1uP0vP-00056b-Qq
Subject: [f2fs-dev] [RFC PATCH v2 16/32] tests: add fsck testcase of fixing
 errors recorded in sb
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
Cc: shengyong1@xiaomi.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Sheng Yong <shengyong1@xiaomi.com>

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
---
 tests/f_sb_errors/README    |  5 +++++
 tests/f_sb_errors/expect.in |  7 +++++++
 tests/f_sb_errors/script    | 22 ++++++++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 tests/f_sb_errors/README
 create mode 100644 tests/f_sb_errors/expect.in
 create mode 100644 tests/f_sb_errors/script

diff --git a/tests/f_sb_errors/README b/tests/f_sb_errors/README
new file mode 100644
index 000000000000..df118e825aac
--- /dev/null
+++ b/tests/f_sb_errors/README
@@ -0,0 +1,5 @@
+1. create f2fs image
+2. inject s_stop_reason in super block
+3. fsck -a detects error and clear the error
+4. inject s_errors in super block
+5. fsck -a detects error and clear the error
diff --git a/tests/f_sb_errors/expect.in b/tests/f_sb_errors/expect.in
new file mode 100644
index 000000000000..7985a28e59ab
--- /dev/null
+++ b/tests/f_sb_errors/expect.in
@@ -0,0 +1,7 @@
+Info: Automatic fix mode enabled.
+Info: checkpoint stop reason: fault_inject(1)
+Info: Automatic fix mode enabled.
+Info: fs errors: fail_decompression
+Info: Automatic fix mode enabled.
+Info: No error was reported
+Info: Force to fix corruption
diff --git a/tests/f_sb_errors/script b/tests/f_sb_errors/script
new file mode 100644
index 000000000000..d625900192ff
--- /dev/null
+++ b/tests/f_sb_errors/script
@@ -0,0 +1,22 @@
+#!/bin/bash
+
+DESC="superblock[1] with s_stop_reason and s_errors"
+
+. $TOPDIR/tests/helpers
+
+cleanup
+make_f2fs > $LOG
+
+$INJECT --sb 1 --mb s_stop_reason --idx 1 --val 1 $META >> $LOG
+$FSCK $FSCK_OPTS -a $META > $OUT
+
+$INJECT --sb 1 --mb s_errors --idx 0 --val 2 $META >> $LOG
+$FSCK $FSCK_OPTS -a $META >> $OUT
+
+# both -a and -f cannot detect errors
+$FSCK $FSCK_OPTS -a $META >> $OUT
+echo "" >> $OUT
+$FSCK $FSCK_OPTS -f $META >> $OUT
+cat $OUT >> $LOG
+
+check_result
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
