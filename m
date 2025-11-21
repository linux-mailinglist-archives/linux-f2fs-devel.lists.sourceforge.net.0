Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 192EFC77970
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Nov 2025 07:36:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3tIcwKpe1J6fw2WKjV1CK4p9uzuOk2vN3jLcNcczJWQ=; b=AXx+DBo2iEa9JwHhfN9g4T78Sr
	SxWzvOpxHb53ugNmcJuRXaZ2Mf8tc4fh260s+AvbEnv+tpGcYDG7Tosflm9E2QNYjVaWsk1W/rAwB
	VKalcNmC6h6q/uUdyXxKSQlZc2dQbPGlQNcWpNbwbRMcTqXAgIRurh8i10z2WEPGx3yA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vMKko-0004qf-P8;
	Fri, 21 Nov 2025 06:36:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zangyangyang66@gmail.com>) id 1vMKkn-0004qY-01
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 06:36:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/h/Ui1vMtNGt/3MUTX3psBfOkIprmfyRK8mmZSO6XhM=; b=mUAhCAT8O7KpI9afq/H0MVzL81
 PXAHWgxxixa2Y1ljnvsJWyAGg0kXwN8YAqeepW3AuYgfmrPqbWQIeY2IkQF7+M85hNInwRKa6Ae3x
 dLQ/2R5z5GiNbehnaTTvt8KtOvyriRKWK1p2kz+/tmYP+X88vxYkHrdFRfJ5LGsN13nY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/h/Ui1vMtNGt/3MUTX3psBfOkIprmfyRK8mmZSO6XhM=; b=V
 oWRw+FxZthmXaERVQ6Dt5FpGwtekthLHxIcYCJITrTHYD130JFh1jVP614uO3ns07RGUlnukXHDX4
 GVM7iIWf9eKTQG2lCcoY7D0EDEpGjM6VgeJHiipd6FgbV/h8RpWsYoE0qOO8eU5rHsKAXOISK6H+m
 OwsiWumUoRX6b8JM=;
Received: from mail-pl1-f174.google.com ([209.85.214.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vMKkm-0007BD-J0 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 06:36:20 +0000
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-29853ec5b8cso20495755ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 20 Nov 2025 22:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763706970; x=1764311770; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/h/Ui1vMtNGt/3MUTX3psBfOkIprmfyRK8mmZSO6XhM=;
 b=Tdn4xi8duzzPsNaAHi/59NNRW1iwxr6ELDIOmJRQGvI/cFUZ0rDGxYG8+I8uzLN5tH
 RMHDaubLq8oOWP2wNr2CXV18CQohCwxar+Vmu5l6ckuhmrIqmYdrc+HXhrXcjrPyeJLy
 tZ+UZZvsiF9/s/Pzx8R/nXR9ECNcSkSg7BdElkHun0ileQb/LePEtOhL8iZ4XIN9UI2x
 bFBXcq964u6N4ylqdJ7DxBBO7qFm/Qpa/wgZ6zyUso8EBIepCM2pn5D7HUPE57pEyemM
 7QlxZFyA/UaId//pHCWcAYDNuc1Q9QRx5bvrC9bDD2mYGDwfj+2CNsgLDK4q/lKkCdUQ
 AutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763706970; x=1764311770;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/h/Ui1vMtNGt/3MUTX3psBfOkIprmfyRK8mmZSO6XhM=;
 b=S5qHQGInvMYXwq5worz30003Q2dwXQxR8YA1v+eon2pplh7Jg2fYty54JBxlYl0cT2
 y1hLmDvlf88Y2cCNVH3bZcv4mCD4edHxdUD2rXmFLvUnKw1ZBofu1fAC1TP046vrhNIW
 0UlJYVBBT1E31ByTTwbCPg6zmiT/LYg8q2C0drDVsfzuzgj3fkKWISna3QmOqj+KDkcE
 H+DUOqhylaY2Qwtl0QntrB7ePHs69JwepPlS4JCECoorG0tNhY1G9+fAQQ+yA2nj6z4w
 uWrNW7JVYeIA+svsRZO3DbG+YjtX9pQxYL/ZFcbNlHrHvvTOmU2PnvKdaqFNLw7SO2gl
 jX/g==
X-Gm-Message-State: AOJu0YwQGe8ceyhpDHeM6WvcWGmvyRGZLJj73zO/Xd0l9f9tkb9WgLRg
 VfiBkMsUhKdgqAigZpc8qI0urLvn77uzGoz1FscJuNimOY+lUDKRY6sn
X-Gm-Gg: ASbGncunEcN2v13l8MNGF+8ChnzXkK7UTYOThxZlUAdaLVyVTsgj02N0ieyn8f4K82i
 k4SVEEMM5nyjgRNq2zn+Goh6jzgN5LwSvDhe91FNskSLi0qvl07SzBvjHFdOyx5KhgE7cKg/K3o
 qbKTBrshWag5UVZAwD/rfKGUF0Ko5u0ajXNQ8vZz27usF28I1DatCKwdspbaEB21kjGTgpYvp0v
 mV/yogkZ2hCKL8Iqb+q3Im8fB3sZQJqW7Y53zdHEypBwxLdz4w3qCLAreqvffQcJL9aeEtHbE5W
 zcYDHOerE4TPE6zqF1C+PQC0f4yviq8Z6IbVN916mShMxVCkElvkxCYbNAUjXvoUaXxQd4ZN2Xq
 u8vCZ3PCxgwNnn2oJJR3Dx1TygewmnKhSh0RKl90Io0LGIEgCntqP4pDzCgwvn+B/Pt19v68Jes
 tD//5IXJr+wNjbw6a0k7OxDw==
X-Google-Smtp-Source: AGHT+IEBjZfkzYJ7/RdcIWF4tPy5OfOLAzfS105V6f9qU0au5VmH9MENOFXSb8kSNfsycY+SgD/HZA==
X-Received: by 2002:a17:902:e744:b0:295:8a21:1559 with SMTP id
 d9443c01a7336-29b6c685522mr17497125ad.35.1763706969865; 
 Thu, 20 Nov 2025 22:36:09 -0800 (PST)
Received: from zyy.mioffice.cn ([43.224.245.240])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b13e7e6sm45056385ad.40.2025.11.20.22.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Nov 2025 22:36:08 -0800 (PST)
From: Yangyang Zang <zangyangyang66@gmail.com>
X-Google-Original-From: Yangyang Zang <zangyangyang1@xiaomi.com>
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Fri, 21 Nov 2025 14:34:42 +0800
Message-ID: <20251121063442.3312116-1-zangyangyang1@xiaomi.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch adds -g option to set default options for specific
 environment, especially the Android. When using "-g android" in Android,
 forced resize is enabled by default, which can solve the problem [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [zangyangyang66(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [zangyangyang66(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.174 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vMKkm-0007BD-J0
Subject: [f2fs-dev] [PATCH] resize.f2fs: add -g to give default options
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

This patch adds -g option to set default options for specific
environment, especially the Android.
When using "-g android" in Android, forced resize is enabled
by default, which can solve the problem of resize failure.

Fixes: 42482e81248f ("resize.f2fs: add caution message for resize")
Signed-off-by: Yangyang Zang <zangyangyang1@xiaomi.com>
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
