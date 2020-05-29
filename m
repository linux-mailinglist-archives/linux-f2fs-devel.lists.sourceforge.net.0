Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4CA1E8B55
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 30 May 2020 00:27:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jenTb-0007NH-5F; Fri, 29 May 2020 22:27:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bart.vanassche@gmail.com>) id 1jenTa-0007NB-En
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 May 2020 22:27:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uj3jOfu9sZgVkoy6z1bnGkhIhe/u5i7DZ1LHuEhUq4k=; b=IHjIwudfIfxNobR4A81r56m1XB
 smGmgyGuNNpGgZ9rcwxg/0mK1tWJuadbLXoffyohuZ2Q0SbRUWsYQzKsPJd3G15Ha2yinZM7qqLYB
 Ivzp7w244gGsHRju+ivuFcDqtqIoqHGJ6rYEbDDe5sv+X/twIwt5WLM7G2QLhhmL5WYE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uj3jOfu9sZgVkoy6z1bnGkhIhe/u5i7DZ1LHuEhUq4k=; b=RjB6bEY4u0C8ttW/IvQTGjQkGj
 Lf7erZ3+XeB83ALx6AjBf3HEsSUPRAtgpbrxVwLm5Uh9e3mxXb/J8urHQY2rtZu1A9r5kJFvMjqB/
 yOoz+Y0M4EnmIKP//45MlyPOMrUTOVdbDeo1PH/WdcnOXgyKotcdJAogFL22bYcWaNf0=;
Received: from mail-pf1-f195.google.com ([209.85.210.195])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jenTX-000EzD-Ta
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 May 2020 22:27:42 +0000
Received: by mail-pf1-f195.google.com with SMTP id v2so505420pfv.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 29 May 2020 15:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=uj3jOfu9sZgVkoy6z1bnGkhIhe/u5i7DZ1LHuEhUq4k=;
 b=lPzSkASpDh+NcjaIfMrVkM38iE+QRy2yQeC8tKkWuqe6b89iV4kRluDQwRALJqLgjl
 l171xeXM8y4tVxe14eBqUi0I8FJRtXIWyQgzo3b23BSHAi6U5FQOi4qV6YRTj1ligCMA
 8kr0Forf5/hv2JXkgq3JzanFMRIwlfPm9NzYzcyUMNK70p1RxuBShJ5D+zFDAgRUYj78
 72evramUAeL596R/f+EFZ5rJwZhA0H6MdR/eRfVj+pg0CdI8XVGQjhquC93V6IFfNvzd
 6xH4CrDeHD2hUMRDBILFW7Ww5KUOHPzAUjooeMytDwwK2SwbJozupRx9J0jFeJNvTsUl
 a4Og==
X-Gm-Message-State: AOAM5323cEzHd4wkZ+wJEgKOokbiXKdkUw5j5MmAu7FGTwCchwJjgQVH
 xAsiOmE1YCPKdWE8Ra/qE/4=
X-Google-Smtp-Source: ABdhPJzkx0rRv4fPXpaH+eGPI9Rz92YeiO90Kl2s/syEtIcubIlPO+kx/PaWYdL/3NTAiK6BZEWOCA==
X-Received: by 2002:a63:1312:: with SMTP id i18mr10339525pgl.142.1590791254159; 
 Fri, 29 May 2020 15:27:34 -0700 (PDT)
Received: from ?IPv6:2601:647:4000:d7:9d55:11e:7174:3ec6?
 ([2601:647:4000:d7:9d55:11e:7174:3ec6])
 by smtp.gmail.com with ESMTPSA id g7sm349470pjs.48.2020.05.29.15.27.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2020 15:27:33 -0700 (PDT)
To: Matthew Wilcox <willy@infradead.org>, Kaitao Cheng <pilgrimtao@gmail.com>
References: <20200529141100.37519-1-pilgrimtao@gmail.com>
 <20200529202713.GC19604@bombadil.infradead.org>
From: Bart Van Assche <bvanassche@acm.org>
Autocrypt: addr=bvanassche@acm.org; prefer-encrypt=mutual; keydata=
 mQENBFSOu4oBCADcRWxVUvkkvRmmwTwIjIJvZOu6wNm+dz5AF4z0FHW2KNZL3oheO3P8UZWr
 LQOrCfRcK8e/sIs2Y2D3Lg/SL7qqbMehGEYcJptu6mKkywBfoYbtBkVoJ/jQsi2H0vBiiCOy
 fmxMHIPcYxaJdXxrOG2UO4B60Y/BzE6OrPDT44w4cZA9DH5xialliWU447Bts8TJNa3lZKS1
 AvW1ZklbvJfAJJAwzDih35LxU2fcWbmhPa7EO2DCv/LM1B10GBB/oQB5kvlq4aA2PSIWkqz4
 3SI5kCPSsygD6wKnbRsvNn2mIACva6VHdm62A7xel5dJRfpQjXj2snd1F/YNoNc66UUTABEB
 AAG0JEJhcnQgVmFuIEFzc2NoZSA8YnZhbmFzc2NoZUBhY20ub3JnPokBOQQTAQIAIwUCVI67
 igIbAwcLCQgHAwIBBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFcPTXFzhAJ8QkH/1AdXblKL65M
 Y1Zk1bYKnkAb4a98LxCPm/pJBilvci6boefwlBDZ2NZuuYWYgyrehMB5H+q+Kq4P0IBbTqTa
 jTPAANn62A6jwJ0FnCn6YaM9TZQjM1F7LoDX3v+oAkaoXuq0dQ4hnxQNu792bi6QyVdZUvKc
 macVFVgfK9n04mL7RzjO3f+X4midKt/s+G+IPr4DGlrq+WH27eDbpUR3aYRk8EgbgGKvQFdD
 CEBFJi+5ZKOArmJVBSk21RHDpqyz6Vit3rjep7c1SN8s7NhVi9cjkKmMDM7KYhXkWc10lKx2
 RTkFI30rkDm4U+JpdAd2+tP3tjGf9AyGGinpzE2XY1K5AQ0EVI67igEIAKiSyd0nECrgz+H5
 PcFDGYQpGDMTl8MOPCKw/F3diXPuj2eql4xSbAdbUCJzk2ETif5s3twT2ER8cUTEVOaCEUY3
 eOiaFgQ+nGLx4BXqqGewikPJCe+UBjFnH1m2/IFn4T9jPZkV8xlkKmDUqMK5EV9n3eQLkn5g
 lco+FepTtmbkSCCjd91EfThVbNYpVQ5ZjdBCXN66CKyJDMJ85HVr5rmXG/nqriTh6cv1l1Js
 T7AFvvPjUPknS6d+BETMhTkbGzoyS+sywEsQAgA+BMCxBH4LvUmHYhpS+W6CiZ3ZMxjO8Hgc
 ++w1mLeRUvda3i4/U8wDT3SWuHcB3DWlcppECLkAEQEAAYkBHwQYAQIACQUCVI67igIbDAAK
 CRBxXD01xc4QCZ4dB/0QrnEasxjM0PGeXK5hcZMT9Eo998alUfn5XU0RQDYdwp6/kMEXMdmT
 oH0F0xB3SQ8WVSXA9rrc4EBvZruWQ+5/zjVrhhfUAx12CzL4oQ9Ro2k45daYaonKTANYG22y
 //x8dLe2Fv1By4SKGhmzwH87uXxbTJAUxiWIi1np0z3/RDnoVyfmfbbL1DY7zf2hYXLLzsJR
 mSsED/1nlJ9Oq5fALdNEPgDyPUerqHxcmIub+pF0AzJoYHK5punqpqfGmqPbjxrJLPJfHVKy
 goMj5DlBMoYqEgpbwdUYkH6QdizJJCur4icy8GUNbisFYABeoJ91pnD4IGei3MTdvINSZI5e
Message-ID: <c7a5bbc4-ffc2-6a63-fed3-9874969afc31@acm.org>
Date: Fri, 29 May 2020 15:27:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200529202713.GC19604@bombadil.infradead.org>
Content-Language: en-US
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (bart.vanassche[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.195 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.195 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jenTX-000EzD-Ta
Subject: Re: [f2fs-dev] [PATCH v2] blkdev: Replace blksize_bits() with
 ilog2()
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
Cc: hoeppner@linux.ibm.com, heiko.carstens@de.ibm.com,
 linux-nvme@lists.infradead.org, dhowells@redhat.com, clm@fb.com,
 deepa.kernel@gmail.com, houtao1@huawei.com, hch@lst.de,
 linux-s390@vger.kernel.org, gor@linux.ibm.com, darrick.wong@oracle.com,
 mark@fasheh.com, satyat@google.com, hch@infradead.org, borntraeger@de.ibm.com,
 chaitanya.kulkarni@wdc.com, josef@toxicpanda.com, ming.lei@redhat.com,
 viro@zeniv.linux.org.uk, songmuchun@bytedance.com, dsterba@suse.com,
 jaegeuk@kernel.org, jlbec@evilplan.org, sagi@grimberg.me, axboe@kernel.dk,
 balbi@kernel.org, damien.lemoal@wdc.com, martin.petersen@oracle.com,
 joseph.qi@linux.alibaba.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 asml.silence@gmail.com, linux-btrfs@vger.kernel.org, sth@linux.ibm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020-05-29 13:27, Matthew Wilcox wrote:
> On Fri, May 29, 2020 at 10:11:00PM +0800, Kaitao Cheng wrote:
>> There is a function named ilog2() exist which can replace blksize.
>> The generated code will be shorter and more efficient on some
>> architecture, such as arm64. And ilog2() can be optimized according
>> to different architecture.
> 
> We'd get the same benefit from a smaller patch with just:
> 
> --- a/include/linux/blkdev.h
> +++ b/include/linux/blkdev.h
> @@ -1502,15 +1502,9 @@ static inline int blk_rq_aligned(struct request_queue *q, unsigned long addr,
>  	return !(addr & alignment) && !(len & alignment);
>  }
>  
> -/* assumes size > 256 */
>  static inline unsigned int blksize_bits(unsigned int size)
>  {
> -	unsigned int bits = 8;
> -	do {
> -		bits++;
> -		size >>= 1;
> -	} while (size > 256);
> -	return bits;
> +	return ilog2(size);
>  }
>  
>  static inline unsigned int block_size(struct block_device *bdev)

Hi Matthew,

I had suggested to change all blksize_bits() calls into ilog2() calls
because I think that a single function to calculate the logarithm base 2
is sufficient.

Thanks,

Bart.




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
