Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F4A3B9C27
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Jul 2021 08:25:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lzCbc-0006dl-9p; Fri, 02 Jul 2021 06:24:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lzCba-0006dd-Lf
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Jul 2021 06:24:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xIVI28LRNL9YzvJpOkLBhDf6unngMFTbHMLAz37ZlyA=; b=hkj8IC932raaTEYuaN62AZIY9z
 f8UPAG9gga4pc3xtjckCXRVFrD9aJZzV3psK3zs9c/xT5wkKDT2oIoppA/3eKdnTEUKcnwxIJNqlG
 W/Q8ddIAX/UjnMX/1+837tv7OVPjqwRA/ZnSwlTVmMBJ61Nzt7LKw0mT0O7JXuGpNcvQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xIVI28LRNL9YzvJpOkLBhDf6unngMFTbHMLAz37ZlyA=; b=hYHCm/vVxdTqm80ugNFdKw1bC0
 S87tOMU9cKQshgVX25saYC2wNVrEI/1RLcSQ+J8qJYOIAh9Nxua4y0uPzvQKYnc7t/LRLrDBXznvm
 cgawtWoUVo7ODoNrpCjeq/PH5H3gt/03OYhw1OMIi128QWXO2zr5Nl9Qe46dKP1q0/7A=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lzCbH-0002wd-AB
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Jul 2021 06:24:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B0B95613AE;
 Fri,  2 Jul 2021 06:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625207065;
 bh=78aieK3yLkBbBM35gqkQoAslyDNe/7I9TMjZziwJmKw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sxyTC/ujn+406tXpstta7EdVKjL47++R/vCaPuwUbAEdWnHiGSFKK17AwQDCahe7O
 7IeYIIawovRim0E3VXtmdMTuRCxJZp3hqCN3ifSG/S3HTg0fAqDqXEhwZyrbxXjAGj
 izJOeoNny01DRMlueEj2UDaPqvsntaMrslaVcfb2JBw/xdnEQF9G2lNfiAezEzSSBM
 FEie6PwmRleL3BbqoBCx/ouwSu6sk05yxVBiOv4tlCqC58QxujOr2vzd0upkqINgsx
 Oub0IKrmwUDNLSCcQmKsGvg7Ou7/Kmp/clhHMasFeqnxdeB8OmsGMwG03/0vlP//mX
 vFH5tcUrRqTlQ==
Date: Thu, 1 Jul 2021 23:24:24 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Fengnan Chang <changfengnan@vivo.com>
Message-ID: <YN6xGCuGY9xjtAYw@google.com>
References: <003001d75913$aff3cc40$0fdb64c0$@vivo.com>
 <YN32CHiLz0lbpwMF@google.com>
 <de2c95be-e00d-205e-4b57-b168fbaaf9d0@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <de2c95be-e00d-205e-4b57-b168fbaaf9d0@vivo.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lzCbH-0002wd-AB
Subject: Re: [f2fs-dev] f2fs compress performance problem
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/02, Fengnan Chang wrote:
> Yes, I had enable compress_cache and extent_cache, compress_cache indeed can
> improve random read performance, but couldn't improve other test case.And
> extent_cache was default enabled in my test.

Sorry, we enabled extent_cache for RO partition only.

static inline bool f2fs_may_extent_tree(struct inode *inode)
{
	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);

	if (!test_opt(sbi, EXTENT_CACHE) ||
			is_inode_flag_set(inode, FI_NO_EXTENT) ||
			(is_inode_flag_set(inode, FI_COMPRESSED_FILE) &&
			 !f2fs_sb_has_readonly(sbi)))
		return false;
...


> 
> 
> Fix the description of the previous email:
>  4. 4K random overwrite has dropped to 1% of original, yes only 1% of
> original, I found  open file with O_WRONLY|O_DSYNC|O_DIRECT is an important
> reason, every time sync a compress inode need do checkpoint, after I remove
> checkpoint on compress inode, up to 10% of original. If I set write size
> equal to cluster size,  it can up to 35% of original. And I think major
> reason of this is we need read whole cluster and rewrite it , I've been
> trying to get around this restriction recently, but haven't made any
> progress yet.
> 
> Thanks.
> 
> On 2021/7/2 1:06, Jaegeuk Kim wrote:
> > On 06/04, changfengnan@vivo.com wrote:
> > > Hi:
> > > 
> > > I've been working on f2fs compression for a while, I'm confused on f2fs
> > > compression performance, after a while reserch,
> > > I found some problem, maybe need some discuss.
> > > I use AndroBench test performance on mobile, after enable compression, the
> > > benchmark scores have dropped a lot.
> > > Specifically:
> > > 1. 32M sequential read has dropped to 50% of original. Test case open file
> > > with O_RDONLY|O_DIRECT, and set POSIX_FADV_RANDOM, the major resaon
> > > is disable readahed. For now,I didn't found any patch can improve this.
> > > 2. 4K random read has dropped to 40% of original, after merge `f2fs:
> > > compress: add compress_inode to cache compressed blocks`,
> > > significant improvement in random read performance, up to 90% of original,
> > > maybe more.
> > > 3. 32M sequential overwrite has dropped to 10% of original, after merge
> > > `f2fs: compress: remove unneeded read when rewrite whole cluster`
> > > up to 30% of original.
> > > 4. 4K random read has dropped to 1% of original, yes only 1% of original, I
> > > found  open file with O_WRONLY|O_DSYNC|O_DIRECT is  an important reason,
> > > every time sync a compress inode need do checkpoint, after I remove
> > > checkpoint on compress inode, up to 10% of original. And I think major
> > > reason of this
> > > is we need read whole cluster and rewrite it ,but I did't think of any
> > > method to improve this.
> > > 
> > > I want to know is there any idea can help to improve this.
> > > And I want to know do we have goal for the performance of compression, is it
> > > possible to achieve the original performance?
> > 
> > Could you please check compress_cache and extent_cache that can improve read
> > performance? Both were done quite recently.
> > 
> > > 
> > > Thanks.
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
