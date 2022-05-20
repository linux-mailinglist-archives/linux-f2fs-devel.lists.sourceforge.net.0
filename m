Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C96D52E113
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 May 2022 02:20:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nrqN3-00056D-03; Fri, 20 May 2022 00:19:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nrqN1-000564-Mq
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 May 2022 00:19:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BRUrK2Dts6zO2m3pyfnZ2UTjrMwO+C/CjIRCQNdkTXk=; b=VBmIn24OVW0KRPxp/2uU5FDjK8
 1aT2hBjGRl7obfkhjeY6b/tz59EOVCbva5AgSwbztdN3jO1ej5k7qVBLkC3Kq7/LoW2fHdunzZhX8
 ni/LOMJkyno5L+YDTYfiFzKSQJUVW0HGU950W+TIYwB/7GkM0pplEIOVWhB6W7j2qpho=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BRUrK2Dts6zO2m3pyfnZ2UTjrMwO+C/CjIRCQNdkTXk=; b=ACKL4T2SSNQtKW6O2jeQT2/Kz1
 PQZscdMCekMRaYrYzsOMquaE5RwewmnsCJjZ9sPLLxNCL5xpaiaUo8WlzD5hymd4xYaiLP/HwUSQ7
 wiswWszojoEU3g1aq1Zdit72//2jnV2BqCQsybHijTjsFCoUzrmm92X95N8nnpBCgieY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nrqMy-00B7Gx-0V
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 May 2022 00:19:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A213461A59
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 20 May 2022 00:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00FD8C34114
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 20 May 2022 00:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653005986;
 bh=Bkf8ogacLmaUaly4YE74FduqW4LLpgLZ9LvF2kleM6s=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=siUAh/xJKLR6YxlDea5CfPuaNtmprjAXq1+EYn+3WfsItlXzmJdPETqC2q+0hQ4Fl
 JgzXgst+H+lMGTnuxxS9EmTh1kMsNFMf3c4ZdFpmYV9on1X/CRsFX6wl8Kzk4aXBow
 49CaVV9vWlSPrQciHIBdXUyKD27/+QjEyKbk60NuNqEXOQ+mTZnX6X3hy3wM7NOamH
 4KzoVrG+XAnRES24RlGEQzngVNUMhcIZWodgTBtVJyVHK6g4Kj4wlWhr8BubM7mhma
 wMibtK2paY+VDTdF4n8dGzObulQKMUTpi9FZZ64cC6hQfOv11I8iLIVvqFtEcpPXPr
 IAeZ76dqQ3U4A==
Date: Thu, 19 May 2022 17:19:44 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Message-ID: <YobeoOh9F55TzqJb@google.com>
References: <20220519234605.633645-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220519234605.633645-1-jaegeuk@kernel.org>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: We need to get the definitions first. Signed-off-by: Jaegeuk
 Kim <jaegeuk@kernel.org> --- Change log from v1: - fix build problems 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nrqMy-00B7Gx-0V
Subject: Re: [f2fs-dev] [PATCH 1/2 v2] f2fs-tools: adjust config file first
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We need to get the definitions first.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

 Change log from v1:
  - fix build problems

 tools/f2fscrypt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/f2fscrypt.c b/tools/f2fscrypt.c
index 4c5d87036225..b406bcf56640 100644
--- a/tools/f2fscrypt.c
+++ b/tools/f2fscrypt.c
@@ -43,6 +43,9 @@
 #ifdef __KERNEL__
 #include <linux/fs.h>
 #endif
+
+#include <f2fs_fs.h>
+
 #ifdef HAVE_UUID_UUID_H
 #include <uuid/uuid.h>
 #else
@@ -55,7 +58,6 @@ typedef unsigned char uuid_t[16];
 #ifdef HAVE_SYS_KEY_H
 #include <sys/key.h>
 #endif
-#include <f2fs_fs.h>
 
 #define F2FS_MAX_KEY_SIZE		64
 #define F2FS_MAX_PASSPHRASE_SIZE	1024
-- 
2.36.1.124.g0e6072fb45-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
