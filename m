Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 701B6BA1EA4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Sep 2025 01:04:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fz26CacGQYjWZ90gdgLUjydsPqb+ayUPNabDO8/Vzo4=; b=LlkUM6CkK4NlECxuG5O6ludV+3
	I/PhPLDgoIJ+c4LoIMFWZ30hM9N/OmkP3iE2Epmiqnu7g2UhHP9u0nn8Y0ucWKfhQ+31HIew8rbqF
	OjN7jJwdWl/4w7sl73Y5sRSTdNj8Z9yHm1oFeHzvHezIytRNKOMWMQpEqwXU61WQCxfs=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v1v0C-0002zS-PB;
	Thu, 25 Sep 2025 23:03:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3T8rVaAYKAIg4qmzvos00sxq.o0y@flex--seanjc.bounces.google.com>)
 id 1v1v09-0002zK-Vq for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Sep 2025 23:03:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XtCsq70qhQXvjo5i7WnTkFuUeYKslZCOA6r0Ck9tpm8=; b=LFEXTnrNhe2XjEM44/eaHvUoBh
 AXV4YhtKKA45KGOv8LICeNqLBfzM3Q0z6Eq2F43MDuut4VOKRGEYPorh8TRAJSCtyl1HHRqP2b7WE
 bcSYpA2qZ8IQa2txxbSkZea43cGnAXUDt1FKhOQCpm+zHERtv1MI7eAVoWHkAizI3AaY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XtCsq70qhQXvjo5i7WnTkFuUeYKslZCOA6r0Ck9tpm8=; b=moe5WHZeauqHX064n+IrRgQADC
 9UyMMxR/sDhTYn5SGANK5OFQ6H/9juqH03EGBoDoXBsNyrBjOq3pJuJNtMczQTrD2p+E4H7MJnQPL
 n0cdZ3hRfvT7vuf984G0vTvSjSEKdHFm09fGIbs+nOJWqxZzKho8O4WpgVjwp2GiIARM=;
Received: from mail-pj1-f73.google.com ([209.85.216.73])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v1v09-0006DK-AC for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Sep 2025 23:03:49 +0000
Received: by mail-pj1-f73.google.com with SMTP id
 98e67ed59e1d1-32e09eaf85dso1940993a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 25 Sep 2025 16:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1758841424; x=1759446224;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=XtCsq70qhQXvjo5i7WnTkFuUeYKslZCOA6r0Ck9tpm8=;
 b=thQNfqBhJRKgbY+CbBCPmao0crqU2JBpT5y0l/JfSH/JR66BTXxJqbiip9ikxC64gD
 d6KOX0IM0OOeqEW2K+BBjyFJY4uXWJYrI2esv2Smnv1J0gNf7Wv7LhOFUG5mGLoyp4rW
 Kpfi6WsVeLO2eN8i1Zp2vhQDCMyhrNqZ4YNltC3ppaLeNpfW9grOgjevNua0Lh/JrxEi
 RxSPg2VvwC33TScdGJvyTHB8TEzRhE8ZNttg9BgNFYq9yV1WMmYDmJ6MHGI0zUEwXtnm
 CiKI8WpY7J/w6vsFbCs4C2+nRF/SUyddSmxERYnmUzjC8fBgC3lVrtDMtMlRTuMmwb8W
 RN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758841424; x=1759446224;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XtCsq70qhQXvjo5i7WnTkFuUeYKslZCOA6r0Ck9tpm8=;
 b=enLQhOkM45EgYn3MsJuupZddnVICTfdQwWE2OGmVqELyPg5L55gNeyZo3CkxwRBQXW
 t7Pq2kRsVlrfecJeCj3iL5mTIs4Ghp/Yoa8yvXcvIRWi+1PKnSkVO7rW8YGHPx12FhVM
 yPpcSINY/M2YcF4qPUmDYTXyZPrV2fL6q/906YBlVEaSgZ0satWN44IWRhxEASHj49ip
 DJxjK7XxBRaa+YpnqEjKL/wAugBCEFQ5ZPEK7vOB8rU2eCK8khAQHSG9AVskKD58WPMM
 FbjIpwIjUQ90A725dRA8oyn0igJ8JQ9FzLS49wHdu1f1l0gXJDkpr5uRUxWHnBv5P13Z
 2Clg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxTYSK22W4Iah9R6wwG8PwyYtv60rtWqSO20i5W5rb5AOzZtGIK1kRChC54BkWBQmCP/IYUk1Ko7jXFu3L+CKL@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx4OpMTN+inmh1V8pUmrhXyFxazhRJSXVFUqfy7Pnnl5y2FwLny
 B5LEx8hCSvIXB3wDp/uzdSfIxR6I8F9w5aIc253Zaoff0+DaUq1brdp4HhKxRB5W4ZT+DYBOEV6
 NpAStHQ==
X-Google-Smtp-Source: AGHT+IFCIuxfWzAAq0mG13fuYXVsG7N7KK6Fo0/VQdrpMqaeQ2l1EixZPHW4Wo1ErVxR9DWPn0iSBzBRvc0=
X-Received: from pjbqo8.prod.google.com ([2002:a17:90b:3dc8:b0:330:6d2f:1b62])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3b4f:b0:330:852e:2bcc
 with SMTP id 98e67ed59e1d1-3342a2ca0e6mr5749959a91.21.1758841423443; Thu, 25
 Sep 2025 16:03:43 -0700 (PDT)
Date: Thu, 25 Sep 2025 16:03:41 -0700
In-Reply-To: <aNW1l-Wdk6wrigM8@google.com>
Mime-Version: 1.0
References: <20250827175247.83322-2-shivankg@amd.com>
 <20250827175247.83322-10-shivankg@amd.com>
 <aNW1l-Wdk6wrigM8@google.com>
Message-ID: <aNXKTUnxHQyds4sh@google.com>
To: Shivank Garg <shivankg@amd.com>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Sep 25, 2025, Sean Christopherson wrote: > On Wed,
 Aug 27, 2025, Shivank Garg wrote: > > Add tests for NUMA memory policy binding
 and NUMA aware allocation in > > guest_memfd. This extends the [...] 
 Content analysis details:   (-7.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.73 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1v1v09-0006DK-AC
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

On Thu, Sep 25, 2025, Sean Christopherson wrote:
> On Wed, Aug 27, 2025, Shivank Garg wrote:
> > Add tests for NUMA memory policy binding and NUMA aware allocation in
> > guest_memfd. This extends the existing selftests by adding proper
> > validation for:
> > - KVM GMEM set_policy and get_policy() vm_ops functionality using
> >   mbind() and get_mempolicy()
> > - NUMA policy application before and after memory allocation
> > 
> > These tests help ensure NUMA support for guest_memfd works correctly.
> > 
> > Signed-off-by: Shivank Garg <shivankg@amd.com>
> > ---
> >  tools/testing/selftests/kvm/Makefile.kvm      |   1 +
> >  .../testing/selftests/kvm/guest_memfd_test.c  | 121 ++++++++++++++++++
> >  2 files changed, 122 insertions(+)
> > 
> > diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
> > index 90f03f00cb04..c46cef2a7cd7 100644
> > --- a/tools/testing/selftests/kvm/Makefile.kvm
> > +++ b/tools/testing/selftests/kvm/Makefile.kvm
> > @@ -275,6 +275,7 @@ pgste-option = $(call try-run, echo 'int main(void) { return 0; }' | \
> >  	$(CC) -Werror -Wl$(comma)--s390-pgste -x c - -o "$$TMP",-Wl$(comma)--s390-pgste)
> >  
> >  LDLIBS += -ldl
> > +LDLIBS += -lnuma
> 
> Hrm, this is going to be very annoying.  I don't have libnuma-dev installed on
> any of my <too many> systems, and I doubt I'm alone.  Installing the package is
> trivial, but I'm a little wary of foisting that requirement on all KVM developers
> and build bots.
> 
> I'd be especially curious what ARM and RISC-V think, as NUMA is likely a bit less
> prevelant there.

Ugh, and it doesn't play nice with static linking.  I haven't tried running on a
NUMA system yet, so maybe it's benign?

/usr/bin/ld: /usr/lib/gcc/x86_64-linux-gnu/14/../../../x86_64-linux-gnu/libnuma.a(affinity.o): in function `affinity_ip':
(.text+0x629): warning: Using 'getaddrinfo' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
