Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C431D4DB2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 May 2020 14:33:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/9cKDql/d/NIBJpi2SVzEmehq/+4gPlWYinR95P9YdU=; b=meyskwnIKkbFn8vaDKBvo5GaT
	LFC4bEUgtozbVDznpswKfIznzHsYQGHU8F1QL5kH/88L2oCvA/R96zVQ7U63r4NWVggOef3VEgjdy
	0/AmS9nVb6RpHorONto4Q9JFjNR3sNeUUcQKUdSHOr3TOTc3v3slSpSL9eKiNi3N8j09o=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jZZXD-0007bE-Px; Fri, 15 May 2020 12:33:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <satyat@google.com>) id 1jZZXC-0007b7-UL
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 May 2020 12:33:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bm1fAyG7yZavy9O90p1YkTKfmJanzeKvfx2jV+h6w2Q=; b=OyHMRcY6vsu33QTYxnDRw5Mi8U
 7dSyCD7LDZBsml0XtRDfBiHpBj7jDMev8qgfoeWZTujism1wD1Q6cbC0owXesyrd/hqLTduA4PCjn
 A7Ef3/ffIeEDGwvMVcvrZ+zuy0l5Fp0CTD+d/M4/GZ3rOTZP3DFX8l0kzQgV6YR2qT+c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Bm1fAyG7yZavy9O90p1YkTKfmJanzeKvfx2jV+h6w2Q=; b=SYnpJ/WS8dsR0AkpppI+vMwhtG
 miN+dx3Cg9WYkaCgtF0giCIyAOMwNSk68jHozfG7Jq688Vwk+5kzhP1OjT1eKTtOO0TOJV6OQEyCT
 9f+NAd3pFRciroEqHYSv9B5a7uxkFCIqwF316T5uWAEpVi+nePbnaXuBgyjF/TS6G2fg=;
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jZZXA-008YIW-Vg
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 May 2020 12:33:50 +0000
Received: by mail-oi1-f195.google.com with SMTP id r25so2058612oij.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 May 2020 05:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Bm1fAyG7yZavy9O90p1YkTKfmJanzeKvfx2jV+h6w2Q=;
 b=mO9NPpo9BoTez+GQFpFt+Y3Cq/lG5g+yDRA4ftiV8ORIKSH8v5BAPa9DGSz1K6BrvB
 OZIUrB91xEiaBbi9USZ/NlzeicZNr6N4UsDeRuVinZtLxKLjG9q6xxEkHuvnCmJ8QXDH
 3gxFI9TH5fOpeWJ+WJtC87IszNA++1G54plFnlVbWpvCXCNhJ2Uo2+wle2cXiEkxulo6
 fIqTVOJm6R92VPR5adK2c3B8rEL6s7NQRN0UDNpidt88M4dm51jnL4kuDaZHtdaiPjwk
 OvRDms0Y/BlxHKP15cz6Vkm3sBqQWjOc2yIvtdz74eW5NoW6b+nrfDKW9ZeEKdzhP98W
 IdmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Bm1fAyG7yZavy9O90p1YkTKfmJanzeKvfx2jV+h6w2Q=;
 b=JoKcmE8oH0Nad1GMUhRSW8XNy9p45clCxiGAjpakAqqqCNi0AScsbS9nNVUC/bOW4H
 UveaezTaP9MCBfKR4DLc+7Jh5jNYTeZxSl/1peu11AJGuALL0olvLzF4J+ybFogWd8A3
 JP31UB1xZnvWmsWRNYsbJecfQ+GwuqwuQBPfll4y+Xs1C1xobJ4tS1Lh4dxy2l9yZH7p
 b+5/zv5bvd2QvEoFRXKVl/7tOhVacmszFI4lDkKkFw8OWPCUDz2ca0j9g1XpFpyyxWnN
 0GaFDLNpcU9UOZHi8n/OruOJLskh45tM274Z7k2Bp7gwpL5x/DJcyXoZ72oU3r1vbQQf
 oN7Q==
X-Gm-Message-State: AOAM531yG3fmT1POyqsI7TBqzloixiNNl4R3iCWpDYipiKsf1tM69RY0
 5wsFJ8tMv8a+SX+PCxlcflJc1StOr5Lw/A==
X-Google-Smtp-Source: ABdhPJxodWiVpnp/bpk1spKFiU7lxS4aXxV09hAXu63vFlSE+V2nv5d8z4dCbHLg6VnBvKtknCleww==
X-Received: by 2002:a17:90b:1104:: with SMTP id
 gi4mr2989366pjb.115.1589545544694; 
 Fri, 15 May 2020 05:25:44 -0700 (PDT)
Received: from google.com (240.242.82.34.bc.googleusercontent.com.
 [34.82.242.240])
 by smtp.gmail.com with ESMTPSA id k73sm1100151pje.55.2020.05.15.05.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 05:25:44 -0700 (PDT)
Date: Fri, 15 May 2020 12:25:40 +0000
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200515122540.GA143740@google.com>
References: <20200514003727.69001-1-satyat@google.com>
 <20200514051053.GA14829@sol.localdomain>
 <8fa1aafe-1725-e586-ede3-a3273e674470@kernel.dk>
 <20200515074127.GA13926@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200515074127.GA13926@infradead.org>
X-Spam-Score: -16.0 (----------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.195 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jZZXA-008YIW-Vg
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, May 15, 2020 at 12:41:27AM -0700, Christoph Hellwig wrote:
> On Thu, May 14, 2020 at 09:48:40AM -0600, Jens Axboe wrote:
> > I have applied 1-5 for 5.8. Small tweak needed in patch 3 due to a header
> > inclusion, but clean apart from that.
> 
> I looked at this a bit more as it clashed with my outstanding
> q_usage_counter optimization, and I think we should move the
> blk_crypto_bio_prep call into blk-mq, similar to what we do about
> the integrity_prep call.  Comments?
> 
> ---
> From b7a78be7de0f39ef972d6a2f97a3982a422bf3ab Mon Sep 17 00:00:00 2001
> From: Christoph Hellwig <hch@lst.de>
> Date: Fri, 15 May 2020 09:32:40 +0200
> Subject: block: move blk_crypto_bio_prep into blk_mq_make_request
> 
> Currently blk_crypto_bio_prep is called for every block driver, including
> stacking drivers, which is probably not the right thing to do.  Instead
> move it to blk_mq_make_request, similar to how we handle integrity data.
> If we ever grow a low-level make_request based driver that wants
> encryption it will have to call blk_crypto_bio_prep manually, but I really
> hope we don't grow more non-stacking make_request drivers to start with.
One of the nice things about the current design is that regardless of what
request queue an FS sends an encrypted bio to, blk-crypto will be able to handle
the encryption (whether by using hardware inline encryption, or using the
blk-crypto-fallback). The FS itself does not need to worry about what the
request queue is.

But if we move blk_crypto_bio_prep into blk_mq_make_request, the FS loses this
ability to not care about the underlying request queue - it can no longer send a
bio with an encryption context to queue such that q->make_request_fn !=
blk_mq_make_request_fn. To restore that ability, we'll need to add calls to
blk_crypto_bio_prep to every possible make_request_fn (although yes, if we do
decide to add the call to blk_crypto_bio_prep in multiple places, I think it'll
be fine to only add it to the non-stacking make_request_fns).

Also, I tried to look through the patch with the q_usage_counter optimization -
is it this one?

[PATCH 4/4] block: allow blk_mq_make_request to consume the q_usage_counter reference

> 
> This also means we only need to do the crypto preparation after splitting
> and bouncing the bio, which means we don't bother allocating the fallback
> context for a bio that might only be a dummy and gets split or bounced
> later.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  block/blk-core.c | 13 +++++--------
>  block/blk-mq.c   |  2 ++
>  2 files changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/block/blk-core.c b/block/blk-core.c
> index 1e97f99735232..ac59afaa26960 100644
> --- a/block/blk-core.c
> +++ b/block/blk-core.c
> @@ -1131,12 +1131,10 @@ blk_qc_t generic_make_request(struct bio *bio)
>  			/* Create a fresh bio_list for all subordinate requests */
>  			bio_list_on_stack[1] = bio_list_on_stack[0];
>  			bio_list_init(&bio_list_on_stack[0]);
> -			if (blk_crypto_bio_prep(&bio)) {
> -				if (q->make_request_fn)
> -					ret = q->make_request_fn(q, bio);
> -				else
> -					ret = blk_mq_make_request(q, bio);
> -			}
> +			if (q->make_request_fn)
> +				ret = q->make_request_fn(q, bio);
> +			else
> +				ret = blk_mq_make_request(q, bio);
>  
>  			blk_queue_exit(q);
>  
> @@ -1185,8 +1183,7 @@ blk_qc_t direct_make_request(struct bio *bio)
>  		return BLK_QC_T_NONE;
>  	if (unlikely(bio_queue_enter(bio)))
>  		return BLK_QC_T_NONE;
> -	if (blk_crypto_bio_prep(&bio))
> -		ret = blk_mq_make_request(q, bio);
> +	ret = blk_mq_make_request(q, bio);
>  	blk_queue_exit(q);
>  	return ret;
>  }
> diff --git a/block/blk-mq.c b/block/blk-mq.c
> index d2962863e629f..0b5a0fa0d124b 100644
> --- a/block/blk-mq.c
> +++ b/block/blk-mq.c
> @@ -2033,6 +2033,8 @@ blk_qc_t blk_mq_make_request(struct request_queue *q, struct bio *bio)
>  	blk_queue_bounce(q, &bio);
>  	__blk_queue_split(q, &bio, &nr_segs);
>  
> +	if (!blk_crypto_bio_prep(&bio))
> +		return BLK_QC_T_NONE;
>  	if (!bio_integrity_prep(bio))
>  		return BLK_QC_T_NONE;
>  
> -- 
> 2.26.2
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
