Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8A4878BB2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Mar 2024 00:59:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rjpYQ-0006SX-S2;
	Mon, 11 Mar 2024 23:59:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rjpYO-0006SP-KJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Mar 2024 23:59:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LsKPWyHq5LYsk7GmH1W3pe42SNKM0nIJT896aTATdGM=; b=l3wXQD/CnrlojXHSr6OCKsJKmV
 0U7LE+TAjNtKqXp0X9CZrHAjqeT0gxbaNriy6DoBWScFv7OLdX7AQ+ST6zdVBYznl96gDFZr5FZEv
 ELlkLVFkrSUcyuLZAgA+kLwN4jHv1R6KQLJqWYA9Hv30QGuFe8p6CvTwX2YTxXsXt550=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LsKPWyHq5LYsk7GmH1W3pe42SNKM0nIJT896aTATdGM=; b=c9Id6Wnz4Gd7izx/hw3luHjkaN
 5cfVWaXAowJd5+Spn6S3SByQaCZMo1dD0nbZ4WY7ufC729M51gpXgWA19Ktw7I1KxJFK2CcfGCGc5
 oCs7wGbczhZ0NWNindogJrGAXqg1IY6xc/sD1UeNNlxkkogresMmqH1vzBoB5IztO1Vg=;
Received: from mail-pl1-f179.google.com ([209.85.214.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rjpYE-0006aQ-EF for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Mar 2024 23:59:36 +0000
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1dd955753edso15317745ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 11 Mar 2024 16:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710201567; x=1710806367; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LsKPWyHq5LYsk7GmH1W3pe42SNKM0nIJT896aTATdGM=;
 b=HsEfEotjy51VluyZvysr5pH+xhNLWR8cVPBVWdpl/p1vsZn0PvbaLWBJ/Q5IQ2W41l
 UN3fyWXbGZrG1DjkVtuyYhphm/MRe6gejizwCxgysOzFLwQYwHZHFN5NA6Rf1nFB6ZYD
 utj6EFe4QmsL1gmO4HGO3LM365WYvFq2mx0qB7yMXozpsgbpkvaK9/P/LGP/f+FlcuOq
 YDmE2NBlW6e64OXPw+uEdS4sFcmUSUopMdC4SXHoQcuhae+G0ycFMFNhXNB4y4GLCJtt
 G/bHKNYcmXd/6ZUaHzWazuKxf9/5YwEEJu16N422pstaBL8WUA6loLn5wm0kHtvtLkuz
 gKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710201567; x=1710806367;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LsKPWyHq5LYsk7GmH1W3pe42SNKM0nIJT896aTATdGM=;
 b=FCigupHIp5Ir3CgLQguXM04Y6OvmzVCJeFj5LsFkbWrvW66mNJPf1g10JO4tT+W5yI
 FGG6I/KBL3sBR97gPVNA/NOvVzBf2NXVtxAae2Yk2u0FM0zJuqsZbE2Zw6oxXi0ox2F6
 8d5oTILkd11Wu3Bu7PQzkR2WGbH4NE27wSQG+w9qJ0KVJHNr0aPVqF9KdSgWqdE85tbZ
 u5iaibYeHlpMdZhtR0OMmhn8fgLgCkllZVSzcMV2rjhvT+X04kY2phbXNo6aN9J1D/qo
 a1W+6omnjsB/aItAKMKQuahPm9+UC+v+QGobhq0ANv10cRHoj+v19I/ihznr4aI3CbBJ
 mDrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6Hg6qaw4NF53wh6wvF+NuT8+HhuDTXqJAFDEs0/GfsniDKRe+lME4NSPGwFzqXW0Fdd44SIJuavrwM2sgK6cMN755iB8zEnBRmM6hQ9GaujJr1g1rjA==
X-Gm-Message-State: AOJu0Yzx+mMAYEyEmaQA9cbyUuEfIGWHP/8OciMbaiqT5nl4SIMAWi9D
 2n9Khrlu/I8XF9J1ZgCoAfTXt/psMZoK1DU7/HCsSWHp9qJZUv6p
X-Google-Smtp-Source: AGHT+IF1ABXbK5i77LpXCYRbv/tMLOus7tMygDXhPh8Ov+wEPEEPpqo8jJgj3TyfgoigtHBBcQVnLg==
X-Received: by 2002:a17:903:2b0c:b0:1dd:a608:483d with SMTP id
 mc12-20020a1709032b0c00b001dda608483dmr3329862plb.1.1710201566787; 
 Mon, 11 Mar 2024 16:59:26 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:0:1000:8411:d706:f56a:f0d2:75d])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a170902d2c500b001dc8f8730f3sm3473272plc.285.2024.03.11.16.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 16:59:26 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon, 11 Mar 2024 16:59:20 -0700
Message-ID: <20240311235921.1832684-2-daeho43@gmail.com>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
In-Reply-To: <20240311235921.1832684-1-daeho43@gmail.com>
References: <20240311235921.1832684-1-daeho43@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong In a case writing without fallocate(), we
 can't guarantee it's allocated in the conventional area for zoned stroage.
 Signed-off-by: Daeho Jeong --- fs/f2fs/data.c | 7 +++++++ fs/f2fs/file.c
 | 4 ++++ 2 files changed, 11 insertions(+) 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.179 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.179 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1rjpYE-0006aQ-EF
Subject: [f2fs-dev] [PATCH 2/2] f2fs: prevent writing without fallocate()
 for pinned files
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

In a case writing without fallocate(), we can't guarantee it's allocated
in the conventional area for zoned stroage.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/data.c | 7 +++++++
 fs/f2fs/file.c | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index c21b92f18463..5e4c11a719a0 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3378,6 +3378,8 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 		f2fs_map_lock(sbi, flag);
 		locked = true;
 	} else if ((pos & PAGE_MASK) >= i_size_read(inode)) {
+		if (f2fs_is_pinned_file(inode))
+			return -EIO;
 		f2fs_map_lock(sbi, flag);
 		locked = true;
 	}
@@ -3407,6 +3409,11 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 
 	if (!f2fs_lookup_read_extent_cache_block(inode, index,
 						 &dn.data_blkaddr)) {
+		if (f2fs_is_pinned_file(inode)) {
+			err = -EIO;
+			goto out;
+		}
+
 		if (locked) {
 			err = f2fs_reserve_block(&dn, index);
 			goto out;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 82277e95c88f..f98730932fc4 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4611,6 +4611,10 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
 			return ret;
 	}
 
+	/* For pinned files, it should be fallocate()-ed in advance. */
+	if (f2fs_is_pinned_file(inode))
+		return 0;
+
 	/* Do not preallocate blocks that will be written partially in 4KB. */
 	map.m_lblk = F2FS_BLK_ALIGN(pos);
 	map.m_len = F2FS_BYTES_TO_BLK(pos + count);
-- 
2.44.0.278.ge034bb2e1d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
