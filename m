Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF452C5B3C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Nov 2020 19:00:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kiLZN-0002a7-H8; Thu, 26 Nov 2020 18:00:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kiLPI-0002CC-Du
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Nov 2020 17:50:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hMl+FHjlivENcMZp9kN382Qfgc3teG6dw7HLRlVn2iA=; b=TFddBSTZis19RetZcQjXcnVGwW
 cWcE17/vle4aPZvBcUFy7/RRaTvwOVQd5z+BEntQquKz2/vySL9HBDjOtaCCmHL/qVAcE0dAfjOZK
 2oMFmm4lwPl7ys97Qx3rtYOtB6u7Xyh4yIPE8LYpCysve/8k/k1IpbMclFDY/X11vML0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hMl+FHjlivENcMZp9kN382Qfgc3teG6dw7HLRlVn2iA=; b=gzEQSi59H3DJIiButr/Q00aiFV
 RhdXLxQcAhQwEQXV6kJPOK71FABylaNLog7ZujUK2HYVKVNmbvsH+SvbmDoHF0y5dzJ1geMA8rg+5
 eOwSFe59Eud13pTjQTLBhaSXB9yIXyeulhLqKlNkU2dxfWf4FglQ+PiGuuETG1U7O9zI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kiLP3-005pxR-Vv
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Nov 2020 17:50:12 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 257F52053B;
 Thu, 26 Nov 2020 17:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606412979;
 bh=BD8kUdWFybD9t7G40pqo6k9zDUDc9M1OCvnslZNmT4A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oGrVxfJ+LzZIs8hVexHcq3DO90RyIP3/zN4o9egA8ewsVmKocSWibGMAQiPB+c2YU
 b2vUm3XfWmGHmev1MKAGbIgC2MSHDF8wYlLR1ubi9qyg8NAGPGCc9LN8hnKlqMfRc2
 wYQOmT95L0gjoRPFXx5d5z8hm5xFieSByrUFFKm4=
Date: Thu, 26 Nov 2020 09:49:35 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <X7/qr/kVxl3AO/PR@sol.localdomain>
References: <20201123031751.36811-1-daeho43@gmail.com>
 <20201123031751.36811-2-daeho43@gmail.com>
 <5b3cb83d-5d0f-c1ca-2cff-f28372dec48e@huawei.com>
 <CACOAw_xs0dizV_xg4-8ssC8wPRq8eXPw3QhHAFf3S-w3hp9jcg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOAw_xs0dizV_xg4-8ssC8wPRq8eXPw3QhHAFf3S-w3hp9jcg@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kiLP3-005pxR-Vv
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: add F2FS_IOC_DECOMPRESS_FILE and
 F2FS_IOC_COMPRESS_FILE
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

On Thu, Nov 26, 2020 at 02:04:41PM +0900, Daeho Jeong wrote:
> Eric,
> 
> do_page_cache_ra() is defined in mm/internal.h for internal use
> between in mm, so we cannot use this one right now.
> So, I think we could use page_cache_ra_unbounded(), because we already
> check i_size boundary on our own.
> What do you think?

What about page_cache_async_readahead() or page_cache_sync_readahead()?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
