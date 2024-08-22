Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D4C95AB90
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Aug 2024 05:02:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sgy64-0001QL-EC;
	Thu, 22 Aug 2024 03:02:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1sgy61-0001QE-MS
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Aug 2024 03:02:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YP2WB9dywIKVl9Gv1GKu83gWXpOmL4vFmjgq2eXETAs=; b=KV2Y5CaX4o5D+Y635elv0gb4MC
 VyJdWS6kjkBns28ovy2qGW65FdjaYp5qNbM+iZEXzZ4IgPEZl9mXMcMXv6JsGgjCCvRWrP6ifKkCL
 iMxw9Vgc03MkMNS3wWTPKYNm1gzIuAQeEeQr24lWrrMhTW1mNyDmYB4/W2XjFEcQtBds=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YP2WB9dywIKVl9Gv1GKu83gWXpOmL4vFmjgq2eXETAs=; b=TqBGsNcgCuAkY62ClIsgn/rbCO
 hzwRvTad2sZ7eVpO6dWtWm/zs3KGKqqtbVa5CT0/Cqx822s9OpzlrMePKVbu2PSSkglVlKMYYgF/o
 7ctymlpS9ssr4/LcASaj2+2PFQc4Mb1Y7g4GG6rG9JOOOh7AfPO4jfAxwBgDGffLpaG8=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sgy5y-0001m3-VY for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Aug 2024 03:02:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=YP2WB9dywIKVl9Gv1GKu83gWXpOmL4vFmjgq2eXETAs=; b=tsP+Ivm4NO+sSJwPyA2wMNQNG2
 huv4hwou6iHRS8RadzEzCt/gdHsr37RMgLucOon9zavHKgQ4uxBF4hqb9O2rKhwlWZtCH33FaxNrX
 L1DN9elxnbBXr5dSACoaSNu6GV7TJ2h+Ho80Pxo0av6CnZDs8TnA9xmdAWvfXcyKNxLOPrsdvYzIh
 MQoPrVSeGcBDQVqsmCYzG9pl7GwVLWpR4JAMY4+Qgb4Fwvg4/EO93V6uCAi6Jty03kYnwnUC/r0/9
 107GuRyRqxeS12obIE+QbR4GqiZiBbJ3WHrXsmGH+PPrDbL9vWX0ANVfu7snBP8gpCBJ7BoZxY7Qw
 ZgM6MEVg==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1sgy5g-0000000A0kZ-07wC;
 Thu, 22 Aug 2024 03:02:24 +0000
Date: Thu, 22 Aug 2024 04:02:23 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Li Zetao <lizetao1@huawei.com>
Message-ID: <ZsaqPwOVA216C9Av@casper.infradead.org>
References: <20240822013714.3278193-1-lizetao1@huawei.com>
 <20240822013714.3278193-2-lizetao1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240822013714.3278193-2-lizetao1@huawei.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Aug 22, 2024 at 09:37:01AM +0800, Li Zetao wrote:
 > -void clear_page_extent_mapped(struct page *page) > +void
 clear_page_extent_mapped(struct
 folio *folio) Rename it to clear_folio_extent_mapped()? 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [90.155.50.34 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sgy5y-0001m3-VY
Subject: Re: [f2fs-dev] [PATCH 01/14] btrfs: convert
 clear_page_extent_mapped() to take a folio
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
Cc: josef@toxicpanda.com, linux-f2fs-devel@lists.sourceforge.net, clm@fb.com,
 terrelln@fb.com, dsterba@suse.com, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Aug 22, 2024 at 09:37:01AM +0800, Li Zetao wrote:
> -void clear_page_extent_mapped(struct page *page)
> +void clear_page_extent_mapped(struct folio *folio)

Rename it to clear_folio_extent_mapped()?



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
