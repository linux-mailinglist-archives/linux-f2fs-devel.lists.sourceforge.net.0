Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C2B972534
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Sep 2024 00:20:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1snmk0-0005xK-Bi;
	Mon, 09 Sep 2024 22:20:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1snmjx-0005wc-Pn
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Sep 2024 22:20:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OACeXNWxgnQWjl/GPxHOu7e05WAZ024o5ed3CF2Sd1M=; b=H/zOhoReMycQ+q12eN21YsPVSF
 OQGKu7yYsX+8c4B1t9NLgNPS7Wkb542Dw0gqtUNis0eduQhD3sDMmTaGR1/8ne7b+DZLml9w635vK
 G/2luY+hvRoVg7SEMuLYwfwq7tzVtYRIPRumG7JrvbOasgc6R/47fqroJfrr7Ui+4JFw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OACeXNWxgnQWjl/GPxHOu7e05WAZ024o5ed3CF2Sd1M=; b=bHizEnA5X6uS+asp9LrbKjTqoz
 wHCXb9eB+QQKGNDz+eRsKYOZQ489+ZvdPLAWe/iSShY/ymACj3fS6HgOhplhdShS9XCjZoryLDodj
 Bd1HYmc8N/oorwGLaPy6qG4eCKfGNR0E6HmcT1SLwKTqxFD9vqGGXpuWZMycQLkeSpEQ=;
Received: from mail-pj1-f53.google.com ([209.85.216.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1snmju-0006gW-12 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Sep 2024 22:20:06 +0000
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2d88690837eso32556a91.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 09 Sep 2024 15:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725920395; x=1726525195; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OACeXNWxgnQWjl/GPxHOu7e05WAZ024o5ed3CF2Sd1M=;
 b=DcOjRaNsAAobNvDPQDkvL1zPi+Fv+gvbcHGIQ8XIxnVqwI98D8Pwl0pj42Rtmsy7NK
 yilMCCxTdNqOtnKST4Ip9EXSKr0i/YtThRRPskk2fMERx2zd8Gj+QfWiF12WkvaddCdo
 VOfDs8rCFF8CxKLjThvejf18+YstecqnEzwaWlO9OeQbPIsy/wwMgaMmKDBvd3OwNGMv
 zTTdAY9jKVSfixw1Kd7xD1cOCSNX1B5cJjo5bzM9ubNcFlXsmlGjzmJQ1RpTT07mQm4J
 /sFzm2cpei5xdEt5Oh31BvLvJ2Q4gQigYGGfE3FqUuGL2UCyUWC1CblkXRWYheGZdlSj
 ETxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725920395; x=1726525195;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OACeXNWxgnQWjl/GPxHOu7e05WAZ024o5ed3CF2Sd1M=;
 b=Bp0SGQtxMwuyyuKPA+6SzcL1wBZdGgU6C3mKJ7H9m82oTpXqRZtUO7BewKuHFKgkT7
 Hfp8SHKKgrymjKPsMYWj/c97LNnlqPv5z/xmeWWrkNijS5G6NFSRbId/mc2hjRepvtC3
 LBQRvaTwxnieSfknvnrQqYndxtiCfQhKhzM7jQxHRN0P2Xxu1rgEAtQ56mpiF/M9VkN8
 xPT079+S+yJaWfDB/2lm9R1G7HbZZOVxFu56Z30zfJBv5tIgFHWboH4zSyuGDmPh3VST
 djaWTDwtqEH/4cSPFqIraIX3JNfl86LraRB5gw2nmqdvFFFwY+jR6ioEWyJUMjWeYph6
 gC/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXV9l8G1bFeXqv9RQjum9NcgZIaMp3A8aNFadSbu7clyqnl2dNOyhekkkPCdtL9ADcjHtdJS17BsfUHKphz7u7o@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yxa/3HJMtfsrqPJ7+42+aUo21cmSiTvWrID5gk0gNF4p6A08+Hr
 dXFT0f63q6LNZdyUU9+61K5U2Hag5u5Rj1LUcn9qWMjUC6S8kjE+
X-Google-Smtp-Source: AGHT+IFiVrAHTyaAA3aagaI8EUCRG30d1RLs1T2oXVIq2zT/RwpjuVnxkZL2lJMP2ePV+f8MLzLbIQ==
X-Received: by 2002:a17:90a:d48a:b0:2d3:c638:ec67 with SMTP id
 98e67ed59e1d1-2dad4bab1acmr12586878a91.0.1725920395010; 
 Mon, 09 Sep 2024 15:19:55 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:ed56:14c3:db02:6c66])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2db04988470sm5016840a91.54.2024.09.09.15.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 15:19:54 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon,  9 Sep 2024 15:19:43 -0700
Message-ID: <20240909221946.2004046-4-daeho43@gmail.com>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240909221946.2004046-1-daeho43@gmail.com>
References: <20240909221946.2004046-1-daeho43@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Need bigger BG GC migration window
 granularity
 when free section is running low. Signed-off-by: Daeho Jeong --- fs/f2fs/gc.c
 | 12 ++++++++++-- fs/f2fs/gc.h | 1 + 2 files changed, 11 insertions(+), 2
 deletions(-) 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.53 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.53 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1snmju-0006gW-12
Subject: [f2fs-dev] [PATCH v2 4/7] f2fs: increase BG GC migration window
 granularity when boosted for zoned devices
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

Need bigger BG GC migration window granularity when free section is
running low.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/gc.c | 12 ++++++++++--
 fs/f2fs/gc.h |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 5cd316d2102d..9a3d3994cf2b 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1728,10 +1728,18 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 			sec_end_segno -= SEGS_PER_SEC(sbi) -
 					f2fs_usable_segs_in_sec(sbi, segno);
 
-		if (gc_type == BG_GC)
-			end_segno = start_segno +
+		if (gc_type == BG_GC) {
+			unsigned int window_granularity =
 				sbi->migration_window_granularity;
 
+			if (f2fs_sb_has_blkzoned(sbi) &&
+					!has_enough_free_blocks(sbi,
+					LIMIT_BOOST_ZONED_GC))
+				window_granularity *= BOOST_GC_MULTIPLE;
+
+			end_segno = start_segno + window_granularity;
+		}
+
 		if (end_segno > sec_end_segno)
 			end_segno = sec_end_segno;
 	}
diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index 245f93663745..78abeebd68b5 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -33,6 +33,7 @@
 #define LIMIT_NO_ZONED_GC	60 /* percentage over total user space of no gc for zoned devices */
 #define LIMIT_BOOST_ZONED_GC	25 /* percentage over total user space of boosted gc for zoned devices */
 #define DEF_MIGRATION_WINDOW_GRANULARITY_ZONED	3
+#define BOOST_GC_MULTIPLE	5
 
 #define DEF_GC_FAILED_PINNED_FILES	2048
 #define MAX_GC_FAILED_PINNED_FILES	USHRT_MAX
-- 
2.46.0.598.g6f2099f65c-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
