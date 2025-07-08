Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEADAFC73F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 11:41:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=18o23HzV4BU47TIvvp5CPXYTeq0uu/alWMpak/6Q1zI=; b=V2IqID8Upl1g3MMhyxilRG7ZM9
	TEbJ9iQjOtSPzfe4Kk4enXVhpJkA/RCPkXRw4kkbCK8G8Neg4HMwS5gSc3aebJf1qM0Cmme56FVWQ
	SaW1G3+2X4fLbjpM4O5mBlzkdZl4ItbZqpSsPrZg1BkQxS28fSdFUyCslKKJfM/ps7Xc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZ4og-0004V1-8D;
	Tue, 08 Jul 2025 09:40:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+94213881afc477778e20+7989+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1uZ4od-0004Us-Ok for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 09:40:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xMDHjiDJIJmRWu2K0DH66X5hKEZSubxzRhPtX7/C4pc=; b=IzSO3jKBMr9ujuh9fCooujcHnz
 3L+7rNoboTva0a0zeqcEg+r1E+TzNC4IN7ygz0pSVxP3CqTaPOv+vaiCWQRPENvxzker1rq5Ijf4C
 7HKHCUFfdNi/Kq6BoF1NSb3lmW2EVgs2lR82n8S9QGIXGTDqd+z5S7cDjmHS/FbxJEZ0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xMDHjiDJIJmRWu2K0DH66X5hKEZSubxzRhPtX7/C4pc=; b=D//Oy7w0RSU3xpVVDXb+dgSr5D
 /vcQdvUQkh638we9LgSv6wrNVbt/Jbn4i+ADVe8f3ClYs0bDFz+4LY1cisKvEjopStjlsUzSTmhTp
 gDGDzivWEMrkk4dKnrZyNibCmq67Vo7dq0111Q7Lsan83a3sN8LmE02wu/2tVCL1VZl8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZ4oa-0003t0-Or for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 09:40:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=xMDHjiDJIJmRWu2K0DH66X5hKEZSubxzRhPtX7/C4pc=; b=ZYCGyHCI9fwC/sVJqiGVwq1LTW
 OqBYDnEuere2uF0W0JI9EuCgjjhn9A8xAFUfoYuht2xQ/OJ12uddmmwEBvb8pcSeGt/oFLGRv3Uwm
 cyyuk+D9ZZj+53BghS72x9Fvs3iCWRxZX5ABMK3WF50ojQpPLMdJeK3/Lc115vnGijEmfelq0PrIE
 jwaRLvPn4xK6EWkVmqUh24RBMXywhbYLe3XMPWpSCNZ9w/BZLCyIrbulv0F0269EkYmGfaeHeU49A
 jdfxi5t4XQoE3V+Er//QbuwevasZVUUA5SuS05nJeY0Nfb9FMnRB9CmJeWSPFLmB13CkbDM0rD5zr
 RTLgbhag==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZ4oQ-00000004urP-3mvo;
 Tue, 08 Jul 2025 09:40:30 +0000
Date: Tue, 8 Jul 2025 02:40:30 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "ywen.chen" <ywen.chen@foxmail.com>
Message-ID: <aGznjhBVCkifc6BD@infradead.org>
References: <aGZFtmIxHDLKL6mc@infradead.org>
 <tencent_82716EB4F15F579C738C3CC3AFE62E822207@qq.com>
 <20250704060259.GB4199@sol> <aGtatW8g2fV6bFkm@infradead.org>
 <tencent_3B7E5FEB5DB445A5DC50E3F3AE4DE72A7908@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_3B7E5FEB5DB445A5DC50E3F3AE4DE72A7908@qq.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jul 08, 2025 at 10:36:07AM +0800, ywen.chen wrote:
 > 1. Use the latest version of the fsck.f2fs tool to correct > the file
 system.
 > 2. Use a relatively new version of the kernel. (For example [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1uZ4oa-0003t0-Or
Subject: Re: [f2fs-dev] =?utf-8?b?5Zue5aSN77yaIFtQQVRDSCB2MyAxLzJdIGxpYmZz?=
 =?utf-8?q?=3A_reduce_the_number_of_memory_allocations_in_generic=5Fci=5Fm?=
 =?utf-8?q?atch?=
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
Cc: Eric Biggers <ebiggers@kernel.org>, brauner <brauner@kernel.org>,
 tytso <tytso@mit.edu>, linux-kernel <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>,
 Christoph Hellwig <hch@infradead.org>,
 "adilger.kernel" <adilger.kernel@dilger.ca>, viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, jaegeuk <jaegeuk@kernel.org>,
 linux-ext4 <linux-ext4@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jul 08, 2025 at 10:36:07AM +0800, ywen.chen wrote:
> 1. Use the latest version of the fsck.f2fs tool to correct
> the file system.
> 2. Use a relatively new version of the kernel. (For example,
> linear search cannot be turned off in v6.6)
> 
> 
> The performance gain of this commit is very obvious in scenarios
> where linear search is not turned off. In scenarios where linear
> search is turned off, no performance problems will be introduced
> either.

Turning off hashed lookups was a stupid idea and should not last.  Hashed
directory lookups are the one file system improvement that significantly
improved lookup performance.  So don't work around it, because otherwise
you will be creating more optimizations to work around the lack of
hashed lookups.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
