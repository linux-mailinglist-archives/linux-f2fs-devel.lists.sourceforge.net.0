Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 048B057F5F2
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 24 Jul 2022 18:04:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oFe5s-0001o1-Ss; Sun, 24 Jul 2022 16:04:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1oFe5r-0001nm-MZ
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 24 Jul 2022 16:04:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9U+n44e02pYs8DNSCr9s3QY7VzCyPSDj6GCoILqN+XI=; b=mKlUyeRtk3+Re+kd+YKcY3Fxk3
 LokO/6aNXPcndlgru36IZXhKSZAEqFvSk+qMsu49APe174zfxa4prO9PEVtklLxkMYKWD0Ap+yocb
 hf+kz5MUhuPSwiZkSqiypkWsMRBLwl4+e5gmBX4ASpQjyRGIxxcVZfXKkzhGrvZnn8kI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9U+n44e02pYs8DNSCr9s3QY7VzCyPSDj6GCoILqN+XI=; b=Q
 I9xTQ8fqW37CCC0whmBhVFW4SXborjTMSN0pEwnE7zjvuVgPLYHd91YL80WFCDJ5wPsi/hd7H+9dP
 CO97byVKmB929waQg7/p+to1gnhQjbfkzBJx9iSxWfuHydPPsrx8gziEPloTriKtGdox9NWRVN/X2
 QFP7E2qRgH+N1Ojw=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oFe5p-0091yG-VX
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 24 Jul 2022 16:04:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D9592B80D8A;
 Sun, 24 Jul 2022 16:04:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF35DC3411E;
 Sun, 24 Jul 2022 16:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658678661;
 bh=i8cM2SroiJ19CwKcvmUaKxaxxsAJ7vlEHa3KqITk9s4=;
 h=From:To:Cc:Subject:Date:From;
 b=QAsFZt68qcZrIdLOwQDw0hD0fG8hRZa2RMeHUpN85+OvpHrPeTkxpZxBwQGWGRgXG
 sQWL4Qb4UPkvF/ielk0jyov+RaiSn58yqJnbdYF9BGyFsLtGe+IxgFDwZPgTYi16E/
 zXelreInSmuKoAQGV6/fMitUwNI826dl9t13jR9LGnnHeg7R4WIx2+ZsVLrdWl+NXo
 Dw6W5Y0xg3JMejRnbPl5QANBfAvh2eWeEPugcV0D91w8rU89KQLfUpPGeHELRdQedQ
 9wChLMeN7tryeu7hgsPHfsWbM4wTfCxanbLB44BGNg9GyX5NEZ9Edp2R6b0Zjg2P5M
 iw8DMJo12BqFw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 25 Jul 2022 00:04:17 +0800
Message-Id: <20220724160417.18488-1-chao@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Chao Yu <chao.yu@oppo.com> After commit a7eeb823854c
 ("f2fs: use bitmap in discard_entry"), MAX_DISCARD_BLOCKS became obsolete,
 remove it. Signed-off-by: Chao Yu <chao.yu@oppo.com> --- fs/f2fs/f2fs.h |
 1 - 1 file changed, 1 deletion(-) 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oFe5p-0091yG-VX
Subject: [f2fs-dev] [PATCH] f2fs: obsolete unused MAX_DISCARD_BLOCKS
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <chao.yu@oppo.com>

After commit a7eeb823854c ("f2fs: use bitmap in discard_entry"),
MAX_DISCARD_BLOCKS became obsolete, remove it.

Signed-off-by: Chao Yu <chao.yu@oppo.com>
---
 fs/f2fs/f2fs.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 3f669f851240..51b8cb5b29ba 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -230,7 +230,6 @@ enum {
 #define CP_PAUSE	0x00000040
 #define CP_RESIZE 	0x00000080
 
-#define MAX_DISCARD_BLOCKS(sbi)		BLKS_PER_SEC(sbi)
 #define DEF_MAX_DISCARD_REQUEST		8	/* issue 8 discards per round */
 #define DEF_MIN_DISCARD_ISSUE_TIME	50	/* 50 ms, if exists */
 #define DEF_MID_DISCARD_ISSUE_TIME	500	/* 500 ms, if device busy */
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
