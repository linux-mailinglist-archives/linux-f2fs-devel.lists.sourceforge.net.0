Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FA81E68A0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 May 2020 19:26:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jeMIJ-0003gK-J2; Thu, 28 May 2020 17:26:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jeMII-0003g8-1l
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 May 2020 17:26:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jgzYOUUXw7mit9StbRzWLWchJi9GCBs3rBdt+gJ0x9U=; b=fEtZzE0XtgjB9iYSPGFPYsuBZz
 E9T9WNdh+tT/pFnbWtnaVAagw59aR63XQXgWeBYm+qauLi03VktfCjNMXQkD8vwU5beeaqWlA23oV
 k0wM7xBlJD5H3+TyoSf8k+ueMc+5/oZGWLrhzmoqEVZrN9NlqAhuSf4GgIpIzsKKVyHY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jgzYOUUXw7mit9StbRzWLWchJi9GCBs3rBdt+gJ0x9U=; b=hoRtuIYp2HliwycixWgqbwTDld
 eYkHp/KTjOFU/dud+ns0SvPOamfpRd8PKMxBbySy2S2QaCsuDko4KSDWn+7BFeBiou07Z68AFQtd5
 3me/KZ0cKwOErd0P+lNT0cgF25KlsS138liiaTcX/UQvCaJp/QkyiYTJi4mFDSKk2W24=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jeMIG-00B5pP-Lz
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 May 2020 17:26:14 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 38E4D2073B;
 Thu, 28 May 2020 17:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590686767;
 bh=Nj1T+TXFSd3bW3fDzss/gbSAickMqQUprqIVt6x5ySk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d8pue2x5WkszBbMbfcclE0pjozu5a+F23nPyPkUNBnw611I3Ct084CyNwLbJ4ZBIy
 A5u3XjMeJ0vL1aI3TGA49uHoHigteREbII5mrYhavwWIxo9NFAPs/3q3I11hMuUUel
 BsDVoAc49m0d0YoDDLecFhfazVn3CNGnuFDAcxNw=
Date: Thu, 28 May 2020 10:26:06 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Hongwei <glqhw@qq.com>
Message-ID: <20200528172606.GA153385@google.com>
References: <tencent_DCCAEE9137D2150CB266BD2CF3EDF98A970A@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_DCCAEE9137D2150CB266BD2CF3EDF98A970A@qq.com>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jeMIG-00B5pP-Lz
Subject: Re: [f2fs-dev] Can F2FS roll forward after fdatasync()?
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
Cc: linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/28, Hongwei wrote:
> Hi F2FS experts,
> As written in f2fs_do_sync_file():
> "Both of fdatasync() and fsync() are able to be recovered from sudden-power-off."
> 
> Please consider this workflow:
> 1. Start atomic write
> 2. Multiple file writes
> 3. Commit atomic write
> 4. fdatasync()
> 5. Powerloss.
> 
> In the 4th step, the fdatasync() doesn't wait for node writeback.
> So we may loss node blocks after powerloss.
> 
> If the data blocks are persisted but node blocks aren't, can the recovery program recover the transaction?

#3 will guarantee the blocks written by #2. So, if there's no written between #3
and #4, I think we have nothing to recover.
Does this make sense to you?

> 
> Thanks!
> 
> Hongwei
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
