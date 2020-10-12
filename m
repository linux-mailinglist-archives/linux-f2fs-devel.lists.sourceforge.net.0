Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 091D828BE59
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Oct 2020 18:45:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kS0wv-0002AM-1q; Mon, 12 Oct 2020 16:45:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>)
 id 1kS0ws-0002AA-IS; Mon, 12 Oct 2020 16:45:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l9dol8BjF52rFe8mzz85c9RZmeAYDZ2M1zPXpY3Bxec=; b=DdR+XhrkyP2bG5JLWTYoR0ucRC
 tjwdWIf/THDtuN8ew2Qt3LKjJs+JKCtO+U5OJ9stCUy5fpA4dbrCMMSC069xSn1MbHYx0WGABu5rc
 Glvc0qoj/bVYRiNdYwfkidBBBpEgsunyD7GGJ74QHMx+QLuJgblKI7JehSGxrbPULtxE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l9dol8BjF52rFe8mzz85c9RZmeAYDZ2M1zPXpY3Bxec=; b=HR+kDTtKlpBuDCahuOWk2GNzJ8
 W2jaNnXrxUFYdIPF5hmWBlyfo0ztklPS+BZ/ej8zukQlKKuyoV7h5Xiu6WOXISSqjsw6hPW1nm6Wn
 rRJqPzn6uafDFzsSISo8E6388curGmwvbD7/1ShltPWd3ZbmWP9IWyEqmfpjpbC2wXko=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kS0wn-007eXm-62; Mon, 12 Oct 2020 16:45:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=l9dol8BjF52rFe8mzz85c9RZmeAYDZ2M1zPXpY3Bxec=; b=cjGmRDHB+K+xo1zaI46uR/JWZM
 mu6b6OfRoAYfgdNA5Kf5Iurex6D1FcBZ+mRQhj12vLi3isoy7f1JrMIQOIfa61TejqqWEwpL43yKb
 2mAeiG7QIg8Vb+ajA0gepoKbc6o17WQEzV+UWJKTyQWQStoFHb/kNJEfYbWmPc27vxrcwV1GpTL/g
 cqcPit9vRB3f1Zs6upmREd44qhzYUWIO5sf13vXmWctx364S7GYQlJM4ZaGSBTPIwUKM8imQUHEl+
 YU7Gj26Vo02zH0C4u7a3/EscApIpoLOe+KQejmiwTcRHTR/bJWdX/slhogDIyA7BDVBafjowKFz4j
 1dyYxPzg==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kS0wA-0004gO-8Q; Mon, 12 Oct 2020 16:44:38 +0000
Date: Mon, 12 Oct 2020 17:44:38 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Dave Hansen <dave.hansen@intel.com>
Message-ID: <20201012164438.GA20115@casper.infradead.org>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
 <20201009195033.3208459-23-ira.weiny@intel.com>
 <20201009213434.GA839@sol.localdomain>
 <20201010003954.GW20115@casper.infradead.org>
 <20201010013036.GD1122@sol.localdomain>
 <20201012065635.GB2046448@iweiny-DESK2.sc.intel.com>
 <20201012161946.GA858@sol.localdomain>
 <5d621db9-23d4-e140-45eb-d7fca2093d2b@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5d621db9-23d4-e140-45eb-d7fca2093d2b@intel.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kS0wn-007eXm-62
Subject: Re: [f2fs-dev] [PATCH RFC PKS/PMEM 22/58] fs/f2fs: Utilize new
 kmap_thread()
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
Cc: linux-aio@kvack.org, linux-efi@vger.kernel.org, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 linux-mmc@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kselftest@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 drbd-dev@lists.linbit.com, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 linux-afs@lists.infradead.org, Eric Biggers <ebiggers@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, intel-wired-lan@lists.osuosl.org,
 kexec@lists.infradead.org, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, bpf@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Fenghua Yu <fenghua.yu@intel.com>,
 intel-gfx@lists.freedesktop.org, ecryptfs@vger.kernel.org,
 linux-um@lists.infradead.org, reiserfs-devel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 io-uring@vger.kernel.org, linux-cachefs@redhat.com, linux-nfs@vger.kernel.org,
 linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Oct 12, 2020 at 09:28:29AM -0700, Dave Hansen wrote:
> kmap_atomic() is always preferred over kmap()/kmap_thread().
> kmap_atomic() is _much_ more lightweight since its TLB invalidation is
> always CPU-local and never broadcast.
> 
> So, basically, unless you *must* sleep while the mapping is in place,
> kmap_atomic() is preferred.

But kmap_atomic() disables preemption, so the _ideal_ interface would map
it only locally, then on preemption make it global.  I don't even know
if that _can_ be done.  But this email makes it seem like kmap_atomic()
has no downsides.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
