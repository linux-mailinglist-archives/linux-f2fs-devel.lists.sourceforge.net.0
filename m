Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F04B82F051
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jan 2024 15:12:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rPkAg-0005AB-9b;
	Tue, 16 Jan 2024 14:12:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1rPkAe-0005A5-FF
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jan 2024 14:12:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pwGjvXloGvIfAhj2uR+wy0smwtrFBrVoNPSps/xZwaQ=; b=ZNK9T9YHLlgqPm9SzMPAgrz+zq
 8lNs1uvYcNqNbKdkSeGJhu2ElT0PVT2EvdBgOjOZHWx6AXQftlfrApwudts+vE/aJmpxqSF/6vsA7
 nuPy95HjaOlFEvYInoxYFrbsmNSJIJBSUveGbs87ywGTmvYQw4soNPyv5xdUUKfxd6WI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pwGjvXloGvIfAhj2uR+wy0smwtrFBrVoNPSps/xZwaQ=; b=K
 11fY11/5pKCPszgFdx+2i9Ns2MKHT3gFGXfZXyrc/c+zErCtpTtjkYO+2vn3NpAtAJ6fvqhURmqdr
 Kw+7Zfzk52WrulrVGAyl9aVbb5PBYezuEW/LoiDyb2bAWFtxYqR9goy6Nvdtj9yvnttkETvOirDEZ
 WiUE8tUVtgS4pQ2o=;
Received: from mail-pl1-f176.google.com ([209.85.214.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rPkAY-00014E-I0 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jan 2024 14:12:04 +0000
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1d3eb299e2eso58654595ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Jan 2024 06:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705414313; x=1706019113; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pwGjvXloGvIfAhj2uR+wy0smwtrFBrVoNPSps/xZwaQ=;
 b=CTbg81hzNk0IriS6X4xHCgdt1lTPYAFVIYz4rWyFh47qzkltqZK0KnVdztw2ZG9EYo
 8ryuknUpmzDckITIX7aD13S6WdKuiMuSd0wFIgYfZF8z777S2xKnp9pvvDHGab5mzvDT
 +2qBqoIoAGoScfnDC16R/9Qb7BewcOLeP9Tn/49+VvGO1uVaDfDQmrFtl7lp+gKMH78S
 kTYYBm21ZUWDC0GapEOg1KJGhw0E9rPJwBgwRlDcdr5LEOa6lX8wRPk5VUkZykQ9S4+g
 UMf7bqF7SZWIKiNcqJOvFsGNpqyD/FbThYs2Aq9me6RiMZ89wJNvRXq68eG7trNWDz9P
 9aoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705414313; x=1706019113;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pwGjvXloGvIfAhj2uR+wy0smwtrFBrVoNPSps/xZwaQ=;
 b=iq/F0jWYHoBGdT8KJpDypqepCjMRABMVoFPvgLbobGr8rVQH/Bs3bfiE5qa9d0S/og
 RDjMDlGPldprDwiKR5yd5k/Zyv0LjqoemOFimlJbG8NqIqBwpot5kcEePbjpA07Z9WLg
 mfhtDQFy8Mhx38ctl22PJwxOwJHej1/kRYJ2tK4pKBuSc7I810VthSv9iGX1kwo+UiZw
 gIyTo2yifwSLpXvjRHcNL7bEkoRN2jzak21ashH9W9eUuT/OS+dlWB8qEhEwR0EifH6U
 7HFYeNu2zliXHSrs8AV+KK9ZNyEpGcxMEAlyqvGcgk+waWnKt0ZyxXAQFUHjKBX8l9UN
 M4pg==
X-Gm-Message-State: AOJu0YyPAfLKz/uSD4nmPgnXChSgIQKkhQZgBnyri4KZbrK0J/aOR8ci
 WpbsB67T3CpjI+K4fG+ScLnuqpqL6geqEw==
X-Google-Smtp-Source: AGHT+IG5klyCfFZF8El2yLuJhphWWf5wZvlzZYGbQLqxzbecF3MpOnUMh2kBGHKEk1ZmThfmwVC5sA==
X-Received: by 2002:a17:902:eccf:b0:1d5:b797:fdc with SMTP id
 a15-20020a170902eccf00b001d5b7970fdcmr2922442plh.131.1705414313502; 
 Tue, 16 Jan 2024 06:11:53 -0800 (PST)
Received: from localhost.localdomain ([2001:250:4000:8246:8dd2:f82d:e185:367f])
 by smtp.gmail.com with ESMTPSA id
 p19-20020a170903249300b001d5c38d720bsm4360242plw.2.2024.01.16.06.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 06:11:53 -0800 (PST)
From: Wenjie Qi <qwjhust@gmail.com>
To: jaegeuk@kernel.org, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Date: Tue, 16 Jan 2024 22:11:38 +0800
Message-ID: <20240116141138.1245-1-qwjhust@gmail.com>
X-Mailer: git-send-email 2.43.0.windows.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  BUG: kernel NULL pointer dereference,
 address: 0000000000000014
 RIP: 0010:f2fs_submit_page_write+0x6cf/0x780 [f2fs] Call Trace: <TASK> ?
 show_regs+0x6e/0x80 ? __die+0x29/0x70 ? page_fault_oops+0x154/0 [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.176 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.176 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qwjhust[at]gmail.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rPkAY-00014E-I0
Subject: [f2fs-dev] [PATCH v1] f2fs: fix NULL pointer dereference in
 f2fs_submit_page_write()
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
Cc: Wenjie Qi <qwjhust@gmail.com>, hustqwj@hust.edu.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

BUG: kernel NULL pointer dereference, address: 0000000000000014
RIP: 0010:f2fs_submit_page_write+0x6cf/0x780 [f2fs]
Call Trace:
<TASK>
? show_regs+0x6e/0x80
? __die+0x29/0x70
? page_fault_oops+0x154/0x4a0
? prb_read_valid+0x20/0x30
? __irq_work_queue_local+0x39/0xd0
? irq_work_queue+0x36/0x70
? do_user_addr_fault+0x314/0x6c0
? exc_page_fault+0x7d/0x190
? asm_exc_page_fault+0x2b/0x30
? f2fs_submit_page_write+0x6cf/0x780 [f2fs]
? f2fs_submit_page_write+0x736/0x780 [f2fs]
do_write_page+0x50/0x170 [f2fs]
f2fs_outplace_write_data+0x61/0xb0 [f2fs]
f2fs_do_write_data_page+0x3f8/0x660 [f2fs]
f2fs_write_single_data_page+0x5bb/0x7a0 [f2fs]
f2fs_write_cache_pages+0x3da/0xbe0 [f2fs]
...
It is possible that other threads have added this fio to io->bio
and submitted the io->bio before entering f2fs_submit_page_write().
At this point io->bio = NULL.
If is_end_zone_blkaddr(sbi, fio->new_blkaddr) of this fio is true,
then an NULL pointer dereference error occurs at bio_get(io->bio).
The original code for determining zone end was after "out:",
which would have missed some fio who is zone end. I've moved
 this code before "skip:" to make sure it's done for each fio.

Signed-off-by: Wenjie Qi <qwjhust@gmail.com>
---
 fs/f2fs/data.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index dce8defdf4c7..4f445906db8b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1080,10 +1080,6 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 	io->last_block_in_bio = fio->new_blkaddr;
 
 	trace_f2fs_submit_page_write(fio->page, fio);
-skip:
-	if (fio->in_list)
-		goto next;
-out:
 #ifdef CONFIG_BLK_DEV_ZONED
 	if (f2fs_sb_has_blkzoned(sbi) && btype < META &&
 			is_end_zone_blkaddr(sbi, fio->new_blkaddr)) {
@@ -1096,6 +1092,10 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 		__submit_merged_bio(io);
 	}
 #endif
+skip:
+	if (fio->in_list)
+		goto next;
+out:
 	if (is_sbi_flag_set(sbi, SBI_IS_SHUTDOWN) ||
 				!f2fs_is_checkpoint_ready(sbi))
 		__submit_merged_bio(io);
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
