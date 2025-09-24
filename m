Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAF3B9B664
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Sep 2025 20:19:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5+cMZjWq0eP0j44Q/itcO2d0P+a38FVoigSUcnbSos=; b=GudN8EJYa70ZQAKckiNL2b4Aak
	HRjDvazPNY/JR6/0S9+z9XOJ75VZQjaO4JvPV+j4De4M0y9C573tbI77LzRoyQjKX4Y55er0aDX+J
	j6WnRBSSQA/Yr8MX+CtOKRW7uWKRThEy43wmppEl1ywx91rYPcl+gSNkno40IY0XqZsM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v1U5L-0001ah-BB;
	Wed, 24 Sep 2025 18:19:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@redhat.com>) id 1v1U5J-0001aS-Mb
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Sep 2025 18:19:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+GVKNWNi5HMo/lBrmWhAcg83rtAIgDpsQXqdRYrctmM=; b=W5GfUMYOSUg8pz6vgLMu5IiVA8
 LWRhOJ1gE4tPj3bkfIADEC93RbAQ/GkApnOk3stVH8B/svjfjKQs1FsPRbayMONV6NCBt03G7nArZ
 ddubvm+JZDhxHA6xgwXcLZIOWVl6nyDWCAJa8iCu+0FHDwoIEo4HytJYTFmA1PVt2p6s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+GVKNWNi5HMo/lBrmWhAcg83rtAIgDpsQXqdRYrctmM=; b=aG2KXdRW0tcXAwEtp4E2Z7gfCJ
 RvzBsgvG5hKbHWjIVP/TmYPrvmZz8C5Zs1mT8rfDtD7/hY5k0zBJXC+D4ar9G+qDeBvlsTbPPUF0j
 OwGBtSwwrNW+x7V8yufkd7rx1DnwJx7vzLtJ9LE+PhqUk5MbybYj/l/Wxp24HFC0q7f0=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v1U5K-0007WT-1K for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Sep 2025 18:19:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758737951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+GVKNWNi5HMo/lBrmWhAcg83rtAIgDpsQXqdRYrctmM=;
 b=SOO3PYY4ne7Lzcl3/00Neki4q2j9Taec8DyScqDCJqlL4KK9Fb4M+TOwdQ58bPIsQQTCg8
 H5PxpQoIYr/laogZ38BsSnWZMYDfMBibe8t2j5ZK2Ouxq40MIjuhho85kByXyRgz8TsZq1
 s0k+XGg1pCUxFV/JaTd/lH1aDFEdq0Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-1i4Mh0nnNdaa_KFIVXHTDg-1; Wed, 24 Sep 2025 14:19:07 -0400
X-MC-Unique: 1i4Mh0nnNdaa_KFIVXHTDg-1
X-Mimecast-MFC-AGG-ID: 1i4Mh0nnNdaa_KFIVXHTDg_1758737947
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-45b986a7b8aso677615e9.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Sep 2025 11:19:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758737946; x=1759342746;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+GVKNWNi5HMo/lBrmWhAcg83rtAIgDpsQXqdRYrctmM=;
 b=Mao4WCN0e6WSFnKJEyiP0YqcnDPiEHwUwbLv9Syvuvo1vI5+4TIAPmwCuzLIYLYkUh
 ZfEpPaY5TiJTKdIhqlt2ZT2JgWLmD3mfngC1EZq9ALaHBz6RwowAJMErCzgUbUXQrSxu
 +vopwcJyc80y/PaQpmlFLkXXty3SiTJCc5rZvcvtTnYMReWf85JgG7qvJ2Z4uR1rYzl+
 DigvTCh/iryjnXeLrm050N/+cxcbcad01fXQdyiY/jg7mbn9wFRrNWltlvT77ep/jny1
 NXfSxIMMaGkw62vVhAETlyD3cC2RWdzpz++cZEOBW35V7EbtxYkzPRGeaUN3tuaGM02I
 htYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7D4qpc7FLAzu3lq/fgD1986nkMf1kY6uE/4l0WwB8d5Ox5ui9cWu8GNpl/HOzqV7luM5EGEOB1GRDqZkSaY4H@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyEe4/bnCFRbj3+UPRKzT+/BUCShGnALfr/hSVRBXK8FFj19Ao0
 djUkHqPWZUAcHB5bE/yehcHDCHjQVA6PCp9y9uzsIbBwGif+qFBFyz0sZ6etx1yeiNpXjP0Ejnh
 CMk8uurzdaaXVJIZ4MLRLBxwvpUdlPoKKaoUbaUB02Z0gxEnN+LLdgzPGy3CQy7WoASRO63b0fW
 6fmXY=
X-Gm-Gg: ASbGncvVbj7Fc88ry/GP+Z4xPV5Fu7i5ipWzR/BsJ36GScfr1az7SIb1V7dl+SzXyqe
 USEmXHCzMSZ2IdRtaJqkoooDwNas4OTwDda+8NV7cHG4i1S24z9qwtWuPylCSjrC5RwcYtZ6wH2
 8dEKZyK0YKeRj67sI5AkrSuDZsKLZDhJuna4ROcw7ay4qUNurmbE2S3iInmZKksOYu+0SFeB4mi
 roTRh7vXI3RqzW/dqf1CJbIGvbEd99QGqTJZc0VoWAwo0yrLe7DDnQeynUaba/dh3iCv+ujuNIC
 CTZbgBu8UlSpA/Wgprr+dfUrDrkoX6MfePbkEcQ2NF5H28G5EHWgznfHNwfgMQnwybygSt5f
X-Received: by 2002:a05:600c:1f16:b0:45f:2cf9:c229 with SMTP id
 5b1f17b1804b1-46e3292ea63mr9348555e9.0.1758737946329; 
 Wed, 24 Sep 2025 11:19:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWiZOUG5fae31rurFMM73vXO6jc0v8mG1U6clMBR7MZT6xxje1XWRB74TlFYPhZbJta7VNSw==
X-Received: by 2002:a05:600c:1f16:b0:45f:2cf9:c229 with SMTP id
 5b1f17b1804b1-46e3292ea63mr9348115e9.0.1758737945821; 
 Wed, 24 Sep 2025 11:19:05 -0700 (PDT)
Received: from [192.168.3.141] (p57a1a5c4.dip0.t-ipconnect.de.
 [87.161.165.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2a996da2sm50902695e9.5.2025.09.24.11.19.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Sep 2025 11:19:05 -0700 (PDT)
Message-ID: <1b01ebab-a43e-4344-ae38-50f0a031332f@redhat.com>
Date: Wed, 24 Sep 2025 20:19:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Shivank Garg <shivankg@amd.com>, willy@infradead.org,
 akpm@linux-foundation.org, pbonzini@redhat.com, shuah@kernel.org,
 seanjc@google.com, vbabka@suse.cz
References: <20250827175247.83322-2-shivankg@amd.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250827175247.83322-2-shivankg@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MdUvBRyXZT_JMQR8ck78WafpjWlBO4fDnxwtVeyCCcg_1758737947
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 27.08.25 19:52,
 Shivank Garg wrote: > This series introduces
 NUMA-aware memory placement support for KVM guests > with guest_memfd memory
 backends. It builds upon Fuad Tabba's work (V17) > that ena [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1v1U5K-0007WT-1K
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
From: David Hildenbrand via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: David Hildenbrand <david@redhat.com>
Cc: jgowans@amazon.com, mhocko@suse.com, jack@suse.cz, kvm@vger.kernel.org,
 dhavale@google.com, linux-btrfs@vger.kernel.org, aik@amd.com, papaluri@amd.com,
 kalyazin@amazon.com, peterx@redhat.com, linux-mm@kvack.org, clm@fb.com,
 ddutile@redhat.com, linux-kselftest@vger.kernel.org, shdhiman@amd.com,
 gshan@redhat.com, ying.huang@linux.alibaba.com, ira.weiny@intel.com,
 roypat@amazon.co.uk, matthew.brost@intel.com, linux-coco@lists.linux.dev,
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
 suzuki.poulose@arm.com, rppt@kernel.org, jgg@nvidia.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 27.08.25 19:52, Shivank Garg wrote:
> This series introduces NUMA-aware memory placement support for KVM guests
> with guest_memfd memory backends. It builds upon Fuad Tabba's work (V17)
> that enabled host-mapping for guest_memfd memory [1] and can be applied
> directly applied on KVM tree [2] (branch kvm-next, base commit: a6ad5413,
> Merge branch 'guest-memfd-mmap' into HEAD)
> 

Heads-up: I'll queue this (incl. the replacement patch for #4 from the 
reply) and send it tomorrow as a PR against kvm/next to Paolo.

-- 
Cheers

David / dhildenb



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
