Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA57E1F7FA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 May 2019 17:49:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hQw9Y-0007Rz-U1; Wed, 15 May 2019 15:49:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hQw9X-0007Rs-Ru
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 May 2019 15:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3FMTD4skORQQCGXeT4TTtRLzTbTh5qc1paq9b4TeCMU=; b=YL77xZ2Dt7CZ9lLRpIeINKRvL4
 ES9SIJ9s4VUlcDrqq1f1MhimNP7kOyFMekqm1BEUIg9y3hicn0rSkKCurV0K945r3j071Jdp32qjp
 pyQ5q3WgxHzDN6difeoK6qFvVLqy6M0Zcl5Owfj3PCfBMiB6yOjP7z6U4ARMbCsw07r0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3FMTD4skORQQCGXeT4TTtRLzTbTh5qc1paq9b4TeCMU=; b=ZLF30nzXrRlDos0ulKYAixB5UU
 yVwLy7k234FUxr7iU7zm8asYjur/razqFT5eb40NK6yHtQ+X9menXAnF194U7gfhDOcWT3Qvlc1Te
 EZmUobC/4WQgVuCbDI4HeTZeIu6R+AfxmT9Pl+HfFFj0DPO4xSBjvfi69GoYUtOo7zp0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hQw9V-00HMjA-Pi
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 May 2019 15:49:11 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7301420818;
 Wed, 15 May 2019 15:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557935342;
 bh=n94J359YluaCaapX13/KBR6AUINGnbFiJv3knGiRl2s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FmekzQ/kNh+4iXv7yG1vjFhf18mjmuRs3bvRlM8kLTHrFbpVmlWAukKZOdGvUaAFW
 ycqqbFwBgRq3YpNJH4cZGo6x842mJfa6p34jjhFhnZ265Cd3N4+Q+YC5q4wbmWnMvE
 s1nD2DLVbkR9NhBmtSTi2dZaMo4uUWOCB+wA9fQQ=
Date: Wed, 15 May 2019 08:48:48 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20190515154846.GA21903@sol.localdomain>
References: <20190424175730.70979-1-ebiggers@kernel.org>
 <242d8b26-592b-57da-bd1f-3466bf714803@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <242d8b26-592b-57da-bd1f-3466bf714803@huawei.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hQw9V-00HMjA-Pi
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: improve xattr value printing
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

On Sun, Apr 28, 2019 at 02:25:10PM +0800, Chao Yu wrote:
> On 2019/4/25 1:57, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > - Print the values of xattrs that have an unknown ->e_name_index, rather
> >   than ignoring them.
> > 
> > - Replace char with u8.  Otherwise xattr values containing bytes >= 0x80
> >   are printed incorrectly on platforms where char is signed.
> > 
> > - Only parse the encryption xattr if it has a known format number and
> >   size.  Otherwise print it as hex.
> > 
> > - Remove incorrect le16_to_cpu() on ->e_name_len which has type u8.
> > 
> > - Consolidate the code that prints the xattr value as hex.
> > 
> > - Constify pointers to the xattr entry.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> 
> Reviewed-by: Chao Yu <yuchao0@huawei.com>
> 
> Thanks,
> 

Hi Jaegeuk, are you planning to apply this patch?

Thanks,

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
