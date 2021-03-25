Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDCC349A9F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Mar 2021 20:44:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lPVuL-0004n4-Um; Thu, 25 Mar 2021 19:44:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1lPVtK-0004f7-7O
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Mar 2021 19:43:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V//Mv4IG0rWO5ivK6wzM8rWbkmdCWaThS7HF5wRCS24=; b=O+1SEmsAU8wmUPBcOoheorKNOI
 wnY4MBk4CDXyY5XLg9jXv73NMrf9G8IJrFawRr1GSMPvOaVGjGVjER5OJZ8McZjsGtcN7tLaACaq/
 uWjBFmrVd6EzzpcBYwNEzLEmO5aWdYkn6eculkyHTGKghE9A5Tb1TjCBKSjLmXvzLRQQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=V//Mv4IG0rWO5ivK6wzM8rWbkmdCWaThS7HF5wRCS24=; b=e/2cd1AO+1ko6UWNk9Ie2LvgtP
 OHj6MIk2PBsuNI5Vy6FMoMnudV288jtU/S3vrmz6FjzgY+9P/gLrhytwLMB9JK73Vvk32/VqEGa9I
 jXaUXMCUWmQYMfd3mttKD3wr+/F7L2JGUEdYVzTV0cO+eUmkiexwOaW5kst/MdeqGNZo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lPVtB-0005vJ-Gb
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Mar 2021 19:43:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD9D0619C9;
 Thu, 25 Mar 2021 19:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616701404;
 bh=1r+GeFGCMbDDIXeRYKJ4Hm8F51/bPaP4XF8mxybzx2A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JGP1DZMB24r/DF69LXH/qos9xWt+IB2JQD2/pxxusRzuFj7yp8XP9X6ZX11xq7UI3
 SqgDqD5EeTOq9jkARGuGO2Y0JjS2eKLD1lvQ4i83zw0FkGZLqPEa3b/DEr7vJrFQWM
 rHRuNJnaf0MP6CSUnAClzOox/qpLeEiVup7Sm+LLExLdFtmcCn/BLnD9OtQ7Oo6VBs
 d7Fde1+FRBsdZGBPah8hBCy9p2ot8rPBJtccyc2DJhao2COhMdQJ//x2+YRTz5xxdN
 EXnfAdx8UBx9lXiF0DKxfcGOPjRXFd0HRnsj3Zr8bwt/TO151jqIYDrDv/W5Pcm7br
 j61kk91T6iVTA==
Date: Thu, 25 Mar 2021 12:43:22 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <YFzn2rbN6P0LvdA+@sol.localdomain>
References: <20210325000811.1379641-1-shreeya.patel@collabora.com>
 <20210325000811.1379641-3-shreeya.patel@collabora.com>
 <YFziza/VMyzEs4s1@sol.localdomain> <878s6bt4gx.fsf@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <878s6bt4gx.fsf@collabora.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: collabora.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lPVtB-0005vJ-Gb
Subject: Re: [f2fs-dev] [PATCH v4 2/5] fs: Check if utf8 encoding is loaded
 before calling utf8_unload()
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
Cc: tytso@mit.edu, drosen@google.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel@collabora.com,
 adilger.kernel@dilger.ca, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 andre.almeida@collabora.com, linux-ext4@vger.kernel.org,
 Shreeya Patel <shreeya.patel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Mar 25, 2021 at 03:31:42PM -0400, Gabriel Krisman Bertazi wrote:
> Eric Biggers <ebiggers@kernel.org> writes:
> 
> > On Thu, Mar 25, 2021 at 05:38:08AM +0530, Shreeya Patel wrote:
> >> utf8_unload is being called if CONFIG_UNICODE is enabled.
> >> The ifdef block doesn't check if utf8 encoding has been loaded
> >> or not before calling the utf8_unload() function.
> >> This is not the expected behavior since it would sometimes lead
> >> to unloading utf8 even before loading it.
> >> Hence, add a condition which will check if sb->encoding is NOT NULL
> >> before calling the utf8_unload().
> >> 
> >> Reviewed-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> >> Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
> >> ---
> >>  fs/ext4/super.c | 6 ++++--
> >>  fs/f2fs/super.c | 9 ++++++---
> >>  2 files changed, 10 insertions(+), 5 deletions(-)
> >> 
> >> diff --git a/fs/ext4/super.c b/fs/ext4/super.c
> >> index ad34a37278cd..e438d14f9a87 100644
> >> --- a/fs/ext4/super.c
> >> +++ b/fs/ext4/super.c
> >> @@ -1259,7 +1259,8 @@ static void ext4_put_super(struct super_block *sb)
> >>  	fs_put_dax(sbi->s_daxdev);
> >>  	fscrypt_free_dummy_policy(&sbi->s_dummy_enc_policy);
> >>  #ifdef CONFIG_UNICODE
> >> -	utf8_unload(sb->s_encoding);
> >> +	if (sb->s_encoding)
> >> +		utf8_unload(sb->s_encoding);
> >>  #endif
> >>  	kfree(sbi);
> >>  }
> >
> >
> > What's the benefit of this change?  utf8_unload is a no-op when passed a NULL
> > pointer; why not keep it that way?
> 
> For the record, it no longer is a no-op after patch 5 of this series.
> Honestly, I prefer making it explicitly at the caller that we are not
> entering the function, like the patch does, instead of returning from it
> immediately.  Makes it more readable, IMO.
> 

I don't think making all the callers do the NULL check is more readable.  It's
conventional for free-like functions to accept NULL pointers.  See for example
every other function in the code snippet above -- fs_put_dax(),
fscrypt_free_dummy_policy(), and kfree().

This seems more like an issue with patch 5; it shouldn't be dropping the NULL
check from unicode_unload().

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
