Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ACCB1C3D4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Aug 2025 11:54:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8/G6gy9L4nBlhFjY2RbZsSHi358r+JAa+myV+z/N4Cw=; b=TnAGtRnLvE1Voymm3kvKHicC3P
	wG8P/DKnspImLQJB688P3jodbSXN6GarvR1p81V457ntJBfVpH5f73gSxP2Fmk2VBNKsN6vCp0o+J
	BPzpE0G6r2pVsFHwj4kLfO4HA2V6xn6ht0oqa6HO2cIbHLq9bmTDEmAzM+Pp1zWNqG7M=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ujaqj-0001dY-23;
	Wed, 06 Aug 2025 09:54:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dungeonlords789@naver.com>) id 1ujaqh-0001dN-2j
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Aug 2025 09:54:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4Vgt0/dqEwdDKGrMGztd8B3jZ2/WOp4TAQPT0fYUoWI=; b=T9HLXvgkYUr75uxUEzOd/ajB8C
 geaunja+hgplzM5SEPVrRH5VAstKJkSnZ6GA+Ptl/3ABO5fxVk4wH4htRTHKXQ5AjLQ6zBW/elmpd
 a71RgfrT++cxXU0BoFRGlfJqqZarN2REJ5XvTOzq4N7czdB/BoqEPLGhRx46rBhWE69k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4Vgt0/dqEwdDKGrMGztd8B3jZ2/WOp4TAQPT0fYUoWI=; b=b
 RjGqVy4bMxrPAt7tvMdM8dR+SxsCduigpHHwXPd4ce2E52bp/MygwuSNDWRB5ttJ+vEgmJaZwTXlR
 LH2GjMNiA8+4wMHGBZeFck/SfnllfH2OR+CbSXn6Iw034URkat95CtnkRcvpZhAJHUrd//U5bYgj7
 jNqJgOLYZ/eQf/Gs=;
Received: from cvsmtppost06.nm.naver.com ([114.111.35.101])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ujaqg-0001Dq-8c for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Aug 2025 09:54:19 +0000
X-Originating-IP: 125.132.232.68
Received: from cvsendbo022.nm ([10.112.20.47])
 by cvsmtppost06.nm.naver.com with ESMTP id 4v-YTE-USWWrgzhF6ZQckA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 06 Aug 2025 09:54:06 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208; 
 t=1754474046; bh=hbwuMkNzJ1ByBciatdG7UHjgkLbpgJWwNVGw5+wJC6s=; 
 h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
 X-Works-Security;
 b=pvD81hm++NCxhQ8JGMwmJ9DU2RoNDXvxm6SU4RQGFcsQN5H2SwWIcXT8/jmA7XOqB
 JyXhi0zD48mDDITf1go0NkuU5tWZwwFAdqaIub6KFVEzIF7/6MwXxRj3+ibce1uMPz
 TKjWQFQiNYB9V28UOmjL6/CmTmtc4pCyTp3/ZFf0l/vlvhNku9KGyekBPB7KEZlq8Z
 ijC18+dRp5xioH0xqoUacUizYSe8NHEIbjfmWtInwy7/mFaMe5ff+dFdOAiCGretNu
 QYe5psbzYJ/dlIdIMxvL1izBAbrfLUpvBt25XpIvE1h+ZkM6yjEqZLVPMy1Y+7dw7o
 0yNHQ0aXZqPgA==
X-Session-ID: IpbYmtGZTv6EDPRmzzEE5g
X-Originating-IP: 125.132.232.68
X-Works-Send-Opt: E/YqjAJYjHmlKxu/FoJYKxgXKBwkx0eFjAJYKg==
X-Works-Smtp-Source: lqbdFAt9FqJZ+HmrFAMw+6E=
Received: from Linux.. ([125.132.232.68])
 by cvnsmtp009.nm.naver.com with ESMTP id IpbYmtGZTv6EDPRmzzEE5g
 for <multiple recipients>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 06 Aug 2025 09:54:06 -0000
From: Cherniaev Andrei <dungeonlords789@naver.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed,  6 Aug 2025 18:53:56 +0900
Message-ID: <20250806095356.2536689-1-dungeonlords789@naver.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Cherniaev Andrei --- README | 5 +++-- 1 file
 changed, 3 insertions(+), 2 deletions(-) diff --git a/README b/README index
 c9b0c1f..9e02c4b 100644 --- a/README +++ b/README @@ -9,6 +9,7 @@ Before
 compilation 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [dungeonlords789(at)naver.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [dungeonlords789(at)naver.com]
X-Headers-End: 1ujaqg-0001Dq-8c
Subject: [f2fs-dev] [PATCH 1/1] README: fix build instruction
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
Cc: jaegeuk@kernel.org, Cherniaev Andrei <dungeonlords789@naver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>
---
 README | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/README b/README
index c9b0c1f..9e02c4b 100644
--- a/README
+++ b/README
@@ -9,6 +9,7 @@ Before compilation
 
 You should install the following packages.
  - libuuid-devel or uuid-dev
+ - make
  - autoconf
  - libtool
  - libselinux1-dev
@@ -24,7 +25,7 @@ How to compile
 --------------
 
  # ./configure
- # make
+ # make -j$(( $(nproc) + 1))
  # make install
 
 How to cross-compile (e.g., for ARM)
@@ -39,7 +40,7 @@ How to cross-compile (e.g., for ARM)
  3. then, do:
  # LDFLAGS=--static ./configure \
 	--host=arm-none-linux-gnueabi --target=arm-none-linux-gnueabi
- # make
+ # make -j$(( $(nproc) + 1))
 
 How to run by default
 ---------------------
-- 
2.48.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
