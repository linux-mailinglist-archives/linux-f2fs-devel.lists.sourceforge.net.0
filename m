Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5F4BA029E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Sep 2025 17:14:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YIQnM4W1A27OmQDBIJebp94GeNyKWWvjQ+cU/h5Zdec=; b=WhesoiVgVVde6l3Rv/Qxim3IWq
	uWkcApjn8DAHZeLIzEM02coMmW0iSrZBzOX8bAOubBau1m/ElEp8Oz8z/w6LFHJ+cwVi+sFmlVs4o
	i2DfiyYiYuvI9sb4cIhOFcOALcZGi0UA/jPH6aQUc6+RLWXjiFZ6CnK/visLVSGva1LI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v1nfj-00066m-H1;
	Thu, 25 Sep 2025 15:14:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3hlrVaAYKAN0RD9MIBFNNFKD.BNL@flex--seanjc.bounces.google.com>)
 id 1v1nfY-00066Z-Ay for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Sep 2025 15:14:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jh5MSqTLsjrp4fvoa9f2K3rue2zEjmwO4t9rR+bj9fI=; b=VFgvJJD4OQezbT4VibsL6GOwKF
 O7/X1BC7yNTl+Fh150Z4g4mjERJS8N6n3TM/DQmXI7Xt4c+TPQRAR5m2Zy6/F2C+PehJ8gd4Z1D1k
 muppMMrQJVx/6A1Vvf1s2nhk6JmDjFNRIStRWMUtMrPuGD8N+2jKP1zaFekPKb+0FDtU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Jh5MSqTLsjrp4fvoa9f2K3rue2zEjmwO4t9rR+bj9fI=; b=Fb3VWS47FARjVE9VBtODJb6Nte
 EcRqDrZFTOKS4hCw18BCzT5OWzjaQ35rXWogrTTw/y9yP2HgTeXvjW+XwsICPBHgcn9SbjKqQGH3v
 8r7GEdnbvSKb1gF6/hMgISCKY2fOuO+hSsOygFeIm1WLrOfJ6VU9uNvHjP3qgbcj5jpE=;
Received: from mail-qt1-f202.google.com ([209.85.160.202])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v1nfX-00080a-U6 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Sep 2025 15:14:04 +0000
Received: by mail-qt1-f202.google.com with SMTP id
 d75a77b69052e-4b47b4d296eso24376941cf.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 25 Sep 2025 08:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1758813233; x=1759418033;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Jh5MSqTLsjrp4fvoa9f2K3rue2zEjmwO4t9rR+bj9fI=;
 b=Tl2szCELNO/GVrjVuIg5pPnrBgTIJti6guJqEbAEEo/ZaFyTp9X+qpp2uD8548BaH8
 BFYjvI6LkPOLtW7RFtRPVqsGPHgLx1SsAC0Oq9R3TDMAFbhJBV5++ZLXoapiKmZx8hsk
 odfpGWwbcqKeAcV7S7HdAyROPc0kyo/0EU4Ild98Kl8S9ONhUw7qfTetq6JToghSaCdm
 DAwbxqceqAS3n+emytQi68tUYgn+Cq453C50OWbqqHl4uPS9bp9CJua4JGJx4zRdWRuU
 afKlu8rpY3t4O7cheAAXqqjmI9fnRcmRa+TH7aDTj+34jyM0ljjFzJfWNxU7xjpASB04
 do9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758813233; x=1759418033;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jh5MSqTLsjrp4fvoa9f2K3rue2zEjmwO4t9rR+bj9fI=;
 b=ahEq8n+1CPBc5HgFPWokB0jJ+0umdf22rMaxZs4byoe5wTofn1G9CeHMXjufx0PNRM
 Uj4SK/W5b6OYKF8CFWqFw39HUDqm22q8dIKjyCOVD3J3KF/crm0ZwWJ4nGmzW3+DsFzp
 4KeQ9hEwv5A7oEZXz617q/jVoPp7fBR1oHZ+19LowqMIHyHDlD5DUrOTH32kbwh4T0bz
 zEh9qiFhsKNFlaMODyb6DWMjiiiK9KNyaV44o05xB0SWWr1a785Y9XhPYPa2Mhi+KK0l
 nD4Z1XOtRK7tno4/Peh2o6YDdyHhk4OUVOOF/axRLL7J5X8W+7t15RAq7gam2YMSHBKJ
 V6Fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhuQwxDGDg7qQwN4TNsH6YEr1+E8lkxeh59QWyoANRO0VDrcLVBL9FKmyzthh0sxIBipgT41ia/VJ2iCIGbnrw@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzkDFHY/yp40nzJQefOaZH1brwb5pb/jhE6lpsFBk8OtnsMtpZe
 d6xEVRKzQ/NQGbzWaqov8NczxYe8Wm6BpBTw/9X/GB274sLmLqlrlBZMxKKRRiQBBy7Q/3YQ437
 B+ue06w==
X-Google-Smtp-Source: AGHT+IEVcWsyGM1w0GH1nNrshkk20Pnc8ghwxFB8MAUOFgcR14npidYwrEDITe3+YHWa4Mb/5XspEYhl1Ac=
X-Received: from pga11.prod.google.com ([2002:a05:6a02:4f8b:b0:b4c:213a:e7aa])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:3282:b0:262:1611:6528
 with SMTP id adf61e73a8af0-2e7cdda0840mr4939471637.29.1758812806367; Thu, 25
 Sep 2025 08:06:46 -0700 (PDT)
Date: Thu, 25 Sep 2025 08:06:44 -0700
In-Reply-To: <3a82a197-495f-40c3-ae1b-500453e3d1ec@redhat.com>
Mime-Version: 1.0
References: <20250827175247.83322-2-shivankg@amd.com>
 <20250827175247.83322-7-shivankg@amd.com>
 <diqztt1sbd2v.fsf@google.com> <aNSt9QT8dmpDK1eE@google.com>
 <dc6eb85f-87b6-43a1-b1f7-4727c0b834cc@amd.com>
 <b67dd7cd-2c1c-4566-badf-32082d8cd952@redhat.com>
 <aNVFrZDAkHmgNNci@google.com>
 <3a82a197-495f-40c3-ae1b-500453e3d1ec@redhat.com>
Message-ID: <aNVahJkpJVVTVEkK@google.com>
To: David Hildenbrand <david@redhat.com>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Sep 25, 2025, David Hildenbrand wrote: > On 25.09.25
 15:41, Sean Christopherson wrote: > > Regarding timing, how much do people
 care about getting this into 6.18 in > > particular? > > I think [...] 
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
 [209.85.160.202 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1v1nfX-00080a-U6
Subject: Re: [f2fs-dev] [PATCH kvm-next V11 4/7] KVM: guest_memfd: Use guest
 mem inodes instead of anonymous inodes
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
 gshan@redhat.com, ying.huang@linux.alibaba.com, shuah@kernel.org,
 roypat@amazon.co.uk, matthew.brost@intel.com, linux-coco@lists.linux.dev,
 zbestahu@gmail.com, lorenzo.stoakes@oracle.com, linux-bcachefs@vger.kernel.org,
 ira.weiny@intel.com, apopple@nvidia.com, jmorris@namei.org,
 willy@infradead.org, hch@infradead.org, chao.gao@intel.com, tabba@google.com,
 ziy@nvidia.com, rientjes@google.com, yuzhao@google.com, xiang@kernel.org,
 nikunj@amd.com, gourry@gourry.net, serge@hallyn.com,
 Shivank Garg <shivankg@amd.com>, thomas.lendacky@amd.com, ashish.kalra@amd.com,
 chao.p.peng@intel.com, yan.y.zhao@intel.com, byungchul@sk.com,
 michael.day@amd.com, Neeraj.Upadhyay@amd.com, michael.roth@amd.com,
 bfoster@redhat.com, bharata@amd.com, josef@toxicpanda.com,
 Liam.Howlett@oracle.com, Ackerley Tng <ackerleytng@google.com>,
 dsterba@suse.com, viro@zeniv.linux.org.uk, jefflexu@linux.alibaba.com,
 jaegeuk@kernel.org, dan.j.williams@intel.com, surenb@google.com,
 vbabka@suse.cz, paul@paul-moore.com, joshua.hahnjy@gmail.com,
 brauner@kernel.org, quic_eberman@quicinc.com, rakie.kim@sk.com,
 cgzones@googlemail.com, pvorel@suse.cz, linux-erofs@lists.ozlabs.org,
 kent.overstreet@linux.dev, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, pankaj.gupta@amd.com,
 linux-security-module@vger.kernel.org, lihongbo22@huawei.com,
 amit@infradead.org, linux-fsdevel@vger.kernel.org, pbonzini@redhat.com,
 akpm@linux-foundation.org, vannapurve@google.com, suzuki.poulose@arm.com,
 rppt@kernel.org, jgg@nvidia.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Sep 25, 2025, David Hildenbrand wrote:
> On 25.09.25 15:41, Sean Christopherson wrote:
> > Regarding timing, how much do people care about getting this into 6.18 in
> > particular?
> 
> I think it will be beneficial if we start getting stuff upstream. But
> waiting a bit longer probably doesn't hurt.
> 
> > AFAICT, this hasn't gotten any coverage in -next, which makes me a
> > little nervous.
> 
> Right.
> 
> If we agree, then Shivank can just respin a new version after the merge
> window.

Actually, if Shivank is ok with it, I'd be happy to post the next version(s).
I'll be focusing on the in-place conversion support for the next 1-2 weeks, and
have some (half-baked) refactoring changes to better leverage the inode support
from this series.

I can also plop the first three patches (the non-KVM changes) in a topic branch
straightaway, but not feed it into -next until the merge window closes.  The 0-day
bots scrapes kvm-x86, so that'd get us some early build-bot exposure, and we can
stop bugging the non-KVM folks.  Then when the dust settles on the KVM changes,
I can throw them into the same topic branch.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
