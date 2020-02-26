Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B34170562
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Feb 2020 18:04:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j706U-000735-L6; Wed, 26 Feb 2020 17:04:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+7931773228f1d9803703+6030+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1j706T-00072y-Eq
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 Feb 2020 17:04:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i01gqbt0jOHS7aGnKGoXT1IDiIj9QTdzfZHq4JAzLSo=; b=T4XkSyIj916zRRHO+1+bksUBPc
 emFq96b7oN62cFus2HFeCcMdmxcvPZHR3M7tPyRa+6pz0JNP+fKZtYnwnBH3WCwPqAzgAtm/oFPBt
 qx+acAmf5vYN75kcq+sJrWHXoulbO3IO0WWai3mZRBMSX6+3xe69FaBLb2xkayG9w1Uk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i01gqbt0jOHS7aGnKGoXT1IDiIj9QTdzfZHq4JAzLSo=; b=VKcWVjG/d3Uz8xPxG5x7TZWlwi
 4HOPcsNw6Cq4obwiyuQuA5ETm4to4JFKZKtgT7ohkCACDlbMp352SwHmpD93vpu/ZCH79oINoMCq5
 zr7P8aWDYDqrS4mhfw6Bwz6T07gHmxSHIjrKY/B90kwTLRO+fiqcIktumYZSEtX9P/ZA=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j706R-006uhi-DB
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 Feb 2020 17:04:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=i01gqbt0jOHS7aGnKGoXT1IDiIj9QTdzfZHq4JAzLSo=; b=oqOxzjNkWmxBrz8Psl51Ce1Z8a
 CoUtrBZpVrG1/2uCCd01MozOk+KMmr0tyOUPJqIpBVm5PgJwu+LZ1c0sfkvxGyq53nig6YUxxSV1U
 EddKbm+YfV3Ef27L3Hi4/Llm6OFIZE3fFNI2XW8ZE8l6ZFJuF0XtiZxlnbzqNWcx7tIdf/jfCV3z8
 jQFdfdccS0VLC51pKU6fua8dOSbwQX8aY604bXJovdkgGT+n4JO9JEc49EazIugwXuoMxsLVHC3df
 Q5QSRHuHd8evZwjGnh2wbQMmYq1ugQZe9iV5XU7vQf0VmfR+nGwLM7LXyxH9I9qNyKWfQ9Chi+FMq
 jLUY6TLA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j706J-0006aV-Gx; Wed, 26 Feb 2020 17:03:59 +0000
Date: Wed, 26 Feb 2020 09:03:59 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200226170359.GB22837@infradead.org>
References: <20200225214838.30017-1-willy@infradead.org>
 <20200225214838.30017-15-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200225214838.30017-15-willy@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
X-Headers-End: 1j706R-006uhi-DB
Subject: Re: [f2fs-dev] [PATCH v8 14/25] mm: Document why we don't set
 PageReadahead
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

On Tue, Feb 25, 2020 at 01:48:27PM -0800, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> If the page is already in cache, we don't set PageReadahead on it.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
