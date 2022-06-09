Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 228FD54532B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Jun 2022 19:41:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nzM9W-0006go-BI; Thu, 09 Jun 2022 17:41:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <willy@infradead.org>)
 id 1nzM9N-0006gW-Jt; Thu, 09 Jun 2022 17:40:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=50LH8Dogtui4JOE7bz/ojMzo0HRhZGWl5FgghUdbsso=; b=TXfO06XgDIzNH1oRh4bTba+t2P
 YkPMqrLpe5st8d9xJ1frsPxbrT+woXuRZgPKIGU4c2JgrhMKj9S/XJy7E7wc5aacwiFCU4M18WsDh
 ltKcxm423sbyVMVv30uVmq927WknUGhmOCcmgs1gE8L5tXbx0vzHrmtxc2NCyxl9nSFU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=50LH8Dogtui4JOE7bz/ojMzo0HRhZGWl5FgghUdbsso=; b=b+w6RIB3sfVzqjaOEGhYgaidFa
 n/vp1mYz0PMepZUtKYziviUyhLWv/jVih5zGaXF0QwQOETh94lwO8/q6xH7gJhGp1RgLZzqS3bWJu
 GidsB2G65xzBh5isNQKulKCKPF6508XiBzBIzxgHmQ59tVBZirxu5qvjHpKQtCSljs48=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nzM9L-00056N-JO; Thu, 09 Jun 2022 17:40:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=50LH8Dogtui4JOE7bz/ojMzo0HRhZGWl5FgghUdbsso=; b=H80hSPNqGiAd5chM6yyxpXe7GI
 v16rR9GPk1lsBvZCxGkkfPwwIt580VMmgSt7/ZwfufekJhmrwARChvfRps5Isb2jo31hImz/J8zhg
 3Gqid/DHTzlBHrEnpsHq7tbmdB6lizbSwvMg1psBh47cB986OJv32t09q9JTTsGSl5f5sM+mUmbDC
 kBxIqffET9U+LDZy+bNXjBWIq4ozQI6dP3A/jTcDrHF2DBz9xSzltFjBNcK5NRZczIeDZyfqJ8lJf
 qfewZREEYM3aHIjRrfEfYKtBKEBJRQ6UywKBfP0QJhwiV/qPmGd6+tb1EV1S0HSjXDX6WidFPIyNN
 +S04cl5w==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nzM8y-00DjCy-V3; Thu, 09 Jun 2022 17:40:28 +0000
Date: Thu, 9 Jun 2022 18:40:28 +0100
From: Matthew Wilcox <willy@infradead.org>
To: dsterba@suse.cz, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-aio@kvack.org, linux-btrfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org,
 linux-xfs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-ntfs-dev@lists.sourceforge.net, ocfs2-devel@oss.oracle.com,
 linux-mtd@lists.infradead.org, virtualization@lists.linux-foundation.org,
 Christoph Hellwig <hch@lst.de>
Message-ID: <YqIwjEO1a0Sbxbym@casper.infradead.org>
References: <20220608150249.3033815-1-willy@infradead.org>
 <20220608150249.3033815-13-willy@infradead.org>
 <20220609163323.GV20633@twin.jikos.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220609163323.GV20633@twin.jikos.cz>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jun 09, 2022 at 06:33:23PM +0200, David Sterba wrote:
 > On Wed, Jun 08, 2022 at 04:02:42PM +0100, Matthew Wilcox (Oracle) wrote:
 > > Use filemap_migrate_folio() to do the bulk of the work, and [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nzM9L-00056N-JO
Subject: Re: [f2fs-dev] [PATCH v2 12/19] btrfs: Convert btrfs_migratepage to
 migrate_folio
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jun 09, 2022 at 06:33:23PM +0200, David Sterba wrote:
> On Wed, Jun 08, 2022 at 04:02:42PM +0100, Matthew Wilcox (Oracle) wrote:
> > Use filemap_migrate_folio() to do the bulk of the work, and then copy
> > the ordered flag across if needed.
> > 
> > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> 
> Acked-by: David Sterba <dsterba@suse.com>
> 
> > +static int btrfs_migrate_folio(struct address_space *mapping,
> > +			     struct folio *dst, struct folio *src,
> >  			     enum migrate_mode mode)
> >  {
> > -	int ret;
> > +	int ret = filemap_migrate_folio(mapping, dst, src, mode);
> >  
> > -	ret = migrate_page_move_mapping(mapping, newpage, page, 0);
> >  	if (ret != MIGRATEPAGE_SUCCESS)
> >  		return ret;
> >  
> > -	if (page_has_private(page))
> > -		attach_page_private(newpage, detach_page_private(page));
> 
> If I'm reading it correctly, the private pointer does not need to be set
> like that anymore because it's done somewhere during the
> filemap_migrate_folio() call.

That's correct.  Everything except moving the ordered flag across is
done for you, and I'm kind of tempted to modify folio_migrate_flags()
to copy the ordered flag across as well.  Then you could just use
filemap_migrate_folio() directly.

> > -
> > -	if (PageOrdered(page)) {
> > -		ClearPageOrdered(page);
> > -		SetPageOrdered(newpage);
> > +	if (folio_test_ordered(src)) {
> > +		folio_clear_ordered(src);
> > +		folio_set_ordered(dst);
> >  	}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
