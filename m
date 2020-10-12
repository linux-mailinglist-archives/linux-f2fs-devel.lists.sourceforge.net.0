Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5BB28ADF9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Oct 2020 07:52:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kRqlE-0006vx-PS; Mon, 12 Oct 2020 05:52:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ira.weiny@intel.com>)
 id 1kRqlD-0006vn-PG; Mon, 12 Oct 2020 05:52:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q/ptS18CWzeZpVBKG8xJ6/9K5LtkNevRpPU3N2OaugQ=; b=HG2enSA4Mt1LosUtbesa0cN6qk
 h2L0JWebdf3U98bnc8aW68PDh3yziINhA/nd8G4572gMj7Q9M0WptCyySliBQ/SUI/W/7vDvZyhxA
 lQ+oetTdgauuig2jZdnEXjtctnNDin9LfhU4FmYPimXHZ5BR1Fht9WdafD+egWcJWXIY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q/ptS18CWzeZpVBKG8xJ6/9K5LtkNevRpPU3N2OaugQ=; b=H5KksxbNvcRTZuhpH8WXsXaJPM
 SHn+fGxUwp3W5DGol44XMvdX2u0GgLNcTUU1UV7pWkkcrpV0pgimpXEpOqHbqHexYgLGJGzuJnlVc
 LAatc0KjdXywM9qiby3j7+ZJNGrzcbcWXXhPycZWdhYQZ5F834r3L8DMH8lLnvs/RJ5w=;
Received: from mga01.intel.com ([192.55.52.88])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kRql6-0072ra-Lz; Mon, 12 Oct 2020 05:52:39 +0000
IronPort-SDR: Xpv7PJ+aYRBIP68R3lV3+MVIAzvCJGQ1RvLuv4O9RCfKCSRNV9PmeOoSha2yjL+aGgsUXku9cv
 FYqpurawLSOw==
X-IronPort-AV: E=McAfee;i="6000,8403,9771"; a="183148520"
X-IronPort-AV: E=Sophos;i="5.77,365,1596524400"; d="scan'208";a="183148520"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2020 22:52:20 -0700
IronPort-SDR: Ya9EDAn3SOMd08SCKVKBtueoni+yyq9EF8H8N9tr+YE/IrdFHweYy6SREcwPgxnde0DbbLRvxa
 rOKYCbITG9ew==
X-IronPort-AV: E=Sophos;i="5.77,365,1596524400"; d="scan'208";a="520573207"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2020 22:52:19 -0700
Date: Sun, 11 Oct 2020 22:52:19 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: John Hubbard <jhubbard@nvidia.com>
Message-ID: <20201012055218.GA2046448@iweiny-DESK2.sc.intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
 <20201009195033.3208459-58-ira.weiny@intel.com>
 <bd3f5ece-0e7b-4c15-abbc-1b3b943334dc@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bd3f5ece-0e7b-4c15-abbc-1b3b943334dc@nvidia.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [192.55.52.88 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kRql6-0072ra-Lz
Subject: Re: [f2fs-dev] [PATCH RFC PKS/PMEM 57/58] nvdimm/pmem: Stray access
 protection for pmem->virt_addr
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
 linux-kselftest@vger.kernel.org, samba-technical@lists.samba.org,
 Thomas Gleixner <tglx@linutronix.de>, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 ceph-devel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 io-uring@vger.kernel.org, cluster-devel@redhat.com,
 Ingo Molnar <mingo@redhat.com>, intel-wired-lan@lists.osuosl.org,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 Fenghua Yu <fenghua.yu@intel.com>, linux-afs@lists.infradead.org,
 linux-um@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-cachefs@redhat.com,
 linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 netdev@vger.kernel.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Oct 09, 2020 at 07:53:07PM -0700, John Hubbard wrote:
> On 10/9/20 12:50 PM, ira.weiny@intel.com wrote:
> > From: Ira Weiny <ira.weiny@intel.com>
> > 
> > The pmem driver uses a cached virtual address to access its memory
> > directly.  Because the nvdimm driver is well aware of the special
> > protections it has mapped memory with, we call dev_access_[en|dis]able()
> > around the direct pmem->virt_addr (pmem_addr) usage instead of the
> > unnecessary overhead of trying to get a page to kmap.
> > 
> > Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> > ---
> >   drivers/nvdimm/pmem.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
> > index fab29b514372..e4dc1ae990fc 100644
> > --- a/drivers/nvdimm/pmem.c
> > +++ b/drivers/nvdimm/pmem.c
> > @@ -148,7 +148,9 @@ static blk_status_t pmem_do_read(struct pmem_device *pmem,
> >   	if (unlikely(is_bad_pmem(&pmem->bb, sector, len)))
> >   		return BLK_STS_IOERR;
> > +	dev_access_enable(false);
> >   	rc = read_pmem(page, page_off, pmem_addr, len);
> > +	dev_access_disable(false);
> 
> Hi Ira!
> 
> The APIs should be tweaked to use a symbol (GLOBAL, PER_THREAD), instead of
> true/false. Try reading the above and you'll see that it sounds like it's
> doing the opposite of what it is ("enable_this(false)" sounds like a clumsy
> API design to *disable*, right?). And there is no hint about the scope.

Sounds reasonable.

> 
> And it *could* be so much more readable like this:
> 
>     dev_access_enable(DEV_ACCESS_THIS_THREAD);

I'll think about the flag name.  I'm not liking 'this thread'.

Maybe DEV_ACCESS_[GLOBAL|THREAD]

Ira



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
