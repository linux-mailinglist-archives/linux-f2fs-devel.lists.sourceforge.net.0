Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C52B333C4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Aug 2025 03:56:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AYvdclEjgz3wXqtl98XNzMftPsaoBNA2KKPPMWXYBNU=; b=OhNsuFWZbCbjBrWqzzAc4UVhTt
	GtqemGi4XByBlL6tLEtPSUKFVNTMnd11uBXcf9nfm1kE4L64JRpawn66kq6toTZrfK9V/nbfDtN8j
	SwiWi0l9mQvJNkoqcnK+9EhaLJvJlcYG4JKnKs4CI3rcPgohxX1tDue1XUm8Vi24gMdQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uqMRk-00042e-U5;
	Mon, 25 Aug 2025 01:56:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uqMRj-00042A-3I
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Aug 2025 01:56:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+sxmf5DG5H+L5dfLzIRrUiYAH7/aCILTvnZJlsYKo14=; b=UiD9MSGacnobemX/d2UzplKI0z
 +xYFEQwjlc+GkHo6MdAkpBxQZpyl5HD3zU5vQMXlV8Y0Kiv2P+HxTnLjQ6q2rCkI5LomoNV6kNM6/
 qVoSBw3UIj21S5Z5g28RsH3yQXbSKP/ndtg2OyPMAN5iwtjFtJlT2jiGL4c4DBLowCFk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+sxmf5DG5H+L5dfLzIRrUiYAH7/aCILTvnZJlsYKo14=; b=HzfDbq1ASR3TSV/idGY7z4babL
 E+3nXFgbrOux6xDx2NiQLyxfHjhB453LSv/xSicaNo2KTudDHbvk1x1Ehsd/epLl98aloTs6Gpj0Z
 IYjvQUazl4y+6IL0rSVSdj1fmfDIuNr73TuI4Bv7IvKUImebuWnopFXa23llpgeq6JTY=;
Received: from mail-pf1-f180.google.com ([209.85.210.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uqMRj-0002qT-Ed for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Aug 2025 01:56:31 +0000
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-76e2ea6ccb7so2942062b3a.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 24 Aug 2025 18:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756086981; x=1756691781; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+sxmf5DG5H+L5dfLzIRrUiYAH7/aCILTvnZJlsYKo14=;
 b=J5iB/7qYnCqLHHZWmeGIpkOXVTW8Rs/uooq44/aMjDvNJCG7Pj/4/euvNh6chX71Uc
 Y4pWJQ7ZV5661s6mXaJLOYNRA4yln4pCn0H60jzTPG9XI7j2fKNBvD8kdm4c76d5JiER
 4kvERVbWb+J5sZ9mMAyBq1ecKXzoFYAujmf72FOAdEZ7Dp8TEFtmuN0vBKihS0KDbQbf
 tzzzSSrZPc0l94IkGEME3JEEPXil1tkBAtUhAXOamqICcyzP5WEYAVJvfj+fBOUSNkru
 vNXYCjTCi3bYcdkzSBFRASSPcjROHZ9vRNJre2PKQO3z8jvSX3NpzuB6FnixcbKkIcQb
 2jbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756086981; x=1756691781;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+sxmf5DG5H+L5dfLzIRrUiYAH7/aCILTvnZJlsYKo14=;
 b=fPW2xZuoZjq5IU9blllOuVBMwxgf5m6KbM2dZ0WZ/0UfspfhKE6zy0faZCqGhLdNeK
 zWKS+hltxlEtQnb1Dzp4yF5BBqeQwG7AzKm+3yTgpa5rze/vuxv+4IQJiATwsgOOUKAm
 Rg6Y2NuvByqIDHRO68W1LefTSsVPity4XEF4pmMeiZzHDYMXYtrgTNQZWntmXevTS7M2
 h+u2iFQLIvLSxnJSRmyCrnq7VLTqjqfjSGrwicodQKsb+cFmUdJWOfQs/rPhJtAR0P+2
 LQMbD7M4LUlkOaNBXZNCZYcf7jAR8aF6ivrodpNqF57mFOfYPUYxr6l1SEko5V1thzg6
 C/GA==
X-Gm-Message-State: AOJu0YzrSrNtvcmiBRUQgXYNS5Dw3o8mJikl6qnbO4wALkQ9LWESwXij
 KAjcHwTKe4JrWqvr5KXToi7H5OUJ8WA26VcwhUzM2U5Zn5b4C3FWbEg7
X-Gm-Gg: ASbGncucKWaI73y7/VP1VOnArg68oNfwPJEX4gVd5mcbobpo719Yv/+IHLjoQ047vQW
 ebji1BhRDfaA7i36QUUrn+k04+t3oGoFTgAFu6h+GpuHqwj9tWnNBAluPnpehHdDJFk7CDdjrH+
 n1tI8Vk82kMxXGhwXAY1C8e1lTXVGa/hAJVyMLGdH/bLwiIej5lrdHC9dMSYqVgZUZXprWKVoSh
 GORD+cYRviWkudRTYMdTup+gjXJ8qL6REYN/arOCSJspUhoojD/j19L1MfGEAJAC935i/SoVOrq
 cb5MpFiP1oSw3qDWFNNfD549RLNEVcFSo9xEK1x7+tOWJTn1Rjr5L4eZzCCk53dfNQU2/s5VUIT
 Q57u8bdksxOVCs2j1+TLwszrRpBWM
X-Google-Smtp-Source: AGHT+IGyG967ajJSzsx/h8nMGhvxttqCle1TWjtBaSx4gLkw/jyMVNR9GCrbZhXC7zE3aGrJ4kGteA==
X-Received: by 2002:a05:6a20:6a20:b0:23d:fac8:52a7 with SMTP id
 adf61e73a8af0-24340d43fd5mr15035278637.45.1756086980661; 
 Sun, 24 Aug 2025 18:56:20 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b49cb8b1989sm5147883a12.18.2025.08.24.18.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 18:56:20 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 25 Aug 2025 09:54:51 +0800
Message-ID: <20250825015455.3826644-10-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250825015455.3826644-1-shengyong1@xiaomi.com>
References: <20250825015455.3826644-1-shengyong1@xiaomi.com>
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
 Reviewed-by: Chao Yu --- fsck/inject.c | 32 +++++++++++++++++ 1 file changed, 
 17 insertions(+), 15 deletions(-) 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.180 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uqMRj-0002qT-Ed
Subject: [f2fs-dev] [PATCH v4 09/13] inject.f2fs: fix and cleanup parsing
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
Reviewed-by: Chao Yu <chao@kernel.org>
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
