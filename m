Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EEC2AFDE6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Nov 2020 06:31:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kd5Cy-00046P-Nc; Thu, 12 Nov 2020 05:31:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kd5Cu-00045W-17
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Nov 2020 05:31:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yYXntx3pkgKGAM654zCcHKHjA0Bf7KMW3fJU5Pqeuko=; b=KFGxEfMrWz5NmCxJd7Qk2jGgP/
 XYbDhXTBXunYcydqoddXQS+g8F2Wml4Ud2hNZCsvB/9m14STQy6ipmxBJsgZAq15F8YGeQBQ8WfFT
 gNcmW04UO5PEeASFwpcxsKjJ+9FU8wlOLSjLksAL9O3FvlGB+z7EoKuh1awFTN9GsDe0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yYXntx3pkgKGAM654zCcHKHjA0Bf7KMW3fJU5Pqeuko=; b=W4FtiuqaqkvOFl03vWIUgC3ztA
 wO9+O+r1RzsdH1jgQX9AUxNhlTGimZzTYRZS/3vj95xw8bOg16bttmE5zv51K88MWGkcYC7nD3JE1
 bgZ+qujrPSvCkG3lNRioBwvDducOByWEd1Y5yfmcY/XlO/yUa2V7wOYE2TPgXyXyvwS8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kd5Ck-0007RL-Vx
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Nov 2020 05:31:37 +0000
Received: from google.com (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1E7AC2076E;
 Thu, 12 Nov 2020 05:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605159085;
 bh=zRwrA+HVZcRHjHL8H5aKqesuUNcgOMvjAT62h6bxZok=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d3AR2qLK1zbYHW6qXTgphkNgujefkn3Ak2YgPdDfkWVcPx8Mfi9dGl411u4cbvM+j
 NgwcrHeFYf/4emPwMF8whc0//GvmBSA4HU8qUjfD9ovy8ReIEFzMe2Jz3JN38ClS1M
 PW1wsNBhyOmCZZ2CZMM6ZXs+7BbvrdDHS0dvGDkk=
Date: Wed, 11 Nov 2020 21:31:22 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20201112053122.GA3826485@google.com>
References: <20201109170012.2129411-1-jaegeuk@kernel.org>
 <f195a4f0-34af-1594-f443-be8ba3058707@huawei.com>
 <20201110041958.GA1598246@google.com>
 <f8de28c2-da2f-f988-7fc9-6f38f19f3f41@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f8de28c2-da2f-f988-7fc9-6f38f19f3f41@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FSL_HELO_FAKE          No description available.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: mediatek.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kd5Ck-0007RL-Vx
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid race condition for shinker count
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
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 Light Hsieh <Light.Hsieh@mediatek.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/10, Chao Yu wrote:
> On 2020/11/10 12:19, Jaegeuk Kim wrote:
> > On 11/10, Chao Yu wrote:
> > > On 2020/11/10 1:00, Jaegeuk Kim wrote:
> > > > Light reported sometimes shinker gets nat_cnt < dirty_nat_cnt resulting in
> > > 
> > > I didn't get the problem clearly, did you mean __count_nat_entries() will
> > > give the wrong shrink count due to race condition? should there be a lock
> > > while reading these two variables?
> > > 
> > > > wrong do_shinker work. Basically the two counts should not happen like that.
> > > > 
> > > > So, I suspect this race condtion where:
> > > > - f2fs_try_to_free_nats            __flush_nat_entry_set
> > > >    nat_cnt=2, dirty_nat_cnt=2
> > > >                                      __clear_nat_cache_dirty
> > > >                                       spin_lock(nat_list_lock)
> > > >                                       list_move()
> > > >                                       spin_unlock(nat_list_lock)
> > > >    spin_lock(nat_list_lock)
> > > >    list_del()
> > > >    spin_unlock(nat_list_lock)
> > > >    nat_cnt=1, dirty_nat_cnt=2
> > > >                                      nat_cnt=1, dirty_nat_cnt=1
> > > 
> > > nm_i->nat_cnt and nm_i->dirty_nat_cnt were protected by
> > > nm_i->nat_tree_lock, I didn't see why expanding nat_list_lock range
> > > will help... since there are still places nat_list_lock() didn't
> > > cover these two reference counts.
> > 
> > Yeah, I missed nat_tree_lock, and indeed it should cover this. So, the problem
> > is Light reported subtle case of nat_cnt < dirty_nat_cnt in shrink_count.
> > We may need to use nat_tree_lock in shrink_count?
> 
> change like this?
> 

Yup.

> __count_nat_entries()
> 
> 	down_read(&nm_i->nat_tree_lock);
> 	count = NM_I(sbi)->nat_cnt - NM_I(sbi)->dirty_nat_cnt;
> 	up_read(&nm_i->nat_tree_lock);
> 
> Thanks,
> 
> > 
> > > 
> > > Thanks,
> > > 
> > > > 
> > > > Reported-by: Light Hsieh <Light.Hsieh@mediatek.com>
> > > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > > > ---
> > > >    fs/f2fs/node.c | 3 +--
> > > >    1 file changed, 1 insertion(+), 2 deletions(-)
> > > > 
> > > > diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> > > > index 42394de6c7eb..e8ec65e40f06 100644
> > > > --- a/fs/f2fs/node.c
> > > > +++ b/fs/f2fs/node.c
> > > > @@ -269,11 +269,10 @@ static void __clear_nat_cache_dirty(struct f2fs_nm_info *nm_i,
> > > >    {
> > > >    	spin_lock(&nm_i->nat_list_lock);
> > > >    	list_move_tail(&ne->list, &nm_i->nat_entries);
> > > > -	spin_unlock(&nm_i->nat_list_lock);
> > > > -
> > > >    	set_nat_flag(ne, IS_DIRTY, false);
> > > >    	set->entry_cnt--;
> > > >    	nm_i->dirty_nat_cnt--;
> > > > +	spin_unlock(&nm_i->nat_list_lock);
> > > >    }
> > > >    static unsigned int __gang_lookup_nat_set(struct f2fs_nm_info *nm_i,
> > > > 
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
