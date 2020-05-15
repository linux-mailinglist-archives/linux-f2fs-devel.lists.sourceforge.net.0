Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 186471D56F9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 May 2020 19:01:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jZdiP-0003fv-Jw; Fri, 15 May 2020 17:01:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jZdiO-0003fo-5S
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 May 2020 17:01:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lhzU/vRTYZ03WxCfQn7IJ6o1FMCBejUuhkVIDxUqj1Q=; b=irIzrQVa4Q6Kq5Uss4UyNcKrkM
 V4N5DypwakdxP1jJhRcGhOLpE/zH7lvlz3wY9gwKogPv2Ot64FGP2a1D8SRvtvqHtVglKVQKMDC8D
 udHfQtn6VSqitVttQ5bR4uNaqLelTfJt+NlWcmStBPsaR2iCnONzM5qql2SX4/JOL7B8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lhzU/vRTYZ03WxCfQn7IJ6o1FMCBejUuhkVIDxUqj1Q=; b=euCnYHxE8J1ePLVOA5W77vbmBG
 WsflLkAf7QS1+AdY4PLaoYcvgZaDVOhu8jYWZyDy3JvApU2wvtTrw1t+eFgH+Xa3vMY1nnJw8Xun1
 JaqXvU0Hvbjv5uidDcejrJyWAMaanM/jX6Ivrgb6lX7SFRQZtyKcNxm/0Vud3ZgYMIFE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jZdiL-00Br0M-Tc
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 May 2020 17:01:40 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 50779206C0;
 Fri, 15 May 2020 17:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589562080;
 bh=L//wP+MT78GfEJiCI4QlGMGDDzxZTlmk/idX3FTcIRY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jddSpVkyXHBGXItg77bdv0TcwbfgMVMe7Q2SEgJSoRcLF+hg+keRPqsZMu/YO1rmZ
 I8ELGSK3mDMWTnLtifx6EDg1r10Vo10Ir8EHH01XWJC8mm89kmSMuAIYFJHvh1sxPN
 9EBOPbPYajXxJZoBC2mjpLyEbAzfjzQKOwDPVGe0=
Date: Fri, 15 May 2020 10:00:59 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200515170059.GA1009@sol.localdomain>
References: <20200514003727.69001-1-satyat@google.com>
 <20200514051053.GA14829@sol.localdomain>
 <8fa1aafe-1725-e586-ede3-a3273e674470@kernel.dk>
 <20200515074127.GA13926@infradead.org>
 <20200515122540.GA143740@google.com>
 <20200515144224.GA12040@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200515144224.GA12040@infradead.org>
X-Spam-Score: -0.5 (/)
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
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jZdiL-00Br0M-Tc
Subject: Re: [f2fs-dev] [PATCH v13 00/12] Inline Encryption Support
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-ext4@vger.kernel.org,
 linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Satya Tangirala <satyat@google.com>, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, May 15, 2020 at 07:42:24AM -0700, Christoph Hellwig wrote:
> On Fri, May 15, 2020 at 12:25:40PM +0000, Satya Tangirala wrote:
> > One of the nice things about the current design is that regardless of what
> > request queue an FS sends an encrypted bio to, blk-crypto will be able to handle
> > the encryption (whether by using hardware inline encryption, or using the
> > blk-crypto-fallback). The FS itself does not need to worry about what the
> > request queue is.
> 
> True.  Which just makes me despise that design with the pointless
> fallback even more..

The fallback is actually really useful.  First, for testing: it allows all the
filesystem code that uses inline crypto to be tested using gce-xfstests and
kvm-xfstests, so that it's covered by the usual ext4 and f2fs regression testing
and it's much easier to develop patches for.  It also allowed us to enable the
inlinecrypt mount option in Cuttlefish, which is the virtual Android device used
to test the Android common kernels.  So, it gets the kernel test platform as
similar to a real Android device as possible.

Ideally we'd implement virtualized inline encryption as you suggested.  But
these platforms use a mix of VMM's (QEMU, GCE, and crosvm) and storage types
(virtio-blk, virtio-scsi, and maybe others; none of these even have an inline
encryption standard defined yet).  So it's not currently feasible.

Second, it creates a clean design where users can just use blk-crypto, and not
have to implement a second encryption implementation.  For example, I'd
eventually like to switch fscrypt over to just use blk-crypto.  That would
remove the duplicate code that you're concerned about.  It would also make it
much easier to implement direct I/O support in fscrypt which is something that
people have been requesting for a long time.

The reason the fscrypt conversion isn't yet part of the patchset is just that I
consider it super important that we don't cause any regressions in fscrypt and
that it doesn't use inline encryption hardware by default.  So it's not quite
time to switch over for real yet, especially while the current patches are still
pending upstream.  But I think it will come eventually, especially if we see
that most Linux distros are enabling CONFIG_BLK_INLINE_ENCRYPTION anyway.  The
inlinecrypt mount option will thten start controlling whether blk-crypto is
allowed to to use real hardware or not, not whether blk-crypto is used or not.

Also, in the coming months we're planning to implement filesystem metadata
encryption that is properly integrated with the fscrypt key derivation so that
file contents don't have to be encrypted twice (as would be the case with
dm-crypt + fscrypt).  That's going to involve adding lots of encryption hooks to
code in ext4, f2fs, and places like fs/buffer.c.  blk-crypto-fallback is super
helpful for this, since it will allow us to simply call
fscrypt_set_bio_crypt_ctx() everywhere, and not have to both do that *and*
implement a second case where we do all the crypto work scheduling, bounce page
allocation, crypto API calls, etc. at the filesystem level.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
