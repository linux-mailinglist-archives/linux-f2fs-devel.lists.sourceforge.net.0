Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A4003531569
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 May 2022 20:04:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ntCPK-0002bC-9u; Mon, 23 May 2022 18:03:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1ntCPI-0002b6-Rj
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 May 2022 18:03:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2niP0CGFUFFSj5QYgr4e5myJD6KAAyP1rALrcyzyXxc=; b=Ev66JJbvFl8XWC1/odbGx257NE
 vTvIR4cRKVQRXzojwjq6VnAcIlxVLGkaYOUsaL1QPIu1EHtCH5FKCkWNV0/Ivud5KD9b/1KLyl9Mw
 C3FQSYtcrZsf7CH2ZjIWFzLxAWubzhc1OLP+FP0/yWCCngUUhBNR7AXYAPHtOAQGluIQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2niP0CGFUFFSj5QYgr4e5myJD6KAAyP1rALrcyzyXxc=; b=IWa7QFglGLZYc3cgj+VVWkwBnr
 tGDi8KEc6PRawo+SAPYpyIeKtzXHZzss4rQHwuwpV2p/4xMmWgT7LdQS/xmyEYaNU4SsWrTov/Cph
 UlyGprwf+EYGEF1BS6/02vkuBH6jwEXBoMWltDAu8i8FVvUOnAk7KpECZwiDaPz4vU7g=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ntCPG-0006ne-R4
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 May 2022 18:03:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6F884614CE;
 Mon, 23 May 2022 18:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A80D1C385AA;
 Mon, 23 May 2022 18:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653329019;
 bh=Yb/JkZM658Z6MLcMI0IHk5BK/rh9v+MSZ1PRr3wJnv0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AclNuXReOE8lhJhX5Dnq4OBTo2fIHyceusJLNbQJoawzNKkkQJX5Z/+IM+tJPUFvx
 SEFLwnTws/41SkR3rMU4AdsJT3SUpn1y+PAH3XdSz+ED1eYUQa69pGT0ExB7upg5rm
 oIjb6TqjhoNhYtm6ajCT0e/ZsLxQxWkQBRu2Ly4yU3cPHuOm9Hpeoh9IWqlWb3ZC3i
 r8NYYVzR/Mh03nUuRWarCd9Lt41leQNQyWGcPPlEgMEUqWwa4DaDI9BQC0weohk4pQ
 0mS8x141JZWY9n382fP4gxblQ6gten/fcv74HX9WIbJLVJAQY8/NLR9uE0O0mN8oww
 TEc8BylmI7yFA==
Date: Mon, 23 May 2022 11:03:37 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YovMeQO2n0XAxMhe@google.com>
References: <20220428181809.2352352-1-daeho43@gmail.com>
 <dd1ea728-4cb6-e35d-dc76-a1d62bead69a@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dd1ea728-4cb6-e35d-dc76-a1d62bead69a@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/22, Chao Yu wrote: > On 2022/4/29 2:18, Daeho Jeong
 wrote:> + *old_addr = dn.data_blkaddr;
 > > + f2fs_truncate_data_blocks_range(&dn,
 1); > > + dec_valid_block_count(sbi, F2FS_I(inode)->cow_inod [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ntCPG-0006ne-R4
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: change the current atomic write way
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/22, Chao Yu wrote:
> On 2022/4/29 2:18, Daeho Jeong wrote:> +		*old_addr = dn.data_blkaddr;
> > +		f2fs_truncate_data_blocks_range(&dn, 1);
> > +		dec_valid_block_count(sbi, F2FS_I(inode)->cow_inode, count);
> > +		inc_valid_block_count(sbi, inode, &count);
> > +		f2fs_replace_block(sbi, &dn, dn.data_blkaddr, new_addr,
> > +					ni.version, true, false);
> 
> My concern is, if cow_inode's data was persisted into previous checkpoint,
> and then f2fs_replace_block() will update SSA from cow_inode to inode?

SSA for original file is intact, so we'll see the orignal file's block addresses
and SSA, if we flush cow_inode's SSA after committing the atomic writes?
It'd be good to flush any SSA for cow_inode, since we'll truncate
cow_inode after powercut by the ohphan recovery?

> it will cause inconsistent status of last valid checkpoint? Or am I mssing
> something?
> 
> > -		f2fs_submit_merged_write_cond(sbi, inode, NULL, 0, DATA);
> > +			new = f2fs_kmem_cache_alloc(revoke_entry_slab, GFP_NOFS,
> > +							true, NULL);
> > +			if (!new) {
> > +				f2fs_put_dnode(&dn);
> > +				ret = -ENOMEM;
> > +				goto out;
> 
> It doesn't need to handle failure of f2fs_kmem_cache_alloc()
> due to nofail parameter is true.
> 
> Thanks,
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
