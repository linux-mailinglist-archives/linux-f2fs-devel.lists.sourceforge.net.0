Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7141F5D24
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  9 Nov 2019 04:02:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iTH1J-00055M-D9; Sat, 09 Nov 2019 03:02:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bart.vanassche@gmail.com>) id 1iTH1I-00055F-4g
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Nov 2019 03:02:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q9w9/CL3tvrcZwNSUDDdOh70mNMnFLTdHmVRbGH/fsQ=; b=hZPNL94Qqjjvel0hKW4IaNzX78
 9LhURFGPrH1R8eD8h9l2u1ecKneil416RB0mnxG8vAwZKJuZa1bObE8/05wa9sk3ocuXu9x4kzZe4
 Y73ucFR8jCAj+E5L167Wg3Kfxkujo/t2Ahxm00IJytx9A8MuJ9iZg9wDA38IxOjKlBiI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q9w9/CL3tvrcZwNSUDDdOh70mNMnFLTdHmVRbGH/fsQ=; b=FgQ0Fmag5wXPe6nch7el3fAC2Q
 IDydiWd49o+QvkU7PoqhAj/3FsBoOELKiBzbxwkDW2hRlrE/G9gl/6CBPvAwpnHilpFuN87HgC2g0
 fdVnqQyRYBgjf+0Wsr57JGdHWCk7ke9kQNMyPOEuKtUY8cbw8k4G/aRSWMuMhpJNXRAY=;
Received: from mail-pl1-f193.google.com ([209.85.214.193])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iTH1G-007jDF-S9
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Nov 2019 03:02:36 +0000
Received: by mail-pl1-f193.google.com with SMTP id ay6so5168147plb.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 08 Nov 2019 19:02:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q9w9/CL3tvrcZwNSUDDdOh70mNMnFLTdHmVRbGH/fsQ=;
 b=FFtS1e2dOby46DNR9XwC8JSjaCfyE5GpbCZj4Qf14HfKUN5ldJUcmFEguKW6tM450X
 ZMoD4FVYpukP5FWOxTBEkTg8vpPlTZG8bPSnVnj+VvTUleBKR3nd75zA1ZFJmHlMNomS
 /NDTUKNxDkOynGCmT98vu4USI2PAiAcjWXyUbIDLSUKVPbL/Pssl32YZjlSgpdrbYMOo
 mPGzRfb5N7X1OTxha6Tv3j2PrxfFUWAvMhyAScnd10KehF0hwfLnI4Dw9HB70vHqTvFN
 qQJ8bbRDFK1/b8slM03MMp6gWgP3p2Y+xzcIypaOFF1z0qpJt3MYSafC+aNpL4Z4Z6sI
 n1qg==
X-Gm-Message-State: APjAAAUhSsg0y4FqzRMMaMR+bVM9xKOiOANvvyiq/GZy1UIToqzGyl0H
 PbkCTZy4z6muBzKraWDI7is=
X-Google-Smtp-Source: APXvYqznA2/Hflt4r+QC31lnQ7K+Dgy87EIN0nH4QqGDSy7xTZp2MWCmVVsOPoz64ej9OUuavrLuaw==
X-Received: by 2002:a17:902:b482:: with SMTP id
 y2mr5337175plr.128.1573268548891; 
 Fri, 08 Nov 2019 19:02:28 -0800 (PST)
Received: from localhost.localdomain ([2601:647:4000:a8:64c1:7f03:d411:a61])
 by smtp.gmail.com with ESMTPSA id d8sm6983723pfo.47.2019.11.08.19.02.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Nov 2019 19:02:28 -0800 (PST)
To: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Jens Axboe <axboe@kernel.dk>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>,
 Mike Snitzer <snitzer@redhat.com>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
References: <20191108015702.233102-1-damien.lemoal@wdc.com>
 <20191108015702.233102-9-damien.lemoal@wdc.com>
 <6a1e0a08-d65c-b075-9bac-23519e9e91c3@acm.org>
 <BYAPR04MB5816C442BE08F9973C2CDF15E77A0@BYAPR04MB5816.namprd04.prod.outlook.com>
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
Message-ID: <639eae70-bb57-0c49-0ae9-aed8d33df271@acm.org>
Date: Fri, 8 Nov 2019 19:02:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <BYAPR04MB5816C442BE08F9973C2CDF15E77A0@BYAPR04MB5816.namprd04.prod.outlook.com>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (bart.vanassche[at]gmail.com)
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.193 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.1 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iTH1G-007jDF-S9
Subject: Re: [f2fs-dev] [dm-devel] [PATCH 8/9] scsi: sd_zbc: Cleanup
 sd_zbc_alloc_report_buffer()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019-11-08 18:54, Damien Le Moal wrote:
> On 2019/11/09 4:06, Bart Van Assche wrote:
>> On 11/7/19 5:57 PM, Damien Le Moal wrote:
>>> -	buf = vzalloc(bufsize);
>>> -	if (buf)
>>> -		*buflen = bufsize;
>>> +	while (bufsize >= SECTOR_SIZE) {
>>> +		buf = vzalloc(bufsize);
>>> +		if (buf) {
>>> +			*buflen = bufsize;
>>> +			return buf;
>>> +		}
>>> +		bufsize >>= 1;
>>> +	}
>>
>> Hi Damien,
>>
>> Has it been considered to pass the __GFP_NORETRY flag to this vzalloc() 
>> call?
> 
> Do you mean using
> 
> __vmalloc(bufsize,
> 	  GFP_KERNEL | __GFP_ZERO | __GFP_NORETRY, PAGE_KERNEL);
> 
> instead of vzalloc() ? (since we cannot pass GFP flags to vzalloc()...)
> 
> Note that this is called with GFP_NOIO set for the caller context in the
> case of revalidate zones, and default to GFP_KERNEL for
> blkdev_report_zones() unless the caller also tweaks the context memalloc
> flags.

Hi Damien,

Yes, that's what I meant. The following comment from mm/util.c explains
why __GFP_RETRY should be used if it is OK for an allocation to fail:

/*
 * We want to attempt a large physically contiguous block first because
 * it is less likely to fragment multiple larger blocks and therefore
 * contribute to a long term fragmentation less than vmalloc fallback.
 * However make sure that larger requests are not too disruptive - no
 * OOM killer and no allocation failure warnings as we have a fallback.
 */

Thanks,

Bart.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
