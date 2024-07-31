Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F35DB943716
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Jul 2024 22:27:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sZFvC-0002NE-Cn;
	Wed, 31 Jul 2024 20:27:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1sZFv7-0002Mk-9s
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Jul 2024 20:27:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Uf/bYfYOxOBjM5usrC+6hBSPDKHtwWPlrqMMXAYvFDc=; b=N9OwjxAxeMG8bsnH/trQ8VR361
 l4xKPQplHOfN00pOY//XC9af/WCCCc9wh9/IEexEwLMqqjGEFqNiwgMNkPtQxvlvVqoUTPrNj8LQg
 gd3KiFcuQZBmYHb09QqXIoL6d6KNQDJGNfe/y5A//kNawam33QAEJxgqfrVgrLlLBBig=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Uf/bYfYOxOBjM5usrC+6hBSPDKHtwWPlrqMMXAYvFDc=; b=CmsMIxrTS1m3rk5uBnXD3NZuz5
 RTX8WSQKPh1E7oHDntmoDezCZ/udwqfaZ56J/tq70G3xSvwpXaFUp3mlkQnVYWT/VL4k9y+nzMNTB
 8fBZceuJ/NWK/zF9kHJ43q5V/lNDxvj6LavjR0JRRaOJz5NHECSd0l8DjNBiH2X65l4c=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sZFv6-0003F6-EV for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Jul 2024 20:27:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 994F2CE17D2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 31 Jul 2024 20:27:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C704DC116B1;
 Wed, 31 Jul 2024 20:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722457644;
 bh=NP8PSucstw3bxkC5xSko2GaChVKEzv5ikkGSO/MOdGU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jg3uHcYBHRvDhUP716M6IhX7iKtFr/DaGodoJffAsmPJ5oaMOU5TCNaUOV9ry2BF8
 OjeBEBovz0TiZTIGJTAiBDgQ5+f46p5xJsz8V/WerpKY+3suaICGk15OJioZvTitLu
 OrqfhNSr7U8NH4yA1YZs0N3Xmj2g2mWQtoQW/wtsjzEVWhtllAPhMRceXmm7YehbEz
 hmXcfJjxwvsdstFQmGSXZ+VKY+554p0MSKFxV+as6lk0o6Lbz65faLqZF09FmXZxzy
 fiq/NvW2CSSHHzCJICH5gGMadzOmTqQR9KheZu/kEcK8ZxrffSa0Mx6pk4ld5oj+Cx
 waPZZIVxXkZZg==
Date: Wed, 31 Jul 2024 20:27:22 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZqqeKuEIExOwMyuK@google.com>
References: <20240726012204.1306174-1-chao@kernel.org>
 <ZqfCwDcg7nvJPenf@google.com>
 <9e6c0e72-a175-4432-bada-564464698c3f@kernel.org>
 <ZqkUJAMJzW_4ANhY@google.com>
 <1b1c5fcf-0c71-4c5d-a429-3decc3bb8cb3@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1b1c5fcf-0c71-4c5d-a429-3decc3bb8cb3@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 07/31, Chao Yu wrote: > On 2024/7/31 0:26, Jaegeuk Kim
 wrote: > > On 07/30, Chao Yu wrote: > > > On 2024/7/30 0:26, Jaegeuk Kim wrote:
 > > > > On 07/26, Chao Yu wrote: > > > > > We should always tr [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [145.40.73.55 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sZFv6-0003F6-EV
Subject: Re: [f2fs-dev] [PATCH v2 3/4] f2fs: atomic: fix to truncate
 pagecache before on-disk metadata truncation
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

On 07/31, Chao Yu wrote:
> On 2024/7/31 0:26, Jaegeuk Kim wrote:
> > On 07/30, Chao Yu wrote:
> > > On 2024/7/30 0:26, Jaegeuk Kim wrote:
> > > > On 07/26, Chao Yu wrote:
> > > > > We should always truncate pagecache while truncating on-disk data.
> > > > > 
> > > > > Fixes: a46bebd502fe ("f2fs: synchronize atomic write aborts")
> > > > > Signed-off-by: Chao Yu <chao@kernel.org>
> > > > > ---
> > > > > v2:
> > > > > - fix to use cow_inode instead of inode
> > > > >    fs/f2fs/file.c | 1 +
> > > > >    1 file changed, 1 insertion(+)
> > > > > 
> > > > > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > > > > index 6c62f76474d1..54886ddcb8ab 100644
> > > > > --- a/fs/f2fs/file.c
> > > > > +++ b/fs/f2fs/file.c
> > > > > @@ -2202,6 +2202,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
> > > > >    		F2FS_I(fi->cow_inode)->atomic_inode = inode;
> > > > >    	} else {
> > > > >    		/* Reuse the already created COW inode */
> > > > > +		truncate_setsize(fi->cow_inode, 0);
> > > > 
> > > > What if the below truncation failed?
> > > 
> > > What about just dropping page cache and do not set isize to 0?
> > 
> > Can we also check if there's any dirty page before truncating it?
> 
> Sure, so how about this?
> 
> 		/* Reuse the already created COW inode */
> 		if (get_dirty_pages(fi->cow_inode)) {

Was supposed to be a bug here?

> 			ret = filemap_write_and_wait(fi->cow_inode->i_mapping);
> 			if (ret) {
> 				f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> 				goto out;
> 			}
> 		}
> 
> 		truncate_inode_pages(fi->cow_inode->i_mapping, 0);

invalidate_mapping_pages() would be much safer?

> 
> 		ret = f2fs_do_truncate_blocks(fi->cow_inode, 0, true);
> 		if (ret) {
> 			f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> 			goto out;
> 		}
> 
> 		i_size_write(fi->cow_inode, 0);
> 
> Thanks,
> 
> > 
> > > 
> > > Thanks,
> > > 
> > > > 
> > > > >    		ret = f2fs_do_truncate_blocks(fi->cow_inode, 0, true);
> > > > >    		if (ret) {
> > > > >    			f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> > > > > -- 
> > > > > 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
