Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8725A3231
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Aug 2022 00:45:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oRi5J-0003SE-OD;
	Fri, 26 Aug 2022 22:45:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bart.vanassche@gmail.com>) id 1oRi5I-0003S7-1p
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Aug 2022 22:45:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KI98Xpl0ogAKDeYiBm6UL6xwzn3nyWMocDGKL5WJTq8=; b=ZgMsiNjAa/x/B+65vwC67RIviY
 XBWqPhf6PIBIEJEUrlRIlAn1beRRLDuxG9cnVfx0DIYc0E7ToOEgwoWXilEeITJhD0UOxCRpkQssP
 ycdsEYpQXTdN1ePV/uDA1d8xNjCyU3Gg7hzgfPJIFB21UZWf62YapxW17GI+lpYqw7b0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=KI98Xpl0ogAKDeYiBm6UL6xwzn3nyWMocDGKL5WJTq8=; b=C
 wzM5ydakN4cWxJqysIEYGYDL5YwFoY/YyBmJv3BxYbiF9lrtCtIQTAmIItQNgjr/oAmIxfmHrWyKn
 +XKg38Mfh/19zKVIc7pPLMf8k3MsvJZy7y91NaSSQS4hdYjWj5U0S/B6FMHqRdsr9LFV7qNnqiTIC
 SAWtgdxB+RDig6BI=;
Received: from mail-pj1-f47.google.com ([209.85.216.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oRi5D-0005qU-4U for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Aug 2022 22:45:47 +0000
Received: by mail-pj1-f47.google.com with SMTP id bg22so2862070pjb.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 Aug 2022 15:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=KI98Xpl0ogAKDeYiBm6UL6xwzn3nyWMocDGKL5WJTq8=;
 b=0TozFIc0OxHdM8sszsMqMT2BnVTiRPSusumniIHxubjSOCQGLTZILn08XgVSiQeqHs
 AIKNku3bhAA2fYBY81+FOODvT5Bn/hYEE3uFIqvJy8MjXlEhkC6djpK8WFM3XgrQDVUZ
 GoH38CIEUe1sR908RzNaJqc8A14UqT1NMZ2HQEC01kiMYQXZ6vyO+vRJvaL2u9C3R0in
 TQPg6akD+f8URT5v58qKkGqr0tXskTxG07g+zukL1QiAMfYrYpi+ed3ZsD4hyCjTlFWy
 UwMYVxds6ObU3q9X1uOk/vPNCRu1AntW7KtTbuo/WEnUGl7zBcdl+clcqEJbvVMdIgK0
 fX4g==
X-Gm-Message-State: ACgBeo3QRGqDB2KisEP+yhMwqqZQA7bBNSMCfuoCXbq0tWyn1kDK7QD+
 eHPe4upE9A2fopDITWKjXJNM81NtxHHkwA==
X-Google-Smtp-Source: AA6agR5g+yZWVg5QzqQSOg493lmbsmAvnh5B3fdzIIW3HNxCZP1ZIefCNG5K7sMpfThHqDDxcGclvA==
X-Received: by 2002:a17:902:8ec6:b0:172:dc2c:306d with SMTP id
 x6-20020a1709028ec600b00172dc2c306dmr5786953plo.104.1661553941457; 
 Fri, 26 Aug 2022 15:45:41 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:a12:b4b9:f1b3:ec63])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a62d14c000000b0052f3a7bc29fsm2275163pfl.202.2022.08.26.15.45.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 15:45:40 -0700 (PDT)
From: Bart Van Assche <bvanassche@acm.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri, 26 Aug 2022 15:45:34 -0700
Message-Id: <20220826224534.1445555-1-bvanassche@acm.org>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Make the argument list match the format string. Use PRIu64
 for uint64_t and %zu for size_t. Signed-off-by: Bart Van Assche
 <bvanassche@acm.org>
 --- fsck/sload.c | 2 +- lib/libf2fs.c | 6 +++--- 2 files changed,
 4 insertions(+), 4 deletions(-) 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.47 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.47 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1oRi5D-0005qU-4U
Subject: [f2fs-dev] [PATCH] Fix format strings in log messages
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
Cc: Bart Van Assche <bvanassche@acm.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Make the argument list match the format string. Use PRIu64 for uint64_t
and %zu for size_t.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 fsck/sload.c  | 2 +-
 lib/libf2fs.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fsck/sload.c b/fsck/sload.c
index 00c3403dace0..ae18c046d567 100644
--- a/fsck/sload.c
+++ b/fsck/sload.c
@@ -318,7 +318,7 @@ static int configure_files(void)
 #else
 	sehnd = selinux_android_file_context_handle();
 	if (!sehnd) {
-		ERR_MSG("Failed to get android file_contexts\n", c.mount_point);
+		ERR_MSG("Failed to get android file_contexts\n");
 		return -EINVAL;
 	}
 #endif
diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index ecaa2e9d1ad5..f63307a42a08 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -1046,7 +1046,7 @@ int get_device_info(int i)
 		}
 
 		if (!is_power_of_2(dev->zone_size)) {
-			MSG(0, "\tError: zoned: illegal zone size %lu (not a power of 2)\n",
+			MSG(0, "\tError: zoned: illegal zone size %" PRIu64 "u (not a power of 2)\n",
 					dev->zone_size);
 			free(stat_buf);
 			return -1;
@@ -1064,10 +1064,10 @@ int get_device_info(int i)
 		MSG(0, "Info: Host-%s zoned block device:\n",
 				(dev->zoned_model == F2FS_ZONED_HA) ?
 					"aware" : "managed");
-		MSG(0, "      %u zones, %lu zone size(bytes), %u randomly writeable zones\n",
+		MSG(0, "      %u zones, %" PRIu64 "u zone size(bytes), %u randomly writeable zones\n",
 				dev->nr_zones, dev->zone_size,
 				dev->nr_rnd_zones);
-		MSG(0, "      %lu blocks per zone\n",
+		MSG(0, "      %zu blocks per zone\n",
 				dev->zone_blocks);
 	}
 #endif


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
