Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A26514FF595
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Apr 2022 13:20:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1neb30-00061D-En; Wed, 13 Apr 2022 11:20:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <wu-yan@tcl.com>) id 1neb2z-000612-1c
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Apr 2022 11:20:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:CC:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Zk7c/EEjwxmKgmdyLgdGsJPK5vxp8QPXgTtuhhdo40Q=; b=WDm7P4JMRvankTVXbbcHjNJ6UC
 YgKYjCTDu4gRy9asl57xi0jaO0h5DsQ3ZiBcVT4s2GqkoLlD90xa9JMB3H8VcCt5lShJzalGrIQrX
 Arw7P4tydG1xUcUJWfcLSCRV6Xc8bv5SldHVCzY1hANaDu9yKoBbWLNzMd5M/grC2wK0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Zk7c/EEjwxmKgmdyLgdGsJPK5vxp8QPXgTtuhhdo40Q=; b=HJxNoxdtAO3e0JiTK/stmCJuJT
 w9em5pXbqvul8UVApn2dKkfi1WgEofqjyRZveQtbxl/kdDqU0dh0Otq5DB2TLcaaaM6WceHx/ukHX
 Q1sUPNn4IrwFqhDDKgAQR9PsRicacYbP1qUDxY7oxYjjLNw5sHBdIODMcoE7YOTBLyXY=;
Received: from smtp233.corp-email.com ([222.73.234.233])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1neb2t-00F9km-RT
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Apr 2022 11:20:27 +0000
Received: from ([114.119.32.142])
 by smtp233.corp-email.com ((D)) with ASMTP (SSL) id IHI00009;
 Wed, 13 Apr 2022 19:20:09 +0800
Received: from [172.16.35.4] (172.16.35.4) by GCY-MBS-28.TCL.com (10.136.3.28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 13 Apr
 2022 19:20:00 +0800
Message-ID: <ff186d65-2103-b796-79b9-3eb4a3e04380@tcl.com>
Date: Wed, 13 Apr 2022 19:20:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Michal Hocko <mhocko@suse.com>
References: <181ce21548da652d9a14eebc684fe75c@sslemail.net>
 <Ylab+Tz4d8kZYjef@dhcp22.suse.cz>
From: Wu Yan <wu-yan@tcl.com>
In-Reply-To: <Ylab+Tz4d8kZYjef@dhcp22.suse.cz>
X-Originating-IP: [172.16.35.4]
X-ClientProxiedBy: GCY-EXS-05.TCL.com (10.74.128.155) To GCY-MBS-28.TCL.com
 (10.136.3.28)
tUid: 2022413192009cdda9d904e4172743aab11da4840b35c
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/13/22 17:46,
 Michal Hocko wrote: > On Wed 13-04-22 16:44:32, 
 Rokudo Yan wrote: >> There is a potential deadlock in gc thread may happen
 >> under low memory as below: >> >> gc_thread_func >> -f2fs [...] 
 Content analysis details:   (-2.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [222.73.234.233 listed in wl.mailspike.net]
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [222.73.234.233 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1neb2t-00F9km-RT
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid deadlock in gc thread under low
 memory
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
Cc: jaegeuk@kernel.org, tang.ding@tcl.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/13/22 17:46, Michal Hocko wrote:
> On Wed 13-04-22 16:44:32, Rokudo Yan wrote:
>> There is a potential deadlock in gc thread may happen
>> under low memory as below:
>>
>> gc_thread_func
>>   -f2fs_gc
>>    -do_garbage_collect
>>     -gc_data_segment
>>      -move_data_block
>>       -set_page_writeback(fio.encrypted_page);
>>       -f2fs_submit_page_write
>> as f2fs_submit_page_write try to do io merge when possible, so the
>> encrypted_page is marked PG_writeback but may not submit to block
>> layer immediately, if system enter low memory when gc thread try
>> to move next data block, it may do direct reclaim and enter fs layer
>> as below:
>>     -move_data_block
>>      -f2fs_grab_cache_page(index=?, for_write=false)
>>       -grab_cache_page
>>        -find_or_create_page
>>         -pagecache_get_page
>>          -__page_cache_alloc --  __GFP_FS is set
>>           -alloc_pages_node
>>            -__alloc_pages
>>             -__alloc_pages_slowpath
>>              -__alloc_pages_direct_reclaim
>>               -__perform_reclaim
>>                -try_to_free_pages
>>                 -do_try_to_free_pages
>>                  -shrink_zones
>>                   -mem_cgroup_soft_limit_reclaim
>>                    -mem_cgroup_soft_reclaim
>>                     -mem_cgroup_shrink_node
>>                      -shrink_node_memcg
>>                       -shrink_list
>>                        -shrink_inactive_list
>>                         -shrink_page_list
>>                          -wait_on_page_writeback -- the page is marked
>>                         writeback during previous move_data_block call
> 
> This is a memcg reclaim path and you would have to have __GFP_ACCOUNT in
> the gfp mask to hit it from the page allocator. I am not really familiar
> with f2fs but I doubt it is using this flag.
> 
> On the other hand the memory is charged to a memcg when the newly
> allocated page is added to the page cache. That wouldn't trigger the
> soft reclaim path but that is not really necessary because even the
> regular memcg reclaim would trigger wait_on_page_writeback for cgroup
> v1.
> 
> Also are you sure that the mapping's gfp mask has __GFP_FS set for this
> allocation? f2fs_iget uses GFP_NOFS like mask for some inode types.
> 
> All that being said, you will need to change the above call chain but it
> would be worth double checking the dead lock is real.

Hi, Michal

1. The issue is occur when do monkey test in Android Device with 4GB RAM 
+ 3GB zram, and memory cgroup v1 enabled.

2. full memory dump has caught when the issue occur and the dead lock 
has confirmed from dump. We can see the mapping->gfp_mask is 0x14200ca,
so both __GFP_ACCOUNT(0x1000000) and __GFP_FS(0x80) set

crash-arm64> struct inode.i_mapping 0xFFFFFFDFD578EEA0
   i_mapping = 0xffffffdfd578f028,
crash-arm64> struct address_space.host,gfp_mask -x 0xffffffdfd578f028
   host = 0xffffffdfd578eea0,
   gfp_mask = 0x14200ca,

Thanks
yanwu


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
