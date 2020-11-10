Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E782ACA94
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Nov 2020 02:39:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kcIck-00022K-3k; Tue, 10 Nov 2020 01:39:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tglx@linutronix.de>)
 id 1kcIce-00021g-AZ; Tue, 10 Nov 2020 01:39:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UkwosGD4CNwpr5O4mn7FToWEjHCGounmVIqa5vjwzhQ=; b=VMQNvJW3IENITahS+uLcjf4V2
 CuTsh4yZq79E1ZIJ77AWlTWfzdU5F5P66cLvrZ1K0bKVr4gfKGAS0PS798cAcd+8HuotMcqgippbs
 Y+bqF+fF06pzL4H5XJcG9720Zu9hnYR6TAkV4VGkRSihRuSWDuW7rclizdecc7m/EH+aE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UkwosGD4CNwpr5O4mn7FToWEjHCGounmVIqa5vjwzhQ=; b=QkdIFnSWHLKPCjZLdZlb41EiI+
 8p4eRrbg0gHraUEbbFOqDe32GsoacjzStKmSN71AEDDylUkEk3RebECFdjWVP/PEmvIDX6UUEw8iA
 04fVVg7584IYMjHpYlc8QKmP7XrkAKdgZLBjOgFlN/pbwk7QYNu/D3oHABCC3o/1RK20=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kcIcV-006F7K-Fk; Tue, 10 Nov 2020 01:38:57 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604970836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UkwosGD4CNwpr5O4mn7FToWEjHCGounmVIqa5vjwzhQ=;
 b=DRjXCHfaWTV+37wSriT1BjBgrVPE6jdQ5QSgYOIapfxJkFIwaFOAyxB9axkmnF7jwFoYyj
 IwVALzvZ0PuA7RxNph9leDCS6B9rTa4rL3nKcIBy/Am24PTMh01e/A2SQWp6LTkOQfBaj6
 TPNYDFf29DCqNiv3sgD8nE6enYeIlsYkCGyKDzwB1FGN01/Y3vKoJQtpchwkYWrvNb9W70
 4PCnBA8S0oYM/XwkwwZotKzR9vmT9oC6FdGvh5lMI1bLUaS0qdB+ZPTGprUeJSBjnvH0Xv
 xyRk7zOTS6b0OUuDBNt+X1xYcMB1KSB7gGowiPoSA5hPR5omsqQ5g20Kt4+uKg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604970836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UkwosGD4CNwpr5O4mn7FToWEjHCGounmVIqa5vjwzhQ=;
 b=acv/dHWHYYmtT1/z0brDNSAmBtlvEk8c07ItXmS/RUDap25yEm8biO9jTMWItRsTlNRTeF
 x/KI3sqvslL8SkDg==
To: ira.weiny@intel.com, Andrew Morton <akpm@linux-foundation.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>
In-Reply-To: <20201009195033.3208459-6-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
 <20201009195033.3208459-6-ira.weiny@intel.com>
Date: Tue, 10 Nov 2020 02:13:56 +0100
Message-ID: <87h7pyhv3f.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kcIcV-006F7K-Fk
Subject: Re: [f2fs-dev] [PATCH RFC PKS/PMEM 05/58] kmap: Introduce
 k[un]map_thread
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
 linux-doc@vger.kernel.org, linux-mmc@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kselftest@vger.kernel.org,
 samba-technical@lists.samba.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, linux-afs@lists.infradead.org,
 cluster-devel@redhat.com, linux-cachefs@redhat.com,
 intel-wired-lan@lists.osuosl.org, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>,
 linux-um@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 io-uring@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Ira,

On Fri, Oct 09 2020 at 12:49, ira weiny wrote:
> From: Ira Weiny <ira.weiny@intel.com>
>
> To correctly support the semantics of kmap() with Kernel protection keys
> (PKS), kmap() may be required to set the protections on multiple
> processors (globally).  Enabling PKS globally can be very expensive
> depending on the requested operation.  Furthermore, enabling a domain
> globally reduces the protection afforded by PKS.
>
> Most kmap() (Aprox 209 of 229) callers use the map within a single thread and
> have no need for the protection domain to be enabled globally.  However, the
> remaining callers do not follow this pattern and, as best I can tell, expect
> the mapping to be 'global' and available to any thread who may access the
> mapping.[1]
>
> We don't anticipate global mappings to pmem, however in general there is a
> danger in changing the semantics of kmap().  Effectively, this would cause an
> unresolved page fault with little to no information about why the failure
> occurred.
>
> To resolve this a number of options were considered.
>
> 1) Attempt to change all the thread local kmap() calls to kmap_atomic()[2]
> 2) Introduce a flags parameter to kmap() to indicate if the mapping should be
>    global or not
> 3) Change ~20 call sites to 'kmap_global()' to indicate that they require a
>    global enablement of the pages.
> 4) Change ~209 call sites to 'kmap_thread()' to indicate that the mapping is to
>    be used within that thread of execution only
>
> Option 1 is simply not feasible.  Option 2 would require all of the call sites
> of kmap() to change.  Option 3 seems like a good minimal change but there is a
> danger that new code may miss the semantic change of kmap() and not get the
> behavior the developer intended.  Therefore, #4 was chosen.

There is Option #5:

Convert the thread local kmap() invocations to the proposed kmap_local()
interface which is coming along [1].

That solves a couple of issues:

 1) It relieves the current kmap_atomic() usage sites from the implict
    pagefault/preempt disable semantics which apply even when
    CONFIG_HIGHMEM is disabled. kmap_local() still can be invoked from
    atomic context.

 2) Due to #1 it allows to replace the conditional usage of kmap() and
    kmap_atomic() for purely thread local mappings.

 3) It puts the burden on the HIGHMEM inflicted systems

 4) It is actually more efficient for most of the pure thread local use
    cases on HIGHMEM inflicted systems because it avoids the overhead of
    the global lock and the potential kmap slot exhaustion. A potential
    preemption will be more expensive, but that's not really the case we
    want to optimize for.

 5) It solves the RT issue vs. kmap_atomic()

So instead of creating yet another variety of kmap() which is just
scratching the particular PKRS itch, can we please consolidate all of
that on the wider reaching kmap_local() approach?

Thanks,

        tglx
     
[1] https://lore.kernel.org/lkml/20201103092712.714480842@linutronix.de/



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
