Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 55391A49273
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Feb 2025 08:50:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tnv8J-0000Wr-Sv;
	Fri, 28 Feb 2025 07:50:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tnv8I-0000Wi-Bc
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Feb 2025 07:50:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wlEWCcXhT2+mEw5eXFSEqsN/MTxjnp5K6lFwqO2xMdE=; b=JDrN12bRUTY+giw3PqfbAjK9+V
 1LMHZXhmIUaqyhabvpfNsjNh/uUZtSUOl4BwLjYTUr1gOKMeD3FL5C7qKxS7Qp9XmwERFFmC2z9AK
 8lmU3M0Wqy4zZKuguiQRHnMLECPBz0r51VtNa6QGpJepfSqz+9vWRGx9LSLn2xHDoOiA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wlEWCcXhT2+mEw5eXFSEqsN/MTxjnp5K6lFwqO2xMdE=; b=Q+YSxBODYYc2XA3WP4TC4mHx5k
 oMivHvRTWmLbteW2I9fED1wCLtpSVss2s9wobF7mMlJMsA+5jcI3DtnmibXqiBCtRckuwGBgNVplh
 5Viq/EPOfErP9KKPHxKkmC0MTXpOaBIwFMwj+21v3KQUtRuLeQYs7WjohaH6rD6mIxYA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tnv8H-0000qX-Mb for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Feb 2025 07:50:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6E63A61F45
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 28 Feb 2025 07:49:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 378D8C4CED6;
 Fri, 28 Feb 2025 07:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740728994;
 bh=xzGvdO43Cac4M6XX0CA56Ipu7nb2OamXUYgl7cM5MO8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=fXmOQ+liaBjt83yS6u1Y8xTveBBDC/B1qEvF3qiOHD9yBNbELufUsfyatX6lT9/3n
 pGqr0wh2iS+smnG5ZLB/5pSt86omomTP4f7FDPsal7GI0wbA/TlHiyXy5vF7g744kh
 gvFnI8huaurFi8YEt8lnW7W7dMXhmgJZbD2pWzS10tAcKHN+IpZReAirx1meK7M6rC
 5aaRJTJIiPgxhjMHNIYuZaWk8cCf8Ya7XButpxWpUVPrubgu2tUB0zoMYarykIDQlB
 AJbYND239U/g9BGuJI/DJmGuG2DXuUMAm1wugMYVa+HJJ15XCFi0RcEVLTyFfX25ve
 p+YPvVZw5fuPQ==
Message-ID: <0e24eabc-c9e7-40c4-a793-b8ba6579cf77@kernel.org>
Date: Fri, 28 Feb 2025 15:49:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20250227212401.152977-1-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20250227212401.152977-1-jaegeuk@kernel.org>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/2/28 5:24, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > If checkpoint was disabled, we missed to fix the write pointers. > > Cc:
 <stable@vger.kernel.org> > Fixes: 1015035609e4 ("f2fs: fix changin [...] 
 Content analysis details:   (-0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tnv8H-0000qX-Mb
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix the missing write pointer
 correction
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/2/28 5:24, Jaegeuk Kim via Linux-f2fs-devel wrote:
> If checkpoint was disabled, we missed to fix the write pointers.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 1015035609e4 ("f2fs: fix changing cursegs if recovery fails on zoned device")
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
