Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6C950AB52
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Apr 2022 00:19:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhf8k-0007vy-Ki; Thu, 21 Apr 2022 22:19:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1nhf8j-0007vk-Cc
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nNzNNuzz8zM+CzjZ3joCCm7L7ib0lPqJUU4RRnwL/oY=; b=UwkiOjpIIoVIjN5dwih8XahlSV
 Fuf5IomuL5oVvQg/vrJP0hyLT18vIgNBpWLZT3itZ7oWEpuJ3GCbXBljB690nAMr9EQGNdZ/iqkii
 zdMFJy5m4+ENEVxSwxfmvCR1RLEEDNCMBdTrYDEfTUqVcOilSZ5R1ZUTthvRdzSmT4oo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nNzNNuzz8zM+CzjZ3joCCm7L7ib0lPqJUU4RRnwL/oY=; b=UaS19QUeilYEwN8l/nMZU+OJMm
 5Y77+yjHz/vfb7DeTZDdWmP/FJb+s1Pwt1/iL/+bF/30ZLvpL3fDSE/D9mtFPH8iPXNvAIdtzY864
 Gs1/WtvFM6KtXURjjHKsg8SH9Zh5GmFbkOqDIk6nyxxavGFdMMFsRYG7M9WmkzSctvOk=;
Received: from mail-pl1-f170.google.com ([209.85.214.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nhf8e-0002u7-5H
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:03 +0000
Received: by mail-pl1-f170.google.com with SMTP id u15so3381749ple.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Apr 2022 15:19:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nNzNNuzz8zM+CzjZ3joCCm7L7ib0lPqJUU4RRnwL/oY=;
 b=u+kCn5zchBbnTO1xdvD2ZHgZ/huGW+9GTiaUiShiQbYWFjRw8kNxGyQz70paok3pqe
 HMJaNOFFEzBKBt2y9bhH2q3bkC9OeBvYE9McmhaR60uYx2vxxgQZBSA9C0Kn8mPSg+ES
 20QTy2mSMtEx7bT7XNkKC0G8h5igbnF5Csm2sZSIoJhngfGjLahiFKEemxNaAFyZJckK
 2/hiC2XBcb1Z7PVzdyOjeBPVzWjm1OO5U4mDf9PCXqTuk+xrpj5312+i4v+6anj9nMh3
 BsRRsR/sbXJ7Q5F4nl81tdFVVpIAsbVybDMBd8ShBBSVo9C6aU4aUyYK1+dlyQxJbSVl
 H0eg==
X-Gm-Message-State: AOAM530A0qqtxUHL63QOwBiO2O9ogDyigA2WuKcgVXBnu6pqqiFNl8gU
 zZr4RBfFA1yPjWcz0INoBXE=
X-Google-Smtp-Source: ABdhPJzDfgn2RVdzzjEPQwTG79POkYV4lKCzhJ8Zp9h+5hCHSJX0Q5QqfA5/iPdFIUPKAaqCDY0llw==
X-Received: by 2002:a17:90b:3ec2:b0:1d2:a9a1:b2f1 with SMTP id
 rm2-20020a17090b3ec200b001d2a9a1b2f1mr12660636pjb.145.1650579534544; 
 Thu, 21 Apr 2022 15:18:54 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:a034:31d8:ca4e:1f35])
 by smtp.gmail.com with ESMTPSA id
 hi21-20020a17090b30d500b001cd4989ff4csm3794876pjb.19.2022.04.21.15.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 15:18:53 -0700 (PDT)
From: Bart Van Assche <bvanassche@acm.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 21 Apr 2022 15:18:09 -0700
Message-Id: <20220421221836.3935616-5-bvanassche@acm.org>
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
 Content preview: Signed-off-by: Bart Van Assche <bvanassche@acm.org> ---
 configure.ac | 4 ++-- 1 file changed, 2 insertions(+),
 2 deletions(-) diff --git a/configure.ac
 b/configure.ac index b40012bd8745..0d7872abde19 100644 --- a/configure.ac
 +++ b/configure.ac @@ -100, 13 +100,
 13 @@ AC_CHECK_HEADERS(m4_flatten([ fcntl.h
 linux/blkzoned.h linu [...] 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.170 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.170 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1nhf8e-0002u7-5H
Subject: [f2fs-dev] [PATCH 04/31] configure.ac: Sort header file names
 alphabetically
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

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 configure.ac | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure.ac b/configure.ac
index b40012bd8745..0d7872abde19 100644
--- a/configure.ac
+++ b/configure.ac
@@ -100,13 +100,13 @@ AC_CHECK_HEADERS(m4_flatten([
 	fcntl.h
 	linux/blkzoned.h
 	linux/falloc.h
+	linux/fiemap.h
 	linux/fs.h
 	linux/hdreg.h
 	linux/limits.h
 	linux/posix_acl.h
 	linux/types.h
 	linux/xattr.h
-	linux/fiemap.h
 	mach/mach_time.h
 	mntent.h
 	scsi/sg.h
@@ -114,8 +114,8 @@ AC_CHECK_HEADERS(m4_flatten([
 	string.h
 	sys/acl.h
 	sys/ioctl.h
-	sys/syscall.h
 	sys/mount.h
+	sys/syscall.h
 	sys/sysmacros.h
 	sys/utsname.h
 	sys/xattr.h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
