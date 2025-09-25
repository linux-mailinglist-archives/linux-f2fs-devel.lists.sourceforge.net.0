Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A50B9FD9D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Sep 2025 16:11:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+2IUaldgOX3F/yzBCN92WAXmqeIsMoFx7drK+G51EiY=; b=DbCHLqpsq1pgJZfGp7sNVwd24t
	z9ZBl6UIsgL+J2vU+KPBpgaoYWEoylWkKOTKIZRpa61DwBaefBrCgON+OUS9bMcARKoPqo7k0ChME
	Nvk6FXzXGu2khxLlrCEBoNqr1vQB8O6oQGo1vr45nadOgZRDPZy/5CKH+HV9m0RkU34w=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v1mgT-0002qV-H6;
	Thu, 25 Sep 2025 14:10:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3IkzVaAYKAF0N95IE7BJJBG9.7JH@flex--seanjc.bounces.google.com>)
 id 1v1mgS-0002qP-Gw for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Sep 2025 14:10:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K3Nb5Uy/w9+ATOrN88r3+4hXRo3JqcPtuKmPJ0+uxMw=; b=GlXfSABtBW08Gde6FMRwTRv/Sp
 +6egHW16Vx30QeyNLdMZ3WXXKE/tQU+bQArbmAEkFL605Y32AZDgNQhuZacyimf96jZ8ANAHxrO2q
 kCMxjlKMtJ3c1lTBR/yPlrFAMaQ+pzFxgAOAVsYEIzx6DH21DTMrxK1HicOf+Kero4aE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K3Nb5Uy/w9+ATOrN88r3+4hXRo3JqcPtuKmPJ0+uxMw=; b=fAzKYJwMaWqGv9FLphtfXF2rb7
 ZggU/xANRaOe9gUNehw2GEZKIIQl9r50PA2dwysekQWXE3UG1nX/Q9vRCLWzBZMn4e84YeVyYn951
 0PlZfWfoFY3XxBgm3OGOUjXQKNqRLrMGAxHTRpg2RhZogaKHhpXVZpg4D7uC7+BDJAPw=;
Received: from mail-vs1-f73.google.com ([209.85.217.73])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v1mgS-00047n-1G for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Sep 2025 14:10:56 +0000
Received: by mail-vs1-f73.google.com with SMTP id
 ada2fe7eead31-588c87efb7dso1611717137.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 25 Sep 2025 07:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1758809449; x=1759414249;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=K3Nb5Uy/w9+ATOrN88r3+4hXRo3JqcPtuKmPJ0+uxMw=;
 b=dT/gNnEj0R17bngc+f01dE4CaxGxe/XI345WA+y3hlR93LLtTWeln4U3jK2Av2j+81
 rcdepmDnnLqnb1UQdkuV7q95W9BRJRdTYuZHK60vjLan6O7CYkp3zUFK8Q48RXUpka0/
 reJRKcRv1pQOI8ro1uJSuezm1DwZoIarhsmZMA+AkHX3VtuueJYPgWq6DX3jKODaoKIy
 yX+v3x793408szcMHzfvy6NQZ4tYJrGGyEG2fsNERpuWWtQUnsPDDb2+6hntqeIUqC6c
 tq++e0qvuo9JiKrrf5n/scmttNfs/CVqe98XinPlVW0wGTaLXTbwA9jBIpNSiTsqZfHx
 3fqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758809449; x=1759414249;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K3Nb5Uy/w9+ATOrN88r3+4hXRo3JqcPtuKmPJ0+uxMw=;
 b=PwDNczn1b6Qqe4jOOoqgcpnygYnnJaNLek2Sd5sNinq8OTQ38xNoUcDc15Wfh8RF8P
 UQmQKPJzLvKKkY1X9MCoknDI+llt0DktiAsiWRn6vz6bA/rs1GQbTD/NG5K1le42psNi
 ftZDtC183bEfqiDxYqcOHyoFhv0+ECmGlUNtM6ZYmUsKAjnO0ZSqzVslSzUtyuExskBQ
 am0I09GNOF/FPJ3iFF66NTjFllpO5VXKJ+pT5oRm/hmekOo/ziMChM9WsViFhb+JIFyr
 OYErY20f+Xx0KYfSqwDvPlR+GSGxWjTBPgM7tmYazZsIMCb2eirtZJ2VlzCvk/RIG26g
 sr9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSYq72VqRrWX3eBogbwLE2clkfRbZsza30hfzkfELaRuwTa1tu4emEvmxFIb/mw0D06buNQanptrIls8DHPVm9@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx/f1viWVNZ/t+jo95raCXAk/fRkHNuyoBwTQ+MeEddwWWPN1oq
 qzEMJkMzYyIz80pcUkEvm0iDj5j+/7b3VJ+mtx6kP/axOYRvGj3APmwXkRSD6mWgHZu9gYonShU
 v3ynRHw==
X-Google-Smtp-Source: AGHT+IEkjjemcop0vI/vs3xI7IyH1QWjecMMGslQWYv6HGbBMSaTE77RWNjTkPN4A7aBZK5WeU4rCe73+w4=
X-Received: from pjo9.prod.google.com ([2002:a17:90b:5669:b0:32e:e155:ee48])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4f8e:b0:32e:7270:94a4
 with SMTP id 98e67ed59e1d1-3342a22f5c5mr3557648a91.14.1758809122488; Thu, 25
 Sep 2025 07:05:22 -0700 (PDT)
Date: Thu, 25 Sep 2025 07:05:21 -0700
In-Reply-To: <20250827175247.83322-8-shivankg@amd.com>
Mime-Version: 1.0
References: <20250827175247.83322-2-shivankg@amd.com>
 <20250827175247.83322-8-shivankg@amd.com>
Message-ID: <aNVMIRels8iCldOj@google.com>
To: Shivank Garg <shivankg@amd.com>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Aug 27, 2025, Shivank Garg wrote: > Add dedicated
 inode structure (kvm_gmem_inode_info) and slab-allocated > inode cache for
 guest memory backing, similar to how shmem handles inodes. > > This [...]
 Content analysis details:   (-7.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.73 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1v1mgS-00047n-1G
Subject: Re: [f2fs-dev] [PATCH kvm-next V11 5/7] KVM: guest_memfd: Add
 slab-allocated inode cache
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
Cc: jgowans@amazon.com, mhocko@suse.com, jack@suse.cz, kvm@vger.kernel.org,
 david@redhat.com, linux-btrfs@vger.kernel.org, aik@amd.com, papaluri@amd.com,
 kalyazin@amazon.com, peterx@redhat.com, linux-mm@kvack.org, clm@fb.com,
 ddutile@redhat.com, linux-kselftest@vger.kernel.org, shdhiman@amd.com,
 gshan@redhat.com, ying.huang@linux.alibaba.com, shuah@kernel.org,
 roypat@amazon.co.uk, matthew.brost@intel.com, linux-coco@lists.linux.dev,
 zbestahu@gmail.com, lorenzo.stoakes@oracle.com, linux-bcachefs@vger.kernel.org,
 ira.weiny@intel.com, dhavale@google.com, jmorris@namei.org,
 willy@infradead.org, hch@infradead.org, chao.gao@intel.com, tabba@google.com,
 ziy@nvidia.com, rientjes@google.com, yuzhao@google.com, xiang@kernel.org,
 nikunj@amd.com, gourry@gourry.net, serge@hallyn.com, amit@infradead.org,
 thomas.lendacky@amd.com, ashish.kalra@amd.com, chao.p.peng@intel.com,
 yan.y.zhao@intel.com, byungchul@sk.com, michael.day@amd.com,
 Neeraj.Upadhyay@amd.com, michael.roth@amd.com, bfoster@redhat.com,
 bharata@amd.com, josef@toxicpanda.com, Liam.Howlett@oracle.com,
 ackerleytng@google.com, dsterba@suse.com, viro@zeniv.linux.org.uk,
 jefflexu@linux.alibaba.com, jaegeuk@kernel.org, dan.j.williams@intel.com,
 surenb@google.com, vbabka@suse.cz, paul@paul-moore.com,
 joshua.hahnjy@gmail.com, apopple@nvidia.com, brauner@kernel.org,
 quic_eberman@quicinc.com, rakie.kim@sk.com, cgzones@googlemail.com,
 pvorel@suse.cz, linux-erofs@lists.ozlabs.org, kent.overstreet@linux.dev,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 pankaj.gupta@amd.com, linux-security-module@vger.kernel.org,
 lihongbo22@huawei.com, linux-fsdevel@vger.kernel.org, pbonzini@redhat.com,
 akpm@linux-foundation.org, vannapurve@google.com, suzuki.poulose@arm.com,
 rppt@kernel.org, jgg@nvidia.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Aug 27, 2025, Shivank Garg wrote:
> Add dedicated inode structure (kvm_gmem_inode_info) and slab-allocated
> inode cache for guest memory backing, similar to how shmem handles inodes.
> 
> This adds the necessary allocation/destruction functions and prepares
> for upcoming guest_memfd NUMA policy support changes.
> 
> Signed-off-by: Shivank Garg <shivankg@amd.com>
> ---
>  virt/kvm/guest_memfd.c | 70 ++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 68 insertions(+), 2 deletions(-)
> 
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 6c66a0974055..356947d36a47 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -17,6 +17,15 @@ struct kvm_gmem {
>  	struct list_head entry;
>  };
>  
> +struct kvm_gmem_inode_info {

What about naming this simply gmem_inode?

> +	struct inode vfs_inode;
> +};
> +
> +static inline struct kvm_gmem_inode_info *KVM_GMEM_I(struct inode *inode)

And then GMEM_I()?

And then (in a later follow-up if we target this for 6.18, or as a prep patch if
we push this out to 6.19), rename kvm_gmem to gmem_file?

That would make guest_memfd look a bit more like other filesystems, and I don't
see a need to preface the local structures and helpers with "kvm_", e.g. GMEM_I()
is analogous to x86's to_vmx() and to_svm().

As for renaming kvm_gmem => gmem_file, I wandered back into this code via Ackerley's
in-place conversion series, and it took me a good long while to remember the roles
of files vs. inodes in gmem.  That's probably a sign that the code needs clarification
given that I wrote the original code.  :-)

Leveraging an old discussion[*], my thought is to get to this:

/*
 * A guest_memfd instance can be associated multiple VMs, each with its own
 * "view" of the underlying physical memory.
 *
 * The gmem's inode is effectively the raw underlying physical storage, and is
 * used to track properties of the physical memory, while each gmem file is
 * effectively a single VM's view of that storage, and is used to track assets
 * specific to its associated VM, e.g. memslots=>gmem bindings.
 */
struct gmem_file {
	struct kvm *kvm;
	struct xarray bindings;
	struct list_head entry;
};

struct gmem_inode {
	struct shared_policy policy;
	struct inode vfs_inode;
};

[*] https://lore.kernel.org/all/ZLGiEfJZTyl7M8mS@google.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
