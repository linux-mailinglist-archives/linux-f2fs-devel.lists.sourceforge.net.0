Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D38B2DCD6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Aug 2025 14:43:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1Lt+yKpSgJMYptmZgQjoJnq98bAUgE6TiuFHJnDmf8=; b=i6v74S0kv9W/3lAiYR8aNm3x2E
	caeVWe4nFLzPIqZsolWAK8Cx3X3dvt2iDgEUTPKYqMRp2CxVZVaUNyUvM11gE+0HWetI19OfHUzEu
	msONLnkIRLLwcO0QHOGwYSP/KZrdowXyUKuSsh+m38KveeGD+u40u/0KgS3OvtrC8ZZg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uoi9z-0005Ai-L9;
	Wed, 20 Aug 2025 12:43:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uoi9y-0005AI-7E
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 12:43:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EH3exU+U0+fbi85gxofno8q6xeb0IbulvYB8ejQFrEg=; b=m1XnTITzUz0DAclVSBEy0zpgVO
 4PlOKsMv4/BCvSUM7sJGQQ9jHe7loz+/ihonjskywVbz9AFtnRyBCjXq7Vdj8AwXTY40aecrX1XwL
 TQJjizDss4WNKzCZyPQULjM3MwUKfaW3HaQC1QDXw7LWuMqabXc281zVvCwTofvEinKk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EH3exU+U0+fbi85gxofno8q6xeb0IbulvYB8ejQFrEg=; b=HmwVdPDExPKaLCpCWWIFKH534N
 COir25UDvLZTPajLZSuPSYEIwOqKVfZfvLg4878DS/Z+T1q7a7zMo0Qc5epbAAfnprgU1YEJrGS7J
 3GuVIEREWMIpK/M6nxhjGPGTqoWxUvvg0siKW8RVH1WNwDyV6SHTqb1iKynnF5JXTSfA=;
Received: from mail-pl1-f174.google.com ([209.85.214.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uoi9y-0003ma-C2 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 12:43:22 +0000
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2445806e03cso62711235ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Aug 2025 05:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755693797; x=1756298597; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EH3exU+U0+fbi85gxofno8q6xeb0IbulvYB8ejQFrEg=;
 b=Di4mUNtopfAGCPtjAQMUuTE3aGZOnyUTI7DH7kIl0VkbwHfq274Hn3Zr7n6BkC1JBi
 4Ilz56lIr5G3WorlsPNlbkWv3oCCuRoWCLgDUYEuWPqDmusCqRVjcZvzdIt4ryFy+vOo
 vVgga5GHmunhU79MLS1CcWmSEItwWO1kHOl5rhvmgOwF2GCrbhSZ2P7JvnGUQhdaL9SJ
 J0X9OvkQLcseOXiNvIkIpLTWMWa49wkhAzL93XKBibhpd6w/YuU0jTrHnsB3jhHEo7Xq
 jQq0b0/bWvIzfqQZrKXS7TvvkpEsu0zCFlCU5OMzgbQthsqa7ggXMErxgRrV4mB2zpaI
 UnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755693797; x=1756298597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EH3exU+U0+fbi85gxofno8q6xeb0IbulvYB8ejQFrEg=;
 b=X4eJo/YuRHTJis4N++4ikkcM1cFBf4ECOLSAUSQILRKUbo7bjUvATC8lj+giExRM8w
 CWsh3W03K1oIQDkBDNJff/CweSDhVocvysBOrXlrxlNhBEjMbiPRsQKgRzqUtHGVvqxr
 1CJUlx2DDKd9h37O0WNN+p0uxUesAUNDH0OjH2cbEyB5DZHLgowoa5/e3YF6JRUmwmWe
 FAboTYoslI9PiG3UAElV5BjH+3EijHOz1W/ua6F0pPDn0cNkBxv0DChPkj9NVd5AsLrl
 X7rK5CYPpYfMenC19var5VQQNAdLnPwO4qtUXczZQ7v1lkes2csOpPTjtpLngqO+d/ve
 hcKQ==
X-Gm-Message-State: AOJu0YxJF+vmiIodZL4BqNox5AZoBjcdr+RQbfsBl+8NB7tJc66vODl7
 W0WzPlnLhS54PAruqae+0xamOGrnD0sioMMAHQrX6XgjBnUV8IbwTSff
X-Gm-Gg: ASbGncvbf8UaH15xa5rYe80jUbjSOwAoLKThzRDN97LTwIZtekNAkGiBWszrWVTXQQW
 RcW4juV8Gd6Ol1289v6rFNNGf4BAIKLXf3reieGPWT7/I4irDUqHASok+FcBZtL/NcB/YxpqXAp
 egUK4WQSVD/qd8ZF136wQ4haUWDnT+7/OqG2KV1uOHDTHCWwBGvGSjgsByOFvK6Kpuo8E8YMsyn
 6e5L7/Hk31zyctORF+DTAnxIlCpKkodEXgIVvMdxbiF59BwEznePBYpyxzfeyjTkwjJrWNICC7l
 qAyJelVT7s1gAq5C1aMfJyWx2ukeLn8F418FyP+u7fM4eL/Do/33Q2DARe+IAx16yF8rUmOJL1t
 pgZJ4MxxfxyO808vGS7GAWt0dc9Ia
X-Google-Smtp-Source: AGHT+IEigdZwhgPXRvkR6tL2UPOnstGq9/mly3+G26NA3KA1JglBMjpikqWAYRQzBqpDEUGDv+tVTQ==
X-Received: by 2002:a17:903:1b07:b0:240:38f8:ed05 with SMTP id
 d9443c01a7336-245ef226760mr36463025ad.36.1755693796623; 
 Wed, 20 Aug 2025 05:43:16 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed51b3dfsm25962545ad.142.2025.08.20.05.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 05:43:16 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 20 Aug 2025 20:42:34 +0800
Message-ID: <20250820124238.3785621-10-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820124238.3785621-1-shengyong1@xiaomi.com>
References: <20250820124238.3785621-1-shengyong1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.174 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uoi9y-0003ma-C2
Subject: [f2fs-dev] [PATCH v3 09/13] inject.f2fs: fix and cleanup parsing
 numeric options
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
index 674881043a76..5ca105b60f8e 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -249,8 +249,9 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 
 	while ((o = getopt_long(argc, argv, option_string,
 				long_opt, NULL)) != EOF) {
-		long nid, blk;
+		long long val;
 
+		errno = 0;
 		switch (o) {
 		case 1:
 			c.dry_run = 1;
@@ -261,18 +262,19 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
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
@@ -305,11 +307,11 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
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
@@ -321,11 +323,11 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
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
