Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6248C7472
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 May 2024 12:13:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s7Y7X-0002s6-6B;
	Thu, 16 May 2024 10:13:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sunshijie@xiaomi.corp-partner.google.com>)
 id 1s7Y7V-0002rV-Ve for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 May 2024 10:13:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R5sj1HRu3Ig+X2qOqXlWio1jhIvbeRRxZ8mV6Seog3I=; b=bAN4ZxJOHHpKOs6jAyZ1pnv49W
 Rj4HWRdowF0TDN1OkpvzPAXqM0cOZeosf+tpaZCY+kNbVtRFOk1fc6oOQM94/DMiQ4qNgJXCeyiTE
 Yv3jA8PJzHFRTihb3QrIlB+otXCHaSjzgAZyMLz1sliEy6qQ1BQVjaqLCgI4RN3amioc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=R5sj1HRu3Ig+X2qOqXlWio1jhIvbeRRxZ8mV6Seog3I=; b=R
 mk/it+o8jSJgH9QEUqqGPZBvivuVP8YuUchZhXPeAda3iF8DQej5m6NQnRyd0aeqzyd/xe9D/izML
 39ew82rVncsReTmBJTPJVAFNOd2pRyiCNcBjCWezvCH9oF84tP7e7/2IjcMjhFYKjdwbtfSWTN4RS
 cTPPnkqgIUsAWq2c=;
Received: from mail-oo1-f45.google.com ([209.85.161.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1s7Y7X-0001fX-6g for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 May 2024 10:13:55 +0000
Received: by mail-oo1-f45.google.com with SMTP id
 006d021491bc7-5b27369b0e3so4323232eaf.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 16 May 2024 03:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xiaomi-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1715854424; x=1716459224; darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R5sj1HRu3Ig+X2qOqXlWio1jhIvbeRRxZ8mV6Seog3I=;
 b=xPYus00rH9DnMSpdg4NP+EoHrTsvMdXMI0rO/ENZ5hMwrQLdi0WjeYwuiwcsHOyDTQ
 idZ34QnL5UIsE0omhjq7UDmtdbgu//qe+XetxmKHhoILg6eU4QpEUqZIv7ZHf62T1fgU
 OPHLfrNIh1tkktQPlqdQMH7PXvx4YYPOKcX3HA8HuQMPSvbYhuYmW/lKfRam9YgkqzSH
 xJBABhDXkxgyiGTaYL9uDy9PiY53lP6BoELt4Gl5zO9zP5a3Fkliw5dzdcACbW6RyGgM
 1YPImL5lN0RFbaGJHdDh7IH4l1uUowzeeZM3wiVtYPBFlwacg7LN+mL4jhN/tpbbIzlX
 SvUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715854424; x=1716459224;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R5sj1HRu3Ig+X2qOqXlWio1jhIvbeRRxZ8mV6Seog3I=;
 b=ns1Qs5HkG7Oej2FuKsvnLmAN+hhvaO7EYXqNo0pJ7iKV9Yghasd0jKihj99fBowg9i
 V276aMK/jrQDjjulSpWj3iGG19/bJX2pWxahtA1hVeeL5tDx/icvU0DVU6/bRDhuwZx0
 OE5PfMJp7zzM6a+8YXiHqeycWh90Qx26IYUN9zTHh2jv37EUTzmP0zRi7BbGl01xAjJd
 OQ68Sl2D71TZEU3hv39Ords/ekyHSvq4KtQuvR/KJu6F4rO5JlU9twc96mnUJPwXXIHk
 b3jaznSrcnf5i+pamZ0HLcfQSJdUy4O0Qwm6zhg9rFDZ5TZjNlo3AjB98wqsn4qCy84V
 eRkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK0NmFnoViS/8C7ekt5eX5k3lnG9TxqtTNKciU4RwIK648pmBaX5X/UFgIQ8weezX1UAhBnLKRAnibTTuLlz0VbW4cHlsxjEu9rGt40g6SIZrktd25wQ==
X-Gm-Message-State: AOJu0YyyhvHGcmgZgB7sgEECvmZ1mtIG06YgsFFcj5d0kCMWWBO8pmwN
 x8VEtZRYxUfUGZapgU/S1/JyVFM4pLLSkOm36PwhDimgTcDKs6ONH1WGr0711YI=
X-Google-Smtp-Source: AGHT+IE3kPBO4KARlWFqlg5xjD0vBi1340ru39bDDQj8/8OAoLZYk0G/aVFKf1PqkgXqNSw6i5E54w==
X-Received: by 2002:a05:6358:9494:b0:192:75c4:2edc with SMTP id
 e5c5f4694b2df-193bcfd1c27mr2539152355d.25.1715854423624; 
 Thu, 16 May 2024 03:13:43 -0700 (PDT)
Received: from sunsj-ThinkStation-K.mioffice.cn
 ([2408:8607:1b00:8:e2be:3ff:fe61:8d24])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-6340b57f28asm11355948a12.26.2024.05.16.03.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 03:13:43 -0700 (PDT)
X-Google-Original-From: sunshijie <sunshijie@xiaomi.com>
To: jaegeuk@kernel.org, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Date: Thu, 16 May 2024 18:13:38 +0800
Message-Id: <20240516101338.1089140-1-sunshijie@xiaomi.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When thread A calls kill_f2fs_super, Thread A first executes
 the code sbi->node_inode = NULL; Then thread A may submit a bio to the function
 iput(sbi->meta_inode); Then thread A enters the process D s [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [209.85.161.45 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.161.45 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1s7Y7X-0001fX-6g
Subject: [f2fs-dev] [PATCH] f2fs: fix panic in f2fs_put_super
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
From: sunshijie via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: sunshijie <sunshijie@xiaomi.corp-partner.google.com>
Cc: sunshijie <sunshijie@xiaomi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When thread A calls kill_f2fs_super, Thread A first executes the code sbi->node_inode = NULL;
Then thread A may submit a bio to the function iput(sbi->meta_inode);
Then thread A enters the process D state,
Now that the bio submitted by thread A is complete, it calls f2fs_write_end_io and may trigger null-ptr-deref in NODE_MAPPING.

Thread A                                          IRQ context
- f2fs_put_super
 - sbi->node_inode = NULL;
 - iput(sbi->meta_inode);
  - iput_final
   - write_inode_now
    - writeback_single_inode
     - __writeback_single_inode
      - filemap_fdatawait
       - filemap_fdatawait_range
        - __kcfi_typeid_free_transhuge_page
         - __filemap_fdatawait_range
          - wait_on_page_writeback
           - folio_wait_writeback
            - folio_wait_bit
             - folio_wait_bit_common
              - io_schedule

                                                  - __handle_irq_event_percpu
                                                   - ufs_qcom_mcq_esi_handler
                                                    - ufshcd_mcq_poll_cqe_nolock
                                                     - ufshcd_compl_one_cqe
                                                      - scsi_done
                                                       - scsi_done_internal
                                                        - blk_mq_complete_request
                                                         - scsi_complete
                                                          - scsi_finish_command
                                                           - scsi_io_completion
                                                            - scsi_end_request
                                                             - blk_update_request
                                                              - bio_endio
                                                               - f2fs_write_end_io
                                                                - NODE_MAPPING(sbi)

Signed-off-by: sunshijie <sunshijie@xiaomi.com>
---
 fs/f2fs/super.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index adffc9b80a9c..62d4f229f601 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1642,9 +1642,9 @@ static void f2fs_put_super(struct super_block *sb)
 	f2fs_destroy_compress_inode(sbi);
 
 	iput(sbi->node_inode);
-	sbi->node_inode = NULL;
-
 	iput(sbi->meta_inode);
+
+	sbi->node_inode = NULL;
 	sbi->meta_inode = NULL;
 
 	mutex_unlock(&sbi->umount_mutex);
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
