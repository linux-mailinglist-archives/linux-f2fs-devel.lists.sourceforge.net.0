Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D5416AC34
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Feb 2020 17:53:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6Gyv-0003uY-NI; Mon, 24 Feb 2020 16:53:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <darrick.wong@oracle.com>) id 1j6Gyt-0003uM-UM
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 16:53:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qQvLoc3+jAuvV02vRfkJ9Yw1PdW1Bn0rhGLTddtKqpU=; b=SieSWECqZZNOrCElWq3MzBjevJ
 Bh1gjPVzI5+oVHAydEStQrL7g0x27jCsFWe3GSSQoy502UJyZQPwxufiBnv+f7hMhsaVumoybo+4O
 LOlMiHIywbgUuwVNsapdjzUEpfsxE0WArrW0IPD5v8CCM6KsGbNKqKDtVmvgzlKJYS/A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qQvLoc3+jAuvV02vRfkJ9Yw1PdW1Bn0rhGLTddtKqpU=; b=ZSTcxp6PgmkrXpmd6YYtMWJdFA
 whvnF+yQcn9R2//LoYCLiGqpuYpMXfzlr1CAhKT+bExRyz8yid1y7FrBq0/lM99A6cnXpfQukr2Kr
 8G3I+Ju6hC/m65lfTye2TSM6HjoV7PRoOapPY81nJH3FUeVk8iHtl+dulb957ijK8Fqg=;
Received: from aserp2120.oracle.com ([141.146.126.78])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j6Gyp-008p0G-Lp
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 16:53:19 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01OGXk6G161015;
 Mon, 24 Feb 2020 16:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=qQvLoc3+jAuvV02vRfkJ9Yw1PdW1Bn0rhGLTddtKqpU=;
 b=SBdKy4PkCyjA9p4DNjJcshIU3DwIMpNFsdE2tStj9Qp5FXU6ijiLTQcI/7LRWsIjYLHp
 g+0gk8Z5TSTDk2s4zPmxpbnWOQvnveAUuWxvt/Z0AoORrNs51oBxkJVoarDM9RS9uJvV
 vg5W6mivY42ZvhTqMuWEpRFgKI5RbgWnUrrsebAR5s3HuKLknCvQF/jQRGtfR/v4agqY
 xdKIDafPDu/jgv6mKBsTccYFU48Uu8+kPAAP01C1IVt36VjRvxagd24M0Zp/MzxlOE3S
 QPGGuQrkXYxRt1m4fPwQBsQHDD3O0hY7anZZGaWqHkPugsxrYY8jsrzCDvo3W2MQlrRC Hw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2ybvr4mwhb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Feb 2020 16:52:48 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01OGW70l165513;
 Mon, 24 Feb 2020 16:52:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 2yby5cs488-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 24 Feb 2020 16:52:48 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01OGq2Tj073644;
 Mon, 24 Feb 2020 16:52:47 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 2yby5cs464-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Feb 2020 16:52:47 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 01OGqjpe019886;
 Mon, 24 Feb 2020 16:52:45 GMT
Received: from localhost (/67.169.218.210)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 24 Feb 2020 08:52:45 -0800
Date: Mon, 24 Feb 2020 08:52:44 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200224165244.GA6731@magnolia>
References: <20200219210103.32400-1-willy@infradead.org>
 <20200219210103.32400-23-willy@infradead.org>
 <20200220154912.GC19577@infradead.org>
 <20200220165734.GZ24185@bombadil.infradead.org>
 <20200222010013.GH9506@magnolia>
 <20200224043355.GL24185@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224043355.GL24185@bombadil.infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9541
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002240129
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j6Gyp-008p0G-Lp
Subject: Re: [f2fs-dev] [PATCH v7 22/24] iomap: Convert from readpages to
 readahead
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Feb 23, 2020 at 08:33:55PM -0800, Matthew Wilcox wrote:
> On Fri, Feb 21, 2020 at 05:00:13PM -0800, Darrick J. Wong wrote:
> > On Thu, Feb 20, 2020 at 08:57:34AM -0800, Matthew Wilcox wrote:
> > > On Thu, Feb 20, 2020 at 07:49:12AM -0800, Christoph Hellwig wrote:
> > > +/**
> > > + * iomap_readahead - Attempt to read pages from a file.
> > > + * @rac: Describes the pages to be read.
> > > + * @ops: The operations vector for the filesystem.
> > > + *
> > > + * This function is for filesystems to call to implement their readahead
> > > + * address_space operation.
> > > + *
> > > + * Context: The file is pinned by the caller, and the pages to be read are
> > > + * all locked and have an elevated refcount.  This function will unlock
> > > + * the pages (once I/O has completed on them, or I/O has been determined to
> > > + * not be necessary).  It will also decrease the refcount once the pages
> > > + * have been submitted for I/O.  After this point, the page may be removed
> > > + * from the page cache, and should not be referenced.
> > > + */
> > > 
> > > > Isn't the context documentation something that belongs into the aop
> > > > documentation?  I've never really seen the value of duplicating this
> > > > information in method instances, as it is just bound to be out of date
> > > > rather sooner than later.
> > > 
> > > I'm in two minds about it as well.  There's definitely no value in
> > > providing kernel-doc for implementations of a common interface ... so
> > > rather than fixing the nilfs2 kernel-doc, I just deleted it.  But this
> > > isn't just the implementation, like nilfs2_readahead() is, it's a library
> > > function for filesystems to call, so it deserves documentation.  On the
> > > other hand, there's no real thought to this on the part of the filesystem;
> > > the implementation just calls this with the appropriate ops pointer.
> > > 
> > > Then again, I kind of feel like we need more documentation of iomap to
> > > help filesystems convert to using it.  But maybe kernel-doc isn't the
> > > mechanism to provide that.
> > 
> > I think we need more documentation of the parts of iomap where it can
> > call back into the filesystem (looking at you, iomap_dio_ops).
> > 
> > I'm not opposed to letting this comment stay, though I don't see it as
> > all that necessary since iomap_readahead implements a callout that's
> > documented in vfs.rst and is thus subject to all the constraints listed
> > in the (*readahead) documentation.
> 
> Right.  And that's not currently in kernel-doc format, but should be.
> Something for a different patchset, IMO.
> 
> What we need documenting _here_ is the conditions under which the
> iomap_ops are called so the filesystem author doesn't need to piece them
> together from three different places.  Here's what I currently have:
> 
>  * Context: The @ops callbacks may submit I/O (eg to read the addresses of
>  * blocks from disc), and may wait for it.  The caller may be trying to
>  * access a different page, and so sleeping excessively should be avoided.
>  * It may allocate memory, but should avoid large allocations.  This
>  * function is called with memalloc_nofs set, so allocations will not cause
>  * the filesystem to be reentered.

How large? :)

--D


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
