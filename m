Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C198CB0B62
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 09 Dec 2025 18:22:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NrnAK+0vX6qSpU6CaCtRZor+t6/AORyQ7JvM0t2YN2I=; b=RutgBMM4jCSFGXee3cUdpYYv71
	P0gS6xtmM8vlzC1aeQUpUeME2qb8i1DOvbi9TkKu88ZOhjSY3bvqTqcJFEvhXiaU31IJrjBCOuoBf
	duw3nWjGGfrhMLDttxPjSuLhaUBeoM5TXU/NtUEPmbJGlI5Lwumvi0LP7fiShlJIAjP4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vT1Pi-0003Te-Hl;
	Tue, 09 Dec 2025 17:22:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vT1PY-0003TP-FS
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Dec 2025 17:22:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2OfZnJKQD65zAnOpqdjAiOAqDFP91IDQbUjGaeDV9mA=; b=Qme4Bz1udH4JkKyA6ooM5Dvc7W
 9YYX/szVId/FI5VpZdCeXLcp2rh5JfPrV5xEhdSPvrQhRfJMI05+Xgo+6HHt24BFsnksqKFT0Jrwu
 +i+NZfCfrty2i5fmeUxeC7MCABuR0IjaKsce4Coy7UuoDgpSnNDGcUsFe5v+ZFAO79V4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2OfZnJKQD65zAnOpqdjAiOAqDFP91IDQbUjGaeDV9mA=; b=MIFH9Mpq34dxEVYpHQrjGgG039
 Wudn0gQSxvkHaqEyZX4XJ5YA72A5HgkFKcyvuAbXvZQkqARSvYOqEMnvy+k4DbzeDes7yckjag1gQ
 TEGL3fD71TDPPI8CKNSZlGypQnxxARo8E3k/BF1UWdZSbshYr0CP01Rqamiu6um9DHAs=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vT1PW-00010F-Fb for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Dec 2025 17:22:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C0853601AF;
 Tue,  9 Dec 2025 17:21:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73601C4CEFB;
 Tue,  9 Dec 2025 17:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765300911;
 bh=6JzHwVMsw3oVBaLB929QEwdcMxFilfqVMX3zcgp6eKA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Psg4CKLAi9h/A9vrvljHnRqp9p5yz8B5YCapKgSBCEr6kmloaOVwmNaYxp96nI0Jm
 E1pbyJ1ln1w7L+cwykG7ZYqv4qRzAcWJFrrDoVllnAKtP9kV9HNNc0yvVFDPPFwIkZ
 zlIrgsKzfz9N31t7zC7ENkzXvNMPaNLtaoUlwGSCq0lbSmlyoP3LMxcO1rKyc+86dE
 NNhWUd3A/NHLJln9jL7sW0vI/gKw88UtIG56vYvOYlGCOJt2PmPeBPQ+WVB8pAbtZB
 YUlzouJwNa/r7jfn9C9CtIGicL5PvCAPTPMpQEpILvgU65s/m796Uhb97EubDbNHcQ
 BLbAhrtl11WCQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 B591F3808200; Tue,  9 Dec 2025 17:18:47 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176530072652.4018985.15391772848132749035.git-patchwork-notify@kernel.org>
Date: Tue, 09 Dec 2025 17:18:46 +0000
References: <20250827175247.83322-2-shivankg@amd.com>
In-Reply-To: <20250827175247.83322-2-shivankg@amd.com>
To: Garg@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
 Shivank <shivankg@amd.com>
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Sean Christopherson <seanjc@google.com>: On Wed, 27 Aug 2025 17:52:41 +0000
 you wrote: > This series introduces NUMA-aware memory placement support for
 KVM guests > with guest_memfd memory backends. It builds upon Fuad Tabba's
 work (V17) > t [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [172.105.4.254 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vT1PW-00010F-Fb
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
From: patchwork-bot+f2fs--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: patchwork-bot+f2fs@kernel.org
Cc: gshan@redhat.com, mhocko@suse.com, jack@suse.cz, jgg@nvidia.com,
 kvm@vger.kernel.org, david@redhat.com, tabba@google.com, kalyazin@amazon.com,
 peterx@redhat.com, clm@fb.com, rppt@kernel.org, ddutile@redhat.com,
 linux-kselftest@vger.kernel.org, jaegeuk@kernel.org, papaluri@amd.com,
 ying.huang@linux.alibaba.com, shuah@kernel.org, matthew.brost@intel.com,
 zbestahu@gmail.com, lorenzo.stoakes@oracle.com, pvorel@suse.cz,
 ira.weiny@intel.com, dhavale@google.com, jmorris@namei.org,
 willy@infradead.org, hch@infradead.org, linux-bcachefs@vger.kernel.org,
 cgzones@googlemail.com, ziy@nvidia.com, rientjes@google.com,
 brauner@kernel.org, xiang@kernel.org, roypat@amazon.co.uk, chao.gao@intel.com,
 jgowans@amazon.com, thomas.lendacky@amd.com, ashish.kalra@amd.com,
 chao.p.peng@intel.com, yan.y.zhao@intel.com, byungchul@sk.com,
 michael.day@amd.com, Neeraj.Upadhyay@amd.com, michael.roth@amd.com,
 bfoster@redhat.com, bharata@amd.com, josef@toxicpanda.com,
 Liam.Howlett@oracle.com, ackerleytng@google.com, suzuki.poulose@arm.com,
 linux-coco@lists.linux.dev, dsterba@suse.com, shdhiman@amd.com,
 dan.j.williams@intel.com, gourry@gourry.net, surenb@google.com, vbabka@suse.cz,
 yuzhao@google.com, joshua.hahnjy@gmail.com, apopple@nvidia.com, nikunj@amd.com,
 vannapurve@google.com, quic_eberman@quicinc.com, paul@paul-moore.com,
 linux-mm@kvack.org, seanjc@google.com, kent.overstreet@linux.dev,
 rakie.kim@sk.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, pankaj.gupta@amd.com,
 linux-security-module@vger.kernel.org, lihongbo22@huawei.com,
 jefflexu@linux.alibaba.com, aik@amd.com, amit@infradead.org,
 linux-fsdevel@vger.kernel.org, pbonzini@redhat.com, akpm@linux-foundation.org,
 serge@hallyn.com, linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org,
 viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Sean Christopherson <seanjc@google.com>:

On Wed, 27 Aug 2025 17:52:41 +0000 you wrote:
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

Here is the summary with links:
  - [f2fs-dev,kvm-next,V11,1/7] mm/filemap: Add NUMA mempolicy support to filemap_alloc_folio()
    (no matching commit)
  - [f2fs-dev,kvm-next,V11,2/7] mm/filemap: Extend __filemap_get_folio() to support NUMA memory policies
    https://git.kernel.org/jaegeuk/f2fs/c/16a542e22339
  - [f2fs-dev,kvm-next,V11,3/7] mm/mempolicy: Export memory policy symbols
    https://git.kernel.org/jaegeuk/f2fs/c/f634f10809ec
  - [f2fs-dev,kvm-next,V11,4/7] KVM: guest_memfd: Use guest mem inodes instead of anonymous inodes
    (no matching commit)
  - [f2fs-dev,kvm-next,V11,5/7] KVM: guest_memfd: Add slab-allocated inode cache
    (no matching commit)
  - [f2fs-dev,kvm-next,V11,6/7] KVM: guest_memfd: Enforce NUMA mempolicy using shared policy
    (no matching commit)
  - [f2fs-dev,kvm-next,V11,7/7] KVM: guest_memfd: selftests: Add tests for mmap and NUMA policy support
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
