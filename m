Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 316E6BE0F9A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Oct 2025 00:48:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m19Q3DM9NhM3T5Vubybsd6bCOfwKJ2fNllM2AE0bh60=; b=GfDuAKFjr0Zt3WUFmHSxDWHKNR
	yab/zASbquXi2NNT42lZuVVbLCtqcLDKn39i+XDv6IAFXfXcd0se8tFaUc4/Tq/vLpuiex5lRxtER
	N5eHz/GxoSJ5wNhktMeL9KTg3Tud79TWarhv+B2XCtzHMJL16duR85AN81TMbaN5vxB0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v9AIe-00014j-S6;
	Wed, 15 Oct 2025 22:48:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3xyTwaAYKACAOA6JF8CKKCHA.8KI@flex--seanjc.bounces.google.com>)
 id 1v9AId-00014c-62 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Oct 2025 22:48:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VfHhobHRKUrZuY035WUhQS9GUM0Uyoej5h99Za9ASAY=; b=ixAVdo+Edrn1CdCZ0+jAJDeXD9
 rC8QHC5oQeOCkQTMQTTNsrxaFsTVKdZe3YyRCBxRtnvihRmFc/ryBuMSzPQgs8q5MmZ5XSE6aLi0M
 Mfz0Y3HRI8lkK9gx/bTGekYJgCg4yHV3cJ15faZqhDtuq1We+xteoOjI/az/0ehPCm9E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VfHhobHRKUrZuY035WUhQS9GUM0Uyoej5h99Za9ASAY=; b=l0MGD03P9U8sMQMD4f2SpqUqoH
 bj8XrvzeUbgFuglcKzJAvBNynMpcFO1efHmyze4tN53PMyWus7+bORbPVNCyIlZkDgJygspt53lvF
 sBJozX5ChX9fKOwhm29JTU6cy5Dl+K+AeS5wultSFn0KI8QUMHsenYg+Dk4Scn4MvzVc=;
Received: from mail-pg1-f202.google.com ([209.85.215.202])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v9AIc-0007Gp-Mr for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Oct 2025 22:48:51 +0000
Received: by mail-pg1-f202.google.com with SMTP id
 41be03b00d2f7-b630753cc38so81641a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 15 Oct 2025 15:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1760568520; x=1761173320;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=VfHhobHRKUrZuY035WUhQS9GUM0Uyoej5h99Za9ASAY=;
 b=IfLqNrSAyf2jil955Xv/aUOQDOrWUCxB4H+vaJj7dAvDJb8IQXjY5qUebPWsYgE52k
 11HhyTpywC+oZdXSSlunrUGgkXOenG8q+GOpO+FB/eANN+/5akhfftUz5PmgxxC7Ni/T
 nhnDZLFKR/2oiSfcbxMmLUqFTi9acz4kpbffAIMjZG4dJyJLQkvTAPAX1d2aLWCBr42m
 JhKKD0R6Kttp5QmjUZiOeRUsYwUHGm2IpDQk4/Knoog5ebC1YMCnSkHEAly0RGWVCw3d
 VYQVruB5rmRdGEykuX3MKP/7Fr0TEmk7JVBuAbexMRoJqW38ITpsgDqYCk3+FCJgLSIT
 GHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760568520; x=1761173320;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VfHhobHRKUrZuY035WUhQS9GUM0Uyoej5h99Za9ASAY=;
 b=G89QYguPdy8bOIZE8S03Jbb01k6i/2RBm/6TWyS8mC99tMvcPaBQQ1RjBj4QzL+wxU
 nzLeSFjTi9mZLimbqxr+JvtVikvRvwCH8GTVtJNuJHiqnVSwL+VkTGkDAux1DYpsZ0Vf
 EF4pZ/GFfhj2j7cUhtW48Ef2WCq5N7eWwsN9VIHrfKdmkRb6FruHiMTU5FXQKB2cAgYb
 RhjoL5c1eXAYNckhQFCPzwhdTGapEQkC788UxAhaZQhM1tANNWxtITqSqf/PLZqNN2Sc
 ASiH1Y+/Po8aqtrQZqRLCwDUJ5vbxoewhIjaLWNngk+y3qoiswRLYude1r9RRbYnVlLp
 MaGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxGNFB+M3mWhdQ8dE98jdUG8qgWFc2OIprL7JCD4pe09zAN6Xiyr7+3o0DfOF2o6xt7+SUHugPw4fGqIa5/cbW@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzLC90KiGMHLgd1FhoCoxeAf2Y/FtZeuikWkETRrJ84t0uToHgV
 DbBoiSTBAODec2CTYAhm4y1I12YJJNZG+L+/DE+OUxoBfRP7zTYz+DRHP5aufBvcbHcpyjsFkjb
 ogvrt+w==
X-Google-Smtp-Source: AGHT+IEyb34/gE6QWzF0uzhcKPL3N9PV8BEpaNWr9b3Rp3K51ypbe1jmOBzkgqmwgOny3WdOfUFKvL+VZBw=
X-Received: from pjz11.prod.google.com ([2002:a17:90b:56cb:b0:33b:a35b:861])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:7351:b0:251:c33d:2783
 with SMTP id adf61e73a8af0-32da813ce42mr40108259637.23.1760568519460; Wed, 15
 Oct 2025 15:48:39 -0700 (PDT)
Date: Wed, 15 Oct 2025 15:48:38 -0700
In-Reply-To: <aPAWFQyFLK4EKWVK@gourry-fedora-PF4VCD3F>
Mime-Version: 1.0
References: <20250827175247.83322-2-shivankg@amd.com>
 <20250827175247.83322-9-shivankg@amd.com>
 <aNVQJqYLX17v-fsf@google.com> <aNbrO7A7fSjb4W84@google.com>
 <aPAWFQyFLK4EKWVK@gourry-fedora-PF4VCD3F>
Message-ID: <aPAkxp67-R9aQ8oN@google.com>
To: Gregory Price <gourry@gourry.net>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Oct 15, 2025, Gregory Price wrote: > On Fri, Sep 26, 
 2025 at 12:36:27PM -0700, Sean Christopherson via Linux-f2fs-devel wrote:
 > > > > > > static struct mempolicy *kvm_gmem_get_policy(struct v [...] 
 Content analysis details:   (-7.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.202 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1v9AIc-0007Gp-Mr
Subject: Re: [f2fs-dev] [PATCH kvm-next V11 6/7] KVM: guest_memfd: Enforce
 NUMA mempolicy using shared policy
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
From: Sean Christopherson via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sean Christopherson <seanjc@google.com>
Cc: jgowans@amazon.com, mhocko@suse.com, gshan@redhat.com, jgg@nvidia.com,
 kvm@vger.kernel.org, david@redhat.com, kalyazin@amazon.com, peterx@redhat.com,
 clm@fb.com, rppt@kernel.org, ddutile@redhat.com,
 linux-kselftest@vger.kernel.org, papaluri@amd.com, jack@suse.cz,
 ying.huang@linux.alibaba.com, shuah@kernel.org, dan.j.williams@intel.com,
 matthew.brost@intel.com, zbestahu@gmail.com, lorenzo.stoakes@oracle.com,
 pvorel@suse.cz, ira.weiny@intel.com, dhavale@google.com, jmorris@namei.org,
 willy@infradead.org, hch@infradead.org, linux-bcachefs@vger.kernel.org,
 vbabka@suse.cz, ziy@nvidia.com, rientjes@google.com, brauner@kernel.org,
 xiang@kernel.org, roypat@amazon.co.uk, chao.gao@intel.com,
 Shivank Garg <shivankg@amd.com>, thomas.lendacky@amd.com, ashish.kalra@amd.com,
 chao.p.peng@intel.com, yan.y.zhao@intel.com, byungchul@sk.com,
 michael.day@amd.com, Neeraj.Upadhyay@amd.com, michael.roth@amd.com,
 bfoster@redhat.com, bharata@amd.com, josef@toxicpanda.com,
 Liam.Howlett@oracle.com, surenb@google.com, ackerleytng@google.com,
 suzuki.poulose@arm.com, linux-coco@lists.linux.dev, dsterba@suse.com,
 shdhiman@amd.com, jaegeuk@kernel.org, amit@infradead.org, tabba@google.com,
 yuzhao@google.com, joshua.hahnjy@gmail.com, apopple@nvidia.com, nikunj@amd.com,
 vannapurve@google.com, quic_eberman@quicinc.com, paul@paul-moore.com,
 cgzones@googlemail.com, linux-mm@kvack.org, kent.overstreet@linux.dev,
 rakie.kim@sk.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, pankaj.gupta@amd.com,
 linux-security-module@vger.kernel.org, lihongbo22@huawei.com,
 jefflexu@linux.alibaba.com, aik@amd.com, linux-fsdevel@vger.kernel.org,
 pbonzini@redhat.com, akpm@linux-foundation.org, serge@hallyn.com,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org,
 viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Oct 15, 2025, Gregory Price wrote:
> On Fri, Sep 26, 2025 at 12:36:27PM -0700, Sean Christopherson via Linux-f2fs-devel wrote:
> > > 
> > > static struct mempolicy *kvm_gmem_get_policy(struct vm_area_struct *vma,
> > > 					     unsigned long addr, pgoff_t *pgoff)
> > > {
> > > 	*pgoff = vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
> > > 
> > > 	return __kvm_gmem_get_policy(GMEM_I(file_inode(vma->vm_file)), *pgoff);
> > 
> > Argh!!!!!  This breaks the selftest because do_get_mempolicy() very specifically
> > falls back to the default_policy, NOT to the current task's policy.  That is
> > *exactly* the type of subtle detail that needs to be commented, because there's
> > no way some random KVM developer is going to know that returning NULL here is
> > important with respect to get_mempolicy() ABI.
> > 
> 
> Do_get_mempolicy was designed to be accessed by the syscall, not as an
> in-kernel ABI.

Ya, by "get_mempolicy() ABI" I meant the uABI for the get_mempolicy syscall.

> get_task_policy also returns the default policy if there's nothing
> there, because that's what applies.
> 
> I have dangerous questions:

Not dangerous at all, I find them very helpful!

> why is __kvm_gmem_get_policy using
> 	mpol_shared_policy_lookup()
> instead of
> 	get_vma_policy()

With the disclaimer that I haven't followed the gory details of this series super
closely, my understanding is...

Because the VMA is a means to an end, and we want the policy to persist even if
the VMA goes away.

With guest_memfd, KVM effectively inverts the standard MMU model.  Instead of mm/
being the primary MMU and KVM being a secondary MMU, guest_memfd is the primary
MMU and any VMAs are secondary (mostly; it's probably more like 1a and 1b).  This
allows KVM to map guest_memfd memory into a guest without a VMA, or with more
permissions than are granted to host userspace, e.g. guest_memfd memory could be
writable by the guest, but read-only for userspace.

But we still want to support things like mbind() so that userspace can ensure
guest_memfd allocations align with the vNUMA topology presented to the guest,
or are bound to the NUMA node where the VM will run.  We considered adding equivalent
file-based syscalls, e.g. fbind(), but IIRC the consensus was that doing so was
unnecessary (and potentially messy?) since we were planning on eventually adding
mmap() support to guest_memfd anyways.

> get_vma_policy does this all for you

I assume that doesn't work if the intent is for new VMAs to pick up the existing
policy from guest_memfd?  And more importantly, guest_memfd needs to hook
->set_policy so that changes through e.g. mbind() persist beyond the lifetime of
the VMA.

> struct mempolicy *get_vma_policy(struct vm_area_struct *vma,
>                                  unsigned long addr, int order, pgoff_t *ilx)
> {
>         struct mempolicy *pol;
> 
>         pol = __get_vma_policy(vma, addr, ilx);
>         if (!pol)
>                 pol = get_task_policy(current);
>         if (pol->mode == MPOL_INTERLEAVE ||
>             pol->mode == MPOL_WEIGHTED_INTERLEAVE) {
>                 *ilx += vma->vm_pgoff >> order;
>                 *ilx += (addr - vma->vm_start) >> (PAGE_SHIFT + order);
>         }
>         return pol;
> }
> 
> Of course you still have the same issue: get_task_policy will return the
> default, because that's what applies.
> 
> do_get_mempolicy just seems like the completely incorrect interface to
> be using here.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
