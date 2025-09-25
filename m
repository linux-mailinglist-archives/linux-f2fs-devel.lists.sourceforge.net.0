Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BECB9F086
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Sep 2025 13:55:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cQq6Bwkk+eC+FMn4yi2lOQpxzJ9jljFETpFSeO0T6MQ=; b=bsEYFyQl4FNlwC+TJzFGBKGIw6
	dlCan459fGj6NBffur/V+bUroPh0+q7wMR1kn1wJuTjMD0FmvuabeJJMuUqhAQUpisiu5Q2SdkwA9
	H/g4P55zmM32vFGvTseKWhzv3zJiPnVGY/BKpe6j6IkgdylWyrKPs5Cyyq90qT+DpUAM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v1kZe-0002OL-L6;
	Thu, 25 Sep 2025 11:55:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@redhat.com>) id 1v1kZd-0002OF-59
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Sep 2025 11:55:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SCbRU8MveS1pgXPDEzPy2kt340UB03o/vXxtaoaDWAc=; b=jyiF1rh69drQjadpTwQE/eAs8d
 IuiX7VOGFHNO2u2ldyosNxU7R4Ow3kNPvv4Hl8sIjSbX5B69rVrk9y6U1iKtyfX1WOmLbzZB7+Cjn
 1IL5kr7ib3faqHK3EC6nXe1rFKEOWXHIsTDhas0C4kdhSlulDaAVHAVyB8omVqRdAqmM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SCbRU8MveS1pgXPDEzPy2kt340UB03o/vXxtaoaDWAc=; b=i0aXmyEOZH9SiMHeB8Yr5j9ks2
 rwDile4OZ/H+d6XuH6XkxrE2GzL5zl6g3aOTYo+pmKNL93pwUxp3k/Ncqjq3KiHEKtZw5m8ut+ZBK
 8ZYgZhUIMX5KyOJHDddrBwQAwGKbn7JEjeaC/t0rN8u/PbnSXCRHX5IxfLpxH8PyQkEI=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v1kZc-0004FO-HQ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Sep 2025 11:55:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758801333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SCbRU8MveS1pgXPDEzPy2kt340UB03o/vXxtaoaDWAc=;
 b=NJkX5mhkzxPQya2MmhiH+5FEF5FrSa/jZgUe0ZAhDzuxe1kxrRIy7OCxkqaQPJvWGNIy2o
 Ln6ICBCKbDUORdGzzvRKmYcNsmJMRT0hegRBfMGEQkzmnflfaFeXerfNE0c2O+Lq5XktxX
 KX5yI6nOhq4tmUqpUfNjulCHks6m+4I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-nc7BBAJbPmGqD01RwXHkkQ-1; Thu, 25 Sep 2025 07:55:32 -0400
X-MC-Unique: nc7BBAJbPmGqD01RwXHkkQ-1
X-Mimecast-MFC-AGG-ID: nc7BBAJbPmGqD01RwXHkkQ_1758801331
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45de18e7eccso4732475e9.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 25 Sep 2025 04:55:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758801331; x=1759406131;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SCbRU8MveS1pgXPDEzPy2kt340UB03o/vXxtaoaDWAc=;
 b=fc+y6qPEJu4kDK4ae+FcnHEcvkVrwn3yekRiA9kDc+2aNmnid3SGIjEntBVSsnJVeY
 VCOCewElxYk7lJif3MllWc8xkkTo9S/2bkPCOQqDp6uePAk0qI2vY8i+j+ETLFRohQF3
 B9degpl/W574YT4YfQoYveJhAsOAUZpU+aZvtUpy289PoEc7tCPbSEUKY68Ilq26wSI+
 x7ZAxUreA/rPeM3xV4sn5hHxkfme/2HWVB/ILZi2b9Q+gKZ7coQWzSmRwliBAi2Nkabe
 VWoPVa1Il7cSeqkFnXcfF5dgLBHcwGx0E4Of6KxqNU2Me1/DYAupFfhp1CzGHq6FRctF
 2NXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqzdhMbLie+2jZs4df9a18mAOmgo4ToAPIfcqE7uMGwODFL3zBYo1t6q2417+K+g+vy0RRkP0Ce7EgJqDAqYIm@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyOfXj13INLoa2MLyJXxYj5tetM62V2KBVADwzmVMprvJpUxbzl
 bKs+i1I9+o3QjgRHWhRfwvmgF50Woq5FcGxSdcUc5YDRr5w0ihCK++deDT5PQozbvYAHRucv/Da
 AuF6ERTJkN0Q+RkeS+UaUMS62OwMICzddYJq4zJbxlhFltU9bs2uLegm7+z/QGNH4uAdoShiZgp
 QOT6A=
X-Gm-Gg: ASbGncuCB9XroaDSe5RoZI04KfCgBdTmwVobt8j2blymhYM8WrStSO0yPYgH8fjfFZD
 RgBqaezWW9lFXyj+2cAmz5ij0TcINyBQoiPgEZu6BjSdJkWTHdgsLkxiMbkJVNnSMpZu+AH/fNa
 g91xqfe9Wv+Whzgn+wwg6wayCiPOiNasFLvpFc/fRS8XNIISQMSrT14QY/2Iv7cNe0O6O6VPDT4
 0z2ZuEIEJKfdyZybfcwaEApjAXnJzx8c4CQ1z6zGl3vIAgXiDiTG2j20Lz9uA57A9xrsT22mJlP
 4m0mcUyZ98t9wej3Z/M8Emdm6qeS3IJXCVlb6JDOMcv0JoGF1OwW+esNeh0QtDiPlcCYMb5SnrY
 Wk+S1DhKup1YkA3PbuV3rJwt/lRuUz+3WdbnCoS2xBVM04HGp2hxTf9e6DAoCI3chdfQ+
X-Received: by 2002:a05:600c:c83:b0:46e:1c2d:bc84 with SMTP id
 5b1f17b1804b1-46e329eb10emr33699195e9.17.1758801330661; 
 Thu, 25 Sep 2025 04:55:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHt88AWAVfrsW7XtYeqx9eAlzDx2ZLFWRXrQuLhkskEblyKaQxcWglP3fS9EKwD9xW0YpDiXg==
X-Received: by 2002:a05:600c:c83:b0:46e:1c2d:bc84 with SMTP id
 5b1f17b1804b1-46e329eb10emr33698205e9.17.1758801329980; 
 Thu, 25 Sep 2025 04:55:29 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3f:f800:c101:5c9f:3bc9:3d08?
 (p200300d82f3ff800c1015c9f3bc93d08.dip0.t-ipconnect.de.
 [2003:d8:2f3f:f800:c101:5c9f:3bc9:3d08])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e33b562d8sm31593705e9.0.2025.09.25.04.55.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 04:55:29 -0700 (PDT)
Message-ID: <b67dd7cd-2c1c-4566-badf-32082d8cd952@redhat.com>
Date: Thu, 25 Sep 2025 13:55:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Garg, Shivank" <shivankg@amd.com>,
 Sean Christopherson <seanjc@google.com>,
 Ackerley Tng <ackerleytng@google.com>
References: <20250827175247.83322-2-shivankg@amd.com>
 <20250827175247.83322-7-shivankg@amd.com> <diqztt1sbd2v.fsf@google.com>
 <aNSt9QT8dmpDK1eE@google.com> <dc6eb85f-87b6-43a1-b1f7-4727c0b834cc@amd.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <dc6eb85f-87b6-43a1-b1f7-4727c0b834cc@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nLT1M0YVJBABvjdTVsrKl8wyrv6U_JPyEQOKlF42R70_1758801331
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 25.09.25 13:44, Garg, Shivank wrote: > > > On 9/25/2025
 8:20 AM,
 Sean Christopherson wrote: >> My apologies for the super late feedback.
 None of this is critical (mechanical >> things that can be c [...] 
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
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v1kZc-0004FO-HQ
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
From: David Hildenbrand via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: David Hildenbrand <david@redhat.com>
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
 nikunj@amd.com, gourry@gourry.net, serge@hallyn.com, amit@infradead.org,
 thomas.lendacky@amd.com, ashish.kalra@amd.com, chao.p.peng@intel.com,
 yan.y.zhao@intel.com, byungchul@sk.com, michael.day@amd.com,
 Neeraj.Upadhyay@amd.com, michael.roth@amd.com, bfoster@redhat.com,
 josef@toxicpanda.com, Liam.Howlett@oracle.com, pvorel@suse.cz,
 dsterba@suse.com, viro@zeniv.linux.org.uk, jefflexu@linux.alibaba.com,
 jaegeuk@kernel.org, dan.j.williams@intel.com, surenb@google.com,
 vbabka@suse.cz, paul@paul-moore.com, joshua.hahnjy@gmail.com,
 brauner@kernel.org, quic_eberman@quicinc.com, rakie.kim@sk.com,
 cgzones@googlemail.com, bharata@amd.com, linux-erofs@lists.ozlabs.org,
 kent.overstreet@linux.dev, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, pankaj.gupta@amd.com,
 linux-security-module@vger.kernel.org, lihongbo22@huawei.com,
 linux-fsdevel@vger.kernel.org, pbonzini@redhat.com, akpm@linux-foundation.org,
 vannapurve@google.com, suzuki.poulose@arm.com, rppt@kernel.org, jgg@nvidia.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 25.09.25 13:44, Garg, Shivank wrote:
> 
> 
> On 9/25/2025 8:20 AM, Sean Christopherson wrote:
>> My apologies for the super late feedback.  None of this is critical (mechanical
>> things that can be cleaned up after the fact), so if there's any urgency to
>> getting this series into 6.18, just ignore it.
>>
>> On Wed, Aug 27, 2025, Ackerley Tng wrote:
>>> Shivank Garg <shivankg@amd.com> writes:
>>> @@ -463,11 +502,70 @@ bool __weak kvm_arch_supports_gmem_mmap(struct kvm *kvm)
>>>   	return true;
>>>   }
>>>
>>> +static struct inode *kvm_gmem_inode_create(const char *name, loff_t size,
>>> +					   u64 flags)
>>> +{
>>> +	struct inode *inode;
>>> +
>>> +	inode = anon_inode_make_secure_inode(kvm_gmem_mnt->mnt_sb, name, NULL);
>>> +	if (IS_ERR(inode))
>>> +		return inode;
>>> +
>>> +	inode->i_private = (void *)(unsigned long)flags;
>>> +	inode->i_op = &kvm_gmem_iops;
>>> +	inode->i_mapping->a_ops = &kvm_gmem_aops;
>>> +	inode->i_mode |= S_IFREG;
>>> +	inode->i_size = size;
>>> +	mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
>>> +	mapping_set_inaccessible(inode->i_mapping);
>>> +	/* Unmovable mappings are supposed to be marked unevictable as well. */
>>> +	WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
>>> +
>>> +	return inode;
>>> +}
>>> +
>>> +static struct file *kvm_gmem_inode_create_getfile(void *priv, loff_t size,
>>> +						  u64 flags)
>>> +{
>>> +	static const char *name = "[kvm-gmem]";
>>> +	struct inode *inode;
>>> +	struct file *file;
>>> +	int err;
>>> +
>>> +	err = -ENOENT;
>>> +	/* __fput() will take care of fops_put(). */
>>> +	if (!fops_get(&kvm_gmem_fops))
>>> +		goto err;
>>> +
>>> +	inode = kvm_gmem_inode_create(name, size, flags);
>>> +	if (IS_ERR(inode)) {
>>> +		err = PTR_ERR(inode);
>>> +		goto err_fops_put;
>>> +	}
>>> +
>>> +	file = alloc_file_pseudo(inode, kvm_gmem_mnt, name, O_RDWR,
>>> +				 &kvm_gmem_fops);
>>> +	if (IS_ERR(file)) {
>>> +		err = PTR_ERR(file);
>>> +		goto err_put_inode;
>>> +	}
>>> +
>>> +	file->f_flags |= O_LARGEFILE;
>>> +	file->private_data = priv;
>>> +
>>> +	return file;
>>> +
>>> +err_put_inode:
>>> +	iput(inode);
>>> +err_fops_put:
>>> +	fops_put(&kvm_gmem_fops);
>>> +err:
>>> +	return ERR_PTR(err);
>>> +}
>>
>> I don't see any reason to add two helpers.  It requires quite a bit more lines
>> of code due to adding more error paths and local variables, and IMO doesn't make
>> the code any easier to read.
>>
>> Passing in "gmem" as @priv is especially ridiculous, as it adds code and
>> obfuscates what file->private_data is set to.
>>
>> I get the sense that the code was written to be a "replacement" for common APIs,
>> but that is nonsensical (no pun intended).
>>
>>>   static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
>>>   {
>>> -	const char *anon_name = "[kvm-gmem]";
>>>   	struct kvm_gmem *gmem;
>>> -	struct inode *inode;
>>>   	struct file *file;
>>>   	int fd, err;
>>>
>>> @@ -481,32 +579,16 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
>>>   		goto err_fd;
>>>   	}
>>>
>>> -	file = anon_inode_create_getfile(anon_name, &kvm_gmem_fops, gmem,
>>> -					 O_RDWR, NULL);
>>> +	file = kvm_gmem_inode_create_getfile(gmem, size, flags);
>>>   	if (IS_ERR(file)) {
>>>   		err = PTR_ERR(file);
>>>   		goto err_gmem;
>>>   	}
>>>
>>> -	file->f_flags |= O_LARGEFILE;
>>> -
>>> -	inode = file->f_inode;
>>> -	WARN_ON(file->f_mapping != inode->i_mapping);
>>> -
>>> -	inode->i_private = (void *)(unsigned long)flags;
>>> -	inode->i_op = &kvm_gmem_iops;
>>> -	inode->i_mapping->a_ops = &kvm_gmem_aops;
>>> -	inode->i_mode |= S_IFREG;
>>> -	inode->i_size = size;
>>> -	mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
>>> -	mapping_set_inaccessible(inode->i_mapping);
>>> -	/* Unmovable mappings are supposed to be marked unevictable as well. */
>>> -	WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
>>> -
>>>   	kvm_get_kvm(kvm);
>>>   	gmem->kvm = kvm;
>>>   	xa_init(&gmem->bindings);
>>> -	list_add(&gmem->entry, &inode->i_mapping->i_private_list);
>>> +	list_add(&gmem->entry, &file_inode(file)->i_mapping->i_private_list);
>>
>> I don't understand this change?  Isn't file_inode(file) == inode?
>>
>> Compile tested only, and again not critical, but it's -40 LoC...
>>
>>
> 
> Thanks.
> I did functional testing and it works fine.

I can queue this instead. I guess I can reuse the patch description and 
add Sean as author + add his SOB (if he agrees).

Let me take a look at the patch later in more detail.

-- 
Cheers

David / dhildenb



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
