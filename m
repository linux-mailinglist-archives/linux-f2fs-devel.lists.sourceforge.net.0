Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCCA3B9537
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Jul 2021 19:06:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lz094-0005hR-Bq; Thu, 01 Jul 2021 17:06:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lz092-0005hI-LT
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Jul 2021 17:06:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M+MUTkbl33l/zYfzROvNXm7uTr09NqF1/lzODpUK0Y4=; b=R4sFYFsrfsAobBImNDo8SDR/lD
 2ExOMG4Mvu/Kzlps2givkHI02VIWL/LbA6Rg4+HCOZAtpSby2w75hJc0ud+Ab2cLkTiwZIihUhvsO
 ZE1cqiES4mlduHVyVW7BQ4C1tvOq1OzRAkwidUGWxiUXTvQrrFiXwAEOaCbQZDJ/ivws=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M+MUTkbl33l/zYfzROvNXm7uTr09NqF1/lzODpUK0Y4=; b=lVLSFIfu0+66GqIPOKHnVcl5oT
 jz2jXunGhV6/1e6U1RtAx5Ttl+BLqu1mKd4t0IxyikfjYBqTH8bpEhg/jF4uc3k+b0wP2JxRLrNeF
 yBoaiwD2Q06s7Xie1eRQ8ZpArgOzHbULmfjV4rEXUO+pGhxSbbsG80ggAa0Chi2hbUK0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lz08t-006GrP-EC
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Jul 2021 17:06:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EBDDB613FD;
 Thu,  1 Jul 2021 17:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625159178;
 bh=No+q1ZMjubrUNTwpKPGyFFU9B7edck5JoD9FOdbEDxY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L5nFyjaMH3AQ6KPcVa5y/76EFvNwQYOPQ/zKhVzTpwwm7+NAIYTNfi75cJm9xhtyp
 9F81xvcbRyBAY8P47PXz3rBAb60tXYuSlRUoUSw8E+3bnxuFdy6Pfr0JVALWyDsjvk
 f+t72Dxugtd3TTqSHsU2daGpDwuZh8iphGFka+rblcJL6YIllUU8V/z4vnwKVkTVAs
 9qCDGWrUrBBoBEFlZXIFoPfulYXkibTwvNJVXRUAUWp7zfYJsWcu2OWQE6XqPUmtkl
 xufyhcBHFMsmZzXDe5CUpIsoiqE5/3nZfxTDBRt36zh9tCdWz+E4utJQWMD/y+A7/K
 IJGsSjacTjQ+A==
Date: Thu, 1 Jul 2021 10:06:16 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: changfengnan@vivo.com
Message-ID: <YN32CHiLz0lbpwMF@google.com>
References: <003001d75913$aff3cc40$0fdb64c0$@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <003001d75913$aff3cc40$0fdb64c0$@vivo.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lz08t-006GrP-EC
Subject: Re: [f2fs-dev] f2fs compress performance problem
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

On 06/04, changfengnan@vivo.com wrote:
> Hi:
> 
> I've been working on f2fs compression for a while, I'm confused on f2fs
> compression performance, after a while reserch, 
> I found some problem, maybe need some discuss.
> I use AndroBench test performance on mobile, after enable compression, the
> benchmark scores have dropped a lot.
> Specifically:
> 1. 32M sequential read has dropped to 50% of original. Test case open file
> with O_RDONLY|O_DIRECT, and set POSIX_FADV_RANDOM, the major resaon 
> is disable readahed. For now,I didn't found any patch can improve this. 
> 2. 4K random read has dropped to 40% of original, after merge `f2fs:
> compress: add compress_inode to cache compressed blocks`,
> significant improvement in random read performance, up to 90% of original,
> maybe more.
> 3. 32M sequential overwrite has dropped to 10% of original, after merge
> `f2fs: compress: remove unneeded read when rewrite whole cluster`
> up to 30% of original.
> 4. 4K random read has dropped to 1% of original, yes only 1% of original, I
> found  open file with O_WRONLY|O_DSYNC|O_DIRECT is  an important reason, 
> every time sync a compress inode need do checkpoint, after I remove
> checkpoint on compress inode, up to 10% of original. And I think major
> reason of this
> is we need read whole cluster and rewrite it ,but I did't think of any
> method to improve this.
> 
> I want to know is there any idea can help to improve this.
> And I want to know do we have goal for the performance of compression, is it
> possible to achieve the original performance?

Could you please check compress_cache and extent_cache that can improve read
performance? Both were done quite recently.

> 
> Thanks.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
