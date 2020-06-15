Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B691F9C31
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2020 17:47:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jkrKv-0007WW-IU; Mon, 15 Jun 2020 15:47:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jkrKl-0007VM-A7
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Jun 2020 15:47:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BG1FSRX6YwFlMjahJZQbY/gv27QfcPoaJNKQXxM9wGY=; b=nTyzPGIxKQ9Zkxl1lLHmWAzz8A
 3v8Ym6nqKrcoVLotHsqypKohPWk9CkHn4kXYiXDi5LvQm7DtusE4MJLCFl8Xx58WYuG5Mz7dKAZLG
 gxiWJHXQ9uSPWnikgmoaGNqXbwVeh5HJ1cgFCRk+HkVnWLJzBl7SSguJ1SO2iSq7fwdY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BG1FSRX6YwFlMjahJZQbY/gv27QfcPoaJNKQXxM9wGY=; b=alJEun/RmNguSaj2utjQ4iIqPJ
 e+OLOkB3rCUlGof1ujqpYFm8o6sHTXe2DdJnCBMle7cbdYmlksISBYNpxQOCrnvVppsQIx2FHrK+l
 ztaWOxRhhDUE7gIWOx2DPlHQVvqysNEfK26E3aD9KjDT+OCdueK6BI2Kal3xNpPTMZe8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jkrKd-006ioj-W1
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Jun 2020 15:47:33 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 99BE42078E;
 Mon, 15 Jun 2020 15:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592236041;
 bh=TvoTA2FuH6mLitI1jM5lsj1kplEHSv1NCisVfYWGIJk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W6yWGGNpB/VnrsNNFwvyCenz5ShS7q1GVlq2x9avR8n2fOp7C7XT9pDTD1pPXQHSQ
 znH/SSlpzF08xtLhUa8D8H3S4uxk4h116vgt3tjotR2fhxKfNUXzHLgjK4ZnvmVjm/
 8+T29Hcb2dR/5PeDFxD0MRz5/LuNA1kLgH8R8BzY=
Date: Mon, 15 Jun 2020 08:47:20 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Sahitya Tummala <stummala@codeaurora.org>
Message-ID: <20200615154720.GA902@sol.localdomain>
References: <1592193588-21701-1-git-send-email-stummala@codeaurora.org>
 <20200615050019.GA3100@sol.localdomain>
 <20200615061633.GA23467@google.com>
 <20200615095316.GB2916@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200615095316.GB2916@codeaurora.org>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jkrKd-006ioj-W1
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix use-after-free when accessing
 bio->bi_crypt_context
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Satya Tangirala <satyat@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jun 15, 2020 at 03:23:16PM +0530, Sahitya Tummala wrote:
> > 
> > Should I fold this change into the original patch? Or keep it as a
> > separate patch when I send out the fscrypt/f2fs inline encryption
> > patches?
> 
> It may be good to keep it seperate as we already have the base FBE patches in
> several downstream kernels, so this fix can be applied easily. But I will
> leave it up to you to take a call on this.
> 

We should fold it in because the patch this fixes isn't applied upstream yet.

We'll need to submit this as a separate fix to the Android common kernels
because they already have a previous version of the inline encryption patchset.
(I assume that's where you have the code from.)  But that doesn't affect what we
do upstream.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
