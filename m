Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E8728D4CB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Oct 2020 21:42:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kSQBT-0005gq-Ls; Tue, 13 Oct 2020 19:42:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dan.j.williams@intel.com>) id 1kSQBS-0005gi-8U
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Oct 2020 19:42:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jlOzF1QhqikCoQxsvfJV6M6Hjgbrow9dB9uNs1AoGLE=; b=RB/sShlxm/e7JD6ZYScIXrYSZT
 2j+6Odq4UG+SZLAnGuAWTQBgyjzN3gEtEU0MF/RBSCKvBx465XnsimIDAm3ptLelw55S1+B4lrVw0
 Ls27et61t8JIYum6L02E1tIw82gOhpGo1kfdNbZ8JcjcmW2+I4tJAzYICbmJZpacouBM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jlOzF1QhqikCoQxsvfJV6M6Hjgbrow9dB9uNs1AoGLE=; b=Gx6ESCFDMggMWCBtSTDvf4A4vQ
 QWN+PaNX3/l+SA6zIPYTWrRaWZ1zGt4jibNcU6su1KuHwzRLciBRNTrvp6QugHGqrX7EKi4id7j9l
 Gf0NCu0mq0xY/V0RLAwrytSaRIwEN5YO0lBraYLqrV4r6lN+9bxmD0xMIucTzDEP/BMc=;
Received: from mail-ej1-f66.google.com ([209.85.218.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kSQBG-00Du7o-Kb
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Oct 2020 19:42:06 +0000
Received: by mail-ej1-f66.google.com with SMTP id ce10so1465140ejc.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 Oct 2020 12:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jlOzF1QhqikCoQxsvfJV6M6Hjgbrow9dB9uNs1AoGLE=;
 b=kTjS5KS3nYcf/wrvTsuRt1BvzGw557kJOoPvyzYoBgiqb4b8bKtbI2/mMLiZYyRjFR
 J9ydTuu0x47x+MEvbUBFhFH3/2QgRWgMVRtg9k6OLuYDe131Mp/cuPa30fJMGhSFjepr
 cqBBXWNROTwzHkSN49lY/psarWhxU27El5EYWXEJaiWvhTqo66L6QK98x3Y0Yvi2nF9y
 UTW/CUag9LBP+VfPW+1mn8JfLpPCSXoAzeg5FBjWoJMu0+7UEW9Ka5T8iigFwOd+JDvR
 rrctnvxFOZW164mxjZq4IMmZGZxG4l2jAUbsCf6skOMzcKIRAwJ8OakZ/jL0rfexuXSd
 7ngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jlOzF1QhqikCoQxsvfJV6M6Hjgbrow9dB9uNs1AoGLE=;
 b=K2+0Ic0Sqk5eeEcP5LlP4vJow1ggodglofdWUimyLxD+1X5L06zIn0O71mK4kcYFN1
 +/Io9WRg+PNU2IeeVU+YboIneTlvWFXkrvajQ6YgtbBCb/Q+hBiwi3dOidQW4ceKdnc8
 F/+VEUAi9etWdFnZPMY8yMnahW0dhLrSkk+SypUnenUG2ok9+7qzNUNOqxjflLvZmZbl
 /RuSozyd2nBBzH6GtO+/o58EVP2ExZ0ZyqstbV9MMlcGtN3Hv03zP1CjTmMTsFZMRbFo
 w1FY8KKCFST2GRVws6Afmn2Hz/z4oq8S4Xl9BdlFjzfA3QAXNuygY/XWMtxrnbHMyLAK
 1STg==
X-Gm-Message-State: AOAM5338nvmk4z2F+MeXtsGTAS6lF7nQKguLGd6bd0OhS4lvQOWB88w3
 ws+xQKwNWFkffhlGCNdxXQcO6NaAjIw3rYP904BWFg==
X-Google-Smtp-Source: ABdhPJxGxhMZ7o2BYtIDXOupUr3pSHVXck0tIwC9HMZ0nIbp0pU6AQKRljKqMwVkoxmX0BYp74elTVEnpYvo3LWFH24=
X-Received: by 2002:a17:906:7e47:: with SMTP id
 z7mr1390518ejr.418.1602618108255; 
 Tue, 13 Oct 2020 12:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <20201009195033.3208459-1-ira.weiny@intel.com>
 <20201009195033.3208459-34-ira.weiny@intel.com>
 <CAPcyv4gL3jfw4d+SJGPqAD3Dp4F_K=X3domuN4ndAA1FQDGcPg@mail.gmail.com>
 <20201013193643.GK20115@casper.infradead.org>
In-Reply-To: <20201013193643.GK20115@casper.infradead.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 13 Oct 2020 12:41:36 -0700
Message-ID: <CAPcyv4gL70FcLe8az7ezmpcZV=bG0Cka7daKWcCdmV4GoenSZw@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: fluxnic.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.218.66 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kSQBG-00Du7o-Kb
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
 linux-mtd@lists.infradead.org, linux-kselftest@vger.kernel.org,
 samba-technical@lists.samba.org, "Weiny, Ira" <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, X86 ML <x86@kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, io-uring@vger.kernel.org,
 cluster-devel@redhat.com, Ingo Molnar <mingo@redhat.com>,
 intel-wired-lan@lists.osuosl.org, xen-devel <xen-devel@lists.xenproject.org>,
 linux-ext4 <linux-ext4@vger.kernel.org>, Fenghua Yu <fenghua.yu@intel.com>,
 linux-afs@lists.infradead.org, linux-um@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, ecryptfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, reiserfs-devel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, linux-cachefs@redhat.com,
 linux-nfs@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>,
 linux-ntfs-dev@lists.sourceforge.net, Netdev <netdev@vger.kernel.org>,
 Kexec Mailing List <kexec@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, bpf@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-btrfs <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Oct 13, 2020 at 12:37 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Tue, Oct 13, 2020 at 11:44:29AM -0700, Dan Williams wrote:
> > On Fri, Oct 9, 2020 at 12:52 PM <ira.weiny@intel.com> wrote:
> > >
> > > From: Ira Weiny <ira.weiny@intel.com>
> > >
> > > The kmap() calls in this FS are localized to a single thread.  To avoid
> > > the over head of global PKRS updates use the new kmap_thread() call.
> > >
> > > Cc: Nicolas Pitre <nico@fluxnic.net>
> > > Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> > > ---
> > >  fs/cramfs/inode.c | 10 +++++-----
> > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
> > > index 912308600d39..003c014a42ed 100644
> > > --- a/fs/cramfs/inode.c
> > > +++ b/fs/cramfs/inode.c
> > > @@ -247,8 +247,8 @@ static void *cramfs_blkdev_read(struct super_block *sb, unsigned int offset,
> > >                 struct page *page = pages[i];
> > >
> > >                 if (page) {
> > > -                       memcpy(data, kmap(page), PAGE_SIZE);
> > > -                       kunmap(page);
> > > +                       memcpy(data, kmap_thread(page), PAGE_SIZE);
> > > +                       kunmap_thread(page);
> >
> > Why does this need a sleepable kmap? This looks like a textbook
> > kmap_atomic() use case.
>
> There's a lot of code of this form.  Could we perhaps have:
>
> static inline void copy_to_highpage(struct page *to, void *vfrom, unsigned int size)
> {
>         char *vto = kmap_atomic(to);
>
>         memcpy(vto, vfrom, size);
>         kunmap_atomic(vto);
> }
>
> in linux/highmem.h ?

Nice, yes, that could also replace the local ones in lib/iov_iter.c
(memcpy_{to,from}_page())


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
