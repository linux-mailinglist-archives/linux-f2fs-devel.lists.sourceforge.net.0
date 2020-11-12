Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7812AFE27
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Nov 2020 06:34:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kd5Fi-0005oY-I3; Thu, 12 Nov 2020 05:34:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kd5Fd-0005oA-LO
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Nov 2020 05:34:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZBSX/EIeNSI0wkno4qCaUlGyYH2qNvUKH3YAkYEaRGg=; b=UDyPMBr0j0/E5jLnajWYRV5IY4
 h/1oeaXssY5e9/NoH3GN7NsDyr/Kvi+tic6XomMcqZeCIe3MMMU1pFNBwahI5jfnPD0wjEkIodip9
 IABVXs+jKVaIvdc1C/Buk0RLmOhrMtPJE8w8XMtCSZjqVAG2dLEJqZQZmoCQ96tmHFfM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZBSX/EIeNSI0wkno4qCaUlGyYH2qNvUKH3YAkYEaRGg=; b=YmEscEqE0Y/riOW+psFTpz8XP4
 StPsUUT85trYLsR8MfUK/TQlR+5KxJvJbaYF8bJS35ZZ/oXJTl9nCe8HNSDm85hGBjlOqaxli3hME
 bGn6+u2AAx6Gaijl66SZjIK5FkE0bc4la8hLYExUj0jGySoOqhAyFiukB29nAKyPEbz8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kd5FV-0007Yo-DW
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Nov 2020 05:34:27 +0000
Received: from google.com (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9A8EE2076E;
 Thu, 12 Nov 2020 05:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605159255;
 bh=RR8tEZfeMTPWIeuF8jnjdhsKpk0uEkjI9YIlVtLy2Z8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HJHcsZG4oqKpJ00Cxo0SuPCErWUj06VNCY3Gcpn7Wy0coE6ebLG7pseJYOjMh0nMi
 TrZsYyVXrEHh0cRpK+LsOFtf3UjqZFrEwhFIJyxd0Mo4f5jnZvBtF2sqx3fs/hqVQ3
 2ld478cO5eA1b+vc89TLNJa3VmUu5zI1ttlPX6fI=
Date: Wed, 11 Nov 2020 21:34:14 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Message-ID: <20201112053414.GB3826485@google.com>
References: <20201109170012.2129411-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201109170012.2129411-1-jaegeuk@kernel.org>
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
X-Headers-End: 1kd5FV-0007Yo-DW
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: avoid race condition for shinker
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
 fs/f2fs/shrinker.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
index d66de5999a26..d42245ab07f4 100644
--- a/fs/f2fs/shrinker.c
+++ b/fs/f2fs/shrinker.c
@@ -18,7 +18,11 @@ static unsigned int shrinker_run_no;
 
 static unsigned long __count_nat_entries(struct f2fs_sb_info *sbi)
 {
-	long count = NM_I(sbi)->nat_cnt - NM_I(sbi)->dirty_nat_cnt;
+	long count;
+
+	down_read(&nm_i->nat_tree_lock);
+	count = NM_I(sbi)->nat_cnt - NM_I(sbi)->dirty_nat_cnt;
+	up_read(&nm_i->nat_tree_lock);
 
 	return count > 0 ? count : 0;
 }
-- 
2.29.2.299.gdc1121823c-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
