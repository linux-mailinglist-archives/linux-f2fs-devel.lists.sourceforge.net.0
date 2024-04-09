Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF1E89E61D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Apr 2024 01:34:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ruKyy-0002rT-TW;
	Tue, 09 Apr 2024 23:34:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1ruKyx-0002rN-LC
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Apr 2024 23:34:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6odFHMEXFzZMinU+/jCuQ/6/uayaOc5n4IeqpxK5Lj4=; b=PVQwacCnApLgPn0+0NmUdwHByH
 ovCiXQAZ1uczRBpKWx+lK89YFxgX8UZnm6oEQ6UtWMNr/LBjn9giQcDggb5eENVEbPmz4X3NkO6p7
 NQ2rUYWC+ShojdN+5sB9tARmDqchg0pUB2QlqB4Cqm6xlx8Q1f+JpB2bwtxTUG8upX28=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=6odFHMEXFzZMinU+/jCuQ/6/uayaOc5n4IeqpxK5Lj4=; b=T
 OrRpqsPMLHj+bZemtUy776hSIQ3ej2paTNzQZ8+oS6GgiChPvov8xKg8ico4DgnLuzGPvNOr+9dU1
 3T/zL3ecNlJvoesO/1hSg+de5oXrodwyv5+MpeBRpxcCgHmj7t/weZNtmAO541DE3AG1vySBs8A1l
 F8TK0EVGD6YYn6SE=;
Received: from mail-pl1-f169.google.com ([209.85.214.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ruKyx-0002ts-4y for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Apr 2024 23:34:27 +0000
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1e3f17c64daso22817705ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 09 Apr 2024 16:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712705656; x=1713310456; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6odFHMEXFzZMinU+/jCuQ/6/uayaOc5n4IeqpxK5Lj4=;
 b=FnQ1TGnKrzK+d7Sp+lla+fn5dKlb/DgOkE/qoK5gXxIhgaRcWpaPG7+pSd70uLUY5u
 M2J1nV1x/KJApz2rKACD+ze8w9WPjbGa3XOBfb66Hn17bV+u0i++16Ei7dpbvGJe7LOH
 5f5Wo8C25pa8JzVZNh01W0sQyr7QMxyYELMMQFr9jAlC02jxa0P1rkta2UDKvEG0/xN4
 qgjPqeafjhF63WxkaVStDV7zY8Uz+HNhPD9V6NP4Wg98kvrwAFR1pmIbp/RGtu3iG+cb
 XApKgH49WPm/wmCoXAuiBzLRVkv+aUiVz3qcodZES3KbDVpKUKiDx/YrATPjbvV1ocUz
 WTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712705656; x=1713310456;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6odFHMEXFzZMinU+/jCuQ/6/uayaOc5n4IeqpxK5Lj4=;
 b=a1+SFeaLa2OwWoGeuQmiFoAYRzev73GSnsRXO+qwIH0oQ97e4wx+cO7Yzu4ziW6Wns
 ZePKB/FLDZZ1K/2bO+5zoLPc8Cwh3vP2pBtvrrgvmQWLbfAY5DSpjlEfSt0tGAfooNdF
 yr/xYvUx2HjFeO/BLrrLRJXEiyfl1tOOpfXRQmh55DE3okJDsvC0iF+2oj75bHOGn7As
 GOxnROhAqRKRN5uCa/s4HiYclLcpX7Dw1pzGWLavLbQS3wuuOj02hxFtQtXhVsky7uLB
 wVirLg9McC+57eVzT7q0o6FILQqcPtEv+Mpudg4dQs2JiPNM8l3Oz4YQDya6pshJ716l
 tqoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5paA7szoBy6HlyCQoTjV/8R8TatD+bWcgxavTxjHhTzJU1wEO/PirCNiaqcFU97kBnAnkYZqROsnfTss7iznRo5Gs7op3+1zNe7I6eu1fD6yr3SKLSw==
X-Gm-Message-State: AOJu0YyphDCMCHLSk9s0NF+7uihInf8BE1EtyN3jV2uH5Kwp1SxldhwH
 stFLTftt4LacnwSvvrhUHi/EpqV4yB8ch6w31KkrJQOchjVcAeai
X-Google-Smtp-Source: AGHT+IHkJr8feUvKJuTXxw3mj3hdsJ+535brp1RYR3IJHjcS9AsHhDj+0eU7FhodjhHv9PWsUEOl1Q==
X-Received: by 2002:a17:902:d905:b0:1e4:9af6:ddc2 with SMTP id
 c5-20020a170902d90500b001e49af6ddc2mr1027083plz.40.1712705656411; 
 Tue, 09 Apr 2024 16:34:16 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:0:1000:8411:1d4b:7a42:2921:f1b0])
 by smtp.gmail.com with ESMTPSA id
 s1-20020a170902ea0100b001e042dc5202sm9426408plg.80.2024.04.09.16.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 16:34:16 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue,  9 Apr 2024 16:34:11 -0700
Message-ID: <20240409233411.1197830-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong While do not allocating a new section in
 advance for file pinning area, I missed that we should write the sum block
 for the last segment of a file pinning section. Fixes: 9703d69d9d15 ("f2fs:
 support file pinning for zoned devices") Signed-off-by: Daeho Jeong ---
 fs/f2fs/segment.c | 2 ++ 1 file changed, 2 insertions(+) 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.169 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.169 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ruKyx-0002ts-4y
Subject: [f2fs-dev] [PATCH] f2fs: write missing last sum blk of file pinning
 section
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

While do not allocating a new section in advance for file pinning area, I
missed that we should write the sum block for the last segment of a file
pinning section.

Fixes: 9703d69d9d15 ("f2fs: support file pinning for zoned devices")
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/segment.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 4fd76e867e0a..6474b7338e81 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3559,6 +3559,8 @@ int f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 	if (segment_full) {
 		if (type == CURSEG_COLD_DATA_PINNED &&
 		    !((curseg->segno + 1) % sbi->segs_per_sec)) {
+			write_sum_page(sbi, curseg->sum_blk,
+					GET_SUM_BLOCK(sbi, curseg->segno));
 			reset_curseg_fields(curseg);
 			goto skip_new_segment;
 		}
-- 
2.44.0.478.gd926399ef9-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
