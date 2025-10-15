Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B58D2BE0EA3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Oct 2025 00:14:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ZP/FgY/mqaEUyIOMD6E2wNZ3WZhMbw76NLXHPY3+Cc=; b=XMXBbc9lAru4trJvj35ufhWds8
	zNK4+VOTx0c9i5X3ksvSt2B3QBuKJw0m5Nk4j+DjsiCvHIToanlHYigvcdNbWMJqFE117wn25ZNou
	GfVXCS3rnwFT3beBhw45zhDztqw+CYLZqCAZ5kHQn3txCBD+T3lhIJvgC5CNSncNqXN8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v99lM-0008VN-Dv;
	Wed, 15 Oct 2025 22:14:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gourry@gourry.net>) id 1v99lK-0008V0-7l
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Oct 2025 22:14:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L3FMg1FEv7ZUbFziIBjfrlMH5r4d6/IdcxKlJL9nOzQ=; b=aY5qOkypzX3sWUnI9k7fMkXFI8
 0sJalLbrk9DwfyM48oWw1KWOR8xWtHifLWDIciiEPWNG62ISQheKiqvK0wLaWSg886owUTqKva8gI
 /zNCfKRMVq3JSMCtjsFTcn/Y9UMM9DUEqJ8jC8aU66rwcN2S0Owdh3Kx97L3dzfERuEU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L3FMg1FEv7ZUbFziIBjfrlMH5r4d6/IdcxKlJL9nOzQ=; b=CurUoabZNR4T6gQX+5dOnMspzz
 Cwsw9bANRNuAWrX1pzd0burNNKyFyfuLxzciVps0D1nLJyaQ4xSbEx10yJZ3FJolH/EfH+D0gNciE
 bptshykIc/wWjIdC/hJIr9CX8GK2qUOgx39ur4FzXGzw9tWRWTkrweIsRXEM3TAkJ5O8=;
Received: from mail-qk1-f172.google.com ([209.85.222.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v99lK-0005go-FT for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Oct 2025 22:14:26 +0000
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-88f27b67744so11265985a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 15 Oct 2025 15:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gourry.net; s=google; t=1760566460; x=1761171260; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=L3FMg1FEv7ZUbFziIBjfrlMH5r4d6/IdcxKlJL9nOzQ=;
 b=FWt56cNBwCBG8L2LxluM71FseHTdVqfBudu7S5SDeVdNyX3t2LFWq7o/I7fSSAB4mw
 WvBs3Uv66QVKx3GNToRlwtk2XUdVv4vA9jZeI7mewX8AveSqaPnTr4gNZ0niD7e/xNdX
 J0uvUuEvwJOaKnOPYX6Rd4Eh3Njw9+umlTCH6yYW/lpGu2Zg4Oz6vswuyhJhqyjChc9c
 itmn1+bYogzPewhT6dTavHB9a2Yjw90X9ueweDsO+HGqqIn6imBtjlKRyYf6LM4cGD7B
 WjtK+sb62Nr3RlhWwRi+shatY7XIB4jwJiidLDXPgukNfhB/GT1F2F2UhwxquLnYZol3
 oStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760566460; x=1761171260;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L3FMg1FEv7ZUbFziIBjfrlMH5r4d6/IdcxKlJL9nOzQ=;
 b=ens5XbZgQYdp8+BH3hELv1Qlv5t8Xfh0Vc4XWO6jirC74gq7Vq4OCk+0pLrxppXYGi
 xIlOi09zUn4hW9CpiP+1CKPmBkVqq8lYDUnlfHpL8xG/f67Rery/+TxXUtHJWS2OAqIk
 VV6minGPVwEwLphfGNgxBmXDY545AQx0QclWECrQq2PRv7VeKI9zlHCY98e582lbENGO
 e4yzrD/ioMOrN6vsjC9gSITW7KeKmsupEKehFyXoBvKr+FdiSw4WeIBoY0Un16enxCd/
 0vOhceaFJgxRangjF529tHS3AnUdttPc7MzT2idyRgE3LQQxCCpV4/pBDkHr2U883dUx
 QsMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVy+aElTRKY1nsbh/3IxWpdSgoqbpV36P+Os3vBDX80j1v5mtGica0YoP4IddQxh0CV7WR6sQC+phWRtcbvw2Rv@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxvmQ84IO/tLH0ppptUu+lGtAeh+KAgS4QmeHh7wKOBReSUE6pq
 zzC9PilchbKs7JGoz/C6bBQyEodq1DguQND1ebZMK1CXeY72feNNyfFBYUSZylwZ4cquqsBqhP4
 f4Iwf
X-Gm-Gg: ASbGnctKA8alE+qVdpwT6e51NaIK9Pv+QA91ZU7YEth5iYfVR3GZ4KT8ntRY8tIovIn
 43IROCTwqFTETsLDR5Yi2pfnfSlNTo4GBgyFsJQx/IbgGTfmD++xSiH/PcHY+uicr5ZRMtSF69I
 ERys+vJXvYCgca73Hb78L8Jm06yJsJ2N63qSUGJkjhrMTKTQryKQXUbFUJklbUdMCJhCcJr/3QP
 bgnxVY/8+LZc2NOe0Bm8cjgWQC1VG4gvWbSLkb5Og1j+UzNJsM23gu1K49Dj+9rZimGDy9UYJ+u
 Ox95XlIMAhFIOHzVPfasmQz+bgVJEWJGqwGpwXC33TGX7QvqAEvJfVwpbE+9yx/80EbTlRIV/Fs
 3a3pmJPzO+QO6U+FloSZf/6bmxyEOyLCq4GsVMkirqveNKwtgGkztWJuraFwWqkfrNsFherZqv6
 CKRrjBBH3u106nKQZD8hU3RkR2
X-Google-Smtp-Source: AGHT+IGFaJmIXEF9qOWREfnISohaPtcOawCiX32gOo0axLN0cRb3DCKNrFn66v9UE7KAPGfO0N4wTQ==
X-Received: by 2002:a05:620a:1a02:b0:88e:86a3:98f1 with SMTP id
 af79cd13be357-88e86a39b78mr380325385a.45.1760564761659; 
 Wed, 15 Oct 2025 14:46:01 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F
 (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-88f37e50ebasm56360985a.31.2025.10.15.14.45.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 14:46:00 -0700 (PDT)
Date: Wed, 15 Oct 2025 17:45:57 -0400
From: Gregory Price <gourry@gourry.net>
To: Sean Christopherson <seanjc@google.com>
Message-ID: <aPAWFQyFLK4EKWVK@gourry-fedora-PF4VCD3F>
References: <20250827175247.83322-2-shivankg@amd.com>
 <20250827175247.83322-9-shivankg@amd.com>
 <aNVQJqYLX17v-fsf@google.com> <aNbrO7A7fSjb4W84@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aNbrO7A7fSjb4W84@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Sep 26, 2025 at 12:36:27PM -0700, Sean Christopherson
 via Linux-f2fs-devel wrote: > > > > static struct mempolicy
 *kvm_gmem_get_policy(struct
 vm_area_struct *vma, > > unsigned long addr, pgoff [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.172 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1v99lK-0005go-FT
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
Cc: jgowans@amazon.com, mhocko@suse.com, gshan@redhat.com, jgg@nvidia.com,
 kvm@vger.kernel.org, david@redhat.com, kalyazin@amazon.com, peterx@redhat.com,
 clm@fb.com, rppt@kernel.org, ddutile@redhat.com,
 linux-kselftest@vger.kernel.org, papaluri@amd.com, jack@suse.cz,
 ying.huang@linux.alibaba.com, shuah@kernel.org, dan.j.williams@intel.com,
 matthew.brost@intel.com, zbestahu@gmail.com, lorenzo.stoakes@oracle.com,
 pvorel@suse.cz, ira.weiny@intel.com, dhavale@google.com, jmorris@namei.org,
 willy@infradead.org, hch@infradead.org, linux-bcachefs@vger.kernel.org,
 vbabka@suse.cz, ziy@nvidia.com, rientjes@google.com, brauner@kernel.org,
 xiang@kernel.org, roypat@amazon.co.uk, chao.gao@intel.com,
 Shivank Garg <shivankg@amd.com>, thomas.lendacky@amd.com, ashish.kalra@amd.com,
 chao.p.peng@intel.com, yan.y.zhao@intel.com, byungchul@sk.com,
 michael.day@amd.com, Neeraj.Upadhyay@amd.com, michael.roth@amd.com,
 bfoster@redhat.com, bharata@amd.com, josef@toxicpanda.com,
 Liam.Howlett@oracle.com, surenb@google.com, ackerleytng@google.com,
 suzuki.poulose@arm.com, linux-coco@lists.linux.dev, dsterba@suse.com,
 shdhiman@amd.com, jaegeuk@kernel.org, amit@infradead.org, tabba@google.com,
 yuzhao@google.com, joshua.hahnjy@gmail.com, apopple@nvidia.com, nikunj@amd.com,
 vannapurve@google.com, quic_eberman@quicinc.com, paul@paul-moore.com,
 cgzones@googlemail.com, linux-mm@kvack.org, kent.overstreet@linux.dev,
 rakie.kim@sk.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, pankaj.gupta@amd.com,
 linux-security-module@vger.kernel.org, lihongbo22@huawei.com,
 jefflexu@linux.alibaba.com, aik@amd.com, linux-fsdevel@vger.kernel.org,
 pbonzini@redhat.com, akpm@linux-foundation.org, serge@hallyn.com,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org,
 viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Sep 26, 2025 at 12:36:27PM -0700, Sean Christopherson via Linux-f2fs-devel wrote:
> > 
> > static struct mempolicy *kvm_gmem_get_policy(struct vm_area_struct *vma,
> > 					     unsigned long addr, pgoff_t *pgoff)
> > {
> > 	*pgoff = vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
> > 
> > 	return __kvm_gmem_get_policy(GMEM_I(file_inode(vma->vm_file)), *pgoff);
> 
> Argh!!!!!  This breaks the selftest because do_get_mempolicy() very specifically
> falls back to the default_policy, NOT to the current task's policy.  That is
> *exactly* the type of subtle detail that needs to be commented, because there's
> no way some random KVM developer is going to know that returning NULL here is
> important with respect to get_mempolicy() ABI.
> 

Do_get_mempolicy was designed to be accessed by the syscall, not as an in-kernel ABI.

get_task_policy also returns the default policy if there's nothing
there, because that's what applies.

I have dangerous questions:

why is __kvm_gmem_get_policy using
	mpol_shared_policy_lookup()
instead of
	get_vma_policy()

get_vma_policy does this all for you

struct mempolicy *get_vma_policy(struct vm_area_struct *vma,
                                 unsigned long addr, int order, pgoff_t *ilx)
{
        struct mempolicy *pol;

        pol = __get_vma_policy(vma, addr, ilx);
        if (!pol)
                pol = get_task_policy(current);
        if (pol->mode == MPOL_INTERLEAVE ||
            pol->mode == MPOL_WEIGHTED_INTERLEAVE) {
                *ilx += vma->vm_pgoff >> order;
                *ilx += (addr - vma->vm_start) >> (PAGE_SHIFT + order);
        }
        return pol;
}

Of course you still have the same issue: get_task_policy will return the
default, because that's what applies.

do_get_mempolicy just seems like the completely incorrect interface to
be using here.

~Gregory


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
