Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83122158E93
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Feb 2020 13:34:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j1UkY-0000Wb-4Y; Tue, 11 Feb 2020 12:34:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j1UkW-0000Vz-U4
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Feb 2020 12:34:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uIlXDShEskfTvbYftNPC1eqkJUsB5szLvdV7iweWe4s=; b=PWjKNtfWgQwQGn+6PSvSVX2Wf6
 h2TJS+TJA0upPiSb0LEsRIXtxhi84IBo1Af+i+XPdLYMSQ3ebUqZYaSm13GENbKvjiUixRRTAq3cC
 1QVayHfZVAcDUfhTMfHhisHeAWpy8FtTcJIuHlVBpQDAQ+sqLKqEUk4G7c+YMmM6+Hno=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uIlXDShEskfTvbYftNPC1eqkJUsB5szLvdV7iweWe4s=; b=eBynScIo3UJSJT/9i3i2JsufYA
 ZdPtG9kutOxLPNybF6ewiyp8WSIf1mY9a4kFJgWR1AtmsgFwH7rc8+P/n6wou44iWQ69bhWC/Bk30
 R9idGpf2Ij8t9lnFlkHhDkvE63JkPcVF3CstTPbb1BMDV/ASS3tvzvPnVfrPvPn0Cqds=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j1UkV-000W9i-Cv
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Feb 2020 12:34:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=uIlXDShEskfTvbYftNPC1eqkJUsB5szLvdV7iweWe4s=; b=SeyBbYthoa6L+1pKSTBoqxCFni
 wTJRyOqUnVlYvD37j4HGWVkO1X/D0fyafdbCfsynh7E7Nd3cyOFPC/SIb5jUOMZyzdEvncdXAzReF
 vQYgsmrVkB4zwfd6rrwB1SvDqqK2SKFVfjZfVMxT8s5K4GJS8hhniBqwoUBwsteVgZNIUfpPcQ5aP
 0IPMIzBXCcgmYEtwqCZOxnn68TEw92XrWsLDyQuhAe5AlzAF01rYALZpzjl8uENQAqVFM68FPSZW4
 JFup/EfcWoR5+TyIkZIBfhMJ9badlt8+Epn37DVY1zowNGoeUikWKpJqKg7VeqVpO/jC94HcPn328
 u1r5UcAQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j1UkI-0006ev-Kh; Tue, 11 Feb 2020 12:34:30 +0000
Date: Tue, 11 Feb 2020 04:34:30 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
Message-ID: <20200211123430.GT8731@bombadil.infradead.org>
References: <20200211010348.6872-1-willy@infradead.org>
 <20200211010348.6872-2-willy@infradead.org>
 <SN4PR0401MB3598602411B75B46F5267B829B180@SN4PR0401MB3598.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN4PR0401MB3598602411B75B46F5267B829B180@SN4PR0401MB3598.namprd04.prod.outlook.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j1UkV-000W9i-Cv
Subject: Re: [f2fs-dev] [PATCH v5 01/13] mm: Fix the return type of
 __do_page_cache_readahead
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

On Tue, Feb 11, 2020 at 08:19:14AM +0000, Johannes Thumshirn wrote:
> On 11/02/2020 02:05, Matthew Wilcox wrote:
> > even though I'm pretty sure we're not going to readahead more than 2^32
> > pages ever.
> 
> And 640K is more memory than anyone will ever need on a computer *scnr*

Sure, but bandwidth just isn't increasing quickly enough to have
this make sense.  2^32 pages even on our smallest page size machines
is 16GB.  Right now, we cap readahead at just 256kB.  If we did try to
readahead 16GB, we'd be occupying a PCIe gen4 x4 drive for two seconds,
just satisfying this one readahead.  PCIe has historically doubled in
bandwidth every three years or so, so to get this down to something
reasonable like a hundredth of a second, we're looking at PCIe gen12 in
twenty years or so.  And I bet we still won't do it (also, I doubt PCIe
will continue doubling bandwidth every three years).

And Linus has forbidden individual IOs over 2GB anyway, so not happening
until he's forced to see the error of his ways ;-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
