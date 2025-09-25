Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B22BB9FD12
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Sep 2025 16:07:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8JGGoJsu0xa5C13MQnd7+Kb2ZMJGBjeoOitP4sVi8d4=; b=lk03Y4nYRHHNNmYV8N0QZR98U0
	GGm/+jEhVBqQr2rEKBJBn15hDqe9AUII15iJbZmKlgDFAfwIgfN5ptquks8/BCZ2j+r6fYHLBh5F8
	pI9Oq0x815XvYJBlbwPmcRrkR7Sda3LFcy3phLwW/3GX6rG1BPoR0ew3JEUYjYB/F+LU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v1mcf-0007C8-3g;
	Thu, 25 Sep 2025 14:07:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3nUbVaAYKAMwAws51uy66y3w.u64@flex--seanjc.bounces.google.com>)
 id 1v1mcc-0007Bz-Q7 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Sep 2025 14:06:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dU4j5xINCBqy1Rj7i7G1Vfx3gRcoZTHMrIeb9JUSMNk=; b=RUtaJX+xHotXIC6CKJ3UUPywDK
 s/un99b5oCZowbTcV9FaJDEK3vjouDbJh6ADsG4ZtyUydykximTKUGjlVIuu4I5LujNlADD8WRnFh
 A/hDggRUPG4cC0uNg43PBRezF2Pb2gNxcq1gByfvtOkZ767Qfy+pMhwsNLlRSLBS6xQw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dU4j5xINCBqy1Rj7i7G1Vfx3gRcoZTHMrIeb9JUSMNk=; b=RlExFI3nmVTReL+J31FLFcV+BH
 HnxGH9XnSx4XH+WROx9qU3jrhSk5Glc601RthH8ktfBFrtOd9hQ9uiUODrUvmSMKX8zHOdKE44FyP
 SPza4/0cbHd+qp/+mAMqhQ0Xr6YKDxDndskFUkipfmSbr5cVGJcIM+kj/IsD56mEv9SA=;
Received: from mail-qk1-f201.google.com ([209.85.222.201])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v1mcc-0003fm-G5 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Sep 2025 14:06:58 +0000
Received: by mail-qk1-f201.google.com with SMTP id
 af79cd13be357-81312a26ea3so236631885a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 25 Sep 2025 07:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1758809212; x=1759414012;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=dU4j5xINCBqy1Rj7i7G1Vfx3gRcoZTHMrIeb9JUSMNk=;
 b=LT5Nr+Z6Oqg8/UXkA9yffhfUwv2tMliG1b/imET3iGPliFKD0Q2lEMIldwVjExio4K
 wB/KkWgFtgiARlXiCe3cFlLcJ78pJ0nVXFmpSjwhqGOHdOIoRfcGvhFJZsV7LQMh9NdO
 XA1pykr/+uCNvSJuJ5/NToKYH3JeBH2p0TxALHPOUyprPFjmJnT0UgrOpDirYuqQNKp2
 JlQb9GoWo/agnHMDnEpevJ8SfNROQA7VLxjQ0AshX/6xW5bh62qYmKqvyCgycgQWAgvD
 hSvvuicsTvIU2Mye4wwfb4CG9DY3BzOkkRpcyiFtmsvuxo8GLrC4v58UJ4ghExhdhPIY
 onHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758809212; x=1759414012;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dU4j5xINCBqy1Rj7i7G1Vfx3gRcoZTHMrIeb9JUSMNk=;
 b=Q9HxipVrIepmQTnN88JdroWTetAzoW1mZ5Z06TU+GfG4XlO8j8VyAYz/BpB3S1MwE8
 vPHxBJkzPN/fr01zwB1P6a01PqtT/mwQaE7BBjNEl6S3B4BHxYtGC7sO/vqWuoBV4hdW
 67iy9tfFSwz0jjlb5bd670xgGumS0EkSOjoY6OOS05Tf+0aF8L/co4+vMzHAh0lS5iHc
 PusEMz1eEFmmrnD3Pfuo9lWAoPhKiPeHqcBrE+69uR67a/1zbRiUZBthRPPfNr9pqWNT
 MEYq3E6h1PPFoc0udLssynn+yzc7OUhTFJolV3O8JpidYM1/NEcnYh1B7hu0GjDRqV0C
 ZoUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrz8sp51NX/iQjNI2CJ852bTVB8LaRHzv7xp24TCNtuMFBRKAen3rPPI5zve44AtXPODXASJ/wdEzFjYAbcENa@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx9HCg/kYSzUAp4dxISdSCYO1oLOrm7bcyuKOIWjtbY3I+KxYI+
 1jiXWgsH81SfPNSRPfy4pqKyZyZo1/siTVOmH0ang8FYNgkVxmAL4J2xSrke+hJXss4YU1m37Vf
 YGSf2jA==
X-Google-Smtp-Source: AGHT+IGEjcBsUTlo4/vVd9aOmfS85HeXK7VXkMsc2AM9X82gWAt19f8n9mk94PI8ByiZcVy2ayMJHM96hBY=
X-Received: from pjbjx4.prod.google.com ([2002:a17:90b:46c4:b0:330:88c4:627])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4c4a:b0:334:e020:2f16
 with SMTP id 98e67ed59e1d1-334e0202f83mr1618309a91.11.1758807709301; Thu, 25
 Sep 2025 06:41:49 -0700 (PDT)
Date: Thu, 25 Sep 2025 06:41:42 -0700
In-Reply-To: <b67dd7cd-2c1c-4566-badf-32082d8cd952@redhat.com>
Mime-Version: 1.0
References: <20250827175247.83322-2-shivankg@amd.com>
 <20250827175247.83322-7-shivankg@amd.com>
 <diqztt1sbd2v.fsf@google.com> <aNSt9QT8dmpDK1eE@google.com>
 <dc6eb85f-87b6-43a1-b1f7-4727c0b834cc@amd.com>
 <b67dd7cd-2c1c-4566-badf-32082d8cd952@redhat.com>
Message-ID: <aNVFrZDAkHmgNNci@google.com>
To: David Hildenbrand <david@redhat.com>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Sep 25, 2025, David Hildenbrand wrote: > On 25.09.25
 13:44, Garg, Shivank wrote: > > On 9/25/2025 8:20 AM, Sean Christopherson
 wrote: > > I did functional testing and it works fine. > > I can [...] 
 Content analysis details:   (-7.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.201 listed in wl.mailspike.net]
X-Headers-End: 1v1mcc-0003fm-G5
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
> On 25.09.25 13:44, Garg, Shivank wrote:
> > On 9/25/2025 8:20 AM, Sean Christopherson wrote:
> > I did functional testing and it works fine.
> 
> I can queue this instead. I guess I can reuse the patch description and add
> Sean as author + add his SOB (if he agrees).

Eh, Ackerley and Fuad did all the work.  If I had provided feedback earlier,
this would have been handled in a new version.  If they are ok with the changes,
I would prefer they remain co-authors.

Regarding timing, how much do people care about getting this into 6.18 in
particular?  AFAICT, this hasn't gotten any coverage in -next, which makes me a
little nervous.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
