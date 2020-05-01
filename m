Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D3D1C0E73
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 May 2020 09:06:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jUPkM-0001kL-OK; Fri, 01 May 2020 07:06:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <guoqing.jiang@cloud.ionos.com>) id 1jUPkL-0001k5-2D
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 May 2020 07:06:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cpQ8/VzVs0qy6Coq4jsY7ccdDFl3LgDWXkhtB9YYQco=; b=maSCOgZe9EJ2sU/uP4UW1qCSoV
 R5QTK2pWgJePZIwwAjCCFkqEL4BQ+/xCWqm1QOwgWwQZcVuQugLEHqmZu3/tmGn2UkOKqZEz5O+Sh
 7/0xLPF8UdhyA/YKClbFIdu03d45oBG4jsO7vuQxwcOkBQ4P40aocAe4kR9YJK8Pbmjs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cpQ8/VzVs0qy6Coq4jsY7ccdDFl3LgDWXkhtB9YYQco=; b=EMN/xxeJaBPhBJlU9iyC6ZVlFo
 h7my6zFWOhMo9+NluUkZ5c8KnlXA3ZhAvv4eHOr2pqqQgypEyC4qNQi9OCWKyC14UgXFBwui0vqIA
 dsWi25UobIr7bV6viZhsHrUx1wwYpRTpdSPhXzRLt3qW+nlKprZNL79P+GpX/goJVkJM=;
Received: from mail-wm1-f68.google.com ([209.85.128.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jUPkJ-006LjT-2N
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 May 2020 07:06:05 +0000
Received: by mail-wm1-f68.google.com with SMTP id u127so5413331wmg.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 01 May 2020 00:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.ionos.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=cpQ8/VzVs0qy6Coq4jsY7ccdDFl3LgDWXkhtB9YYQco=;
 b=GqsIZQEErtxp95UJWpKrQY3O4F4Sx0g6/X7lDuIF3bXx91ATcAP7/DgLZaXrIRReWa
 znotQmlfvGIU7bhOau/vG2ipCW6ay1jPpHU3dkPnfckc/TMFNyCGl5XeXfWbalOtQFX6
 gHm3zFY30ObZXefKrk/18Gy2OZL756D02eheTA1eXn1hgUUuYr/zXY5w9hicdvsi4iBD
 i020Okt4saC0RwlJrU73As1XgAjtDLrTAZicCsFsg88M5CUlGGFssxUDRySCbpKtqxbR
 BDN9qezqrIubk6PtQC5phFq9yawZi0lU9ffYH6Pj6n7nOgRjbcS5uv/clrIpOkDaYgOd
 H9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=cpQ8/VzVs0qy6Coq4jsY7ccdDFl3LgDWXkhtB9YYQco=;
 b=O6lnPLKRWnXNbzvK8uzSrUUbvHEBXFpWYl3CmgoczXN+4nTct6fSzQwEErYmLsW/x4
 sbm9ydPjngvDD7avWaHY8H28Mb12kSEfwN6o1bJiC8ONLSyJmDFqT8NZbxurciL2HqnL
 95lLOwlYFHr4WxxhQM3p/NKyES4BZUdxC5/jD0QCZfQYN/DKx/ike7Qf4fLSY8CoWvDU
 BCbuLhMUI1NND+yLES8IPHVKUH36XLg9kpuRjwSDEi8px6NLzC7iK+R7XsqSeDyCTjPI
 sgksVnQyiC0AGeDFs2zoCgrBSm8WAUnJ5vHDa9ptqJ85rZuiCVq+EPLxNkvWpN1vvr7U
 Rg1Q==
X-Gm-Message-State: AGi0PuYYJ+J7ZcdaC4MZAQZKu4GMtQSxHM3Mv4j9ka9J7EdTiaLZPRnU
 elrQZKGg3PjfedO6lRmIACupmL8QMdgD9Cku
X-Google-Smtp-Source: APiQypJhB8+PWaUoN3to5dH+glY2Sg5fXS6DS+6PXPXyjLj6QnarNlU5QbgDxRGc63eafm6Rtglqrg==
X-Received: by 2002:a1c:e302:: with SMTP id a2mr2364418wmh.96.1588315299701;
 Thu, 30 Apr 2020 23:41:39 -0700 (PDT)
Received: from ?IPv6:2001:16b8:48db:9b00:e80e:f5df:f780:7d57?
 ([2001:16b8:48db:9b00:e80e:f5df:f780:7d57])
 by smtp.gmail.com with ESMTPSA id u127sm2576769wme.8.2020.04.30.23.41.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 23:41:39 -0700 (PDT)
To: Al Viro <viro@zeniv.linux.org.uk>, Matthew Wilcox <willy@infradead.org>
References: <20200430214450.10662-1-guoqing.jiang@cloud.ionos.com>
 <20200430214450.10662-2-guoqing.jiang@cloud.ionos.com>
 <20200430221338.GY29705@bombadil.infradead.org>
 <20200501014229.GB23230@ZenIV.linux.org.uk>
 <20200501014954.GC23230@ZenIV.linux.org.uk>
From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
Message-ID: <aacdc25b-4650-6251-acf5-5c2c8b77f292@cloud.ionos.com>
Date: Fri, 1 May 2020 08:41:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200501014954.GC23230@ZenIV.linux.org.uk>
Content-Language: en-US
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jUPkJ-006LjT-2N
Subject: Re: [f2fs-dev] [RFC PATCH V2 1/9] include/linux/pagemap.h:
 introduce attach/clear_page_private
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
Cc: Martin Brandenburg <martin@omnibond.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, david@fromorbit.com,
 Song Liu <song@kernel.org>, Yafang Shao <laoar.shao@gmail.com>,
 Mike Marshall <hubcap@omnibond.com>, Andreas Gruenbacher <agruenba@redhat.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Chris Mason <clm@fb.com>,
 hch@infradead.org, devel@lists.orangefs.org,
 Josef Bacik <josef@toxicpanda.com>, linux-raid@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Anton Altaparmakov <anton@tuxera.com>,
 Andreas Dilger <adilger@dilger.ca>, Yang Shi <yang.shi@linux.alibaba.com>,
 William Kucharski <william.kucharski@oracle.com>,
 linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Roman Gushchin <guro@fb.com>, linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/1/20 3:49 AM, Al Viro wrote:
> On Fri, May 01, 2020 at 02:42:29AM +0100, Al Viro wrote:
>> On Thu, Apr 30, 2020 at 03:13:38PM -0700, Matthew Wilcox wrote:
>>
>>>> +/**
>>>> + * clear_page_private - clear page's private field and PG_private.
>>>> + * @page: page to be cleared.
>>>> + *
>>>> + * The counterpart function of attach_page_private.
>>>> + * Return: private data of page or NULL if page doesn't have private data.
>>>> + */
>>> Seems to me that the opposite of "attach" is "detach", not "clear".
>> Or "remove", perhaps...
> Actually, "detach" is better - neither "clear" nor "remove" imply "... and give
> me what used to be attached there", as this thing is doing.

Ok, seems we have reached the agreement about the new name ;-), will 
follow the instruction.

Thanks & Regards,
Guoqing


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
