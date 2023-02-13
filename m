Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A055694E87
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Feb 2023 18:59:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pRd6m-000861-3A;
	Mon, 13 Feb 2023 17:59:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pRd6g-00085v-7v
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Feb 2023 17:59:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QNVVfdSuK38YHJJrI4NQpbPWkjWhn7T3ACKSIW+N/LU=; b=nBKaGIpoodW2dF0SG62KMXEOQH
 zamLzZjr4w2t9CGebDKWa6stHWQeGd48Wt5bnYhpmScXlaS5J9eqm+auKrIa9RKNvl0k62Gh65jpp
 s9N0h4stmM0NFFFUT3Vtp78AJpgMFUPqcButaKdH5+HvmnBO36UXbU5c4LxXSZuG0yi4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QNVVfdSuK38YHJJrI4NQpbPWkjWhn7T3ACKSIW+N/LU=; b=DQQDAJa+It2A4wdMGd3I9wm4t5
 E0PNWTpJjd6GNxVwmNJxrASjEmkfOpzkVtGaBYeqZPYFAbyUUnaiQOlXDJf+6lh+QRW1GbToBY3aW
 6CmYaUIAsTzrwh8eGllMpCRF5voIyX03ukyHPx8QR8fwowtv16G84p63EakbQ0Gde8IA=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pRd6e-0001ZD-2X for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Feb 2023 17:59:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 90B7BB81661
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 13 Feb 2023 17:59:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42477C433EF;
 Mon, 13 Feb 2023 17:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676311145;
 bh=4TNAbVL+S8I0w9YW/3y8y9MsZXwnOgdDxamCrv1+fAQ=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=r+Rh7D4IKpcPe+H5JuK1VEsd/oLc7SSmKDkSwry0ktsXpNDB3HsJN5TFRff/IPFyB
 4dfJX8H3GKvY1Dc0FsxOKa4vB31RUcw7KHCCRFwHyIrzQMuwave9wWZc+gE1CsaTPk
 pT3pfptDQJkskGf2hzmI0Kk31vlAdVv4qydszlgMH/t3S/hS9YoDikdLP+/eloJNEL
 Lh2dRxq0zgu8l0HtzsuhatouupTM6IpBjrjKuW6fJCAASl4s0BOLIT3G9XDFFhCS9M
 Zt96lw6w6Veygy5cV8RJvUxOmXwZQw4aO5dhrLvWduES3jWvisNyZ7MCzVFwsdUHCP
 ONsgWR63bsq5Q==
Date: Mon, 13 Feb 2023 09:59:03 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <Y+p6ZwXxzlRCdfG2@google.com>
References: <20230210213250.3471246-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230210213250.3471246-1-jaegeuk@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  MAIN_SEGS is for data area, while TOTAL_SEGS includes data
 and metadata. Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> --- Change
 log from v1: - replace check_seg_range with valid_main_segno to avoid
 confusion.
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pRd6e-0001ZD-2X
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix wrong segment count
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

MAIN_SEGS is for data area, while TOTAL_SEGS includes data and metadata.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

 Change log from v1:
  - replace check_seg_range with valid_main_segno to avoid confusion.

 fs/f2fs/segment.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 92c8be00d396..efdb7fc3b797 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -719,9 +719,10 @@ static inline unsigned char curseg_alloc_type(struct f2fs_sb_info *sbi,
 	return curseg->alloc_type;
 }
 
-static inline void check_seg_range(struct f2fs_sb_info *sbi, unsigned int segno)
+static inline bool valid_main_segno(struct f2fs_sb_info *sbi,
+		unsigned int segno)
 {
-	f2fs_bug_on(sbi, segno > TOTAL_SEGS(sbi) - 1);
+	return segno <= (MAIN_SEGS(sbi) - 1);
 }
 
 static inline void verify_fio_blkaddr(struct f2fs_io_info *fio)
@@ -776,7 +777,7 @@ static inline int check_block_count(struct f2fs_sb_info *sbi,
 
 	/* check segment usage, and check boundary of a given segment number */
 	if (unlikely(GET_SIT_VBLOCKS(raw_sit) > usable_blks_per_seg
-					|| segno > TOTAL_SEGS(sbi) - 1)) {
+					|| !valid_main_segno(sbi, segno))) {
 		f2fs_err(sbi, "Wrong valid blocks %d or segno %u",
 			 GET_SIT_VBLOCKS(raw_sit), segno);
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
@@ -793,7 +794,7 @@ static inline pgoff_t current_sit_addr(struct f2fs_sb_info *sbi,
 	unsigned int offset = SIT_BLOCK_OFFSET(start);
 	block_t blk_addr = sit_i->sit_base_addr + offset;
 
-	check_seg_range(sbi, start);
+	f2fs_bug_on(sbi, !valid_main_segno(sbi, start));
 
 #ifdef CONFIG_F2FS_CHECK_FS
 	if (f2fs_test_bit(offset, sit_i->sit_bitmap) !=
-- 
2.39.1.581.gbfd45094c4-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
