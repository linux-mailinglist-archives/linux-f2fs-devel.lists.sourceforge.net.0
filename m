Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E9481223134
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jul 2020 04:39:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VcHLDHVEU2ltCfOSo5gCyeL9naGcDf6YyGPzP/rVsWQ=; b=ED96ck1ufug/VurdAKbBGg0dA
	bc9Rnu3QSP0vAg2thhotQEvxh0kd3/AY8ACQoYc4tcxiYL2lAfrOTsKoo7dCCcOfXnlb5qy4xLLZa
	pSLxxTD+s5mmS7kfKq7zDQmuYLdgvfRs+2fabWh20JdyJNljJBq6mAzQtdFPLtxWoEYyE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jwGHt-0005lG-RT; Fri, 17 Jul 2020 02:39:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3aQARXwYKAKweMfkMfSaaSXQ.OaY@flex--satyat.bounces.google.com>)
 id 1jwGHs-0005l5-CP
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jul 2020 02:39:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zr1haxdG39xCeCSCxAtAF/uCJ0PriAfrFWPYdcjKJpg=; b=TxVpwUCYahI7oFmlr83lwbTs7
 eIq8BrjmsWcpQHgcnd2XfDBzwtZeNNyvXxVvjs1yRMC7dxHtaMGW0/EIHA+n4IZ7EsNmbWxsY6lfN
 2vXAiV+5arDNEkobfmNzagmpifh4XY/j2S6u84ppVmbM9Y8G3DRBuBGrxK6CyWl24Xoc4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zr1haxdG39xCeCSCxAtAF/uCJ0PriAfrFWPYdcjKJpg=; b=cgWqipLywP8G9W3ksfnWwlXmkg
 rR3YefOV33PkBQ03YDEH4DsmJY7pn0xPVM9SxBgpoY2Q7Do0uLONtcZexxwROZ/q8aSmz44E1u358
 2I9QFfH0mu1EY3bWToWIqaC+VBqXsKCyz9WGyvB7ZdWyVP0osU4lXYawEmUJ5uccKNhE=;
Received: from mail-pg1-f201.google.com ([209.85.215.201])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jwGHr-00BOpk-57
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jul 2020 02:39:48 +0000
Received: by mail-pg1-f201.google.com with SMTP id i1so6923765pgn.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 16 Jul 2020 19:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=zr1haxdG39xCeCSCxAtAF/uCJ0PriAfrFWPYdcjKJpg=;
 b=tlDHCdVZLG0m6L9levsiz5n7YIyjIML7yueebl4I+pd4oD2GbC2//CVbku08QwfyVK
 Io6VHBtaFJ92KS1ZOJeZ+gL4I3EE9eCj84H9hWFhQZqN8fQQ85l7TS5gW7erlfNnkmzA
 h57MTGXvkvtREa2Qo1rEyo9lXW31xuTk1ugMXZ6T1CiepMhKbsP1mrjdiKiW3/Rvmu6c
 SZPzhAwx7+ulPeallP3vNIjd8m2ACUMFu9PQZzGNoethIWi21ML/Bzl/g8EenyLMa7F8
 oq0OBvD9rkYG9V07cK0ln918JiY2QNGYAxh/nFT9nNV7Px5YVBoGsAhCgLPzOODa5J1Q
 a24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=zr1haxdG39xCeCSCxAtAF/uCJ0PriAfrFWPYdcjKJpg=;
 b=nyPW/mEyEbTskWgwKWOMvPheLF/bKQvay2Q/xuYGkTWS4ODC1AIkQIfdWx9ZzLHFxd
 erFzX5s3YaOeGjNDJQyxTt5aEo44uXHw63ljFjvom75J21gucxfv55DAKiUtlHIayXfb
 Yrbf/Cwje+Aw/OZx7HYsFZHnScz6VWREHRYgHxobKK+Qxnc4l+iM8Uf/6eCbHXDPKeXt
 +OY3KHyxvkZbhp4MzpZ/ikMG2Sa8Y0g2UqGki28+qc9mEbOWDy4UkrIvtSzDGRTVqzv0
 YPjaBvrsDOOWirDnu84h9bSdUyr8GzhlZB8fF29H33hrHhQ/Awq1pGFAVkFfydsGKl5z
 LOvw==
X-Gm-Message-State: AOAM531YvcwIfqdYm7O0cb/G6lfgg9/XyrvlZegJW8sG7Cnw/vJXn+Kf
 +3mKGBuU5QsehYbZTNN1HaJv3m3uLE4=
X-Google-Smtp-Source: ABdhPJzDMFCY+G8Oa8F4K0HKeSD+Xc66nsFn69r8yuQKIuJ5CCaPUQ42wZhUaa7Xlm1W8gsHMjhI0okL6Kg=
X-Received: by 2002:a17:902:b706:: with SMTP id
 d6mr5918685pls.266.1594949737873; 
 Thu, 16 Jul 2020 18:35:37 -0700 (PDT)
Date: Fri, 17 Jul 2020 01:35:18 +0000
In-Reply-To: <20200717013518.59219-1-satyat@google.com>
Message-Id: <20200717013518.59219-8-satyat@google.com>
Mime-Version: 1.0
References: <20200717013518.59219-1-satyat@google.com>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.201 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.201 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.8 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jwGHr-00BOpk-57
Subject: [f2fs-dev] [PATCH v2 7/7] fscrypt: update documentation for direct
 I/O support
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: linux-xfs@vger.kernel.org, Satya Tangirala <satyat@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Update fscrypt documentation to reflect the addition of direct I/O support
and document the necessary conditions for direct I/O on encrypted files.

Signed-off-by: Satya Tangirala <satyat@google.com>
---
 Documentation/filesystems/fscrypt.rst | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
index f3d87a1a0a7f..95c76a5f0567 100644
--- a/Documentation/filesystems/fscrypt.rst
+++ b/Documentation/filesystems/fscrypt.rst
@@ -1049,8 +1049,10 @@ astute users may notice some differences in behavior:
   may be used to overwrite the source files but isn't guaranteed to be
   effective on all filesystems and storage devices.
 
-- Direct I/O is not supported on encrypted files.  Attempts to use
-  direct I/O on such files will fall back to buffered I/O.
+- Direct I/O is supported on encrypted files only under some circumstances
+  (see `Direct I/O support`_ for details). When these circumstances are not
+  met, attempts to use direct I/O on such files will fall back to buffered
+  I/O.
 
 - The fallocate operations FALLOC_FL_COLLAPSE_RANGE and
   FALLOC_FL_INSERT_RANGE are not supported on encrypted files and will
@@ -1257,6 +1259,20 @@ without the key is subject to change in the future.  It is only meant
 as a way to temporarily present valid filenames so that commands like
 ``rm -r`` work as expected on encrypted directories.
 
+Direct I/O support
+------------------
+
+Direct I/O on encrypted files is supported through blk-crypto. In
+particular, this means the kernel must have CONFIG_BLK_INLINE_ENCRYPTION
+enabled, the filesystem must have had the 'inlinecrypt' mount option
+specified, and either hardware inline encryption must be present, or
+CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK must have been enabled. Further,
+any I/O must be aligned to the filesystem block size (*not* necessarily
+the same as the block device's block size) - in particular, any userspace
+buffer into which data is read/written from must also be aligned to the
+filesystem block size. If any of these conditions isn't met, attempts to do
+direct I/O on an encrypted file will fall back to buffered I/O.
+
 Tests
 =====
 
-- 
2.28.0.rc0.105.gf9edc3c819-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
