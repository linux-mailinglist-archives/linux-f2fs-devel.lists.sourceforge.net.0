Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B047521AA15
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Jul 2020 23:59:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtea0-0002Xh-TM; Thu, 09 Jul 2020 21:59:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jteZz-0002XT-IB
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jul 2020 21:59:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UpizV3eUjznsRXHyyR7jt8g4SPMGiQiskfyP9tnifAY=; b=OWjqSBuqb/zAahWAVmSOsL3oVl
 j3uNlz/owza7bV4jsfYDoU5RbXPtADoGDz7WMp8TPMYGlRXkClp15l8Mpl8M8e/o2iujWq1p95Z1D
 KrBB5vqAaK4iptHbgyrylJnE8V4J73JOZ4/eczWuHoNNM5/0fGZ09p+2R/jdfSOSbKsM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UpizV3eUjznsRXHyyR7jt8g4SPMGiQiskfyP9tnifAY=; b=ZDO40ND1NZKs6OIEybAaBRAQbP
 DKjJNO3cu4ZreOJ0FzqZNUE+H2MrZVdaepNad24oPftOwV/k58Ot3a61bryfRynv+VrzBJ/zojVaI
 0a7fz5ULx6gdgJhnAA/IGfX6XuGPCqeu9GL8lDN7bAqcDT4O1v2vWNIr2qXMHqQGK2FQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jteZt-00Fbf7-PG
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jul 2020 21:59:43 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F1C8120672;
 Thu,  9 Jul 2020 21:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594331965;
 bh=PcF5ZLXsR+T1pZugOPirxGijT4fToIElCeEXDGjGu5w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oby6MxtV20D13kOVSTaJgUYG5nAAo8sH23d7/SoK4aWHc7Ptd5247NMgYqJyG6nrH
 XhStnvd4gWMxCHoszwNn+BzsvvVto+8XUWVlYPw9Oku9bfgcfXmdp9HnZIWwWHGC96
 +u803Hssn6Q/Pn1ZsRhLkOHPWPzbQiigBf37ZXFg=
Date: Thu, 9 Jul 2020 14:59:23 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200709215923.GD3855682@gmail.com>
References: <20200709194751.2579207-1-satyat@google.com>
 <20200709194751.2579207-4-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200709194751.2579207-4-satyat@google.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: get_maintainer.pl]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jteZt-00Fbf7-PG
Subject: Re: [f2fs-dev] [PATCH 3/5] iomap: support direct I/O with fscrypt
 using blk-crypto
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jul 09, 2020 at 07:47:49PM +0000, Satya Tangirala wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Wire up iomap direct I/O with the fscrypt additions for direct I/O,
> and set bio crypt contexts on bios when appropriate.

It might be useful to mention why the calls to fscrypt_limit_dio_pages() are
needed.  (It's because the iomap code works directly with logical ranges, so it
doesn't have a chance to do fscrypt_mergeable_bio() on every page.)

> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Satya Tangirala <satyat@google.com>
> ---
>  fs/iomap/direct-io.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

You probably should add linux-xfs@vger.kernel.org to Cc, as per
'./scripts/get_maintainer.pl fs/iomap/'.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
