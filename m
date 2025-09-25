Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A72E5BA1F16
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Sep 2025 01:13:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ATEErQrUf7lDaZbUOta0wvnNl4HifeBI1/0t8FUq7dc=; b=FMSjZrm19X25EXh9lDCtaYam9l
	k8nXepTN37Y5H1XRxsy3VSVdIBYuLwZtAXl+f+iwGhF6bhTwTl6ms4Va7HaAlW5oJjpcMOWZ0VdkN
	yp/i83LxedzC8Hb6lLM8ankWAl8E81V0ftlyqHIISQV8UDC3WE2n2ifQfskUms7q2j68=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v1v9F-0002uq-HX;
	Thu, 25 Sep 2025 23:13:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3d8zVaAYKALQmYUhdWaiiafY.Wig@flex--seanjc.bounces.google.com>)
 id 1v1v98-0002uf-Mq for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Sep 2025 23:13:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XGCCSnKnyPGGdnUTp10aKL37FULfLm3dyeD1VoFdI2I=; b=mffa6EtNChE3QH7YlO2uCw/ASQ
 2PkrFZVQ68Xt6A75NMWpLnCcsUiI1g1JhQDagnDfUudMl11aUBOmQT3C4Uu3wKI8QAiJCiggyCEsH
 GYUu8sPoYD51QkrB/WJXe2c2Nz0NMIT6NyYsa0BQqy54H8srJmuDlD3XJuYx8Yt4F87s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XGCCSnKnyPGGdnUTp10aKL37FULfLm3dyeD1VoFdI2I=; b=ErDqBPahK+5FAwLhZL2yuyXesU
 m5QOCDUk+BAdYXsGd6JyziYOZKuAfB2YUU9vmN6iEhoUd12WCPvuoowjhPo0HJweGy6gPtQXGlhMe
 DZy52Tx35kEA6Fc4gYedlU68zJQ1H8ZvOotvn6x78hSJ6J2M9E1vHous3NF9U9rgTYOs=;
Received: from mail-pg1-f202.google.com ([209.85.215.202])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v1v98-0006ae-CR for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Sep 2025 23:13:06 +0000
Received: by mail-pg1-f202.google.com with SMTP id
 41be03b00d2f7-b4f8e079bc1so964242a12.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 25 Sep 2025 16:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1758841976; x=1759446776;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=XGCCSnKnyPGGdnUTp10aKL37FULfLm3dyeD1VoFdI2I=;
 b=SCT6sjTPKTWkbQUqh3jMXLRfBivLPrYtb/gobf2GBWWjOCK4ur9QnzrR6qNtqdRmXq
 GtxpfDsHEkysIOclqB8/qc+cPx06GINMqD9q62EagrW4RQAKCo3pYPGl9fnxT47RU4ye
 JpUU68WtHa7xLw/iHHTyR9mRBk22Ph9Cy9opsKuABWLMiwpzqOqNKnj3eIfIdi0ME4on
 y7nSeD6XSeorfKFZl5W/onRcDIQLUTRe+0lpHTw84HWG/3+TYuKxXndZ2AuWgqjpAaI2
 O18Dk1n8sviFKKBp0m+JAa4uU6BGsiRAPfVd7AmgyJ75qLTvqEwFFtk8ldZmvv7wZhmu
 SlZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758841976; x=1759446776;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XGCCSnKnyPGGdnUTp10aKL37FULfLm3dyeD1VoFdI2I=;
 b=TM+nwVi0xL5o6Mw+cLUn2YtLl1W9Ha+mCfGFHb5T8Sni2Osko/dmR5qd0JI/RGJv6c
 tyR93ZH5WVN6BGwwLwGKvYV4f8nD3RtcdviSIXXmD+DJoGH1EhRuoLtx/5X1poGU11LT
 0xZxM9nkDBXWsyS62Emzo/f/cz5u7efeYBJY3dqb/nJ78PrHXqeRCbt0nr5Z0g0STQmx
 KILhx8W2rAzyVFaxnSWxyCPeJj0m1r2jT5HbjWw6HCfsYYuRSkx3gG79AruRZCCngqRh
 1wj9bL1PEff5vH87/LU9nnNUOIfHQKMO8XDwal1AdECV3do9qCRJNJJX/qcA5xM9OKk7
 Mckw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXV6WbuX2hiUD8Us3s7tZtk/oZr1HbYLYYKCyjHCIKXNJjhKtH/klVFILyolZclzFA57Isgj+GLleUkhfMhRMjl@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwkIkHLFUrNw3bD+Oz/S4UHpeuNN89hw5Bc7bvm7KBwVyXAifIp
 cYqq49tAWgJRyEY70+Ofb1xkAQgV4ZlE7Dp3JfR6Po2h1zundHITzXlnXhJ9v4GjnLMf7fMHW+E
 DhwWhKA==
X-Google-Smtp-Source: AGHT+IFE8gFtFdnHNmX2p6THQrFO41fYST4gwotcfBj6rGswgxHnE9CG8NuKci3w5GnRskLMvJFI/+Q8X0o=
X-Received: from pjbjz6.prod.google.com ([2002:a17:90b:14c6:b0:330:9af8:3e1d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e883:b0:262:79a:93fb
 with SMTP id d9443c01a7336-27ed4a7ecbdmr51468535ad.32.1758841975402; Thu, 25
 Sep 2025 16:12:55 -0700 (PDT)
Date: Thu, 25 Sep 2025 16:12:53 -0700
In-Reply-To: <20250925230420.GC2617119@nvidia.com>
Mime-Version: 1.0
References: <20250827175247.83322-2-shivankg@amd.com>
 <20250827175247.83322-10-shivankg@amd.com>
 <aNW1l-Wdk6wrigM8@google.com> <20250925230420.GC2617119@nvidia.com>
Message-ID: <aNXMdSZkqDtsGRLm@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Sep 25, 2025, Jason Gunthorpe wrote: > On Thu, Sep
 25, 2025 at 02:35:19PM -0700, Sean Christopherson wrote: > > > LDLIBS +=
 -ldl > > > +LDLIBS += -lnuma > > > > Hrm, this is going to be very a [...]
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
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.202 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1v1v98-0006ae-CR
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
 roypat@amazon.co.uk, matthew.brost@intel.com, zbestahu@gmail.com,
 lorenzo.stoakes@oracle.com, linux-bcachefs@vger.kernel.org,
 ira.weiny@intel.com, dhavale@google.com, jmorris@namei.org,
 willy@infradead.org, hch@infradead.org, chao.gao@intel.com, tabba@google.com,
 ziy@nvidia.com, rientjes@google.com, yuzhao@google.com, xiang@kernel.org,
 nikunj@amd.com, gourry@gourry.net, serge@hallyn.com,
 Shivank Garg <shivankg@amd.com>, thomas.lendacky@amd.com, ashish.kalra@amd.com,
 chao.p.peng@intel.com, yan.y.zhao@intel.com, byungchul@sk.com,
 michael.day@amd.com, Neeraj.Upadhyay@amd.com, michael.roth@amd.com,
 bfoster@redhat.com, bharata@amd.com, josef@toxicpanda.com,
 Liam.Howlett@oracle.com, ackerleytng@google.com, dsterba@suse.com,
 viro@zeniv.linux.org.uk, jefflexu@linux.alibaba.com, jaegeuk@kernel.org,
 dan.j.williams@intel.com, surenb@google.com, vbabka@suse.cz,
 paul@paul-moore.com, joshua.hahnjy@gmail.com, apopple@nvidia.com,
 brauner@kernel.org, quic_eberman@quicinc.com, rakie.kim@sk.com,
 cgzones@googlemail.com, pvorel@suse.cz, linux-erofs@lists.ozlabs.org,
 kent.overstreet@linux.dev, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, pankaj.gupta@amd.com,
 linux-security-module@vger.kernel.org, lihongbo22@huawei.com,
 amit@infradead.org, linux-fsdevel@vger.kernel.org, pbonzini@redhat.com,
 akpm@linux-foundation.org, vannapurve@google.com, suzuki.poulose@arm.com,
 rppt@kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Sep 25, 2025, Jason Gunthorpe wrote:
> On Thu, Sep 25, 2025 at 02:35:19PM -0700, Sean Christopherson wrote:
> > >  LDLIBS += -ldl
> > > +LDLIBS += -lnuma
> > 
> > Hrm, this is going to be very annoying.  I don't have libnuma-dev installed on
> > any of my <too many> systems, and I doubt I'm alone.  Installing the package is
> > trivial, but I'm a little wary of foisting that requirement on all KVM developers
> > and build bots.
> 
> Wouldn't it be great if the kselftest build system used something like
> meson and could work around these little issues without breaking the
> whole build ? :(
> 
> Does anyone else think this?
> 
> Every time I try to build kselftsts I just ignore all the errors the
> fly by because the one bit I wanted did build properly anyhow.

I'm indifferent, as I literally never build all of kselftests, I just build KVM
selftests.  But I'm probably in the minority for the kernel overall.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
