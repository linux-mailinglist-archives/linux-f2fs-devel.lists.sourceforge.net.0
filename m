Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8D932704D
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Feb 2021 06:09:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lGEKe-0008Az-Ep; Sun, 28 Feb 2021 05:09:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lGEKd-0008Aq-Pn
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Feb 2021 05:09:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=edjxBnr+NRL4AZo14FPQM4KXPTe4NntSz26M9HapUP4=; b=NrIKXQNtOdBiIkaHnVqXtCs5Ne
 d78TyivZcxbAp6zyIBS95jxK2kU/sJYqbn2BSSwN147oiUEokmb/L/VG8Rf4qac/oNL1SxagQDhmj
 rL4Mvu1OJZqmQlMyGW8EpWrPnGxy7xm56xc83aD1PJ76FTSTQjfF+7g93p5QI/lIczlk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=edjxBnr+NRL4AZo14FPQM4KXPTe4NntSz26M9HapUP4=; b=IDAnMHBafzVBzytJ5C+BDl22uO
 b//a62u3WFNUJmUK5f7DIlsHtA4poDWa48/0wDNCWmC1CYZ0ryqpxIh7fI+vSB8/wySnM+LKcgFrG
 1LrEadlbmr30s+YBAWZWE81o26s03cbP/im0fx9NanWF1skCM8Js+rtF6JFj2DqSLf/o=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lGEKV-008HH5-Re
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Feb 2021 05:09:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7555364DEF;
 Sun, 28 Feb 2021 05:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614488953;
 bh=Ej6/D8sPUSzoSYrBsnK9kjX3l7rsK8BCE0b9CJjqLUE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F1GJ0gRVCEXahurUhNi6t5VsEpwyQPaPvh4qowDcOmdn/4k5vhlnqgJHUEsnrmn19
 pgdmQLizXxd6pcjBbGgbDPJjTOoRz/xObRjJnTGJJYYbto0XyMP7XGGT69v4ZkDxWC
 FGkMfY2TP1QOiKj0jKCIm9vx9obhpJ1sEeSj8c5BA/I5XrwiVYgwFjI53yagGBSwAU
 qUDYJsdYkSrmZSIoua0hzjNx4a5SHn4yZIYGpccbTtoWYUoPj0y6OrwmSriqFSWFd0
 ZckQiM80uPXCrj/J5YzvTpJBjbsr+MnCfQcrAd4hllOXyjKZ7f/vz5VC9msX5/XP2J
 m+NEd4DoDbOyQ==
Date: Sat, 27 Feb 2021 21:09:12 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YDsleDjeIcpuBXKA@google.com>
References: <20210202080056.51658-1-yuchao0@huawei.com>
 <46e9924c-0086-cd2a-2e93-7149b92ba27e@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <46e9924c-0086-cd2a-2e93-7149b92ba27e@huawei.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lGEKV-008HH5-Re
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: compress: add compress_inode to
 cache compressed blockst
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

On 02/04, Chao Yu wrote:
> Jaegeuk,
> 
> On 2021/2/2 16:00, Chao Yu wrote:
> > -	for (i = 0; i < dic->nr_cpages; i++) {
> > +	for (i = 0; i < cc->nr_cpages; i++) {
> >   		struct page *page = dic->cpages[i];
> 
> por_fsstress still hang in this line?

I'm stuck on testing the patches, since the latest kernel is panicking somehow.
Let me update later, once I can test a bit. :(

> 
> Thanks,
> 
> >   		block_t blkaddr;
> >   		struct bio_post_read_ctx *ctx;
> > @@ -2201,6 +2207,14 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
> >   		blkaddr = data_blkaddr(dn.inode, dn.node_page,
> >   						dn.ofs_in_node + i + 1);
> > +		f2fs_wait_on_block_writeback(inode, blkaddr);
> > +
> > +		if (f2fs_load_compressed_page(sbi, page, blkaddr)) {
> > +			if (atomic_dec_and_test(&dic->remaining_pages))
> > +				f2fs_decompress_cluster(dic);
> > +			continue;
> > +		}
> > +


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
