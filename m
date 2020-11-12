Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 739432AFEDF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Nov 2020 06:41:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kd5M8-00065P-5J; Thu, 12 Nov 2020 05:41:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kd5M7-00065I-7y
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Nov 2020 05:41:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U8G0ha90t1H5cLyuGdlEV3MH/sAgCPVpXdU4qvQUHM4=; b=JlTc4vNTqnPMm3mIKh5gH9zyTX
 N8EWtB0+PoFuoyKtPRchfah+vmlxrNAeQ+n4lX5GxNvssufl2vhDSK62mxWtZmGlhv31dK7dkH+Tz
 0ultiEVCDHFPHUuqp7XbEUk8DVfBCx5LljfOmF35leNqtC+w61b2sS+BYTzyvqtAJbXQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U8G0ha90t1H5cLyuGdlEV3MH/sAgCPVpXdU4qvQUHM4=; b=HxSmbWYd+S/Hjl1XURurJLhi4g
 y0B6/0Hi4OgzdXJdL/wqM4ckELjXIxZ1d/50F/nZ2DzaasqpEw+tIk95H638srSWhchlyMs37FfTa
 QoFr47FafQE7A8NGnH75knTw4Fnk92XAiH0N9/jPF0njXmvKubEG9XcrcgzXUNPKXXoA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kd5Lv-0007oi-An
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Nov 2020 05:41:11 +0000
Received: from google.com (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7D8D92076E;
 Thu, 12 Nov 2020 05:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605159653;
 bh=9ibzdXZrtU/gfZtcBKAW2NIKugLvAG+ui+6e39ewi8E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PiKTEyLd7zkM4dAJL0JwkU4r8FD/1zGISnh1O2j6Fgg7nxWHgiYKmk3Ofx5Iv4H8m
 CsVnvtp7UU6/v96eoYFTXpasUuFfJTiwmfNHWYS1DNFFZxwuiaZoheJVlrB8npDOnm
 p8iTb8HE0bzhqzXGbmCRpxFi8RC2S3V/hN+6B/0I=
Date: Wed, 11 Nov 2020 21:40:51 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Message-ID: <20201112054051.GA4092972@google.com>
References: <20201109170012.2129411-1-jaegeuk@kernel.org>
 <20201112053414.GB3826485@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201112053414.GB3826485@google.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: mediatek.com]
 0.0 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kd5Lv-0007oi-An
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: avoid race condition for shinker
 count
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
Cc: Light Hsieh <Light.Hsieh@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Light reported sometimes shinker gets nat_cnt < dirty_nat_cnt resulting in
wrong do_shinker work. Let's avoid to get stale data by using nat_tree_lock.

Reported-by: Light Hsieh <Light.Hsieh@mediatek.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
v3:
 - fix to use NM_I(sbi)

 fs/f2fs/shrinker.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
index d66de5999a26..555712ba06d8 100644
--- a/fs/f2fs/shrinker.c
+++ b/fs/f2fs/shrinker.c
@@ -18,7 +18,11 @@ static unsigned int shrinker_run_no;
 
 static unsigned long __count_nat_entries(struct f2fs_sb_info *sbi)
 {
-	long count = NM_I(sbi)->nat_cnt - NM_I(sbi)->dirty_nat_cnt;
+	long count;
+
+	down_read(&NM_I(sbi)->nat_tree_lock);
+	count = NM_I(sbi)->nat_cnt - NM_I(sbi)->dirty_nat_cnt;
+	up_read(&NM_I(sbi)->nat_tree_lock);
 
 	return count > 0 ? count : 0;
 }
-- 
2.29.2.299.gdc1121823c-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
