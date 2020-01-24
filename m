Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A90A148F31
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jan 2020 21:14:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iv5LJ-000518-2Q; Fri, 24 Jan 2020 20:14:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iv5LH-00050v-Bl
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jan 2020 20:14:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A8ltrmZEPSfl6gI76hjwgXcvjEOjtPUe3F/O3vP39GM=; b=eWiBD3VqUHOhD5RLDPeRRTC2Ru
 BrPnHArov6nxx1ae/zV8P35h/5uejguPrX/hVVriXm2BdcMxZsRHoLB5DEgi6YwmsjrQYPrTvLegB
 wF9NAztxWx+7nCMWErajsKCDk3ApN6p5pXdg5lutQ3cLYMm3R6ItdZgjgbMvMveyZ2W8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A8ltrmZEPSfl6gI76hjwgXcvjEOjtPUe3F/O3vP39GM=; b=MqpbUPqEvfqAf9TcSV+9zUMl+1
 4+lzETzzBshS5TRLPLSRDcKMiyDaUq3cqD7nSTs+MLdZuev4pC9Sp5j7KVQdqwk7cM4RMNtzObVVp
 VzyhndrsZOMAYwqt1fL7AKcfEFU6BvjYt1IiwufeX/puhlyfyPO9k4RZL0K3PlgTXjU0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iv5LG-00HOey-4k
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jan 2020 20:14:11 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1F8CF2071E;
 Fri, 24 Jan 2020 20:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579896844;
 bh=BXwKT7PuUAxXdQBtcYCaPasA/6uX1OMir4E6yh0LA3k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1ag7/2DSoxG5KYU0EMVWB64o75K0btoF+qRMCO5k9cTMqUywqJBdCg/sUprpKIHv/
 9MepeQSjc6pe8xJdw8+LoNAgcQY5x8NUgXg6RHWOLoXD7dmmnthVG6ewye8WF1rbAv
 53XYtcyTT0ewAW3ULL2QSG0sBV/ytCRp6aZzLJeA=
Date: Fri, 24 Jan 2020 12:14:02 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Message-ID: <20200124201317.GC41762@gmail.com>
References: <20200120223201.241390-1-ebiggers@kernel.org>
 <20200120223201.241390-5-ebiggers@kernel.org>
 <20200122003014.GA180824@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200122003014.GA180824@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 1.4 (+)
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
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iv5LG-00HOey-4k
Subject: Re: [f2fs-dev] [PATCH v5 4/6] ubifs: don't trigger assertion on
 invalid no-key filename
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
Cc: Daniel Rosenberg <drosen@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jan 21, 2020 at 04:30:15PM -0800, Eric Biggers wrote:
> On Mon, Jan 20, 2020 at 02:31:59PM -0800, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > If userspace provides an invalid fscrypt no-key filename which encodes a
> > hash value with any of the UBIFS node type bits set (i.e. the high 3
> > bits), gracefully report ENOENT rather than triggering ubifs_assert().
> > 
> > Test case with kvm-xfstests shell:
> > 
> >     . fs/ubifs/config
> >     . ~/xfstests/common/encrypt
> >     dev=$(__blkdev_to_ubi_volume /dev/vdc)
> >     ubiupdatevol $dev -t
> >     mount $dev /mnt -t ubifs
> >     mkdir /mnt/edir
> >     xfs_io -c set_encpolicy /mnt/edir
> >     rm /mnt/edir/_,,,,,DAAAAAAAAAAAAAAAAAAAAAAAAAA
> > 
> > With the bug, the following assertion fails on the 'rm' command:
> > 
> >     [   19.066048] UBIFS error (ubi0:0 pid 379): ubifs_assert_failed: UBIFS assert failed: !(hash & ~UBIFS_S_KEY_HASH_MASK), in fs/ubifs/key.h:170
> > 
> > Fixes: f4f61d2cc6d8 ("ubifs: Implement encrypted filenames")
> > Cc: <stable@vger.kernel.org> # v4.10+
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> 
> Richard, can you review the two UBIFS patches in this series, and if you're okay
> with them, provide Acked-by's so that we can take them through the fscrypt tree?
> They don't conflict with anything currently in the UBIFS tree.
> 

Richard, any objection to us taking these patches through the fscrypt tree?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
