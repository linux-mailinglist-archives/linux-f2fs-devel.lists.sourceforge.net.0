Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2383E18B11E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2020 11:20:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jEsII-0000fg-BX; Thu, 19 Mar 2020 10:20:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+061b0704d8249feb4593+6052+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1jEsIH-0000fR-AX
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Mar 2020 10:20:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ntJd7dUM0sZh65THRmkRhW0Z2X4v3bgEZxiGC8V87b0=; b=dDNm1fZTOAoqQa9AYVL6mgQrrh
 1ZPyoUbkeaSOQC5zcRdhpJxdLbhhmvNJ9aUYpjzordxh1Ih5+ujfoID5O759SdqwwbYYdaCzjVKIW
 ThNJ6e0vrUHOORG7x7Waq16vo1OAGHAQ+CuP/8vPxaz55sb2Uuuo9YCOHPpqUrFgkZ5Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ntJd7dUM0sZh65THRmkRhW0Z2X4v3bgEZxiGC8V87b0=; b=ftlPzgYmNVXnsGyRybm7fFpXvd
 5LpakRzOTfT3fmgkjz3Vo76vDO0sMTGoEVykSo3jDc2nu50/UiqXKbwAoOBCEwIlWGXTjKP4exM45
 G68vk7GzS8M6/Nm+cTPRVA8jPDsAgb0AxRv/xBpJyI47Ekw416ME6ZtKgNDWbPVO5aCA=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jEsIF-008kMv-HD
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Mar 2020 10:20:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ntJd7dUM0sZh65THRmkRhW0Z2X4v3bgEZxiGC8V87b0=; b=NPdqfWZQW7ok68F99nZSWB4EiC
 iwCmPSaRU9YsXGBoldjY8WpNe37PvEZaNdwkLE3rFLqoiUMNDjhE9jkFexjMOPz/qBKa2JNDLDFP8
 VCNf4Go22JyscS7ePxXqYnql/ku5lrMhaj+rksUXN32t5uX1cDb8pk9Y+j4S57mNTCoQu8p15MGm4
 tmvLubpFBME8Ch87n5HtF2Js/k4HiXz0WzM3tA1LPvQSUfaPtAZdH/LH5uMVg8tpX7UiAEAEC7BxR
 aWnrppdR6e34JZBtLBap/q0wWpU1vRGQZFswa+BDAOmBy0xEFQYnQY5lnkECNrJkFChlgqQDEGnwO
 zjla2clQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jEsI2-0004IT-Ep; Thu, 19 Mar 2020 10:20:38 +0000
Date: Thu, 19 Mar 2020 03:20:38 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200319102038.GE3590@infradead.org>
References: <20200225214838.30017-1-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200225214838.30017-1-willy@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jEsIF-008kMv-HD
Subject: Re: [f2fs-dev] [PATCH v8 00/25] Change readahead API
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

Any plans to resend this with the little nitpicks fixed?  I'd love to
get this series into 5.7..


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
