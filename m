Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58107289D9C
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 10 Oct 2020 04:43:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kR4rB-00069T-D9; Sat, 10 Oct 2020 02:43:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <James.Bottomley@HansenPartnership.com>)
 id 1kR4r8-00068z-30; Sat, 10 Oct 2020 02:43:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0NoFjPO/wGCDrZIjEc/kJ1ObZPq2uD4gMAJggQqzSX8=; b=jLLkxuvzpQsXjWhJXONgSAt+S1
 g4rZPFxBb3YcK999vwpmjFv4GN8ujzDA9e84LA0YffQ6oKIZVHzkW3G1e7GHLeeAhVyXsVNvC+nRE
 gqD2s79JI8C9L/3hD5WM0pRyhG4Cw+XhI+JvL68JLOl3Z/WBDGcNMwj2BT1SxRduY760=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0NoFjPO/wGCDrZIjEc/kJ1ObZPq2uD4gMAJggQqzSX8=; b=SiiqGYUSbyr7/2LOhAKJkMVjcU
 Pw/l/Xfrprpwclnm5ogOUq98kNgav6RBIK2P+NTFEsunDZKY26Jd3FK6NQIiRa98Xlobblg+VgH5B
 TOzpZe9BwEHd33q0Wsar7VQ15dvo5zJ/P6jhhllSP0JAZFY5J8P7F218EiHubkhUccQs=;
Received: from bedivere.hansenpartnership.com ([66.63.167.143])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kR4qy-004pwI-Gt; Sat, 10 Oct 2020 02:43:33 +0000
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id 2492A8EE25D;
 Fri,  9 Oct 2020 19:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1602297797;
 bh=H8TP93foEqN1ktQ8Zvn50X/i2mF1Mo+G3bAPl3laMS8=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=IKFTIVFzGPRTOXbvF4guFV0idy0d2c5GY0pNpauMNCD265o/8xML504AQiHNNKINI
 03VTbsdpTlx1IvRxmapAuFqbOyRLRkynjYBLceWgnAFSazyacAGjs/kfFiiin3dxCG
 9/K3u5C/d7R0kHrIFRdMX77E7sQ6OOI7DSaYWfn4=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id 3vw63n_vJBCB; Fri,  9 Oct 2020 19:43:16 -0700 (PDT)
Received: from jarvis (c-73-35-198-56.hsd1.wa.comcast.net [73.35.198.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 0DE4F8EE120;
 Fri,  9 Oct 2020 19:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1602297796;
 bh=H8TP93foEqN1ktQ8Zvn50X/i2mF1Mo+G3bAPl3laMS8=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=BgjiThamK3sRChTIWem3VqlcTVcZOY3Z2GNJyIwpezgtDJLGW3IszUxOTE+yoCAWv
 V48K29iXWIdEyZfVjEsU0FSlh3cTrvJt0EqAPo1Ll9Jsfhk5OlUorelNGWOoKpuPOj
 SS1Y94jSiSEug+8lBRnZGZxsf1hZ1ZG8/+ovIeYw=
Message-ID: <95d137992900152a0453f7ba37771cb9025121fa.camel@HansenPartnership.com>
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Eric Biggers <ebiggers@kernel.org>, ira.weiny@intel.com
Date: Fri, 09 Oct 2020 19:43:13 -0700
In-Reply-To: <20201009213434.GA839@sol.localdomain>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
 <20201009195033.3208459-23-ira.weiny@intel.com>
 <20201009213434.GA839@sol.localdomain>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kR4qy-004pwI-Gt
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
 linux-kselftest@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 drbd-dev@lists.linbit.com, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 linux-afs@lists.infradead.org, cluster-devel@redhat.com,
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
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, 2020-10-09 at 14:34 -0700, Eric Biggers wrote:
> On Fri, Oct 09, 2020 at 12:49:57PM -0700, ira.weiny@intel.com wrote:
> > From: Ira Weiny <ira.weiny@intel.com>
> > 
> > The kmap() calls in this FS are localized to a single thread.  To
> > avoid the over head of global PKRS updates use the new
> > kmap_thread() call.
> > 
> > Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> > Cc: Chao Yu <chao@kernel.org>
> > Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> > ---
> >  fs/f2fs/f2fs.h | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index d9e52a7f3702..ff72a45a577e 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -2410,12 +2410,12 @@ static inline struct page
> > *f2fs_pagecache_get_page(
> >  
> >  static inline void f2fs_copy_page(struct page *src, struct page
> > *dst)
> >  {
> > -	char *src_kaddr = kmap(src);
> > -	char *dst_kaddr = kmap(dst);
> > +	char *src_kaddr = kmap_thread(src);
> > +	char *dst_kaddr = kmap_thread(dst);
> >  
> >  	memcpy(dst_kaddr, src_kaddr, PAGE_SIZE);
> > -	kunmap(dst);
> > -	kunmap(src);
> > +	kunmap_thread(dst);
> > +	kunmap_thread(src);
> >  }
> 
> Wouldn't it make more sense to switch cases like this to
> kmap_atomic()?
> The pages are only mapped to do a memcpy(), then they're immediately
> unmapped.

On a VIPT/VIVT architecture, this is horrendously wasteful.  You're
taking something that was mapped at colour c_src mapping it to a new
address src_kaddr, which is likely a different colour and necessitates
flushing the original c_src, then you copy it to dst_kaddr, which is
also likely a different colour from c_dst, so dst_kaddr has to be
flushed on kunmap and c_dst has to be invalidated on kmap.  What we
should have is an architectural primitive for doing this, something
like kmemcopy_arch(dst, src).  PIPT architectures can implement it as
the above (possibly losing kmap if they don't need it) but VIPT/VIVT
architectures can set up a correctly coloured mapping so they can
simply copy from c_src to c_dst without any need to flush and the data
arrives cache hot at c_dst.

James




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
