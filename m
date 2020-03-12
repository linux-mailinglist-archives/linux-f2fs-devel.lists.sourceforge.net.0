Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1C9182B2D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2020 09:26:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jCJAx-0001uD-CY; Thu, 12 Mar 2020 08:26:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mtk.manpages@gmail.com>) id 1jCJAx-0001u7-0a
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Mar 2020 08:26:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Cc:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VOXwvXmhViXjWlgJNON6/RWwRCogM7s+tZi57Naxvsg=; b=Y2bxzDgXl8duDvqY1Zy1Mc0UTt
 2XP3pHqrhVXAYfqpLjoYTsx48YSj5PZvQUn/Pth4VAX9H/fpM7ftMSnYOQonYBdcPIvoSG9onPktT
 6tfP8hh/Y56hUaEM3z7TDp0wuerzKv2GCDnCWw5ygBgoI0urmK0RBM85BUfrEEcEx8i0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Cc:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VOXwvXmhViXjWlgJNON6/RWwRCogM7s+tZi57Naxvsg=; b=SbZ7yOJ3s0nw9eQiBcBY+jCEwD
 QbVJTyKb7tKLO1wXmcYyjVTgicDnI8ekbPkhhEOe6WT0h1LohOmFOM/7K2DE6+W6LIuc67t49ELhU
 L89AAes8vPNT+w/YgbJQjO3qxY4vXdTxBcz5HIPagpCRfYTulZ1LeudOPX9BFGmaK0YI=;
Received: from mail-wr1-f65.google.com ([209.85.221.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jCJAv-00GUAi-0m
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Mar 2020 08:26:42 +0000
Received: by mail-wr1-f65.google.com with SMTP id v11so6209143wrm.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 12 Mar 2020 01:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=cc:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VOXwvXmhViXjWlgJNON6/RWwRCogM7s+tZi57Naxvsg=;
 b=mhVHewWmUn9cWoWob2kV9/oNAU+knm6pV/tEl5GH+wuUorgZf1lRoH9Y/KvDbdViVr
 +ENcNj2WPCz6KYNCfuWcVXHebOBdQBZHRj3gmvwpIr8LOqlAmo+TDDET0jGelOdAYlfD
 9aoqakgG+beS11JnyZnpnwEJLnAF+opgngnnov6QiKgiR+ZvawDV97f6S1H3UE0kgTx2
 iadbe6mRyYqUnadO6XgrWIsfmd8CBhFLh16oc1yLMdebAfvv+yDSGeSiqfqwlBer7cVM
 D92qxmrk56JOJwuV8yUQcxNuW6PDmtkresyqqlRZCSKBbGFZTEZhiWu6Dvi3vFO8OXQM
 5w2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:cc:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VOXwvXmhViXjWlgJNON6/RWwRCogM7s+tZi57Naxvsg=;
 b=CmxRtC4dRqpE2P5TewWYpdGwNfspVUxR3aCUevNMAhQrszC/yvzbXTceXnhA79atXG
 x8msdHdpnjNioeUeKH40uqvYzbBWDYixsBW+uKkaxLEJvVHus7AnK59LlEKkMM/tKx63
 GzO1spU4+Xqb6ndDZ6mf7IfDvSocjYC3B1GTHIfAJnt0cdZuYma3SRhMbT0r2nZUzfQB
 RDEt9BoJ1rLCe6Li+N/F4Feczj9+UHEDr+sPRCnS/6wZGocXfvz5sjVZYRRGmrXNRIUy
 xGXPLGAafh2ko0M4n73r4orHr3bUpRnE+z38Wx5OOcVGsRtNfIWljPGgzjvcyKgBWaz1
 tfKA==
X-Gm-Message-State: ANhLgQ24IxJTNvTv6AJfHFG3bSI1VLU6ZNsXyKkxFYq7lCaDDx4uN3Nl
 jCWKqrkfd+iZjvWhzOhAAuk=
X-Google-Smtp-Source: ADFU+vvaWP4xGGNO/Jiptk/ZTdyzvml108TVAMDjhO6ya8t9Wsf3jbbjroPrwuYCL6+p5Y9jk1R+GQ==
X-Received: by 2002:a5d:6782:: with SMTP id v2mr9485138wru.218.1584001594497; 
 Thu, 12 Mar 2020 01:26:34 -0700 (PDT)
Received: from [10.5.49.236] ([195.171.175.163])
 by smtp.gmail.com with ESMTPSA id b16sm71865540wrq.14.2020.03.12.01.26.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2020 01:26:33 -0700 (PDT)
To: Eric Biggers <ebiggers@kernel.org>
References: <20200128192449.260550-1-ebiggers@kernel.org>
From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <451297df-2371-336e-d058-4cd6b4ed9754@gmail.com>
Date: Thu, 12 Mar 2020 09:26:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200128192449.260550-1-ebiggers@kernel.org>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (mtk.manpages[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: man7.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jCJAv-00GUAi-0m
Subject: Re: [f2fs-dev] [man-pages PATCH v2] statx.2: document
 STATX_ATTR_VERITY
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
Cc: linux-man@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, mtk.manpages@gmail.com,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello Eric,

On 1/28/20 8:24 PM, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Document the verity attribute for statx(), which was added in
> Linux 5.5.
> 
> For more context, see the fs-verity documentation:
> https://www.kernel.org/doc/html/latest/filesystems/fsverity.html

Thanks for the patch! Applied.

Cheers,

Michael

> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  man2/statx.2 | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/man2/statx.2 b/man2/statx.2
> index d2f1b07b8..d015ee73d 100644
> --- a/man2/statx.2
> +++ b/man2/statx.2
> @@ -461,6 +461,11 @@ See
>  .TP
>  .B STATX_ATTR_ENCRYPTED
>  A key is required for the file to be encrypted by the filesystem.
> +.TP
> +.B STATX_ATTR_VERITY
> +Since Linux 5.5: the file has fs-verity enabled.  It cannot be written to, and
> +all reads from it will be verified against a cryptographic hash that covers the
> +entire file, e.g. via a Merkle tree.
>  .SH RETURN VALUE
>  On success, zero is returned.
>  On error, \-1 is returned, and
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
