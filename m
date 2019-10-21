Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7B7DF6C4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Oct 2019 22:29:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iMeIg-0001e7-M9; Mon, 21 Oct 2019 20:29:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iMeIe-0001dp-Vl
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Oct 2019 20:29:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RPCBKJH70gQnClRxfmy88JNeAqbAjbr4b0JuKgAArfc=; b=itqzm2gGU1cbM+nPr5bOD4ou8i
 3sBul75dEDVzUIEUFmzkqf0u8myvw/sbiwc6CChtGWZhprMQjqtcWwhzXzsG2E3SztNg5zbzcObr4
 sUFt+LhkbooZ2O/Y6Hwhc8Wtx69oBtXnySQ0ZyGla10QFYQmzzzgQihzGOY02223SvdE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RPCBKJH70gQnClRxfmy88JNeAqbAjbr4b0JuKgAArfc=; b=cpfs25MSV3c5f/aXRmWdguZwBn
 WCGbdNc9qFDIlud60fh5Lbppd9T1m6PALLU3ihB2BBEMuGcmPu48enQaCyZKrp5OYDkZpq5DVS66S
 1KMKEhei5YYRwXuUvyaGGTgP052UOFd+N13js+IF+DXip00+gOWZXSosLNgyEoyhBKgw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iMeId-00GBFP-So
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Oct 2019 20:29:08 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 208302067B;
 Mon, 21 Oct 2019 20:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571689742;
 bh=CDmrDmHjELBAUrBY8WbscTUpVT2+8e+2NK3PWI6nzro=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S5qbRv4LpeWBtE1dFXuPvLGMU43VkUsF413qTJMikb0SUYiAKqsBz8H+B4RxsiHTy
 K1ecBLlwg21XreJQkSZGAvy327GVxorLtA7PpSuihTbnVPMp+Ke40BFo+vIQtlH4Ir
 VL3jCpymD+r32LxMYYDdh+LA+19mI3hv9+hkOtOU=
Date: Mon, 21 Oct 2019 13:29:00 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <20191021202859.GD122863@gmail.com>
Mail-Followup-To: linux-fscrypt@vger.kernel.org,
 "Theodore Y . Ts'o" <tytso@mit.edu>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org
References: <20191009234555.226282-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191009234555.226282-1-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 1.7 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.8 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iMeId-00GBFP-So
Subject: Re: [f2fs-dev] [PATCH] docs: ioctl-number: document fscrypt ioctl
 numbers
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
Cc: linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, "Theodore Y . Ts'o" <tytso@mit.edu>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Oct 09, 2019 at 04:45:55PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> The 'f' ioctls with numbers 19-26 decimal are currently used for fscrypt
> (a.k.a. ext4/f2fs/ubifs encryption), and up to 39 decimal is reserved
> for future fscrypt use, as per the comment in fs/ext4/ext4.h.  So the
> reserved range is 13-27 hex.
> 
> Document this in ioctl-number.rst.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  Documentation/ioctl/ioctl-number.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/ioctl/ioctl-number.rst b/Documentation/ioctl/ioctl-number.rst
> index bef79cd4c6b4d..4ef86433bd677 100644
> --- a/Documentation/ioctl/ioctl-number.rst
> +++ b/Documentation/ioctl/ioctl-number.rst
> @@ -233,6 +233,7 @@ Code  Seq#    Include File                                           Comments
>  'f'   00-0F  fs/ext4/ext4.h                                          conflict!
>  'f'   00-0F  linux/fs.h                                              conflict!
>  'f'   00-0F  fs/ocfs2/ocfs2_fs.h                                     conflict!
> +'f'   13-27  linux/fscrypt.h
>  'f'   81-8F  linux/fsverity.h
>  'g'   00-0F  linux/usb/gadgetfs.h
>  'g'   20-2F  linux/usb/g_printer.h
> -- 

Applied to fscrypt.git for 5.5.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
