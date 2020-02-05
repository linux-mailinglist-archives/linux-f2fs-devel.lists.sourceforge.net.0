Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 468B615373C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Feb 2020 19:05:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1izP3h-0002cK-Ep; Wed, 05 Feb 2020 18:05:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+a2b935cbc3c12af13a1b+6009+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1izP3g-0002cC-CP
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 05 Feb 2020 18:05:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lnr7mIt+S4K5BkVzezLQyquUi1haUDf4FzQ/dLHJa44=; b=XgKcNKzbnvjFQc57hgHOWJJJGi
 wvFS1L9+S1ncLlkTtUvkBXJLBaaUpuofHkkY4EZvsud2NEdKDl9NHTGZU8ey9VYQTTRzzn+BCkV0e
 S5scCiyT3vwGvHubpVG40Bamv446Y1inc6Q9JWrVjRxSnzxjXda+hfZeRGjKAGY4X2Zg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lnr7mIt+S4K5BkVzezLQyquUi1haUDf4FzQ/dLHJa44=; b=Oc8+7m6RN/l10orVgzXPAR8az1
 ZpMvhOma5ghJYifjWEHOYMc3Hd3xkpL9ssC5vPRmRHIo4ht50cClYmU6MBIFjnvqr1PzZhfxzgFuK
 ssobxR1g+1kYUdEosDPCHWukyTBuC2UXRVxYZX5Ijkcdi5ZzbNeLj7zwM3UlWO7DiAiQ=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1izP3d-000R9X-EL
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 05 Feb 2020 18:05:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=lnr7mIt+S4K5BkVzezLQyquUi1haUDf4FzQ/dLHJa44=; b=ZyV7jooypoITHaGMYAmvuzyIwy
 HOVxgMBez/QZL+gNVTmE4TQMMhWwEutxaKSc79ksCTj4cM6VJk/KCRWXVCX4yKtHTBtCLTIcqFICX
 UrrTcw1fUf71hmJR7LukbyWk46bMLT0ScUhFZRsq8FxIAXTUAl/mNM2sQ2R5/fAPwhWlHfvewEXB0
 MCDiGPKdoIy+2Wv3BuzDpIPHU39BfK3834knDyI9BKyijJ0cMDDoR3Jq15lnj8Gg5YtGnJhzXVw2T
 af2+rZThDCahfxdXN31wKsNmzhWsuKPhhpePWiyN926spZ7H0kqWAfnCRQguXu8Is4pV0jS2QAtOD
 BNVGtw6A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1izP3V-0001Ma-CA; Wed, 05 Feb 2020 18:05:41 +0000
Date: Wed, 5 Feb 2020 10:05:41 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200205180541.GA32041@infradead.org>
References: <20191218145136.172774-1-satyat@google.com>
 <20200108140556.GB2896@infradead.org>
 <20200108184305.GA173657@google.com>
 <20200117085210.GA5473@infradead.org>
 <20200201005341.GA134917@google.com>
 <20200203091558.GA28527@infradead.org>
 <20200204033915.GA122248@google.com>
 <20200204145832.GA28393@infradead.org>
 <20200204212110.GA122850@gmail.com>
 <20200205073601.GA191054@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200205073601.GA191054@sol.localdomain>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1izP3d-000R9X-EL
Subject: Re: [f2fs-dev] [PATCH v6 0/9] Inline Encryption Support
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
Cc: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
 Kim Boojin <boojin.kim@samsung.com>, Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Satya Tangirala <satyat@google.com>, Christoph Hellwig <hch@infradead.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Feb 04, 2020 at 11:36:01PM -0800, Eric Biggers wrote:
> The vendor-specific SMC calls do seem to work in atomic context, at least on
> SDA845.  However, in ufshcd_program_key(), the calls to pm_runtime_get_sync()
> and ufshcd_hold() can also sleep.
> 
> I think we can move the pm_runtime_get_sync() to ufshcd_crypto_keyslot_evict(),
> since the block layer already ensures the device is not runtime-suspended while
> requests are being processed (see blk_queue_enter()).  I.e., keyslots can be
> evicted independently of any bio, but that's not the case for programming them.

Yes.

> That still leaves ufshcd_hold(), which is still needed to ungate the UFS clocks.
> It does accept an 'async' argument, which is used by ufshcd_queuecommand() to
> schedule work to ungate the clocks and return SCSI_MLQUEUE_HOST_BUSY.
> 
> So in blk_mq_dispatch_rq_list(), we could potentially try to acquire the
> keyslot, and if it can't be done because either none are available or because
> something else needs to be waited for, we can put the request back on the
> dispatch list -- similar to how failure to get a driver tag is handled.

Yes, that is what I had in mind.

> However, if I understand correctly, that would mean that all requests to the
> same hardware queue would be blocked whenever someone is waiting for a keyslot
> -- even unencrypted requests and requests for unrelated keyslots.

At least for an initial dumb implementation, yes.  But if we care enough
we can improve the code to check for the encrypted flag and only put
back encrypted flags in that case.

> It's possible that would still be fine for the Android use case, as vendors tend
> to add enough keyslots to work with Android, provided that they choose the
> fscrypt format that uses one key per encryption policy rather than one key per
> file.  I.e., it might be the case that no one waits for keyslots in practice
> anyway.  But, it seems it would be undesirable for a general Linux kernel
> framework, which could potentially be used with per-file keys or with hardware
> that only has a *very* small number of keyslots.
> 
> Another option would be to allocate the keyslot in blk_mq_get_request(), where
> sleeping is still allowed, but some merging was already done.

That is another good idea.  In blk_mq_get_request we acquire other
resources like the tag, so this would be a very logical places to
acquire the key slots.  We can should also be able to still merge into
the request while it is waiting.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
