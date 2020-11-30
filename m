Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 596DF2C8C40
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Nov 2020 19:11:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kjneQ-00057e-RV; Mon, 30 Nov 2020 18:11:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kjneF-000574-SE
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 Nov 2020 18:11:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7OtMU+UNidH4YhcAm3GVJIkABsCgtvT60Z/FlJlIpbU=; b=bxN2kIJXmxr1it+9hMruUUFwcd
 WWnSb2qicgHX5N+jeqAMXRINPfCCeJOlkyfomBVz3Cfjol0tBVouphQbsixjRyBBLmL6rGm4GMa69
 shyQ/p8e5Y7aJ+Q19UtnYy1OAZW6dIUQisTI4ozUxSWeDupLHoN1C20xQietrOs7oz+E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7OtMU+UNidH4YhcAm3GVJIkABsCgtvT60Z/FlJlIpbU=; b=fVX21oLdRaeFjAXD8QXUZMlaHI
 hy8YuhD1ILsiyf5UN8k4jFHifV8L2goaVaJoO+SmBmj1wdXK4vKrBV5loy8dl/vFNNbhYo+QPuDWL
 T0f7SZyDAKuUxw2Rk6jth8LE1UJ3QMkF3gmgrAqw6xqMCDfiFAfS+y6uctRWvOhWqa/o=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kjne8-007EL1-Q2
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 Nov 2020 18:11:39 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2EC1E20789;
 Mon, 30 Nov 2020 18:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606759887;
 bh=7e7+SBM2J+NolPFM4F9UZ//nzhmt92jdOSBYye2Blxg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KhG2M4cfdNTD8JPugl1EYr7EV8BoXU3K+ZSBNZ0irt7OsAH4vPmbELGk04Pi75ZSs
 lRXADg3NNZnZ24u3CK7vHXASbHPT9iQm2fi99eyvAB8a64eSYBq6xRxFHkt0iFT2X6
 qu59WKuEIuShOAkWomSA2oag6biAtaouIRFleD6E=
Date: Mon, 30 Nov 2020 10:11:25 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <X8U1zbBa4IaaSYXV@sol.localdomain>
References: <20201126103709.80006-1-yuchao0@huawei.com>
 <X7/sCLnVPOjkC9DI@sol.localdomain>
 <7ecb947e-2f8c-abd7-c116-c82c474fded7@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7ecb947e-2f8c-abd7-c116-c82c474fded7@huawei.com>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kjne8-007EL1-Q2
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress: add compress_inode to
 cache compressed blocks
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

On Fri, Nov 27, 2020 at 09:01:47AM +0800, Chao Yu wrote:
> On 2020/11/27 1:55, Eric Biggers wrote:
> > On Thu, Nov 26, 2020 at 06:37:09PM +0800, Chao Yu wrote:
> > > Support to use address space of inner inode to cache compressed block,
> > > in order to improve cache hit ratio of random read.
> > > 
> > > Signed-off-by: Chao Yu <yuchao0@huawei.com>
> > 
> > If the file is also encrypted, are the compressed pages that are cached still
> > encrypted, or are they decrypted?
> 
> In current implementation, they are decrypted in cache.
> 

One of the things the FS_IOC_REMOVE_ENCRYPTION key ioctl is supposed to
accomplish is evicting all the pagecache pages for all encrypted files that were
using a particular key.  This happens as a consequence of the ioctl evicting the
inodes that were using that key.  If the user is also using the init_on_free=1
kernel command-line option to enable automatic zeroing of all freed memory, that
should cause those inode's pagecache pages (which contain decrypted data) to be
zeroed, so that they can't be compromised later by an online attack.

This new filesystem-wide cache containing decrypted pages might break that.  It
sounds like when an inode is evicted, its cached pages won't necessarily be
evicted from this new filesystem-wide cache.

Can you ensure that pages get evicted from this new cache when the inode to
which they belong is evicted?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
