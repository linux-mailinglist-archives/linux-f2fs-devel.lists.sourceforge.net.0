Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFFE36AF5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Jun 2019 06:32:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hYk51-0003gX-0T; Thu, 06 Jun 2019 04:32:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <wangshilong1991@gmail.com>) id 1hYk4z-0003gK-QK
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 06 Jun 2019 04:32:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bsZifgz0SIlDcXcSo3Ws+LcOmMza89DsMDLo0jxX0mY=; b=iEg6R3MIvACGp9CNYnLjQMabMt
 aNzMBZJwWagopgjgOL4c583Gaq46tTcMNXmbyM8lJCEPMRtoRT5ZjrwywlI6xubPo3onRyoMPG+ii
 okoDNxbKIL0ltakf4DPuuofGZ5SNa66EpRrtkPUxFn4XrIPl7VTVkJUt0EF0r8SrjODA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bsZifgz0SIlDcXcSo3Ws+LcOmMza89DsMDLo0jxX0mY=; b=SFPAvAJNjPD5o28oPJDqjKawYa
 05e9dJqKvRIDUaR4i2KOwHR/2TVw9ULJLt35k+hGs4rYr9LHYo8c49pkVKkUoZ5mmkubYWPlMgcz8
 1X13MxdpuATivwpZMoNqGPXuOK/Jr6b+xvTzUDM+zI1sgn1mf6li7WiUfUVgMgBb2rD8=;
Received: from mail-pl1-f193.google.com ([209.85.214.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hYk4y-003TbL-Co
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 06 Jun 2019 04:32:45 +0000
Received: by mail-pl1-f193.google.com with SMTP id a93so385187pla.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 05 Jun 2019 21:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=bsZifgz0SIlDcXcSo3Ws+LcOmMza89DsMDLo0jxX0mY=;
 b=iqnSianw8jj6n3YvYj4BoeqYUzGQFttsmePpo2Xa7qRsjxDdHfwPayxO8qot8vHGtp
 ezAw7DHRwi8/wb7cVZowLav5POX7P5MuNWMUEn+HZ7qo9ROXOTxoshR0wHQVCF8DFDv7
 3jpd5FDPTBl+8r33hf6J6FPXrJXa3lK4r5eLYg1UbprusnFWdjGIzQogiKCBQY7efs32
 hbohwI8dCG0rYZmi8HZ1eBOSNJMbtdyh1PENUoaPM72IL3LRpzQtggZGnk6n4hmSaw3w
 +R+arcscxzXomdhqFYnbZoLuaz2ALLIOGAJzzG/Es9jPdcuMJpn5fcFQN72C166zCFDB
 1Gig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=bsZifgz0SIlDcXcSo3Ws+LcOmMza89DsMDLo0jxX0mY=;
 b=o+y9BZVzGgnmcxhclj+TgO8EdSUuMfs11Ptz/0O0C+EaoEGWIvFumAZtNe5uH6d2wu
 YzLjANPiaPTc6uu+RV9WVmMKDWWx0+gVXRS4bXYVSnnqHYmDrmnAbLM8ySrVperkAj1T
 Fq9b4Mr15RBIERhRc1HbSCAnywHhJcjQGodIbHFRuHduZJWHfBqrr7ViQubdWXq1rYeg
 NPDZdc6W7dXdh9DnQdeVbcSipMd2ZMTkqBaHHdjr0O1NZYQPl9Fi3fGxnZ+GB93gkGbv
 GMxzIOCldpQZAp3cuq7UwOFeGrCL/T1zMlusVItHUHYQiqtAkNYXiuvIrbYa90Q5+UcR
 3KQw==
X-Gm-Message-State: APjAAAWRbQa9kNNssfDvz7FvxTrQVZ9V/yfqFhJeziRGu1HBb/CSKlwa
 e4dlDTd75SsMjgDiySe6BpuqZ4u1
X-Google-Smtp-Source: APXvYqz8ZG4YsAqNUtDCsSY7OsdffZpO/uBq/9ITkVOMlwJV6SfZjN1yRmvoV+hHdsDXjpOSMbinPg==
X-Received: by 2002:a17:902:7e0f:: with SMTP id
 b15mr40026886plm.237.1559795558655; 
 Wed, 05 Jun 2019 21:32:38 -0700 (PDT)
Received: from localhost.localdomain (fs276ec80e.tkyc203.ap.nuro.jp.
 [39.110.200.14])
 by smtp.gmail.com with ESMTPSA id f17sm445069pgv.16.2019.06.05.21.32.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Jun 2019 21:32:37 -0700 (PDT)
From: Wang Shilong <wangshilong1991@gmail.com>
X-Google-Original-From: Wang Shilong <wshilong1991@gmail.com>
To: linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  6 Jun 2019 13:32:24 +0900
Message-Id: <1559795545-17290-1-git-send-email-wshilong1991@gmail.com>
X-Mailer: git-send-email 1.7.1
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.193 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (wangshilong1991[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (wangshilong1991[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1hYk4y-003TbL-Co
Subject: [f2fs-dev] [PATCH 1/2] ext4: only set project inherit bit for
 directory
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
Cc: Andreas Dilger <adilger@dilger.ca>, Wang Shilong <wshilong@ddn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Wang Shilong <wshilong@ddn.com>

It doesn't make any sense to have project inherit bits
for regular files, even though this won't cause any
problem, but it is better fix this.

Cc: Andreas Dilger <adilger@dilger.ca>
Signed-off-by: Wang Shilong <wshilong@ddn.com>
---
 fs/ext4/ext4.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 1cb67859e051..ceb74093e138 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -421,7 +421,8 @@ struct flex_groups {
 			   EXT4_PROJINHERIT_FL | EXT4_CASEFOLD_FL)
 
 /* Flags that are appropriate for regular files (all but dir-specific ones). */
-#define EXT4_REG_FLMASK (~(EXT4_DIRSYNC_FL | EXT4_TOPDIR_FL | EXT4_CASEFOLD_FL))
+#define EXT4_REG_FLMASK (~(EXT4_DIRSYNC_FL | EXT4_TOPDIR_FL | EXT4_CASEFOLD_FL |\
+			   EXT4_PROJINHERIT_FL))
 
 /* Flags that are appropriate for non-directories/regular files. */
 #define EXT4_OTHER_FLMASK (EXT4_NODUMP_FL | EXT4_NOATIME_FL)
-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
