Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBC4BE032A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Oct 2025 20:34:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IDeAsz6lrj7taR8V3TTMnqvyyGVCOOyVCO46HZ/Fy1k=; b=cTstlSmRKvnTcTulAyrQnljVbU
	1akorA+jFAD1Co+KCoOfvpmaJSZB/UB+73ooVrcpZJPqpk3h/YEWurBFTPwvkogLsMyoVKtJXrhrM
	BhQBBRHZJHRpB++ejUc0sUpKuEDaVANZXWNCTU9OpIY1c7gfS8dS0u36P34xEtUJDkRI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v96KV-0002jG-Sg;
	Wed, 15 Oct 2025 18:34:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3g-LvaAYKAFYG2yB704CC492.0CA@flex--seanjc.bounces.google.com>)
 id 1v96KU-0002j8-5k for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Oct 2025 18:34:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wj/ujD0eXtGvKYdVuuqLrx+hKA4SG0aPTcTudPvMU20=; b=WMl9gguFOwg3DqLRWzw5FOtQ/e
 9kXzO1KuIWYrDS0ZwcSvVow53oZTbj5lHVRlFejUaIIEIws+MLmH3Ar8KCxeKZOALApWh8NBsHlFM
 2DRnVW31GppBnbiyei8zVKWC29bZK/wgzA8VaCC+EIosvDznj4y1RFnSrZWV/TIdptcM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wj/ujD0eXtGvKYdVuuqLrx+hKA4SG0aPTcTudPvMU20=; b=liSXd1pXMxAG4lWYr50fqVVz4q
 cD19DYNNcrX483AdIj3r5mAjLMPRUwdMX9KljUl79+MVeLKbNX+KAiGKxJOrbNUpPHzukFc3rGLfD
 KPI58vEWOM7M07oI8qq7HbypMU0zqZJCdlwG8jhPkXUxrVesMYA24FegtN1Q03QBAY1g=;
Received: from mail-pl1-f202.google.com ([209.85.214.202])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v96KT-0003JC-Mi for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Oct 2025 18:34:30 +0000
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-2904e9e0ef9so146157615ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 15 Oct 2025 11:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1760553264; x=1761158064;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=wj/ujD0eXtGvKYdVuuqLrx+hKA4SG0aPTcTudPvMU20=;
 b=Vy5OUeOSDDA8wyeenhFpgdDVV/jxcCdFONejej03ZKNeC7AK64mf9DpN9P3SEMw2iB
 YPpPNBI6xv4zeAfxHvgg1il9MLOYHBdvstofNsrUPFbzCwIO4dgD+7V4BBKiaAu8TzDy
 1aczVns8vDriGM5iIIyq3oHmEmwnWFm7lHg6iAHXmukv0bOQ4MyRXAU1CcgVzaHPfudO
 y+NXhA6XRFnLNcCOe/Bjy2xbwDzPGg8/DWP62fuylWiLai5JVoJnHXGU/50W0yHdwHk0
 39ukviGX85Pn5tKvgrY5LEZVqnMuIuqEXCFuRTdjBnleiPUgegQEefwaVp/GF8PooPAW
 oo+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760553264; x=1761158064;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wj/ujD0eXtGvKYdVuuqLrx+hKA4SG0aPTcTudPvMU20=;
 b=c1MZhcSbflqnCxqySrwga+04Df2zk1SU0pAxF1+QvV8c/Vkx+29Y6QUzUzCsxdPz4r
 U0URpzuYYr6AZ+RUpxy9UWi3dxKzs4uxJ4xS517uyvSYoCC3ydw2GJ257vw6Y+5HpTDa
 FhEYvWFx/URgSI8Rg+HI2cqvzHayFu9nZDHQybRUktSDbo9TBk3I4Etr6SmRorb187vV
 0V01hz82FczV4MwGTgKiuNs8sB4fP/JRRYATHU7PwrVqZMqDMmYyZ4G6ecgbbr/ZAPEo
 ppzZcavTkGX3E2FxwzPEM2TCnrNXVGyV2HrVhhkB90GHIS4P8yJh4TidFelesmo1pHK7
 494g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIQHmovYiaCYfVNMLqFKpz9xkWfFbd1wAVMzZd1NG0bCyDkosc7LknGINO5J2ImVoiRQlXOdV+a6m4OENzHUoM@lists.sourceforge.net
X-Gm-Message-State: AOJu0Ywv+6Wub7bm2THSLsggVkzcIdPpwdbkHPSq7pX64I/Hd8E1d9Po
 X+OQDZvT6SM5BhVjD7LbdG1mkj+NIOsRanmYZSUhuC9UEh4inE8VGnf/O/DkLRq0c8bqe7wswEJ
 J98ZVNg==
X-Google-Smtp-Source: AGHT+IH/Mc5bux0nHPu+CkauZuwZIYiV046udmQ4p4yB6kgoXdVfplmR64sQJckJg1s2r9B+yaVqVDHEGb8=
X-Received: from pjrv8.prod.google.com ([2002:a17:90a:bb88:b0:32e:b34b:92eb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:3d05:b0:26e:49e3:55f1
 with SMTP id d9443c01a7336-29027373d9amr366930845ad.18.1760551555936; Wed, 15
 Oct 2025 11:05:55 -0700 (PDT)
Date: Wed, 15 Oct 2025 11:02:44 -0700
In-Reply-To: <20250827175247.83322-2-shivankg@amd.com>
Mime-Version: 1.0
References: <20250827175247.83322-2-shivankg@amd.com>
X-Mailer: git-send-email 2.51.0.788.g6d19910ace-goog
Message-ID: <176055105546.1527431.3611256810380818215.b4-ty@google.com>
To: Sean Christopherson <seanjc@google.com>, willy@infradead.org,
 akpm@linux-foundation.org, 
 david@redhat.com, pbonzini@redhat.com, shuah@kernel.org, vbabka@suse.cz, 
 Shivank Garg <shivankg@amd.com>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, 27 Aug 2025 17:52:41 +0000, Shivank Garg wrote: >
 This series introduces NUMA-aware memory placement support for KVM guests
 > with guest_memfd memory backends. It builds upon Fuad Tabba's work [...]
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
 [209.85.214.202 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1v96KT-0003JC-Mi
Subject: Re: [f2fs-dev] [PATCH kvm-next V11 0/7] Add NUMA mempolicy support
 for KVM guest-memfd
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
 dhavale@google.com, linux-btrfs@vger.kernel.org, aik@amd.com, papaluri@amd.com,
 kalyazin@amazon.com, peterx@redhat.com, linux-mm@kvack.org, clm@fb.com,
 ddutile@redhat.com, linux-kselftest@vger.kernel.org, shdhiman@amd.com,
 gshan@redhat.com, ying.huang@linux.alibaba.com, ira.weiny@intel.com,
 roypat@amazon.co.uk, matthew.brost@intel.com, Jason Gunthorpe <jgg@ziepe.ca>,
 zbestahu@gmail.com, lorenzo.stoakes@oracle.com, linux-bcachefs@vger.kernel.org,
 apopple@nvidia.com, jmorris@namei.org, hch@infradead.org, chao.gao@intel.com,
 cgzones@googlemail.com, ziy@nvidia.com, rientjes@google.com, yuzhao@google.com,
 xiang@kernel.org, nikunj@amd.com, gourry@gourry.net, serge@hallyn.com,
 amit@infradead.org, thomas.lendacky@amd.com, ashish.kalra@amd.com,
 chao.p.peng@intel.com, yan.y.zhao@intel.com, byungchul@sk.com,
 michael.day@amd.com, Neeraj.Upadhyay@amd.com, michael.roth@amd.com,
 bfoster@redhat.com, bharata@amd.com, josef@toxicpanda.com,
 Liam.Howlett@oracle.com, ackerleytng@google.com, dsterba@suse.com,
 viro@zeniv.linux.org.uk, jefflexu@linux.alibaba.com, jaegeuk@kernel.org,
 dan.j.williams@intel.com, surenb@google.com, tabba@google.com,
 paul@paul-moore.com, joshua.hahnjy@gmail.com, brauner@kernel.org,
 quic_eberman@quicinc.com, rakie.kim@sk.com, pvorel@suse.cz,
 linux-erofs@lists.ozlabs.org, kent.overstreet@linux.dev,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 pankaj.gupta@amd.com, linux-security-module@vger.kernel.org,
 lihongbo22@huawei.com, linux-fsdevel@vger.kernel.org, vannapurve@google.com,
 suzuki.poulose@arm.com, rppt@kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, 27 Aug 2025 17:52:41 +0000, Shivank Garg wrote:
> This series introduces NUMA-aware memory placement support for KVM guests
> with guest_memfd memory backends. It builds upon Fuad Tabba's work (V17)
> that enabled host-mapping for guest_memfd memory [1] and can be applied
> directly applied on KVM tree [2] (branch kvm-next, base commit: a6ad5413,
> Merge branch 'guest-memfd-mmap' into HEAD)
> 
> == Background ==
> KVM's guest-memfd memory backend currently lacks support for NUMA policy
> enforcement, causing guest memory allocations to be distributed across host
> nodes  according to kernel's default behavior, irrespective of any policy
> specified by the VMM. This limitation arises because conventional userspace
> NUMA control mechanisms like mbind(2) don't work since the memory isn't
> directly mapped to userspace when allocations occur.
> Fuad's work [1] provides the necessary mmap capability, and this series
> leverages it to enable mbind(2).
> 
> [...]

Applied the non-KVM change to kvm-x86 gmem.  We're still tweaking and iterating
on the KVM changes, but I fully expect them to land in 6.19.

Holler if you object to taking these through the kvm tree.

[1/7] mm/filemap: Add NUMA mempolicy support to filemap_alloc_folio()
      https://github.com/kvm-x86/linux/commit/601aa29f762f
[2/7] mm/filemap: Extend __filemap_get_folio() to support NUMA memory policies
      https://github.com/kvm-x86/linux/commit/2bb25703e5bd
[3/7] mm/mempolicy: Export memory policy symbols
      https://github.com/kvm-x86/linux/commit/e1b4cf7d6be3

--
https://github.com/kvm-x86/linux/tree/next


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
