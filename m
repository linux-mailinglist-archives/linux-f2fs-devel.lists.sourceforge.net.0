Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC6555B144
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 26 Jun 2022 12:44:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o5Pl4-00084L-T5; Sun, 26 Jun 2022 10:44:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <avi@scylladb.com>) id 1o5Pl3-00084E-4S
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 26 Jun 2022 10:44:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zy1Ih5xnZLYR31pscqnLVprtiUwTUenQdef+MWxKKMA=; b=ARuv5rCpR+pZrgakXYWG3Xrhok
 qhbt0EIqUjmn5hkb+KsvWm/OjS6uhP/ihZUD+ugz0Jh0w7LmhfiQPH+9kZFFSV5IOz3tWtRrnY3fZ
 uYuEUk1jp9bvHozNarzvfuNnFyRJEjjXMseSweHDs5+s9XeJH0UafY4Cm95nlWxfYSdk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zy1Ih5xnZLYR31pscqnLVprtiUwTUenQdef+MWxKKMA=; b=OZSd4z0T7Vb52CrwKNlVkKon80
 stMzo73g3uk+ro5wpxeoBZmaeAOuSCTfbdUE8Cj8Rj81xKoqbHOOVhvhySuQzKsZtk4f2TGwWkjVP
 jMmP6MCjJukmKmtQY4plx9iK8AReBJ1FS8nVrdKaL1XH9VleCJHH4iDte2DcRIX0Iq7Y=;
Received: from mail-ej1-f51.google.com ([209.85.218.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1o5Pl0-00053P-89
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 26 Jun 2022 10:44:49 +0000
Received: by mail-ej1-f51.google.com with SMTP id d2so1602929ejy.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 26 Jun 2022 03:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scylladb.com; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zy1Ih5xnZLYR31pscqnLVprtiUwTUenQdef+MWxKKMA=;
 b=oBfck6+XscL2VeZ+MF8T02/Q0GkUoM1jN27mDG9zEwpHpTEFhiBjXDUOLSiVvUMvGM
 2sicpmI3J24iRKAA/5RxJuX+VnPWJOq0n/0CFMTZwa0ERpZlFUFFpw22CJ5BPYHwH0NF
 xzEehUBouX/IGDTkYFQ5Ev+S6CtOjASt8p1uYEBuekmHqcuo9NYiLJuBQ11SgTbV+s4Q
 h+eTO5wsRZUjz6KnScQnB5ClLMK88d5eMfaRvO0FBf2N/bHMRc5rTU2sCUNWnro6M8G+
 X6ErBcZ5i27Gmfz0rtcLWgvjPPhKS2RKwPNQrtAxFkITjgYwLdz6VFt3v67paBWA0AQH
 wxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zy1Ih5xnZLYR31pscqnLVprtiUwTUenQdef+MWxKKMA=;
 b=q+xpwN8MA+VhBmKsQmWcsC8PKggaQMVP9Bx1kiyH6lYyzoMqbIUME/XbLWnnx641Tx
 +Gg/DRkqD+TaT22qajMrWwnxsbSHCnKgeSc5GBXxexbIP4hM1TXn1iSUBW/GClQ1qZdp
 Gq0mDd4NzMcLRVmFrKZ2JBdWynjnmEILhcutqs2fWROvoG/jd2NjVn4tl0n+KEiqSwvc
 PYwowSRhRoQZ7cKbNdMEdM7rrEAwNrB+Kxe+PgA7zyxDlZeu/pxbwNHWcuW5ycf3KPs1
 jngdgnshO4xvKk39OadiUDiBOtA+vdn38R3mELMj9F8tTM15MITqLEVE9K86+IhQMhMA
 6L4A==
X-Gm-Message-State: AJIora+6MEc81KFRFKQ3srstMjJ/8Kw+p1ugDLzcKgOTJPH7GHtXMIf7
 uH/hnDHXyxz/x2iI909vJ2UDDSQFNHlYRw==
X-Google-Smtp-Source: AGRyM1tv3WbUrJipd2xn/7Heq9RfOQOWLVedSKXLcrr95zGLiEg/pzWHi319OrG4Zqw5VAKidmbPoA==
X-Received: by 2002:a05:6402:26d5:b0:435:aba2:9495 with SMTP id
 x21-20020a05640226d500b00435aba29495mr10073740edd.133.1656238825841; 
 Sun, 26 Jun 2022 03:20:25 -0700 (PDT)
Received: from [10.0.0.1] (system.cloudius-systems.com. [199.203.229.89])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a170906340400b0070abf371274sm3634422ejb.136.2022.06.26.03.20.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jun 2022 03:20:25 -0700 (PDT)
Message-ID: <23067de5-7955-7f58-f8ad-70a812602ac8@scylladb.com>
Date: Sun, 26 Jun 2022 13:20:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Christoph Hellwig <hch@infradead.org>
References: <20220616201506.124209-1-ebiggers@kernel.org>
 <20220616201506.124209-2-ebiggers@kernel.org>
 <6c06b2d4-2d96-c4a6-7aca-5147a91e7cf2@scylladb.com>
 <YrgOUw6YM2c6k59U@infradead.org>
Organization: ScyllaDB
In-Reply-To: <YrgOUw6YM2c6k59U@infradead.org>
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 26/06/2022 10.44, Christoph Hellwig wrote: > On Sun, Jun
 19, 2022 at 02:30:47PM +0300, Avi Kivity wrote: >>> * stx_dio_offset_align:
 the alignment (in bytes) required for file >>> offsets and I/O s [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.51 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.51 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1o5Pl0-00053P-89
Subject: Re: [f2fs-dev] [PATCH v3 1/8] statx: add direct I/O alignment
 information
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
From: Avi Kivity via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Avi Kivity <avi@scylladb.com>
Cc: linux-xfs@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, Keith Busch <kbusch@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


On 26/06/2022 10.44, Christoph Hellwig wrote:
> On Sun, Jun 19, 2022 at 02:30:47PM +0300, Avi Kivity wrote:
>>> * stx_dio_offset_align: the alignment (in bytes) required for file
>>>     offsets and I/O segment lengths for DIO, or 0 if DIO is not supported
>>>     on the file.  This will only be nonzero if stx_dio_mem_align is
>>>     nonzero, and vice versa.
>>
>> If you consider AIO, this is actually three alignments:
>>
>> 1. offset alignment for reads (sector size in XFS)
>>
>> 2. offset alignment for overwrites (sector size in XFS since ed1128c2d0c87e,
>> block size earlier)
>>
>> 3. offset alignment for appending writes (block size)
>>
>>
>> This is critical for linux-aio since violation of these alignments will
>> stall the io_submit system call. Perhaps io_uring handles it better by
>> bouncing to a workqueue, but there is a significant performance and latency
>> penalty for that.
> I think you are mixing things up here.


Yes.


> We actually have two limits that
> matter:
>
>   a) the hard limit, which if violated will return an error.
>      This has been sector size for all common file systems for years,
>      but can be bigger than that with fscrypt in the game (which
>      triggered this series)
>   b) an optimal write size, which can be done asynchronous and
>      without exclusive locking.
>      This is what your cases 2) and 3) above refer to.
>
> Exposting this additional optimal performance size might be a good idea
> in addition to what is proposed here, even if matters a little less
> with io_uring.  But I'm not sure I'd additional split it into append
> vs overwrite vs hole filling but just round up to the maximum of those.


Rounding up will penalize database workloads, with and without io_uring. 
Database commit logs are characterized by frequent small writes. Telling 
the database to round up to 4k vs 512 bytes means large write 
amplification. The disk probably won't care (or maybe it will - it will 
also have to generate more erase blocks), but the database will run out 
of commitlog space much sooner and will have to compensate in expensive 
ways.


Of course, people that care can continue to use internal filesystem 
knowledge, and maybe there are few enough of those that the API can 
choose to ignore them.




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
