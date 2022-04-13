Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AC94FF5C9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Apr 2022 13:35:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nebHG-000131-L0; Wed, 13 Apr 2022 11:35:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mhocko@suse.com>) id 1nebHE-00012Y-MD
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Apr 2022 11:35:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fFqfiFiCx2hMGSLHkHBmN5BfJizyHy0EGQZ4MjVsO7g=; b=E3HkiahEuRpAp16BVYeTjAo5za
 /EtKld9uch+Lu7LuPqzwiqPfTbvzhDPpzhjNDYLzNnAAh08bZzsi/RZ+60Kg11jJJ2D3xXxc2azV9
 Phfr4DHdOSPdENes+eKfy4bopxW0N3n5bdAmVA/59sqJiX5VJTUxDr9vGA+ddqumpSPA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fFqfiFiCx2hMGSLHkHBmN5BfJizyHy0EGQZ4MjVsO7g=; b=ESyYcBELemUuakUM/F6TrgCCPs
 A5bY7RoDuiEjzPRMz+TiL4IPRU3eG5TMB8rfSIPno0BQB3AUQBDqDHIA92o1AMf0WXLOsJEYkrCXz
 H/iiqsTAUvWdsaI5PE22GpP942zM0UrRtRjBFFGwsuumJLpec6GQZphDnztC8ZjFDfCI=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nebHC-0006Iq-Mx
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Apr 2022 11:35:11 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 7B2F71F38D;
 Wed, 13 Apr 2022 11:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1649849704; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fFqfiFiCx2hMGSLHkHBmN5BfJizyHy0EGQZ4MjVsO7g=;
 b=XtWQOfFS03MuJAoFKw1G6tY/N1VE3kpuCtr0LmuGD4fnq65kIvngZSl5T++LA3Mq3rRCYS
 a67zEvFqPSLazUTz+DgtckdMscYtdBliJwJZuDpE5232BPC3skv3uDE7PA4+yiP124+Cqr
 13h6mfA6/zXRPY9JdvtF2uuA7If9DBQ=
Received: from suse.cz (unknown [10.100.201.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 3C5E4A3B87;
 Wed, 13 Apr 2022 11:35:03 +0000 (UTC)
Date: Wed, 13 Apr 2022 13:35:03 +0200
To: Wu Yan <wu-yan@tcl.com>
Message-ID: <Yla1Z8Ze0iJvXRFT@dhcp22.suse.cz>
References: <181ce21548da652d9a14eebc684fe75c@sslemail.net>
 <Ylab+Tz4d8kZYjef@dhcp22.suse.cz>
 <ff186d65-2103-b796-79b9-3eb4a3e04380@tcl.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ff186d65-2103-b796-79b9-3eb4a3e04380@tcl.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed 13-04-22 19:20:06, Wu Yan wrote: > On 4/13/22 17:46, 
 Michal Hocko wrote: > > On Wed 13-04-22 16:44:32, Rokudo Yan wrote: > > >
 There is a potential deadlock in gc thread may happen > > > under [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1nebHC-0006Iq-Mx
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
From: Michal Hocko via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Michal Hocko <mhocko@suse.com>
Cc: jaegeuk@kernel.org, tang.ding@tcl.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed 13-04-22 19:20:06, Wu Yan wrote:
> On 4/13/22 17:46, Michal Hocko wrote:
> > On Wed 13-04-22 16:44:32, Rokudo Yan wrote:
> > > There is a potential deadlock in gc thread may happen
> > > under low memory as below:
> > > 
> > > gc_thread_func
> > >   -f2fs_gc
> > >    -do_garbage_collect
> > >     -gc_data_segment
> > >      -move_data_block
> > >       -set_page_writeback(fio.encrypted_page);
> > >       -f2fs_submit_page_write
> > > as f2fs_submit_page_write try to do io merge when possible, so the
> > > encrypted_page is marked PG_writeback but may not submit to block
> > > layer immediately, if system enter low memory when gc thread try
> > > to move next data block, it may do direct reclaim and enter fs layer
> > > as below:
> > >     -move_data_block
> > >      -f2fs_grab_cache_page(index=?, for_write=false)
> > >       -grab_cache_page
> > >        -find_or_create_page
> > >         -pagecache_get_page
> > >          -__page_cache_alloc --  __GFP_FS is set
> > >           -alloc_pages_node
> > >            -__alloc_pages
> > >             -__alloc_pages_slowpath
> > >              -__alloc_pages_direct_reclaim
> > >               -__perform_reclaim
> > >                -try_to_free_pages
> > >                 -do_try_to_free_pages
> > >                  -shrink_zones
> > >                   -mem_cgroup_soft_limit_reclaim
> > >                    -mem_cgroup_soft_reclaim
> > >                     -mem_cgroup_shrink_node
> > >                      -shrink_node_memcg
> > >                       -shrink_list
> > >                        -shrink_inactive_list
> > >                         -shrink_page_list
> > >                          -wait_on_page_writeback -- the page is marked
> > >                         writeback during previous move_data_block call
> > 
> > This is a memcg reclaim path and you would have to have __GFP_ACCOUNT in
> > the gfp mask to hit it from the page allocator. I am not really familiar
> > with f2fs but I doubt it is using this flag.
> > 
> > On the other hand the memory is charged to a memcg when the newly
> > allocated page is added to the page cache. That wouldn't trigger the
> > soft reclaim path but that is not really necessary because even the
> > regular memcg reclaim would trigger wait_on_page_writeback for cgroup
> > v1.
> > 
> > Also are you sure that the mapping's gfp mask has __GFP_FS set for this
> > allocation? f2fs_iget uses GFP_NOFS like mask for some inode types.
> > 
> > All that being said, you will need to change the above call chain but it
> > would be worth double checking the dead lock is real.
> 
> Hi, Michal
> 
> 1. The issue is occur when do monkey test in Android Device with 4GB RAM +
> 3GB zram, and memory cgroup v1 enabled.
> 
> 2. full memory dump has caught when the issue occur and the dead lock has
> confirmed from dump. We can see the mapping->gfp_mask is 0x14200ca,
> so both __GFP_ACCOUNT(0x1000000) and __GFP_FS(0x80) set

This is rather surprising, I have to say because page cache is charged
explicitly (__filemap_add_folio). Are you testing with the upstream
kernel or could this be a non-upstream change possibly?

> crash-arm64> struct inode.i_mapping 0xFFFFFFDFD578EEA0
>   i_mapping = 0xffffffdfd578f028,
> crash-arm64> struct address_space.host,gfp_mask -x 0xffffffdfd578f028
>   host = 0xffffffdfd578eea0,
>   gfp_mask = 0x14200ca,

Anyway, if the __GFP_FS is set then the deadlock is possible even
without __GFP_ACCOUNT.
-- 
Michal Hocko
SUSE Labs


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
