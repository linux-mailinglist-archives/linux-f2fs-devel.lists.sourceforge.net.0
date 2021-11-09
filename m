Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5E144B162
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Nov 2021 17:42:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mkUCf-0002YK-VI; Tue, 09 Nov 2021 16:42:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <axboe@kernel.dk>) id 1mkUCe-0002YE-46
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Nov 2021 16:42:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZUeqW/lq8pCujML2AhgHfhtcT1KSprwhQa9BHxegsUw=; b=Z+duGOtMiCaI4ON8S/AWZbBTJI
 V/MmAiUJsJ/zQddJIPQDJlSR7RqpMymPx41OVVgvcUv6ieLE18Ia2CPxnQzlkC2JUtI5mUQInCEza
 SYESy0zbVZacJhsDCVWJGYCYhh+ufdyY1TyZTt8UZwGlkbuIdcJXV6dZe6GfP9eO1NCY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZUeqW/lq8pCujML2AhgHfhtcT1KSprwhQa9BHxegsUw=; b=c6Ma8QilAzQBUkXMIu6RL16ZtI
 6oNKmFQ8bcOueKbVw5GJAkEYMg/oPkOGs+7vjnRoDlF4aMj3Z/YN8J/TekxedkWWOcmhwNgqGD9x1
 92k4Q2/KI8jvQDnRvkp5XqUsDGXFBAN5px5BrTdxEngRdz489X4YebvN922mEpz4TYkk=;
Received: from mail-il1-f173.google.com ([209.85.166.173])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mkUCX-007UOU-HJ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Nov 2021 16:42:32 +0000
Received: by mail-il1-f173.google.com with SMTP id s15so2237633ild.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 09 Nov 2021 08:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZUeqW/lq8pCujML2AhgHfhtcT1KSprwhQa9BHxegsUw=;
 b=UJr9e4n/Fy9YeToIpiq/SIWUjqkGf9Ucb/A5whoFNf2FvkNI7neaCK3O1WPWJhf1Fa
 aqoG8notC0BveuJl9hH3pEhKyBXTwe3i5AbwCVFgQ/1l1uMQNsSLMYvScWSMWvK58KNw
 O0pFGwe8jc1N1kCBetK+91KLrlgdHBEYMfT5ZXcNDb897zGqhLJOj+YSk6eOHeP3JgDf
 OJNoSYudXiajB+KEcMRf0pU7KWR8STZOEmLBm/CIseEuOBEqai/0s/YmmXrsNT1RWX8z
 KOobbhvhXEgwTkc6nPOE6qf5filokDPgOTvSjpFhn1DFgxEium39JD6MU/b8S6ma3Q1D
 QTpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZUeqW/lq8pCujML2AhgHfhtcT1KSprwhQa9BHxegsUw=;
 b=xuMqVs2qN9ndw9EEK8hy424XrJKDyrLNEZT3F+hlReaRKAoa2MS0TeLvrI8r7Ae/6P
 sRzbFk9uevvfqjEKh+Ax90m3yaHoKZqO/qO34ikyWc4LC4/EnJ24k4W9Pu6Kh3oygrd5
 iipeTm9DuYofp5qIXfBaUk06ATYneNei4ajL/jBD0lis3FysjME0RYzCAqUeAe8i2jlj
 ZARhDpxyBMoAA4QuDMoySVl042Ve5lnj3NBRjzX4InrIDDuxfA6in29qrDASatwcDx1X
 Eez0LjCj/GHh4F15+DhSRcQ+N6rOAorQyU12Wcw9F2zxMEtLudegGbMskXtMPXKDqvIv
 sADA==
X-Gm-Message-State: AOAM531oGKzEj3+kKu/ocxgXCVL1/VZqsS407u57e9hoIwhrNjJM24B8
 VZhN+UdmXZNgkt4avVPJAGkqmQ==
X-Google-Smtp-Source: ABdhPJyzOQ+ZATudReIxL0Z/XQPF2ByazrfkavI3W2BoftBSQ7ULpLSV085IxHyatWS1GUyLbbDakw==
X-Received: by 2002:a92:cd86:: with SMTP id r6mr6099676ilb.149.1636476139843; 
 Tue, 09 Nov 2021 08:42:19 -0800 (PST)
Received: from [192.168.1.30] ([207.135.234.126])
 by smtp.gmail.com with ESMTPSA id a25sm2478977ioa.24.2021.11.09.08.42.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 08:42:19 -0800 (PST)
To: Christoph Hellwig <hch@infradead.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20211109021336.3796538-1-jaegeuk@kernel.org>
 <YYqkWWZZsMW49/xu@infradead.org>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <042997ce-8382-40fe-4840-25f40a84c4bf@kernel.dk>
Date: Tue, 9 Nov 2021 09:42:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YYqkWWZZsMW49/xu@infradead.org>
Content-Language: en-US
X-Spam-Score: -2.0 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/9/21 9:39 AM, Christoph Hellwig wrote: > On Mon, Nov
 08, 2021 at 06:13:36PM -0800, Jaegeuk Kim wrote: >> This patch adds a way
 to attach HIPRI by expanding the existing sysfs's >> data_io_flag. [...] 
 Content analysis details:   (-2.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.173 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.173 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1mkUCX-007UOU-HJ
Subject: Re: [f2fs-dev] [PATCH] f2fs: provide a way to attach HIPRI for
 Direct IO
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
Cc: linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/9/21 9:39 AM, Christoph Hellwig wrote:
> On Mon, Nov 08, 2021 at 06:13:36PM -0800, Jaegeuk Kim wrote:
>> This patch adds a way to attach HIPRI by expanding the existing sysfs's
>> data_io_flag. User can measure IO performance by enabling it.
> 
> NAK.  This flag should only be used when explicitly specified by
> the submitter of the I/O.

Yes, this cannot be set in the middle for a multitude of reasons. I wonder
if we should add a comment to that effect near the definition of it.

-- 
Jens Axboe



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
