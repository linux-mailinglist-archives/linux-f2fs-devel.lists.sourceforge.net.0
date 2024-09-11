Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1003B975C72
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Sep 2024 23:30:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1soUvJ-0000dD-Ii;
	Wed, 11 Sep 2024 21:30:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1soUvI-0000d4-Fo
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 21:30:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ND0dFv6nG4nnD2cgNnxmWojj7h/h+D3ul3lYx8AfWwY=; b=k4dhuI+h17uSYQBO+amSavNSV9
 wFikrY+TlNYb3kkGZQu0uD32v66GrCRPTjNgC2R5qzlgGamQvZWfC+mo/ElWRTMnfpcPMAcEDxbBz
 t4fyQZ5p93K8Yot233tzQJ0YLtawWMcg51aZHF3emd3N27fz7sPn3mDxpAm2SpRNZ/Vg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ND0dFv6nG4nnD2cgNnxmWojj7h/h+D3ul3lYx8AfWwY=; b=A
 l6FZ93OUAfFgecZ2ZVla4o/f+x4K6DqQ9PZ57MamEVHUgY+yJlveXE0/iASlud9ZUADMKO09t+dmE
 q3VOhWQmlQ87APq/05xz/VtX9i27G7A4jgMarGnqXZkETwuRF6yClLvxyTnSQZLtkARX1Wof0K8h5
 6DOfgTzbxiBcm/d4=;
Received: from mail-pl1-f170.google.com ([209.85.214.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1soUvH-0002LL-AI for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 21:30:47 +0000
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2053f6b8201so2796715ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 11 Sep 2024 14:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726090237; x=1726695037; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ND0dFv6nG4nnD2cgNnxmWojj7h/h+D3ul3lYx8AfWwY=;
 b=VLaqBkVdPzASwLusfTLO7+jxlQlueasW2s9dkbr8EBX3VOq8xw1HxkAyqiIMEklpAz
 TM9nUoabM93oSUg/98n/EbLm+FwB3lDaygo/SMz5mAtTTszRVkKT2oofBoMtMwEMIb5t
 1lsQyLzNE44vXdgUpGqrBNoqstDk1t346ITrYYtDj/HFycdjazNYA5EFYfDPaeLl/hGM
 UMcVWGYzW6XD3g3PSWVC93WKSR0y3uW+t8yhp6j3ZrellJ080KvJxjNXC6e0AA6mAyuS
 vXJYJ/vBI1Z41vk76Z6qy12UYdGxZAUy28WNX+JZw5oyy5x4qUgbrzbr5BBIldO92QEA
 F+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726090237; x=1726695037;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ND0dFv6nG4nnD2cgNnxmWojj7h/h+D3ul3lYx8AfWwY=;
 b=fDdcZAAoFUsPCNLVaFGpW8D5ChK4cvv1MRaTqwUYU6993NnkYg/997uSXtGcTLhnIb
 ax9AAf4K3788KfQrQhk0AoSDJIylM6kbHcmAmDxwDJXBN1HT0vKfJaZ9tv5rcMcIWsLw
 5b6fBf7kg43RIJDY3/xk5zYpwjKdrNzM1qF4VE3UiY9QE3K3nxtptiaeD2eq15P1ioEl
 hTDODOyftfoiFkbVFYm0DvVmjlFMTjWuzN1NJAmpYPJH9nH1AquYHZU/WT8sBvkuE5eP
 6nqrAdeCcWA0cd7Hl4caJjoRkMClkuAUSwuJ1kZ7/YTaMU3BPNCxCPJqkAUEF+byXE2P
 arbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNkw+6gDWPSbz2fmWaEVD5ze9EAqFB7dSu6bkTd+kpfI+pQE9vhFBP1Iv89cckV8luQKUNGNo79pYO1NTlT7Tf@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzbzGk//75WBjHVsUKDAOYGBjIEEdn/W++xJRjfsDRIFXEEMmCn
 Ms/gyFo3425gTL/5X3TkIY3gP0f8g7kZ6cbvcwz35Y8gSne6j6Lk
X-Google-Smtp-Source: AGHT+IHtRaKXBZUOkwmoSTSvPlA7hYaDv9260Cea35CnvQUz6sWM0eYC/6jYR4nm2iFUJx/7qLb/XQ==
X-Received: by 2002:a17:902:ec83:b0:206:cc5b:ad0c with SMTP id
 d9443c01a7336-2076e371523mr9444105ad.28.1726090236284; 
 Wed, 11 Sep 2024 14:30:36 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:8f19:757b:ead8:14be])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2076afe9da3sm3663715ad.239.2024.09.11.14.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 14:30:35 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Wed, 11 Sep 2024 14:30:31 -0700
Message-ID: <20240911213031.183299-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong We need to migrate data blocks even though
 it is full to secure space for zoned device file pinning. Signed-off-by:
 Daeho Jeong Fixes: 9703d69d9d15 ("f2fs: support file pinning for zoned
 devices")
 --- fs/f2fs/gc.c | 3 +-- 1 file changed, 1 insertion(+), 2 deletions(-) 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.170 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.170 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1soUvH-0002LL-AI
Subject: [f2fs-dev] [PATCH] f2fs: forcibly migrate to secure space for zoned
 device file pinning
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

We need to migrate data blocks even though it is full to secure space
for zoned device file pinning.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
Fixes: 9703d69d9d15 ("f2fs: support file pinning for zoned devices")
---
 fs/f2fs/gc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 724bbcb447d3..aaae13493a70 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -2010,8 +2010,7 @@ int f2fs_gc_range(struct f2fs_sb_info *sbi,
 			.iroot = RADIX_TREE_INIT(gc_list.iroot, GFP_NOFS),
 		};
 
-		do_garbage_collect(sbi, segno, &gc_list, FG_GC,
-						dry_run_sections == 0);
+		do_garbage_collect(sbi, segno, &gc_list, FG_GC, true);
 		put_gc_inode(&gc_list);
 
 		if (!dry_run && get_valid_blocks(sbi, segno, true))
-- 
2.46.0.598.g6f2099f65c-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
