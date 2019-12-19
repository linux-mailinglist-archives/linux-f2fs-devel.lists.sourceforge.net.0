Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 454CA126637
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Dec 2019 16:56:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ihyAV-0008GQ-L6; Thu, 19 Dec 2019 15:56:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <rdunlap@infradead.org>) id 1ihyAT-0008GI-Ma
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Dec 2019 15:56:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rjL7IN7Ds1hUfh0T2ILGQLcCmbkXt5wirx9kdENfl00=; b=MUTRDtWT4xITmm17oYj3twvclT
 iZib4Vgygr2VSEVJXnsBpeCw9zDX6HtdeaYYJNEwf/OFLp0r9qI90MCveHGzN+hJwtNqFiX5EEUnJ
 b0o2VFHKS0REJuyqsfC4gSysTXaVk1iamGAIvNOqdCIj0s8eIFzX8nKF7ZJc2UNWeRQc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rjL7IN7Ds1hUfh0T2ILGQLcCmbkXt5wirx9kdENfl00=; b=MmkHjZyo+31/qF5z64xKkGfkCm
 2rzSxc139Pm6y987faaLfQtXWOKElBewPthk8LbLrJngaS52IBz43J9MAWn63hc7dQpeBzhF2IPAV
 5zUmj8IHNS67qVy7tT79ixlvECIlRfwtnw+0/t7M86MJKDZJfUvE00r/WYME+VDc/few=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ihyAR-007JzO-TP
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Dec 2019 15:56:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rjL7IN7Ds1hUfh0T2ILGQLcCmbkXt5wirx9kdENfl00=; b=UnQYZufnxzgPbRVfWvqiwp3VT
 Gq/U5zKQJ6Zy8alLY8Y78xJdR3TDX8kPJFQY9TE044lcc0E9dRPWXDPkccrRDsKa/h+aWs1VfPhT/
 Qe41rZNjF/hqqbFWRVgHS196s91l32U71Hmn6fHDzBKe5BccQbaP6Z1qTDm9zE8NA0hf5RQ0Rxsnd
 HUyMAQuctOqu4Kw2/kJPURqH7NC2F7Ui144xi8J2EM5/dj7TlEfC0Qec4vFUW4ed+zf11uXhx8DV8
 eQqDS1Fhg9A5IFLzuB5W51hRK3tZn4tZergh13JvOmOAs8h+vjYMmrfNgnYTgwROzCSdd5pKe1peo
 lx9Btsyng==;
Received: from [2601:1c0:6280:3f0::fee9]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihyAD-0004jp-MR; Thu, 19 Dec 2019 15:56:33 +0000
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20191219181125.273d62b3@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5306838a-5f25-a2d3-6b2b-884f4287710a@infradead.org>
Date: Thu, 19 Dec 2019 07:56:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191219181125.273d62b3@canb.auug.org.au>
Content-Language: en-US
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ihyAR-007JzO-TP
Subject: Re: [f2fs-dev] linux-next: Tree for Dec 19 (f2fs)
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/18/19 11:11 PM, Stephen Rothwell wrote:
> Hi all,
> 
> News: Tomorrow will be the last linux-next release until January 6
> (unless I get very bored :-)).
> 
> Changes since 20191218:
> 

on i386:

when f2fs is a loadable module:
ERROR: "__udivdi3" [fs/f2fs/f2fs.ko] undefined!

or when builtin:
ld: fs/f2fs/file.o: in function `f2fs_truncate_blocks':
file.c:(.text+0x7bf7): undefined reference to `__udivdi3'


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
