Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C31832DB16
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Mar 2021 21:20:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lHuSi-0000Pr-TN; Thu, 04 Mar 2021 20:20:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lHuSh-0000Pb-Ag
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Mar 2021 20:20:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n3bv559eW8MeU2X4TaEAzz022lWOr9kHtdrukxSmyrk=; b=gsNefM5OGR0rsi0FlFHGPA1wb0
 0L80EIySGeNKVLjR1spa8s+P71iAoXkM+QICtmqtkd9VyIc5mhgP+Zz2dsE/iTN2PKrm+zOitEMOk
 i7K8g/3HGSUcj4wHy/CWRJmIxnQEYaetfYdRtrfB5EuCcCi6wqX8gl1SW9xAxN6xDq6c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=n3bv559eW8MeU2X4TaEAzz022lWOr9kHtdrukxSmyrk=; b=meQZNyYImO245Zl+obCWKWTT3t
 y1BfkO/6BLsI6hqc7MKNl/waxniNml3oZIEOrfg8BnAAQbn8RR0NiFeLnCY6xd63D4D7KObgZ1fpc
 4PmtxmZpYFNvlaoLipOyNhy1tvnEw5Q1fhdXNlFEt7Cw1GS8U8OXtBcXFjnzi6qm7mLA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lHuSV-0007WE-RI
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Mar 2021 20:20:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CDE7D64F69;
 Thu,  4 Mar 2021 20:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614889220;
 bh=PK2fbfeEfKO2itjb1QWIZjHnUzohmqddhbtXHSB6zF8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iPTNuML+CXWJc09vt0JYNp710dMBVnLADtpB4+ca+W/0ZIp4JpYS7Mnz0y4PmsJuF
 0Z6IObjrFUS2/EHJ3bz1dGqsJKPryDiRtPUyZGkogQm8ISA+jCHka3xootyQXVQrV6
 vgS9r2c+eItNlycKDnzUm4g2Hq6h9ikuwbHBCnLUAP0mDm85rIPzklf7JMDIrThp1v
 yAbtzBIYK3p0Y+mZD0xwmZPg+FMLty+/Zec/DCWjC0x85qDA3F2W7jCQPlA5p1XZkW
 g7BaFPbA3NicrIr64iedQlKrKcgm02ZxHRzd+S+P2WDrdecAhCxF0aJKtV7OSh2M3T
 vrKQE3J+6hL0A==
Date: Thu, 4 Mar 2021 12:20:18 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YEFBAuP26t0RzVHZ@google.com>
References: <20210202080056.51658-1-yuchao0@huawei.com>
 <46e9924c-0086-cd2a-2e93-7149b92ba27e@huawei.com>
 <YDsleDjeIcpuBXKA@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YDsleDjeIcpuBXKA@google.com>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lHuSV-0007WE-RI
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

On 02/27, Jaegeuk Kim wrote:
> On 02/04, Chao Yu wrote:
> > Jaegeuk,
> > 
> > On 2021/2/2 16:00, Chao Yu wrote:
> > > -	for (i = 0; i < dic->nr_cpages; i++) {
> > > +	for (i = 0; i < cc->nr_cpages; i++) {
> > >   		struct page *page = dic->cpages[i];
> > 
> > por_fsstress still hang in this line?
> 
> I'm stuck on testing the patches, since the latest kernel is panicking somehow.
> Let me update later, once I can test a bit. :(

It seems this works without error.
https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=4e6e1364dccba80ed44925870b97fbcf989b96c9

> 
> > 
> > Thanks,
> > 
> > >   		block_t blkaddr;
> > >   		struct bio_post_read_ctx *ctx;
> > > @@ -2201,6 +2207,14 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
> > >   		blkaddr = data_blkaddr(dn.inode, dn.node_page,
> > >   						dn.ofs_in_node + i + 1);
> > > +		f2fs_wait_on_block_writeback(inode, blkaddr);
> > > +
> > > +		if (f2fs_load_compressed_page(sbi, page, blkaddr)) {
> > > +			if (atomic_dec_and_test(&dic->remaining_pages))
> > > +				f2fs_decompress_cluster(dic);
> > > +			continue;
> > > +		}
> > > +
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
