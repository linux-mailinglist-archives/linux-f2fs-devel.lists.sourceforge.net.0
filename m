Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BBFC89368
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Nov 2025 11:15:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U3NYKiIeqZyfVcbhwMcl0mqpmYR2nUskU+MTinsUee0=; b=TgtucI/GI/va9JagL/FlTRgAE6
	ViTbUQpBY9h0UFzYqcP0MbWSwxzrN5/x+T3R06DBSiwjYzZPMCnSk75MWDhS30Q3M7YFi+LGd/JU/
	y0h0wUSvj1tK+aGS4NgT2m1B3Wsc6LZR8+K2zgqTPOINENFNXBO9mJooUaRgfAfuU35k=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vOCXy-0002el-6G;
	Wed, 26 Nov 2025 10:14:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vOCXx-0002ea-CA
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Nov 2025 10:14:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wi+SDeiIoLJQ2kckUqTjOMqCDPLpLNM9S07CFUmnZ6s=; b=O5sr1KcmuynsKzQI0hl1Y/btLN
 eqBCyTVskAvXgbpgFe8J4YHCFC5DWp8uL98MqeY32uIySCQ45b6oP0BW8R1rOuP42DHLXAmhJduhG
 JJFGX+M71QkAmrZlcOBfpeNQTdNYqSqKkL6SlXPFeiTVvX2tfZNuvNmCz6Qk516X2KPY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wi+SDeiIoLJQ2kckUqTjOMqCDPLpLNM9S07CFUmnZ6s=; b=YcaOe/Lla84pUto1YB2DPKHjA7
 T81nAnQMAlpFl4yVlmSHARh/u3HwttDYQbHNYJ2FyY3V6XRBtgWvNPtI7cCFxS3v2zevRcxawzsQa
 hj6HKVxk5+zcpa/obz3+2EOzPzoQS5pSINF9qxd0Wszfy49WpR7JojAyyuRwruQZpWCw=;
Received: from mail-pj1-f53.google.com ([209.85.216.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vOCXx-0004df-KK for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Nov 2025 10:14:50 +0000
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-343ea89896eso6617747a91.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 26 Nov 2025 02:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764152079; x=1764756879; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wi+SDeiIoLJQ2kckUqTjOMqCDPLpLNM9S07CFUmnZ6s=;
 b=jx4v8LG3FEGEfVumy8+Aj8tn/gTauNqJCOFNjwbbC7YM9eMW4emN+ZfpJJHdJ14J2f
 recgiFywnxbWdjLucZpZIFT9BQwQqU8cJoLDXzFjP+UVXUzf4hoo48zXwcwAYXjAVyS3
 3LsTHHl6dpyEse/MYPquNy8NS6XBPYvv06izuXz37UHRM3QkmouB0Z+ovxZQbuCAYo9t
 7vUWfoVf9KVEBEUEcllt38J+FdyvXuSOYxzB6c0U4G213pgoV5t3SHKOINF34AYjvTe7
 pKzFtZJq25W77zLiHSVAzjzUqA/Fqucq4fTP9BIRSxE7kgbQlB1gVP5aBTuvmrT/lMuh
 AKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764152079; x=1764756879;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wi+SDeiIoLJQ2kckUqTjOMqCDPLpLNM9S07CFUmnZ6s=;
 b=Fkza/u7EatxBFjcsFJsuINKdsKaM6E8n+GP2hkUf7tZyNXiqWsW7X80MfdSD3ko7dh
 W1oM+CISiJovNVqN4bLDiPtzZvs6eJdlXaTiKWNCvfwssRNZnbkswssblSQRsRv+M3I0
 /XCFEGFrMVbqGvHECj7gPNdNddvB/NeGyZwk8MUyn8lKL/pCOpfUtIbctznMBLm87kF8
 pvYCF9TqTB/UaKdzaIH1uTJbf/ZG26ehCGYhDOg0PS+nurrxsFWvFExTdNU1bN+D3IMY
 TnDAyB2mGyNf0Ffyd+uC2I5Sufq4UDQpxnU+MA2pXf9/RCm92R7X97dKpfjpTQALSBQP
 Rafg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpkMYjdl/dIYotZUY3S1WMxWCGQaMG0x6kf3q2WimHwWXCGMLhE1xs6LWf7l0K7FzdPgfNthOU5V+X1lY83jbd@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyiCkhsxAGgIBh5iT9C15i1ubfMI5whxuHmNcYjWNx5JEdOFgTn
 iakzFpHd0kttVC4K0TsIRjL74lJsFhyAN+mj8xhHdJr5ibmAI+nRkvBP
X-Gm-Gg: ASbGnctoxhG9sQ+UR2TGze5LMay3PX11ie8CpezKpoRFzekGe2Ew3gweOAGxBKyddaF
 I2VHY7J0RdYr/cFW+N/NBY8+LAhQo+LeUpT1ThRRKSrnO3HulyBw+hAH5IPf093mEkBIkZPiVP1
 D2nuNFB96B/35ipsyJDvLYBrL0KTJf64r6/B014uzzehdbqIPiEI1xJbmafx5cwwiC836ZhhPcu
 /CPVaQWWWbyjgo9nHdXUnbvvg/iJlrjFgfXX51Q7qNfGHeRxyAahSJ7IhCPnjPha+W71XLdHv8V
 dowz3M07xQGL6IsAI2Y+YOO9HJzx18Z0lzj5VP8r340jntwUD8RclDedzrbL0Zd3N7KzyiP90jw
 f9oUjoBwhrTRsbrWs5jBLUU5s0bgrIk78y+yRL55jsSeqVWpuZzD68NUwlPuhaaGS55MAUGHjM6
 7gi80wyar/BJ91tbXZG++MIkFY/4bKlA==
X-Google-Smtp-Source: AGHT+IFQEabv4PNtolwpa8n5AuKpK1H58aTBlKZdu0dHQlwrZWrJMaYnh5FBOmSumqqz/nyBBS5z/A==
X-Received: by 2002:a17:90b:1c91:b0:32b:df0e:9283 with SMTP id
 98e67ed59e1d1-34733f3e84fmr16715848a91.34.1764152078789; 
 Wed, 26 Nov 2025 02:14:38 -0800 (PST)
Received: from [10.189.138.37] ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7c3f0b63dbcsm20905512b3a.50.2025.11.26.02.14.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 02:14:38 -0800 (PST)
Message-ID: <e40cb47c-9f92-4982-bf3f-45ec9f2a1681@gmail.com>
Date: Wed, 26 Nov 2025 18:14:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>, axboe@kernel.dk,
 agk@redhat.com, snitzer@kernel.org, mpatocka@redhat.com, song@kernel.org,
 yukuai@fnnas.com, hch@lst.de, sagi@grimberg.me, kch@nvidia.com,
 jaegeuk@kernel.org, chao@kernel.org, cem@kernel.org
References: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
 <20251124234806.75216-5-ckulkarnilinux@gmail.com>
Content-Language: en-US
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
In-Reply-To: <20251124234806.75216-5-ckulkarnilinux@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/25/25 07:48,
 Chaitanya Kulkarni wrote: > __blkdev_issue_discard()
 always returns 0, making the error checking > in nvmet_bdev_discard_range()
 dead code. > > Kill the function nvmet_bdev_discard [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.53 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vOCXx-0004df-KK
Subject: Re: [f2fs-dev] [PATCH V3 4/6] nvmet: ignore discard return value
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
Cc: dm-devel@lists.linux.dev, linux-block@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-raid@vger.kernel.org, bpf@vger.kernel.org, linux-xfs@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


On 11/25/25 07:48, Chaitanya Kulkarni wrote:
> __blkdev_issue_discard() always returns 0, making the error checking
> in nvmet_bdev_discard_range() dead code.
> 
> Kill the function nvmet_bdev_discard_range() and call
> __blkdev_issue_discard() directly from nvmet_bdev_execute_discard(),
> since no error handling is needed anymore for __blkdev_issue_discard()
> call.
> 
> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
> Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
> ---
>   drivers/nvme/target/io-cmd-bdev.c | 28 +++++++---------------------
>   1 file changed, 7 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/nvme/target/io-cmd-bdev.c b/drivers/nvme/target/io-cmd-bdev.c
> index 8d246b8ca604..ca7731048940 100644
> --- a/drivers/nvme/target/io-cmd-bdev.c
> +++ b/drivers/nvme/target/io-cmd-bdev.c
> @@ -362,29 +362,14 @@ u16 nvmet_bdev_flush(struct nvmet_req *req)
>   	return 0;
>   }
>   
> -static u16 nvmet_bdev_discard_range(struct nvmet_req *req,
> -		struct nvme_dsm_range *range, struct bio **bio)
> -{
> -	struct nvmet_ns *ns = req->ns;
> -	int ret;
> -
> -	ret = __blkdev_issue_discard(ns->bdev,
> -			nvmet_lba_to_sect(ns, range->slba),
> -			le32_to_cpu(range->nlb) << (ns->blksize_shift - 9),
> -			GFP_KERNEL, bio);
> -	if (ret && ret != -EOPNOTSUPP) {
> -		req->error_slba = le64_to_cpu(range->slba);
> -		return errno_to_nvme_status(req, ret);
> -	}
> -	return NVME_SC_SUCCESS;
> -}
> -
>   static void nvmet_bdev_execute_discard(struct nvmet_req *req)
>   {
> +	struct nvmet_ns *ns = req->ns;
>   	struct nvme_dsm_range range;
>   	struct bio *bio = NULL;
> +	sector_t nr_sects;
>   	int i;
> -	u16 status;
> +	u16 status = NVME_SC_SUCCESS;
>   
>   	for (i = 0; i <= le32_to_cpu(req->cmd->dsm.nr); i++) {
>   		status = nvmet_copy_from_sgl(req, i * sizeof(range), &range,
> @@ -392,9 +377,10 @@ static void nvmet_bdev_execute_discard(struct nvmet_req *req)
>   		if (status)
>   			break;
>   
> -		status = nvmet_bdev_discard_range(req, &range, &bio);
> -		if (status)
> -			break;
> +		nr_sects = le32_to_cpu(range.nlb) << (ns->blksize_shift - 9);
> +		__blkdev_issue_discard(ns->bdev,
> +				nvmet_lba_to_sect(ns, range.slba), nr_sects,
> +				GFP_KERNEL, &bio);

We also need to check for memory allocation errors in
__blkdev_issue_discard(). However, this cannot be done by simply
checking if bio is NULL. Similar to the issue with xfs_discard_extents,
once __blkdev_issue_discard()->blk_alloc_discard_bio() succeeds once,
any subsequent memory allocation failures cannot be detected by checking
if bio is NULL.

Yongpeng,

>   	}
>   
>   	if (bio) {



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
