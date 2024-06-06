Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E7A8FE373
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Jun 2024 11:52:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sF9nS-0000z0-Nq;
	Thu, 06 Jun 2024 09:52:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sF9nQ-0000yq-Kd
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Jun 2024 09:52:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0Qtit0s+ubEdwb2l1dDcIyvlNhAk3ps4t2tuYcweImE=; b=Ma6/fwXhy7UvrJsQioIWJvKaCN
 NFSocfuiYQPXHlrO+fQvSVskUeHk8sARW/Iu0EcqLH7uwrT1p5gmU1F81tdgfuZ9FC53M0PaFG5gt
 DtJNhq8PHBGiqhNGPVpOSUagQ9TQwt0QJaP6KhK068wWq4avJuQCsHjgbCnuJ03DbAKE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0Qtit0s+ubEdwb2l1dDcIyvlNhAk3ps4t2tuYcweImE=; b=SRB534L+ieVWlHE5gnXlBnhwct
 972bc5gdZfEc2NX1lv2/EjglbDeh1iu5bDSYfA2Ag57yc++NbO4moFYgVYhbN3GwTx/OH6/J+jeTB
 jZVlcb+AI+r8Wuxe0e/mp4R+ruTo0/rRbUft6hR/vrVR9bnvNfkJnEobDp1pZzdfhptQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sF9nS-0004OY-0r for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Jun 2024 09:52:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E340461A14
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  6 Jun 2024 09:52:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92FD0C4AF0D;
 Thu,  6 Jun 2024 09:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717667546;
 bh=1A4x52edkxk15o++tyYBiiibRgkm7p/CeiPX3AK72eo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oV1szKEXx6PIDhSbDwjHlwMXPTlD3x5MY2IXcNWWkyCBSwTAi4TTEqjoO82yl/M3V
 wexutYQvf6Us0ZnAb3IVk5F0DOHvq/HHBJc3K0nqvJ8R4Ls3xScHAUNMQEt00vBuTO
 qJ8zEjiMTFZVKYGKoFBPDM7j19NjNhiCuXhjhLhOctvqM/mVCxdHgNkgi4rV8B/dV1
 wpQ+PC1TYhkRcOFGap0X9agTgBsi7kcRlDcGw1vRCmssuziSfF06JYLnwrHny7C1aM
 6cIF2Ta+qHN05PRw+eXQvw+ZrzNCmalA1PDUvlbwc1Qt0Wu7h5yRQSw43g21/b7rOK
 73qjGvTanl74w==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu,  6 Jun 2024 17:52:13 +0800
Message-Id: <20240606095213.4087668-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240606095213.4087668-1-chao@kernel.org>
References: <20240606095213.4087668-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Since background GC is f2fs inner operation, so, let's use
 sb_{start, end}_intwrite{_trylock, }() instead of sb_{start,
 end}_write{_trylock, }()
 in gc_thread_func(). Signed-off-by: Chao Yu <chao@kernel.org> --- fs/f2fs/gc.c
 | 4 ++-- 1 file changed, 2 insertions(+), 2 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sF9nS-0004OY-0r
Subject: [f2fs-dev] [PATCH 2/2] f2fs: fix to use sb_{start,
 end}_intwrite{_trylock, }() in gc_thread_func()
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

Since background GC is f2fs inner operation, so, let's use
sb_{start,end}_intwrite{_trylock,}() instead of
sb_{start,end}_write{_trylock,}() in gc_thread_func().

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/gc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index ef667fec9a12..004587ac5530 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -76,7 +76,7 @@ static int gc_thread_func(void *data)
 			f2fs_stop_checkpoint(sbi, false,
 					STOP_CP_REASON_FAULT_INJECT);
 
-		if (!sb_start_write_trylock(sbi->sb)) {
+		if (!sb_start_intwrite_trylock(sbi->sb)) {
 			stat_other_skip_bggc_count(sbi);
 			continue;
 		}
@@ -163,7 +163,7 @@ static int gc_thread_func(void *data)
 			}
 			spin_unlock(&sbi->gc_remaining_trials_lock);
 		}
-		sb_end_write(sbi->sb);
+		sb_end_intwrite(sbi->sb);
 
 	} while (!kthread_should_stop());
 	return 0;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
