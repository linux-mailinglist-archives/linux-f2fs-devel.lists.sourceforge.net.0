Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A81BC7495
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 09 Oct 2025 05:23:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lG7dS/IKf5jX6X9YSzXQ9LG4aS/1MPKORNwQORph/9U=; b=EF1XFrmI9TUWzQ1hutGIHWaxCx
	TFFtd+YPpIyboYZ06hPX7MlpFLkHB2hpUT1HjL8o1LZ7ird/cx1Vw7XkS/q5D+FUtV5Sryp+T2oEU
	VpDgDIrwAjwpw7DYVrP/B7RHGY9byCuV9jpgVr7O8Yq55AaH09SHTt0RX5SoEZpy9fbA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v6hFY-0006bO-AK;
	Thu, 09 Oct 2025 03:23:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v6hFW-0006b8-F2
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Oct 2025 03:23:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OHdaBrpMPhFE+uK34tzvYVpLqEwP08tbyF1QXwTcu1o=; b=lDeVRYOWtgVPYFYnJqqWKfl2Sg
 lhHNlFLVZEWHsIzTcpAgpfOXWL8vUjSdzkTUCSkTu4oiXu6qsgbTWVy9MFzCB2YggS3ZjrUxKmZYr
 vR7ZpxYevmjLLF5osu/G5hqWRw5y4hKUK8FAA4jj02bVV1vi/Tlz7ZoCQMGRqtJWUY5M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OHdaBrpMPhFE+uK34tzvYVpLqEwP08tbyF1QXwTcu1o=; b=QJNFfISi1NM1kwxw3aHt94p+7b
 jJd1Szw0ikyLiCSc2ND5KmH5Rpqdp03aCI2qR2+ORbZscCJ+Sh5X2xIycmjw3ikpGEg5QxA0jm1mI
 VHciyUlzRvvRAdSX7v7L7dzpefRUCS3aj20tr4PP1ONyEvex9pqJvndryjPD3z1SBYlA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v6hFW-0005np-TZ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Oct 2025 03:23:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8C74F43228;
 Thu,  9 Oct 2025 03:23:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51F8EC4CEE7;
 Thu,  9 Oct 2025 03:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759980201;
 bh=7YP1TE8V5KIYpHRIn3iOxTAomS3iNv19gWr2R/JsuzI=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=tcfq93gdNXbbRkXqzTD1VKV0xpOQW4CULFttCvq/6SBSGWHc2ooKFWhXQXhswf4bG
 UxU2GBFUmp68OKaaTTwzOoO58DIJkfcHjkZLDdVcnY6AcvvlQqICOfHXjRQCNQRCHs
 US9lDkcemRroRWsLgf8wPrZW+00WLgVWnFAaVxVE8+Golo+upW2nGwzh6UUFc4Je1O
 jCM9so6N+REY4Fsk+fA84T6A0ip8PDQUipOPQQPB5Oo5uQHqDtFCXr/9/U2vzxiYPA
 BZkDhNQZbAGqIZ0YEDHrkDoC+pZIibBU2xoL4jy2DEUsUSUGZbF0zqOK7TXspI+8Ei
 WHm5xG22kZaLA==
Message-ID: <94f6a9af-e768-4380-bec6-096fca5e94fa@kernel.org>
Date: Thu, 9 Oct 2025 11:23:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Pedro Demarchi Gomes <pedrodemargomes@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251004031217.50242-1-pedrodemargomes@gmail.com>
Content-Language: en-US
In-Reply-To: <20251004031217.50242-1-pedrodemargomes@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/4/2025 11:12 AM,
 Pedro Demarchi Gomes wrote: > folio_nr_pages()
 is a faster helper function to get the number of pages when >
 NR_PAGES_IN_LARGE_FOLIO
 is enabled. > > Signed-off-by: Pedro Demarch [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v6hFW-0005np-TZ
Subject: Re: [f2fs-dev] [PATCH] f2fs: use folio_nr_pages() instead of shift
 operation
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/4/2025 11:12 AM, Pedro Demarchi Gomes wrote:
> folio_nr_pages() is a faster helper function to get the number of pages when
> NR_PAGES_IN_LARGE_FOLIO is enabled.
> 
> Signed-off-by: Pedro Demarchi Gomes <pedrodemargomes@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
