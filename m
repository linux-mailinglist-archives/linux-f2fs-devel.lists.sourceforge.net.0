Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBE9EF32A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Nov 2019 03:01:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iRoA1-0005A6-Di; Tue, 05 Nov 2019 02:01:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iRoA0-00059z-Fa
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Nov 2019 02:01:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8SqxdbWW2hGii6NEoT27S461QioKFHlN3a8Zu2JC+gY=; b=kF9ijL4P2bDESN7mOOh/JXYbaG
 KdJ3hciAqbJawqfuDyGxAfBVJPgczNtaDD7wVOqMRgBaBi51Q0ggIFJ5q6fDA2HvLmt/WMYi4dq3c
 WYWUkDnlsGERQEE9ynilv/4paJJT8eT1rbgm1IjzzNszSGTfOapcd7KjKAIkCneIhrNk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8SqxdbWW2hGii6NEoT27S461QioKFHlN3a8Zu2JC+gY=; b=RmyJ2OkIqbu36aXUPTu/6N6VJU
 t8YCHm4kcShywdx1M1LFeyhIZENyvX6paWu7XI5iOVNaMYpadLOa6fJ/P5sIhz1KOfCeN5A0ID30o
 JlaJTfBmm2TcNvfJ7mKcVOEJm0Q6fnG9M1KdhyWV/2IaZuUSd9EkV3xdyDBjh4zNlFv8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iRo9y-000Syv-Dl
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Nov 2019 02:01:32 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2ED04214D9;
 Tue,  5 Nov 2019 02:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572919279;
 bh=CtYzEOLUJiJVw7LkU0ikWGBxXmc2ytwbSO6nB3S0oOQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b/LIMVC7ijyBb7xmYOfvkI9tl8E1YcrM/cjAWP8uE09ctUtNTqIy5xr+keK3nXmER
 a2oCO2mbOYu1sVyde0YD9M9X7Vc+NCTbtiEs5LFzVl7NuCwKtdX1Bo811XRYGa11AX
 8gUS2AAwnzBpNglST9wgGDyDkUkPi0Pmskgn5b34=
Date: Mon, 4 Nov 2019 18:01:17 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20191105015411.GB692@sol.localdomain>
Mail-Followup-To: Christoph Hellwig <hch@infradead.org>,
 "Theodore Y. Ts'o" <tytso@mit.edu>, linux-block@vger.kernel.org,
 linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Satya Tangirala <satyat@google.com>, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20191028072032.6911-1-satyat@google.com>
 <20191028072032.6911-4-satyat@google.com>
 <20191031175713.GA23601@infradead.org>
 <20191031205045.GG16197@mit.edu>
 <20191031212234.GA32262@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191031212234.GA32262@infradead.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
X-Headers-End: 1iRo9y-000Syv-Dl
Subject: Re: [f2fs-dev] [PATCH v5 3/9] block: blk-crypto for Inline
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
Cc: "Theodore Y. Ts'o" <tytso@mit.edu>, linux-scsi@vger.kernel.org,
 Kim Boojin <boojin.kim@samsung.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>, Satya Tangirala <satyat@google.com>,
 linux-block@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Oct 31, 2019 at 02:22:34PM -0700, Christoph Hellwig wrote:
> On Thu, Oct 31, 2019 at 04:50:45PM -0400, Theodore Y. Ts'o wrote:
> > One of the reasons I really want this is so I (as an upstream
> > maintainer of ext4 and fscrypt) can test the new code paths using
> > xfstests on GCE, without needing special pre-release hardware that has
> > the ICE support.
> > 
> > Yeah, I could probably get one of those dev boards internally at
> > Google, but they're a pain in the tuckus to use, and I'd much rather
> > be able to have my normal test infrastructure using gce-xfstests and
> > kvm-xfstests be able to test inline-crypto.  So in terms of CI
> > testing, having the blk-crypto is really going to be helpful.
> 
> Implementing the support in qemu or a special device mapper mode
> seems like a much better idea for that use case over carrying the
> code in the block layer and severely bloating the per-I/O data
> structure.
> 

QEMU doesn't support UFS, but even if it did and we added the UFS v2.1 crypto
support, it would preclude testing with anything other than a custom QEMU VM or
a system with real inline encryption hardware.  gce-xfstests wouldn't work.  So
it would be much harder to test inline encrypted I/O, so e.g. in practice it
wouldn't be tested as part of the regular ext4 regression testing.

The advantages of blk-crypto over a device mapper target like "dm-inlinecrypt"
are (a) blk-crypto is much easier for userspace to use, and (b) blk-crypto
allows upper layers to simply use inline encryption rather than have to
implement encryption twice, once manually and once with inline encryption.

It's true that as of this patchset, the only user of this stuff (fscrypt) still
implements both I/O paths anyway.  But that's something that could change later
once blk-crypto is ready for it, with longer IV support, O(1) keyslot lookups,
and a way to configure whether hardware is used or not.  Satya is already
looking into longer IV support, and I have a proposal for making the keyslot
lookups O(1) using a hash table.

I think that "Severely bloating the per-I/O data structure" is an exaggeration,
since that it's only 32 bytes, and it isn't in struct bio directly but rather in
struct bio_crypt_ctx...

In any case, Satya, it might be a good idea to reorganize this patchset so that
it first adds all logic that's needed for "real" inline encryption support
(including the needed parts of blk-crypto.c), then adds the crypto API fallback
as a separate patch.  That would separate the concerns more cleanly and make the
patchset easier to review, and make it easier to make the fallback
de-configurable or even remove it entirely if that turns out to be needed.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
