Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7B6165F24
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Feb 2020 14:49:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4mCY-0004wo-JC; Thu, 20 Feb 2020 13:49:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j4mCW-0004wd-GS
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Feb 2020 13:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zBQV1Nvl6gQ7063nOMO4bl4Qit9dtUsePu9xZtdIUpM=; b=I7JrtZ1FN+wEB42mG3bs78rD52
 F/9As+8acLeML2XReEfK28YZ1tj2uQlD5X7hcrcLSLuYDak2XU+DyJcPkuwSfWqbMYc8fdMRZqGTk
 n9VEqzwgxvPL34XApKRqN6WJlCVkkBnm9i1Rz3CgorLW0ux+9tzo2SGdMQRcmBHcQc0g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zBQV1Nvl6gQ7063nOMO4bl4Qit9dtUsePu9xZtdIUpM=; b=cXPFLqMJH6Grn/03SNhyWAvm0X
 TVV2V0qsTz351nyTYGMG+WdXGAdTwGTlDTa5F7YUQNCg4uhJQpZahWHWIyE3z6J5pjqQRNvYI9EPR
 /tqjAAbUYe+b3ZGC/2tNsvDL2a7XVkOBle4gD1DXtLG4blKrFolCC1zBVVsFLoU6Idlo=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4mCU-000tC3-Ea
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Feb 2020 13:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=zBQV1Nvl6gQ7063nOMO4bl4Qit9dtUsePu9xZtdIUpM=; b=igtOB94RI8XKtzVTmpl7adfTBc
 nUPRfeBQAn6qgMu2mIMXdqdemGWBPZM6m1mk0JRQ4gln6YP021QrTz7JW7WriTW9kQd9HhefrWodr
 DPdZE7ea3rkTiKxZzjV2rfZFsVohFeCSeKjLKjW2laQNPicIuou8l8cd1nA0LgsCPlX64i0y7yahW
 32HPR3UOUNpTTE89QggDpsf9Uy+G746NO+E5c6nPo49C7MXOyuBpobo2jZnaHlZEfffwdWw5lxpdO
 LXm98qt8lqtRm5JiZBti5MLazqN7XkI5SW89icHM4E2rVuaoGC9UJqrtuJmXRDlbntv0SnHwa7P6h
 mNHva41Q==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j4mC9-0006TC-8A; Thu, 20 Feb 2020 13:48:49 +0000
Date: Thu, 20 Feb 2020 05:48:49 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
Message-ID: <20200220134849.GV24185@bombadil.infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
 <20200219210103.32400-15-willy@infradead.org>
 <SN4PR0401MB35987D7B76007B93B1C5CE5E9B130@SN4PR0401MB3598.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN4PR0401MB35987D7B76007B93B1C5CE5E9B130@SN4PR0401MB3598.namprd04.prod.outlook.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4mCU-000tC3-Ea
Subject: Re: [f2fs-dev] [PATCH v7 14/24] btrfs: Convert from readpages to
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
Cc: "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Feb 20, 2020 at 09:42:19AM +0000, Johannes Thumshirn wrote:
> On 19/02/2020 22:03, Matthew Wilcox wrote:
> > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > 
> > Use the new readahead operation in btrfs.  Add a
> > readahead_for_each_batch() iterator to optimise the loop in the XArray.
> 
> OK I must admit I haven't followed this series closely, but what 
> happened to said readahead_for_each_batch()?
> 
> As far as I can see it's now:
> 
> [...]
> > +	while ((nr = readahead_page_batch(rac, pagepool))) {

Oops, forgot to update the changelog there.  Yes, that's exactly what it
changed to.  That discussion was here:

https://lore.kernel.org/linux-fsdevel/20200219144117.GP24185@bombadil.infradead.org/

... and then Christoph pointed out the iterators weren't really adding
much value at that point, so they got deleted.  New changelog for
this patch:

btrfs: Convert from readpages to readahead
  
Implement the new readahead method in btrfs.  Add a readahead_page_batch()
to optimise fetching a batch of pages at once.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
