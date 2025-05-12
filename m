Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAB6AB3653
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 May 2025 13:55:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=py66vW85e61YoZ3HL8Y92xMwsXGmpYS+MtVEc5YCC20=; b=dwRpwF4XMyMmH6hEX8s1AkFxaS
	sFQ0BOfCkF+ZimrzQiu0tviy1thYK88c/ADX+ZJ9cxKqMy1SreNWdaeQ8mOCjQPrKpTE/2V1koAli
	jjXa5Jf4RktsXhKtReEem8hWFpb6CHzLwa3U73PyTFmyHxC1SGtYkdkGhHS9WV53MMH0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uERkK-0001yT-Rc;
	Mon, 12 May 2025 11:55:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uERkG-0001yG-LR
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 May 2025 11:54:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WbjRZ5T2Z39BbipS0U9zuXWLRsvmp9jeoAeFrh6H92A=; b=j3Nl7HHe/E/9UeuoxnE4YZdaRD
 pXWy+j/iD0rkwffx2Auya/C942GlUHMnSjvkjdJavx6iM5O/uqmqz6A3Je4AsvTuty2l+1zWwpGwf
 8WQFDz3GGrPilYV1ojMyR/URpks5DNP5wbt3pRVl1JqHeQV7b0o55GdJPVFHLKbD8Y7Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WbjRZ5T2Z39BbipS0U9zuXWLRsvmp9jeoAeFrh6H92A=; b=T1Qu3b4L17yyL0qbBwW1QnFEG7
 7SanXT+LfBrbIsZsdQ56RAXo4qt7qThttwIPogBi7NWMqcDYqDpZQ7uvcL7wlnz1I9loDuBU3oTf3
 5Uhvluc+6L0ofkKQJ0amOO3z0uttZVrjMtZ46dZLyqExCnTX1EpZNZNSB/YeMWKKPdT0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uERkG-0007o1-6A for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 May 2025 11:54:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 760B55C6419
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 May 2025 11:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 808B6C4CEED;
 Mon, 12 May 2025 11:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747050890;
 bh=1FFzBQnFeOZIUJzz8/wDGrTvsea7fEZOK8Kl5euk03k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X2QSduM3JLHXmhCTO/td/ErbcOLhXOymr/zMqpkSEqJbRLux22A9O6+C2RC7EUhsU
 5H8M91C0X2jxpYwpJXRbUzvVYtfsejxUkLPKTvlbWDB79Zr0OCmKKWNDDYmgRjTnSM
 wLeog9nb84NgusxQT1fkC/nsDiLKjfp6UIXS+AUL/ABODB9PxvHFc6woxrZa5hGI+Y
 ze505nECNvyQW2PvlgeqRWEnV5T5/kT+yfRdZnswSh7+MCOlF2JzBD+aMUjHIG/XI3
 zYC/4MBoLdGJdujZEpKOfIPNn9riFiv8qV49dNhcCtIZxfVyGm/rUejB89R3TPEidf
 w/fTvdDpZRGTw==
To: jaegeuk@kernel.org
Date: Mon, 12 May 2025 19:54:42 +0800
Message-ID: <20250512115442.2640895-2-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
In-Reply-To: <20250512115442.2640895-1-chao@kernel.org>
References: <20250512115442.2640895-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -6.6 (------)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  mapping_read_folio_gfp() will return a folio,
 it should always
 be uptodate, let's check folio uptodate status to detect any potenial bug.
 Signed-off-by: Chao Yu <chao@kernel.org> --- fs/f2fs/super.c | 11 +++++++++++
 1 file changed, 11 insertions(+) 
 Content analysis details:   (-6.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/, high
 trust [139.178.84.217 listed in list.dnswl.org]
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uERkG-0007o1-6A
Subject: [f2fs-dev] [PATCH 2/2] f2fs: add f2fs_bug_on() in f2fs_quota_read()
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

mapping_read_folio_gfp() will return a folio, it should always be
uptodate, let's check folio uptodate status to detect any potenial
bug.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 0ee783224953..ea207a9edc10 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2973,6 +2973,17 @@ static ssize_t f2fs_quota_read(struct super_block *sb, int type, char *data,
 			goto repeat;
 		}
 
+		/*
+		 * should never happen, just leave f2fs_bug_on() here to catch
+		 * any potential bug.
+		 */
+		if (unlikely(!folio_test_uptodate(folio))) {
+			f2fs_folio_put(folio, true);
+			set_sbi_flag(F2FS_SB(sb), SBI_QUOTA_NEED_REPAIR);
+			f2fs_bug_on(F2FS_SB(sb), 1);
+			return -EIO;
+		}
+
 		memcpy_from_folio(data, folio, offset, tocopy);
 		f2fs_folio_put(folio, true);
 
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
