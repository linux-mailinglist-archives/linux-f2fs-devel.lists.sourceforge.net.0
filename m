Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E92964DE1A4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Mar 2022 20:13:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nVI2e-0003bE-8Q; Fri, 18 Mar 2022 19:13:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <daeho43@gmail.com>) id 1nVI2c-0003b8-Sz
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Mar 2022 19:13:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bXrcO8k9WHY4LEyS2fhRDME4/GfOMRGHgZg4UE14WTs=; b=PGZU1Dvsd+xLBYG2tnYeLXt0YI
 ZpUPQERbROPs2oVb6KPGE8HclXXwukmRQV+KTZfKy6pI0DwAxdn4zu2kHaAhyNrp5/PD3w1Aid9T3
 BciKewZ4Rt5sBTbGrGtmq1W26vwxt6gsR2tUQzngCmC/e2hbLU/vHs2mNfYbQoE/jSM0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=bXrcO8k9WHY4LEyS2fhRDME4/GfOMRGHgZg4UE14WTs=; b=S
 dX8xeo2uO5ELRbTcLjoEJ8UBdhaxJ450C9TCg7YfnnJ+JvwuP6vWNP/49T7uqvLSh2zi5NksjEOB2
 C3hW9SlM5Hv6Iqt309ISVauwJyNFR7d96XMy2nVKYDqvR+5pEpeuljLhXDLpifpPv2DKY8qdR5vHG
 Sfh4fGZ6wgVW/d5k=;
Received: from mail-pl1-f174.google.com ([209.85.214.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nVI2X-00007f-9j
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Mar 2022 19:13:37 +0000
Received: by mail-pl1-f174.google.com with SMTP id n2so7720308plf.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 18 Mar 2022 12:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bXrcO8k9WHY4LEyS2fhRDME4/GfOMRGHgZg4UE14WTs=;
 b=iebizR8O8be3nBzdLU3hoQPgO8RnJmvjRTgTSwdJEiW6W336peFm1HV1Jr7nla8WAF
 igKypm4cZ8RxRETI7VvpNZxw7VWQv73Rv1sJT7IWa7F9MjuIzfmsxxwdZk3wwlpT35sM
 t8sT7WSKQf8GoicCzPsAD8gFAdcj5VpwpRAtJSDVnPVHjuiTeXLe7D4c7Iczx0WfFLgv
 tRMSQ7R3yAKpW3pd+47LKynEakBQFZJKTyjxfmEa1+mdxiZDFeg6pESGA6sQpUbDTcUB
 34YihZve2/QExHctdZDYFMHbhD623eOzXTHGCxiT3ccMaZadchIJjvz3HYJAKB3iJu/9
 Umjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bXrcO8k9WHY4LEyS2fhRDME4/GfOMRGHgZg4UE14WTs=;
 b=f+G/kZrTfD7d4w0feUL5/i6AFzlUYGCYHOedxM8eCzGELyCeYiyWtiGf1CiA/bpMMQ
 wYC9K6QcvGuh6HkwEdyP8CjwRfhrCLRLygNXnEajwY9sKGlV/BFm+p7v5s1n2gYPcn2m
 GwTLbHVBrpHqWPlDI128kr8P0NJXFFaTC4Jsz2Yk9f8UGa1BfbFBf6/JVRuPUJV5WuGN
 WfgWmC3OgXGaigduwVBBABbKA6JQSOvM2nuzmuEvGHIOk+rsqc0ixKl3eoZiEG0jxaG6
 ubLbUR2YV+qjMnt3fu9K1oQQJzgLg8NSPJgQnB6Vqb528Wi+lMH1BQSkCV3CFZod11CW
 Nuww==
X-Gm-Message-State: AOAM532P1fb0dMdHrX5l/il7xqnxxaL1bK8lKbd4c3imJjT8EMhu3taD
 oiKZ+ZhbUKdYEpGuILFw3WU=
X-Google-Smtp-Source: ABdhPJyGY9WMAzvWGk/JQ0eDzzUm2lvUtKvFkWC6DgcYE4wSrSoj+6fyzAL7UGXiUPIyOTdbB40Z3A==
X-Received: by 2002:a17:902:ea04:b0:152:7cf:1b85 with SMTP id
 s4-20020a170902ea0400b0015207cf1b85mr959898plg.80.1647630807714; 
 Fri, 18 Mar 2022 12:13:27 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:a64c:198c:4e57:caeb])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a056a00114d00b004c122b90703sm10325451pfm.27.2022.03.18.12.13.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 12:13:27 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri, 18 Mar 2022 12:13:23 -0700
Message-Id: <20220318191323.4167565-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.35.1.894.gb6a874cedc-goog
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong Changed a way of showing values of them
 to use strings. Signed-off-by: Daeho Jeong --- fs/f2fs/sysfs.c | 17
 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-) 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.174 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.174 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nVI2X-00007f-9j
Subject: [f2fs-dev] [PATCH] f2fs: make gc_urgent and gc_segment_mode sysfs
 node readable
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

Changed a way of showing values of them to use strings.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/sysfs.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index fe29bcb70f46..fb950a13375f 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -41,6 +41,16 @@ enum {
 	ATGC_INFO,	/* struct atgc_management */
 };
 
+static const char *gc_mode_names[MAX_GC_MODE] = {
+	"GC_NORMAL",
+	"GC_IDLE_CB",
+	"GC_IDLE_GREEDY",
+	"GC_IDLE_AT",
+	"GC_URGENT_HIGH",
+	"GC_URGENT_LOW",
+	"GC_URGENT_MID"
+};
+
 struct f2fs_attr {
 	struct attribute attr;
 	ssize_t (*show)(struct f2fs_attr *, struct f2fs_sb_info *, char *);
@@ -316,8 +326,13 @@ static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
 		return sysfs_emit(buf, "%u\n", sbi->compr_new_inode);
 #endif
 
+	if (!strcmp(a->attr.name, "gc_urgent"))
+		return sysfs_emit(buf, "%s\n",
+				gc_mode_names[sbi->gc_mode]);
+
 	if (!strcmp(a->attr.name, "gc_segment_mode"))
-		return sysfs_emit(buf, "%u\n", sbi->gc_segment_mode);
+		return sysfs_emit(buf, "%s\n",
+				gc_mode_names[sbi->gc_segment_mode]);
 
 	if (!strcmp(a->attr.name, "gc_reclaimed_segments")) {
 		return sysfs_emit(buf, "%u\n",
-- 
2.35.1.894.gb6a874cedc-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
