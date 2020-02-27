Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF8717270E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Feb 2020 19:26:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j7Nr6-0007Nd-4d; Thu, 27 Feb 2020 18:25:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1j7Nr5-0007NK-IQ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Feb 2020 18:25:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rGN2ZVzy+sEmHT6JKLIaNK0I1WLlg56MSs0ePUE9bbg=; b=Se8wfnZO+f+v4MbOV167RYZZsR
 +687PAeL7wdWHsKrQzNQmeZw2/a47jPwQlpSdlhXkXioiYH4I3em2Ql1EZY0vTVys2z300q/zFHdm
 Sa9zo4fEFcNc2LxZ9g8P6wP/0mRrcvbE4R0cEKPGesqa3yhZyvRmqWdeWtFcZm0syJU8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rGN2ZVzy+sEmHT6JKLIaNK0I1WLlg56MSs0ePUE9bbg=; b=EfB9zPLCOtzoPECZSyC3sJ8bix
 XwVsqsAwurXs+53r5VgUQ4OB0oHs3gNdaLbQ0Vgj3X3oqq7zU1PYSHhGgTg91PEPRs201rozxnqlj
 zo2wapxR8ustWclAa52vijNqEpwdzDDVxhtLtGxjMu5yDZ4/ENDYMJyfhsqEGWrGajtI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j7Nr4-00BOU3-Fi
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Feb 2020 18:25:51 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 92AA12469C;
 Thu, 27 Feb 2020 18:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582827944;
 bh=ppmsgmJewgic6G8TyCPg5XN+BbEH2w+mIirTlE881lU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rv/J+aex7sJzrVtxikFTce8cCr8/2At1pTM6DS4zoQmnPK6LdfBrO3VcaDBml1o8j
 uZlALOG7V9KujDvjy4l3Yzoe2v9e4amlZ1g7tPPyYoCDeWkO3x8y/pZMpA/jHoajC5
 fNsOS3mWSF3O1iNaWOlI5CNtSb+C4H/O2cjhJHGE=
Date: Thu, 27 Feb 2020 10:25:43 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200227182543.GC877@sol.localdomain>
References: <20200221115050.238976-1-satyat@google.com>
 <20200221115050.238976-3-satyat@google.com>
 <20200221172205.GB438@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221172205.GB438@infradead.org>
X-Spam-Score: -0.3 (/)
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
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j7Nr4-00BOU3-Fi
Subject: Re: [f2fs-dev] [PATCH v7 2/9] block: Inline encryption support for
 blk-mq
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
Cc: linux-ext4@vger.kernel.org, linux-scsi@vger.kernel.org,
 Kim Boojin <boojin.kim@samsung.com>, Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Satya Tangirala <satyat@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Feb 21, 2020 at 09:22:05AM -0800, Christoph Hellwig wrote:
> > +int blk_crypto_evict_key(struct request_queue *q,
> > +			 const struct blk_crypto_key *key)
> > +{
> > +	if (q->ksm && blk_ksm_crypto_mode_supported(q->ksm, key))
> > +		return blk_ksm_evict_key(q->ksm, key);
> > +
> > +	return 0;
> > +}
> 
> Is there any point in this wrapper that just has a single caller?
> Als why doesn't blk_ksm_evict_key have the blk_ksm_crypto_mode_supported
> sanity check itself?

Later in the series it's changed to:

int blk_crypto_evict_key(struct request_queue *q,
                         const struct blk_crypto_key *key)
{
        if (q->ksm && blk_ksm_crypto_mode_supported(q->ksm, key))
                return blk_ksm_evict_key(q->ksm, key);

        return blk_crypto_fallback_evict_key(key);
}

I.e. if the encryption mode is using hardware, then the key needs to be evicted
from q->ksm.  Otherwise the key needs to be evicted from the fallback.

Also keep in mind that our goal is to define a clean API for any user of the
block layer to use encryption, not just fs/crypto/.  That API includes:

	blk_crypto_init_key()
	blk_crypto_start_using_key()
	bio_crypt_set_ctx()
	blk_crypto_evict_key()

If anyone else decides to use inline encryption (e.g., if inline encryption
support were added to dm-crypt or another device-mapper target), they'll use
these same functions.

So IMO it's important to define a clean API that won't need to be refactored as
soon as anyone else starts using it, and not e.g. micro-optimize for code length
based on there currently being only one user.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
