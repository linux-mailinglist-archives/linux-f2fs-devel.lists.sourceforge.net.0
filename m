Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 751564FF418
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Apr 2022 11:47:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1neZae-0003ia-4q; Wed, 13 Apr 2022 09:47:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mhocko@suse.com>) id 1neZaT-0003i6-GV
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Apr 2022 09:46:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DUZdw/4BVrL0B76lm9XymdADfFBWIkgmQNBJ9/BmcsY=; b=Il5Bb+n8n0YfHf7iBz1BcJOEdP
 BqJ3lg9PvJLQcytTbFPOF27LZ+Xi2z1u3v0xzZouZhWxYGviIy+zmuYfkhV4o3lTzAqRqLF87a9tw
 MFcva+qL7SX5CwUo0DWZmz0DyzgREaWH/CHKjEfonO2KNCwyulwmaMel1qvLiDBALs08=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DUZdw/4BVrL0B76lm9XymdADfFBWIkgmQNBJ9/BmcsY=; b=g04oMOj7VVcGvJqFAUDfeCWNTi
 eZokk5CGxVPurTA++ocLEn3BFLID/F5RPyXhBAne/5AbaWR1m5u//YAcnkMzYoyvIdoL3QV7ilLVI
 Fcwmdy5FDgRBCmeAirNEW8TOgPVrZ/Yd9BB9Rg38Kw0/8uqaN9xjcvY3SevC+srLHSqM=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1neZaL-0000hn-1z
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Apr 2022 09:46:49 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 5AEC91F38D;
 Wed, 13 Apr 2022 09:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1649843194; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DUZdw/4BVrL0B76lm9XymdADfFBWIkgmQNBJ9/BmcsY=;
 b=rw1cUVA7ojvfMAzL768h5JP0nsRBzm/dLKIxWyJuTLpxeqHBMDHMT03eRf1TNE+2z/k2xR
 au07q0lArw6DIvQ1IRKhJ9PfNOmeEqMq4PwnZG8Cbd9rJ4tkTOMEeiirBwyCf4TdzgOozV
 cHb4ERvd7k8vjfnOF/zabSMCWse45FM=
Received: from suse.cz (unknown [10.100.201.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 1DC98A3B92;
 Wed, 13 Apr 2022 09:46:34 +0000 (UTC)
Date: Wed, 13 Apr 2022 11:46:33 +0200
To: Rokudo Yan <wu-yan@tcl.com>
Message-ID: <Ylab+Tz4d8kZYjef@dhcp22.suse.cz>
References: <20220413084432.1312900-1-wu-yan@tcl.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220413084432.1312900-1-wu-yan@tcl.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed 13-04-22 16:44:32,
 Rokudo Yan wrote: > There is a potential
 deadlock in gc thread may happen > under low memory as below: > >
 gc_thread_func
 > -f2fs_gc > -do_garbage_collect > -gc_data_segment [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1neZaL-0000hn-1z
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

On Wed 13-04-22 16:44:32, Rokudo Yan wrote:
> There is a potential deadlock in gc thread may happen
> under low memory as below:
> 
> gc_thread_func
>  -f2fs_gc
>   -do_garbage_collect
>    -gc_data_segment
>     -move_data_block
>      -set_page_writeback(fio.encrypted_page);
>      -f2fs_submit_page_write
> as f2fs_submit_page_write try to do io merge when possible, so the
> encrypted_page is marked PG_writeback but may not submit to block
> layer immediately, if system enter low memory when gc thread try
> to move next data block, it may do direct reclaim and enter fs layer
> as below:
>    -move_data_block
>     -f2fs_grab_cache_page(index=?, for_write=false)
>      -grab_cache_page
>       -find_or_create_page
>        -pagecache_get_page
>         -__page_cache_alloc --  __GFP_FS is set
>          -alloc_pages_node
>           -__alloc_pages
>            -__alloc_pages_slowpath
>             -__alloc_pages_direct_reclaim
>              -__perform_reclaim
>               -try_to_free_pages
>                -do_try_to_free_pages
>                 -shrink_zones
>                  -mem_cgroup_soft_limit_reclaim
>                   -mem_cgroup_soft_reclaim
>                    -mem_cgroup_shrink_node
>                     -shrink_node_memcg
>                      -shrink_list
>                       -shrink_inactive_list
>                        -shrink_page_list
>                         -wait_on_page_writeback -- the page is marked
>                        writeback during previous move_data_block call

This is a memcg reclaim path and you would have to have __GFP_ACCOUNT in
the gfp mask to hit it from the page allocator. I am not really familiar
with f2fs but I doubt it is using this flag.

On the other hand the memory is charged to a memcg when the newly
allocated page is added to the page cache. That wouldn't trigger the
soft reclaim path but that is not really necessary because even the
regular memcg reclaim would trigger wait_on_page_writeback for cgroup
v1.

Also are you sure that the mapping's gfp mask has __GFP_FS set for this
allocation? f2fs_iget uses GFP_NOFS like mask for some inode types.

All that being said, you will need to change the above call chain but it
would be worth double checking the dead lock is real.
-- 
Michal Hocko
SUSE Labs


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
