Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 468754C018E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Feb 2022 19:43:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nMa8O-0001yS-Bm; Tue, 22 Feb 2022 18:43:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1nMa8N-0001yL-Dd
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Feb 2022 18:43:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+bXHFL77ezZEg+awCahATq+Oub/xwDc/cfPztbFrhd0=; b=ZO/pkHZc9G9Dm7meXf/DPYziSv
 NM1qLRhZqzn5Ry6BPzVAmPF27a+MqOZ0C74Hcp9PDXZ60U+2jT9wQLDyyWIHDYyE0L4wu61Vul0Id
 br9JJRMz5q2hkrm7A3ioGaLXgUmXOhpNi5Dt7ogclnbjNqc+YcthKeKaOC1e8jhGnA/w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+bXHFL77ezZEg+awCahATq+Oub/xwDc/cfPztbFrhd0=; b=Z
 Vdol8CycgPbiLu8su0+Jje8HMmqFFBdwRuAbefYO9ePweZTeMHDlSXcBunxSLO6EhWW0wKr2Qf7I8
 TvM4MN9hmoh2y1367gQ69kNvePBOLk+0qPnJHa6xAzTplIvhILY749DHm1BU1Y19cTrELqVQS8JXI
 SdNwZWoF5DKzfJo8=;
Received: from mail-pl1-f180.google.com ([209.85.214.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nMa8D-0001Qq-LH
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Feb 2022 18:43:30 +0000
Received: by mail-pl1-f180.google.com with SMTP id bd1so477088plb.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Feb 2022 10:43:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+bXHFL77ezZEg+awCahATq+Oub/xwDc/cfPztbFrhd0=;
 b=sVSxsg2Qb1U8Ll3lSWhorFR6O7xIU2TrwZvB4tJWxhYNjR3mFPiQpeRaCOF/G0uG9m
 3gR6P0ybP44fQhIhLjuBt8A06nuAxr1n+TfbNDvzwLjaCqYthyfaikx6A/lfVMv3lvey
 /jBhdSUp9GtoLN1FKWoAjwTrTV9IBrL4kJtn+qYZ5JzcysyINIymuas7cnE4UQjyDjL6
 RTZCbB8jePpXNkOfpJshUdmA7CE8bwRehf7qLVdd1fC29tihYq9eADxNs/W6XPuItRsA
 56Ytks1jiBncR4fS8zQqSoRckSd6u3/4BytPR1I1RKwBKhXkzDXhm+bOW9SF02VliESm
 hhLg==
X-Gm-Message-State: AOAM532ikff7rXWwJf72k4+M1p3kFmvEflyFRc8Lihcvyd8af9egqu1i
 rZIkMCedu768AfojTVcz4o4=
X-Google-Smtp-Source: ABdhPJydSJaXTujv64vjm/Z4VlO9b+0PnVgywp358B2Kpz2oi8dhAGga0bWCQ0Ml9mdN59eD1RqpKw==
X-Received: by 2002:a17:902:7e8f:b0:14f:b09c:937a with SMTP id
 z15-20020a1709027e8f00b0014fb09c937amr11389064pla.0.1645555399967; 
 Tue, 22 Feb 2022 10:43:19 -0800 (PST)
Received: from asus.hsd1.ca.comcast.net
 ([2601:647:4000:d7:feaa:14ff:fe9d:6dbd])
 by smtp.gmail.com with ESMTPSA id o5sm17193329pfk.172.2022.02.22.10.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 10:43:19 -0800 (PST)
From: Bart Van Assche <bvanassche@acm.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Tue, 22 Feb 2022 10:43:13 -0800
Message-Id: <20220222184313.6057-1-bvanassche@acm.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Lockdep uses lock class keys in its analysis. init_rwsem()
 instantiates one lock class key with each init_rwsem() user as follows:
 #define
 init_rwsem(sem) \ do { \ static struct lock_class_key __key;
 \ \ __init_rwsem((sem), #sem, &__key); \ } while (0) 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.180 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.180 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1nMa8D-0001Qq-LH
Subject: [f2fs-dev] [PATCH] f2fs: Restore rwsem lockdep support
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
Cc: syzbot+0b9cadf5fc45a98a5083@syzkaller.appspotmail.com,
 Bart Van Assche <bvanassche@acm.org>, Tim Murray <timmurray@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Lockdep uses lock class keys in its analysis. init_rwsem() instantiates
one lock class key with each init_rwsem() user as follows:

 #define init_rwsem(sem)                                        \
 do {                                                           \
         static struct lock_class_key __key;                    \
                                                                \
         __init_rwsem((sem), #sem, &__key);                     \
 } while (0)

Commit e4544b63a7ee ("f2fs: move f2fs to use reader-unfair rwsems") reduced
the number of lock class keys from one per init_rwsem() user to one per
file in which init_f2fs_rwsem() is used. This causes the same lock class key
to be associated with multiple f2fs rwsems and also triggers a number of
false positive lockdep deadlock reports. Fix this by again instantiating one
lock class key with each init_f2fs_rwsem() caller.

Cc: Tim Murray <timmurray@google.com>
Reported-by: syzbot+0b9cadf5fc45a98a5083@syzkaller.appspotmail.com
Fixes: e4544b63a7ee ("f2fs: move f2fs to use reader-unfair rwsems")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 fs/f2fs/f2fs.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c9515c3c54fd..47bf9e30913f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2115,9 +2115,17 @@ static inline void clear_ckpt_flags(struct f2fs_sb_info *sbi, unsigned int f)
 	spin_unlock_irqrestore(&sbi->cp_lock, flags);
 }
 
-static inline void init_f2fs_rwsem(struct f2fs_rwsem *sem)
+#define init_f2fs_rwsem(sem)					\
+do {								\
+	static struct lock_class_key __key;			\
+								\
+	__init_f2fs_rwsem((sem), #sem, &__key);			\
+} while (0)
+
+static inline void __init_f2fs_rwsem(struct f2fs_rwsem *sem,
+		const char *sem_name, struct lock_class_key *key)
 {
-	init_rwsem(&sem->internal_rwsem);
+	__init_rwsem(&sem->internal_rwsem, sem_name, key);
 	init_waitqueue_head(&sem->read_waiters);
 }
 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
