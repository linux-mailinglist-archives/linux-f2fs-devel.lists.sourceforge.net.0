Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 020F2B0FF61
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Jul 2025 05:57:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B0JkCbq4i0lHNY41l2lARFj2JAz+5KoWwmIDVQji3FM=; b=Xzh55UfNqc/MgmkrBOe2TWGzYM
	0UMCvEKAlUxGAZAAG6bHLf/Ler9wVKqVtS2F9Jt8RV8KIFLnhALt9eEs6nix8D+K9o6cMY9w6sT6E
	cv35P4yGiIdhykXUsV7Chs5G+e7A1/tWz2laKrIQp4fGJpeMw8OqoB/dZysFHET/1GKk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uen57-0005Nc-KV;
	Thu, 24 Jul 2025 03:57:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uen56-0005NV-JA
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 03:57:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sJu3mneTVZVPFzyLci3a5WTKAPkHKp50x4azA1hxGjg=; b=hEuaxfvoIsz4bcA6oVnAJxrF6l
 9qPbT3K+hpJWluSwiJoee9OnsS2cbKGSlStaeiLcTC929h7Alk0sJtcmNOu4Okui5v48X8tObzFNk
 oTaasScNBJCXv3RMTmcK9EUi2HbmKN0pIFZ7RSPOEko22WF0VJSEOc0Vb665QaoeWOhI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=sJu3mneTVZVPFzyLci3a5WTKAPkHKp50x4azA1hxGjg=; b=U
 q4auCCmCWseaYv88TklyYPVOtMNorxLZgotvdkX44fiMbyl1ZTZnzthzV74qbZXFXr2NGmjuw8Yte
 a9T3esUpkiCiDGDr2My3d3Sj20o87UEN67/6oGjyvhsjOt9WVowxSIQ521OpFjHY/D1t7GXrF+7xl
 FQkZ/ZYWfOybObPM=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uen56-0000vW-6E for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 03:57:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 91742A55E20
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 24 Jul 2025 03:57:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00CEDC4CEED;
 Thu, 24 Jul 2025 03:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753329429;
 bh=t2ldsN+AXuYkhZn6OvI+WWmyQURbbcTGkyp5ojEQrbg=;
 h=From:To:Cc:Subject:Date:From;
 b=p6zOl9zIDpMzgvrE55a3SW1miCVqXx/xaimrk+NIgSzJnu0GftU2UNpcTAEIR5QSJ
 lrCzhAqOd/CgGApuv72lJjabd6EyRFWKf1hIau+Pabvx3jgyeoAPnJBZxvEDdf+L7g
 cEMsP+SW1cGtnTJVH7f30NLPxU4IHmA2oDvSbPtZrsqPa31ejdnSuMjSgCR9Y34mLn
 3iV4EmCXXHR18J9LFFsn4ToM/wFJ3jMUnVOe5tfbtnVjE/OC96/wKt7ZQo6Tn8eJVR
 yNhAwHaZGqWnDZZpZarIQ6zEF6ysdAbVjavSyRwH6bXXNYz9vn6+A95i5R6VjLLUY9
 VQU9hKaB6ZNrA==
To: jaegeuk@kernel.org
Date: Thu, 24 Jul 2025 11:56:54 +0800
Message-ID: <20250724035654.3578627-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  It provides a way to disable linear lookup fallback during
 mkfs. Usage: 1. Disable linear lookup: mkfs.f2fs -f -O casefold -C
 utf8:hashonly
 /dev/vdb dump.f2fs -d3 /dev/vdb |grep s_encoding_flags s_encoding_flags [0x
 2 : 2] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uen56-0000vW-6E
Subject: [f2fs-dev] [PATCH] mkfs.f2fs: support -C [no]hashonly to control
 linear lookup fallback
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

It provides a way to disable linear lookup fallback during mkfs.

Usage:

1. Disable linear lookup:
mkfs.f2fs -f -O casefold -C utf8:hashonly /dev/vdb
dump.f2fs -d3 /dev/vdb |grep s_encoding_flags
s_encoding_flags                        [0x       2 : 2]

2. Enable linear lookup:
mkfs.f2fs -f -O casefold -C utf8:nohashonly /dev/vdb
dump.f2fs -d3 /dev/vdb |grep s_encoding_flags
s_encoding_flags                        [0x       0 : 0]

mkfs.f2fs -f -O casefold -C utf8 /dev/vdb
dump.f2fs -d3 /dev/vdb |grep s_encoding_flags
s_encoding_flags                        [0x       0 : 0]

Signed-off-by: Chao Yu <chao@kernel.org>
---
 lib/libf2fs.c   | 1 +
 man/mkfs.f2fs.8 | 8 +++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index 2f012c8..0e3e62a 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -1424,6 +1424,7 @@ static const struct enc_flags {
 	char *param;
 } encoding_flags[] = {
 	{ F2FS_ENC_STRICT_MODE_FL, "strict" },
+	{ F2FS_ENC_NO_COMPAT_FALLBACK_FL, "hashonly"}
 };
 
 /* Return a positive number < 0xff indicating the encoding magic number
diff --git a/man/mkfs.f2fs.8 b/man/mkfs.f2fs.8
index 8b3b0cc..b57f033 100644
--- a/man/mkfs.f2fs.8
+++ b/man/mkfs.f2fs.8
@@ -232,10 +232,16 @@ Use UTF-8 for casefolding.
 .I flags:
 .RS 1.2i
 .TP 1.2i
-.B strict
+.B [no]strict
 This flag specifies that invalid strings should be rejected by the filesystem.
 Default is disabled.
 .RE
+.RS 1.2i
+.TP 1.2i
+.B [no]hashonly
+This flag specifies that there is no linear lookup fallback during lookup.
+By default, linear lookup fallback is enabled.
+.RE
 .RE
 .TP
 .BI \-q
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
