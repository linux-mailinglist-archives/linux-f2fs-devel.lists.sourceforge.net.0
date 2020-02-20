Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D741667EA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Feb 2020 21:02:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4s1X-0004Je-BQ; Thu, 20 Feb 2020 20:02:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+d8ceb162cb84e4d8f427+6024+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1j4s1U-0004JD-Jf
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Feb 2020 20:02:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=asXjJUPyTxLf/fjaD73hG4T2BQQMjNwUve1mlt++5Bg=; b=lVGGmUzklqq/UcVOmWLQFZQcGt
 7mSdxt/VJK+5Sqn3kz8PVmChBWIrACe/vuMeR7ZKhRHo9H7YT/7NumiDBRdm9v4BWh02FRZTZ/OfQ
 7ALIk0R9bKpZfAA+uzU+dtfHUNb25GkhNTwRsIKxqVRmdi7j6jiAugTYKoqwpnAUqiX4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=asXjJUPyTxLf/fjaD73hG4T2BQQMjNwUve1mlt++5Bg=; b=QpgWFKUqZ7iub609gUaLq6ZcRo
 nXbXPf70vyAMx56iPpYa4Ku8UHzSaZ64d5fXwretzq+0SiYZa/DQFxjEl2q5oCufq7AA62fiG491Q
 dx89wuxoqmLmWcose8qoOLWkuXydmiubclV074Hn51Aso9KAZEr3UcppgH+lbThsHiWk=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4s1T-00C9cy-LX
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Feb 2020 20:02:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=asXjJUPyTxLf/fjaD73hG4T2BQQMjNwUve1mlt++5Bg=; b=I/Ab8+bwJavMuSdF6A7yoLoxpl
 I80eOjHHrc7YW4s1mRM3GXAWV63YYUGG6kYuZAbhKMD7o7inowQ7wkdtEhk0CShSQle+pUHSJSQ3R
 X5Ie4ceE4nw5O60QIoKVy+Nx7nLUPwXo7HXGU5sNQ/MNv7k7CTW5cYA2mGffcLjnMuopklxIrnEb5
 zXaF3Q4w6YT3XY3kUH+syaFGM+K+jajsEL8N7w0LjXwXSkPM4zCg+dqrmYKzt+1rJwJrKO5ulxHRb
 Yx2SJUtD5uEs/JDzQY6ckw9PLSkFVwKmtv7afz08IkWKilgFHxNduTmfFUEZJ2ZFaKnIsglqiJ94N
 iYbQPz8A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j4o3B-0005FU-UO; Thu, 20 Feb 2020 15:47:41 +0000
Date: Thu, 20 Feb 2020 07:47:41 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200220154741.GB19577@infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
 <20200219210103.32400-22-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219210103.32400-22-willy@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 1.1 DATE_IN_PAST_03_06     Date: is 3 to 6 hours before Received: date
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4s1T-00C9cy-LX
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

On Wed, Feb 19, 2020 at 01:01:00PM -0800, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> By putting the 'have we reached the end of the page' condition at the end
> of the loop instead of the beginning, we can remove the 'submit the last
> page' code from iomap_readpages().  Also check that iomap_readpage_actor()
> didn't return 0, which would lead to an endless loop.

I'm obviously biassed a I wrote the original code, but I find the new
very much harder to understand (not that the previous one was easy, this
is tricky code..).


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
