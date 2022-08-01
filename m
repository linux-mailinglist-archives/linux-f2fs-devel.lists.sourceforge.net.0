Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3854E587056
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Aug 2022 20:23:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oIa4f-00038j-6c; Mon, 01 Aug 2022 18:23:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <BATV+ddfeeeb461a4d68a1acf+6917+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1oIa4c-00038c-OV
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Aug 2022 18:23:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gPdrcUpLAcK6oYiMvTryLalqWjaKI86cW7a7OxyjYBc=; b=Reg4bcevZJfGuzc7M4//rsjFO4
 wPZpyQ8mLc4UU1rH45tcvtpysj8xGg8UhBn/jwWh3NfEKRAMFje44UiGQnR0TYJPoUHbh8guzoZDK
 Py+yStqIFmcAmNrmJPlN96pyXTFCKrIibY20lwHAO1pkpFLd8bDMd6hSA0LZ0r//snWI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gPdrcUpLAcK6oYiMvTryLalqWjaKI86cW7a7OxyjYBc=; b=EQvIvmywyVqKGJvpe2pQ/r5SLi
 ePFsmT5H03r/X77e3Ss0N160g0FX5UkrIxjMDiWmoo3W11iBrBqq+V+tJmTDu0fhY1Th9r5n80ivD
 FDOIZL6Z9e+HfoR/Dwtsf4Nrm6zVGXGUIbMslsmKEmjubcg74nHs9FklqVgZz7xPIxQw=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oIa4X-00HZNz-Jv
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Aug 2022 18:23:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=gPdrcUpLAcK6oYiMvTryLalqWjaKI86cW7a7OxyjYBc=; b=B5vl6MV01f/2wsZuU83jCIsej1
 U299QIo1COaVF7aXM9uJlLZiiGM0UvF8xSkDc7PnV0FKYOwLUtgucDSqkdxayzPd66P0kl8xXWV3G
 pz/AKuSK30hVgEO8cqKR5A7M1zGlUADU2IvkTOSiILaS+avAYlubQ+41FXmq5ILrVNK6q2BtlPd6e
 3OIbmSDROAXhg/b+u1xyQw2UKzpjtB5XuLvzeC5P+UTmJ3CkKSwl9zI61UMd+CYrroe+CGN9TOugy
 otP9rE4j0YeT5fkj99FRn3tNsPQkCyU3BXtGNOYxXCA5y2FHKMiF8vGFaH5LvsvHZ9hwSUYVOUjyc
 XWNbuFlA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oIa4E-008sGW-NW; Mon, 01 Aug 2022 18:23:02 +0000
Date: Mon, 1 Aug 2022 11:23:02 -0700
From: Christoph Hellwig <hch@infradead.org>
To: studentxswpy@163.com
Message-ID: <YugaBtQcoR4XhXiQ@infradead.org>
References: <20220801092202.3134668-1-studentxswpy@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220801092202.3134668-1-studentxswpy@163.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 01, 2022 at 05:22:02PM +0800,
 studentxswpy@163.com
 wrote: > From: Xie Shaowen <studentxswpy@163.com> > > replace kmalloc with
 f2fs_kmalloc to keep f2fs code consistency. For that removing f2fs_kmalloc
 entirely would be way better. 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1oIa4X-00HZNz-Jv
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: Replace kmalloc() with
 f2fs_kmalloc
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
Cc: Hacash Robot <hacashRobot@santino.com>, jaegeuk@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Aug 01, 2022 at 05:22:02PM +0800, studentxswpy@163.com wrote:
> From: Xie Shaowen <studentxswpy@163.com>
> 
> replace kmalloc with f2fs_kmalloc to keep f2fs code consistency.

For that removing f2fs_kmalloc entirely would be way better.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
