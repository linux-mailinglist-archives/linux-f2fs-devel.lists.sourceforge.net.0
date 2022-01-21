Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE02495A65
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Jan 2022 08:13:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nAo6m-0004ix-C1; Fri, 21 Jan 2022 07:13:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <BATV+e38482cd6722563dea4e+6725+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1nAo6k-0004im-JA
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Jan 2022 07:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3xQuu5tx1EVXpvy8gXk3sJ9oqDEqzzzoX73hPh5DOfA=; b=YzLIG+d+qxdTZMar/IxctTrbr8
 Dto2k1FINRVoK/dqkViMjoO6IDkrI+a7+3FeqW3ztBE+XmcHLjJlrTzqf4hmqRYFmvVIPalxmXgMF
 zFYJ5w7qbFMTK555PJTjY/Plds/VcEUyXaYzGPRpVd6fUFn/0zHeIbZ60N6zWcSdwZB4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3xQuu5tx1EVXpvy8gXk3sJ9oqDEqzzzoX73hPh5DOfA=; b=VI2LS9mEaXUe/zCUS+s2OVIR2h
 ZHT4IJeRgZigm/avGf2tsX7cek89ZkmZKaBnL1hGEoQ6qSBtqLORdyWkGtARYrD3TsZxNL+Me9FOM
 BAga095Qpzoydensge2j8PPYsRYF4kYKrhGR36DYCu02XXyV0hD8bv2YYxmgB2+xxXeY=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1nAo6f-0006Zn-9m
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Jan 2022 07:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=3xQuu5tx1EVXpvy8gXk3sJ9oqDEqzzzoX73hPh5DOfA=; b=q8Mnz0Gu2GNpfhG/y3b/jMfQWZ
 mrffWaQqN4RqOjJuC4ulhiTWsAkL/RACkK6FG43IXgNrMmZ2ObvkbaNdiwzYoorsoRl43aRSgDFDl
 GjEvNumk7JqTJq9J6ggkGCUYci/n+AXZ5zEGP8/NG6QsGIn+KdsUUitgTHMGzVG7b0cOfSwHdMZvD
 21D9iTrO/B9kHAYKo2GVNsUx1xxKLpW7+/eUQLNaVaN/yVYE2izpcQ2WOte5HOGUcujc7WjqBwK3V
 VWrIsvlUxABtXb2ZoKLsrZkhJD+qMBbGE6i2Mi6YVINqkulvo8ShP2gqaF5FOMpt71no8rw0g0Cv2
 +1gJdHPw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nAo6S-00E1l5-Pa; Fri, 21 Jan 2022 07:12:56 +0000
Date: Thu, 20 Jan 2022 23:12:56 -0800
From: Christoph Hellwig <hch@infradead.org>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <Yepc+JcZiICsJfTQ@infradead.org>
References: <20220120071215.123274-1-ebiggers@kernel.org>
 <YekdnxpeunTGfXqX@infradead.org> <20220120171027.GL13540@magnolia>
 <YenIcshA706d/ziV@sol.localdomain>
 <20220120210027.GQ13540@magnolia>
 <20220120220414.GH59729@dread.disaster.area>
 <Yenm1Ipx87JAlyXg@sol.localdomain>
 <20220120235755.GI59729@dread.disaster.area>
 <20220121023603.GH13563@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220121023603.GH13563@magnolia>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 20, 2022 at 06:36:03PM -0800, Darrick J. Wong
 wrote: > Sure. How's this? I couldn't think of a real case of directio >
 requiring
 different alignments for pos and bytecount, so the only rea [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1nAo6f-0006Zn-9m
Subject: Re: [f2fs-dev] [PATCH v10 0/5] add support for direct I/O with
 fscrypt using blk-crypto
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
Cc: Christoph Hellwig <hch@infradead.org>, Theodore Ts'o <tytso@mit.edu>,
 Dave Chinner <david@fromorbit.com>, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jan 20, 2022 at 06:36:03PM -0800, Darrick J. Wong wrote:
> Sure.  How's this?  I couldn't think of a real case of directio
> requiring different alignments for pos and bytecount, so the only real
> addition here is the alignment requirements for best performance.

While I see some benefits of adding the information to a catchall like
statx we really need to be careful to not bloat the structure like
crazy.

> struct statx {
> ...
> 	/* 0x90 */
> 	__u64	stx_mnt_id;
> 
> 	/* Memory buffer alignment required for directio, in bytes. */
> 	__u32	stx_dio_mem_align;
> 
> 	/* File range alignment required for directio, in bytes. */
> 	__u32	stx_dio_fpos_align_min;

So this really needs a good explanation why we need both iven that we
had no real use case for this.

> 	/* File range alignment needed for best performance, in bytes. */
> 	__u32	stx_dio_fpos_align_opt;

And why we really care about this.  I guess you want to allow sector
size dio in reflink setups, but discourage it.  But is this really as
important?

> 	/* Maximum size of a directio request, in bytes. */
> 	__u32	stx_dio_max_iosize;

I know XFS_IOC_DIOINFO had this, but does it really make much sense?
Why do we need it for direct I/O and not buffered I/O?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
