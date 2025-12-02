Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E938C99C06
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 02 Dec 2025 02:32:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JkQkrgRd1pHok7YE0xrDt2sfQaNfb21pG09Un7E8cPo=; b=CPXQhmkr6o8Cqer1nSDCrQTOvD
	P1Fpc1Te0MTtRlLTcF37zKHf267wi4EAnVuI4A/jpLXnajgTIGhkfDwZR83Xm6tFYO69n/4SbhL2w
	PQpEqr0NVNYsCH01QWX3WoC1uYCqNa6wrIs4RPWGKdqSeynGNAghKT9S7radW45uvZTk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQFFl-0001c1-8g;
	Tue, 02 Dec 2025 01:32:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vQFFj-0001bt-63
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Dec 2025 01:32:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Kz+PDRrOLbvncsu2HtZG2sODnHbczkORDvE4BiuxYgY=; b=JtdHlOdn7meR68z+p4PPe7frb0
 /LoBH9f+8q2XPZAzUDINh4pn3+m4Cn5GnUERo0dFqQ6Mroi/Le8Iq2/t9vWsWb/dHbqIisVqerczz
 /Mv0juO7PmKaAkFkrDCxdS3spEQynwO3LtJVBm8I1gIXJqRyQGYHfsW6D+UDKpLbEaDY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Kz+PDRrOLbvncsu2HtZG2sODnHbczkORDvE4BiuxYgY=; b=b
 6bZCB+XjOVb5k+SY5oxbNGMoIJ0+6EbeEtqd/2xlau301WCM8hJVGQHO1QqRCns2b0GEWze0CpJsM
 CCCH/zhKVJ0Dx51p6MsIUydEKE6eUPptFGAimuX12ooOHpJHYED8gE9WoXbSRZsPf+J6JTirJeFcP
 /AzoKB+WwqrQK3rU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQFFi-0006FV-Pr for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Dec 2025 01:32:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2544060140;
 Tue,  2 Dec 2025 01:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCD3FC4CEF1;
 Tue,  2 Dec 2025 01:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764639135;
 bh=Mc2opyTryZLDKEEpjyKDvLiL+kNz0NWn/iSTPRRI+m0=;
 h=From:To:Cc:Subject:Date:From;
 b=Fm4uEjS2CKU4OvJc9S5bTn9rCfeW04ZJuO3UO1Es3IXjfyqpNR8u7Bk6Xe/wJBNIM
 26pMFuiOjRefGf/s7MZd4z817Rmhf3OImKaXSZQjLBS70Tlw9qZSd9NqexdAQw1jLF
 YWv5hzsGY0t0BABlofjahcsJL7AUcG5W1ik9ic+ksgvuZBE0CIuEqvvRVZfJS5e3rF
 cPWGKPXdYAVicr6bX8DOzEFgmAd+KxlMO6OFJYoT5mpBQzxP8yH10zZ+sfCSBbTGHX
 5tWTti7fdFq5DPSOWnpQ8VYaaQNS8PbXDmnDMqzGU7v2RyK2amEbeSLZSyvDTv3wpb
 OCY4V9hl09NUw==
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>
Date: Tue,  2 Dec 2025 01:30:10 +0000
Message-ID: <20251202013212.964298-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.52.0.107.ga0afd4fd5b-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch series aims to improve
 fadvise(POSIX_FADV_WILLNEED).
 The first patch fixes the broken logic which was not reading the entire range
 ahead, and second patch converts the readahead function to [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vQFFi-0006FV-Pr
Subject: [f2fs-dev] [PATCH 0/3 v2] improve fadvise(POSIX_FADV_WILLNEED) with
 large folio
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch series aims to improve fadvise(POSIX_FADV_WILLNEED). The first patch
fixes the broken logic which was not reading the entire range ahead, and second
patch converts the readahead function to adopt large folio, and the thrid one
bumps up the folio order for high-order page allocation accordingly.

Jaegeuk Kim (3):
  mm/readahead: fix the broken readahead for POSIX_FADV_WILLNEED
  mm/readahead: use page_cache_sync_ra for FADVISE_FAV_WILLNEED
  mm/readahead: try to allocate high order pages for
    FADVISE_FAV_WILLNEED

 mm/readahead.c | 43 +++++++++++++++++++++++++------------------
 1 file changed, 25 insertions(+), 18 deletions(-)

-- 
2.52.0.107.ga0afd4fd5b-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
