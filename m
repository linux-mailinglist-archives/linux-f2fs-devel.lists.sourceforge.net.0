Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CC1BF2390
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Oct 2025 17:52:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7IwotoO8rSFaKirmt4s6B88DKYE7904bND0hMjH3gqA=; b=MQQE9xik4Qmk8q67FJIUJnINzO
	zf7IjMZn+0elH7GS89oRx8pZtBtAM6O1EnCnRnAcAaziChOrvohTUcKqIRL/rPxsr3P9B6mc5ELVK
	IH/RFs8D5M0mxcdAe90W90bYC9fizGShSCcGDm6RqkPOqwYlWjF6Szy2emdMNhGvFhcM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vAsBC-0002w4-Ud;
	Mon, 20 Oct 2025 15:52:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3plr2aAYKAIMzlhuqjnvvnsl.jvt@flex--seanjc.bounces.google.com>)
 id 1vAsBB-0002vv-Cr for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Oct 2025 15:52:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YUxEjev6w4f1umuBxGfAcuaZR32QUUEbuSMBs3oceNE=; b=L+oACp2668Ob4VRO2jU4Zy4akV
 /u9itpeMOFkM0vU8M4fZM0XEQ+ozzuuFdXovx3XTff+nJz29oNwrikwckE0QsGQeMfqvXNGHSmEIy
 0UbOQ8J7KIdp1QHY3+PyYJi5j8rPW7HzUZpVAciVDUSUj5r7UwwbrtwO9dXhsX8Hucow=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YUxEjev6w4f1umuBxGfAcuaZR32QUUEbuSMBs3oceNE=; b=CP527gxmZrgY4Mci+Jf3GNrhC7
 Nw3e5h2GW/6m1ZpG3WIewh39/qTGVjFQsaoURflVTPkCL0cudyfeSJt0M2idRJ63tR5UGmaDVow10
 sKRQ+qHRL9zk5ERglBjbIiHCkonEvUBT5o9995Z3gnmeYmuboXCT3ZTlx6qPp7/P7kes=;
Received: from mail-pj1-f74.google.com ([209.85.216.74])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vAsBA-0006bx-TR for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Oct 2025 15:52:13 +0000
Received: by mail-pj1-f74.google.com with SMTP id
 98e67ed59e1d1-33baf262850so4461656a91.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 Oct 2025 08:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1760975527; x=1761580327;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=YUxEjev6w4f1umuBxGfAcuaZR32QUUEbuSMBs3oceNE=;
 b=nErwc1fLE1JHUUmYhY2Kf+JJ1qX1x6lv1wiLwxZVjp7TywRE7GtN2JLWRKm2rL5VM1
 m+/eTOIJ61CpRBakJ/lqZr8l1oE+cb08VA8CPWEXvkATGzQP1GQQmjv1mU0gSCfBsl6H
 Q6ppNsFJnXQKeyJaMYCOEuxe9IobnPAiiuIWfhe9g5ZFYlI93sCUFreuIWOqFjseds/Y
 g/HMOAb3L9F6ejEbX+TZ3LWu0/eICykp8T1PckQJ5dHR8Ba0bQFFgMGE7AsRZ/AYuJM6
 n8Tq1Z+l6ENQEn6q2oiH3sYKmIbEVXkKoiKaloWAk2lfu+54ux2av18IfT4r8YRlLzA1
 TgdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760975527; x=1761580327;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YUxEjev6w4f1umuBxGfAcuaZR32QUUEbuSMBs3oceNE=;
 b=GIZhWztPCG2mASUFb6dSNu/XDKCjpkJ0SpmQ5+pq+gv/oHEHaIk4etewujOUQEhwK6
 BlxL6E45c3prjNC/AoyHXvn7pnqyeGmXMUF+qCsU8p6s1ZAa1qG4LFPnJv3OVycS6c7k
 5aOpRW6YUnjiCoXdnLcaJmAL7xOQ2Vj8yG714zKzVyNYNlGmT88wVIG1NVF+W+fSq+8V
 FEP6ARWaqA5q/iV5Z2Ns7hA9fIGWP8Ocg1hV30MTj2BZm4LbvHGEDhE3p6Sn9pK5Qnpd
 egNL9o1Vaytwduo+IesPC+lgHDh7aOu9yLYUf7+ZKI7Zmwsr6NgGRZLNNQ2cjoZiK7G9
 ofXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBhq9z+gQG49G0tcotLmgoau7j2j/aAhh8T0t1+8KKAYcDu7+5p+H7isqZzbBVFc0rX5IhP8KcYav+qSZRa8D4@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy590YOSJbJakBHMB1TwEw3HM71SdYyDQKEEKRa8vyaC5gYG1p0
 YICtwtaMLqGRQ/yuZgJ4WTHU+0EfiKiXnhSdIVeaspNTvi/TVxKNY2aTZjI7M60TC/kNl6xFiaF
 eL+3GEA==
X-Google-Smtp-Source: AGHT+IHcZobfkAMYLqgP+952/xufHk4lZqraqyIEs0BsZFGgLzowAsqRVArAQbVQNZgQWXn7bmNPNT9qaaI=
X-Received: from pjbds19.prod.google.com ([2002:a17:90b:8d3:b0:33b:51fe:1a84])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4d85:b0:330:4a1d:223c
 with SMTP id 98e67ed59e1d1-33bcf87f421mr15625676a91.15.1760975526813; Mon, 20
 Oct 2025 08:52:06 -0700 (PDT)
Date: Mon, 20 Oct 2025 08:52:05 -0700
In-Reply-To: <176055105546.1527431.3611256810380818215.b4-ty@google.com>
Mime-Version: 1.0
References: <20250827175247.83322-2-shivankg@amd.com>
 <176055105546.1527431.3611256810380818215.b4-ty@google.com>
Message-ID: <aPZapWWFGyqjA2e3@google.com>
To: willy@infradead.org, akpm@linux-foundation.org, david@redhat.com, 
 pbonzini@redhat.com, shuah@kernel.org, vbabka@suse.cz, 
 Shivank Garg <shivankg@amd.com>
X-Spam-Score: -4.9 (----)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Oct 15, 2025, Sean Christopherson wrote: > On Wed,
 27 Aug 2025 17:52:41 +0000, Shivank Garg wrote: > > This series introduces
 NUMA-aware memory placement support for KVM guests > > with guest_ [...] 
 Content analysis details:   (-4.9 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 2.7 RCVD_IN_PSBL           RBL: Received via a relay in PSBL
 [209.85.216.74 listed in psbl.surriel.com]
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.74 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1vAsBA-0006bx-TR
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

On Wed, Oct 15, 2025, Sean Christopherson wrote:
> On Wed, 27 Aug 2025 17:52:41 +0000, Shivank Garg wrote:
> > This series introduces NUMA-aware memory placement support for KVM guests
> > with guest_memfd memory backends. It builds upon Fuad Tabba's work (V17)
> > that enabled host-mapping for guest_memfd memory [1] and can be applied
> > directly applied on KVM tree [2] (branch kvm-next, base commit: a6ad5413,
> > Merge branch 'guest-memfd-mmap' into HEAD)
> > 
> > == Background ==
> > KVM's guest-memfd memory backend currently lacks support for NUMA policy
> > enforcement, causing guest memory allocations to be distributed across host
> > nodes  according to kernel's default behavior, irrespective of any policy
> > specified by the VMM. This limitation arises because conventional userspace
> > NUMA control mechanisms like mbind(2) don't work since the memory isn't
> > directly mapped to userspace when allocations occur.
> > Fuad's work [1] provides the necessary mmap capability, and this series
> > leverages it to enable mbind(2).
> > 
> > [...]
> 
> Applied the non-KVM change to kvm-x86 gmem.  We're still tweaking and iterating
> on the KVM changes, but I fully expect them to land in 6.19.
> 
> Holler if you object to taking these through the kvm tree.
> 
> [1/7] mm/filemap: Add NUMA mempolicy support to filemap_alloc_folio()
>       https://github.com/kvm-x86/linux/commit/601aa29f762f
> [2/7] mm/filemap: Extend __filemap_get_folio() to support NUMA memory policies
>       https://github.com/kvm-x86/linux/commit/2bb25703e5bd
> [3/7] mm/mempolicy: Export memory policy symbols
>       https://github.com/kvm-x86/linux/commit/e1b4cf7d6be3

FYI, I rebased these onto 6.18-rc2 to avoid a silly merge.  New hashes:

[1/3] mm/filemap: Add NUMA mempolicy support to filemap_alloc_folio()
      https://github.com/kvm-x86/linux/commit/7f3779a3ac3e
[2/3] mm/filemap: Extend __filemap_get_folio() to support NUMA memory policies
      https://github.com/kvm-x86/linux/commit/16a542e22339
[3/3] mm/mempolicy: Export memory policy symbols
      https://github.com/kvm-x86/linux/commit/f634f10809ec


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
