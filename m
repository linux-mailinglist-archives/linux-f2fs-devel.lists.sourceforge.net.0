Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 731FA36AF6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Jun 2019 06:32:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hYk52-00030Z-W2; Thu, 06 Jun 2019 04:32:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <wangshilong1991@gmail.com>) id 1hYk51-00030C-Tl
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 06 Jun 2019 04:32:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6VGeFWDwZ/nZmDtAUAKo1D8i/FDQgyo2Ba2O/wBzjF8=; b=lgGIuTclmORipu/aOBVHc1lc1u
 BOZw29+plwfKKpRXh6oD/qUvo6K4OwCyIJPNrW7JXEs7d30qvsMM+fUCagMmsvqnKNeUczMSmAwpy
 Fb5ONMg4NUAc6fP4Nnz9RI3w1mJw5rfTwLkmvPIPfWHsL9f9e0bb8SjVSYGT8/b/wsmQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6VGeFWDwZ/nZmDtAUAKo1D8i/FDQgyo2Ba2O/wBzjF8=; b=S/WRJKzXpcHkp/TGXxs6CP4OTu
 ZNNOnYuCauoIr6qngsbCR04/rdS8DFDOJsqGJNaEmLqfsCwwTOMthXk84xOFPmhbn3ZQ8kkBMg8/T
 ui7SK5cQIdh3jUZEyJMeGTcHBMwnEao6zPO3u2ishrprarpYSLGySPdWNrrnG/HP53zI=;
Received: from mail-pl1-f196.google.com ([209.85.214.196])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hYk50-00Bgwh-EI
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 06 Jun 2019 04:32:47 +0000
Received: by mail-pl1-f196.google.com with SMTP id p1so397254plo.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 05 Jun 2019 21:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6VGeFWDwZ/nZmDtAUAKo1D8i/FDQgyo2Ba2O/wBzjF8=;
 b=XIqpRJ38g3lY6ATanmo95XAYJKxovAq5CH66gOtB0rYT0U7z6KgGh/38sTqKpnU/Bp
 4uoxHUyJqBlIaYlW8R7TJBqBaPS7qch47kqasFqQPwe/oIgpivoqjjUUkhcvflWAbgxB
 IMHLQjyki/MCwv1iLZQlTcmozof8oH+w1I0GaE3ZCzibbZaPxkN4b3zTeB1GPExfzVch
 730LDgaMIqQ1bYCL+xIp4mARX9FpaavGiwKiQsASB1fcQ6CGvcAiTcoglvOMz+gxHoIT
 z0GpNxVZM70zLZeRdzGxRUm1g57HSSAewXp/3y2MA4CBvfcrVrIx6f41W2jqO14dtw4Q
 DMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6VGeFWDwZ/nZmDtAUAKo1D8i/FDQgyo2Ba2O/wBzjF8=;
 b=q8KBsxzwhIarSU/9zKYf81wR0qz9DYox37O+6+VgYfFDcMGeoaP26J4n1ipfajRL3E
 8VCn1mTVCKwTkGr45seWc4oh/TwzL4CzEW0Np+uNdUsBltaL87MRqrvpCLyWmo4aXm/Y
 Tg5dIsw0QooobbtXzGCiajnKLDZXwkaJ+bQ/FvjEUlRK2mMJkrhgJkzVQPmt2vN3MW1c
 b8zhknUygO8GPLd3bda72x8MqFRcFcFXkl0Zxepz/EkVmF9DJgyrmGqmAvT340oTZU3P
 A8vO6N8VEofeOkk/AIL/NtxwCswx1ILTDSmrK8OjwmXgBQeOEsf9Cp6U43H9dBaqzJ3n
 fxSA==
X-Gm-Message-State: APjAAAXlM+TyY+T+UtTbiS2E3AySQfnz0erPTc4Hk+7/rOF25ioB2m+D
 oZJpch3/pPoyva1xBU2hz4wIjCcx
X-Google-Smtp-Source: APXvYqxbVFMLvRzVYn5guvYTtAttm+xzbz12k64+4uGw3RSkgkrdcX5j8BI+r7Xdkpc/xIqkAuegLA==
X-Received: by 2002:a17:902:7891:: with SMTP id
 q17mr49226674pll.236.1559795560603; 
 Wed, 05 Jun 2019 21:32:40 -0700 (PDT)
Received: from localhost.localdomain (fs276ec80e.tkyc203.ap.nuro.jp.
 [39.110.200.14])
 by smtp.gmail.com with ESMTPSA id f17sm445069pgv.16.2019.06.05.21.32.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Jun 2019 21:32:39 -0700 (PDT)
From: Wang Shilong <wangshilong1991@gmail.com>
X-Google-Original-From: Wang Shilong <wshilong1991@gmail.com>
To: linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  6 Jun 2019 13:32:25 +0900
Message-Id: <1559795545-17290-2-git-send-email-wshilong1991@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1559795545-17290-1-git-send-email-wshilong1991@gmail.com>
References: <1559795545-17290-1-git-send-email-wshilong1991@gmail.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.196 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (wangshilong1991[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.196 listed in wl.mailspike.net]
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
X-Headers-End: 1hYk50-00Bgwh-EI
Subject: [f2fs-dev] [PATCH 2/2] f2fs: only set project inherit bit for
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
 fs/f2fs/f2fs.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 06b89a9862ab..f02ebecb68ea 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2370,7 +2370,8 @@ static inline void f2fs_change_bit(unsigned int nr, char *addr)
 			   F2FS_PROJINHERIT_FL)
 
 /* Flags that are appropriate for regular files (all but dir-specific ones). */
-#define F2FS_REG_FLMASK		(~(F2FS_DIRSYNC_FL | F2FS_TOPDIR_FL))
+#define F2FS_REG_FLMASK 	(~(F2FS_DIRSYNC_FL | F2FS_TOPDIR_FL |\
+				   F2FS_PROJINHERIT_FL))
 
 /* Flags that are appropriate for non-directories/regular files. */
 #define F2FS_OTHER_FLMASK	(F2FS_NODUMP_FL | F2FS_NOATIME_FL)
-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
