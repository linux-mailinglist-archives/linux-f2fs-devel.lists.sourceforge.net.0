Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8705273049F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Jun 2023 18:11:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q9T5Z-0006pL-LX;
	Wed, 14 Jun 2023 16:11:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1q9T5S-0006p3-4g
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jun 2023 16:11:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kkqGN/ePRdmtrk/UlXk3qlCl6a84r4BenV3uVfYw1vg=; b=cpxfJESmIDXrci03FqrTIUtPWx
 pHgulVws0XogSdHQvZirOr57YCYJIHdY7lt0FxApnaJFFZMVnAoOFuYejKmj6/B0i4FkureyrJNJ0
 tCcSNYSx0x5cO9idXrZegYDyaJjgSFLAuF6Ei1lZg4KlWVC03gcfrxJpsp1WLZ73a+Bg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kkqGN/ePRdmtrk/UlXk3qlCl6a84r4BenV3uVfYw1vg=; b=Lw8V+IbNtNGWb/SEa9WvZ7XHgT
 ufDlJWbj5Zde7IAG4llkS7oIFOOscF+L7FIjzKi4XHUp4uYHNXX2051gC+tJUbqY/c5ER++W1g8ae
 pjmGDGp6nMmLkWRJmnf0S+1LhSYuMu3D2Wk3C7UfPeFqcChHYqovQMKSE9FzewI0DRRU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q9T5O-0003fU-31 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jun 2023 16:11:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ABA5E60ECD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 Jun 2023 16:11:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CC53C433C8;
 Wed, 14 Jun 2023 16:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686759060;
 bh=d/6LGrrxRVt13rFpG8sOHqoRpWYJK2jysFBzCM0AugY=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=MzkPzC/V9icUPyqtNTVo2NcGiI4XiCHiI73DmrSR/HEqVlU/Fl+ZMfB3UxoSC/l+M
 Q3j21Qs7GmEaswumMO6lbsSSYUKgliMlgnL07FSpta/wHiRMsaJ+9wCukkhMuX7e2c
 dATG59SwQ8q1sBqu2yPk7uRrhGYThcqbONY6xB4JBl3RxmvR/vx0ergpV1n2zcNZo7
 UCBwPL0ecAzCIQbq8Vad1WWe39J0B4R0ZBrmNBV0YC6eIl70XD4X2wduteYeFW1oob
 ma+HHvIm19Z1jwxSm4XCSGoVmY5UKV/pbbikug8tvVFH0RJXrYrL5QHQhoipM5WWOH
 pEkH08tA0fHKg==
Date: Wed, 14 Jun 2023 09:10:58 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <ZInmkgjDnAUD5Nk0@google.com>
References: <20230613203947.2745943-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230613203947.2745943-1-jaegeuk@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If there're huge # of small discards,
 this will increase checkpoint
 latency insanely. Let's issue small discards only by trim. Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- Change log from v1: - move the skip
 logic to avoid dangling objects 
 Content analysis details:   (-5.9 points, 6.0 required)
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
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q9T5O-0003fU-31
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: do not issue small discard commands
 during checkpoint
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

If there're huge # of small discards, this will increase checkpoint latency
insanely. Let's issue small discards only by trim.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

 Change log from v1:
  - move the skip logic to avoid dangling objects

 fs/f2fs/segment.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 8c7af8b4fc47..0457d620011f 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2193,7 +2193,7 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
 			len = next_pos - cur_pos;
 
 			if (f2fs_sb_has_blkzoned(sbi) ||
-			    (force && len < cpc->trim_minlen))
+					!force || len < cpc->trim_minlen)
 				goto skip;
 
 			f2fs_issue_discard(sbi, entry->start_blkaddr + cur_pos,
-- 
2.41.0.162.gfafddb0af9-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
