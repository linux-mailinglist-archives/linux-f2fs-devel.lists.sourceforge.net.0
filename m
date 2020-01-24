Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 57920148DA0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jan 2020 19:13:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iv3S4-0000bv-T2; Fri, 24 Jan 2020 18:13:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iv3S2-0000bd-K8
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jan 2020 18:13:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IojNBkNZFfT+FpPnCjJB2Wc8qZH94/k8Mk9CGfKNBbM=; b=Qr6L3CL6Dk+J7ABtHDjjBDcWV5
 GM+SqVFK1GbBovCXZMrMc4IznnHgiWFlNwWbhoz9+Az1ZssH9/5/DJb+wIBDYqZRhbVIDHFRuZS5a
 Ats+VcS1gjDhL+SRz7X3Qttg6JvMgzwNtXKqgWZymc3fR0L1K2tIX9Bkj1HYxJbfB5FA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IojNBkNZFfT+FpPnCjJB2Wc8qZH94/k8Mk9CGfKNBbM=; b=BHiS8hzWeyk/UKT9MDxYlcDuxF
 OE55xfH1D3AUiE40hdpDgu/vXbIIgbotJ9gSrRDbCYOThOD6JSoBls5khyVpNBFUiS9CFw8x3X9a/
 M5YZC7G9qVDOKGI/Kej2h9cPiKeECpEUEtZTJ1Nst2hC+8KzE36nWMA2QnEwLBifuBSI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iv3S1-00HGc9-Bu
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jan 2020 18:13:02 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 90C7E2075D;
 Fri, 24 Jan 2020 18:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579889575;
 bh=RR2pEgv3AfYWVyNbNfZQfKlvW//2Y1NRPRw8qbA0Nc8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iEr5lh3+1n6E4bqy9kbISKA2APd/H/Ot2U3wNw1gGv4tc6Z3SKgWHNisVVAb4u2by
 KOXjFlBBuu7uIWet+S74eqkm/g+GRwFaImTrPKFc1MTlSkw3Rjdc5EeY7AEs8tvCWJ
 Ra31+bwo2ahiCxnm22pgLTpn+4fR34xcvM3ODq9c=
Date: Fri, 24 Jan 2020 10:12:54 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Gao Xiang <hsiangkao@aol.com>
Message-ID: <20200124181253.GA41762@gmail.com>
References: <20200124041234.159740-1-ebiggers@kernel.org>
 <20200124050423.GA31271@hsiangkao-HP-ZHAN-66-Pro-G1>
 <20200124051601.GB832@sol.localdomain>
 <20200124053415.GC31271@hsiangkao-HP-ZHAN-66-Pro-G1>
 <20200124054256.GC832@sol.localdomain>
 <20200124061525.GA2407@hsiangkao-HP-ZHAN-66-Pro-G1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200124061525.GA2407@hsiangkao-HP-ZHAN-66-Pro-G1>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 1.5 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.8 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iv3S1-00HGc9-Bu
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

On Fri, Jan 24, 2020 at 02:15:31PM +0800, Gao Xiang wrote:
> On Thu, Jan 23, 2020 at 09:42:56PM -0800, Eric Biggers wrote:
> > On Fri, Jan 24, 2020 at 01:34:23PM +0800, Gao Xiang wrote:
> > > On Thu, Jan 23, 2020 at 09:16:01PM -0800, Eric Biggers wrote:
> > > 
> > > []
> > > 
> > > > So we need READ_ONCE() to ensure that a consistent value is used.
> > > 
> > > By the way, my understanding is all pointer could be accessed
> > > atomicly guaranteed by compiler. In my opinion, we generally
> > > use READ_ONCE() on pointers for other uses (such as, avoid
> > > accessing a variable twice due to compiler optimization and
> > > it will break some logic potentially or need some data
> > > dependency barrier...)
> > > 
> > > Thanks,
> > > Gao Xiang
> > 
> > But that *is* why we need READ_ONCE() here.  Without it, there's no guarantee
> > that the compiler doesn't load the variable twice.  Please read:
> > https://github.com/google/ktsan/wiki/READ_ONCE-and-WRITE_ONCE
> 
> After scanning the patch, it seems the parent variable (dentry->d_parent)
> only referenced once as below:
> 
> -	struct inode *inode = dentry->d_parent->d_inode;
> +	const struct dentry *parent = READ_ONCE(dentry->d_parent);
> +	const struct inode *inode = READ_ONCE(parent->d_inode);
> 
> So I think it is enough as
> 
> 	const struct inode *inode = READ_ONCE(dentry->d_parent->d_inode);
> 
> to access parent inode once to avoid parent inode being accessed
> for more time (and all pointers dereference should be in atomic
> by compilers) as one reason on
> 
> 	if (!inode || !IS_CASEFOLDED(inode) || ...
> 
> or etc.
> 
> Thanks for your web reference, I will look into it. I think there
> is no worry about dentry->d_parent here because of this only one
> dereference on dentry->d_parent.
> 
> You could ignore my words anyway, just my little thought though.
> Other part of the patch is ok.
> 

While that does make it really unlikely to cause a real-world problem, it's
still undefined behavior to not properly annotate a data race, it would make the
code harder to understand as there would be no indication that there's a data
race, and it would confuse tools that try to automatically detect data races.
So let's keep the READ_ONCE() on d_parent.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
