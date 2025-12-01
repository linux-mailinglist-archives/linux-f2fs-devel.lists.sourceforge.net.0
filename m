Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C32C9928A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 01 Dec 2025 22:20:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e/tKn6kyIPSL5faoiIzJYrSEpDTfAaV1HaKOTcOrleo=; b=TgN8rheWTHvk+kmeXrNwvgWUZ3
	Dp40CDk80vsjoT4Sxin90QbWoZ9/gPmI9LitJ7ltyvy4yQecV8MGDYgGA/2LPXTEJ00e/mKJeNM27
	uGNv5j0uPNmZvA2uiuerzcA8mFFvVcS/O8MiwgfEJ6PPM3uc3cVpUSNW02fH7Ix2tIDw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQBJc-00082K-L4;
	Mon, 01 Dec 2025 21:20:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1vQBJa-00082C-PI
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 21:20:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WiTdOzM04TmD+7whCaojUYm7mGYFeydQ5w051q8EpM8=; b=PumirFpqe0Qz88sCGzEejI9Evb
 ZEKEFAvgcji3syCslNX1sTvY+iJ35xBpNoZWUk66O2iXMsOFB+R42cJi0yM95B/qTjLcf8MsVhM3m
 mAaS+IUrZgTnjvZl1F3//ByXbGtL9iWxhozkDXYavDaVaC3n38j2Q3pM8bGG0taeAmUs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WiTdOzM04TmD+7whCaojUYm7mGYFeydQ5w051q8EpM8=; b=QQ4oUYqXxEK9awXF8lzRXqbur7
 Yp9KRTa/nAyY+yIvw8xIdHkJ+/6XJ3SclI2r+6tzgka7PJhOoktAQ3RhfQIzwpYtXqS4QgWwT3rd7
 Blb6B8MN+QImu6sq5SIU2wHDm5D6qiI91wKgBA3UmUT6StWK5w4VHRvaeo2tL3yyR3fc=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQBJZ-0002rh-D8 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 21:20:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=WiTdOzM04TmD+7whCaojUYm7mGYFeydQ5w051q8EpM8=; b=v/1wqjVQuVqUG/+O5g8v+0grIj
 P1nnzXYsylJ3+vn50/5fcldCEWTjr1aELVUcxaJQtNsdoQBhsvwSpjTJo6XJdZTKhHeTHF2fKwvPL
 Fj8jVOeuyZt9q3M6YcJ4CVd4CWZHUZtkx65fKuQfkRCAEXo18n7VA/h+o2haxIwvapGJGUtayaSw4
 N/z3YzyeJBiFIDDR5zHljspUkRY9iOrT5N80nvesmtQA5c08KSEWOITB7oIqsblySL7IRXxyHa7iU
 yhEqJxI0XnsbO5RLFr2AQW2hqZVoKCrs/3AEe6E47E8e6QIq32Cq/s76VbiSVgeBqhxp+dQupk6FN
 a2C/6frA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vQBJR-00000000FYG-1Pcz;
 Mon, 01 Dec 2025 21:20:01 +0000
Date: Mon, 1 Dec 2025 21:20:01 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <aS4GgfzfuYRHJdg_@casper.infradead.org>
References: <20251201210152.909339-1-jaegeuk@kernel.org>
 <20251201210152.909339-4-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251201210152.909339-4-jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Dec 01, 2025 at 09:01:26PM +0000, Jaegeuk Kim wrote:
 > This patch introduces a new address operation, a_ops->ra_folio_order(),
 which > proposes a new folio order based on the adjusted order fo [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1vQBJZ-0002rh-D8
Subject: Re: [f2fs-dev] [PATCH 3/4] mm/readahead: add a_ops->ra_folio_order
 to get a desired folio order
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
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Dec 01, 2025 at 09:01:26PM +0000, Jaegeuk Kim wrote:
> This patch introduces a new address operation, a_ops->ra_folio_order(), which
> proposes a new folio order based on the adjusted order for page_cache_sync_ra.
> 
> Hence, each filesystem can set the desired minimum order of folio allocation
> when requesting fadvise(POSIX_FADV_WILLNEED).

Again, you've said what but not why.  Does the mm code not ramp up the
folio order sufficiently quickly?  What are you trying to accomplish?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
