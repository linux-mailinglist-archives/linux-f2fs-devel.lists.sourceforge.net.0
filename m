Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 669571415E2
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 18 Jan 2020 06:12:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1isgOm-0004Cw-Nv; Sat, 18 Jan 2020 05:11:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1isgOl-0004Ci-0N
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 18 Jan 2020 05:11:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qGPN4eKjy0q1Nr7df1v/MQGUsZbaDG2xQLf4+pjrA+0=; b=bq9a9YrYuQDMsdfMTN0/gCdWHN
 MwnP7qTPYiP1q8EVKmYEb7w+3QThod5uXWXlzPCDK4OzcXQt4Pvnthieq7RaanGFTTCfjU1K4ctSb
 SWdQmllJxnJRJTJWDLjghSLeR9HaOTrsyUiD12kKYo4RZSC1BWhXuz9/KnD5Qlz15qEU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qGPN4eKjy0q1Nr7df1v/MQGUsZbaDG2xQLf4+pjrA+0=; b=gA66FE8Vta2Xhy6keLOzJq7oZG
 xuAb6lwG3Hd41US2Uz4FmgZDEDgor6+6YfdCdVSARYNDVs3obX6ktZloQpcEkO5wYTXn7orZdL56b
 Y+Q6zSl0s0KDmZ0y2iRXUDin3Sal3VBymf67u8EWm8Nb4o+aP9MzCD61GrKsN2PPcJtw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1isgOe-00C32C-Tr
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 18 Jan 2020 05:11:50 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2A29920748;
 Sat, 18 Jan 2020 05:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579324294;
 bh=t1vZ8SC75mtY4AmwN7SBHRlYKSnagbFkoaCXwsRkvkA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bfOP60cwtWBH/v8P6bKJMNpc8Gkl63UB2y/k5qFX75fnnZYBU3quTl4yD8apowsL/
 7ByOM9cn0DYjc8FS39COLzmK1v0ugkAnRQwk5YG9zWgVJVbJpmspIMpmPonMkzfVw1
 4AM/C7CY1Yz5ho+rFMdKDos1teJ3jUJntffPomMo=
Date: Fri, 17 Jan 2020 21:11:32 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200118051132.GC3290@sol.localdomain>
References: <20191218145136.172774-1-satyat@google.com>
 <20191218145136.172774-3-satyat@google.com>
 <20191218212116.GA7476@magnolia> <yq1y2v9e37b.fsf@oracle.com>
 <20191218222726.GC47399@gmail.com> <yq1fthhdttv.fsf@oracle.com>
 <20200108140730.GC2896@infradead.org>
 <20200108172629.GA232722@sol.localdomain>
 <20200117083221.GA324@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200117083221.GA324@infradead.org>
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
X-Headers-End: 1isgOe-00C32C-Tr
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
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-scsi@vger.kernel.org, "Darrick J. Wong" <darrick.wong@oracle.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>, Kim Boojin <boojin.kim@samsung.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Satya Tangirala <satyat@google.com>, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jan 17, 2020 at 12:32:21AM -0800, Christoph Hellwig wrote:
> 
> File systems don't move data around all that often (saying that with my
> fs developer hat on).  In traditional file systems only defragmentation
> will move data around, with extent refcounting it can also happen for
> dedup, and for file systems that write out of place data gets moved
> when parts of a block are rewritten, but in that case a read modify
> write cycle is perfomed in the Linux code anyway, so it will go through
> the inline encryption engined on the way and the way out.
> 
> So in other words - specifying an IV would be useful for some use cases,
> but I don't think it is a deal blocker. Even without that is is useful
> for block device level encryption, and could have some usefulness for
> file system encryption usage.
> 
> I think that adding an IV would eventually be useful, but fitting that
> into NVMe won't be easy, as you'd need to find a way to specify the IV
> for each submission queue entry, which requires growing it, or finding
> some way to extend it out of band.

Sure, people have even done inline crypto on ext4 before (downstream), using the
LBA for the IV.  But log-structured filesystems like f2fs move data blocks
around *without the encryption key*; and at least for fscrypt, f2fs support is
essential.  In any case it's also awkward having the physical on-disk location
determine the ciphertext on-disk, as then the result isn't fully controlled by
the encryption settings you set, but also based on where your filesystem is
located on-disk (with extra fun occurring if there's any sort of remapping layer
in between).  But sure, it's not *useless* to not be able to specify the IV,
it's just annoying and less useful.

[I was also a bit surprised to see that NVMe won't actually allow specify the
IV, as I thought you had objected to the naming of the INLINE_CRYPT_OPTIMIZED
fscrypt policy flag partly on the grounds that NVMe would support IVs longer
than the 64 bits that UFS is limited to.  Perhaps I misunderstood though.]

> > So let's not over-engineer this kernel patchset to support some broken
> > vaporware, please.
> 
> Not sharing bio fields for integrity and encryption actually keeps
> the patchset simpler (although uses more memory if both options are
> enabled).  So my main point here is to not over engineer it for broken
> premise that won't be true soon.

Well there are 3 options:

(a) Separate fields for bi_crypt_context and bi_integrity
(b) bi_crypt_context and bi_integrity in union
(c) One pointer that can support both features,
    e.g. linked list of tagged structs.

It sounds like you're advocating for (a), but I had misunderstood and thought
you're advocating for (c).  We'd of course be fine with (a) as it's the
simplest, but other people are saying they prefer (b).

Satya, to resolve this I think you should check how hard (b) is to implement --
i.e. is it easy, or is it really tricky to ensure the features are never used
together?  (Considering that it's probably not just a matter of whether any
hardware supports both features, as dm-integrity supports blk-integrity in
software and blk-crypto-fallback supports blk-crypto in software.)

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
