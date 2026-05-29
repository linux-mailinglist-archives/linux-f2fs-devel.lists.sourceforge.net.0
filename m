Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5HK0GCtVGWoFvggAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 May 2026 10:58:19 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E82DF5FF9DC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 May 2026 10:58:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zD6hBCzCHAhGbAs3xvwEWxuSQ87L/ErCBmymYLmglSM=; b=bA78w5mRYOsSBwfQk+gq8vGwbz
	CqU8lel9K1axtddiJYMmIJAb02hLaJzDSfquz9iZ1+isCsukhb86P+6oEhCEnY/VpLF3wnC6bIc9H
	1qIv9kHrCRzBgA04u52aGFmjdBBOqzdbzK5onyeHmuGhQbS7wapxCtZuq4WtREY7fBNc=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wSt2l-0006Ge-R8;
	Fri, 29 May 2026 08:58:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1wSt2k-0006GW-41
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 May 2026 08:58:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=61BDhrq708ec1Cqu8jxJwbdx0+u2xsx7bXej0JqGb5s=; b=Oh4kz6WrmbRLH0SGXMjPJmrP5b
 jVfP6tOipsHAc7xUIJvE81LjZ1XNYu7FP24p/g+Yi6KTvX1bg1C+Vi6u76JrpNzc9QArBJrqsePEI
 zoYfdQ8UEG8s/IaMUkJGMtI9I0yGxl3K+rMeT0hPyHh+euScGgXecpHV1O1umFO3KCNg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=61BDhrq708ec1Cqu8jxJwbdx0+u2xsx7bXej0JqGb5s=; b=UAu1FNx13WtvAekn0AkN5WGFLU
 O5yGEF2sPynbN0ViFAU0Os3WCzerOIVrLuhnLp5N3kwM6ayU8qw0H3OuJo9tEtgTGKlE1EOSqAoTs
 VO40o+qhXhxUuapvyo61fXi2iHgCdyn+XqDr2lb/AKt4LnAXxCoEx9nlalnmlAaQC4RQ=;
Received: from mail-pf1-f177.google.com ([209.85.210.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wSt2i-0001Bv-UZ for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 May 2026 08:58:14 +0000
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-835c98b659eso10837161b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 29 May 2026 01:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780045083; x=1780649883; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=61BDhrq708ec1Cqu8jxJwbdx0+u2xsx7bXej0JqGb5s=;
 b=AQF43gWtRziyF2M8B30mIlgYk8WahyBptPG3g+4SPx2rWnkmX9u7/mLr0jktxU0fj6
 LEbMuuMl5jVKsEFO4+rnsW2fY71DJStvrNUSX3JYsGs4dE+OYnBgF2WTO/YMK/1v5qq3
 AlwnZ0jQiSI17BSmyXNZ1eqlWyraF0TP2e3OsJf9j37GI/1DjJAQBBQuS+2+QbQouLO6
 jLRsI3GgKCs3282Bm6VX36X1d2Kg7PvWs4YWY1dsDI5MuHV5e4c7sKxjZ67Pk1VjD66y
 vijl0VDd+z7x3Li2gXDIZv/JhPIjeZoPINNBCWjdBVMrSAB6Lw90Xh/Qby1+ry0qgzkM
 NdJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780045083; x=1780649883;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=61BDhrq708ec1Cqu8jxJwbdx0+u2xsx7bXej0JqGb5s=;
 b=DzYJsMRJBPSnXJsHWpqGEBNbwXOIrSf+d2xhvo+zwOB1JCJEknILJL5DnE90ZgSBUd
 hoUO5SGyjmPz04iCTXxaIjHUJvjMv63gFdwo5lXOHJLxJn0v2XOJUDsCCzhjGpwg8Bro
 L1hruHEICjbwnB0MeRftGqzVt285QWHdFQEEP0rJ303ER0mwq7HCcJ1TSTnHzm6YqkdG
 DXD0ANAv5RcVnoVJz55/xGgecXj9XuDEWreJDlRYnNx5As9ccSupvq3a9Jb0KBu0Hwz9
 U1BLbZ6PN+aBEeT4XbK/xw5btaN3esRlLcHVgZ52z9hd2RICp3/rlcnRbxtmNJJ0LW/k
 nQ0A==
X-Gm-Message-State: AOJu0YzJxArVhxDI1s50dygGek7GWRO5fx+KpmIvZS1fmdD2XZEvrwpO
 6F3lS0ZTvvShf2bEYxjSrY2f8iDePlzQdZHEHhZErkCMd1Pj8VvBQXrq
X-Gm-Gg: Acq92OEgrGvfcMnLA+dIwDtVpD+jLlCarroyobja7ZMxtNPx5fWs54OWeT9EiWDR8/3
 uRS6Md2y7qiK1egWgvDzXEODtyy2jjpnbSuyMRBjg2ZNb0cYSresG99NmUzCweVa3ZTfBvHwFxU
 R1tlTZx8ApASMDXwFByy4npHkRiG/EPiEeuPPv5+r3pGSSmz0hTcIDI91n4UJrynntv40cLkCKP
 WDOq+ciGlH2FmDw5J5dDJ9FCbohT+sVTYFCB8PLw3aDDjqwlKuC2O5qfrj29C5fjUjWR7IMUyuZ
 huLgsy1eSnPOgEovkremr3iS80NRYQPD4TjVWEiDwOv0xStxlhFWOdGRzmIW+3AhyszgWBpxUQh
 rEsfbQ9Z1AiniI8I2hv47sqy89oDgK05DzldP1sf/uFb0XuXh/6MqD0z7xRUYZ3SEc/zZ67OxHX
 lR9n2hcOg6hUkK5QH0VAmGX6TGssQ4uFwAB8je32WF1K40kT+txC48JSX/KCEDVAuLoctFBveUi
 YoHn87NhqHysGAW1zE=
X-Received: by 2002:a05:6a00:4f8e:b0:81f:31c3:2e34 with SMTP id
 d2e1a72fcca58-84212b83c1cmr2258616b3a.25.1780045082676; 
 Fri, 29 May 2026 01:58:02 -0700 (PDT)
Received: from xiaomi-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84214d0513bsm1216639b3a.61.2026.05.29.01.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:58:02 -0700 (PDT)
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri, 29 May 2026 16:57:45 +0800
Message-ID: <20260529085745.2664678-3-yangyongpeng.storage@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529085745.2664678-1-yangyongpeng.storage@gmail.com>
References: <20260529085745.2664678-1-yangyongpeng.storage@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang Add support to clear or set extent flags
 through ioctl for the inline extent feature. This allows users to enable
 or disable inline extent format on individual files via the f2fs_io tool. 
 Content analysis details:   (-0.2 points, 5.0 required)
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
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.177 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wSt2i-0001Bv-UZ
Subject: [f2fs-dev] [RFC PATCH v2 3/3] f2fs_io: add support to clear/set
 extent flags
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[yangyongpengstorage@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yangyongpengstorage@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: E82DF5FF9DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

Add support to clear or set extent flags through ioctl for
the inline extent feature. This allows users to enable or disable
inline extent format on individual files via the f2fs_io tool.

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 tools/f2fs_io/f2fs_io.c | 16 ++++++++++++++--
 tools/f2fs_io/f2fs_io.h |  3 +++
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 94e61b8..1a8c6a2 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -317,6 +317,12 @@ static void do_getflags(int argc, char **argv, const struct cmd_desc *cmd)
 		printf("immutable");
 		exist = 1;
 	}
+	if (flag & FS_EXTENT_FL) {
+		if (exist)
+			printf(",");
+		printf("extent");
+		exist = 1;
+	}
 	if (!exist)
 		printf("none");
 	printf("\n");
@@ -332,7 +338,8 @@ static void do_getflags(int argc, char **argv, const struct cmd_desc *cmd)
 "  compression\n"						\
 "  nocompression\n"						\
 "  immutable\n"							\
-"  nocow\n"
+"  nocow\n"							\
+"  extent\n"
 
 static void do_setflags(int argc, char **argv, const struct cmd_desc *cmd)
 {
@@ -362,6 +369,8 @@ static void do_setflags(int argc, char **argv, const struct cmd_desc *cmd)
 		flag |= FS_IMMUTABLE_FL;
 	else if (!strcmp(argv[1], "nocow"))
 		flag |= FS_NOCOW_FL;
+	else if (!strcmp(argv[1], "extent"))
+		flag |= FS_EXTENT_FL;
 
 	ret = ioctl(fd, F2FS_IOC_SETFLAGS, &flag);
 	printf("set a flag on %s ret=%d, flags=%s\n", argv[2], ret, argv[1]);
@@ -378,7 +387,8 @@ static void do_setflags(int argc, char **argv, const struct cmd_desc *cmd)
 "  compression\n"						\
 "  nocompression\n"						\
 "  immutable\n"							\
-"  nocow\n"
+"  nocow\n"							\
+"  extent\n"
 
 static void do_clearflags(int argc, char **argv, const struct cmd_desc *cmd)
 {
@@ -406,6 +416,8 @@ static void do_clearflags(int argc, char **argv, const struct cmd_desc *cmd)
 		flag &= ~FS_IMMUTABLE_FL;
 	else if (!strcmp(argv[1], "nocow"))
 		flag &= ~FS_NOCOW_FL;
+	else if (!strcmp(argv[1], "extent"))
+		flag &= ~FS_EXTENT_FL;
 
 	ret = ioctl(fd, F2FS_IOC_SETFLAGS, &flag);
 	printf("clear a flag on %s ret=%d, flags=%s\n", argv[2], ret, argv[1]);
diff --git a/tools/f2fs_io/f2fs_io.h b/tools/f2fs_io/f2fs_io.h
index 539964f..5e85dc7 100644
--- a/tools/f2fs_io/f2fs_io.h
+++ b/tools/f2fs_io/f2fs_io.h
@@ -222,6 +222,9 @@ enum {
 #ifndef FS_NOCOW_FL
 #define FS_NOCOW_FL			0x00800000 /* Do not cow file */
 #endif
+#ifndef FS_EXTENT_FL
+#define FS_EXTENT_FL			0x00080000 /* Extent file */
+#endif
 #ifndef FS_NOCOMP_FL
 #define FS_NOCOMP_FL			0x00000400 /* Don't compress */
 #endif
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
