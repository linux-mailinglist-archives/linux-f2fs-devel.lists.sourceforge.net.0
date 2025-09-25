Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A704B9FA55
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Sep 2025 15:45:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gcIzGp4XkWI0tR23e5E8/YEwubWhzArtGoSU9URvrbU=; b=TmdE2oqCJvg9CVmOzyT6DuRunH
	J7DApFWafDgZCpfw/1bARqPc9ZLQFd4l7ghrsrer6Y1tYfXQEQ+XEgHiJc/jTEpTewnwNy3+yoBNx
	Qv+RiNxSfd1Ttuh0QUlecuZQEtgUDSJCfepg0ZWWx8oU+V52707rflnW3XbaVisANYas=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v1mHV-0001JB-4n;
	Thu, 25 Sep 2025 13:45:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tabba@google.com>) id 1v1mHS-0001Iv-Rg
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Sep 2025 13:45:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N5TRZaIKsL5BDWNX1fB2oE8143OJVf1xWjoYHdxo8R0=; b=KCn79GCiBZTJrcgJTKNOYGr0cr
 AwNAjnWZ41PSdNHYbIZEDn0Xzk2LdiVKS6bUqcitfXGIhMldcZTepdUSZE5OEg9b2h/n68HAWjkPV
 WNAJxvziTvVQoXuWhDYoV/fS6tf7hgRjwqdXXce7xeDjyNLSiOt2Ta3htdm3g7UaNjqA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N5TRZaIKsL5BDWNX1fB2oE8143OJVf1xWjoYHdxo8R0=; b=WQokkRiYlqi+maAz2G+enHT43R
 8HkFkpC4PSPUEs/bSwQ7Sb9R26thYJF3WNc0vugXi83b71tuMknqcip4b5zunjLTuSr4ketNuxrYG
 tR6//HgxkxRNk1yEsPA8PR3lLZQjCrRFdbUJYfcs9vbyp93PD5xOB/ZNjWvw/bagh3C8=;
Received: from mail-qt1-f175.google.com ([209.85.160.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v1mHT-0006UM-95 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Sep 2025 13:45:07 +0000
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-4cb6fea963dso370301cf.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 25 Sep 2025 06:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1758807896; x=1759412696;
 darn=lists.sourceforge.net; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=N5TRZaIKsL5BDWNX1fB2oE8143OJVf1xWjoYHdxo8R0=;
 b=cdtbjRlfVtzuHApAhhYnw6GZvcVEZ5qRydeFEdplDCiYInUIIlLbcf4QdwhrnkjxxS
 PuULlO8aQ4w4ZhLcASahnja94THut/mJLHwauk+4Ud7q7n6l/s34t9pdenIzOqzaS385
 JcwsbQ3GI6lfrc30Uq9y/PxJXDvHWBCpkEHWLkrZMBrIhJioU8urBxF3p8V4HVIxqOlu
 SrtAJDFWenw6YOOnGZ5uWyln/Pc7+8gPOVSH1YmG7b0iUCsbWVP7Ey4tojddIPFF/oEt
 RTKJltZJFZH5/wAWEo/bil4UC6ZhWZz1cXu8lh2IV5Z5uZFt0HPpUgcacEySRonbwsrT
 sNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758807896; x=1759412696;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N5TRZaIKsL5BDWNX1fB2oE8143OJVf1xWjoYHdxo8R0=;
 b=r9UWWI4U0zBiv7S/V71w1VbERvBmsIq654lhmGTi6Q+6yDIpyxZ8FSJRbanYagct3T
 bTtw3c887qd8a2ouiHjKyRSDdxayp8Cp4H6NVbQCtVTOvVwkAnr+Uem3osZwRtoaEc79
 cdOQucx89k2iHf62xGYjgXlkzs1HR6qKLNBeD5WHIRMzS5+oax6naKt1AOaAChivHVpG
 Yt1WaDrCsp27M1ubJSV7PqVPbMh2OoVrLaaKrwSuPUKsN8yoTormrLr2C+z/rMdkJYqy
 pucBR4nEbaOb9Wvwyp7dbXbXT4mvpFENRC9NpZugyFvK2JsBJyVijkrpk19jy33JY67k
 sTMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+UMwWNk9JAf6iAoYSPGZAx5nUAwgvYa0uvBuSg04glbuPvMGn9pG846mg2ZM0NdQKzMTTTafScpvR2Wby85LR@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyDJmu3xjQvvIuDYwKxxc6QRTNmgd44003RI1DyUlVXY/pqPmFm
 pJGmh0d4lZy7NtZtR7mD3xLxG0WtJIppzMR6Bpo3PPtBwSdJMXZAa4+yWJp9WVOk/RK94jGmUMF
 zMiJj55vUs1Wdo/wuc0C1009TXiSoUCm947uPqcnE
X-Gm-Gg: ASbGnctJ+Hryby9y34EvmA074VG8IeM4EY5z64K28hO4Zl0eXF6XPDPJNJWX27KFNjQ
 H+rf9Nk4pbTfUWh0oU8NtUJ2Cw62EHIpb93q/blmuHWxGP5pi/FflvQbAOQHgGLVRxIQY21LWZ4
 HANc/LC8HgV5xjkR2IXXX0jJAiQM/4I28z144o/PVBr/UuPaTkCGWnkf1/DCqZTxRD7pH/FPLOS
 6elrirxBWA2eTMu5zoxQ/dA7w==
X-Google-Smtp-Source: AGHT+IHMjlzJoU4go98o9OLI3ONqf4XSyVwqhgPkrMYYKQ3q5Z+I56IySJAtT5Z6pWwXAgA4n71MeTiHJXaU1zjAWA0=
X-Received: by 2002:ac8:5996:0:b0:4b6:2d44:13c4 with SMTP id
 d75a77b69052e-4da2f12a974mr6481551cf.10.1758807895145; Thu, 25 Sep 2025
 06:44:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250827175247.83322-2-shivankg@amd.com>
 <20250827175247.83322-7-shivankg@amd.com>
 <diqztt1sbd2v.fsf@google.com> <aNSt9QT8dmpDK1eE@google.com>
 <dc6eb85f-87b6-43a1-b1f7-4727c0b834cc@amd.com>
 <b67dd7cd-2c1c-4566-badf-32082d8cd952@redhat.com>
 <aNVFrZDAkHmgNNci@google.com>
In-Reply-To: <aNVFrZDAkHmgNNci@google.com>
Date: Thu, 25 Sep 2025 14:44:18 +0100
X-Gm-Features: AS18NWD8QPp_e9025CtzHt-1GmqDfc-4KC-skp25M5mSn0nTsRNLyfZiLblKLT4
Message-ID: <CA+EHjTz=PnAOdjaPuHRnXE+CTUHCKVSnf-LA6bgwKpWbapy_0Q@mail.gmail.com>
To: Sean Christopherson <seanjc@google.com>
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 25 Sept 2025 at 14:41,
 Sean Christopherson <seanjc@google.com>
 wrote: > > On Thu, Sep 25, 2025, David Hildenbrand wrote: > > On 25.09.25
 13:44, Garg, Shivank wrote: > > > On 9/25/2025 8:20 AM, [...] 
 Content analysis details:   (-7.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.160.175 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1v1mHT-0006UM-95
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
From: Fuad Tabba via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Fuad Tabba <tabba@google.com>
Cc: jgowans@amazon.com, mhocko@suse.com, jack@suse.cz, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, linux-btrfs@vger.kernel.org, aik@amd.com,
 papaluri@amd.com, kalyazin@amazon.com, peterx@redhat.com, linux-mm@kvack.org,
 clm@fb.com, ddutile@redhat.com, linux-kselftest@vger.kernel.org,
 shdhiman@amd.com, gshan@redhat.com, ying.huang@linux.alibaba.com,
 shuah@kernel.org, roypat@amazon.co.uk, matthew.brost@intel.com,
 linux-coco@lists.linux.dev, zbestahu@gmail.com, lorenzo.stoakes@oracle.com,
 linux-bcachefs@vger.kernel.org, ira.weiny@intel.com, dhavale@google.com,
 jmorris@namei.org, willy@infradead.org, hch@infradead.org, chao.gao@intel.com,
 cgzones@googlemail.com, ziy@nvidia.com, rientjes@google.com, yuzhao@google.com,
 xiang@kernel.org, nikunj@amd.com, gourry@gourry.net, serge@hallyn.com,
 Shivank Garg <shivankg@amd.com>, thomas.lendacky@amd.com, ashish.kalra@amd.com,
 chao.p.peng@intel.com, yan.y.zhao@intel.com, byungchul@sk.com,
 michael.day@amd.com, Neeraj.Upadhyay@amd.com, michael.roth@amd.com,
 bfoster@redhat.com, bharata@amd.com, josef@toxicpanda.com,
 Liam.Howlett@oracle.com, Ackerley Tng <ackerleytng@google.com>,
 dsterba@suse.com, viro@zeniv.linux.org.uk, jefflexu@linux.alibaba.com,
 jaegeuk@kernel.org, dan.j.williams@intel.com, surenb@google.com,
 vbabka@suse.cz, paul@paul-moore.com, joshua.hahnjy@gmail.com,
 apopple@nvidia.com, brauner@kernel.org, quic_eberman@quicinc.com,
 rakie.kim@sk.com, pvorel@suse.cz, linux-erofs@lists.ozlabs.org,
 kent.overstreet@linux.dev, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, pankaj.gupta@amd.com,
 linux-security-module@vger.kernel.org, lihongbo22@huawei.com,
 amit@infradead.org, linux-fsdevel@vger.kernel.org, pbonzini@redhat.com,
 akpm@linux-foundation.org, vannapurve@google.com, suzuki.poulose@arm.com,
 rppt@kernel.org, jgg@nvidia.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, 25 Sept 2025 at 14:41, Sean Christopherson <seanjc@google.com> wrote:
>
> On Thu, Sep 25, 2025, David Hildenbrand wrote:
> > On 25.09.25 13:44, Garg, Shivank wrote:
> > > On 9/25/2025 8:20 AM, Sean Christopherson wrote:
> > > I did functional testing and it works fine.
> >
> > I can queue this instead. I guess I can reuse the patch description and add
> > Sean as author + add his SOB (if he agrees).
>
> Eh, Ackerley and Fuad did all the work.  If I had provided feedback earlier,
> this would have been handled in a new version.  If they are ok with the changes,
> I would prefer they remain co-authors.

These changes are ok by me.
/fuad

> Regarding timing, how much do people care about getting this into 6.18 in
> particular?  AFAICT, this hasn't gotten any coverage in -next, which makes me a
> little nervous.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
