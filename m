Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA79A50221
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Mar 2025 15:35:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tppqa-0007qI-2p;
	Wed, 05 Mar 2025 14:35:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tppqS-0007po-MD
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Mar 2025 14:35:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r6GscOsKoUvKxnd5nXVc/2C/QH5NeiXWFIVJAeqPILA=; b=X2hV4u6mhjJ+s9WJ8cmvOH/Eu0
 uGdknwXa1BqtJtimJKXiEkJbuslFoGkInEfjEK3givURPaQsIbrwZ77hNC6YXPlJo36/sEqBg90vM
 xKdCTi4Q9TNUrPd/K5RjIaDO24QnkPzNxR9fOIJCTAlwkedRS1tUF5n6vVA6AZ1StgLE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r6GscOsKoUvKxnd5nXVc/2C/QH5NeiXWFIVJAeqPILA=; b=N4P5Sqcj2XB6GbspQ8dIx6Y5Gf
 Z0mAs4vsQiSi1xeB4S3Yd+v9JXiRheNTbcSWtdsP1OXH+rFQPmUhizrKPNzFxEBVWBQQlb3JZ7DEg
 iOF2op6LB9a9A1XVCU5Zfz58jrNfbF+dKUF/qxTXu+5heMnYrPvvWWN+Kar3EcHGltok=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tppqN-0004XF-P7 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Mar 2025 14:35:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 500B3A4571A;
 Wed,  5 Mar 2025 14:29:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66F3BC4CED1;
 Wed,  5 Mar 2025 14:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741185320;
 bh=+/POTIBYu3YbxycBA5ufAE7WLG0Xfu9i9jwITjW3woE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AFdsha0E3TTkHFrh6locq319Bxuu3oaoMsKrRFGmfy/6GzfzT2Omi/6LAuuPhOoUR
 7nuN17GDWc1onwbWAXeoSSCARVFlJ3gAVT0EGgbR65cFmn7iwEXTabW3XCK827pQFk
 2OvbXCV4tP6leP0w9LGHFN6BdPnRfHot7I43kQY5uMZWzy8oCWjBBhHp3Qf4A8rwod
 D/cTaTg/1LsHXDN/z2+dgTPJ+WGJwPLmW5u5PLmLFF3hdCPbi1GnVgjq4IwSVYQWWO
 1BVExHEXc0+xi00u7b0G/CppFbabY5v2YoWv5E9u5kohoIoq0DTFw40gz3yOHROTR1
 kTMeFzdi5PkPQ==
Date: Wed, 5 Mar 2025 14:35:18 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <Z8hhJs_fUOBN7U8y@google.com>
References: <20250304192041.4048741-1-daeho43@gmail.com>
 <41160b37-16ad-4c12-aad2-1214d87d3df0@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41160b37-16ad-4c12-aad2-1214d87d3df0@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 03/05, Chao Yu wrote: > On 3/5/25 03:20,
 Daeho Jeong wrote:
 > > From: Daeho Jeong <daehojeong@google.com> > > > > current_reserved_blocks
 is not allowed to utilize. For some zoned > > storage devic [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tppqN-0004XF-P7
Subject: Re: [f2fs-dev] [PATCH] f2fs: subtract current_reserved_blocks from
 total
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 03/05, Chao Yu wrote:
> On 3/5/25 03:20, Daeho Jeong wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> > 
> > current_reserved_blocks is not allowed to utilize. For some zoned
> > storage devices, vendors will provide extra space which was used for
> > device level GC than specs and we will use this space for filesystem
> > level GC. This extra space should not be shown to users, otherwise,
> > users will see not standardized size number like 530GB, not 512GB.
> 
> Hi Daeho,
> 
> However, if there are other users e.g. oem or vendor want to use
> reserved_blocks and current_reserved_blocks sysfs interface to
> reserve space, then, total size will be less than 512GB?
> 
> What do you think of adding a new variable to indicate reserved
> space for zoned storage case only?

Or, adding a sysfs entry like "carve_out" to determine this?

> 
> Thanks,
> 
> > 
> > Signed-off-by: Daeho Jeong <daehojeong@google.com>
> > ---
> >  fs/f2fs/super.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > index 19b67828ae32..c346dcc2518a 100644
> > --- a/fs/f2fs/super.c
> > +++ b/fs/f2fs/super.c
> > @@ -1833,10 +1833,9 @@ static int f2fs_statfs(struct dentry *dentry, struct kstatfs *buf)
> >  	buf->f_type = F2FS_SUPER_MAGIC;
> >  	buf->f_bsize = sbi->blocksize;
> >  
> > -	buf->f_blocks = total_count - start_count;
> > -
> >  	spin_lock(&sbi->stat_lock);
> >  
> > +	buf->f_blocks = total_count - start_count - sbi->current_reserved_blocks;
> >  	user_block_count = sbi->user_block_count;
> >  	total_valid_node_count = valid_node_count(sbi);
> >  	avail_node_count = sbi->total_node_count - F2FS_RESERVED_NODE_NUM;
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
