Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D38B9FF54
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Sep 2025 16:22:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EtODF0TVL2nF+iug8bKfak6vejiif1LGU9yWdnfHf3k=; b=PAkxaVAyx4xX97Z97DBMj7UvI6
	W0qA1pgtmtR9niorkUBAti3kLSzuHLkUY8iTMvvocReo7NLOkKavUi0eWCrkjjkVA6EzdgAP2DRNS
	DFndd3Y6vstjBCNRgy3ZYccCEbTMacGFskInpz1uV9cDcrYOUjuggLnfTTMFBme7J96g=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v1mrs-0007Wv-RK;
	Thu, 25 Sep 2025 14:22:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3KFDVaAYKAGsbNJWSLPXXPUN.LXV@flex--seanjc.bounces.google.com>)
 id 1v1mrr-0007Wm-M0 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Sep 2025 14:22:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SblUb3K9vKSfuIkumtnWvH3DVTbw+wxBSl+ZySJr9Gg=; b=XKQLjqagFTfDtY7ipzqtOvtmAy
 zjniB+CZfMIxGD7AKLCA8NrcvcX/0LDpXBeKGRgN9K6D+oHkilYJRw3iwLkfiQYifnvqnmiJMxjn9
 HwCOxcP5c7niff/1RkXAJnlAzQVi59ueA2RqvhHWnhakX5V4f4Z/9c5ODvMNSxfpP35M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SblUb3K9vKSfuIkumtnWvH3DVTbw+wxBSl+ZySJr9Gg=; b=fJat2XMjTyiI8V6MW5rTBpKLwO
 Izoz6QkzVM/P6bruq/sI4HPGdyElBngAWVwak9OTVl882ehDS8gQhnI/w10UUnG6qpBZucHS/6wKh
 3jVh0bscMEn4xrtpHTDt15F12R9MOGedhFF2OjRCAFsvwlrbVlICLgfL2M1HOlwehx2I=;
Received: from mail-pg1-f202.google.com ([209.85.215.202])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v1mrr-0004wn-7h for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Sep 2025 14:22:43 +0000
Received: by mail-pg1-f202.google.com with SMTP id
 41be03b00d2f7-b54b37ba2d9so1601739a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 25 Sep 2025 07:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1758810152; x=1759414952;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=SblUb3K9vKSfuIkumtnWvH3DVTbw+wxBSl+ZySJr9Gg=;
 b=F0IfBOVqbvttCRshanrMRHuYHIKHSjrRdypXWKzyzLJiy+rx7PNeZDZT+eNUT1PkUz
 vAq8l11RM7/k1z0QFjdstKmb58Jk7cHh3yy34Q7PJ33ZKel8xCptVkaW3vd3R2TTRhzt
 XR/U0zb6PZjJI1Yn2p1HPGSSzNWdkMb5Es02whhxYroUrNEw7JoPDuT/cVFjR7+KgiAO
 BLPeDogIcDW0xKEXPqpLqLkHfiEcaWow4q6dU4NfT3tRUHxLUQgArX0MeqUwIxa/2Qb4
 8WmTGGBrsTfNBLMxn++vQ37zhu8JdTQD71NY4HAKJxx6SGpSP0p7cngys02VVGmAYMrx
 WN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758810152; x=1759414952;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SblUb3K9vKSfuIkumtnWvH3DVTbw+wxBSl+ZySJr9Gg=;
 b=gKouxgO2pwkgMse2YfhxoKNy6ovkwf4ZgAFDjQamGWJcoqlpxcj/JrDV12lpecXyt9
 dCfN30veLvC+RCnZhsIVH4X3je9WU3CnHZVDnUjMSc8Ff8KuSdw1k7PVkTcWARarHYmM
 O13ZZYBsbx1NqYPALyo0lvahm0ehwU0wpO27GFuBX0JgtZvntzZGYC+OS5Ia3enIhqU/
 uxmvAiDRmDN9u4gpBFAkr8bMW98wpI1dM5tvnxxP7PUSdcuFf+HS85m7Ns5lg5W1AC/x
 XInVQYRiuN+0wVbUGGFzrMVTckqUX/U/pPaoCe8kteHGNlU8NbxA1Bbl260yUbhJK+oa
 L3YA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqlnpkEawKdJosLDqcQU6eTPVUPrFqcrSRhi0cg6DcUUXJ72KW2hrTpHQ0Y5CXdIrKv9VQvtWxOpkoHqq2owwR@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwhdnTDPBoC6Lbuqj0LbNv16wsptDUN4HohjDOpD11EfFdc5/9p
 FN84IIkfkRuAnFZnTJMZULJBFo3o63sTUYPjUFAh5zQ5bjebS542k9rO+A2dQiVTAPwNyvTHU80
 LGNfURQ==
X-Google-Smtp-Source: AGHT+IH/f88NvvxTkAVG4DhhjQkTxFzTBsV5SbcgowW0+JrB9EElqsyS6+jWyWSmkD83IUsL47BQyHKSocQ=
X-Received: from pjbmj16.prod.google.com ([2002:a17:90b:3690:b0:32e:c154:c2f6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5107:b0:32b:a311:d1ae
 with SMTP id 98e67ed59e1d1-334567a1c56mr2743555a91.10.1758810152121; Thu, 25
 Sep 2025 07:22:32 -0700 (PDT)
Date: Thu, 25 Sep 2025 07:22:30 -0700
In-Reply-To: <20250827175247.83322-9-shivankg@amd.com>
Mime-Version: 1.0
References: <20250827175247.83322-2-shivankg@amd.com>
 <20250827175247.83322-9-shivankg@amd.com>
Message-ID: <aNVQJqYLX17v-fsf@google.com>
To: Shivank Garg <shivankg@amd.com>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Aug 27, 2025, Shivank Garg wrote: > @@ -26,6 +28,9
 @@ static inline struct kvm_gmem_inode_info *KVM_GMEM_I(struct inode *inode)
 > return container_of(inode, struct kvm_gmem_inode_info, vfs_ino [...] 
 Content analysis details:   (-7.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.202 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1v1mrr-0004wn-7h
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

On Wed, Aug 27, 2025, Shivank Garg wrote:
> @@ -26,6 +28,9 @@ static inline struct kvm_gmem_inode_info *KVM_GMEM_I(struct inode *inode)
>  	return container_of(inode, struct kvm_gmem_inode_info, vfs_inode);
>  }
>  
> +static struct mempolicy *kvm_gmem_get_pgoff_policy(struct kvm_gmem_inode_info *info,
> +						   pgoff_t index);
> +
>  /**
>   * folio_file_pfn - like folio_file_page, but return a pfn.
>   * @folio: The folio which contains this index.
> @@ -112,7 +117,25 @@ static int kvm_gmem_prepare_folio(struct kvm *kvm, struct kvm_memory_slot *slot,
>  static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
>  {
>  	/* TODO: Support huge pages. */
> -	return filemap_grab_folio(inode->i_mapping, index);
> +	struct mempolicy *policy;
> +	struct folio *folio;
> +
> +	/*
> +	 * Fast-path: See if folio is already present in mapping to avoid
> +	 * policy_lookup.
> +	 */
> +	folio = __filemap_get_folio(inode->i_mapping, index,
> +				    FGP_LOCK | FGP_ACCESSED, 0);
> +	if (!IS_ERR(folio))
> +		return folio;
> +
> +	policy = kvm_gmem_get_pgoff_policy(KVM_GMEM_I(inode), index);
> +	folio = __filemap_get_folio_mpol(inode->i_mapping, index,
> +					 FGP_LOCK | FGP_ACCESSED | FGP_CREAT,
> +					 mapping_gfp_mask(inode->i_mapping), policy);
> +	mpol_cond_put(policy);
> +
> +	return folio;
>  }
>  
>  static void kvm_gmem_invalidate_begin(struct kvm_gmem *gmem, pgoff_t start,
> @@ -372,8 +395,45 @@ static vm_fault_t kvm_gmem_fault_user_mapping(struct vm_fault *vmf)
>  	return ret;
>  }
>  
> +#ifdef CONFIG_NUMA
> +static int kvm_gmem_set_policy(struct vm_area_struct *vma, struct mempolicy *mpol)
> +{
> +	struct inode *inode = file_inode(vma->vm_file);
> +
> +	return mpol_set_shared_policy(&KVM_GMEM_I(inode)->policy, vma, mpol);
> +}
> +
> +static struct mempolicy *kvm_gmem_get_policy(struct vm_area_struct *vma,
> +					     unsigned long addr, pgoff_t *pgoff)
> +{
> +	struct inode *inode = file_inode(vma->vm_file);
> +
> +	*pgoff = vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
> +	return mpol_shared_policy_lookup(&KVM_GMEM_I(inode)->policy, *pgoff);
> +}
> +
> +static struct mempolicy *kvm_gmem_get_pgoff_policy(struct kvm_gmem_inode_info *info,
> +						   pgoff_t index)

I keep reading this is "page offset policy", as opposed to "policy given a page
offset".  Another oddity that is confusing is that this helper explicitly does
get_task_policy(current), while kvm_gmem_get_policy() lets the caller do that.
The end result is the same, but I think it would be helpful for gmem to be
internally consistent.

If we have kvm_gmem_get_policy() use this helper, then we can kill two birds with
one stone:

static struct mempolicy *__kvm_gmem_get_policy(struct gmem_inode *gi,
					       pgoff_t index)
{
	struct mempolicy *mpol;

	mpol = mpol_shared_policy_lookup(&gi->policy, index);
	return mpol ? mpol : get_task_policy(current);
}

static struct mempolicy *kvm_gmem_get_policy(struct vm_area_struct *vma,
					     unsigned long addr, pgoff_t *pgoff)
{
	*pgoff = vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);

	return __kvm_gmem_get_policy(GMEM_I(file_inode(vma->vm_file)), *pgoff);
}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
