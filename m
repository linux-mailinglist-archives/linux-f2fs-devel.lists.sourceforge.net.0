Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 934C71C8B51
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 May 2020 14:49:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jWfy3-0004VU-Fr; Thu, 07 May 2020 12:49:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jWfy1-0004V2-Od
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 May 2020 12:49:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o+O40uyzhR+ap9VVtUTXJ+lpBj0/Fnu+j3pZEeT6vzM=; b=TZGTmK0FNVUxsRdXxqKKdwrXq/
 AHUE92PmMTkBUaGATi7PfA93AbKoRo5qUnkQzhIj2zhOFKGXVirHxcRUgx8X2F++GBr++oOBkC9ux
 aWVURdfSeUAlaW3q11HhrZbY0ExwgW3cX5YR3b3v8q1GT2jA5K3Q+mt6yCQeasBwbhlg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o+O40uyzhR+ap9VVtUTXJ+lpBj0/Fnu+j3pZEeT6vzM=; b=HkwW99K3eYW53jKE/6cullz2Ss
 CfA9PJMoQoCUhTmoykfLP45xouplCPLWGqBiwjdDJ+i/5IYoqutSlKrVAEugidj6xjKDiTvaeFcb2
 YPnras1wHeNQCUAX39WgzHuK+bWqnoWguZrDJftBCZEyiCOpKhcf9PgN1XMMZw5iJ3Ow=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jWfxt-000BTH-DS
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 May 2020 12:49:33 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AFF5C2063A;
 Thu,  7 May 2020 12:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588855759;
 bh=31pqcdlKcDRpHUSplqujtBg+s8YvDSiNTvR/6s8xihQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vfNqKzqGfJYbM7KCZSAyfWsclW0AoCBnVvcFi0AE1zUrGQ9rVX4RZbD+wUPBOXIqN
 +z0ml/tT9SmT6DJaxsc3G+dnf030lQ7Lp+KFs0pT/gzFp3WC8zCF8EB8YC1TtpmIhu
 nN4evojy8b5/nvc6c7k0Kzzbs2zSUqyl/QFvqnvs=
Date: Thu, 7 May 2020 05:49:19 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200507124919.GA197114@google.com>
References: <20200506104542.123575-1-yuchao0@huawei.com>
 <20200506150521.GE107238@google.com>
 <f577a7a8-298f-cdda-7627-1273f83c261c@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f577a7a8-298f-cdda-7627-1273f83c261c@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWfxt-000BTH-DS
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: shrink spinlock coverage
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/07, Chao Yu wrote:
> On 2020/5/6 23:05, Jaegeuk Kim wrote:
> > On 05/06, Chao Yu wrote:
> >> In f2fs_try_to_free_nids(), .nid_list_lock spinlock critical region will
> >> increase as expected shrink number increase, to avoid spining other CPUs
> >> for long time, it's better to implement like extent cache and nats
> >> shrinker.
> >>
> >> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> >> ---
> >> v2:
> >> - fix unlock wrong spinlock.
> >>  fs/f2fs/node.c | 15 +++++++++++----
> >>  1 file changed, 11 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> >> index 4da0d8713df5..ad0b14f4dab8 100644
> >> --- a/fs/f2fs/node.c
> >> +++ b/fs/f2fs/node.c
> >> @@ -2488,7 +2488,6 @@ void f2fs_alloc_nid_failed(struct f2fs_sb_info *sbi, nid_t nid)
> >>  int f2fs_try_to_free_nids(struct f2fs_sb_info *sbi, int nr_shrink)
> >>  {
> >>  	struct f2fs_nm_info *nm_i = NM_I(sbi);
> >> -	struct free_nid *i, *next;
> >>  	int nr = nr_shrink;
> >>  
> >>  	if (nm_i->nid_cnt[FREE_NID] <= MAX_FREE_NIDS)
> >> @@ -2498,14 +2497,22 @@ int f2fs_try_to_free_nids(struct f2fs_sb_info *sbi, int nr_shrink)
> >>  		return 0;
> >>  
> >>  	spin_lock(&nm_i->nid_list_lock);
> >> -	list_for_each_entry_safe(i, next, &nm_i->free_nid_list, list) {
> >> -		if (nr_shrink <= 0 ||
> >> -				nm_i->nid_cnt[FREE_NID] <= MAX_FREE_NIDS)
> >> +	while (nr_shrink) {
> >> +		struct free_nid *i;
> >> +
> >> +		if (nm_i->nid_cnt[FREE_NID] <= MAX_FREE_NIDS)
> >>  			break;
> >>  
> >> +		i = list_first_entry(&nm_i->free_nid_list,
> >> +					struct free_nid, list);
> >> +		list_del(&i->list);
> >> +		spin_unlock(&nm_i->nid_list_lock);
> >> +
> >>  		__remove_free_nid(sbi, i, FREE_NID);
> > 
> > __remove_free_nid() will do list_del again. btw, how about just splitting out
> 
> Oh, my bad.
> 
> How about moving __remove_free_nid into .nid_list_lock coverage?
> 
> > given nr_shrink into multiple trials?
> 
> Like this?

Yes.

> 
> 	while (shrink) {
> 		batch = DEFAULT_BATCH_NUMBER; // 16
> 		spinlock();
> 		list_for_each_entry_safe() {
> 			if (!shrink || !batch)
> 				break;
> 			remove_item_from_list;
> 			shrink--;
> 			batch--;
> 		}
> 		spin_unlock();
> 	}
> 
> Thanks,
> 
> > 
> >>  		kmem_cache_free(free_nid_slab, i);
> >>  		nr_shrink--;
> >> +
> >> +		spin_lock(&nm_i->nid_list_lock);
> >>  	}
> >>  	spin_unlock(&nm_i->nid_list_lock);
> >>  	mutex_unlock(&nm_i->build_lock);
> >> -- 
> >> 2.18.0.rc1
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
