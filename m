Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C71CB77DB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Dec 2025 01:56:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6piw7K54+H9heEPVBWp6RaS6n0Ia7pqqQZr7W4Ix9y8=; b=TK8PNbH1oHCUApy2wMzNaLgre5
	MD/fq8mw5sOhRj7Pc+QNaJxDR6oDHP/LwHhaCLmZipYyiF4hZk9aZvtYb0ENjJEcIcKfAXtoWwt/7
	0r/WF1Ai2OBtMELo6NJO0tSSlM0no+Bc4b8KfrPudMxLIm+vGfRFf4qXNBDctzZOIxj0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vTrRr-0008CE-Eo;
	Fri, 12 Dec 2025 00:55:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vTrRq-0008C1-Ar
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Dec 2025 00:55:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m7K6wCf3C9XdOSlTYiOKm6EMVsQPvxMsio8Khc8XZAs=; b=Pw1/NDM06KCJZyODcNpG+fQ1++
 Wf8X9nalKg+hjxtqfQnQKK+r8hXURfrJdlj+3PTJtwFiqpQc8MMGBoCElXKaXHbjtWgAr1xxG7p3M
 SZa6hhdze1qQp6OauHBpnh0L+fq1MkwfUEIjjJGDDVOWJz1WAauIOvOeLE2SR6XFWrF0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m7K6wCf3C9XdOSlTYiOKm6EMVsQPvxMsio8Khc8XZAs=; b=cTquYMdpLhrQVlRA42Zm9QeiVn
 Npz0Fa43hgka27u8n1Rl3qL9Co9W2zwud1+eI08Vwrk6CC8BXm3gg3k/BXLLts4aQb/PL4XVIptev
 uH47hAcS2YcQ2CWNqgGnoVmh82wpBurq0XfRd4v4W/tHBVSwa7r0Jc3b3mQbFiSZFLPQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vTrRp-0006iu-Qi for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Dec 2025 00:55:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7710B43B8D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 12 Dec 2025 00:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46BE5C113D0;
 Fri, 12 Dec 2025 00:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765500948;
 bh=yuPQYCGW5ybMBdSkpQ+PdQYWjY2OCBA/QlRQ8ykf30A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gXYT//kVvzrFHz0/aICDu79E3ozfKBGYopMZmTdripMd2NaeGbsJ2BeS6bUPQRTCM
 RCL8JsH/MoAPqWdlpVZilo4siWgzFCeUScuyv8H3vQizmqCopvaS68ici4yhNv+3xb
 NFknqArO1TtMnEX27NUHSLflAjgEYqBOdR2J2/lA2P+KtmUgRPhfCPu2/DjM4HMUKm
 v7DkBXCEBE8/wW6/35YpoEblrfEip98xcaob66uHPEFGnIgcSyyPOaaJ6UhswY5ejO
 CMgGmZoMm6SHZajbaV1d2TYgWy953LXMQkpU3zs3jh/AjrgwOYA4rV+o8lrlHvDzX8
 3Zg92anReCFaw==
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 12 Dec 2025 00:55:45 +0000
Message-ID: <20251212005545.3912333-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.52.0.305.g3fc767764a-goog
In-Reply-To: <20251212005545.3912333-1-jaegeuk@kernel.org>
References: <20251212005545.3912333-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> ---
 tools/f2fs_io/f2fs_io.c
 | 8 ++++---- 1 file changed, 4 insertions(+),
 4 deletions(-) diff --git a/tools/f2fs_io/f2fs_io.c
 b/tools/f2fs_io/f2fs_io.c index 08f3c9b79cdf..390c9df26aff 100644 ---
 a/tools/f2fs_io/f2fs_io.c
 +++ b/tools/f2fs_io/f2fs_io.c @@ -937,10 +937,10 @@ static void do_ [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vTrRp-0006iu-Qi
Subject: [f2fs-dev] [PATCH 2/2] f2fs_io: add more description in read test
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 tools/f2fs_io/f2fs_io.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 08f3c9b79cdf..390c9df26aff 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -937,10 +937,10 @@ static void do_write_advice(int argc, char **argv, const struct cmd_desc *cmd)
 "  buffered : buffered IO\n"				\
 "  dontcache: buffered IO + dontcache\n"		\
 "  dio      : direct IO\n"				\
-"  mmap     : mmap IO\n"				\
-"  mlock    : mmap + mlock\n"				\
-"  madvise  : mmap + mlock2 + madvise\n"		\
-"  fadvise  : mmap + fadvise + mlock\n"			\
+"  mmap     : mmap(MAP_POPULATE) + mlock()\n"		\
+"  mlock    : mmap() + mlock()\n"			\
+"  madvise  : mmap() + mlock2(MLOCK_ONFAULT) + madvise(MADV_POPULATE_READ)\n"		\
+"  fadvise  : mmap() + fadvise(POSIX_FADV_WILLNEED) + mlock()\n"			\
 "advice can be\n"					\
 " 1 : set sequential|willneed\n"			\
 " 0 : none\n"						\
-- 
2.52.0.305.g3fc767764a-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
