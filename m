Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 934F01E8B7E
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 30 May 2020 00:46:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jenlx-0006Zq-9s; Fri, 29 May 2020 22:46:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <axboe@kernel.dk>) id 1jenlv-0006Zb-Cy
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 May 2020 22:46:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3SvGI6+FW1/OhXjcYh+qu+PkvAZr4CU1sl+aHPi5BkI=; b=N79m5FCQsn1O4gGlJpqxEADID5
 mL8TIO1Ch3HcUp/bxJj5r0j+L05JB3O5n8Irr0gBrhGFPeS6yRP2EjZmtUCau4sP0gYQErthaumEW
 an+Fe6cLEVfEWvBPkFOjaOUjLjqO6doVv8450rdAc55RoIAODUC80u0lzL1ftzg62Ijw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3SvGI6+FW1/OhXjcYh+qu+PkvAZr4CU1sl+aHPi5BkI=; b=L7U5ZQmMeNQISSOIr2N0mGmf+d
 7OM7ybWHXV/kIBYj8E5PeiRhSyarIXucPeVr0SBMH5YlGSO0JvqNmeZjHXO675lob7Yj1pxfN8CKN
 7TM8EEJ0L8+9IJa9EtSa8dNA7hnf8vKEeL5KWNrNYuKAuNb2W26CqN8WEg/maHAKN8Ao=;
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jenlt-003H2E-HM
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 May 2020 22:46:39 +0000
Received: by mail-oi1-f195.google.com with SMTP id j145so4055266oib.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 29 May 2020 15:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3SvGI6+FW1/OhXjcYh+qu+PkvAZr4CU1sl+aHPi5BkI=;
 b=nH1QiA+IRSDYm41wzzYncwFaM+lrDNn8Ti2XFcAi4YlaUw9LztwixK0pLNSdeHIyB7
 8bS61hIRSiOulx1iuyKF9nP4gpzLATvREps1+Y8sUHCTsMZ0rY+c1fgY5DukBD+Uegin
 1lLKtDr7RDXHpyWblpi+B9d4Ujuc4xdGVonklbCjbzvYQPtHToJufcxLYyR+p+Kh98lg
 7xb/aOq4xXK0qPSUlE/HFQp1mG3daOYUEb9TuOa7ktkFpy+7p82qFHo7IYkgx6GUZGuH
 8zk1bdAi4lwNOoqsXYgm3MyTYkenX/Q/gJXp2zUQOgLiLCvj9OzabgNt4M4CpTJUiGsP
 5U5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3SvGI6+FW1/OhXjcYh+qu+PkvAZr4CU1sl+aHPi5BkI=;
 b=g9pV5klv2/O9sOTvJXwueYdwc7aQlVYPe917Nbnq0ElKkKWKRzUygEFYSpHEAAB6JN
 uhjGeSj2iRvosCvxdrkF5qi84n+1jE/1LJaVUP94HrhhmUMvgxjC1rE8poIE9lB6kYMM
 fVP15M8N5rRMndeF8ZS5DFcbofr/sP3xMZTo+xDbv8Z6WNVqgnTp0KYZ+coTMffC31wJ
 glJ/5sWzlLhIfs9UydS27+6eiQakpUsN6RiNsaGTM9umOvaNqKsPpyTwzE3yQxBYtvEn
 S9OjyCOARGseeD4j9Vy9iVu0kvV63j+TlJ57kaslaJzBiVaANB3cBhtJSi1DyeyJo3Gh
 5Z3Q==
X-Gm-Message-State: AOAM5336wwp5xVeePv3/9t8cvLjgZruN11ZtanyUQKjjnjxjUoThSzm7
 aYnmc/x3jgDEoGzGjSQIjuy1tFMVW99JfCAf
X-Google-Smtp-Source: ABdhPJx+EbTbp9drKjVT1SBrBX1rRMhZ6tJHpQZ+IXg2BZcRTR0vnvD5aHP3y5FWcW+eFbCDEyco7w==
X-Received: by 2002:a17:90a:68cd:: with SMTP id
 q13mr11465889pjj.177.1590791970211; 
 Fri, 29 May 2020 15:39:30 -0700 (PDT)
Received: from [192.168.1.188] ([66.219.217.173])
 by smtp.gmail.com with ESMTPSA id m22sm374695pjv.30.2020.05.29.15.39.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2020 15:39:29 -0700 (PDT)
To: Bart Van Assche <bvanassche@acm.org>, Matthew Wilcox
 <willy@infradead.org>, Kaitao Cheng <pilgrimtao@gmail.com>
References: <20200529141100.37519-1-pilgrimtao@gmail.com>
 <20200529202713.GC19604@bombadil.infradead.org>
 <c7a5bbc4-ffc2-6a63-fed3-9874969afc31@acm.org>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <fe0fc36e-fa67-a6b9-cc7a-d86d3f21cf2c@kernel.dk>
Date: Fri, 29 May 2020 16:39:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <c7a5bbc4-ffc2-6a63-fed3-9874969afc31@acm.org>
Content-Language: en-US
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.195 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jenlt-003H2E-HM
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
 linux-s390@vger.kernel.org, chaitanya.kulkarni@wdc.com,
 darrick.wong@oracle.com, mark@fasheh.com, satyat@google.com, hch@infradead.org,
 borntraeger@de.ibm.com, gor@linux.ibm.com, josef@toxicpanda.com,
 ming.lei@redhat.com, viro@zeniv.linux.org.uk, songmuchun@bytedance.com,
 dsterba@suse.com, jaegeuk@kernel.org, jlbec@evilplan.org, sagi@grimberg.me,
 balbi@kernel.org, damien.lemoal@wdc.com, martin.petersen@oracle.com,
 joseph.qi@linux.alibaba.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 asml.silence@gmail.com, linux-btrfs@vger.kernel.org, sth@linux.ibm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/29/20 4:27 PM, Bart Van Assche wrote:
> On 2020-05-29 13:27, Matthew Wilcox wrote:
>> On Fri, May 29, 2020 at 10:11:00PM +0800, Kaitao Cheng wrote:
>>> There is a function named ilog2() exist which can replace blksize.
>>> The generated code will be shorter and more efficient on some
>>> architecture, such as arm64. And ilog2() can be optimized according
>>> to different architecture.
>>
>> We'd get the same benefit from a smaller patch with just:
>>
>> --- a/include/linux/blkdev.h
>> +++ b/include/linux/blkdev.h
>> @@ -1502,15 +1502,9 @@ static inline int blk_rq_aligned(struct request_queue *q, unsigned long addr,
>>  	return !(addr & alignment) && !(len & alignment);
>>  }
>>  
>> -/* assumes size > 256 */
>>  static inline unsigned int blksize_bits(unsigned int size)
>>  {
>> -	unsigned int bits = 8;
>> -	do {
>> -		bits++;
>> -		size >>= 1;
>> -	} while (size > 256);
>> -	return bits;
>> +	return ilog2(size);
>>  }
>>  
>>  static inline unsigned int block_size(struct block_device *bdev)
> 
> Hi Matthew,
> 
> I had suggested to change all blksize_bits() calls into ilog2() calls
> because I think that a single function to calculate the logarithm base 2
> is sufficient.

I think this should be a two-parter:

1) Use the inode blkbits where appropriate
2) Then do this change

I'm leaning towards just doing it in blksize_bits() instead of updating
every caller, unless there aren't that many left once we've gone
through patch 1.

-- 
Jens Axboe



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
