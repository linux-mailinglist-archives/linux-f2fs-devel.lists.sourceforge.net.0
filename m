Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A3217288A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Feb 2020 20:26:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j7OnQ-0002ML-IY; Thu, 27 Feb 2020 19:26:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1j7OnM-0002M9-Ov
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Feb 2020 19:26:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HdtxJ4/bSXwqXCvmIPfks9tn7+Sy3lZv+ZpXTBglwq8=; b=VEdoiXECovJ/bAEvGPYqdmq67a
 8Xsp6fLRl3iKvZHrPXaKXWH3bMOWNN1OxFSFrW28lbbFiy1eoGT3/qhECx54jKhokxMpN1fvjra0n
 wJEvP9jMU3YGxnI6CLNTVYzubhUmu5YKfjylzDWSqtZDTQdsMN3F8dj+o1bV3x1lPKdU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HdtxJ4/bSXwqXCvmIPfks9tn7+Sy3lZv+ZpXTBglwq8=; b=fAqKJXbk+OUvfRFPKSQHCLpK/s
 0okw5KLoZw6V/hT38PvtAJV5QxX7lmHNCn+33Q1rUUrXoNaea4zX5wzwIOoji2TYpAADiBgC+5/L6
 bO6YH9oulwsfO5RRQaJphBv8I297++CXn4i4/GFtVSH1rFck3TY16fYrHRgb0a1jf678=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j7OnE-007v97-K9
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Feb 2020 19:26:04 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D6ADC24691;
 Thu, 27 Feb 2020 19:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582831546;
 bh=kGU0a0I3IvKdb4w1iUhQ37ywQbN9rjfpMR5iKdjutug=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V3StYee0L66BoNn9KcVM2tPtSK3paFsNrIKznwTf8CK9KxeFhi3ZH/ln7EP5hXIAr
 HAUNj01Ixcs9roRcSoN5rmOMIs2EkSno4j81M0pJkUBY7UL2ArRgnsY8mn83Xw51Q9
 aQsDsd891ZxVxCj7opcQJOBy1jaEwhuOgnfsz6oI=
Date: Thu, 27 Feb 2020 11:25:44 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200227192544.GE877@sol.localdomain>
References: <20200221115050.238976-1-satyat@google.com>
 <20200221115050.238976-4-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221115050.238976-4-satyat@google.com>
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
X-Headers-End: 1j7OnE-007v97-K9
Subject: Re: [f2fs-dev] [PATCH v7 3/9] block: blk-crypto-fallback for Inline
 Encryption
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
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Feb 21, 2020 at 03:50:44AM -0800, Satya Tangirala wrote:
> Blk-crypto delegates crypto operations to inline encryption hardware when
> available. The separately configurable blk-crypto-fallback contains a
> software fallback to the kernel crypto API - when enabled, blk-crypto
> will use this fallback for en/decryption when inline encryption hardware is
> not available. This lets upper layers not have to worry about whether or
> not the underlying device has support for inline encryption before
> deciding to specify an encryption context for a bio, and also allows for
> testing without actual inline encryption hardware. For more details, refer
> to Documentation/block/inline-encryption.rst.
> 
> Signed-off-by: Satya Tangirala <satyat@google.com>

In v7, only blk_mq_make_request() actually calls blk_crypto_bio_prep().
That will make the crypto contexts be silently ignored (no fallback) if
q->make_request_fn != blk_mq_make_request.

In recent kernels that *hopefully* won't matter in practice since almost
everyone is using blk_mq_make_request.  But it still seems like a poor design.
First, it's super important that if someone requests encryption, then they
either get it or get an error; it should *never* be silently ignored.  Second,
part of the goal of blk-crypto-fallback is that it should always work, so that
in principle users don't have to implement the encryption twice, once via
blk-crypto and once via fs or dm-layer crypto.

So is there any reason not to keep the blk_crypto_bio_prep() call in
generic_make_request()?

I think performance can't be much of a complaint, since if almost everyone is
using blk_mq_make_request() then they are making the function call anyway...

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
