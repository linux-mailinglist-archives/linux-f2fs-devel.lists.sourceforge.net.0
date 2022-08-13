Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF5E591B0D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 13 Aug 2022 16:37:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oMsGR-0003to-Kp;
	Sat, 13 Aug 2022 14:37:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1oMsGP-0003th-C8
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 13 Aug 2022 14:37:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zHwhDOlRBtKIlRMxnTE8q1oFvO1zboB2lPQON6R0f1M=; b=gzCDRVCMhie8Gr2L223/tNndUz
 H6ESMNMsgOSJtr6W8CAPvh3pH12yT4gzb0wK3tCzfmQwut5+WlykjUXpXBN4VCIgEgbcAZos6gzb4
 EgQFXOxVNR3pQieOk964NA5yaQOLD8Cg0qIIYRNXCQ0oVWgU0WupOKhE5JjsaX6/Lydc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zHwhDOlRBtKIlRMxnTE8q1oFvO1zboB2lPQON6R0f1M=; b=m
 5wfjp/RN06EHGYNE0fd8PG5wuf6oJBp1XfKsCmwRvGPFMUMzQnxTuNv60Zd71f0OZHz23VDxmfuzP
 GVosRAWmHaL3+JYm7wi8PI/soUGDgdwRRfZzv+H5qukLe3p18cSF43Cg5VkBgrd4B/pZZi20mpGPs
 72RAjnLdAdnLcnUc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oMsGM-0005JC-JO for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 13 Aug 2022 14:37:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3A2BD60E2C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 13 Aug 2022 14:37:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 883A2C433D6;
 Sat, 13 Aug 2022 14:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660401432;
 bh=eUt5WPk2oDTRX7G+NlG6mkjLwzzTqD0BB5QjKnscQNU=;
 h=From:To:Cc:Subject:Date:From;
 b=AQwiGH7vJLTxQzv0F5T8WYPWfRmnackfU27q69GDawH+EAy6YzVQykTVtQTdEu6vP
 pft1aI4mfP5MbxkSNiK1S6PZ0eDPQKCxmPYpOGF27Z/iEHN8GbuLHaipFk8p02E3h0
 9NViWrL+ezh7DnqIVm6F2d4+OKEHUR8zK+mWneqtESc8NHllz0pzuJW3/o1w3IMPzy
 X3jZvhq2cjoV8+UYmfN2O8ej0vhcKHH/gxwxXDlWzvFYdXgThQYlwYf5aC5Rjm8pGN
 j2wb1Gq9SxB6rWhIfyArW4Wi9ekxnrnSQ9f1wJSHHEZ2B7khqzo/wl3432WGiRBzC6
 G+lOJUue56tWg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 13 Aug 2022 07:37:09 -0700
Message-Id: <20220813143709.11909-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: We should decrease the frozen counter. Cc: stable@kernel.org
 Fixes: 325163e9892b ("f2fs: add gc_urgent_high_remaining sysfs node")
 Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- fs/f2fs/gc.c | 2 +- 1 file changed,
 1 insertion(+), 1 de [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oMsGM-0005JC-JO
Subject: [f2fs-dev] [PATCH] f2fs: fix wrong continue condition in GC
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, stable@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We should decrease the frozen counter.

Cc: stable@kernel.org
Fixes: 325163e9892b ("f2fs: add gc_urgent_high_remaining sysfs node")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/gc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 6da21d405ce1..7e4b41240d59 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -102,7 +102,7 @@ static int gc_thread_func(void *data)
 					sbi->gc_urgent_high_limited = false;
 					spin_unlock(&sbi->gc_urgent_high_lock);
 					sbi->gc_mode = GC_NORMAL;
-					continue;
+					goto next;
 				}
 				sbi->gc_urgent_high_remaining--;
 			}
-- 
2.37.1.595.g718a3a8f04-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
