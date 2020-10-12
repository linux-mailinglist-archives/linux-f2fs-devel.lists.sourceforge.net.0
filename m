Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1C328BD85
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Oct 2020 18:20:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kS0YZ-0000g7-8z; Mon, 12 Oct 2020 16:20:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>)
 id 1kS0YX-0000fK-3Y; Mon, 12 Oct 2020 16:20:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YvFqWsLYgVbvxq6sRNepzCJbUDEZl7Ntt4MctB+hNXg=; b=Xd4hyyxMIrfMPYsyfNUnht/lpl
 Zzml+dh/mOZRHEJSbD5YKFynlHM2eT/ZlyCWPtyS2sDcuK1hTbqq5EQtQ58vsdrVjnW2Mc0KD5x1A
 OwQKzN2yh4XFF3J9As4U2NSKBtKqhSG2vq4AGLYxuPixxoHol8cRSj9uanWrGH3rljS8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YvFqWsLYgVbvxq6sRNepzCJbUDEZl7Ntt4MctB+hNXg=; b=PXkKttP4GO9p4Iv2XwOCh1P3/1
 8/cknqmwOtgoEjUI49g3nRz1PxjjeDZ4hBdr4SY4TLk8qRNZGCRtCUW5wKtrF8qvYL0phLjuCY+EZ
 nRPfZxYd8y6yiGkq17uM9kVpBsvyG4ygF/kVbejFi2z25kYGOfABdaQHOe+BvgNeyuFM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kS0YO-00CKZr-EH; Mon, 12 Oct 2020 16:20:12 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 22B302080A;
 Mon, 12 Oct 2020 16:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602519589;
 bh=FXrMfe87r7In01hy1fZxNUDLVXbtP/5TJ3+XTzWq1o4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V7DSrccLr5b4UIwMLihtwG0wHPpEpEeCdL4DEsryZDNbDbBe/031RRLLs/mkasjte
 GkozOXCGlriE75ewyNE/y/+1/YN0mvEXF3Fx+zkSk5bqABC19TCsH57zxXZt4yoDfc
 Gd/Q7Kn6Oc4wJMc886CZx9bFLur2svNEjPDcQyvk=
Date: Mon, 12 Oct 2020 09:19:46 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ira Weiny <ira.weiny@intel.com>
Message-ID: <20201012161946.GA858@sol.localdomain>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
 <20201009195033.3208459-23-ira.weiny@intel.com>
 <20201009213434.GA839@sol.localdomain>
 <20201010003954.GW20115@casper.infradead.org>
 <20201010013036.GD1122@sol.localdomain>
 <20201012065635.GB2046448@iweiny-DESK2.sc.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201012065635.GB2046448@iweiny-DESK2.sc.intel.com>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kS0YO-00CKZr-EH
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
 amd-gfx@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-afs@lists.infradead.org,
 cluster-devel@redhat.com, Ingo Molnar <mingo@redhat.com>,
 intel-wired-lan@lists.osuosl.org, kexec@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 bpf@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Fenghua Yu <fenghua.yu@intel.com>, intel-gfx@lists.freedesktop.org,
 ecryptfs@vger.kernel.org, linux-um@lists.infradead.org,
 reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, io-uring@vger.kernel.org, linux-cachefs@redhat.com,
 linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Oct 11, 2020 at 11:56:35PM -0700, Ira Weiny wrote:
> > 
> > And I still don't really understand.  After this patchset, there is still code
> > nearly identical to the above (doing a temporary mapping just for a memcpy) that
> > would still be using kmap_atomic().
> 
> I don't understand.  You mean there would be other call sites calling:
> 
> kmap_atomic()
> memcpy()
> kunmap_atomic()

Yes, there are tons of places that do this.  Try 'git grep -A6 kmap_atomic'
and look for memcpy().

Hence why I'm asking what will be the "recommended" way to do this...
kunmap_thread() or kmap_atomic()?

> And since I don't know the call site details if there are kmap_thread() calls
> which are better off as kmap_atomic() calls I think it is worth converting
> them.  But I made the assumption that kmap users would already be calling
> kmap_atomic() if they could (because it is more efficient).

Not necessarily.  In cases where either one is correct, people might not have
put much thought into which of kmap() and kmap_atomic() they are using.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
