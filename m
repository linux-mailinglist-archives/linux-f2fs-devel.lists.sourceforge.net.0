Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 01658203D8C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jun 2020 19:11:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jnPyj-00021M-K0; Mon, 22 Jun 2020 17:11:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jnPyi-00021C-1o
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Jun 2020 17:11:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m+OzaO3S7OTYVqnD3C5o2+x25pdJgEyYDt/FtpPm7gw=; b=aAJbGl1ILEp344dq9vleLu/LP1
 fJrRfq1Uv+CsS/LK4V8aiXapE4hUF7NjeapLKKKSQzkC+8u3wG06qnUpKsbYJsEz72Ot1b1xb9bTx
 o4wUeMm8QLChn4vuzd6OkJU56blvy1ZY3DDa2H/twvxEBrTdH+NsU1iWNQCnmzCAuJYA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m+OzaO3S7OTYVqnD3C5o2+x25pdJgEyYDt/FtpPm7gw=; b=UWZOBs+6hTziDj6kIhWVdWgRO8
 M2Ox5StCnY9pKlVw5yi4gjijYm2CLCYbdhFm1EUPx0/oHTOa4UMHUxitekoUD+GVn2hJZ+A1x08Hi
 qpJrVLuchqPAorf8pt7txCJCQhvZ3ovT1uvwi7IYQvCECBwOQCqJusz6F+W9WD4a1eps=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jnPyf-00EALz-Uc
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Jun 2020 17:11:27 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5B05B206BE;
 Mon, 22 Jun 2020 17:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592845868;
 bh=HJacg1CswmNF3NpHWMoLOKu4HVPQzSnkMZkipiswgmY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EUiIvmsEv5eUAyUmW+zTnuaaQQgmi00zA8f7EqyvKapnD+rSfpYaOrcnJ4ZONfAMR
 qCOC//YNf7AGFyv9UhWjzEDBnLNoA/b7crpdkflQL8QjFmGJiFiFcokHl8KvHu2uHw
 +af/ORyLIdekoLm2Xbkk6opyRRuYkR+6B1CaA2Es=
Date: Mon, 22 Jun 2020 10:11:06 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Message-ID: <20200622171106.GA192855@gmail.com>
References: <20200622073907.7608a73a@lwn.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200622073907.7608a73a@lwn.net>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lwn.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jnPyf-00EALz-Uc
Subject: Re: [f2fs-dev] [PATCH] docs: f2fs: fix a broken table
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-doc@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jun 22, 2020 at 07:39:07AM -0600, Jonathan Corbet wrote:
> Commit ed318a6cc0b6 ("fscrypt: support test_dummy_encryption=v2") added an
> entry to the massive option table in Documentation/filesystems/f2fs.txt.
> The option was too wide for the formatting of the table, though, leading to
> a verbose and ugly docs-build warning starting with:
> 
>     Documentation/filesystems/f2fs.rst:229: WARNING: Malformed table.
>     Text in column margin in table line 126.
> 
> Fixing this requires formatting the whole table; let's hear it for Emacs
> query-replace-regexp.  No changes were made to the actual text.
> 
> Fixes: ed318a6cc0b6 ("fscrypt: support test_dummy_encryption=v2")
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
>  Documentation/filesystems/f2fs.rst | 312 ++++++++++++++---------------
>  1 file changed, 156 insertions(+), 156 deletions(-)
> 

Someone already sent out a fix for this:
https://lkml.kernel.org/linux-doc/52f851cb5c9fd2ecae97deec7e168e66b8c295c3.1591137229.git.mchehab+huawei@kernel.org/

Is it intentional that you're sending out a different fix rather than applying
that one?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
