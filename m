Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A234A80225
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Aug 2019 23:15:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hteth-0005Yx-TX; Fri, 02 Aug 2019 21:15:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <axboe@kernel.dk>) id 1hteth-0005Yk-4p
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Aug 2019 21:15:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yhQyk8IoMkg6VHquCP646/YjI159eG2Qm/tmGkUGWc0=; b=bR9ERkj7zmISXNJFh9ciwg0wXq
 q7QHVytHDrz85OcmvzX1VRawT5HiE7oGEjvIyMqMLd0xUDmUH5ZORUHs8xByboMzVr0tMjf9aB1y2
 IS3sJZgNVRKUYT53DYPCQ0l1n3yWjoUayWCJ1oPu99REbsyq8Utytd2/GauUaRXLaQqY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yhQyk8IoMkg6VHquCP646/YjI159eG2Qm/tmGkUGWc0=; b=kE/trytYO8qQo1A9Owkb5MCkto
 6ZDMib9lI/oLdq9L1WN4X8bi0LCv7sKoz2K1PCq7I7SYWU+vozhn5eZ0YXlMS/Sa/b1zWcIrOZkn6
 Nx1JtaHmS+3HnnQm88yYwQagabuX7gk1PlQoY6pSduCAVf+2+7Mz8n9l/1hXZkOykLfQ=;
Received: from mail-pl1-f194.google.com ([209.85.214.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1htetf-008ZTJ-6K
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Aug 2019 21:15:33 +0000
Received: by mail-pl1-f194.google.com with SMTP id az7so34064621plb.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 02 Aug 2019 14:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yhQyk8IoMkg6VHquCP646/YjI159eG2Qm/tmGkUGWc0=;
 b=eLknO8W268WA1BOZZOqsQaGOcE36fB6+Qco2TDByp03Y3syvQo5t3u8iNqWR50TWV2
 yKGN5VSl9gVYeJjvcjT00vdkjamt7KhrcEXeRhqBeCQUXAahxdTLxkNBs5/6PY3irFs/
 zsn2L/wm2rw7vPlGH+o8OMsEmWjT5prgg4wmdWTVJQSf5dnDA/0CXymykK6QiUi2J1OL
 BAuom5MZxhRmfl6daNIf5Pan7pvVyfdQi1GRzF6u93xJ8Di2qcmlFMLxmjBwnw4HqD5x
 8d8l39h5NuQnMXSHmGOMa7V2jkyLig9ufONEn5Gsy0Or8kKrI1y4OvMIRUKmqo6KSTKj
 o3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yhQyk8IoMkg6VHquCP646/YjI159eG2Qm/tmGkUGWc0=;
 b=S7fNyJyKB3+b0TZarylqfjjpMl/2tOB62mizI16aKRUas2pA3oCN8VMyWMYUIrD/bg
 4URfG2s0IPps71rZ6r+R/rs4OZT6jENmglNurHiXtzTVB0rhEQ8mbitugjHELWMFK/8z
 qX/3wFu+yVTURhodK2tYEU4+ZXgs3K+EEf2kqrEZrnzKobB9rjvKbMDzR1NtiEQ1J/8u
 tMEXUW1NdMsBj6kkCIqDiw0AhcLz+vCmK8Ka/BGmonGnmFnIzmlLRck1FGRqBSRdY3ZC
 ihgvvuG388464D68DFeEnWrl9iAOipofrFmqgXxT6eUiLKWM0aABhWtnl8LR2yishGzs
 O7Sg==
X-Gm-Message-State: APjAAAW0XLvA3jH39Y3VR75jypFKmv1NcxkWsd0+/Ohg7fy8jm2hFrm2
 FzPY2y0/BDIgV6XoC6DjFek=
X-Google-Smtp-Source: APXvYqxnhhUgag8ACgmGz+kw/tadhC/nQqXCHeHfBG4vinB3NzD3w42LsuY+BlG0KvA6j1CIk0ZBBA==
X-Received: by 2002:a17:902:543:: with SMTP id
 61mr132651767plf.20.1564779105704; 
 Fri, 02 Aug 2019 13:51:45 -0700 (PDT)
Received: from [172.31.98.58] (rrcs-76-79-101-187.west.biz.rr.com.
 [76.79.101.187])
 by smtp.gmail.com with ESMTPSA id v13sm87924292pfn.109.2019.08.02.13.51.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 02 Aug 2019 13:51:44 -0700 (PDT)
To: Satya Tangirala <satyat@google.com>, linux-block@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
References: <20190710225609.192252-1-satyat@google.com>
 <20190710225609.192252-4-satyat@google.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <c5bffc1e-ce6a-0060-cf55-e3dc446d7049@kernel.dk>
Date: Fri, 2 Aug 2019 13:51:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190710225609.192252-4-satyat@google.com>
Content-Language: en-US
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.194 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1htetf-008ZTJ-6K
Subject: Re: [f2fs-dev] [PATCH 3/8] block: blk-crypto for Inline Encryption
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
Cc: Kuohong Wang <kuohong.wang@mediatek.com>,
 Ladvine D Almeida <ladvine.dalmeida@synopsys.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Parshuram Raju Thombare <pthombar@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/10/19 4:56 PM, Satya Tangirala wrote:
> We introduce blk-crypto, which manages programming keyslots for struct
> bios. With blk-crypto, filesystems only need to call bio_crypt_set_ctx with
> the encryption key, algorithm and data_unit_num; they don't have to worry
> about getting a keyslot for each encryption context, as blk-crypto handles
> that. Blk-crypto also makes it possible for layered devices like device
> mapper to make use of inline encryption hardware.
> 
> Blk-crypto delegates crypto operations to inline encryption hardware when
> available, and also contains a software fallback to the kernel crypto API.
> For more details, refer to Documentation/block/blk-crypto.txt.
> 
> Known issues:
> 1) We're allocating crypto_skcipher in blk_crypto_keyslot_program, which
> uses GFP_KERNEL to allocate memory, but this function is on the write
> path for IO - we need to add support for specifying a different flags
> to the crypto API.

That's a must-fix before merging, btw.

> @@ -1018,7 +1019,9 @@ blk_qc_t generic_make_request(struct bio *bio)
>   			/* Create a fresh bio_list for all subordinate requests */
>   			bio_list_on_stack[1] = bio_list_on_stack[0];
>   			bio_list_init(&bio_list_on_stack[0]);
> -			ret = q->make_request_fn(q, bio);
> +
> +			if (!blk_crypto_submit_bio(&bio))
> +				ret = q->make_request_fn(q, bio);
>   
>   			blk_queue_exit(q);

Why isn't this just stacking the ->make_request_fn() instead? Then we
could get this out of the hot path.

-- 
Jens Axboe



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
