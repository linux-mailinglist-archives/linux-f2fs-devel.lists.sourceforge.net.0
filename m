Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B97AEEEFC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Jul 2025 08:41:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ydem1veJWLO/YQEE5Xc7f3iVKJvDuYZyt7HaV6fMvpc=; b=gPuUywlujEZkMr+P9xPWEhmv1K
	tQlzVHVEv3twi9/qpZ6Fc/iHOPUUi3JWcaV7w15DCF6BB22/CRUKVcbRSTnlFRKKfCYPUrGgxddFT
	q8iE/7uDshgwbIZZUGdvg5uXgfKaBA4bJl2jyOycoGiF6gv9lZgHUmJWF/Cy00je1YrI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uWUg4-0007yd-FY;
	Tue, 01 Jul 2025 06:41:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+3b1883a23afd6568c89e+7982+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1uWUg1-0007yG-TN for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Jul 2025 06:41:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s7BH5zj57vnanAybMvNIxyBpSO2aU1zJgsPSuv/cMDE=; b=AMcROtNtMBOZT11ZJHTNUxZB8g
 JqKaRl5fLHTLIwhmwKa8oWwjKRuJLcNNQMAe917gdbiuA/Ntr/f2QlDUjiO2GzcxCnkVt/YgyFL9h
 02SNKu9bPMPqplFFqaVEr/sFH1lK9mdKWWsqx9kmx/6YKbGyeumiqi5yTp77X4HKM6r8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s7BH5zj57vnanAybMvNIxyBpSO2aU1zJgsPSuv/cMDE=; b=M+Q04Ilg2v2r4wW2r/JCTTboAz
 XIzQliXbTUL0JD5Xo+bp6Cuv3yfDz5ZiE6q8h4TSJtpOYcHOkgE6VKJNHO90ex5nJjIvtjhihWeOx
 MU0BUmrL7WTjZj2+COvo6KH5V/L7sFQgfDhkxJQ8WYDQL08jpLlaCPXD/48iMCMrP0gY=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uWUg0-0004lW-Jg for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Jul 2025 06:41:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=s7BH5zj57vnanAybMvNIxyBpSO2aU1zJgsPSuv/cMDE=; b=YNeOKmjnjEfN/fWh1S5zkt11g7
 9Gkx7EM4suqQHjDXcrNZpvMqxmSU3a2BoSuYCYWIZ3WaPCd1pfActnh/DEStGLABV7qK50F7bB2fC
 bPGlM/pJvdMDCX3zGxyjQ7JqFw/3+e69aqOV38BFOV4fP4BfDJCeRhQXeSwjBHiSnLzTEf5H2HJwS
 DDCrPN8diRetpfoQKXWMlzkzGHBraI4Qdpr1as1TTpb2vLZpxFiSBledpbOI11rYmw2gN/CYBPQR1
 Z2qONkH9M5FEwiqYXAEqMaf8K4nue5+8xTXM/hY/RhUOi77KTpdZQc3lZOg7qOPHWXHAZGVuJEffU
 KDAVGIuw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uWUfn-00000004Az3-3gF4;
 Tue, 01 Jul 2025 06:40:55 +0000
Date: Mon, 30 Jun 2025 23:40:55 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Message-ID: <aGOC94DxPTx_vljt@infradead.org>
References: <cover.1751347436.git.wqu@suse.com>
 <6164b8c708b6606c640c066fbc42f8ca9838c24b.1751347436.git.wqu@suse.com>
 <aGN8zsyYEArKr0DV@infradead.org>
 <baec02a0-e2fb-4801-b2ad-f602fc4d1cfc@gmx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <baec02a0-e2fb-4801-b2ad-f602fc4d1cfc@gmx.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jul 01, 2025 at 04:05:03PM +0930, Qu Wenruo wrote:
 > > Please also rename the function so that they match the method name. >
 > I prefer not, and it is intentionally left as is. > > This give u [...]
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1uWUg0-0004lW-Jg
Subject: Re: [f2fs-dev] [PATCH v2 1/6] fs: enhance and rename shutdown()
 callback to remove_bdev()
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
Cc: linux-xfs@vger.kernel.org, brauner@kernel.org, ntfs3@lists.linux.dev,
 jack@suse.cz, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, Qu Wenruo <wqu@suse.com>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jul 01, 2025 at 04:05:03PM +0930, Qu Wenruo wrote:
> > Please also rename the function so that they match the method name.
> 
> I prefer not, and it is intentionally left as is.
> 
> This give us a very clear view what a fs is expected to do.

No.  Mismatching method are an insane pest that makes refactoring
or even just reading the code painful as hell.

Nacked-by: Christoph Hellwig <hch@lst.de>

without that.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
