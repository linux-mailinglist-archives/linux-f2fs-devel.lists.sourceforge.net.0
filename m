Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B0753152712
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Feb 2020 08:36:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1izFEM-0001SD-C7; Wed, 05 Feb 2020 07:36:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1izFEK-0001Ro-OC
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 05 Feb 2020 07:36:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=USkZXXcVwlFIMPireLoNXH54a25k08++9cYrvd2xvhU=; b=QkbsOcZ58L1sPNjizHH79POAFv
 fva/26vF/a+E7yV9lcaIzFIddlfOLYbavnrSWkULjjF/xZw+D6lvVIry21+KCxXRx16w5Q12Rg/nR
 BrEk2SPHu1DyAFZOnRjLTsCu80+HjpjTDXVxKGTML77HLb4eo5BoeYf6JIfE/bvW3s9c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=USkZXXcVwlFIMPireLoNXH54a25k08++9cYrvd2xvhU=; b=Ce1Y8spgy88jORk+9/ji2ISjm1
 3QmmTXw2ry1wOBrEHDTbACCQPfr4Ra1fcIW1dp7hl8yAsMQKCNfBtGmsQKB8CnXfye0MnjYIar4/2
 IAnXHotfclrLMXu27Gr7ZkeoI0IF2t400MWxwvl7dIBXH/rNiqFcWSvckJF3cLPiTqUk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1izFEH-00HTvZ-4t
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 05 Feb 2020 07:36:12 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4F9942082E;
 Wed,  5 Feb 2020 07:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580888163;
 bh=n6o7wWQTA4s8aqk96q3w/6anRogQN4od5Sii5HmNmSg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Asok7CXnwefCnjUsDtKL6rcUulerYyKIjohfoE0MCopRF1A4GrSwSs5y+JyF4Ah2P
 V9SjZve6qKHIGzgLbIhDt/82c9hLVDEizHOQVJiIaiGPjJz2uS3Ht3WY825qSoVhSv
 7vKWVVkT1QAEhsFN750aTQYD44YttZKasa9HwnC0=
Date: Tue, 4 Feb 2020 23:36:01 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200205073601.GA191054@sol.localdomain>
References: <20191218145136.172774-1-satyat@google.com>
 <20200108140556.GB2896@infradead.org>
 <20200108184305.GA173657@google.com>
 <20200117085210.GA5473@infradead.org>
 <20200201005341.GA134917@google.com>
 <20200203091558.GA28527@infradead.org>
 <20200204033915.GA122248@google.com>
 <20200204145832.GA28393@infradead.org>
 <20200204212110.GA122850@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200204212110.GA122850@gmail.com>
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
X-Headers-End: 1izFEH-00HTvZ-4t
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
Cc: linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Satya Tangirala <satyat@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Feb 04, 2020 at 01:21:11PM -0800, Eric Biggers wrote:
> On Tue, Feb 04, 2020 at 06:58:32AM -0800, Christoph Hellwig wrote:
> > On Mon, Feb 03, 2020 at 07:39:15PM -0800, Satya Tangirala wrote:
> > > Wouldn't that mean that all the other requests in the queue, even ones that
> > > don't even need any inline encryption, also don't get processed until the
> > > queue is woken up again?
> > 
> > For the basic implementation yes.
> > 
> > > And if so, are we really ok with that?
> > 
> > That depends on the use cases.  With the fscrypt setup are we still
> > going to see unencrypted I/O to the device as well?  If so we'll need
> > to refine the setup and only queue up unencrypted requests.  But I'd
> > still try to dumb version first and then refine it.
> 
> Definitely, for several reasons:
> 
> - Not all files on the filesystem are necessarily encrypted.
> - Filesystem metadata is not encrypted (except for filenames, but those don't
>   use inline encryption).
> - Encryption isn't necessarily being used on all partitions on the disk.
> 
> It's also not just about unencrypted vs. encrypted, since just because someone
> is waiting for one keyslot doesn't mean we should pause all encrypted I/O to the
> device for all keyslots.
> 
> > 
> > > As you said, we'd need the queue to wake up once a keyslot is available.
> > > It's possible that only some hardware queues and not others get blocked
> > > because of keyslot programming, so ideally, we could somehow make the
> > > correct hardware queue(s) wake up once a keyslot is freed. But the keyslot
> > > manager can't assume that it's actually blk-mq that's being used
> > > underneath,
> > 
> > Why?  The legacy requet code is long gone.
> > 
> > > Also I forgot to mention this in my previous mail, but there may be some
> > > drivers/devices whose keyslots cannot be programmed from an atomic context,
> > > so this approach which might make things difficult in those situations (the
> > > UFS v2.1 spec, which I followed while implementing support for inline
> > > crypto for UFS, does not care whether we're in an atomic context or not,
> > > but there might be specifications for other drivers, or even some
> > > particular UFS inline encryption hardware that do).
> > 
> > We have an option to never call ->queue_rq from atomic context
> > (BLK_MQ_F_BLOCKING).  But do you know of existing hardware that behaves
> > like this or is it just hypothetical?
> 
> Maybe -- check the Qualcomm ICE (Inline Crypto Engine) driver I posted at
> https://lkml.kernel.org/linux-block/20200110061634.46742-1-ebiggers@kernel.org/.
> The hardware requires vendor-specific SMC calls to program keys, rather than the
> UFS standard way.  It's currently blocking, since the code to make the SMC calls
> in drivers/firmware/qcom_scm*.c uses GFP_KERNEL and mutex_lock().
> 
> I'll test whether it can work in atomic context by using GFP_ATOMIC and
> qcom_scm_call_atomic() instead.  (Adding a spinlock might be needed too.)
> 

The vendor-specific SMC calls do seem to work in atomic context, at least on
SDA845.  However, in ufshcd_program_key(), the calls to pm_runtime_get_sync()
and ufshcd_hold() can also sleep.

I think we can move the pm_runtime_get_sync() to ufshcd_crypto_keyslot_evict(),
since the block layer already ensures the device is not runtime-suspended while
requests are being processed (see blk_queue_enter()).  I.e., keyslots can be
evicted independently of any bio, but that's not the case for programming them.

That still leaves ufshcd_hold(), which is still needed to ungate the UFS clocks.
It does accept an 'async' argument, which is used by ufshcd_queuecommand() to
schedule work to ungate the clocks and return SCSI_MLQUEUE_HOST_BUSY.

So in blk_mq_dispatch_rq_list(), we could potentially try to acquire the
keyslot, and if it can't be done because either none are available or because
something else needs to be waited for, we can put the request back on the
dispatch list -- similar to how failure to get a driver tag is handled.

However, if I understand correctly, that would mean that all requests to the
same hardware queue would be blocked whenever someone is waiting for a keyslot
-- even unencrypted requests and requests for unrelated keyslots.

It's possible that would still be fine for the Android use case, as vendors tend
to add enough keyslots to work with Android, provided that they choose the
fscrypt format that uses one key per encryption policy rather than one key per
file.  I.e., it might be the case that no one waits for keyslots in practice
anyway.  But, it seems it would be undesirable for a general Linux kernel
framework, which could potentially be used with per-file keys or with hardware
that only has a *very* small number of keyslots.

Another option would be to allocate the keyslot in blk_mq_get_request(), where
sleeping is still allowed, but some merging was already done.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
