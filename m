Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1671446D7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Jan 2020 23:05:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PL0qNb2+b4N2ye63SjVciuAj4jMat1zPPb7aWd3/9Sw=; b=X7+grtydZA4zRPjMXApUdA+E6
	RF2ySWpXZhUBW+UiHFLCprEaq2/yR56k9V2XLZ6fMCN4KIQlXh3yE+xWgCReiO6abRatOqOMb//Sx
	n/sZLJTpo9L6NQ7dELug9t/r9tPFdsb1IUEaEH7vvdkusEEYGuXqYiiCTNTnfOq7OAcN4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iu1eW-0005Pa-2S; Tue, 21 Jan 2020 22:05:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <satyat@google.com>) id 1iu1eU-0005PT-8D
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Jan 2020 22:05:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MHL1t/EyEsW/kDCQVsvBnpYeqWiiNR3Qofvm72VP2xo=; b=mJLjvs90ikq3eWrZQ1mJq5qB1t
 PtNMyaraAR78l2t6QjSxyLSU7ognQwV2ZNOJOU9/x45SSLv1SNGuP6e3j9zvAu68R3MEGw+sMnEP8
 cKsK4zL3wiOPLCofRZu4nZxPuktIpgw4PysbHdGlLUTBJN+DYAZnyRxsEk6/IXy76T0I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MHL1t/EyEsW/kDCQVsvBnpYeqWiiNR3Qofvm72VP2xo=; b=WigniO3Q54VeleBEtOYvr03Vps
 ASwSzaiq4XZEyXNPvgHbsqPM+GePR+ZQZ1hi7lxKQUQqObQJqbswiKVkmd5WdXhx5mUVCIz6jSSTO
 P1j5jN+t3OBoS+EQw7ki+Yly1KicB2Uco14oyR+pqs6fmzsNHZwXxlUaCyWPNLjNgTx8=;
Received: from mail-pf1-f196.google.com ([209.85.210.196])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iu1eP-00CuTi-Pq
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Jan 2020 22:05:38 +0000
Received: by mail-pf1-f196.google.com with SMTP id 4so2195295pfz.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 21 Jan 2020 14:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MHL1t/EyEsW/kDCQVsvBnpYeqWiiNR3Qofvm72VP2xo=;
 b=b+DkuJVKIKETrJ5dpTxidfDLzDLkavoiNLhArG3sMhvs1V6c3puRQUI9pG9KRYRWPd
 8fRSkviBHz+tFzxp4t+VfIOdI/jgi3sJ8Vewc009gojBVO6V1BECgJK5222fsEzQXJQm
 wbAnTgKeIHbOU4Tr5RKZqicWx20WuZ71yUO7sN1kR4zsn3mD7Zznv4+GsRhRluFNXZeS
 DWYSw9vYZzXEm7IIrBEuVWdlXIRxeFhGVZcjpgT2fJKpY4FFj1SMuLJIJkxJTe5YPqoE
 FIMd1Y6nmyaf6ERoXAdUmhkH+AVj9CIIhltvG0/65sNQMh+6F+GSHDHh8Fzlp3CXn/CF
 WCHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MHL1t/EyEsW/kDCQVsvBnpYeqWiiNR3Qofvm72VP2xo=;
 b=Ip5FVsew8JpzB2RaI3BMdxXA3rI1vg4qkQiw2v+b/1Ynd+iYAgn/95NrA1ZYpFGVnO
 kXXQj2SNz2ONNXoXFdoRZWD7hpjwKCCoA8O9sf9Vi/Itu3grToMQp8rQcYWQdfWl7xfA
 9Z7szD8gOQBbQmnRMMXrVe9UpOCCz6mCcoSdqkapXDTele7bAzOtGRZF3xgC2anXvV9P
 8rA5DAgR8CNsn4iA147kXV2CbFc1Q4pOczooS3bdRmsUJ1vSm/uZnul/JdK1JL38gXUO
 XlcxW3YXrmZJTJGYaFpFXtkdS2Vq4a5K59/dosEZXyXcr9YAPcx4J6kOQb4rrwnPGL9F
 pfAw==
X-Gm-Message-State: APjAAAXJpLpFT7r4kd0vLcAqqPQsdBJfi3EsC8dNgRHBomCVDhHSm0lm
 OKkjCuFgt5aVEYwFuyBBU8OUhA==
X-Google-Smtp-Source: APXvYqwh8OnW+eP9V0DrV7fz7N0b2aotldt8ipMvaida+/kr2JuRziMzbgGUGDkawpb/E1PWbTxPyg==
X-Received: by 2002:a63:6d8d:: with SMTP id i135mr7771059pgc.90.1579644327592; 
 Tue, 21 Jan 2020 14:05:27 -0800 (PST)
Received: from google.com ([2620:15c:201:0:7f8c:9d6e:20b8:e324])
 by smtp.gmail.com with ESMTPSA id a16sm41620400pgb.5.2020.01.21.14.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 14:05:27 -0800 (PST)
Date: Tue, 21 Jan 2020 14:05:22 -0800
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200121220522.GA243816@google.com>
References: <20191218145136.172774-1-satyat@google.com>
 <20191218145136.172774-3-satyat@google.com>
 <20191218212116.GA7476@magnolia> <yq1y2v9e37b.fsf@oracle.com>
 <20191218222726.GC47399@gmail.com> <yq1fthhdttv.fsf@oracle.com>
 <20200108140730.GC2896@infradead.org>
 <20200108172629.GA232722@sol.localdomain>
 <20200117083221.GA324@infradead.org>
 <20200118051132.GC3290@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200118051132.GC3290@sol.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -14.2 (--------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.196 listed in list.dnswl.org]
 1.8 FSL_HELO_FAKE          No description available.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iu1eP-00CuTi-Pq
Subject: Re: [f2fs-dev] [PATCH v6 2/9] block: Add encryption context to
 struct bio
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
Cc: linux-block@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>, Kim Boojin <boojin.kim@samsung.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jan 17, 2020 at 09:11:32PM -0800, Eric Biggers wrote:
> On Fri, Jan 17, 2020 at 12:32:21AM -0800, Christoph Hellwig wrote:
> > 
> > File systems don't move data around all that often (saying that with my
> > fs developer hat on).  In traditional file systems only defragmentation
> > will move data around, with extent refcounting it can also happen for
> > dedup, and for file systems that write out of place data gets moved
> > when parts of a block are rewritten, but in that case a read modify
> > write cycle is perfomed in the Linux code anyway, so it will go through
> > the inline encryption engined on the way and the way out.
> > 
> > So in other words - specifying an IV would be useful for some use cases,
> > but I don't think it is a deal blocker. Even without that is is useful
> > for block device level encryption, and could have some usefulness for
> > file system encryption usage.
> > 
> > I think that adding an IV would eventually be useful, but fitting that
> > into NVMe won't be easy, as you'd need to find a way to specify the IV
> > for each submission queue entry, which requires growing it, or finding
> > some way to extend it out of band.
> 
> Sure, people have even done inline crypto on ext4 before (downstream), using the
> LBA for the IV.  But log-structured filesystems like f2fs move data blocks
> around *without the encryption key*; and at least for fscrypt, f2fs support is
> essential.  In any case it's also awkward having the physical on-disk location
> determine the ciphertext on-disk, as then the result isn't fully controlled by
> the encryption settings you set, but also based on where your filesystem is
> located on-disk (with extra fun occurring if there's any sort of remapping layer
> in between).  But sure, it's not *useless* to not be able to specify the IV,
> it's just annoying and less useful.
> 
> [I was also a bit surprised to see that NVMe won't actually allow specify the
> IV, as I thought you had objected to the naming of the INLINE_CRYPT_OPTIMIZED
> fscrypt policy flag partly on the grounds that NVMe would support IVs longer
> than the 64 bits that UFS is limited to.  Perhaps I misunderstood though.]
> 
> > > So let's not over-engineer this kernel patchset to support some broken
> > > vaporware, please.
> > 
> > Not sharing bio fields for integrity and encryption actually keeps
> > the patchset simpler (although uses more memory if both options are
> > enabled).  So my main point here is to not over engineer it for broken
> > premise that won't be true soon.
> 
> Well there are 3 options:
> 
> (a) Separate fields for bi_crypt_context and bi_integrity
> (b) bi_crypt_context and bi_integrity in union
> (c) One pointer that can support both features,
>     e.g. linked list of tagged structs.
> 
> It sounds like you're advocating for (a), but I had misunderstood and thought
> you're advocating for (c).  We'd of course be fine with (a) as it's the
> simplest, but other people are saying they prefer (b).
> 
> Satya, to resolve this I think you should check how hard (b) is to implement --
> i.e. is it easy, or is it really tricky to ensure the features are never used
> together?  (Considering that it's probably not just a matter of whether any
> hardware supports both features, as dm-integrity supports blk-integrity in
> software and blk-crypto-fallback supports blk-crypto in software.)
> 
> - Eric

What I have right now for v7 of the patch series was my attempt at (b) (since
some were saying they prefer it) - it may still be incomplete though because I
missed something, but here's what I think it involved:

1) bi_crypt_context is never set after bi_integrity, so I don't check if
   bi_integrity is set or not when setting bi_crypt_context - this keeps the
   code cleaner when setting the bi_crypt_context.

2) I made it error whenever we try to set bi_integrity on a bio with
   REQ_BLK_CRYPTO.

3) There is an issue with the way the blk-crypto-fallback interacts with bio
   integrity. One of the goals of the fallback is to make it inline encryption
   transparent to the upper layers (i.e. as far as the upper layers are
   concerned there should be no difference whether there is actual hardware
   inline encryption support or whether the fallback is used instead).

   The issue is, when the fallback encrypts a bio, it clones the bio and
   encrypts the pages in the clone, but the clone won't have a bi_crypt_context
   (since otherwise, when the clone is resubmitted, blk-crypto would incorrectly
   assume that the clone needs to be encrypted once again). When bi_integrity is
   set on the clone, there won't be any error detected since REQ_BLK_CRYPTO
   won't be set on the clone. However, if hardware inline encryption support had
   been present, and the blk-crypto had not used the fallback, the same bio
   would have bi_crypt_context set when we try to set bi_integrity, which would
   then fail.

   To fix this issue, I introduced another flag REQ_NO_SPECIAL (subject to being
   renamed when I think of/someone suggests a better name), which when set on
   the bio, indicates that bi_integrity (and in future whatever other fields
   share the same union, shouldn't be set on that bio. I can probably do away
   with the new flag and just set REQ_BLK_CRYPTO and also set
   bi_crypt_context = NULL to signify the same thing, but either way, it doesn't
   seem like a very clean solution to me.

4) I don't think there's actually an issue with dm-integrity as long as when we
   add support for inline encryption to dm, we ensure that if any of the child
   targets is dm-integrity, then the dm device says it doesn't support any
   crypto mode. This way, encryption is always consistently done before
   integrity calculation, which is always consistently done before decryption
   (and when dm-integrity is not using the internal hash, then the bio will fail
   because of (2), but this is still consistent whether or not hardware inline
   encryption support is present.

However, even if we decide to do (a), I'll still need to ensure that when bio
integrity and blk-crypto are used together, the results are consistent
regardless of whether hardware inline crypto support is present. So I either
disallow bio integrity to be used with blk-crypto, in which case I'll need to
do something similar to what I had to do in (3) like introduce REQ_NO_SPECIAL
and we also lose the advantage of not having the two fields shared in a union,
or I allow them to be used together while ensuring consistent results by
maybe doing something like forcing blk-crypto to fallback to the crypto API
whenever the target device for a bio has a bio integrity profile (and whatever
checks are done in bio_integrity_prep).

So I'm not sure if (a) is a lot easier or cleaner. But unlike (b), (a)
does give us the option of using the two features together....if it seems
likely that we'll want to use both these features together at some point,
then maybe I should switch back to (a), and for now just disallow the two
features from being used together since that's still easier than trying to get
them both to work together, and once we know for sure that we want to use both
together, we can make the necessary additions then?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
