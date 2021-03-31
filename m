Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B7F3503C8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Mar 2021 17:48:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lRd58-0006n3-87; Wed, 31 Mar 2021 15:48:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lRd54-0006md-Rx
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 31 Mar 2021 15:48:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=48eoaQQlOTBFo+s2wDdOjEK+nF9HOURH0wBnq/ZyGWo=; b=N7XrmuhySR04Rm2gUY/E6PdFC1
 /lhx00+dVwtiAzXxZonPg7cdDuo0bnYfjz9dAs+WEt+cEOM1eExTS/CeVQ8WzleN6FRZjaYL3bFXv
 J+J84iwXdWiPWqKkSVs/gW/gPFCOXHVxsEf2cjYm33mNslQb6WldDPiqUi8asLgmWF5o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=48eoaQQlOTBFo+s2wDdOjEK+nF9HOURH0wBnq/ZyGWo=; b=F8vW+Di0RQGRBlGsfrPeZnA+9h
 +rCCyunGfb3Ex5JuTxKPTkXvGq1AjmucBoVhAWRLtWrQESfHYW96mxDF9faPwk04SUsi54U+9Kkue
 C8jbQFK7yYa82sBKJCaxkDi2hElbh/PMMb5f2sGJtsTtWFzp8TB2w7/pfE+FUJKJKdQk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lRd50-00HQqR-D3
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 31 Mar 2021 15:48:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D6A5260200;
 Wed, 31 Mar 2021 15:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617205700;
 bh=3wjaWDR7E/Le4pPQqny79FqpaQdnsmQsNrmXzfErIyA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JP6hYn8IZ3z0L6FO5Fa5wdmoStK9tTBBBfXumTu97xw5r9Rn+bGfk4J4khACg9sWY
 NciYXV+xuY52aDg1wqHYtPygIGUMi9ZoMPu1y6hpJbdAM/5yppzudJrh0BfX+dOR8U
 AXsoMphL6nh9iIpocFZ/f40TUkboARYYe0ZmzBHIuRLUbhxyK2XVz32P8dt3t4zus7
 BwWl8DZX4ZNbIAe+HjA1drWfUw7U4ZUnwIYKfBD9JjeDf8TdbwIO7dnGDKVYrtchEY
 bZ4TZ3XoAjGpYU08LJ/lKV5ZCluksmPswK74ehECQF9deC9wXu+xy2gE/fY1NJhF4z
 pdO79LpHVyVMA==
Date: Wed, 31 Mar 2021 08:48:19 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: beroal <me@beroal.in.ua>
Message-ID: <YGSZw6Azb8E43gOl@google.com>
References: <739ae455-07b4-7dc4-1789-5b162ed25ede@beroal.in.ua>
 <bc3759b9-c606-5e77-40f0-c590bbc53bfb@beroal.in.ua>
 <YGPTWqUtHqEyRLMv@google.com>
 <10ac38ce-4e76-4e12-2112-bd4cc10d1ab4@beroal.in.ua>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <10ac38ce-4e76-4e12-2112-bd4cc10d1ab4@beroal.in.ua>
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
X-Headers-End: 1lRd50-00HQqR-D3
Subject: Re: [f2fs-dev] `mount` reports an error, but `fsck.f2fs` does not
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

On 03/31, beroal wrote:
> On 31.03.21 04:41, Jaegeuk Kim wrote:
> > Hi,
> > 
> > On 03/27, beroal wrote:
> > > Ping.
> > > 
> > > On 20.03.21 00:46, beroal wrote:
> > > > Hi. After I extended a partition containing F2FS with a recent version
> > > > of Gparted, the partition no longer mounts. `mount` reports an error,
> > > > but `fsck.f2fs` does not see any problem (well, except for `Invalid CP
> > > > CRC offset: 0`) and does not fix the file system.
> > > > 
> > > > ```
> > > > losetup /dev/loop0 arch-os.img
> > > > mount -t f2fs -o ro /dev/loop0 /root/mnt/temp
> > > > ```
> > > > 
> > > > ```
> > > > [ 6890.647749] F2FS-fs (loop0): Wrong valid_user_blocks: 16040048,
> > > > user_block_count: 10016768
> > > > [ 6890.647808] F2FS-fs (loop0): Failed to get valid F2FS checkpoint
> > > > ```
> > > > 
> > > > ```
> > > > losetup -d /dev/loop0
> > > > fsck.f2fs arch-os.img
> > May I ask run this?
> > 
> > # fsck.f2fs -d 3 arch-os.img?
> The result is a log of size 270 MB. I'll send it privately to
> jaegeuk@kernel.org if you don't mind. It contains directory and file names.

Thanks.

segment_count_main                      [0x    9a95 : 39573]
-> 39573 * 2MB = 78GB as user space

overprov_segment_count                  [0x    4e29 : 20009]
-> 20009 * 2MB = 40GB as overprovisioned space which user can't see.

But,

[FSCK] valid_block_count matching with CP             [Ok..] [0xf4c070]
-> 0xf4c070 = 16040048

valid_block_count                       [0x  f4c070 : 16040048]
-> So, this is correct.

So, I suspect overprovisioned space is wrong and guess resize.f2fs assigned
a wrong value. May I ask from and to which capacities you resized? I may
need to reproduce it quickly.

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
