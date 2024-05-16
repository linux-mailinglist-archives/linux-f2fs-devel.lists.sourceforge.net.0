Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3249B8C7469
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 May 2024 12:11:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s7Y4r-0002xy-6N;
	Thu, 16 May 2024 10:11:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sunshijie@xiaomi.corp-partner.google.com>)
 id 1s7Y4p-0002xe-29 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 May 2024 10:11:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Esd0GZmxioawR/DRCed2mayNi6h1PjS6WdNf8dc77p8=; b=W9GxFA6p7HHlbiMyWG2qL393Md
 udhnksVP0iKJgZMjJ4hrY95IKCF6mhpr0+3b+Ea2teUGR3JiMh+VmZBCWpChvG5PO6j4We7V5X2Vt
 GDIAjkEfx8cbf3Jpl7COAyKp9kJY09s6F11lN7nqn97wGXEdqyth2PISVwXTNMgTc9iU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Esd0GZmxioawR/DRCed2mayNi6h1PjS6WdNf8dc77p8=; b=V
 XE8ssJmBPAO16Z4ncz4FuGM3N42Rd84kFlSRP1rKwGYhgaygVAOPvuSU+ZxeKx/hUwaXCxx7P48db
 3sQA2JOB8o+jW9sW9f4rZQ65EYVRZZE4kRDMYqvKO2jRZDZ+UTwAf/+Xj0csY9IKEXrdFOtiG97Qb
 VkyAxEZ2IgGfK6Ts=;
Received: from mail-ot1-f54.google.com ([209.85.210.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1s7Y4n-0001Sj-JR for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 May 2024 10:11:07 +0000
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-6f0277767fbso3554555a34.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 16 May 2024 03:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xiaomi-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1715854254; x=1716459054; darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Esd0GZmxioawR/DRCed2mayNi6h1PjS6WdNf8dc77p8=;
 b=onVv3mTZ55h9oCcsv2hsa3aNCraC70JK18o5ZpIHuJ5HHhrnvWHGx2do2VsEg/JpnZ
 0avquX0SBDII6UZWGN+ALont7RWOuY9eOYBZHstY9A6cdhBdzgwuDKCzItanTOzy7Nxj
 rwRwkyBc4UaaF12PWv2s/1COk7ThHLuWedAtO3uirHIU1Nb/MMsVpmKjIvpQHqLWrXS5
 JQa1gvKeZUM9KFtnX9CWU9NVC1N7aiIYZnVfFlQd1t3/nbfn4/zZ/BVkhNsx3JB8wrSc
 XWaZiivIXCwdk8LbnBaTreqZuiDab2QbSy0LuBLxLbza7YV4B4yNVE60fkBieiOq68tX
 3/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715854254; x=1716459054;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Esd0GZmxioawR/DRCed2mayNi6h1PjS6WdNf8dc77p8=;
 b=kK2fHFOzi2BsHw1V6UNB058QkQlz4NT0skZ+go+W/nB5AgVpR3SebNmqEf0O/PmKza
 imHCDTorapM/psKp/6BeNxAgM9ZEOSviqfFCc20JyWO9Co6CJuXyJrRUKDLkx5FUjr3V
 xqCIlFgIwP0LaHhWLmkAzevkHej050NweAYvfI2gG6gqJpnPBJ3MHyNZkbS1gVet2h5k
 NiLmFqjm2hKQ4jF6tUkLGg0F0NWDfqK9gAphrMM/pdYHgvvmkjRr5B/qZxYAdRSDt2Gl
 CveedCUdvTjJ+3F+ar8VMVh3kcBNLOE/GUYt3nWyB9JclTjnch5b6pkB7makQ2U73rOx
 DMxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYi2v4Z5+EHPYXq4V0147iiSVG6gce5YycSzjWYurly4s25zmbStSmc4Lj6R4qrhwl3xslbvZh3nOS5kVr8EIgKgCOs8674W/uPI1sfUbTVEHIQyC66A==
X-Gm-Message-State: AOJu0Yzu58uz+jpouCDCsZFl0jtO3PkR8VVpwBGffjUf9hjVbMpjKStn
 F+U7oVnNOzJuEaV3YG+6M+afuA6hXeRCvd0uCjsZYa9AlDRGdPjzTb5acyQk5d6yv5vaWvNcnIZ
 0kgI=
X-Google-Smtp-Source: AGHT+IHwfBvimhF5iUOb/bPZFTDnoArKyh1m/EcsmmDegZRq2brLO0Tbj5+711rFvFuOKFt6EyUqzg==
X-Received: by 2002:a17:90a:428b:b0:2b9:c9d5:47d4 with SMTP id
 98e67ed59e1d1-2b9c9d54b5fmr4835214a91.34.1715848864827; 
 Thu, 16 May 2024 01:41:04 -0700 (PDT)
Received: from sunsj-ThinkStation-K.mioffice.cn
 ([2408:8607:1b00:8:e2be:3ff:fe61:8d24])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2b62886cf36sm15062990a91.30.2024.05.16.01.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 01:41:04 -0700 (PDT)
X-Google-Original-From: sunshijie <sunshijie@xiaomi.com>
To: jaegeuk@kernel.org, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Date: Thu, 16 May 2024 16:40:56 +0800
Message-Id: <20240516084056.1081148-1-sunshijie@xiaomi.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When thread A calls kill_f2fs_super, thread A may submit a
 bio to the function iput(sbi->node_inode); Then thread A enters the process
 D state, and thread B may also call kill_f2fs_super and execute t [...] 
 Content analysis details:   (-5.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.210.54 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.54 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1s7Y4n-0001Sj-JR
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

When thread A calls kill_f2fs_super, thread A may submit a bio to the function iput(sbi->node_inode);
Then thread A enters the process D state, and thread B may also call kill_f2fs_super and execute the code sbi->node_inode = NULL;
Now that the bio submitted by thread A is complete, it calls f2fs_write_end_io and may trigger null-ptr-deref in NODE_MAPPING.

Thread A                                          Thread B                         IRQ context
- f2fs_put_super
 - iput(sbi->node_inode)
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
                                                  - f2fs_put_super
                                                   - sbi->node_inode = NULL
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
 fs/f2fs/super.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index a4bc26dfdb1a..adffc9b80a9c 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1618,7 +1618,6 @@ static void f2fs_put_super(struct super_block *sb)
 	f2fs_release_ino_entry(sbi, true);
 
 	f2fs_leave_shrinker(sbi);
-	mutex_unlock(&sbi->umount_mutex);
 
 	/* our cp_error case, we can wait for any writeback page */
 	f2fs_flush_merged_writes(sbi);
@@ -1648,6 +1647,8 @@ static void f2fs_put_super(struct super_block *sb)
 	iput(sbi->meta_inode);
 	sbi->meta_inode = NULL;
 
+	mutex_unlock(&sbi->umount_mutex);
+
 	/*
 	 * iput() can update stat information, if f2fs_write_checkpoint()
 	 * above failed with error.
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
