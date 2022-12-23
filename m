Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B89654D3C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Dec 2022 09:08:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p8d6b-0001fl-GG;
	Fri, 23 Dec 2022 08:08:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+a36cbb7ae26730e9169d+7061+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1p8d6N-0001XK-EG for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Dec 2022 08:08:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fbFBDoUTr0Hz3vXP45guCPqzXQAzMtYZDFQbW7aV/7M=; b=fXL7ZaqsXOhyp5xHUB34V9lB35
 tuNLeRr3j4FYlH3Woq6zDGq6Ps9I8CY0LIytYbLlw949F+44yxGZrMFczAmekeD6nvnzrpFX4EGRP
 MO5R7i8prTxtQjC+oxWzgaMqjXEt4ic5tSnD4fc/UVIxPlLJN2mBX1XyxVKXOZILRT9s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fbFBDoUTr0Hz3vXP45guCPqzXQAzMtYZDFQbW7aV/7M=; b=ZFqJfA+65xslT0R3a6lfgX0xfI
 WgChS3rmJ1JUoleiGAKkFDvTxxxt8u0gWzjCY/bLEKgaSj+s18ClewQrdD3ydJXFHCufcfOJtafqg
 1h1J32PXvGqFNgA58ur1p9ct43ssfX8tCUwmau6HSqUDdt9CSHFD/P3U82xVUPC8EW/E=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p8d6F-0007ja-MD for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Dec 2022 08:08:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=fbFBDoUTr0Hz3vXP45guCPqzXQAzMtYZDFQbW7aV/7M=; b=E51cHrJYUYXCLQJ6msKO9XaW+8
 SzQjBaBALne5fVjvNAvOV5qoAzJhYusiS9APVbPLZRIMgmJ7vHa2pr+LksdjkiUicoqtpUYZXNLFN
 9bDjsW51Plzixgfu/1HQwqxSRbvphYEqPWc08mBxLgstgTi4TqffHWvFVor42sHep04aR2QZoiHJ9
 cydEsdBmqvFVWSWR3FsMvKU0hkKQBd8bHu6sdY4gbMqcF3OiPiol9TM3x7/sFIBON+zQeq5GNAJry
 xu016McQd+WlF9525pZjlgYolVF64q6K95fNFFNOvo3JJyco1IHDzd6tNVkz7jyKmnvciMq4Uhlf9
 38vhvqTg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p8d5y-0054Xp-JZ; Fri, 23 Dec 2022 08:07:58 +0000
Date: Fri, 23 Dec 2022 00:07:58 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Vishal Moola <vishal.moola@gmail.com>
Message-ID: <Y6Vh3iu1xD7jgF9/@infradead.org>
References: <0a95ba7b-9335-ce03-0f47-5d9f4cce988f@kernel.org>
 <20221212191317.9730-1-vishal.moola@gmail.com>
 <6770f692-490e-34fc-46f8-4f65aa071f58@kernel.org>
 <Y5trNfldXrM4FIyU@casper.infradead.org>
 <CAOzc2pzoyBg=jgYNNfsmum9tKFOAy65zVsEyDE3vKoiti7FZDA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOzc2pzoyBg=jgYNNfsmum9tKFOAy65zVsEyDE3vKoiti7FZDA@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Dec 21, 2022 at 09:17:30AM -0800, Vishal Moola wrote:
 > > That said, folio_ref_inct() is very much MM-internal and filesystems
 > > should be using folio_get(), so please make that modification [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1p8d6F-0007ja-MD
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: Convert f2fs_write_cache_pages()
 to use filemap_get_folios_tag()
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
Cc: linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Dec 21, 2022 at 09:17:30AM -0800, Vishal Moola wrote:
> > That said, folio_ref_inct() is very much MM-internal and filesystems
> > should be using folio_get(), so please make that modification in the
> > next revision, Vishal.
> 
> Ok, I'll go through and fix all of those in the next version.

Btw, something a lot more productive in this area would be to figure out
how we could convert all these copy and paste versions of
write_cache_pages to use common code.  This might need changes to the
common code, but the amount of duplicate and poorly maintained versions
of this loop is a bit alarming:

 - btree_write_cache_pages
 - extent_write_cache_pages
 - f2fs_write_cache_pages
 - gfs2_write_cache_jdata


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
