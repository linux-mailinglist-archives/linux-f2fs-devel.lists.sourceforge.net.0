Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 635651E92D2
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 30 May 2020 19:18:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jf57t-0008Hz-HO; Sat, 30 May 2020 17:18:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1jf57s-0008Hn-Af
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 May 2020 17:18:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L01rcThTXQGPtzbd1sl02vy/AZKkMVDpxcktglSDj/Y=; b=OgW5b1va76iy56Zv+WGEjLw+y0
 YDFJTBl0K3F+CyGBcQzkQuyyT4hlsH8uOBYsorLN6xAMNXECxC7b9TZD0ehZvOf49AvKKUsiO0a1s
 Z4LP/N5EKLf2oj5zkdNUimuHWtWdOJcD7TiYGJ+TJfa9eGUwUa++v7h50dWNWllySMl8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L01rcThTXQGPtzbd1sl02vy/AZKkMVDpxcktglSDj/Y=; b=JU512Fk+2DU8YzWRO+kEF2UpKR
 UeBkn52ZEKU4klkMg+7UAQ2XlR6ugItrL2v0q8TqxS8HLpPCXvxY8NdWtqrJyy8eKhiaYmeMlKusn
 ZyshOyFAqvw2T6x5gTdECAhxoBopCaQ/fckxJAzJYRVpnbhkPwO+pMMtfV6PzyXn/114=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jf57q-0017P1-Il
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 May 2020 17:18:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=L01rcThTXQGPtzbd1sl02vy/AZKkMVDpxcktglSDj/Y=; b=HBJu6SnmC5B1P9o9UOfR2HZWJF
 AiFIR3Id9rSPCYStLx2L6hC4V6jDcbiu2BxjaA+pTXEFjbHsWlPqYF25uodE12GuP/0Zjgf8XvKbr
 hkL7GP7CwiJ0FSMTYk56M9ldfCihszDY4LJyfIzZwp5nNDg78qvwF/iFloICjidC7u1E0w3Uzr2/K
 TZuae9dpDqIxbBro4CThKmqZe6WoJMmo4MK7+xZeHi0fm6uiYFPk0QST0Vn5gMNPD584cNn4pMYw5
 6WeizdsrEO7j/X/cGP42rGjJ72GVK1oOyKRVLfZBzMSJEIylXmZGTL1DribFuW5jTuegTqrgmdUMl
 dZRvZHBw==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jf57e-0000cg-Ga; Sat, 30 May 2020 17:18:14 +0000
Date: Sat, 30 May 2020 10:18:14 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200530171814.GD19604@bombadil.infradead.org>
References: <20200530060216.221456-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200530060216.221456-1-ebiggers@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: qstr.name]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jf57q-0017P1-Il
Subject: Re: [f2fs-dev] [PATCH] ext4: avoid utf8_strncasecmp() with unstable
 name
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
Cc: Daniel Rosenberg <drosen@google.com>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, May 29, 2020 at 11:02:16PM -0700, Eric Biggers wrote:
> +	if (len <= DNAME_INLINE_LEN - 1) {
> +		unsigned int i;
> +
> +		for (i = 0; i < len; i++)
> +			strbuf[i] = READ_ONCE(str[i]);
> +		strbuf[len] = 0;

This READ_ONCE is going to force the compiler to use byte accesses.
What's wrong with using a plain memcpy()?

> +		qstr.name = strbuf;
> +	}
> +
>  	return ext4_ci_compare(inode, name, &qstr, false);
>  }
>  
> -- 
> 2.26.2
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
