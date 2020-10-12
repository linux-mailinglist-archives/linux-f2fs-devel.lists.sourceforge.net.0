Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC4B28ADB2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Oct 2020 07:28:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kRqOA-0007Ha-0M; Mon, 12 Oct 2020 05:28:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ira.weiny@intel.com>)
 id 1kRqO7-0007H6-Nq; Mon, 12 Oct 2020 05:28:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/TalSpFJssBNTOZOITkKJvyppTUK4XtPcdlTE2914sc=; b=NYJz0aQqtA8JKQ37oM1Bqb5sjl
 J1jem/FER8lkJZvGDWsTrLD5tC7eTm6V5TfDB2UN8xpJLEZK4l9O+wyLEv6GfYTPr1OMfvWB56iF1
 QMZvNqbkrzWQugdeTzXLpM/1jqPOiG1ByjGBdCQ6gBgWp2huZ3hgqI9/zSvTxERPNQGQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/TalSpFJssBNTOZOITkKJvyppTUK4XtPcdlTE2914sc=; b=FrLuekEOVxY+BtKrd2aPo6Iand
 +V8SBYweVfLYXvODKl6rehDS4j4YXesEohx/sgngu2c2QUOnoaLyAH+BkR/DiC+GfJ6l0bz9S88Hx
 afIXsyGLn5ShHpeuyEWWMeCK0kuGAXLe8nA0KIYx01X5Mlq1c7SPJ/rC+C462C685BIw=;
Received: from mga06.intel.com ([134.134.136.31])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kRqNx-00BfFZ-Ct; Mon, 12 Oct 2020 05:28:47 +0000
IronPort-SDR: 7gCNhy1okhgg4seQJYb7pEyJ65O/hzI6v3GLJtSd8gVgnsyTta2mzYe3QwlZLBpunrIfpZYnto
 dA9m+qdPHzQQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9771"; a="227337794"
X-IronPort-AV: E=Sophos;i="5.77,365,1596524400"; d="scan'208";a="227337794"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2020 22:28:23 -0700
IronPort-SDR: Awdi9Evv+UAQx0jH4ny/s7+Nxcmli85F+a73BOsSCHQvCG+q13xwJ2JLwUM5pKItlqpgm8qi5b
 o2XGvRLHUUbw==
X-IronPort-AV: E=Sophos;i="5.77,365,1596524400"; d="scan'208";a="529816997"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2020 22:28:22 -0700
Date: Sun, 11 Oct 2020 22:28:18 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Coly Li <colyli@suse.de>
Message-ID: <20201012052817.GZ2046448@iweiny-DESK2.sc.intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
 <20201009195033.3208459-49-ira.weiny@intel.com>
 <c802fbf4-f67a-b205-536d-9c71b440f9c8@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c802fbf4-f67a-b205-536d-9c71b440f9c8@suse.de>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1kRqNx-00BfFZ-Ct
Subject: Re: [f2fs-dev] [PATCH RFC PKS/PMEM 48/58] drivers/md: Utilize new
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
 linux-kselftest@vger.kernel.org, samba-technical@lists.samba.org,
 Thomas Gleixner <tglx@linutronix.de>, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 ceph-devel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 io-uring@vger.kernel.org, cluster-devel@redhat.com,
 Ingo Molnar <mingo@redhat.com>, intel-wired-lan@lists.osuosl.org,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 Kent Overstreet <kent.overstreet@gmail.com>, Fenghua Yu <fenghua.yu@intel.com>,
 linux-afs@lists.infradead.org, linux-um@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, ecryptfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, reiserfs-devel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-cachefs@redhat.com,
 linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 netdev@vger.kernel.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Oct 10, 2020 at 10:20:34AM +0800, Coly Li wrote:
> On 2020/10/10 03:50, ira.weiny@intel.com wrote:
> > From: Ira Weiny <ira.weiny@intel.com>
> > 
> > These kmap() calls are localized to a single thread.  To avoid the over
> > head of global PKRS updates use the new kmap_thread() call.
> > 
> 
> Hi Ira,
> 
> There were a number of options considered.
> 
> 1) Attempt to change all the thread local kmap() calls to kmap_atomic()
> 2) Introduce a flags parameter to kmap() to indicate if the mapping
> should be global or not
> 3) Change ~20-30 call sites to 'kmap_global()' to indicate that they
> require a global mapping of the pages
> 4) Change ~209 call sites to 'kmap_thread()' to indicate that the
> mapping is to be used within that thread of execution only
> 
> 
> I copied the above information from patch 00/58 to this message. The
> idea behind kmap_thread() is fine to me, but as you said the new api is
> very easy to be missed in new code (even for me). I would like to be
> supportive to option 2) introduce a flag to kmap(), then we won't forget
> the new thread-localized kmap method, and people won't ask why a
> _thread() function is called but no kthread created.

Thanks for the feedback.

I'm going to hold off making any changes until others weigh in.  FWIW, I kind
of like option 2 as well.  But there is already kmap_atomic() so it seemed like
kmap_XXXX() was more in line with the current API.

Thanks,
Ira

> 
> Thanks.
> 
> 
> Coly Li
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
