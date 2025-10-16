Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6367FBE3DE0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Oct 2025 16:17:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gKSroh5t3WD9eoAgIb7R+sGFmZ1V5kIuXirDXn4bK3c=; b=limg7KZRlxN7BqONM5oZxk8qDA
	Ohfu+PvYwRRqw+zA5hiXknZ6vTe9L/PZNx3OVbdpkRMsD4QDk6yb83/15vSTOzWuR0QhZPWr1+Trd
	P5Lp6Sdy2jtj2Bk5IrDQHZ2AH2RkfJrAFY4hoxAa1flLHZJvk99cX4oGUOBLe8k1/4Kg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v9OnW-0000EQ-L8;
	Thu, 16 Oct 2025 14:17:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gourry@gourry.net>) id 1v9OnV-0000EE-K6
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Oct 2025 14:17:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vDx8+7T+MYrCmWnRteKVa1iC6/sCWZvHc99T+OB8RqU=; b=A14zqmrrfwrmGSP5wXXPJH4Pok
 /8De7VIgoq/Kqx1KDIswoixq2xFJFhJzbEbpmbeYntMJx0/zEUw4iA743Ph+G+5cbfomQ2lYGoxDo
 NAlsofxPjaNeZUD2luNSRxofVCV0z40Uh4kMU7ar64FTZslj9Kqt8DqzJeypMMJjNVrI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vDx8+7T+MYrCmWnRteKVa1iC6/sCWZvHc99T+OB8RqU=; b=dlfO1AuJG5h8Dz1WbFutPNHZuh
 HOVnljNProUjsMu7fYbKA8EipzAORZ17lQ031XkhZSUtlT6T/RosfkU+Z44y7KNUXKOEu/R5LYnnA
 FRycqTFkpH8U/rfVTy23sXI0S34tnS7oEUBVod7dI6QqCcCU/ea+CGZchQfGumiJC33o=;
Received: from mail-qv1-f52.google.com ([209.85.219.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v9OnV-00047n-Pr for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Oct 2025 14:17:42 +0000
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-87c1f3f4373so5551636d6.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 16 Oct 2025 07:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gourry.net; s=google; t=1760624251; x=1761229051; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vDx8+7T+MYrCmWnRteKVa1iC6/sCWZvHc99T+OB8RqU=;
 b=RfsU7D76dvpzMoUlQ6pg1/ksf04Zt194ZAJmiVnlsMl/bBhet3tn1M3dXl5eSdR9Vo
 +ipypgNfWyhouPh1TcmBqsOis4EtgLjtRmqmcUeB/PO9zG69hUx+Ck0XTue5aAH+sgiW
 SDU+Yx7aCW2hem1fAwE2o6gpcdA3k/vlPKnmcJmC11NpcXCo+RjFo12e9QbKAu6nMQFB
 LqO4n/LgS+3lUyU69hl6Wx0C+0Pt8IyoPmjuVuHfo4Zv0qTVED4+P/0CsQeaHs+gl6zn
 91JjPM5bJ6+021cfbVtv0LODOBrKuzgNC3cTlEHiR81DNMKs7dpRMBR60kLMHLCvAtyl
 9prQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760624251; x=1761229051;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vDx8+7T+MYrCmWnRteKVa1iC6/sCWZvHc99T+OB8RqU=;
 b=TKA1VPkIkpRZBhfBNoyc7Wk4ZIG8Pv1lLkKuJn9xzn9dXbb478CCF+Hh4hmr1kxwSn
 cKbCE5EW5mmCtpjtQm6I+Ac0up+bJdpozCX7fllqhA6QKDAy8Hz6uvDM4GoYKe82Io5O
 QY3vwi0PpLlt9cVg9f2M8h6hk9T36YMZjeVPk7r0p51P8a76GWuxJU4W+GYQLcXKMRiS
 WYcXD9P+2/Ov1L6rYty1Zo6KXAXxd6rg/rkkGJ1tLcFI4Mk90J6cvTw6bGMSaybWQnXH
 OCpikZPX3NkSz6W2WBH74FkAaYDHK1SkYv0azTJ8ch4GxicJuWBZe9+dMtR/tPYndxJ3
 hotw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKr24YSho8Q51N5ZamDtX+Zy1ndK0+a5j/ZqZz6ASbpE/rz/Ui79O4x2W1dULMV3RSco+JRBCJ/eB4e/QaTZqP@lists.sourceforge.net
X-Gm-Message-State: AOJu0Ywx0ucEHzOutKYe8E0DLMSJboFVfmApRyiLc2RfhAGZFKnmH7QQ
 RioAQDnItRaFONwx5+AnR4hJp6fn6YZM5eBnbOXYrP3X6qMO3WAunYIRxzSBMSxVbYI=
X-Gm-Gg: ASbGncsRyt4UTG+o+fcCUp8V9qL1+kx57OdbnnpLk3PcAHqSzWydT7oV3HDCtu8eam0
 xK/0imqy7mkJKw+RjjYcdO+eJNTJh9lKbixE8XS6edkbzn83yL5emxoDROUdTqcVUhgUGWozaPb
 JJdbmhSkD0sM2JqyUS3GPdtoqno+aQopxUmW/vyI3pdLMwYaom5YT5Q+Lus+GwqBMEQQt9D/OVZ
 +Ukn1+bX7IX/QRJwuaenM+Ur8FfxEP6aIn9CsbdMMUg4f0tHzFV/3PsN06qaJtS+/WlowmpETY1
 slrqF5EdaVQhxfxNkSm1ubLEXqXU4qf7nNMxwCgVijGAvJnw0ZSEX8wIixV5fwuHC6Cu0HStwTm
 7HPqDWF3DyL/9qbLqVjWnhDtUe/iEQgfA2p7LBh859gCgubPYJdlm8lZq9JXJOLuP0RPnEVuF5e
 mLkZ33E4n7tFG28BzIyQmvTBANib9/1YkCYTJFvdz7yQCHelbZNtLw1XC4LPeSdh6aU2NDzA==
X-Google-Smtp-Source: AGHT+IEMapVQRI0ck2KCGxvEYuBB3a+08a/2JspNz86EbcND1SGuRInp+B2xwxF3NumJMeFQLVJPkQ==
X-Received: by 2002:ac8:5883:0:b0:4e8:99b0:b35e with SMTP id
 d75a77b69052e-4e89d263140mr4179321cf.30.1760624250594; 
 Thu, 16 Oct 2025 07:17:30 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F
 (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4e8955b07e9sm13309541cf.27.2025.10.16.07.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 07:17:29 -0700 (PDT)
Date: Thu, 16 Oct 2025 10:17:25 -0400
From: Gregory Price <gourry@gourry.net>
To: Sean Christopherson <seanjc@google.com>
Message-ID: <aPD-dbl5KWNSHu5R@gourry-fedora-PF4VCD3F>
References: <20250827175247.83322-2-shivankg@amd.com>
 <20250827175247.83322-9-shivankg@amd.com>
 <aNVQJqYLX17v-fsf@google.com> <aNbrO7A7fSjb4W84@google.com>
 <aPAWFQyFLK4EKWVK@gourry-fedora-PF4VCD3F>
 <aPAkxp67-R9aQ8oN@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aPAkxp67-R9aQ8oN@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Oct 15, 2025 at 03:48:38PM -0700, Sean Christopherson
 wrote: > On Wed, Oct 15, 2025,
 Gregory Price wrote: > > why is __kvm_gmem_get_policy
 using > > mpol_shared_policy_lookup() > > instead of [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.52 listed in wl.mailspike.net]
X-Headers-End: 1v9OnV-00047n-Pr
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

On Wed, Oct 15, 2025 at 03:48:38PM -0700, Sean Christopherson wrote:
> On Wed, Oct 15, 2025, Gregory Price wrote:
> > why is __kvm_gmem_get_policy using
> > 	mpol_shared_policy_lookup()
> > instead of
> > 	get_vma_policy()
> 
> With the disclaimer that I haven't followed the gory details of this series super
> closely, my understanding is...
> 
> Because the VMA is a means to an end, and we want the policy to persist even if
> the VMA goes away.
> 

Ah, you know, now that i've taken a close look, I can see that you've
essentially modeled this after ipc/shm.c | mm/shmem.c pattern.

What's had me scratching my chin is that shm/shmem already has a
mempolicy pattern which ends up using folio_alloc_mpol() where the
relationship is

tmpfs: sb_info->mpol = default set by user
  create_file: inode inherits copy of sb_info->mpol
    fault:    mpol = shmem_get_pgoff_policy(info, index, order, &ilx);
             folio = folio_alloc_mpol(gfp, order, mpol, ilx, numa_node_id())

So this inode mempolicy in guest_memfd is really acting more as a the
filesystem-default mempolicy, which you want to survive even if userland
never maps the memory/unmaps the memory.

So the relationship is more like

guest_memfd -> creates fd/inode <- copies task mempolicy (if set)
  vm:  allocates memory via filemap_get_folio_mpol()
  userland mmap(fd):
  	creates new inode<->vma mapping
	vma->mpol = kvm_gmem_get_policy()
	calls to set/get_policy/mbind go through kvm_gmem 

This makes sense, sorry for the noise.  Have been tearing apart
mempolicy lately and I'm disliking the general odor coming off
it as a whole.  I had been poking at adding mempolicy support to
filemap and you got there first.  Overall I think there are still
other problems with mempolicy, but this all looks fine as-is.

~Gregory


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
