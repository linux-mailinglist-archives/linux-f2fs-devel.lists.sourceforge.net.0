Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 722BC619B93
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Nov 2022 16:27:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oqybY-0004vl-K1;
	Fri, 04 Nov 2022 15:27:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1oqybT-0004vM-K7
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Nov 2022 15:27:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NRigLoVbg9iNMuo2V8dujDupHLGv4656kHqtcy7GZD8=; b=LbHBvKqNNhS2tRMRoIAhYGnhpP
 VBH3JhSH7LE7hBsAdDKKISHyWZjPmdTahg+KaIxf6iCDjGycCuuWjcHXilbn2JFS57HC8Ld/7KCPa
 7jHf/3TL7MQgxB8fQYfVceg4/Pi0DOWfE4BjZuarXRDbE9s0GU/RElhtz4lh6dRaOXtY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NRigLoVbg9iNMuo2V8dujDupHLGv4656kHqtcy7GZD8=; b=Gz6mtFUCGHcO+sCWohEtzYUxx5
 FTucDzlHleIAlq9pn7YXFY9Xwia63I4Hjx6q/WKONtm3Fgm/yrZrbxO/oWPozMPghcg+waN4BIxML
 3z3OWD+PemSTsUJgnL1dBtPuSRaXzzt+5IkIIeGUIpbIMD+XEsb0+BVRVy42U01eHPlA=;
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oqybP-0001cj-MW for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Nov 2022 15:27:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=NRigLoVbg9iNMuo2V8dujDupHLGv4656kHqtcy7GZD8=; b=cC/8pOU9guMXpHbLROmQ2jJkPP
 fLIJJBoVaFImQSaJFL0EWP8TTGFmm1Fq/sTBJJzHOEsig/P1SI1UBIbnctYsc4kfBpEtbkTVb2mcZ
 Ox1PTbpiMUHAhUcDFiGqO5ffa8RLcaU4htW4J7D1+QIRrp5YcZ701l+dtCKa0/v+wq867Rzs2qjn5
 m+hDXZshw76/eeJ25GEvs/oa2Dpn7Gb7+4FfiG7RrZMv4cn4ae/Eyjl07Dbl+O73y7VDkBQtEk8h0
 f9z379l8811dl922VVtAq9pc8KIqwTp7lj2fnWcgj+lzkCFo5nZGbwWtuSpe8hnrjhN+krL6P+YDR
 WpFHYXzg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oqybA-007SeM-OG; Fri, 04 Nov 2022 15:27:12 +0000
Date: Fri, 4 Nov 2022 15:27:12 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <Y2UvUOn6hmnqbrA7@casper.infradead.org>
References: <20220901220138.182896-1-vishal.moola@gmail.com>
 <20220901220138.182896-5-vishal.moola@gmail.com>
 <20221018210152.GH2703033@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221018210152.GH2703033@dread.disaster.area>
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Oct 19, 2022 at 08:01:52AM +1100, Dave Chinner wrote:
 > On Thu, Sep 01, 2022 at 03:01:19PM -0700, Vishal Moola (Oracle) wrote:
 > > @@ -2313,17 +2313,18 @@ int write_cache_pages(struct address_ [...] 
 Content analysis details:   (1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1oqybP-0001cj-MW
Subject: Re: [f2fs-dev] [PATCH 04/23] page-writeback: Convert
 write_cache_pages() to use filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, cluster-devel@redhat.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org,
 linux-nilfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Oct 19, 2022 at 08:01:52AM +1100, Dave Chinner wrote:
> On Thu, Sep 01, 2022 at 03:01:19PM -0700, Vishal Moola (Oracle) wrote:
> > @@ -2313,17 +2313,18 @@ int write_cache_pages(struct address_space *mapping,
> >  	while (!done && (index <= end)) {
> >  		int i;
> >  
> > -		nr_pages = pagevec_lookup_range_tag(&pvec, mapping, &index, end,
> > -				tag);
> > -		if (nr_pages == 0)
> > +		nr_folios = filemap_get_folios_tag(mapping, &index, end,
> > +				tag, &fbatch);
> 
> This can find and return dirty multi-page folios if the filesystem
> enables them in the mapping at instantiation time, right?

Correct.  Just like before the patch.  pagevec_lookup_range_tag() has
only ever returned head pages, never tail pages.  This is probably
because shmem (which was our only fs that supported compound pages)
never supported writeback, so never looked up pages by tag.

> >  			trace_wbc_writepage(wbc, inode_to_bdi(mapping->host));
> > -			error = (*writepage)(page, wbc, data);
> > +			error = writepage(&folio->page, wbc, data);
> 
> Yet, IIUC, this treats all folios as if they are single page folios.
> i.e. it passes the head page of a multi-page folio to a callback
> that will treat it as a single PAGE_SIZE page, because that's all
> the writepage callbacks are currently expected to be passed...
> 
> So won't this break writeback of dirty multipage folios?

No.  A filesystem only sets the flag to create multipage folios once its
writeback callback handles multipage folios correctly (amongst many other
things that have to be fixed and tested).  I haven't written down all
the things that a filesystem maintainer needs to check at least partly
because I don't know how representative XFS/iomap are of all filesystems.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
