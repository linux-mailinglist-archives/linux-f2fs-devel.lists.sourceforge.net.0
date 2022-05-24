Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBBC532D64
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 May 2022 17:26:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ntWQp-0001SF-Vm; Tue, 24 May 2022 15:26:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1ntWQo-0001S9-Jf
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 May 2022 15:26:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uBuhfGI5zGEpbbBJ0zuaUuRd/xyV/cJJyhheiKsecdY=; b=LEgYaxAHMxhbE2Rii4j7nWEeTp
 7SimLq3DTPph+zBGoDlGPxV9dsTXtLJlNRo1Cy36Zo/JRziI9WLoBIQ6MxBSZhkg6beXHOH4lQB/y
 WmvdvRrGfIJqDbirW9RoAsk4IWPRbgNyiIJvwy93KX0qCCm0PXu3+HwX+w/R5lgf9xnI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uBuhfGI5zGEpbbBJ0zuaUuRd/xyV/cJJyhheiKsecdY=; b=cluSrU4MonS9w6esLrFL3Zdvgn
 El/BL/D/zWM8fkpPLLanFq/Lmzsgvt1TcCHhuRVcbP+Uh4Q5ffFKF647siyCzqIpb+0W6YocZxPp6
 X4LR9epq01Ee7/fSgIniKTE2PI/UD/8b4QXKTgmVa6bHg/YxAHbZe7M3yGc+L5hBI9Os=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ntWQl-005cFW-Io
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 May 2022 15:26:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5689A6171B;
 Tue, 24 May 2022 15:26:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CBCAC34113;
 Tue, 24 May 2022 15:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653405992;
 bh=lXzHpD73ZNq/mGAnzxwqk68q+3cpJPWaCAtRV53tatI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bQBRLUIB+CzIv9geGx/fXV1J6eBqxc8uSBz22ga34tMA74Tt6sznwf8zUq/13AD3g
 pdGVCep8TGTDLVFsFsup31isXOho6wgY/+Q7cecYJW4bfL8ItsMkFwlpgkQ3ZMq4oG
 5tVMDxUuYnY2Akhqw//Z6OkkPHiPqOs+3hdTszjVtvIuCh875iDjkFjTjaujORqKdG
 KTofWputI5KayJewQ7P0ObQiZQIRQhM5kWEAxlEZA+yp/AoDk/Xa3+MKWg25TPAdxg
 WI01dlqWihXad0nm824+pzM/hhnXzEElVIjFBQbYNo1TDOsFT2LGR59Ui0zVuhcVI5
 08TvHm8JXTg2Q==
Date: Tue, 24 May 2022 08:26:30 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Yoz5JteVWWfZmOBp@google.com>
References: <20220428181809.2352352-1-daeho43@gmail.com>
 <dd1ea728-4cb6-e35d-dc76-a1d62bead69a@kernel.org>
 <YovMeQO2n0XAxMhe@google.com>
 <227d10d5-2afe-acfa-7cfc-3a2f45331c6f@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <227d10d5-2afe-acfa-7cfc-3a2f45331c6f@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/24, Chao Yu wrote: > On 2022/5/24 2:03, Jaegeuk Kim
 wrote: > > On 05/22, Chao Yu wrote: > > > On 2022/4/29 2:18,
 Daeho Jeong wrote:>
 + *old_addr = dn.data_blkaddr; > > > > + f2fs_truncate_data_b [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ntWQl-005cFW-Io
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

On 05/24, Chao Yu wrote:
> On 2022/5/24 2:03, Jaegeuk Kim wrote:
> > On 05/22, Chao Yu wrote:
> > > On 2022/4/29 2:18, Daeho Jeong wrote:> +		*old_addr = dn.data_blkaddr;
> > > > +		f2fs_truncate_data_blocks_range(&dn, 1);
> > > > +		dec_valid_block_count(sbi, F2FS_I(inode)->cow_inode, count);
> > > > +		inc_valid_block_count(sbi, inode, &count);
> > > > +		f2fs_replace_block(sbi, &dn, dn.data_blkaddr, new_addr,
> > > > +					ni.version, true, false);
> > > 
> > > My concern is, if cow_inode's data was persisted into previous checkpoint,
> > > and then f2fs_replace_block() will update SSA from cow_inode to inode?
> > 
> > SSA for original file is intact, so we'll see the orignal file's block addresses
> > and SSA, if we flush cow_inode's SSA after committing the atomic writes?
> > It'd be good to flush any SSA for cow_inode, since we'll truncate
> > cow_inode after powercut by the ohphan recovery?
> 
> I think it's safe for recovery flow, but before that, fsck will report inconsistent
> status during checking orphan atomic_write inode.

That should be fine as well, since it'll just drop that cow_inode.

> 
> Thanks,
> 
> > 
> > > it will cause inconsistent status of last valid checkpoint? Or am I mssing
> > > something?
> > > 
> > > > -		f2fs_submit_merged_write_cond(sbi, inode, NULL, 0, DATA);
> > > > +			new = f2fs_kmem_cache_alloc(revoke_entry_slab, GFP_NOFS,
> > > > +							true, NULL);
> > > > +			if (!new) {
> > > > +				f2fs_put_dnode(&dn);
> > > > +				ret = -ENOMEM;
> > > > +				goto out;
> > > 
> > > It doesn't need to handle failure of f2fs_kmem_cache_alloc()
> > > due to nofail parameter is true.

Let's get this by another patch. Could you please send one?

> > > 
> > > Thanks,
> > > 
> > > 
> > > _______________________________________________
> > > Linux-f2fs-devel mailing list
> > > Linux-f2fs-devel@lists.sourceforge.net
> > > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
