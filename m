Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A5ABA4FB2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Sep 2025 21:36:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NA9xvRFKqHJKSL+oO3ai4Vxay5djc+RWBmENStqcA1c=; b=Px7WLH33KNpHvRIzHv7n+2748m
	tXDLzr7sQhD2P084m5DY+ReyLKPL2Hzhq4pSgIrsgJRexgVnPxzvar7Eg2+zQpIIGrPzFTyxgb/jc
	SClriOUqWw1/pogcwN70PLJTVq7p+mHxZMp2EaOJEJQBmO/SQHQMz9LuuUQe04kHZ0fs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v2EFH-0003I9-A4;
	Fri, 26 Sep 2025 19:36:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3POvWaAYKALstfbokdhpphmf.dpn@flex--seanjc.bounces.google.com>)
 id 1v2EFD-0003Ho-Nw for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Sep 2025 19:36:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ob/iOTJHVtIxulD10+qfYKaLq05XmILMIQZZtCe3LNU=; b=RfLGZLDcCZC3OkpIVoWEa+acVO
 PbeFQQwXfmq+zLghy4hrSwplTky6SEMNEH+VT+8I8AN1zQCz0LMcH5MlAYK2qfmjZ3SzuKsW+6l8i
 XP33lI5O0b6JO5F2z7aJz/oXaILZeIADhSQQ7fGgSMHEN3DOXYUmzAWevSjBQxl+9HLQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ob/iOTJHVtIxulD10+qfYKaLq05XmILMIQZZtCe3LNU=; b=RtnkXc47Hu0A2rOCpuxF1OriIw
 tHOfJOuBvXF20XaAIXIvZUnjYJHN/nDcb1xAikZud56mqcGqALreJxnXxUlNI/BkKXm38j70hO3/I
 +X0nSm0LhfX18jU9VSraXdGZlAnjIk7QSja83pzuly/BY8qxQaS6rNNdUk1Z+poxcI2s=;
Received: from mail-pj1-f73.google.com ([209.85.216.73])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v2EFD-0000xX-Tl for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Sep 2025 19:36:40 +0000
Received: by mail-pj1-f73.google.com with SMTP id
 98e67ed59e1d1-32edda89a37so2319886a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 Sep 2025 12:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1758915389; x=1759520189;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ob/iOTJHVtIxulD10+qfYKaLq05XmILMIQZZtCe3LNU=;
 b=t2lOS1e+t//rEMBE+iWmPKuIUJBxqaliS8JDC/sEy9LK1hfojR1rcPMOVbmRXVSdEv
 WgoiRGiTHhEcRoxfVYCtVSTgEFAdAjLuz970Ampf4fwKFv2SRUOCHTORvlyx362btA+y
 /+aoTJ/6fi9UES9OnXmYKDu+njqCQ9ch2O4YksdbGa/derFz5JkCO8CU0EXou2fWkba1
 vqKxWzTcqxPgHoQdjk4VgNxjRZ/9wu3+BVA39VQeptZMIqOWI3PvDNimILG5Qkta71pS
 4jWwRQUvnnUl0pB77DeiAtujwBIac4X4lYCiUT2KbM60TfgKDymTjhZ82UvDeIs8+wWc
 vbMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758915389; x=1759520189;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ob/iOTJHVtIxulD10+qfYKaLq05XmILMIQZZtCe3LNU=;
 b=TmRDIzYA06YlgcHe+aRNrm28ElL4fyU1X4u6c8iobfhfFu69hPxf7aj3YMF0PRihQU
 YqJPpv4VWq3v/TN4JHaEPLrHNRo2SjZwPgqdHbMIY/YPBNOcHT8WH8/6IqDQAQKUD21i
 3gNvS3Cbz9WmKUB6sVgIGR4JZ3xPIA5FpLoLc2MpX3/OQOSb5crJQMuH7sMzfxwhL492
 uA2Yr/Aw3pMoFP0m0XilJ+RVeGvFb9hk6cJYqyilxvCAlsKR1Esq4FqdGLgp2zP9g8ae
 Mudv1OQQlo8KTbWDX1bM6l70kusoSnQed/LESmEl7c2KueKJSuFNvBYBRNfSfFk4I5Cd
 ULgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+1JijFkxBntr1aVnAkJuknFCmPowM0ed5wnaRH6KKHyBtbU+Uv+sE+FpZZGW6swKQ4KaMF8/3PTjKU4Ty3qVA@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwpGkAM+z5W/rnvJQq14eux5hZWWFTdfaO5ognVGirSHnvASW4L
 s3O7cnUnnwxUO74qTDjWzATH0jjOJkmGVeZ7f9vxhN1ESZkxix1jFt8gOvxdFfosPJ5Qew6ThxZ
 //wBo3Q==
X-Google-Smtp-Source: AGHT+IFDksLZfiXKr/BILK4eWMYTpySqi06A6DOxX2zeNKzHO6pmJyAGRZ48y/vvPgWC6WRjoIw3qUZ+1+0=
X-Received: from pjbaz14.prod.google.com ([2002:a17:90b:28e:b0:32d:e264:a78e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1808:b0:32b:d8bf:c785
 with SMTP id 98e67ed59e1d1-3342a2c3979mr8949944a91.20.1758915388771; Fri, 26
 Sep 2025 12:36:28 -0700 (PDT)
Date: Fri, 26 Sep 2025 12:36:27 -0700
In-Reply-To: <aNVQJqYLX17v-fsf@google.com>
Mime-Version: 1.0
References: <20250827175247.83322-2-shivankg@amd.com>
 <20250827175247.83322-9-shivankg@amd.com>
 <aNVQJqYLX17v-fsf@google.com>
Message-ID: <aNbrO7A7fSjb4W84@google.com>
To: Shivank Garg <shivankg@amd.com>
X-Spam-Score: -4.9 (----)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Sep 25, 2025, Sean Christopherson wrote: > On Wed,
 Aug 27, 2025, Shivank Garg wrote: > > @@ -26,6 +28,9 @@ static inline struct
 kvm_gmem_inode_info *KVM_GMEM_I(struct inode *inode) > > return [...] 
 Content analysis details:   (-4.9 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 2.7 RCVD_IN_PSBL           RBL: Received via a relay in PSBL
 [209.85.216.73 listed in psbl.surriel.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.73 listed in list.dnswl.org]
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.73 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1v2EFD-0000xX-Tl
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

On Thu, Sep 25, 2025, Sean Christopherson wrote:
> On Wed, Aug 27, 2025, Shivank Garg wrote:
> > @@ -26,6 +28,9 @@ static inline struct kvm_gmem_inode_info *KVM_GMEM_I(struct inode *inode)
> >  	return container_of(inode, struct kvm_gmem_inode_info, vfs_inode);
> >  }
> >  
> > +static struct mempolicy *kvm_gmem_get_pgoff_policy(struct kvm_gmem_inode_info *info,
> > +						   pgoff_t index);
> > +
> >  /**
> >   * folio_file_pfn - like folio_file_page, but return a pfn.
> >   * @folio: The folio which contains this index.
> > @@ -112,7 +117,25 @@ static int kvm_gmem_prepare_folio(struct kvm *kvm, struct kvm_memory_slot *slot,
> >  static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
> >  {
> >  	/* TODO: Support huge pages. */
> > -	return filemap_grab_folio(inode->i_mapping, index);
> > +	struct mempolicy *policy;
> > +	struct folio *folio;
> > +
> > +	/*
> > +	 * Fast-path: See if folio is already present in mapping to avoid
> > +	 * policy_lookup.
> > +	 */
> > +	folio = __filemap_get_folio(inode->i_mapping, index,
> > +				    FGP_LOCK | FGP_ACCESSED, 0);
> > +	if (!IS_ERR(folio))
> > +		return folio;
> > +
> > +	policy = kvm_gmem_get_pgoff_policy(KVM_GMEM_I(inode), index);
> > +	folio = __filemap_get_folio_mpol(inode->i_mapping, index,
> > +					 FGP_LOCK | FGP_ACCESSED | FGP_CREAT,
> > +					 mapping_gfp_mask(inode->i_mapping), policy);
> > +	mpol_cond_put(policy);
> > +
> > +	return folio;
> >  }
> >  
> >  static void kvm_gmem_invalidate_begin(struct kvm_gmem *gmem, pgoff_t start,
> > @@ -372,8 +395,45 @@ static vm_fault_t kvm_gmem_fault_user_mapping(struct vm_fault *vmf)
> >  	return ret;
> >  }
> >  
> > +#ifdef CONFIG_NUMA
> > +static int kvm_gmem_set_policy(struct vm_area_struct *vma, struct mempolicy *mpol)
> > +{
> > +	struct inode *inode = file_inode(vma->vm_file);
> > +
> > +	return mpol_set_shared_policy(&KVM_GMEM_I(inode)->policy, vma, mpol);
> > +}
> > +
> > +static struct mempolicy *kvm_gmem_get_policy(struct vm_area_struct *vma,
> > +					     unsigned long addr, pgoff_t *pgoff)
> > +{
> > +	struct inode *inode = file_inode(vma->vm_file);
> > +
> > +	*pgoff = vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
> > +	return mpol_shared_policy_lookup(&KVM_GMEM_I(inode)->policy, *pgoff);
> > +}
> > +
> > +static struct mempolicy *kvm_gmem_get_pgoff_policy(struct kvm_gmem_inode_info *info,
> > +						   pgoff_t index)
> 
> I keep reading this is "page offset policy", as opposed to "policy given a page
> offset".  Another oddity that is confusing is that this helper explicitly does
> get_task_policy(current), while kvm_gmem_get_policy() lets the caller do that.
> The end result is the same, but I think it would be helpful for gmem to be
> internally consistent.
> 
> If we have kvm_gmem_get_policy() use this helper, then we can kill two birds with
> one stone:
> 
> static struct mempolicy *__kvm_gmem_get_policy(struct gmem_inode *gi,
> 					       pgoff_t index)
> {
> 	struct mempolicy *mpol;
> 
> 	mpol = mpol_shared_policy_lookup(&gi->policy, index);
> 	return mpol ? mpol : get_task_policy(current);
> }
> 
> static struct mempolicy *kvm_gmem_get_policy(struct vm_area_struct *vma,
> 					     unsigned long addr, pgoff_t *pgoff)
> {
> 	*pgoff = vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
> 
> 	return __kvm_gmem_get_policy(GMEM_I(file_inode(vma->vm_file)), *pgoff);

Argh!!!!!  This breaks the selftest because do_get_mempolicy() very specifically
falls back to the default_policy, NOT to the current task's policy.  That is
*exactly* the type of subtle detail that needs to be commented, because there's
no way some random KVM developer is going to know that returning NULL here is
important with respect to get_mempolicy() ABI.

On a happier note, I'm very glad you wrote a testcase :-)

I've got this as fixup-to-the-fixup:

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index e796cc552a96..61130a52553f 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -114,8 +114,8 @@ static int kvm_gmem_prepare_folio(struct kvm *kvm, struct kvm_memory_slot *slot,
        return r;
 }
 
-static struct mempolicy *__kvm_gmem_get_policy(struct gmem_inode *gi,
-                                              pgoff_t index)
+static struct mempolicy *kvm_gmem_get_folio_policy(struct gmem_inode *gi,
+                                                  pgoff_t index)
 {
 #ifdef CONFIG_NUMA
        struct mempolicy *mpol;
@@ -151,7 +151,7 @@ static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
        if (!IS_ERR(folio))
                return folio;
 
-       policy = __kvm_gmem_get_policy(GMEM_I(inode), index);
+       policy = kvm_gmem_get_folio_policy(GMEM_I(inode), index);
        folio = __filemap_get_folio_mpol(inode->i_mapping, index,
                                         FGP_LOCK | FGP_ACCESSED | FGP_CREAT,
                                         mapping_gfp_mask(inode->i_mapping), policy);
@@ -431,9 +431,18 @@ static int kvm_gmem_set_policy(struct vm_area_struct *vma, struct mempolicy *mpo
 static struct mempolicy *kvm_gmem_get_policy(struct vm_area_struct *vma,
                                              unsigned long addr, pgoff_t *pgoff)
 {
+       struct inode *inode = file_inode(vma->vm_file);
+
         *pgoff = vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
 
-        return __kvm_gmem_get_policy(GMEM_I(file_inode(vma->vm_file)), *pgoff);
+       /*
+        * Note!  Directly return whatever the lookup returns, do NOT return
+        * the current task's policy as is done when looking up the policy for
+        * a specific folio.  Kernel ABI for get_mempolicy() is to return
+        * MPOL_DEFAULT when there is no defined policy, not whatever the
+        * default policy resolves to.
+        */
+        return mpol_shared_policy_lookup(&GMEM_I(inode)->policy, *pgoff);
 }
 #endif /* CONFIG_NUMA */
 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
