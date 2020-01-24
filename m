Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0269F14785A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jan 2020 06:54:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iuruy-0001xC-Sm; Fri, 24 Jan 2020 05:54:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iuruw-0001x4-Ls
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jan 2020 05:54:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Sk2pY5AisMa/av235iqzQb5ycJz9ETouLkY9hedRTfs=; b=bxVnKhV8PwKnXhE/NQQirXV5r4
 DTKiWtpp3SKOe2SrgKqOqpvHeWbqFOjvmWy4lJGongEXwwLMUIQrlUwescIsJZbX15ILrqTonQ+1J
 /HprUD/EmHudvDXSMQGQZGR2Dd7daKF6JDWh5bAXaEXjFuiL8AXrYTlyVDSENqfGLc7s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Sk2pY5AisMa/av235iqzQb5ycJz9ETouLkY9hedRTfs=; b=QAdpsV7tN9qj1/kpgfoSJSLl3a
 mfbkTHyKc9AFc6W1BWKi4TG8Lc1Xwq/VZH5b0gF8saDL0fVI9GBjpMeIN9nMzpre68C3qwlevSdJg
 PpCan13+NkP1cav0Ifj+2mp+QbwU8LbBd8WHMM9bbKkrxQdoKV1wepcGMO2MH6cvJWek=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iuruv-00GZJ4-Gn
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jan 2020 05:54:06 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AE5132071A;
 Fri, 24 Jan 2020 05:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579845239;
 bh=PD319ZtzsARpjQN1qMfKAV/AztFjbl+rqa9IicPM79c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F+N98E0/dZZRYj9BMz9tUTtbHDoSnZvlNf8oRs8RP+l/FZb0ctHVNOVfdHtZWXdXR
 gG/Cx4DZH2U+0Sncv8BudMGmyMmULJOBTJyfeb3sMsM4RJltlvJVBGaMvyx7BE+ep+
 O9wEiILKvXBu44x4EbHiFVxgdBWRTe4dhjwAB/Gg=
Date: Thu, 23 Jan 2020 21:53:58 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Gao Xiang <hsiangkao@aol.com>
Message-ID: <20200124055358.GD832@sol.localdomain>
References: <20200124041234.159740-1-ebiggers@kernel.org>
 <20200124050423.GA31271@hsiangkao-HP-ZHAN-66-Pro-G1>
 <20200124051601.GB832@sol.localdomain>
 <20200124052740.GB31271@hsiangkao-HP-ZHAN-66-Pro-G1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200124052740.GB31271@hsiangkao-HP-ZHAN-66-Pro-G1>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iuruv-00GZJ4-Gn
Subject: Re: [f2fs-dev] [PATCH] ext4: fix race conditions in ->d_compare()
 and ->d_hash()
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
Cc: Daniel Rosenberg <drosen@google.com>,
 linux-f2fs-devel@lists.sourceforge.net,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jan 24, 2020 at 01:27:50PM +0800, Gao Xiang wrote:
> On Thu, Jan 23, 2020 at 09:16:01PM -0800, Eric Biggers wrote:
> > On Fri, Jan 24, 2020 at 01:04:25PM +0800, Gao Xiang wrote:
> > > > diff --git a/fs/ext4/dir.c b/fs/ext4/dir.c
> > > > index 8964778aabefb..0129d14629881 100644
> > > > --- a/fs/ext4/dir.c
> > > > +++ b/fs/ext4/dir.c
> > > > @@ -671,9 +671,11 @@ static int ext4_d_compare(const struct dentry *dentry, unsigned int len,
> > > >  			  const char *str, const struct qstr *name)
> > > >  {
> > > >  	struct qstr qstr = {.name = str, .len = len };
> > > > -	struct inode *inode = dentry->d_parent->d_inode;
> > > > +	const struct dentry *parent = READ_ONCE(dentry->d_parent);
> > > 
> > > I'm not sure if we really need READ_ONCE d_parent here (p.s. d_parent
> > > won't be NULL anyway), and d_seq will guard all its validity. If I'm
> > > wrong, correct me kindly...
> > > 
> > > Otherwise, it looks good to me...
> > > Reviewed-by: Gao Xiang <gaoxiang25@huawei.com>
> > > 
> > 
> > While d_parent can't be set to NULL, it can still be changed concurrently.
> > So we need READ_ONCE() to ensure that a consistent value is used.
> 
> If I understand correctly, unlazy RCU->ref-walk will be guarded by
> seqlock, and for ref-walk we have d_lock (and even parent lock)
> in relative paths. So I prematurely think no race of renaming or
> unlinking evenually.
> 
> I'm curious about that if experts could correct me about this.
> 

Taking a seqlock for read doesn't prevent the protected data from changing.
It just allows the reader to detect that it changed.

So we still need to handle the dentry fields being changed concurrently here,
even if it will be detected by a read_seqcount_retry() later.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
