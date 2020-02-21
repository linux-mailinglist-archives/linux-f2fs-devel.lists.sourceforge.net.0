Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B858166D78
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Feb 2020 04:27:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4yyA-0008KR-Nd; Fri, 21 Feb 2020 03:27:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jhubbard@nvidia.com>) id 1j4yy9-0008KL-Qo
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 03:27:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=owcb4CMNvaoIORlq5lNkIRvU5IPCuIJMoPXOl4x4Vi0=; b=PSI5OIbKixXotkXWmdn3/UiBm7
 nM+WmRE21bdPZoqkFi3aloePMzAbjVI2kQH8VhLNCgaiNV1mhUCxCva1E21ORxU3Z2RU0OWkwfqw0
 kTBK4puqgBWD2paJWJclKvEvHhKGPsEIAqVkXd8eBeZvZWTKzmFuBTkof0l38KeG6DLo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=owcb4CMNvaoIORlq5lNkIRvU5IPCuIJMoPXOl4x4Vi0=; b=NxAPmGYA31A8rY8jSFtpkczPhR
 PLSIZtdYbz2AQsJiDnHGFbbGZPYiCeh5j30qnQmxyqfNNMEJ9Cm94n4PQBcVvpkJ7YjLNljBik5YI
 rh02masHSOAS09YOdnd4EcZRaYZ/8O1TKofhA9McvfWpnpltKf/A781xj+cgCw2FGZmw=;
Received: from hqnvemgate25.nvidia.com ([216.228.121.64])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4yy5-00B8Oj-Bt
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 03:27:13 +0000
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e4f4de60000>; Thu, 20 Feb 2020 19:26:30 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 20 Feb 2020 19:27:03 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 20 Feb 2020 19:27:03 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 21 Feb
 2020 03:27:03 +0000
To: Matthew Wilcox <willy@infradead.org>, <linux-fsdevel@vger.kernel.org>
References: <20200219210103.32400-1-willy@infradead.org>
 <20200219210103.32400-7-willy@infradead.org>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <110bd4a5-0d12-7f8e-0d5d-78869b3f9135@nvidia.com>
Date: Thu, 20 Feb 2020 19:27:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219210103.32400-7-willy@infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1582255590; bh=owcb4CMNvaoIORlq5lNkIRvU5IPCuIJMoPXOl4x4Vi0=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=GVE5JgGQrgvZz6V3WcHAMb67LvTCiKjS8hKTk2B9obgdAVU0QHb0/YJxV39UHoes4
 fTXr2Jtotj3X/Fwe/w/9iL/HOFWfI2kViUR6nyfJwvx8nqtqScXQ3n96GkcYB1wNPO
 XGPagBrK93GOX00pFiXiJHkA1qTPFqsROFjX2+5h+HL+PQ8ZjWDS/3ZuHc4z0dVP+h
 WtmdiPx3QGWa8NpWywZApZlnSwpXa0whA86w7R9jBhModR2G6pTCPMMywLXmz0jQhU
 Mq6qMUcVjmHdejFgFbiZFY8CM3ofmVhq2v/OrR1Fl6wAqwzwAWcR355R9KcDSaIEbJ
 Cl3cmTmb4JbpQ==
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4yy5-00B8Oj-Bt
Subject: Re: [f2fs-dev] [PATCH v7 06/24] mm: Rename various 'offset'
 parameters to 'index'
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
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2/19/20 1:00 PM, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> The word 'offset' is used ambiguously to mean 'byte offset within
> a page', 'byte offset from the start of the file' and 'page offset
> from the start of the file'.  Use 'index' to mean 'page offset
> from the start of the file' throughout the readahead code.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  mm/readahead.c | 86 ++++++++++++++++++++++++--------------------------
>  1 file changed, 42 insertions(+), 44 deletions(-)
> 
> diff --git a/mm/readahead.c b/mm/readahead.c
> index 6a9d99229bd6..096cf9020648 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -156,7 +156,7 @@ static void read_pages(struct readahead_control *rac, struct list_head *pages,
>   * We really don't want to intermingle reads and writes like that.
>   */
>  void __do_page_cache_readahead(struct address_space *mapping,
> -		struct file *filp, pgoff_t offset, unsigned long nr_to_read,
> +		struct file *filp, pgoff_t index, unsigned long nr_to_read,
>  		unsigned long lookahead_size)


One more tiny thing: seeing as how this patch is also changing "size" to "count",
maybe it should also change lookahead_size to lookahead_count.


thanks,
-- 
John Hubbard
NVIDIA


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
