Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BF9169942
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 23 Feb 2020 18:58:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j5vW8-0002PC-CU; Sun, 23 Feb 2020 17:58:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <darrick.wong@oracle.com>) id 1j5vW6-0002Ow-NA
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 23 Feb 2020 17:58:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LL53eGqGjRhh2FS0FiyzWSm5OLgF8ml4hem9pzFTyEA=; b=fMumaN0L0b0m1h/CnDInWFNzts
 C8NB2nlYleSqTXSW3zCZC0r3EAZUxImWUKP6wDoXiKKBxE2ERbpq8ufwhe5VS9/eCcPxGzmwIJy9K
 PQ5pCWsrutX3KN1H6FCeScHgMBuifC8qVODgjvKyzewVx9Y4lnlSe+R77fQ5ulmGLGxM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LL53eGqGjRhh2FS0FiyzWSm5OLgF8ml4hem9pzFTyEA=; b=KqVRRKqoaEK4wpDliY2rv31irS
 Hpx5f4L1kUBEAkrK4FK5FM4H6yk0G853aENUtQr+TFZkHiHRXnr4SORpzthywe5wB3WfhpkRJNokx
 VpP0RH4z4ubGKb9GOct2fpSt7TsXbJUWxwIi9ei7c+tWeATC6c5ieltvRv1XAXhdT2Io=;
Received: from userp2120.oracle.com ([156.151.31.85])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j5vW4-00ERgv-NM
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 23 Feb 2020 17:58:10 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01NHvWju073441;
 Sun, 23 Feb 2020 17:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=LL53eGqGjRhh2FS0FiyzWSm5OLgF8ml4hem9pzFTyEA=;
 b=PakxXawgs/LSVhmYsY1+zuFHltffRjwbw3lP6hwl72y2PLEa8jNl5Ujy9gt6xfZOb6Mz
 pZe861TUQ4w4vRL9H8BDN/Ft61yUxW8ZBT4mCp1Nsu1+ZVxqNgCaBMfkolgljQ/nzIEm
 VO3l937hvjq7rdJRQatg9AN9IDP9fTPQ6OaBJMyOSZbxjNXA0Pa3NCTlr7d5UixoLlJV
 YrAW+AhpE2AJpG3fsJITXVfY9m9jcm9agVJeDdzcJ59kdJlQYXV/vdxaxGBdHC43mQUa
 BqvSk6611lS95oLYQySLRzScVf7fgUh60vjQJvd694prMF7sLeHaJsUvpLosCClFBjqK OQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2yavxrbtp0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 23 Feb 2020 17:57:32 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01NHq2br019936;
 Sun, 23 Feb 2020 17:55:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 2ybe3cnq93-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sun, 23 Feb 2020 17:55:31 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01NHtVwC036442;
 Sun, 23 Feb 2020 17:55:31 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2ybe3cnq8s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 23 Feb 2020 17:55:31 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 01NHtP55027269;
 Sun, 23 Feb 2020 17:55:25 GMT
Received: from localhost (/10.159.228.17)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 23 Feb 2020 09:55:25 -0800
Date: Sun, 23 Feb 2020 09:55:23 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200223175523.GK9506@magnolia>
References: <20200219210103.32400-1-willy@infradead.org>
 <20200219210103.32400-22-willy@infradead.org>
 <20200222004425.GG9506@magnolia>
 <20200222015435.GH24185@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200222015435.GH24185@bombadil.infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9540
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 lowpriorityscore=0
 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002230148
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
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
X-Headers-End: 1j5vW4-00ERgv-NM
Subject: Re: [f2fs-dev] [PATCH v7 21/24] iomap: Restructure
 iomap_readpages_actor
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
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Feb 21, 2020 at 05:54:35PM -0800, Matthew Wilcox wrote:
> On Fri, Feb 21, 2020 at 04:44:25PM -0800, Darrick J. Wong wrote:
> > On Wed, Feb 19, 2020 at 01:01:00PM -0800, Matthew Wilcox wrote:
> > > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > > 
> > > By putting the 'have we reached the end of the page' condition at the end
> > > of the loop instead of the beginning, we can remove the 'submit the last
> > > page' code from iomap_readpages().  Also check that iomap_readpage_actor()
> > > didn't return 0, which would lead to an endless loop.
> > > 
> > > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> > > ---
> > >  fs/iomap/buffered-io.c | 32 ++++++++++++++++++--------------
> > >  1 file changed, 18 insertions(+), 14 deletions(-)
> > > 
> > > diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> > > index cb3511eb152a..31899e6cb0f8 100644
> > > --- a/fs/iomap/buffered-io.c
> > > +++ b/fs/iomap/buffered-io.c
> > > @@ -400,15 +400,9 @@ iomap_readpages_actor(struct inode *inode, loff_t pos, loff_t length,
> > >  		void *data, struct iomap *iomap, struct iomap *srcmap)
> > >  {
> > >  	struct iomap_readpage_ctx *ctx = data;
> > > -	loff_t done, ret;
> > > -
> > > -	for (done = 0; done < length; done += ret) {
> > > -		if (ctx->cur_page && offset_in_page(pos + done) == 0) {
> > > -			if (!ctx->cur_page_in_bio)
> > > -				unlock_page(ctx->cur_page);
> > > -			put_page(ctx->cur_page);
> > > -			ctx->cur_page = NULL;
> > > -		}
> > > +	loff_t ret, done = 0;
> > > +
> > > +	while (done < length) {
> > >  		if (!ctx->cur_page) {
> > >  			ctx->cur_page = iomap_next_page(inode, ctx->pages,
> > >  					pos, length, &done);
> > > @@ -418,6 +412,20 @@ iomap_readpages_actor(struct inode *inode, loff_t pos, loff_t length,
> > >  		}
> > >  		ret = iomap_readpage_actor(inode, pos + done, length - done,
> > >  				ctx, iomap, srcmap);
> > > +		done += ret;
> > > +
> > > +		/* Keep working on a partial page */
> > > +		if (ret && offset_in_page(pos + done))
> > > +			continue;
> > > +
> > > +		if (!ctx->cur_page_in_bio)
> > > +			unlock_page(ctx->cur_page);
> > > +		put_page(ctx->cur_page);
> > > +		ctx->cur_page = NULL;
> > > +
> > > +		/* Don't loop forever if we made no progress */
> > > +		if (WARN_ON(!ret))
> > > +			break;
> > >  	}
> > >  
> > >  	return done;
> > > @@ -451,11 +459,7 @@ iomap_readpages(struct address_space *mapping, struct list_head *pages,
> > >  done:
> > >  	if (ctx.bio)
> > >  		submit_bio(ctx.bio);
> > > -	if (ctx.cur_page) {
> > > -		if (!ctx.cur_page_in_bio)
> > > -			unlock_page(ctx.cur_page);
> > > -		put_page(ctx.cur_page);
> > > -	}
> > > +	BUG_ON(ctx.cur_page);
> > 
> > Whoah, is the system totally unrecoverably hosed at this point?
> > 
> > I get that this /shouldn't/ happen, but should we somehow end up with a
> > page here, are we unable either to release it or even just leak it?  I'd
> > have thought a WARN_ON would be just fine here.
> 
> If we do find a page here, we don't actually know what to do with it.
> It might be (currently) locked, it might have the wrong refcount.
> Whatever is going on, it's probably better that we stop everything right
> here rather than allow things to go further and possibly present bad
> data to the application.  I mean, we could even be leaking the previous
> contents of this page to userspace.  Or maybe the future contents of a
> page which shouldn't be in the page cache any more, but userspace gets
> a mapping to it.
> 
> I'm not enthusiastic about putting in some code here to try to handle
> a "can't happen" case, since it's never going to be tested, and might
> end up causing more problems than it tries to solve.  Let's just stop.

Seeing how Linus (and others like myself) are a bit allergic to BUG
these days, could you add the first paragraph of the above justification
as a comment adjacent to the BUG_ON(), please? :)

--D


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
