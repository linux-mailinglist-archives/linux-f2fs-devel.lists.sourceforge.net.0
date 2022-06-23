Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD89E558667
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Jun 2022 20:12:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o4RJc-0005Wf-Be; Thu, 23 Jun 2022 18:12:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1o4RJa-0005WZ-Ar
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jun 2022 18:12:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=olGZo4G5qWhNx4sOgVQ6big/g5gyvMiHwloMnqfNjEA=; b=EcPCRK/mZTEigPTnKcqbqMh/ja
 eFPhRzYDWWa2dP1QFPAAcK7UlNriaIN/o66EyQSJcig31WzlilW2jrKMYJ+sgKw3qxKxv5+8QNBhp
 BlWrzeg6XOc1NQhgTJdV1qmPwyFS+qsBK5NFsRgQqRScVdHKVunXith6oBOfAvm5xlB0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=olGZo4G5qWhNx4sOgVQ6big/g5gyvMiHwloMnqfNjEA=; b=VQ2XyjYp41zfROUaoKx16uTyG8
 Gqk07ySAlBFoNToOIpmkGqDeNj2JW5lp7AkWxI0CUuMtH4nOWSLhLrOdvbErflrPPeBVkKUTlBUNc
 VH5/SBt8nQyL966nxVwX6zcEBwoc7UGjh7bOAuEg4g0ZcH97gOAKf1XCKSF+3fD52ucQ=;
Received: from mail-pg1-f181.google.com ([209.85.215.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1o4RJZ-0005ff-I8
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jun 2022 18:12:26 +0000
Received: by mail-pg1-f181.google.com with SMTP id d129so167432pgc.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 Jun 2022 11:12:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=olGZo4G5qWhNx4sOgVQ6big/g5gyvMiHwloMnqfNjEA=;
 b=JtmwWx56uaDfxjYLxgecm0T9FjPL4Q+NeSPmh28t0qHtfrn6FtBvPYwsAVx9c7Ons1
 s8NTxFlQWzwrDv/Iq3jwrodzCsRbCXVDcEUztSypFymTLsZUH5GQ4lyjY4s8ullLLnIP
 iXvejvzA9yQL0sgZ/hiH1kYzGzqcE3OjkF4L22Tg/1pUxRBjdB7ONzbTUwskpAKDB4s8
 +oHrGJWCFc0xU4gGSUw5THZg3aalR8TXOuLCNtVXQYRYj09C9fTJeLeAlpQxl0Ju1nrt
 SgEVlXFzpyaPO9VOzKP/t/fiQEBZj/mGq33hnSyz52yt9dnHgziqWEymRpjqVjejnlon
 L1Ow==
X-Gm-Message-State: AJIora/k6nK+wPsIe4pLfcT60soFnMTK6aJFahFCPDrQwmgGy7gKJ/M0
 Xw6jEFuJWKxqxyAiOjfK48U=
X-Google-Smtp-Source: AGRyM1voxjlWLd6eyQegynYNZ7WhUDbJQ5vF5rbls7rOCWeb87Z0fcJ6X9GADBUTP5bKDpULJAxpwA==
X-Received: by 2002:a63:6cc8:0:b0:3fa:387b:3991 with SMTP id
 h191-20020a636cc8000000b003fa387b3991mr8337426pgc.19.1656007939953; 
 Thu, 23 Jun 2022 11:12:19 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:70af:1dc5:d20:a563])
 by smtp.gmail.com with ESMTPSA id
 az8-20020a170902a58800b00163d76696e1sm104803plb.102.2022.06.23.11.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 11:12:19 -0700 (PDT)
From: Bart Van Assche <bvanassche@acm.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 23 Jun 2022 11:12:05 -0700
Message-Id: <20220623181208.3596448-3-bvanassche@acm.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220623181208.3596448-1-bvanassche@acm.org>
References: <20220623181208.3596448-1-bvanassche@acm.org>
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The definition of struct blk_zone_report is as follows:
 struct
 blk_zone_report { __u64 sector; __u32 nr_zones; __u32 flags; struct blk_zone
 zones[0]; }; Since f2fs_report_zone() allocates the above data structure
 with malloc() and since f2fs_report_zone() only initializes the sector and
 nr_zones members, the flags member is not initialized. Modify f2f [...] 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.181 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.181 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1o4RJZ-0005ff-I8
Subject: [f2fs-dev] [PATCH v2 2/5] Fix f2fs_report_zone()
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
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 Bart Van Assche <bvanassche@acm.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The definition of struct blk_zone_report is as follows:

	struct blk_zone_report {
		__u64		sector;
		__u32		nr_zones;
		__u32		flags;
		struct blk_zone zones[0];
	};

Since f2fs_report_zone() allocates the above data structure with
malloc() and since f2fs_report_zone() only initializes the sector and
nr_zones members, the flags member is not initialized. Modify
f2fs_report_zone() such that 0 is passed as flags to the
BLKREPORTZONE ioctl instead of a random value. This has been
discovered by reading the source code.

Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Fixes: 6d7c7b785feb ("libf2fs_zoned: Introduce f2fs_report_zone() helper function")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 lib/libf2fs_zoned.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
index f383ce275342..d8de66b82029 100644
--- a/lib/libf2fs_zoned.c
+++ b/lib/libf2fs_zoned.c
@@ -206,7 +206,8 @@ int f2fs_report_zone(int i, uint64_t sector, void *blkzone)
 	struct blk_zone_report *rep;
 	int ret = -1;
 
-	rep = malloc(sizeof(struct blk_zone_report) + sizeof(struct blk_zone));
+	rep = calloc(1, sizeof(struct blk_zone_report) +
+		     sizeof(struct blk_zone));
 	if (!rep) {
 		ERR_MSG("No memory for report zones\n");
 		return -ENOMEM;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
