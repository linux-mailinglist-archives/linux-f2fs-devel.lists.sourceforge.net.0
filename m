Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BED9A436C8F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Oct 2021 23:19:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mdfSi-00019u-JO; Thu, 21 Oct 2021 21:18:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1mdfSh-00019n-5b
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Oct 2021 21:18:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0OfrCFbT9mrMflZmkWbDJUsYW2gai6j1gi+VDfreEEY=; b=NkEFLzRqH7yP/x7Zwq+YCeHbDX
 PD1x15ue7J66Jg3iwkqHxA8iQf3RH1RMjQZHZMCcoD/L5TaaauFdMDJQdSGiCQK1oot/W6y2/XgBL
 pOEpICTKZxaeNeV+i24+gCq17CKxwaqbnYMsAe87Vl36nwcd6EZNkfAVCh4qsojM5jfI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0OfrCFbT9mrMflZmkWbDJUsYW2gai6j1gi+VDfreEEY=; b=An/o2rRBMwY1XeklDUvR8bkdVx
 nT4eJ20zFOf0r2CyNzldut1jh6OqCCLWlQQSiqrT659KmlO5Lbq0oQJfEMKX7veKV15ltUJNi1A+b
 4OhENCwODmlgS3hlUsern1GBJ7dRoW8urSeaqKKz1ZJmyqrIJPgm0Prc/y9xxqi1uyMk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mdfSg-00At82-Id
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Oct 2021 21:18:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EDC8D60F8F;
 Thu, 21 Oct 2021 21:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634851129;
 bh=Gwyq+zNT7ASn4trOpGqWOvEtfQM+rFmKZzNvILCKN9w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hcLpceroDe5GwilFBhvK4YwRln2QMZHCQQTbfaAuSrb54zKI/z78zgl1CCotid7sS
 evww543WI/EGj4u3XeQDfK6OHFT3svqclTNAFyLPVyOGGB2pyN29fNqWGIrJluGmvc
 h5cJ1uB8PKVsFmASlG55lN9xhqU2x/YNk+ElOVTaTfybnsmDSd/WPlWnNNvj80V4z5
 IXGkLX2cbLcxHacvlQlXWYg8wHndQ6BTI9d4lteM69Brvme3CaPQt3pbBDtWxYLw2S
 uFxidjj/1OfxkiVyuep6pMEV+g4XpOADFUuWXy/K7op4ulig0Gg6wqjD35jv4l8LUH
 SxmKoTn9ZtJ1A==
Date: Thu, 21 Oct 2021 14:18:47 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <YXHZN5J2jyPG5tcx@google.com>
References: <20211006174910.2964885-1-daeho43@gmail.com>
 <5743eeca-a6e8-87d4-5799-c622fbada429@kernel.org>
 <CACOAw_zfDZMB4pLEuHWU5YcKnAtfBBTSuXwXy+L2rNJxXC3ysg@mail.gmail.com>
 <16840026-35ba-cce6-4e0b-3332b0902d2a@kernel.org>
 <CACOAw_xW7MZi8BVi-2Zo-=LruZr6k7fC7huYiYuWyaDDDti6WA@mail.gmail.com>
 <02abeeba-c359-cae3-4759-ee2087f21cc9@kernel.org>
 <CACOAw_xh2HSQDjb_tGopvssipDJYnpi4O1X5_eJqSOLpLebqsw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOAw_xh2HSQDjb_tGopvssipDJYnpi4O1X5_eJqSOLpLebqsw@mail.gmail.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/21, Daeho Jeong wrote: > > Okay, shouldn't we Cc stable
 mailing list for this patch? otherwise > > userspace tool may get different
 stat number with the same compressed > > file in different ker [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mdfSg-00At82-Id
Subject: Re: [f2fs-dev] [PATCH] f2fs: include non-compressed blocks in
 compr_written_block
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
Cc: kernel-team@android.com, Daeho Jeong <daehojeong@google.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/21, Daeho Jeong wrote:
> > Okay, shouldn't we Cc stable mailing list for this patch? otherwise
> > userspace tool may get different stat number with the same compressed
> > file in different kernel?
> >
> 
> Oh, could you let me know what the address of the "stable" mailing list is?

Added Fixes and -stable. :)

> 
> Thanks,
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
