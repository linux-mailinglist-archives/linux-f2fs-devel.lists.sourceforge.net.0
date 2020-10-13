Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB5528D5DD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Oct 2020 22:50:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kSRFp-00073s-IS; Tue, 13 Oct 2020 20:50:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ira.weiny@intel.com>)
 id 1kSRFl-00073E-9d; Tue, 13 Oct 2020 20:50:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CLiGywdPbU+aYoP+wn56pvGkV4FVuHXXc+EO1eGw71k=; b=Wfojq99qrYnoUNd6Y/zfDKnm8b
 wkmghkIBSsLPcY497QbpLpVYc06/kcFFw3VFf0dpp9btZck5hbG7ipc/NIJOFiwff7E7lYUDxKPtJ
 OWwpiqD2PAtGtIyYXPTrggxIkiBAeF03xsRpFZjZBptaqWligEsTs1nXg3JdXl9Aimuc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CLiGywdPbU+aYoP+wn56pvGkV4FVuHXXc+EO1eGw71k=; b=QC6i4c917WhYa4ixzakGn08NX6
 u+9cvzHIsriIdgIbmDz2WHwQZXjd3lK1OzreVhBS4gaEg+CFqTA8xZVkZWPiUBnjl/IB5PJ6FRuWn
 CaUQs6BOkkaMX+7L1nrpLQU/D01vQZ+B6y3BF7VJ4ywQrg6Wha/kOgzcZcjF1pxXEH1o=;
Received: from mga03.intel.com ([134.134.136.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kSRFc-00DyQN-Sj; Tue, 13 Oct 2020 20:50:37 +0000
IronPort-SDR: znaaIt1ZNqxfKzNX5bwASC5cKrMoK3AwFUwIszqXuf2PGs9dXyaWNpRXCAw66gz/eubs+db6zF
 FwARWl/KtUNQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="166045234"
X-IronPort-AV: E=Sophos;i="5.77,371,1596524400"; d="scan'208";a="166045234"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2020 13:50:14 -0700
IronPort-SDR: tBU8Od+WgzKnoE84+DWDWPkln+je7r0O2Nptsn2TVKPsgnriflj5gQkH1GYPWlpzBZ1iqAqtCk
 /srhQcj0pjbQ==
X-IronPort-AV: E=Sophos;i="5.77,371,1596524400"; d="scan'208";a="318439699"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2020 13:50:12 -0700
Date: Tue, 13 Oct 2020 13:50:12 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Message-ID: <20201013205012.GI2046448@iweiny-DESK2.sc.intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
 <20201009195033.3208459-34-ira.weiny@intel.com>
 <CAPcyv4gL3jfw4d+SJGPqAD3Dp4F_K=X3domuN4ndAA1FQDGcPg@mail.gmail.com>
 <20201013193643.GK20115@casper.infradead.org>
 <20201013200149.GI3576660@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201013200149.GI3576660@ZenIV.linux.org.uk>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1kSRFc-00DyQN-Sj
Subject: Re: [f2fs-dev] [PATCH RFC PKS/PMEM 33/58] fs/cramfs: Utilize new
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
Cc: linux-aio@kvack.org, linux-efi <linux-efi@vger.kernel.org>,
 KVM list <kvm@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, linux-mmc@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 linux-kselftest@vger.kernel.org, samba-technical@lists.samba.org,
 Thomas Gleixner <tglx@linutronix.de>, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, X86 ML <x86@kernel.org>,
 ceph-devel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 io-uring@vger.kernel.org, cluster-devel@redhat.com,
 Ingo Molnar <mingo@redhat.com>, intel-wired-lan@lists.osuosl.org,
 xen-devel <xen-devel@lists.xenproject.org>,
 linux-ext4 <linux-ext4@vger.kernel.org>, Fenghua Yu <fenghua.yu@intel.com>,
 linux-afs@lists.infradead.org, linux-um@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, ecryptfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, reiserfs-devel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, bpf@vger.kernel.org,
 linux-cachefs@redhat.com, linux-nfs@vger.kernel.org,
 Nicolas Pitre <nico@fluxnic.net>, linux-ntfs-dev@lists.sourceforge.net,
 Netdev <netdev@vger.kernel.org>,
 Kexec Mailing List <kexec@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-btrfs <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Oct 13, 2020 at 09:01:49PM +0100, Al Viro wrote:
> On Tue, Oct 13, 2020 at 08:36:43PM +0100, Matthew Wilcox wrote:
> 
> > static inline void copy_to_highpage(struct page *to, void *vfrom, unsigned int size)
> > {
> > 	char *vto = kmap_atomic(to);
> > 
> > 	memcpy(vto, vfrom, size);
> > 	kunmap_atomic(vto);
> > }
> > 
> > in linux/highmem.h ?
> 
> You mean, like
> static void memcpy_from_page(char *to, struct page *page, size_t offset, size_t len)
> {
>         char *from = kmap_atomic(page);
>         memcpy(to, from + offset, len);
>         kunmap_atomic(from);
> }
> 
> static void memcpy_to_page(struct page *page, size_t offset, const char *from, size_t len)
> {
>         char *to = kmap_atomic(page);
>         memcpy(to + offset, from, len);
>         kunmap_atomic(to);
> }
> 
> static void memzero_page(struct page *page, size_t offset, size_t len)
> {
>         char *addr = kmap_atomic(page);
>         memset(addr + offset, 0, len);
>         kunmap_atomic(addr);
> }
> 
> in lib/iov_iter.c?  FWIW, I don't like that "highpage" in the name and
> highmem.h as location - these make perfect sense regardless of highmem;
> they are normal memory operations with page + offset used instead of
> a pointer...

I was thinking along those lines as well especially because of the direction
this patch set takes kmap().

Thanks for pointing these out to me.  How about I lift them to a common header?
But if not highmem.h where?

Ira


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
