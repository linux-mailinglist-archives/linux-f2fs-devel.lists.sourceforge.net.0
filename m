Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E817AD3C8A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jun 2025 17:18:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3O+fblS8NHK+t+LXrYhskTCkETJWAbnv5w60ffHueMA=; b=PmcDgtqDqwBR26U0u1dt5oxY+d
	4gtOuLAtzJE9IVEkMuS/xhIRyj7KFFcD3fwu7FLGzBRxigkuI4cWpKVTie4aAXnotKnmUfbdL9fLT
	T/zayueWap1HUTzGxDVO/ti05WHRawil4EabKcndcM7g4VXOFLX1z9HU+x2bTtTQg/0I=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uP0jt-0007g4-6w;
	Tue, 10 Jun 2025 15:18:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uP0js-0007fy-Ec
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:18:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RjJQdiCPNX5Qw/32p0voEfGnyF3ncBUjYgBACXsb3ZI=; b=FhPzNdh1UjdWesNIx88DTHOLmL
 O71fCsjnOIA0mIvpE8FDS0kXfbMztVHfSMqKrZcaoZYOIHrF5QMMVjCwuUitD9sw5kzDSYo3lqHmu
 QWBG1kPgk2VoeZrkAj5arHHaGzBrEY+KEZ7x0U6IA2HnDJfDTODwIemVCY6NkWamjwGY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RjJQdiCPNX5Qw/32p0voEfGnyF3ncBUjYgBACXsb3ZI=; b=Fmc1qUb4mwltXR1c/Yd4WN9tTr
 aP4bMKL2oOGpDI4qHWyBEFLdRg9ms4s3WOVz1XTcRfDnNNPPL3VeUi+C/x34/Sxp9j+s7aRv/j7aY
 cFPuPHxEVsX/nAsCb5+dCCxzO6Mm9G377F9Jq6E8CGE6m5I68Jj/JcAALGosbnKpR+SQ=;
Received: from mail-qv1-f48.google.com ([209.85.219.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uP0jr-0003XI-Qz for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:18:12 +0000
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-6facc3b9559so78929346d6.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Jun 2025 08:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749568681; x=1750173481; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RjJQdiCPNX5Qw/32p0voEfGnyF3ncBUjYgBACXsb3ZI=;
 b=aSrRvjfw106dqS8SLVR2EpfVGZePixsY/BSd1L2e/zY4SGy3MUuxaLiPOb3NuEZaEH
 VovuwXiJB+l4n74ubZGlgLki1322UqLn7RRLczrWPhlwRshkdOaMTQmSGtflAiM4ol8K
 ozdGVfufBKTk6L/y9QeBMAlmBgD7q+KVKBAB3NeQIZ7fxVIi5dQAtWdYRcwPokkKyB/s
 XUPzI9GKgHPrQhnqEXJcVQ+Kfhn3dknDr+X/6nv1OkbqTCMA0bo9/LUTn1ddjgHzUIH9
 b/oEXfTc2uWOiujtAv4zjCyohbKVYKbuZsZ53XAq5XowSiNgdfEp0tyc/yWlG89U8AMU
 GOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749568681; x=1750173481;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RjJQdiCPNX5Qw/32p0voEfGnyF3ncBUjYgBACXsb3ZI=;
 b=T4w2/lCdJLHbYu9/sk2KZ3F6tlcX0DPrnBO+fEAVEnmtY+JJxoTGp5mCgts/Z/G3HU
 J1c/S05ioWGjvveVjjsDwuQ1JNIJQmj6cpfipXRDxgLKxsYz/TJY6Tesfa7OJZBjS4wj
 B+sYGbSQXAMFq0lnwgG6d2J1Fyq7qP2A2iY+jhUPu6aXKINFGkE/QMI9OK+opxJQYbQn
 VOV+yV9LPPrKUW/ZULZYqeJDr0GK3FBUjRaPnUllcPZv2qHn46idMj60nRzLA7T9lEMb
 KSfLzO6HPOE76+CIBLN9BCl/swVZ+Ci4j82KyssLPRROZ9Wbprca1mvHGC5JSd1S9j5s
 1ufA==
X-Gm-Message-State: AOJu0Yw5R5CfitHhVP2k7cmVRrnnQckouZ9jST2BXBXsuCwjJcwPCpFQ
 3UVkEllK6k+qFEo876RGNoJJVbRvkTXR7wzBkmw+wraIs4vtL10lMQXiBk3+wA==
X-Gm-Gg: ASbGncu4FeiUVBXe4mhf+skFZp9c15Hn1u2dEpnqDc7uUeu3zSB2B2V8ARvZv+u17hI
 3Pi42xJIDV+OV1rbAabyhI+kEliGRuX2mwdvWw4tVJKcjIQ4Lafs3DacHx9dnv0CDU1EzNdZ3rg
 mC5kOmArABCitbpMXj89zVo110yUPObKj+7f7ZDgqYU9nty/r6RC7B6qk2AC+Fpzq8QcvDvnDPJ
 Fp1IIpYYbEln7vBHu+6z9kVLmHpGY92inu8P1syhpEV9vdc60be7rZjFvY23tdFh2k9006UPZSL
 L6L54ZeY2y2EQxp9lSg3wv8PwEHcDLTmp4NwBg94q0F1w/NKm0y2zj7pKzCtrqigwbEW
X-Google-Smtp-Source: AGHT+IFhHRzQ3Cl8kyJgcWrO6MowivIg/TLRM6m6BYTx6dm3sdI3r2YYRWG9O/hgUDMztmyfwADZUg==
X-Received: by 2002:a05:6a21:a43:b0:1f5:9d5d:bcdd with SMTP id
 adf61e73a8af0-21ee6851aeamr23296460637.1.1749559099682; 
 Tue, 10 Jun 2025 05:38:19 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0847aesm7539815b3a.105.2025.06.10.05.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:38:19 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 10 Jun 2025 20:37:19 +0800
Message-ID: <20250610123743.667183-10-shengyong1@xiaomi.com>
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
 Content preview:  From: Sheng Yong This patch fixes: * parsing hex optarg of
 --idx option * converting -1 to 0xff...ff of --val option and do a little
 cleanup of converting string to a long integer. Signed-off-by: Sheng Yong
 --- fsck/inject.c | 32 +++++++++++++++++ 1 file changed, 17 insertions(+),
 15 deletions(-) 
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
 [209.85.219.48 listed in wl.mailspike.net]
X-Headers-End: 1uP0jr-0003XI-Qz
Subject: [f2fs-dev] [RFC PATCH v2 09/32] inject.f2fs: fix and cleanup
 parsing numeric options
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

This patch fixes:
  * parsing hex optarg of --idx option
  * converting -1 to 0xff...ff of --val option
and do a little cleanup of converting string to a long integer.

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
---
 fsck/inject.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/fsck/inject.c b/fsck/inject.c
index 96817a806f8f..c879ca99c0d8 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -236,8 +236,9 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 
 	while ((o = getopt_long(argc, argv, option_string,
 				long_opt, NULL)) != EOF) {
-		long nid, blk;
+		long long val;
 
+		errno = 0;
 		switch (o) {
 		case 1:
 			c.dry_run = 1;
@@ -248,18 +249,19 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			MSG(0, "Info: inject member %s\n", optarg);
 			break;
 		case 3:
-			if (!is_digits(optarg))
-				return EWRONG_OPT;
-			opt->idx = atoi(optarg);
-			MSG(0, "Info: inject slot index %d\n", opt->idx);
+			val = strtoll(optarg, &endptr, 0);
+			if (errno != 0 || val >= UINT_MAX || val < 0 ||
+			    *endptr != '\0')
+				return -ERANGE;
+			opt->idx = (unsigned int)val;
+			MSG(0, "Info: inject slot index %u\n", opt->idx);
 			break;
 		case 4:
-			opt->val = strtoll(optarg, &endptr, 0);
-			if (opt->val == LLONG_MAX || opt->val == LLONG_MIN ||
-			    *endptr != '\0')
+			opt->val = strtoull(optarg, &endptr, 0);
+			if (errno != 0 || *endptr != '\0')
 				return -ERANGE;
 			MSG(0, "Info: inject value %lld : 0x%llx\n", opt->val,
-			    (unsigned long long)opt->val);
+			    opt->val);
 			break;
 		case 5:
 			opt->str = strdup(optarg);
@@ -292,11 +294,11 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			MSG(0, "Info: inject nat pack %s\n", pack[opt->nat]);
 			break;
 		case 9:
-			nid = strtol(optarg, &endptr, 0);
-			if (nid >= UINT_MAX || nid < 0 ||
+			val = strtoll(optarg, &endptr, 0);
+			if (errno != 0 || val >= UINT_MAX || val < 0 ||
 			    *endptr != '\0')
 				return -ERANGE;
-			opt->nid = nid;
+			opt->nid = (nid_t)val;
 			MSG(0, "Info: inject nid %u : 0x%x\n", opt->nid, opt->nid);
 			break;
 		case 10:
@@ -308,11 +310,11 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			MSG(0, "Info: inject sit pack %s\n", pack[opt->sit]);
 			break;
 		case 11:
-			blk = strtol(optarg, &endptr, 0);
-			if (blk >= UINT_MAX || blk < 0 ||
+			val = strtoll(optarg, &endptr, 0);
+			if (errno != 0 || val >= UINT_MAX || val < 0 ||
 			    *endptr != '\0')
 				return -ERANGE;
-			opt->blk = blk;
+			opt->blk = (block_t)val;
 			MSG(0, "Info: inject blkaddr %u : 0x%x\n", opt->blk, opt->blk);
 			break;
 		case 12:
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
