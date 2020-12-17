Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F34A2DCC72
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Dec 2020 07:27:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kpmkt-0006IE-KY; Thu, 17 Dec 2020 06:27:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kpmkr-0006Hx-Mq
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 06:27:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6O1PssmJXiD5G9fUigcu8UF/CqjsClUThY8ahTzPE5c=; b=ipDNnOhNjQF+5Hl7+Ai8tUsF90
 TSeK7svbUVVxV0HVwQQXmb5JxqdDyN1tds2D4+DkgoVctLi+kB1DCqEBzTGZ0wh74DA0a1jn4Hyzp
 O5RyFzF40nuKFf9C4uKTfyq11VGvBSi8Zyamu/1x3zZCgw1l+sXeFnhwiKXr93H3asoM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6O1PssmJXiD5G9fUigcu8UF/CqjsClUThY8ahTzPE5c=; b=EN32qVo17m0NPJ0cp9AesHuZaD
 gy3DrU63Au61AmyzPrCw0ERWDFPoDC8YHNfPftBLvPyU/6PQWjFHY+oilfEyo+YMhRk78wab832aG
 rcQrb1T9stlbbh50poFXjnkR57ej5MWlvkWqsC0KVErJvYqdhhXq5oheJ0iM6yEOAFns=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kpmkn-00GyiD-98
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 06:27:13 +0000
Date: Wed, 16 Dec 2020 22:26:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608186415;
 bh=blQ9TjwzSGVLu2WJ7JajS1sME1qOEHQhDxH7XzxrnCo=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=M76Uw/Y5SCSdFGzGtff019b1daVNyBX3GI1Z+gAvdC1ZxfQq2Vf5xqDvxQqyBgY1M
 anTJt88QHNkAFzTWzu67r8X8qf8f5bVRX20d+uMVB59J6BybkrYSoMcDeHGzjwSeZM
 jF8QE5rKfb+Vb0PyUFprBGHqLADXUUn/zObT0lf1ScoMw2RxlUlMHv5NY4aWcGnRi6
 /Vll/EDqWrCgIbJckZbNW8/V6OkpxeeJCIQa+renh7Ja/+vMniqNvext6Dv3PZDo9+
 vc2Qv1VrPyxMxXp9s73NjV3bCFxr6NSm4FA3X/fkNL9tee2hDTyJ1NowpFMOiuzSHy
 23/cpgB1asdEQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: "John A. Leuenhagen" <john+kernel+f2fs-devel@zlima12.com>
Message-ID: <X9r6LjHCmeYv42nS@google.com>
References: <20201215015800.u37ixmukkwihmxi2@Lima-1.maple.zlima12.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201215015800.u37ixmukkwihmxi2@Lima-1.maple.zlima12.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: zlima12.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kpmkn-00GyiD-98
Subject: Re: [f2fs-dev] [PATCH] mkfs.f2fs: Fix behavior of -g option to
 match the man page.
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

Hi,

On 12/14, John A. Leuenhagen via Linux-f2fs-devel wrote:
> The man page states that simply specifying the -g option will use the
> default Android options. However, mkfs.f2fs currently requires the user
> to specify `-g android`. This makes the behavior of mkfs.f2fs match the
> man page.

I think we need to fix the manpage, since this requires to change all the
use cases in android. :(

Thanks,

> 
> Signed-off-by: John A. Leuenhagen <john@zlima12.com>
> ---
>  mkfs/f2fs_format_main.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
> index 03eb748..8db2191 100644
> --- a/mkfs/f2fs_format_main.c
> +++ b/mkfs/f2fs_format_main.c
> @@ -129,7 +129,7 @@ static void add_default_options(void)
>  
>  static void f2fs_parse_options(int argc, char *argv[])
>  {
> -	static const char *option_string = "qa:c:C:d:e:E:g:hil:mo:O:rR:s:S:z:t:T:U:Vfw:";
> +	static const char *option_string = "qa:c:C:d:e:E:ghil:mo:O:rR:s:S:z:t:T:U:Vfw:";
>  	static const struct option long_opts[] = {
>  		{ .name = "help", .has_arg = 0, .flag = NULL, .val = 'h' },
>  		{ .name = NULL, .has_arg = 0, .flag = NULL, .val = 0 }
> @@ -169,8 +169,7 @@ static void f2fs_parse_options(int argc, char *argv[])
>  			c.extension_list[1] = strdup(optarg);
>  			break;
>  		case 'g':
> -			if (!strcmp(optarg, "android"))
> -				c.defset = CONF_ANDROID;
> +			c.defset = CONF_ANDROID;
>  			break;
>  		case 'h':
>  			mkfs_usage();
> -- 
> 2.26.2
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
