Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB23163B36
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 04:28:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4G2T-0004TY-Og; Wed, 19 Feb 2020 03:28:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1j4G2R-0004TR-UX
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 03:28:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yrfCr/TZUddjGTIPictnyCsDLhnzK6yvtB+rFE1ll3w=; b=IJ3jZfzPWwSvYBtR5/CupDx/g9
 IMP2pczUXA9oakV2/STckpX88OETGViMBh2OtIBYx7zJDdsYaRJyGQNt0uez9VwwZNb9krZC9RYda
 Pjsbg5/TtnwxNibaNYqHdh8zCPFcraCb6fFYqLcLtMkZ1BGQMDe43YPw0Ksz3fyfBOsI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yrfCr/TZUddjGTIPictnyCsDLhnzK6yvtB+rFE1ll3w=; b=fuKZqonhfMa288my1W9JiXqlok
 2jecUGLCUYa6XyUXKU6Mz6KbKTOgxgmrRRUJvq+3sBeOXNPhjQbmU07S7yOjqIWL5OuH6tMqfBHCK
 z6gXBksmMMIb42SDyZyq133Obg/AjULUlwXD1Iu0w6bYnBE5e/nj7QwAhg9B5fqfooYQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4G2L-007Wj7-P0
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 03:28:39 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C791F24658;
 Wed, 19 Feb 2020 03:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582082908;
 bh=VSakUIZdUnh4kwjCiCYOK30SKm0FPJHaDrKhBHNH/O0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sSo+l0jqfJP5IDuZCWJUj4RO9pEWAB1W4p4Feik4xAkV3cci+4Xqzgigh+5tJwH9v
 sE1kq86XdWrgqVDsv1RolnDs1ziPSCTYBt6BD/mOmWDhMIlqCxeffX/y5V/4JZzwPR
 SQktNIjOJLPhkomAjO77iIh3++VkdKq2Nvgz61hQ=
Date: Tue, 18 Feb 2020 19:28:26 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200219032826.GB1075@sol.localdomain>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200217184613.19668-18-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217184613.19668-18-willy@infradead.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: checkpatch.pl]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4G2L-007Wj7-P0
Subject: Re: [f2fs-dev] [PATCH v6 10/19] fs: Convert mpage_readpages to
 mpage_readahead
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
Cc: cluster-devel@redhat.com, linux-ext4@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, linux-btrfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Junxiao Bi <junxiao.bi@oracle.com>,
 linux-erofs@lists.ozlabs.org, ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Feb 17, 2020 at 10:45:58AM -0800, Matthew Wilcox wrote:
> diff --git a/include/linux/mpage.h b/include/linux/mpage.h
> index 001f1fcf9836..f4f5e90a6844 100644
> --- a/include/linux/mpage.h
> +++ b/include/linux/mpage.h
> @@ -13,9 +13,9 @@
>  #ifdef CONFIG_BLOCK
>  
>  struct writeback_control;
> +struct readahead_control;
>  
> -int mpage_readpages(struct address_space *mapping, struct list_head *pages,
> -				unsigned nr_pages, get_block_t get_block);
> +void mpage_readahead(struct readahead_control *, get_block_t get_block);
>  int mpage_readpage(struct page *page, get_block_t get_block);
>  int mpage_writepages(struct address_space *mapping,
>  		struct writeback_control *wbc, get_block_t get_block);

Can you name the 'struct readahead_control *' parameter?

checkpatch.pl should warn about this.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
