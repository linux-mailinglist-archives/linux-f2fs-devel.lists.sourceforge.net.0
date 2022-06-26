Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 281E855AFF2
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 26 Jun 2022 09:44:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o5Mwm-0003Mq-2J; Sun, 26 Jun 2022 07:44:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <BATV+65d228a9ba3d1088b97d+6881+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1o5Mwj-0003Mg-7Q
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 26 Jun 2022 07:44:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZYf9S+9v8SssB2f7SI0aLipRvyLjpdyjZAR4xNwIlyA=; b=CCl9TlHLhw2PCO+YRBmx72ou4A
 4T1l4x5cOvl1ljSmc02IZCJVhmqL0xgQLnNzSmURYGKC510gqFW1duAPCoaEn45HKc6yUn+UBt/ka
 m004C82YEBtxFGS/hRvtE8ZqjwMWpWxmljb0oRqTC2r8XPoIplNt2rvxQ5TKKIrcdjzc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZYf9S+9v8SssB2f7SI0aLipRvyLjpdyjZAR4xNwIlyA=; b=cLnxC69m/CiejPW0HQ2gbedO6T
 JAExejjV/5HMx/yHjywx2SWhaE4R4LgMXb0cCpTpaYbGIIl2YVwf2+cXUI80xb2CFfZmu8hQFf0oP
 B/QNocjsiv87K2G98YT10Jc8fD84xFY3If53kXycaCZ1956xOjrED4+SQSxWRCVYOaUg=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o5Mwe-00EE0V-QC
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 26 Jun 2022 07:44:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ZYf9S+9v8SssB2f7SI0aLipRvyLjpdyjZAR4xNwIlyA=; b=ku+r4DqZkB95/Xfmh9ue6cm+09
 CyOJKQrOsW5u38sU/yT0ordtzA+/36HzICae4wQDfFz2S+Hbn5laa+W58cHSq5nsw9ipLZBhM3hNJ
 mXF+/5KDpW3EpisCVvR/XT04v0kdwEIr/NbG8Gznzxnrgcre+KeUy/4U2wO3EW4cPCpzcGr7sZHu4
 G5qwtDrH1THEWNH3Y/cvkvBxQihfsVriRfNB5vflSLMXblFCTZcFF8+Yvxqhcd26i6lzK4QaFpaDi
 Bn+3NT5N/eBtb5v+o6f9b2xcqVfF+oWNL2sc+ddYWmhqUodeV8wXtxU1nuUXbY0dI+3z1TddPdJIk
 AQTuUgeQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1o5MwN-00ARUE-Bk; Sun, 26 Jun 2022 07:44:19 +0000
Date: Sun, 26 Jun 2022 00:44:19 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Avi Kivity <avi@scylladb.com>
Message-ID: <YrgOUw6YM2c6k59U@infradead.org>
References: <20220616201506.124209-1-ebiggers@kernel.org>
 <20220616201506.124209-2-ebiggers@kernel.org>
 <6c06b2d4-2d96-c4a6-7aca-5147a91e7cf2@scylladb.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6c06b2d4-2d96-c4a6-7aca-5147a91e7cf2@scylladb.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Jun 19, 2022 at 02:30:47PM +0300, Avi Kivity wrote:
 > > * stx_dio_offset_align: the alignment (in bytes) required for file >
 > offsets and I/O segment lengths for DIO, or 0 if DIO is not suppo [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1o5Mwe-00EE0V-QC
Subject: Re: [f2fs-dev] [PATCH v3 1/8] statx: add direct I/O alignment
 information
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
Cc: linux-xfs@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, Keith Busch <kbusch@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Jun 19, 2022 at 02:30:47PM +0300, Avi Kivity wrote:
> > * stx_dio_offset_align: the alignment (in bytes) required for file
> >    offsets and I/O segment lengths for DIO, or 0 if DIO is not supported
> >    on the file.  This will only be nonzero if stx_dio_mem_align is
> >    nonzero, and vice versa.
> 
> 
> If you consider AIO, this is actually three alignments:
> 
> 1. offset alignment for reads (sector size in XFS)
> 
> 2. offset alignment for overwrites (sector size in XFS since ed1128c2d0c87e,
> block size earlier)
> 
> 3. offset alignment for appending writes (block size)
> 
> 
> This is critical for linux-aio since violation of these alignments will
> stall the io_submit system call. Perhaps io_uring handles it better by
> bouncing to a workqueue, but there is a significant performance and latency
> penalty for that.

I think you are mixing things up here.  We actually have two limits that
matter:

 a) the hard limit, which if violated will return an error.
    This has been sector size for all common file systems for years,
    but can be bigger than that with fscrypt in the game (which
    triggered this series)
 b) an optimal write size, which can be done asynchronous and
    without exclusive locking.
    This is what your cases 2) and 3) above refer to.

Exposting this additional optimal performance size might be a good idea
in addition to what is proposed here, even if matters a little less
with io_uring.  But I'm not sure I'd additional split it into append
vs overwrite vs hole filling but just round up to the maximum of those.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
