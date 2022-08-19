Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF94B59A9AE
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Aug 2022 01:53:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oPBni-0003ee-QT;
	Fri, 19 Aug 2022 23:53:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1oPBni-0003eY-9M
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Aug 2022 23:53:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6SWqm3PzzU1+KqhoYtitVJkaxcd1j+BmB2Vu4ZW3pPo=; b=PvoBJUy+rRkQVKDvgeINXGjiNQ
 337FhYIrA7AWA4AfQq9rJGfEai+Sohcs6dtfdAXVdzP5GWH+RpSHBmKspPHqGWIbV8OV+Ng65SFmd
 1adI4BfPK3V2CwVaOEqSUwmKHvqV6bCYgyoLY5qiG13ili3DT7fVbwTkvpv87PhLofXs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6SWqm3PzzU1+KqhoYtitVJkaxcd1j+BmB2Vu4ZW3pPo=; b=SAYhOtLpR1CGVGV35awBUlbv5m
 sNrGTjFR87laaDRNsiHiDjX8OpOGhBd29+t15J7ZpdvQa0TnY2ZOUjENIrovhqPC9nXQq41VRRxLh
 UBznwJA2wznZtfrFkoHiPtgHdoUi1Yooa1G3L/SAarMLzlXkVEDO4jcvWdWRzZFp2Uec=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oPBnh-009xXo-K8 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Aug 2022 23:53:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 60F4EB829B4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 19 Aug 2022 23:53:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB216C433D7;
 Fri, 19 Aug 2022 23:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660953191;
 bh=pyyvju2kzZjvlECXi51yn2sTNYvHyXWrgTW5UX6N7E0=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=PhWo60zanBY7v7wkKDTYq61Cs0yUI0haNL/WxtIKlO/7l5BROCMu2UiKsVKN4H1wC
 /OStgAe4OCFNzbIU68wWJIi9SHDxyVD5g9nqodnTNXfcBsWhvkVkJKPh0N5Icvu23z
 V9d5g4JosCcOQHEpK1V0s85vPGW8nx+p0Cu/kffGFHEL+gFiumyPASiLmqAZNQljmC
 ZEVHwBFCrG1IO5DmMPuFS0+5/1mDq6Kz2VQ2InG2CouZiIQXfoa5hEC1TxD6G8m+Xq
 iM9YdYtmtjie1lTD8t+ePkOOq1pZBGeYVPyqXL2KmVRfqEv6+thP+jRS1Cz6XhZaaL
 1Y4oHdtKxmr+Q==
Date: Fri, 19 Aug 2022 16:53:09 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <YwAiZTYkFi/EP/Ls@google.com>
References: <20220811225454.2125297-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220811225454.2125297-1-jaegeuk@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: ATGC is using SSR which violates LFS mode used by zoned
 device.
 Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> --- Change log from v1: -
 check LFS mode 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oPBnh-009xXo-K8
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: LFS mode does not support ATGC
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

ATGC is using SSR which violates LFS mode used by zoned device.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

 Change log from v1:
  - check LFS mode

 fs/f2fs/super.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 2451623c05a7..fe462484f5fa 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1342,6 +1342,11 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 		return -EINVAL;
 	}
 
+	if (test_opt(sbi, ATGC) && f2fs_lfs_mode(sbi)) {
+		f2fs_err(sbi, "LFS not compatible with ATGC");
+		return -EINVAL;
+	}
+
 	if (f2fs_sb_has_readonly(sbi) && !f2fs_readonly(sbi->sb)) {
 		f2fs_err(sbi, "Allow to mount readonly mode only");
 		return -EROFS;
-- 
2.37.1.595.g718a3a8f04-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
