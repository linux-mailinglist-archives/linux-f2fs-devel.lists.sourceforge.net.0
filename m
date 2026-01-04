Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FE5CF0835
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 04 Jan 2026 03:08:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YahvhqAiylEHhZoKAu0q6T1ruIo7k5O1qYtDXGMxlEg=; b=KZDV9OymWh+mQX6GjofFgRJzi+
	EOrnDMngA8ypTJDg3qWUs7sC+ub4TC0fRyX2DcxybsPQXtsxkGmIQlVvmY4gYr+mgh+m8tf/Pqamu
	wY75m7SsRq78hJuluj/GNhsKOuXm7BnE32yD2/izTKr4+FVueGCfDjOq7LvkTG8XQJ/c=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vcDXi-0006zM-DZ;
	Sun, 04 Jan 2026 02:08:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vcDXf-0006yq-F6
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jan 2026 02:08:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KqyEu8b3A+8/2SPphiNTbPcWDXyNyveuUIVDV2NrnCU=; b=daXYWK3D5rpKPflkd7vAw2C97s
 vYGHQiAgOm5irC04emyiwmjqiArxakm5S1x4C3bQkMCiZnFymV7KTQFUM7/2RQuT6ZnTxJFBIMSW2
 vmpKywjAM4XSAQHJZUL/9FZm+pv4bCkeIXTPLgTFD+uy0zWDb9KC7uUcvHuAncNDdjEY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KqyEu8b3A+8/2SPphiNTbPcWDXyNyveuUIVDV2NrnCU=; b=A3d9PSRYj857CcD44U+CEnhurP
 WcVF7do34D+NMyhPoCvEGnk0OOXiU1dImvxKMD9NcYJEvafyJa6/VxVqf4IAZ3M2r6m1JGedv27oK
 dtSAcPY9crccq88rwsfkzgtE3Yz8/7GWNg/ZnjPnwqqn9+u5xVbaNqHLHr3bkl59vizA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vcDXf-0005oG-Tb for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jan 2026 02:08:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9FEF44434E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun,  4 Jan 2026 02:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72F0BC19424;
 Sun,  4 Jan 2026 02:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767492497;
 bh=AcjjjCa7WZR0K1hb1WnjFbGchQTxn9lSBGZoMtQIOOE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FY6QAkVYrJ8WKUiO1Kr0uO2D3wHSGlNQX3WPXhYqSxQOVecn/uL0YvcHLRRhYKafl
 rB4iFp+vITehHQgYkilR8MA8rhNC9TbHAYkIFjRwebwGIO/OaKjKcUVOVzwurzFiZ+
 YPs5NWhzdfvzdOcTGPNb1moS94Lmkg9km/2Kw1iPLIDPlY78cnbwNI1PPPl1YlRwRO
 222EcgsZ36EIFmwoz/EkdrernyX0DCS6zGI/fXjRBkX1KPt1PcNAC4dogrSOk6oGNP
 C5nLU1VKKkJBpFzDiPSPKtZA1VjgrLGYXtUoBdFkRORh42iQPbe5moIApuY1lNUVWN
 BrGMhSd6fRSBw==
To: jaegeuk@kernel.org
Date: Sun,  4 Jan 2026 10:07:25 +0800
Message-ID: <20260104020729.1064529-10-chao@kernel.org>
X-Mailer: git-send-email 2.52.0.358.g0dd7633a29-goog
In-Reply-To: <20260104020729.1064529-1-chao@kernel.org>
References: <20260104020729.1064529-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Due to timeout parameter in {io,
 }_schedule_timeout() is based
 on jiffies unit precision. It will lose precision when using
 msecs_to_jiffies(x)
 for conversion. Signed-off-by: Chao Yu <chao@kernel.org> --- fs/f2fs/f2fs.h
 | 4 ++-- 1 file changed, 2 insertions(+), 2 deletions(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vcDXf-0005oG-Tb
Subject: [f2fs-dev] [PATCH 10/14] f2fs: fix to use jiffies based precision
 for DEFAULT_SCHEDULE_TIMEOUT
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Due to timeout parameter in {io,}_schedule_timeout() is based on jiffies
unit precision. It will lose precision when using msecs_to_jiffies(x)
for conversion.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index cb9e94904c6b..c4d3b37821d6 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -681,8 +681,8 @@ enum {
 
 #define DEFAULT_RETRY_IO_COUNT	8	/* maximum retry read IO or flush count */
 
-/* IO/non-IO congestion wait timeout value, default: 1ms */
-#define	DEFAULT_SCHEDULE_TIMEOUT	(msecs_to_jiffies(1))
+/* IO/non-IO congestion wait timeout value, default: 1 jiffies */
+#define	DEFAULT_SCHEDULE_TIMEOUT	1
 
 /* timeout value injected, default: 1000ms */
 #define DEFAULT_FAULT_TIMEOUT	(msecs_to_jiffies(1000))
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
