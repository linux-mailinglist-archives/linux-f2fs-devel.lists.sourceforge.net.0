Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 755A127B305
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Sep 2020 19:23:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kMwrk-0002QK-Ni; Mon, 28 Sep 2020 17:23:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kMwrf-0002Q5-6G
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Sep 2020 17:23:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i4wak0Zw72fBP2d8XJx7dJuRwKqclZ2Z4r71a+Dp/QQ=; b=Pjnlm0XLTKFk2gY0I+EKFB3Exd
 UpNLMuB8gkkISfIhaBv9F+vQPu5k8pWMgzD3x7JCtlT9g+ldLYCI96qnTMY26ZNxa3J0nmBktSS0P
 GCLsHNPwq2WNf/51stBHnz5dT9RdoK7xBk16ltoTf9ZTtbrb/1UhBBC5XbI93BKsGrRc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i4wak0Zw72fBP2d8XJx7dJuRwKqclZ2Z4r71a+Dp/QQ=; b=BBHGuU5ZumjLcE8pv5UCB9Lbi8
 UvrNl1564eVbJ6k09qxOTvZNxK3C/dne6a0h2VlAo8JvY5/0aaUId+XI6ca4dHps6pbW/Qgy4lUxy
 U1hgN4vzcYyq4dXHrGpOfEJndkTC6PUPDbLa36s+HJ3kR1uPaoZKUXMe6eRLyRNT9Mpc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kMwrY-0093fk-N2
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Sep 2020 17:23:03 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 861582080A;
 Mon, 28 Sep 2020 17:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601313765;
 bh=fz2lDG3BfSoRUxbEjDV3BhINBXvyXN2GInHCeg0Tsws=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IEpTh4jM3F5JNIjMHz0qTaAiZ0JAjlcX73GNLKLrQhiC0JJLiM8VbwaE8PVrDH0W2
 zooI9O300LaM0a7Ds/n+Jc1k9MCG8NyDbw7u3OPCTzNqvkpftzD3YDU/m3qVYfxQNc
 0YNq0mPC3fEnniLpvbUNNr2fopDFdukDTLaFg5WM=
Date: Mon, 28 Sep 2020 10:22:30 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200928172230.GA169646@gmail.com>
References: <20200928091254.60750-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200928091254.60750-1-yuchao0@huawei.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kMwrY-0093fk-N2
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to check segment boundary during
 SIT page readahead
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Sep 28, 2020 at 05:12:54PM +0800, Chao Yu wrote:
> As syzbot reported:

Please include the Reported-by line that the syzbot report said to include.      

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
