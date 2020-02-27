Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4AE1725F9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Feb 2020 19:09:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j7Nay-0005F3-4d; Thu, 27 Feb 2020 18:09:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1j7Nav-0005ES-VV
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Feb 2020 18:09:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T2DgPasZaKqXY38SsbWZMW09vvlgW7OiJjWcmnzXVkY=; b=FFeQlpra2GuORPApOyPzEprL8X
 3jDpdWcIQEW8HHv+hFo/YoBzhcPosbT7FT59TJx0dYducRfSymrddoCp9rhnsmgz+EFY5PHt9G4ui
 kzJoUSA/3Zksj5ElWT/SC3gdG0+vb3kfE4gL5FZ1Lr1TZyWpAIJraQcXqF6zLUa3qrRY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T2DgPasZaKqXY38SsbWZMW09vvlgW7OiJjWcmnzXVkY=; b=JT/bJOO9LplS2iYu7ZfHtmbjqb
 XsYXUHeLpw/iBIsQyqhxOLEa1B173YHQX00WJVYoC12lGAS5odJEM8bOPApfsFG9KzsuEBUXU8l1G
 lZPI9nI5HNn8f2faunxHekpJRlxjel1+OfUdRQYTVP+vOKml6FDg/YiywFoCZWapnT5g=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j7Nat-007rh0-7c
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Feb 2020 18:09:09 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7192D246A1;
 Thu, 27 Feb 2020 18:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582826936;
 bh=dXQov0c5SHa7a5/MJ5r0DV2WwQZReuL9COs8hBJiF2E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Le5O4PDK7+T+HwHtVcYqlEDyynSKBdFqenhx4s0oUbB1Gb68k4LkbRWR0xWxVXTl/
 leLjrUsmQ+7sXRLAfdgg+Pt5eZk6bW4FvLETz5N3LZxU02eetAozKkskr0mzUh3os3
 46UlmaMqy5w23gG9h2qPooM3oKu8FmKROOdCzugw=
Date: Thu, 27 Feb 2020 10:08:54 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20200227180854.GA877@sol.localdomain>
References: <20200221045037.154450-1-ebiggers@kernel.org>
 <40698654-6332-f2b6-bb32-5ae8825fa66e@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40698654-6332-f2b6-bb32-5ae8825fa66e@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1j7Nat-007rh0-7c
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix leaking uninitialized memory in
 compressed clusters
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Feb 25, 2020 at 04:53:02PM +0800, Chao Yu wrote:
> On 2020/2/21 12:50, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > When the compressed data of a cluster doesn't end on a page boundary,
> > the remainder of the last page must be zeroed in order to avoid leaking
> > uninitialized memory to disk.
> > 
> > Fixes: 4c8ff7095bef ("f2fs: support data compression")
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> 
> Reviewed-by: Chao Yu <yuchao0@huawei.com>
> 

Jaegeuk, can you send this fix to Linus for 5.6?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
