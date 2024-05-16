Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B208C741C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 May 2024 11:49:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s7Xjx-0005BJ-TR;
	Thu, 16 May 2024 09:49:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sunshijie@xiaomi.corp-partner.google.com>)
 id 1s7Xjw-0005B9-He for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 May 2024 09:49:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2zZvSaNtWmUeNxkI4ppv185+1yoxkOhOT++YkYnKwwU=; b=SOYXUDHfiQt/uaCqUFM+T2XQeI
 aA/Yg7ObC0rXPbOshkX7QslQs2XnTjuX9v9W14OkDV5eVv3y9RFxG074B5T7VxgtQ2Kgwtxe+2c1B
 DbFu1r3BMXygPe2xyKQAnptS3bn+5Tdg9Qmev0sWbz+9NYfpLk4cdTEgVC/Q4/d9r0js=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2zZvSaNtWmUeNxkI4ppv185+1yoxkOhOT++YkYnKwwU=; b=a
 PSCez7+lX3xio/mig9SAIW2lcTS7LtpJNKBnMIh/GhDz0r3iAZAJOdSezZUgtZskHumgHurCaSyUT
 7ss2bX9y0It8PiocUaYUUiVB2XZdYTrePYbVaYsRruF7hY26QUn4+b902802pz5rdClgwyDGD1sRT
 Xx5BjBLiEP+289tM=;
Received: from mail-ot1-f46.google.com ([209.85.210.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1s7Xjw-0008Es-Qx for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 May 2024 09:49:32 +0000
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-6f0ecec6411so3833485a34.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 16 May 2024 02:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xiaomi-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1715852966; x=1716457766; darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2zZvSaNtWmUeNxkI4ppv185+1yoxkOhOT++YkYnKwwU=;
 b=neiaplr8NmLcOzvXqIs4sQdxcarleI728iDRGucSMxRtdZLYMTrlZBCs1HD5vKieoz
 etUNwaX+61Bu9mSQJ0t6cKEvDWmNPRwDwe7KAT36FAKjPJxx8U3g25S6XmslAlVB8YzB
 kO4TMmW17BC/7xxTGMUIBbuDgl5ULC/0c9aKQ/FU8IPeIIDWB/VDSdiPfXoh5oCC7aoE
 0BLdK/l7m8jizLXMtghzJqFkS62ONBpdu1HEPf2FQSeQJb0Df/6DQs8oPvwAsHPsca2H
 tRartsTOuCz93uXMisndnx4Xxb7CYKhAZet289vEJ0oRUua6vHLiYzoz3e6V+0X9xh9M
 f5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715852966; x=1716457766;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2zZvSaNtWmUeNxkI4ppv185+1yoxkOhOT++YkYnKwwU=;
 b=hjncVSx8QRu/oi1Dkk2NDyQEuCLa14iQKEEU6kE9pO2268MqxP1D3XgCeIub/ApfmJ
 OAK/NwfV2SIcMfIqRwiVdO24Cv9VZQ11K52VA+KUtlSCW99pPCI74e0YDsa1Adh+6ktq
 EQkmDNy4+DkYEbNa+3RpCldoCDvEtj6R+JHoCqY8J/60sgGQI7PNJBHfBLEHacWdghLG
 /pmoSlR29cYtrP/kFKPP24pBwAXIDE5vYVAWsrjtK8WskWXiSFJnJvGErgij07qYG6lJ
 zvhrqwj3WLm7ejQLt2XT3m321GUcarLC8KWyY7+ljd7IB3vEDX3Nk8ZV0VyTD2eRwtKK
 e1xQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1XFAJgqmdKsAYNOXM8SshtzxI/9sb93zHCiBWWQfpL97wLZRGh2gNzs7BIHRn1twUy12FxZuL2vSK14e6WdcWHWY4ynM4x8Lhz6856QFzxGaQzzoTGQ==
X-Gm-Message-State: AOJu0YwipPllmOKUBWygAtKgoZVaBmvPNR0jrO49QRjLUJ/0V3Gs6Tqw
 viKAY1wXUcTy0gRq1eIC2m/zQb7axHj4Q6bfYc/qNuOW0pVasAJBMpkRmVBO4lNA8b8mkPo87X7
 DtCs=
X-Google-Smtp-Source: AGHT+IGm3lxBHFLAvKaI79CGN2/QymiEVySGur5nnzPFjC0fzWOI2djjqsS9XMe6a56FMT0cnbqKqA==
X-Received: by 2002:a17:902:930a:b0:1eb:7dc:709a with SMTP id
 d9443c01a7336-1ef43e2966fmr207153695ad.40.1715849721881; 
 Thu, 16 May 2024 01:55:21 -0700 (PDT)
Received: from sunsj-ThinkStation-K.mioffice.cn
 ([2408:8607:1b00:8:e2be:3ff:fe61:8d24])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0bf33021sm135588635ad.124.2024.05.16.01.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 01:55:20 -0700 (PDT)
X-Google-Original-From: sunshijie <sunshijie@xiaomi.com>
To: jaegeuk@kernel.org, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Date: Thu, 16 May 2024 16:55:12 +0800
Message-Id: <20240516085512.1082640-1-sunshijie@xiaomi.com>
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
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.46 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1s7Xjw-0008Es-Qx
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
 fs/f2fs/super.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index adffc9b80a9c..aeb085e11f9a 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1641,12 +1641,12 @@ static void f2fs_put_super(struct super_block *sb)
 
 	f2fs_destroy_compress_inode(sbi);
 
-	iput(sbi->node_inode);
-	sbi->node_inode = NULL;
-
 	iput(sbi->meta_inode);
 	sbi->meta_inode = NULL;
 
+	iput(sbi->node_inode);
+	sbi->node_inode = NULL;
+
 	mutex_unlock(&sbi->umount_mutex);
 
 	/*
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
