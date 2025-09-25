Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B858BA191B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Sep 2025 23:35:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gMR1O7Nt9T0zNb2fE+p3kK3+/UhJ543ymBjHwsMErn4=; b=mP0pmvop1OAf9oNUibVqfqnYrM
	7H0evPKNyNAGBll5Nk4ZQo64vyQG2QXQ4s9U4T7CqRXVTet/COA/yQlg5gFwPrP7IEXD9lA66/c3B
	m3AHPUFZflRB1SZDjg1ewRCPsV9MzeIW2HCjC1XcA2XXIFTCynH5Ql27ofVbNc+P4Va4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v1tck-0000m5-E1;
	Thu, 25 Sep 2025 21:35:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3mbXVaAYKAKgaMIVRKOWWOTM.KWU@flex--seanjc.bounces.google.com>)
 id 1v1tci-0000ls-Tr for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Sep 2025 21:35:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dyD0NvHQvKcjtkMWqtARFSwsGpym7n4r8JiRe/0tuUQ=; b=ltY3eIuSRUxNcLRCkcYJBjB1l5
 l26JIgD2kuyCrs3wxJTFI1wV6JmP/+gKjmJSJHUcby7XTvHOIDbVzGlY5VboRi3z3OqvkQxpQD6nE
 2JCkenJUINxCJS8qK8MAzMsJnn8OxQtOAZiMUaJEW6dqPAR63u9ubuJ43+ECaFWZoirU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dyD0NvHQvKcjtkMWqtARFSwsGpym7n4r8JiRe/0tuUQ=; b=B7Q+3aJubo8EoDrPmHrVnL6a6C
 9LXTkxyazHZawlXPMEiGrfXZ/hFI1ZVtyoGNC/+lQ8hV9PNSnxHxap7jcKcCMgd/3gbk9bxx82lcc
 HhrX137IDfifeDFPif8QM+Rj4PVcA9KLli/6DNyPqx/+kvSwfhwY7Bw5L+aAcwG/gd7c=;
Received: from mail-pj1-f73.google.com ([209.85.216.73])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v1tci-0002A9-9v for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Sep 2025 21:35:32 +0000
Received: by mail-pj1-f73.google.com with SMTP id
 98e67ed59e1d1-332560b7171so2013185a91.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 25 Sep 2025 14:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1758836121; x=1759440921;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=dyD0NvHQvKcjtkMWqtARFSwsGpym7n4r8JiRe/0tuUQ=;
 b=ryWYJ50f+BW7tkyIjOwDK/Ym9zKUEqnAeYowv/mH1+DFEU/my5zCrK9k3rjsBWXxhk
 q+jNx5wvbpyA5CbIbX8/DJhiCnOLKR2AoMe4hw43vpWbM/PzcQw/15gHBlO+OvhMrHV0
 LXG+Rqk6cl3ckXtNz8h2VGJo0vPOEtiRzqvZaI4x7IBZp7OHyxy+p9FaT/hwCkjUGoIi
 u29X1Wk7aQ5rtWIHHWSbHkvKDsF82PFm6wAgE+3T7Q7m9Jj/laGDaCMrHlw0SNKnj+Dw
 r8IrpbsmD+pPPuE/4JDotk55E+UKbDSUE7TbIrsE2TWigxwjOvsoUgTTjwou4MSix+I7
 9Pwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758836121; x=1759440921;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dyD0NvHQvKcjtkMWqtARFSwsGpym7n4r8JiRe/0tuUQ=;
 b=ALv5C6v7RVYpYJLwdkDQW8dxUGlmVkrWaheD2Hwl/hwJNWN9NqTMVhDUPXYjahg//U
 k/FoHSbaKsH6sfZSj1eO8KMne8O647CX/h0KdSIiLXL2GBAiYythV+DUmw+jjujJygT8
 S6rtpk9hTpv/ibA8DOOTw2AY6+Risf1qTnVL0j/MN/mJxWiJICvMJMWqKcE128O/k4u9
 pkOtj7LLYC6/37sLZ+VfSulJ63d7i1TefrmMpfPfvWijl64IOXBx+fMJGWtp52qwVLFK
 ToK0uRxn2YMVF5qQGgy9dn9o2aZgfSiOMxzqPHeP65VbsjiW9/C1RM2YEaRnikfw//FJ
 ZNVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNk1an1IBJlUCcezBazW1f1r9APa+fJEpt6p41NxXPvWPkza11G3ZMIW1Dore9/yl28G8uzYkp+sI6IU1QS4N9@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz7FvpAETx2PxRvOt8QUb8vA2eNhdENNxRXD3TAzY95zHhkMXa3
 lEd5cSj2Z2U5yJW5bZjaq54L8teAJ5/ncM2QPdY13EY3DCDfNy3lCfEtWHYazE1FC9mqfsMUN9K
 oSlmOxQ==
X-Google-Smtp-Source: AGHT+IEF46Ap3+CoFy4DNwHeeqPSdM0QIu1/iWB0NVseFrH0JqhT9O+vdtR7XjCf1sCWIaN5eWCQMso96V4=
X-Received: from pjj5.prod.google.com ([2002:a17:90b:5545:b0:330:6cf5:5f38])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1c07:b0:32e:ca60:6bd7
 with SMTP id 98e67ed59e1d1-334568960d8mr4094341a91.11.1758836121051; Thu, 25
 Sep 2025 14:35:21 -0700 (PDT)
Date: Thu, 25 Sep 2025 14:35:19 -0700
In-Reply-To: <20250827175247.83322-10-shivankg@amd.com>
Mime-Version: 1.0
References: <20250827175247.83322-2-shivankg@amd.com>
 <20250827175247.83322-10-shivankg@amd.com>
Message-ID: <aNW1l-Wdk6wrigM8@google.com>
To: Shivank Garg <shivankg@amd.com>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Aug 27, 2025, Shivank Garg wrote: > Add tests for
 NUMA memory policy binding and NUMA aware allocation in > guest_memfd. This
 extends the existing selftests by adding proper > validation for: [...] 
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
 [209.85.216.73 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1v1tci-0002A9-9v
Subject: Re: [f2fs-dev] [PATCH kvm-next V11 7/7] KVM: guest_memfd:
 selftests: Add tests for mmap and NUMA policy support
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
> Add tests for NUMA memory policy binding and NUMA aware allocation in
> guest_memfd. This extends the existing selftests by adding proper
> validation for:
> - KVM GMEM set_policy and get_policy() vm_ops functionality using
>   mbind() and get_mempolicy()
> - NUMA policy application before and after memory allocation
> 
> These tests help ensure NUMA support for guest_memfd works correctly.
> 
> Signed-off-by: Shivank Garg <shivankg@amd.com>
> ---
>  tools/testing/selftests/kvm/Makefile.kvm      |   1 +
>  .../testing/selftests/kvm/guest_memfd_test.c  | 121 ++++++++++++++++++
>  2 files changed, 122 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
> index 90f03f00cb04..c46cef2a7cd7 100644
> --- a/tools/testing/selftests/kvm/Makefile.kvm
> +++ b/tools/testing/selftests/kvm/Makefile.kvm
> @@ -275,6 +275,7 @@ pgste-option = $(call try-run, echo 'int main(void) { return 0; }' | \
>  	$(CC) -Werror -Wl$(comma)--s390-pgste -x c - -o "$$TMP",-Wl$(comma)--s390-pgste)
>  
>  LDLIBS += -ldl
> +LDLIBS += -lnuma

Hrm, this is going to be very annoying.  I don't have libnuma-dev installed on
any of my <too many> systems, and I doubt I'm alone.  Installing the package is
trivial, but I'm a little wary of foisting that requirement on all KVM developers
and build bots.

I'd be especially curious what ARM and RISC-V think, as NUMA is likely a bit less
prevelant there.

>  LDFLAGS += -pthread $(no-pie-option) $(pgste-option)
>  
>  LIBKVM_C := $(filter %.c,$(LIBKVM))
> diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
> index b3ca6737f304..9640d04ec293 100644
> --- a/tools/testing/selftests/kvm/guest_memfd_test.c
> +++ b/tools/testing/selftests/kvm/guest_memfd_test.c
> @@ -7,6 +7,8 @@
>  #include <stdlib.h>
>  #include <string.h>
>  #include <unistd.h>
> +#include <numa.h>
> +#include <numaif.h>
>  #include <errno.h>
>  #include <stdio.h>
>  #include <fcntl.h>
> @@ -19,6 +21,7 @@
>  #include <sys/mman.h>
>  #include <sys/types.h>
>  #include <sys/stat.h>
> +#include <sys/syscall.h>
>  
>  #include "kvm_util.h"
>  #include "test_util.h"
> @@ -72,6 +75,122 @@ static void test_mmap_supported(int fd, size_t page_size, size_t total_size)
>  	TEST_ASSERT(!ret, "munmap() should succeed.");
>  }
>  
> +#define TEST_REQUIRE_NUMA_MULTIPLE_NODES()	\
> +	TEST_REQUIRE(numa_available() != -1 && numa_max_node() >= 1)

Using TEST_REQUIRE() here will result in skipping the _entire_ test.  Ideally
this test would use fixtures so that each testcase can run in a child process
and thus can use TEST_REQUIRE(), but that's a conversion for another day.

Easiest thing would probably be to turn this into a common helper and then bail
early.

diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
index 9640d04ec293..6acb186e5300 100644
--- a/tools/testing/selftests/kvm/guest_memfd_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_test.c
@@ -7,7 +7,6 @@
 #include <stdlib.h>
 #include <string.h>
 #include <unistd.h>
-#include <numa.h>
 #include <numaif.h>
 #include <errno.h>
 #include <stdio.h>
@@ -75,9 +74,6 @@ static void test_mmap_supported(int fd, size_t page_size, size_t total_size)
        TEST_ASSERT(!ret, "munmap() should succeed.");
 }
 
-#define TEST_REQUIRE_NUMA_MULTIPLE_NODES()     \
-       TEST_REQUIRE(numa_available() != -1 && numa_max_node() >= 1)
-
 static void test_mbind(int fd, size_t page_size, size_t total_size)
 {
        unsigned long nodemask = 1; /* nid: 0 */
@@ -87,7 +83,8 @@ static void test_mbind(int fd, size_t page_size, size_t total_size)
        char *mem;
        int ret;
 
-       TEST_REQUIRE_NUMA_MULTIPLE_NODES();
+       if (!is_multi_numa_node_system())
+               return;
 
        mem = mmap(NULL, total_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
        TEST_ASSERT(mem != MAP_FAILED, "mmap for mbind test should succeed");
@@ -136,7 +133,8 @@ static void test_numa_allocation(int fd, size_t page_size, size_t total_size)
        char *mem;
        int ret, i;
 
-       TEST_REQUIRE_NUMA_MULTIPLE_NODES();
+       if (!is_multi_numa_node_system())
+               return;
 
        /* Clean slate: deallocate all file space, if any */
        ret = fallocate(fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE, 0, total_size);
diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 23a506d7eca3..d7051607e6bf 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -21,6 +21,7 @@
 #include <sys/eventfd.h>
 #include <sys/ioctl.h>
 
+#include <numa.h>
 #include <pthread.h>
 
 #include "kvm_util_arch.h"
@@ -633,6 +634,11 @@ static inline bool is_smt_on(void)
        return false;
 }
 
+static inline bool is_multi_numa_node_system(void)
+{
+       return numa_available() != -1 && numa_max_node() >= 1;
+}
+
 void vm_create_irqchip(struct kvm_vm *vm);
 
 static inline int __vm_create_guest_memfd(struct kvm_vm *vm, uint64_t size,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
