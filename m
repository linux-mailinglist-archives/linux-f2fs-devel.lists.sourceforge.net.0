Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A9F75D81
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jul 2019 05:39:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hqr4Z-0007dp-KJ; Fri, 26 Jul 2019 03:39:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <baijiaju1990@gmail.com>) id 1hqr4Y-0007de-VB
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Jul 2019 03:39:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x9jpkKsawqv16UAcPnvGSGklT2l7v1L3clQy/LaazSE=; b=JPGgKYODzZn9lqVLJNTtZpfSy1
 1337eNSVeY56TrqDFJW58tVJUl3paT7yM1YhMubbB6P3Dozi8RbXNnMnnr911nXJvwbR8/Dz5L7vO
 iKUGpnRZfZaNlvhli6khWJGGjLBaEQKhI2VcC5BxB+WAqWnEZyYoUSikUokQ4qXOjq4g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x9jpkKsawqv16UAcPnvGSGklT2l7v1L3clQy/LaazSE=; b=bkGXEnlkB6ZP+zjSiBa75DCVPp
 3617LL3y+H6/XDByzIfO9mxjGCgSPQ8A6WqUPRngx5Sl5d3NAp31R33/djcL6LkdQNPDqFofZ0Ko2
 n4NZwBY4/mnHYI/ugPZMIqohoATUqFG26Sc3XakA3wB/j0PEoQghnEQtLGt7Vtdp0Lyw=;
Received: from mail-pf1-f176.google.com ([209.85.210.176])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hqr4X-00GYKd-Mv
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Jul 2019 03:39:10 +0000
Received: by mail-pf1-f176.google.com with SMTP id c3so650153pfa.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 25 Jul 2019 20:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=x9jpkKsawqv16UAcPnvGSGklT2l7v1L3clQy/LaazSE=;
 b=ti/+4SPYRcJdC2ON+0rZow0dnLBewWtmxUej4Wq/2hSnhBHk+w8ww0NY40o1Nq6Umw
 R5R2HRP/xPjYmsSQsz/9Jve182Fb+hs1UwWtKgzlEbZzKOsq4xDSG8kjtoi37ePmMCB2
 u1fT4GquAsRIFlT7cwVVBWnUgFnQiZfRshv3o/isLQIrVV9m5prAQWi9kKM59DL0CSrD
 Ldonv6rqPwcmaWTRK6WQnDg3Xlc5GS1uDVjmB5+t5rPOHZixbd12SKCy6GltDcf6PUGz
 1olB+ArkOlSzGYoQFiOsD4JqvTRiq9cdwAA3nFireAhbVgL60n8nY1hpwTT7u98/l5XK
 8hkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=x9jpkKsawqv16UAcPnvGSGklT2l7v1L3clQy/LaazSE=;
 b=hIdECir+xhxeHe7etSQuGmKeU5zZLMK2kw5U2YVup7E+F/WLgJukyMIFY8mOrupI3I
 FHWijf0w7nUPaDRZEWd6thpBIcnTWnyMDuMW68P/0UyJdIT7ykAhfsmXiGHxfAKpYzIs
 pSBprH0+r78Ray+iPwOLyT7mQ0GwNj/Y2guu552AIN01horMCsHcUB9EvMdRgn/DWnad
 XwPXx6CjSqoAQfgU6xtS52/ShUXmZZCxMCuCD1yRyHYKH31Nwr4SBAivLmOKdEaXZ9R+
 CstuQv+X7vRfHmRpX2aHIouSlDAbPH3yizW1kNHGarz6x1L0HLLJDlAbig/ikuOPyZ72
 dM7Q==
X-Gm-Message-State: APjAAAU47Zfm7/ti+VFlNs0t6Lcvv5T8Gh3A4ZNnt+eOBXfDmJokz/K7
 Oo9P7c7aRmNx6B9BOvjfXyk=
X-Google-Smtp-Source: APXvYqxpsRY5Whl2UjMjKGugceyF3SN4a4ogN5X4rWtnKPZe3r9lhDFkJplLVyd20xUrazvJFRxtng==
X-Received: by 2002:a17:90a:372a:: with SMTP id
 u39mr95911266pjb.2.1564112344038; 
 Thu, 25 Jul 2019 20:39:04 -0700 (PDT)
Received: from ?IPv6:2402:f000:4:72:808::177e? ([2402:f000:4:72:808::177e])
 by smtp.gmail.com with ESMTPSA id d14sm63212225pfo.154.2019.07.25.20.39.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 20:39:03 -0700 (PDT)
To: Chao Yu <yuchao0@huawei.com>, jaegeuk@kernel.org
References: <f577be2f-fc2f-9ef8-2c6c-9c247123b1ad@gmail.com>
 <2d66cd56-eccf-9086-c5db-118acce717a6@huawei.com>
From: Jia-Ju Bai <baijiaju1990@gmail.com>
Message-ID: <889d8107-a122-cc15-ed08-959b34dcf248@gmail.com>
Date: Fri, 26 Jul 2019 11:39:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2d66cd56-eccf-9086-c5db-118acce717a6@huawei.com>
Content-Language: en-US
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (baijiaju1990[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.176 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.176 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (baijiaju1990[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hqr4X-00GYKd-Mv
Subject: Re: [f2fs-dev] [BUG] fs: f2fs: Possible null-pointer dereferences
 in update_general_status()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 2019/7/26 11:19, Chao Yu wrote:
> Hi Jiaju,
>
> Thanks for the report, I checked the code, and found it doesn't need to check
> SM_I(sbi) pointer, this is because in fill_super() and put_super(), we will call
> f2fs_destroy_stats() in prior to f2fs_destroy_segment_manager(), so if current
> sbi can still be visited in global stat list, SM_I(sbi) should be released yet.
> So anyway, let's remove unneeded check in line 70/78. :)

Okay, I will send a patch to remove unneeded checks.


Best wishes,
Jia-Ju Bai


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
