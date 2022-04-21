Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C211650AB62
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Apr 2022 00:19:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhf97-00083S-6U; Thu, 21 Apr 2022 22:19:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1nhf94-00082F-GX
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VcVU5OL6NZizcD4YOpc+OljkAXpMgyXT4BTpIaGZ9BE=; b=EPvSxuYyWNrpOOtDF5fhAu3dTy
 s8qSzsbHf2aHB1NscfP3QixkGwRmS744ERxCJxynpYLlyT5GZ+ShEZZkRr7UH7n7+HFlJ9gvU2+iw
 B2I4E2dq+IL6BPEhuiSr+rVO3SsONUYyGvlzO2Ks1t4FNYxoMWSzKtAjMFtN1uU3pe4Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VcVU5OL6NZizcD4YOpc+OljkAXpMgyXT4BTpIaGZ9BE=; b=fDGdPqnv3edz1VfuerxjMmGoMV
 Skm2icn9B7YKKJjknVRWV5DJ5TuAOKMI80fYiViRS/5Qidu8bCf7PLrmDveLP3ud6n6fb3i1J6itN
 JqMoJOzD6dRJgwotQEaxpR2dm3NVODX8CCEOqWsTD8osqAoJRiWOqjgY/iQ2brAVxbH4=;
Received: from mail-pl1-f180.google.com ([209.85.214.180])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nhf92-005sRV-Ve
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:25 +0000
Received: by mail-pl1-f180.google.com with SMTP id n18so6776677plg.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Apr 2022 15:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VcVU5OL6NZizcD4YOpc+OljkAXpMgyXT4BTpIaGZ9BE=;
 b=kmZQWG3eI/JGfYY6J08Q6IHctl1TnZwyhoxmZjeKFjETM6zI320JavdH3DZYwSr6YK
 +zGHLAnd5Ht5jc0kwwN/r+qjTD91CFIORG7SvvYPwYZOy52zna7YLz3njnWydGSUM3Pa
 eiF5839srHWLZ6ym1VVJ01QmmbgxJkfZ9sQvXrDftgaOuEoNMwiUQGn7Hyq/3x9cNT2j
 yRmFLcCHIZsrMetiuOReteLz19lg1owxw+D5FZ1/sWXjRWKTfBsygooPGjBWd4t4pKYh
 PB1jMP8tV04n9mZ2gwxFuq2BdiKEK5k5b90DewPvqPtAPEs5x6NwjwoX7z2rSHbfBUJh
 2XnQ==
X-Gm-Message-State: AOAM532gs7ix9vXAWX83EMaa1t5M6tYLx05d9HJh7irvxBBsmyekcYGC
 bAbIVtLfRrhQfr2/WSQCRh+MULV9khIzjQ==
X-Google-Smtp-Source: ABdhPJwDKJlWzQwEUjfSmTuBpduWrBaqu4KJQt/kgbHcnTyFF0GEAhLHH0bz6rVL8g4AmArjqF1tPQ==
X-Received: by 2002:a17:90a:d0c1:b0:1d2:c00a:8656 with SMTP id
 y1-20020a17090ad0c100b001d2c00a8656mr1875234pjw.235.1650579559402; 
 Thu, 21 Apr 2022 15:19:19 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:a034:31d8:ca4e:1f35])
 by smtp.gmail.com with ESMTPSA id
 hi21-20020a17090b30d500b001cd4989ff4csm3794876pjb.19.2022.04.21.15.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 15:19:18 -0700 (PDT)
From: Bart Van Assche <bvanassche@acm.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 21 Apr 2022 15:18:25 -0700
Message-Id: <20220421221836.3935616-21-bvanassche@acm.org>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
In-Reply-To: <20220421221836.3935616-1-bvanassche@acm.org>
References: <20220421221836.3935616-1-bvanassche@acm.org>
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Suppress the following compiler warning:
 f2fs_format.c:1653:37:
 warning: adding 'int' to a string does not append to the string
 [-Wstring-plus-int]
 memcpy(dent_blk->filename[3], LPF + F2FS_SLOT_LEN,
 ~~~~^~~~~~~~~~~~~~~ f2fs_format.c:1653:37: [...] 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.180 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.180 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1nhf92-005sRV-Ve
Subject: [f2fs-dev] [PATCH 20/31] mkfs/f2fs_format.c: Suppress a compiler
 warning
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

Suppress the following compiler warning:

f2fs_format.c:1653:37: warning: adding 'int' to a string does not append to the
      string [-Wstring-plus-int]
                memcpy(dent_blk->filename[3], LPF + F2FS_SLOT_LEN,
                                              ~~~~^~~~~~~~~~~~~~~
f2fs_format.c:1653:37: note: use array indexing to silence this warning
                memcpy(dent_blk->filename[3], LPF + F2FS_SLOT_LEN,
                                                  ^
                                              &   [              ]

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 mkfs/f2fs_format.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 173f619585f3..6f2761cfdb75 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -1650,7 +1650,7 @@ static int f2fs_add_default_dentry_root(void)
 		dent_blk->dentry[2].file_type = F2FS_FT_DIR;
 		memcpy(dent_blk->filename[2], LPF, F2FS_SLOT_LEN);
 
-		memcpy(dent_blk->filename[3], LPF + F2FS_SLOT_LEN,
+		memcpy(dent_blk->filename[3], &LPF[F2FS_SLOT_LEN],
 				len - F2FS_SLOT_LEN);
 
 		test_and_set_bit_le(2, dent_blk->dentry_bitmap);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
