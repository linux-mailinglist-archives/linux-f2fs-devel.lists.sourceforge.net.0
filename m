Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C61A140A5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Jan 2025 18:19:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tYTX2-0008Qx-GX;
	Thu, 16 Jan 2025 17:19:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tYTWr-0008Qj-CL
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Jan 2025 17:19:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K83s17qhKLKNiNeXUekNNsseP2oWDRj3eicnDL1qcEE=; b=jnhroiqwKb3DgeBCXX2SeqKV2k
 t+Q4edJkMuGGORUjpDhirw1kh4CSW61V6S6MaamC2bLJUaZ5T/2EJC88DG/KSZki5de15JHieQlqy
 BcEDfAZK9KBkueZp/rQrX3CW3zRKnOlDqba2P3Fs8r+Hl/Bmrg87SBSSIcTiEWiyDUAE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K83s17qhKLKNiNeXUekNNsseP2oWDRj3eicnDL1qcEE=; b=XzDYbfmx8hGQrl1hFXyUUMAmS1
 9Du/kcpCNjKH616WiB3+bvzx7sauiOPro2meG/WDMPFxcrmSVq1BoeeC21LGIwv8HlVELqTtjthr7
 gUaDqNkpNGoyI6EhcIiqhu8prqu1RZ29Gf1U9TdCvak2PtOzAgqGxxg1lV1s+x3sY8Yk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tYTWq-00017f-QE for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Jan 2025 17:19:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BC1495C5D37;
 Thu, 16 Jan 2025 17:18:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C63B6C4CEE2;
 Thu, 16 Jan 2025 17:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737047966;
 bh=YIoWdKHGdFmsZJhT/FUx6sQICOoP0aC2w3v4diiifNg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KWDASun1oa3I5A0jonA1qX+rkJH+mPfklPrR3+kUsyVih2hdO2dEMlY05XL8WJF9e
 +yFUt6VgOCkIvGT75OxuRkEFsRkvMVHnkSgGuaQTt4U3ZtC8t5inP2v8117FJWh3Ho
 6Cv0xUF0+n8duBz4M37XdjCVS1C9Scuov/yCP7yO2WTUZuncKsYY4BRIE7By5VIcsD
 sTA0KirRW9AsOS3Ok6IaaBcf5DyuWJ2w6c0sflr3lnoPne6MLVra7dm564sbUd9Ni0
 F16fKJYG5VkOS436XrHO3C0KLpIABvqqzbgHIJr7CBKidmXLt/QuPeugLZQl0ohCiB
 H1S2yWUo0cDaA==
Date: Thu, 16 Jan 2025 17:19:24 +0000
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <Z4k_nKT3V1xuhXGc@google.com>
References: <20250115221814.1920703-1-jaegeuk@kernel.org>
 <20250115221814.1920703-2-jaegeuk@kernel.org>
 <Z4imEs-Se-VWcpBG@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z4imEs-Se-VWcpBG@infradead.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 01/15, Christoph Hellwig wrote: > On Wed, Jan 15, 2025
 at 10:16:51PM +0000, Jaegeuk Kim wrote: > > This patch introduces an inode
 list to keep the page cache ranges that users > > can donate pages [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tYTWq-00017f-QE
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: register inodes which is able to
 donate pages
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
Cc: linux-man@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/15, Christoph Hellwig wrote:
> On Wed, Jan 15, 2025 at 10:16:51PM +0000, Jaegeuk Kim wrote:
> > This patch introduces an inode list to keep the page cache ranges that users
> > can donate pages together.
> > 
> >  #define F2FS_IOC_DONATE_RANGE		_IOW(F2FS_IOCTL_MAGIC, 27,	\
> > 						struct f2fs_donate_range)
> >  struct f2fs_donate_range {
> > 	__u64 start;
> > 	__u64 len;
> >  };
> 
> > e.g., ioctl(F2FS_IOC_DONATE_RANGE, &range);
> 
> This is not a very good description.  "donate" here seems to basically
> mean a invalidate_inode_pages2_range.  Which is a strange use of the
> word.  what are the use cases?  Why is this queued up to a thread and
> not done inline?  Why is this in f2fs and not in common code.

The idea is let apps register some file ranges for page donation and admin
recliam such pages all togehter if they expect to see memory pressure soon.
We can rely on LRU, but this is more user-given trigger. I'm not sure whether
there's a need in general, hence, wanted to put it in f2fs first to get more
concrete use-cases beyond this Android case.

> 
> I also which file systems wouldn't just add random fs specific ioctls
> all the time without any kinds of discussion of the API.  f2fs is by
> far the worst offender there, but not the only one.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
