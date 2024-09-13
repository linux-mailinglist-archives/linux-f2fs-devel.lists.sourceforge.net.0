Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC042978A93
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Sep 2024 23:28:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1spDpw-0000nr-SM;
	Fri, 13 Sep 2024 21:28:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1spDpv-0000nj-Dv
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Sep 2024 21:28:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qCOzp6QHBfvs6xs4vpuMqr/hEn/jvY9MoT1Ovg5yP4w=; b=FT95998LRHsc3cDeVreI2iWH7t
 1a/5Dex7p1zMDgZtMd/peb2T3nTSCzAVcXDiGLe3blIdOa36ThZE516ijdy+WX+xDdEHSWGOhXpiy
 o3Za7HqLH9YbEj4GRWEQRXaepgCh54/DFvOQJErAr35Dl2xeRZyk2842Cq3S6L1fdzx0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qCOzp6QHBfvs6xs4vpuMqr/hEn/jvY9MoT1Ovg5yP4w=; b=S
 pW4vEQgSeM0YP57tqs0PV/FIrVnZIZsDhAISFVnIgQ0Kj0RX/9fMb1801XI8xgcL8L8gXcGEGMmwO
 3AujHIAgq0cRfiOVZEC0WlW+K7Ml6TyNiBpkocioRhJi6yBRdYGC3zY50F4wZVH4wOY4aTze8oTR4
 K9V7DlA1ogD/gfLc=;
Received: from mail-pg1-f180.google.com ([209.85.215.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1spDpu-0001WU-Oi for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Sep 2024 21:28:15 +0000
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-7db19de6346so1672327a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 13 Sep 2024 14:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726262889; x=1726867689; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qCOzp6QHBfvs6xs4vpuMqr/hEn/jvY9MoT1Ovg5yP4w=;
 b=NTBNBBZN8eUvn8O0Da6OGqxKCVv90pXL5keTrlHDOL7ZxwBDEkl93Iqk2Xtp9D3TTB
 xnACktXz92bYuSOWjxKHwlKlmH8HVS1A+hQ2rfOIjlrfr/nsNPGM1Nivg/Jd3lzPZJMM
 Vx45iVjz+JqIcDvzs2f2d1qvTMJ5MQ6yBumO8/+HD8VHHO40dzzp8Ah0tJ0gnM5R8SlT
 K1+HSW1xZG6LweC1/BLwOotnqjyGXRTx87JZZMNcmVukGzQo2M6RY1HBxwrLXTmJ4gQp
 bu32JN+EtFrLvxJQE6ma/w4/4cnppXnRZp9ubnfILrxCiTHy7x1welKF6p2BzmTyixP1
 gYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726262889; x=1726867689;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qCOzp6QHBfvs6xs4vpuMqr/hEn/jvY9MoT1Ovg5yP4w=;
 b=YHgkMywjWWraLfoGswiaKumTOjG3w+PJx14bu4++So2OXjGF/IWDwqvoDSUtWymDi3
 WNd2GFOLgIAR45V67E1PupLnuGnln0roiBy06nlhniGbiwn/S8wMMKNy0CrR9B7dCHpi
 TmX35z3sHkyV2vurIoHw8qcecXonq297PFKAZE2DnZKt+kEAWGaXUyeuy5r39WnXe5mC
 QJoVoNBEp93djUSlcwULIAbSnVCofMumtKn5jOeYrJMlpG4IhfBv/SyKECCSypF5Mxce
 U/ZLJpPiOKLUjRBgEO6s9hk5u1DiLTT4Q00uhck9MZEcD3TvLjWGi14AbXH0ciBCvO9a
 W3ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCXAuUG2QmA86aa3sfLS9x4imX8FNNU5Si6Fx/J26x+PefZJh5tsC3rEFSanYXcyOc3LG9/KoXpYWeA6GgAXsm@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yzk+Wed6+fTXFS1TweLXo9F9W1AiHz7noJm81+tQEiU7diMFCx5
 xMavJiSURYOcUX9eOFLPOwAX+T6/vPWo5JkEV/hzbUE3K38j2tnz
X-Google-Smtp-Source: AGHT+IHoIc+VzmKtdSdpfYPMtlZ6TXSlAIedYL7M5X4chvT4UMYPF2rezcdIcQH4wFe0atzcT05fjA==
X-Received: by 2002:a05:6a20:d80b:b0:1c4:dfa7:d3b9 with SMTP id
 adf61e73a8af0-1cf75f0051bmr12320667637.28.1726262888631; 
 Fri, 13 Sep 2024 14:28:08 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:aed:aa32:e7d7:7fa9])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7db498de2d5sm89070a12.15.2024.09.13.14.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 14:28:08 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri, 13 Sep 2024 14:28:01 -0700
Message-ID: <20240913212802.912131-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.46.0.662.g92d0881bb0-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong Current description confuses users like
 they can add addtional devices with one -c option using commas(, ) at the same
 time. Signed-off-by: Daeho Jeong --- mkfs/f2fs_format_main.c | 2 +- 1 file
 changed, 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.180 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.180 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1spDpu-0001WU-Oi
Subject: [f2fs-dev] [PATCH 1/2] mkfs.f2fs: change -c option description
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

Current description confuses users like they can add addtional devices
with one -c option using commas(,) at the same time.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 mkfs/f2fs_format_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index c98e73c..2ba1c21 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -50,7 +50,7 @@ static void mkfs_usage()
 	MSG(0, "\nUsage: mkfs.f2fs [options] device [sectors]\n");
 	MSG(0, "[options]:\n");
 	MSG(0, "  -b filesystem block size [default:4096]\n");
-	MSG(0, "  -c device1[,device2,...] up to 7 additional devices, except meta device\n");
+	MSG(0, "  -c [device_name] up to 7 additional devices, except meta device\n");
 	MSG(0, "  -d debug level [default:0]\n");
 	MSG(0, "  -e [cold file ext list] e.g. \"mp3,gif,mov\"\n");
 	MSG(0, "  -E [hot file ext list] e.g. \"db\"\n");
-- 
2.46.0.662.g92d0881bb0-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
