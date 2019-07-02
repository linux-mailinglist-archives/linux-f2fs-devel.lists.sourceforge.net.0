Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 939115CA07
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Jul 2019 09:39:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SkOBizpS0RI8Ora4fbHMoTODRk4gz89hNp2h49DaAf0=; b=hyHE/wQjc0JmYe/YnR7EiLX1tJ
	S05KOX3ekA7jneKCdPrKJn9V0XxL9/xH6a4ZMzpXTAoWj8JfgOsJz/pl8hwvJcQzO0ZhYvWYxFcPt
	7krEAJCwd3wUKyCLgHDZ3BKboLhCpmR1iHmUV/rleEPb5Bd59Bu+I17RSRYfJk+95E2Q=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hiDNc-0000qb-0X; Tue, 02 Jul 2019 07:39:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <3hgQbXQkKAOkZNPLYNSPYRZZRWP.NZX@flex--oceanchen.bounces.google.com>)
 id 1hiDNa-0000qU-6V
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Jul 2019 07:39:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K8Aexb7ljwnjo43LTD84KFxt2yaGUlciYewUGizxqp8=; b=QEkoVaHV2Yd0ID4xzQ1oSXXd1l
 j5a0YpD/2Tp40PX84hE31o1Rf92BKdXw99LDVJsJJ2ihw/PrJirySKkmevnqZ05iO55sUDAfKaOmT
 ghDQIUnd3gFeCO8Xoy38wDrYggYT8EneX1F9s+EAXANEARuvlwwbfatMEaUctjRHr73A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=K8Aexb7ljwnjo43LTD84KFxt2yaGUlciYewUGizxqp8=; b=R
 ctr8X8NqA8JoIfwqDxO7N8kPWwbnzekYeIvgiVEo5KbeYNa+QId3xNw1RwsivSFeTfj2cTnRJLpnE
 pxlro77Vicwjk7ieUKYBNs2MvV0npTApsxaAO0LcOfaSAIudplCky4bBEWaxxJQudC3jZ1eMsVJjD
 xLnTfndHnJ2L5FYA=;
Received: from mail-ua1-f73.google.com ([209.85.222.73])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hiDNm-001ahM-Pz
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Jul 2019 07:39:21 +0000
Received: by mail-ua1-f73.google.com with SMTP id q23so2921147uam.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 02 Jul 2019 00:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=K8Aexb7ljwnjo43LTD84KFxt2yaGUlciYewUGizxqp8=;
 b=I8u313E8FBDrYJbHjZTqlq9VFU2xsZDW/+q0ovmtc6t5f9akeBUHu4ahrsM5qqlBxU
 +wqic6S14w0ZfSbKtCZYxIRdeM3SNZscRHz6YumpcCn+qA7gKfM6ZLvRQTljOuNl/7dY
 0vogG0ZPjZvUecplrxHpwaDiB4qufA2wonaIZUY1hq7CrZc1BsWNwOsvN0XgOEPInKA/
 a3sAOB5ExVdMRqQJZ9PMTxtKQavFNSontACIoGATuBaO4n3/BAN4e7YwXZHaz/bCnoWW
 Bdb0IPtLchhv0XEsSS70YRGodKiO+AwwnwC1HYxrKSw4nco/9zIkbV7n5viarectEKop
 6b/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=K8Aexb7ljwnjo43LTD84KFxt2yaGUlciYewUGizxqp8=;
 b=dPS3rRlSgn3fUd4VEHFRTGIYtx/i8X5BxcjYorGP1H7+ZzcP1ILnNvnGOW+BZ+WEec
 j4aQXK14oDAiH207QH171GdtTEdp1NZ0LnafHCJ+k030bAAD7auaa6XfGgJTjjDrq1D1
 gdPyIp0B9Mfivr4iCZt/vSzZxuJmUzTsotymbso0XB7zPeN/hgqVt0GAp+gMjCJkpY1k
 H2UyvVe0/n1T9WsxhOtHjJ774u0e8WUa8Xq0IS/VIlK+CmMolb6plV78wQyg3AFiKHtr
 MKsG3NMDrcejzkLV7rF3P3CUSxgYvPW+U1mmV/sW4DQvQy3tHDkeQwAW3NKchnCP3s5e
 eKLw==
X-Gm-Message-State: APjAAAX/XqDBbmupqxGtFN69PA0UZCbMkwdVdLBoL1iQI0TiY51b/3hB
 0ZCnQQ8Aa2B+u/7IG7t8OjDWSHBuW5lWakE=
X-Google-Smtp-Source: APXvYqyNbkUWK4ZjMisvx3QNm+os2jiG+ShivAJCx8Dft26tvmFVMGPVIfe17cJhkyVPwEZgQqTehJX9HdetKU0=
X-Received: by 2002:a63:60cc:: with SMTP id u195mr28865210pgb.13.1562051718453; 
 Tue, 02 Jul 2019 00:15:18 -0700 (PDT)
Date: Tue,  2 Jul 2019 15:15:10 +0800
Message-Id: <20190702071510.158351-1-oceanchen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
To: jaegeuk@kernel.org, yuchao0@huawei.com, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.73 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1hiDNm-001ahM-Pz
Subject: [f2fs-dev] [PATCH] f2fs: avoid out-of-range memory access
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
From: Ocean Chen via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Ocean Chen <oceanchen@google.com>
Cc: oceanchen@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

blk_off might over 512 due to fs corrupt.
Use ENTRIES_IN_SUM to protect invalid memory access.

Signed-off-by: Ocean Chen <oceanchen@google.com>
---
 fs/f2fs/segment.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 8dee063c833f..b83c23ebae1f 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3403,6 +3403,8 @@ static int read_compacted_summaries(struct f2fs_sb_info *sbi)
 
 		for (j = 0; j < blk_off; j++) {
 			struct f2fs_summary *s;
+			if (blk_off >= ENTRIES_IN_SUM)
+				return -EFAULT;
 			s = (struct f2fs_summary *)(kaddr + offset);
 			seg_i->sum_blk->entries[j] = *s;
 			offset += SUMMARY_SIZE;
-- 
2.22.0.410.gd8fdbe21b5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
