Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E54F547B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Nov 2019 20:06:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iT9ak-0000dI-3U; Fri, 08 Nov 2019 19:06:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bart.vanassche@gmail.com>) id 1iT9aj-0000dB-EX
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 19:06:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KUO65dsRHtTENunurXMA0yCDuIh5HnQm2qnH0n9rKZk=; b=bv+kBwclMbT2mw5u2rM2i1HSPF
 Y/7KLUy+wlkvQpq++vJNGc/4kmtdQVkaGEu7kVdpiyO5HaFLwZcR35lGQthDgnzV4jcbKdhBY27YA
 76v6vs76mcTevXtV5mXUckAgnXgqgwwSz4LzpF44QaAlX8fWrzYs5bxyYhxvj+mKBpiA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KUO65dsRHtTENunurXMA0yCDuIh5HnQm2qnH0n9rKZk=; b=Hc9C8B0ORNMc7F4TgCNEkVo4YN
 4iGVyyuQ1WAVE4OJDvWngRuOwK24WZPNWJbd3YK8ncDIxsmqrbSsr2ABwOBlE/8WIIYpE+h9s2rdz
 hgaMZjZqYSg8T2PhXhVQAXpeMa9XfAIPF7EM6JHV4WY6x6ZWl7ustVmtvA1GjT8ZqGIM=;
Received: from mail-pl1-f196.google.com ([209.85.214.196])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iT9ai-005rjf-7v
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 19:06:41 +0000
Received: by mail-pl1-f196.google.com with SMTP id k7so4513128pll.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 08 Nov 2019 11:06:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KUO65dsRHtTENunurXMA0yCDuIh5HnQm2qnH0n9rKZk=;
 b=XAgMPx0UdX8z7lWldnjCI1zdgbSlehLEYvcd7B+QZ26mGGodr4E2STf0QWJznK586k
 gCiNdhC5s817ux0BySmH6967AS9sc19J5vXetB5WT+gruCvkynNjTa5ecMYbcpAZyaqU
 38K7bEuO8yhmrVAMsgMTjaQ9KFWzX/x3djtUBdI4pryYgmDXcyww7j9XQeytU8hfPk0J
 r6ABq6u4HwMq7pSxzwhJBPAoR1JJGp46wzkTQ9zcnfejSGI9eomRvm7rNVpH+W2bKQuV
 HnlXG2kxAe46RmPV1X1WOZeRYz0D7q32VJOYUuEHFiTtiJrzemYPQUinyMA+QXMDMou2
 NUQg==
X-Gm-Message-State: APjAAAU4QzIp0QgHture7HKWq3CVnfPsOkn/UoMAvYT7JHmQrE2MIugG
 4VnPRc4uTB7rVtxz8Xc3Ff8=
X-Google-Smtp-Source: APXvYqyIA6IZIhFAL8yKUMxwryNfWoTyBGgHonMtuaTj6pITXvKw5p2xICH26JJvC0HNVp5O2BuxpQ==
X-Received: by 2002:a17:902:d217:: with SMTP id
 t23mr12191406ply.287.1573239994227; 
 Fri, 08 Nov 2019 11:06:34 -0800 (PST)
Received: from desktop-bart.svl.corp.google.com
 ([2620:15c:2cd:202:4308:52a3:24b6:2c60])
 by smtp.gmail.com with ESMTPSA id a16sm7196444pfc.56.2019.11.08.11.06.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Nov 2019 11:06:33 -0800 (PST)
To: Damien Le Moal <damien.lemoal@wdc.com>, linux-block@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, dm-devel@redhat.com,
 Mike Snitzer <snitzer@redhat.com>, linux-f2fs-devel@lists.sourceforge.net,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
References: <20191108015702.233102-1-damien.lemoal@wdc.com>
 <20191108015702.233102-9-damien.lemoal@wdc.com>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <6a1e0a08-d65c-b075-9bac-23519e9e91c3@acm.org>
Date: Fri, 8 Nov 2019 11:06:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191108015702.233102-9-damien.lemoal@wdc.com>
Content-Language: en-US
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (bart.vanassche[at]gmail.com)
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.196 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.1 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
 -0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iT9ai-005rjf-7v
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/7/19 5:57 PM, Damien Le Moal wrote:
> -	buf = vzalloc(bufsize);
> -	if (buf)
> -		*buflen = bufsize;
> +	while (bufsize >= SECTOR_SIZE) {
> +		buf = vzalloc(bufsize);
> +		if (buf) {
> +			*buflen = bufsize;
> +			return buf;
> +		}
> +		bufsize >>= 1;
> +	}

Hi Damien,

Has it been considered to pass the __GFP_NORETRY flag to this vzalloc() 
call?

Thanks,

Bart.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
