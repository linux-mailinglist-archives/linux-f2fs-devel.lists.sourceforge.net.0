Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C68E6875DF0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Mar 2024 07:21:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1riTb8-0001CN-OD;
	Fri, 08 Mar 2024 06:20:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1riTb6-0001CH-LZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Mar 2024 06:20:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OZ+qnmSVC3iLyvhs+UIjCUUIXVPW9vWO1BjQSnS4hDA=; b=Gz2ogmIcWF+slEbYDTlsCVdpfF
 zcPf2RCAOzRPrD7MK9K6Qorz/5mw7+Z7JQGW0GZZKBWFv2P3WpcvTeGZ0EUrWLZN/z+hekgxQiHuK
 zpQBBi7fwfnrQn6gQoHXGghhFJN/z+9gQYf/K5+b5KBkYb79rF6GdnIVr2kBLIfeiE6k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OZ+qnmSVC3iLyvhs+UIjCUUIXVPW9vWO1BjQSnS4hDA=; b=QHpIXvbIK8e0ewxXnP/5E4sn7i
 GawUHux9b783Gz3pK1HlFlgwC2XxTNnncWq3HadC6CU77sS1Uh+GQLAg3LXCX3XGG94p0kCWN/oDT
 W+dwYXZmaVHLRxYc0CNFfwsh7txwIk65oUBjGs0ydSnfkh/QE1FK4VBbR1e9nhxMZRcA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1riTay-0003i1-Nh for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Mar 2024 06:20:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 44FC261617
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  8 Mar 2024 06:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 078C5C433F1;
 Fri,  8 Mar 2024 06:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709878840;
 bh=APt9nw3iUKosH6rfvav1qdlGVyqi/IlhhjgYZZfNE5Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JhMvwzu75vexwGA5XzB+R6ylBhI0lqs3sN6u5DHe4KGwhWryea2zpbIOkCRuA+fdf
 8Jl8D84Xu89gZnrgRknzV04h9xQnYte2lwok+dlxQLz0Jl/I3R4HcXec1hxPCayIL6
 Lh8LaS8te3qQf7HyGxLQf28rQCDs02vp70RDKpZl1KyPFC+7HZ+QG6RLyXcuxer2LA
 NfHhvBiGLeEFg2u1kp2zyRqNi5Xv+BSZqIGInmNGDbWPds1pbDtfONc+8pmJrC5trI
 kX0r5YbOdo02x6u/9qxjf4fYWEj6+F2rOqGVPpY51XS+i9TfbODVfiij6WndZD3MpY
 K+dvnxu0H3O6A==
Message-ID: <73296ac6-8b00-4131-ab78-a127cdbff4b9@kernel.org>
Date: Fri, 8 Mar 2024 14:20:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200618063625.110273-1-yuchao0@huawei.com>
 <20200618235932.GA227771@google.com>
 <f5bbb14b-52a0-9697-a8fe-c3e39f78b0a5@huawei.com>
 <20200619054922.GC227771@google.com>
 <3634ef79-5903-449d-0d52-3d5566481863@huawei.com>
 <20200619224755.GA60059@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20200619224755.GA60059@google.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2020/6/20 6:47,
 Jaegeuk Kim wrote: >>>>>> diff --git a/fs/f2fs/file.c
 b/fs/f2fs/file.c >>>>>> index 3268f8dd59bb..1862073b96d2 100644 >>>>>> ---
 a/fs/f2fs/file.c >>>>>> +++ b/fs/f2fs/file.c >>>>>> [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1riTay-0003i1-Nh
Subject: Re: [f2fs-dev] [PATCH 1/5] f2fs: fix to wait page writeback before
 update
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

On 2020/6/20 6:47, Jaegeuk Kim wrote:
>>>>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>>>>> index 3268f8dd59bb..1862073b96d2 100644
>>>>>> --- a/fs/f2fs/file.c
>>>>>> +++ b/fs/f2fs/file.c
>>>>>> @@ -1250,6 +1250,7 @@ static int __clone_blkaddrs(struct inode *src_inode, struct inode *dst_inode,
>>>>>>   				f2fs_put_page(psrc, 1);
>>>>>>   				return PTR_ERR(pdst);
>>>>>>   			}
>>>>>> +			f2fs_wait_on_page_writeback(pdst, DATA, true, true);
> 
> Do you mean pdst can be under writeback?

Jaegeuk,

Look back this again, is it possible that pdst is writebacking
in below race condition? or am I missing something?

Thread A				GC Thread
- f2fs_move_file_range
  - filemap_write_and_wait_range(dst)
					- gc_data_segment
					 - f2fs_down_write(dst)
					 - move_data_page
					  - set_page_writeback(dst_page)
					  - f2fs_submit_page_write
					 - f2fs_up_write(dst)
  - f2fs_down_write(dst)
  - __exchange_data_block
   - __clone_blkaddrs
    - f2fs_get_new_data_page
    - memcpy_page

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
