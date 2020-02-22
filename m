Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECCC168B51
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 22 Feb 2020 02:00:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j5J9u-0003gt-7Q; Sat, 22 Feb 2020 01:00:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <darrick.wong@oracle.com>) id 1j5J9s-0003gV-Qm
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Feb 2020 01:00:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VcOdDrdgp6sTa2C/PE8UFkKJ4XmWQi4h4q5KM+wvorQ=; b=e1uesY0FFIjJ/86iHhwJldFy6l
 ynOJdQjs+WIA5o1AjlTLSbij1vQutvFBSMJMyyzeJRmpaOZDgOpGI7e0oze9NSVPJ992en9WpqGgp
 GHKwDZg2mVPhV+Bz+5cemVBF6FheseKKoksgusB3oO+81MMR4QGMWXncGVFTZ1c5ujnE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VcOdDrdgp6sTa2C/PE8UFkKJ4XmWQi4h4q5KM+wvorQ=; b=YN48VLEflcU/5bDdYIpSaR/jO/
 y8m6GHMOJwTiW0P3V3//TOkonOTXyFne5ZUx5zz1csCDiv+jzk91p+iUtcI5RmE1t0WFkGRhhkXZK
 bUKJtlQJD6jKRLLnra1/BBaM2BJBTp21Rx93czbxYgDepzYtTsalh+n3xh8gnqFXemBY=;
Received: from userp2130.oracle.com ([156.151.31.86])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j5J9o-003gds-Mp
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Feb 2020 01:00:40 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01M0wwHb129568;
 Sat, 22 Feb 2020 01:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=VcOdDrdgp6sTa2C/PE8UFkKJ4XmWQi4h4q5KM+wvorQ=;
 b=Qw9/5EygXyPqZTaT1/YntEwofNrMw4v86w6icv8lCqeyY+8kexnyOFb7+8XLTT1hyWWJ
 tEEQxaNC0+/AWCv8NKpg0xnsAIwKPe5Pu8cyP1sB66hBY/h4m/euRaClgUVYzuBmpgs8
 1tJLQrIvuEeN9AeNQD3tE00eUTYUJoQDicvqX6hlwrP2i4OqShE5zpGZxrDPiOK0/w3Q
 Ju1O2Zc2cdfyIH1Mw2INeYU+ooi8ekwGDOxhgP/e443KVEtqp81ZRwjQkyilp18I5+Az
 SEQRfVIjVNGt2OwZZmRFTo5xmlZjCSjSg7XjD2+k4ub0ZEx3yaV87SMBmUKXlWuUsDC7 4Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2y8uddkkxh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 22 Feb 2020 01:00:17 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01M0wAGX166595;
 Sat, 22 Feb 2020 01:00:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 2y8udrmdde-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 22 Feb 2020 01:00:16 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01M10Gmj170782;
 Sat, 22 Feb 2020 01:00:16 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 2y8udrmdb3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 22 Feb 2020 01:00:16 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 01M10Ft2027686;
 Sat, 22 Feb 2020 01:00:15 GMT
Received: from localhost (/10.145.179.117)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 21 Feb 2020 17:00:15 -0800
Date: Fri, 21 Feb 2020 17:00:13 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200222010013.GH9506@magnolia>
References: <20200219210103.32400-1-willy@infradead.org>
 <20200219210103.32400-23-willy@infradead.org>
 <20200220154912.GC19577@infradead.org>
 <20200220165734.GZ24185@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200220165734.GZ24185@bombadil.infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9538
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 impostorscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002220003
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
X-Headers-End: 1j5J9o-003gds-Mp
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

On Thu, Feb 20, 2020 at 08:57:34AM -0800, Matthew Wilcox wrote:
> On Thu, Feb 20, 2020 at 07:49:12AM -0800, Christoph Hellwig wrote:
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
> > 
> > Isn't the context documentation something that belongs into the aop
> > documentation?  I've never really seen the value of duplicating this
> > information in method instances, as it is just bound to be out of date
> > rather sooner than later.
> 
> I'm in two minds about it as well.  There's definitely no value in
> providing kernel-doc for implementations of a common interface ... so
> rather than fixing the nilfs2 kernel-doc, I just deleted it.  But this
> isn't just the implementation, like nilfs2_readahead() is, it's a library
> function for filesystems to call, so it deserves documentation.  On the
> other hand, there's no real thought to this on the part of the filesystem;
> the implementation just calls this with the appropriate ops pointer.
> 
> Then again, I kind of feel like we need more documentation of iomap to
> help filesystems convert to using it.  But maybe kernel-doc isn't the
> mechanism to provide that.

I think we need more documentation of the parts of iomap where it can
call back into the filesystem (looking at you, iomap_dio_ops).

I'm not opposed to letting this comment stay, though I don't see it as
all that necessary since iomap_readahead implements a callout that's
documented in vfs.rst and is thus subject to all the constraints listed
in the (*readahead) documentation.

--D


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
