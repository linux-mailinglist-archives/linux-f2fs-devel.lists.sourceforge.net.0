Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1459E60B96E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Oct 2022 22:12:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1on3nv-0000LG-Sv;
	Mon, 24 Oct 2022 20:12:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1on3nv-0000L6-4A
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Oct 2022 20:12:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zfO+51g+SbzjZHZNrypaeeN+vqvnYBv2zA15JUzr234=; b=IR42H7PVgQLeAUelwicRB05u3d
 UxaxwBI0a6Gok+SM7Pnj9VCfczBGold0sRyS3mN+x5+PHqmahSIrvTtALbrBIC7iJs/LdKw0M4QzO
 och3TfPOVrQtHyTgZBHyRY88djPicjTLIJcRIC8XnYm7x5pXjceI9S/bDG2qFSbTkfDc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zfO+51g+SbzjZHZNrypaeeN+vqvnYBv2zA15JUzr234=; b=OuR5ZJdAzLSjgzYgm9rSxmTKKs
 0SqPAbM6Fp59MY2kaRKVPTt3Gm4xKa6WTjn+osQ/oIpaaRFt2brxOBNPgtavK2JZ0tc5je8UNN8BL
 jw87xVgpNQbcVcKv7MjiB8KULyw4CnUuI+/7LihLiiVqEQwrUNK49V6JtTqHIxM55kEA=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1on3nq-0000IR-PR for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Oct 2022 20:12:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=zfO+51g+SbzjZHZNrypaeeN+vqvnYBv2zA15JUzr234=; b=RaqCnNQ9CnKiZqVCmkN+ZH26es
 kLhgdeh0QnjBCfJ9xLm3bfufPC+onpDpuX7yC57WcUgCWboa1sRqIpUQkaEy4rcWg0deJJkTrG9u+
 xXp6DPSVRNIdNXEj0v1zthipBMUcrfkJ57SL1LP2AxnvL9I5+1qg9irKUKJ3zBt+VEEu7V2Qj1xHx
 iSoekSSnChWmNwUEq/ZKwqlzS25sZPdvz/dljAvXqfrWGncDV78lZcLCIWkfBrIqe9bJfcs12ezDH
 xxm0RAaFJN7/Pg5LrccD+kzmwLerXwWzlEb5vczrVE1CH+jszY4G6TIyzPH1GguKPCCgf/96pexJS
 Z5w3nhPg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1on3nm-00FibA-CJ; Mon, 24 Oct 2022 20:12:02 +0000
Date: Mon, 24 Oct 2022 21:12:02 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Message-ID: <Y1bxktICFzdSl09W@casper.infradead.org>
References: <20221017202451.4951-1-vishal.moola@gmail.com>
 <20221017202451.4951-5-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221017202451.4951-5-vishal.moola@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Oct 17, 2022 at 01:24:32PM -0700,
 Vishal Moola (Oracle)
 wrote: > Converted function to use folios throughout. This is in preparation
 for > the removal of find_get_pages_range_tag(). And removes eight calls
 to compound_head(), saving 296 bytes of kernel text (!) It also adds support
 for large folios to this function. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1on3nq-0000IR-PR
Subject: Re: [f2fs-dev] [PATCH v3 04/23] page-writeback: Convert
 write_cache_pages() to use filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Oct 17, 2022 at 01:24:32PM -0700, Vishal Moola (Oracle) wrote:
> Converted function to use folios throughout. This is in preparation for
> the removal of find_get_pages_range_tag().

And removes eight calls to compound_head(), saving 296 bytes of kernel
text (!)  It also adds support for large folios to this function.

> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
