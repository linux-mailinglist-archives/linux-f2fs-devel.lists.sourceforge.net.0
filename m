Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BC15ABA2CC1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Sep 2025 09:32:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZzcODIuPCTGLT9RoQZt5/76MhNpk0/Knn69SSLCCss=; b=Pnl9d7qaKZF6nVPA3AhpIa+0zM
	pvTwnE34uu1lMiaGXtkhClpUdjV+zhBWvLVodwjLoijjRoBJeyxX3T6+sU6AhX3AkEfUT+mqNG0jS
	18m0CPKwprr9lr0ur1qcQT0oA5BSrZReIMgbylKmFD9dG1TL+PlER4MvUhREsr6HdjPQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v22wn-0004vh-VM;
	Fri, 26 Sep 2025 07:32:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@redhat.com>) id 1v22wm-0004vZ-J2
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Sep 2025 07:32:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K7lJCWxVdcfCha/v9DrcwqFYgZ0VcwRUn4ecEZCiSv8=; b=SOsftlpNcdy17sJtXsVIg7sB7o
 0z88lL93814WyQ5K7Fs6ozRpJ/zCrB1UvKm4MXHFGuXoFF0QZqATDOHHDA/+MgbeWzIJY7cdDvCwZ
 fAr5DsE+Ut1RudlUcsz8uL6cPxmLN3yEu+lu2sxmU+icDU+oLzxHEmRGmN2FrrqZ/UYs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K7lJCWxVdcfCha/v9DrcwqFYgZ0VcwRUn4ecEZCiSv8=; b=GyQdcdmLzNtQbJgET0jhuzYK/C
 /mzicBMK6q3UHwW0b3pI9LCuGyXpy07gvR5dOqoKR0agHoWP603jTAW75dMcy+bDflXXN8FaKuwMY
 f2lCHKWCV6XKWsU7fsRst/ZNR5DJCdBTG+0LdSt7b0arwr400iXDcS1T154opCUm2VK0=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v22wm-0006SK-45 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Sep 2025 07:32:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758871961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=K7lJCWxVdcfCha/v9DrcwqFYgZ0VcwRUn4ecEZCiSv8=;
 b=f2zI7cuUT5rvbfqZttQn7QpUD7a4YRO/1+lw3n+R2CyhPKiGdOS8UVO7PeZCdBSZ7zOq9V
 Qd4t0k3Z2EEyRR7l+26hq3a5xQldarrgawfy5nCxxBGKkwRyo1+LJhd75toUfMwTmDYkCc
 qTHdW6LkS+ohXN4eOPyBxZHONBL+zPA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-XBXtSBiJOCm2KIriOs1IHg-1; Fri, 26 Sep 2025 03:32:38 -0400
X-MC-Unique: XBXtSBiJOCm2KIriOs1IHg-1
X-Mimecast-MFC-AGG-ID: XBXtSBiJOCm2KIriOs1IHg_1758871958
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-46cde0b2226so4752535e9.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 Sep 2025 00:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758871958; x=1759476758;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K7lJCWxVdcfCha/v9DrcwqFYgZ0VcwRUn4ecEZCiSv8=;
 b=UEBtu93YO4XROPSRXY5SijgfvGn1+WC3oNIKB5CcZ180HE9GV/frWaf7vwXQE+EIwV
 JgcUdde3E/9fEqoeDeJ8HobJoFm9x6kxbbKIUFmwkFs/88Uo2JiowmBicxUqFSObAT5T
 c99MrEnkcpfIoGb9O58y0ZFJ//9zCnllOrnvjVrhDxt4a/4WHsez5HUNlyVyj7zscCjm
 Tusb35nXO4Z4A2vaCRp5JXJRnj7A2YbVPAg2ksUbz4l9vUDnQUZygXz7MTAGTjTDpt7b
 e6SawxU6ADgAoICvIYifjFTZfK03ZVcwJl2KbUXMm93i1er3CCEpVIvCTwVzOuDY9sNY
 NVqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPhS+18xQOi2BHfh5ZMQZLW6m0STvtPGgRoVMV6r/JsPIUCQVrPXma7gM9SmiLY7HOjykH6cvv2wnLLt9aWzBq@lists.sourceforge.net
X-Gm-Message-State: AOJu0YysWnJLgyS17EN8Wlee6F4LH2PmZNN3+/SJWRupaMgccFJxf4Gm
 s3Yw8fon7KnE0gFHEpE7iCU7UoYpmLNvEceWwz9rtbn3oFFD2eKeot4v9B/ZJzUSIIRjc+PQwBD
 P7LRi+BRAIb4YtCXLJ4DHyvO1WUZ78W+te2/9tZi+hMILvAliM5Nv829t01Z8KUe4zWX6ySaGVF
 Y9ANI=
X-Gm-Gg: ASbGncuhHZP8yibrtpaEIjeAa+HjkyUntT6RCcx7yMboEqEgcfZro/03waVcDLAsZUR
 iq8uBXYDuqWWKtEXHCvfjzAvVdq8NpufIw9mlSVHi3iBhsbyWeZ1XHVU8I9ajA4sYJ8pPAxjBGB
 rxeU9uWgw4C2Lw4Ktd67JZz2VhwR70p0MZWoRMUgIsJKbS0pEdXma37bvKQIb+dA4DW65Ir/CyE
 29vcWGwLbrlskRCd0oqBRnKcOaYJiK8A+ROR5Bpbk1gpDopeIxDa0wfCMpAfGBxHP+jl+QCN+dF
 Novjo3cvQJ5J8T53sRenWXT8ylE99CK9uoRiu1lq8KCnw113/jUmSJD7LfQzuGx9prCEcBKV7N5
 +Be1ygVOr2zqfrbZ/sJynhhLNohM90Sgeb8X3+y5k4+COd9DWicIsE/H1IEF/B2kVLcW6
X-Received: by 2002:a05:600c:a43:b0:46d:d949:daba with SMTP id
 5b1f17b1804b1-46e329a7fe3mr62998805e9.4.1758871957453; 
 Fri, 26 Sep 2025 00:32:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtL4vBtb4UkKxYY+8AUu50LpG2eTQL/mEdtyu+TBsZgjy08g9xtyeO4upwKha/FYi9Pburtw==
X-Received: by 2002:a05:600c:a43:b0:46d:d949:daba with SMTP id
 5b1f17b1804b1-46e329a7fe3mr62997645e9.4.1758871956911; 
 Fri, 26 Sep 2025 00:32:36 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f34:c100:5d3c:50c0:398a:3ac9?
 (p200300d82f34c1005d3c50c0398a3ac9.dip0.t-ipconnect.de.
 [2003:d8:2f34:c100:5d3c:50c0:398a:3ac9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc72b0aeesm6112695f8f.49.2025.09.26.00.32.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Sep 2025 00:32:36 -0700 (PDT)
Message-ID: <a127971f-d1e7-4fea-a16a-c2bae34b4ad3@redhat.com>
Date: Fri, 26 Sep 2025 09:32:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jason Gunthorpe <jgg@nvidia.com>, Sean Christopherson <seanjc@google.com>
References: <20250827175247.83322-2-shivankg@amd.com>
 <20250827175247.83322-10-shivankg@amd.com> <aNW1l-Wdk6wrigM8@google.com>
 <20250925230420.GC2617119@nvidia.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250925230420.GC2617119@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HOTJiNkCnTZqVEHnKkH_NCaWY5F0hOvl152Mgv16B8g_1758871958
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 26.09.25 01:04, Jason Gunthorpe wrote: > On Thu, Sep 25, 
 2025 at 02:35:19PM -0700, Sean Christopherson wrote: >>> LDLIBS += -ldl >>>
 +LDLIBS += -lnuma >> >> Hrm, this is going to be very annoying. [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [170.10.129.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1v22wm-0006SK-45
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
From: David Hildenbrand via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: David Hildenbrand <david@redhat.com>
Cc: jgowans@amazon.com, mhocko@suse.com, jack@suse.cz, kvm@vger.kernel.org,
 dhavale@google.com, linux-btrfs@vger.kernel.org, aik@amd.com, papaluri@amd.com,
 kalyazin@amazon.com, peterx@redhat.com, linux-mm@kvack.org, clm@fb.com,
 ddutile@redhat.com, linux-kselftest@vger.kernel.org, shdhiman@amd.com,
 gshan@redhat.com, ying.huang@linux.alibaba.com, shuah@kernel.org,
 roypat@amazon.co.uk, matthew.brost@intel.com, zbestahu@gmail.com,
 lorenzo.stoakes@oracle.com, linux-bcachefs@vger.kernel.org,
 ira.weiny@intel.com, apopple@nvidia.com, jmorris@namei.org,
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
 paul@paul-moore.com, joshua.hahnjy@gmail.com, brauner@kernel.org,
 quic_eberman@quicinc.com, rakie.kim@sk.com, cgzones@googlemail.com,
 pvorel@suse.cz, linux-erofs@lists.ozlabs.org, kent.overstreet@linux.dev,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 pankaj.gupta@amd.com, linux-security-module@vger.kernel.org,
 lihongbo22@huawei.com, amit@infradead.org, linux-fsdevel@vger.kernel.org,
 pbonzini@redhat.com, akpm@linux-foundation.org, vannapurve@google.com,
 suzuki.poulose@arm.com, rppt@kernel.org, linux-coco@lists.linux.dev
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 26.09.25 01:04, Jason Gunthorpe wrote:
> On Thu, Sep 25, 2025 at 02:35:19PM -0700, Sean Christopherson wrote:
>>>   LDLIBS += -ldl
>>> +LDLIBS += -lnuma
>>
>> Hrm, this is going to be very annoying.  I don't have libnuma-dev installed on
>> any of my <too many> systems, and I doubt I'm alone.  Installing the package is
>> trivial, but I'm a little wary of foisting that requirement on all KVM developers
>> and build bots.
> 
> Wouldn't it be great if the kselftest build system used something like
> meson and could work around these little issues without breaking the
> whole build ? :(
> 
> Does anyone else think this?
> 
> Every time I try to build kselftsts I just ignore all the errors the
> fly by because the one bit I wanted did build properly anyhow.

When I'm in a hurry I even do the same within mm selftests.

-- 
Cheers

David / dhildenb



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
