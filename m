Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B10BA3A7
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 22 Sep 2019 20:41:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iC6na-0004C8-6w; Sun, 22 Sep 2019 18:41:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <fontaine.fabrice@gmail.com>) id 1iC6nY-0004Bz-9M
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 22 Sep 2019 18:41:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xxLcc+A6jg/nsFW0l2PRbSX4vkYQyLt33kCnnXXqicg=; b=JsM5mKeJAZ5ZNsQyargFjtuZko
 DawSLL6bUrhRC13+FXvhCiGycVWkyO13ZB1ejBr8WJ7jNiNntr9jiwm+QZx7wPOYG2HnTlfIwV3WD
 4UOmQ1S8eCfrFK1LhOzlz1fC5mrplABPWHiV2rZCbNAd95gbIBzLxPO1YP64GUIQIx4o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xxLcc+A6jg/nsFW0l2PRbSX4vkYQyLt33kCnnXXqicg=; b=T
 FpqO7/tUqvY6KnzAbDNg8Oc+sOpcomI7IQzy/+YEcmVWBdeBibGVZPUMtzxLBoiYJmAEBeMcgHFU4
 wz4tgFE7A8JtFo0fkqhjLpwrkC1hzDMBQa79m/mnmHaVJU21EbsutBMWWtSmi4Cmy9wF3TVl//vj2
 RZBYWGzi80WR51F4=;
Received: from mail-wm1-f67.google.com ([209.85.128.67])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iC6nW-0030jG-8f
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 22 Sep 2019 18:41:28 +0000
Received: by mail-wm1-f67.google.com with SMTP id a6so7419012wma.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 22 Sep 2019 11:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xxLcc+A6jg/nsFW0l2PRbSX4vkYQyLt33kCnnXXqicg=;
 b=RwOVVOp3zzQ6vwaKdxsG4nw5rQwkCxc+NBxttpG/sPWm6et2DoTtO8Qq/ql2kB/WI+
 mhMWIVgP2PruoN7vy0/YFhVOhMoJaOoUngDneRiP4eht4O3u5RAsjDcmprnwiMtmUCRN
 iM/kvwkv435DC/I/NqqrMVV3aKJALN2hBjnl9VFxIIRRKYSNGcoU1Zh8ykGNxHPGUvk1
 eCOZ5XOaDGOYU14YEe+Njcn5Y8hfBasC4R6fUk9/j24vpLVqvHV+lOKZcYpL3wp5veIq
 EOyFYA5kDcx6u6UX30i251jF/Uy/hfogxQfiC0nmM/y3mkepdiyCVE/UeFHohDuBN+fA
 hJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xxLcc+A6jg/nsFW0l2PRbSX4vkYQyLt33kCnnXXqicg=;
 b=FNjsIdA7GqadHl16K66ZQROdx4N9yGtld32/bfI5QaKpz0BObYw71tc5XiLxNLHJLY
 TIAzZyw8PbNqNmaJ8FogNP0F2Ir6eD2Wlc71EvHuo7MGlHzlBiXYsWSwuevnBAxdutHC
 I6iwRrSu7HOxSijySY7VBHAEn8EkgzwGRNzh6UbJdOuFz4/UYyEmyh8feIOIanqgw1QF
 g4CjTu2qIyQKMScLaEN2V/mzbgzxS+6LC2wINZ4Irrx2CkSfIUsEiab8K6sQJivl1m8U
 mDZI0z8TeaO1qP8FcAZl4WF0tob+ZrXYYz7RPewPFokA38YAwhBJfgCIOJWgkkOdk1a2
 f9BA==
X-Gm-Message-State: APjAAAVudfFOUWNePiw1FJUYbTNnUR0pCld6/ECChpEwZKXaAKsEQr9C
 VQexDpNOKHoQrmWeO2aWQyOHmp0+YqI=
X-Google-Smtp-Source: APXvYqxgtH8l9AIH7V0HfRs7Vo6zicc3VgFE1UUYEmIP2YmFkX4idHIGrzsbbMoQuDNizcD4KODRLg==
X-Received: by 2002:a1c:4e01:: with SMTP id g1mr10213794wmh.134.1569177679490; 
 Sun, 22 Sep 2019 11:41:19 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-605-248.w81-53.abo.wanadoo.fr.
 [81.53.181.248])
 by smtp.gmail.com with ESMTPSA id b186sm327009wmd.16.2019.09.22.11.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2019 11:41:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 22 Sep 2019 20:41:37 +0200
Message-Id: <20190922184137.28947-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (fontaine.fabrice[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.67 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: libf2fs_format.la]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iC6nW-0030jG-8f
Subject: [f2fs-dev] [PATCH] mkfs/Makefile.am: fix build without blkid
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Commit d56232bc1640e2a3ffc412faff42cd8e77dbb8dd hardcoded -lblkid in
libf2fs_format_la_LDFLAGS which breaks the build with --without-blkid
option so use ${libblkid_LIBS} instead

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 mkfs/Makefile.am | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mkfs/Makefile.am b/mkfs/Makefile.am
index cae2f93..83e2389 100644
--- a/mkfs/Makefile.am
+++ b/mkfs/Makefile.am
@@ -12,7 +12,7 @@ lib_LTLIBRARIES = libf2fs_format.la
 libf2fs_format_la_SOURCES = f2fs_format_main.c f2fs_format.c f2fs_format_utils.c
 libf2fs_format_la_CFLAGS = -DWITH_BLKDISCARD
 libf2fs_format_la_CPPFLAGS = -I$(top_srcdir)/include
-libf2fs_format_la_LDFLAGS = -lblkid -luuid -L$(top_builddir)/lib -lf2fs \
+libf2fs_format_la_LDFLAGS = ${libblkid_LIBS} -luuid -L$(top_builddir)/lib -lf2fs \
 	-version-info $(FMT_CURRENT):$(FMT_REVISION):$(FMT_AGE)
 
 install-exec-hook:
-- 
2.23.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
