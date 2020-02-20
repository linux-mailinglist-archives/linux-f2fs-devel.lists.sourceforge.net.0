Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7661667E8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Feb 2020 21:02:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4s1U-000070-Vi; Thu, 20 Feb 2020 20:02:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j4s1S-00006Z-8G
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Feb 2020 20:02:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D6I8jW+2llttZsSrEwC7oLd5yfRbnmR5fQ3XY07h6/A=; b=gTXVEjJxZtps2Fp0QxH2T/YOOr
 e8K4Wat8/RB5JBIq0HDI/0Sm/SueHzOlHh9Z2H/XDifPGTWnXdtX/7m4th6oH/K0WdgTkqInpj6na
 bLKIKHpdWInAAV32vnnG2jwDsZdzXhKtmtGLFfafjtQJw3W+TjVxZKvpQFpkJaAhCnOM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=D6I8jW+2llttZsSrEwC7oLd5yfRbnmR5fQ3XY07h6/A=; b=lfmddWk8e3UB3/L8ahCpfWfVRE
 WJZLu8xrOKWTmxakr3cGezWu6sVuUyJZSJPwgpFeP+7lXqL3cjTUY4pQKGVLnBAmWdJZLJhg5krIu
 yqwupWT6Q4SYfSY8PQb2x8XnREBx1Bf1gjjNvzxxqlWHp/MUAtBuQ7skduTPoxocHADI=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4s1R-00C9cy-6N
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Feb 2020 20:02:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=D6I8jW+2llttZsSrEwC7oLd5yfRbnmR5fQ3XY07h6/A=; b=PM/AprBicbU39edYsbWTpTc0Na
 emVcq7cb+NHUM6oooQNEoXkG8+bHD9DPrTjjG2z2x3T5qTsF2asVZBk11hr9EbGPUjnd00E3//wQZ
 Ybl+M5Ncbk5X+eqZuv5FQg2IiH2QMSkNvYYPTlkj7xTRE/LwRRrh6jsluV0sdP9tbDuj8LPcnDHs1
 hcDRVlsCikcg/+gbg3xn8+BGR6mA7HS7wgpHnbqj5ErHAFq/eFM9zwR+c5djfNPqtTIEOm8KczQWy
 Y9fVsWdlNqjO9NJrXN3ek4kvMofOELyh95VqWLxea4QhQIGt2c5AYVzLVexEyX6ylz0YB4RkWIKLh
 T/R9auvw==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j4oA8-00077l-7Q; Thu, 20 Feb 2020 15:54:52 +0000
Date: Thu, 20 Feb 2020 07:54:52 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200220155452.GX24185@bombadil.infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
 <20200219210103.32400-15-willy@infradead.org>
 <SN4PR0401MB35987D7B76007B93B1C5CE5E9B130@SN4PR0401MB3598.namprd04.prod.outlook.com>
 <20200220134849.GV24185@bombadil.infradead.org>
 <20200220154658.GA19577@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200220154658.GA19577@infradead.org>
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 1.1 DATE_IN_PAST_03_06     Date: is 3 to 6 hours before Received: date
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4s1R-00C9cy-6N
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
 Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
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

On Thu, Feb 20, 2020 at 07:46:58AM -0800, Christoph Hellwig wrote:
> On Thu, Feb 20, 2020 at 05:48:49AM -0800, Matthew Wilcox wrote:
> > btrfs: Convert from readpages to readahead
> >   
> > Implement the new readahead method in btrfs.  Add a readahead_page_batch()
> > to optimise fetching a batch of pages at once.
> 
> Shouldn't this readahead_page_batch heper go into a separate patch so
> that it clearly stands out?

I'll move it into 'Put readahead pages in cache earlier' for v8 (the
same patch where we add readahead_page())


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
