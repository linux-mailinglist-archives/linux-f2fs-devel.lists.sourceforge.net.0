Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F1CA5BFB7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Mar 2025 12:49:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1try6t-0005jo-Jy;
	Tue, 11 Mar 2025 11:49:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1try6s-0005jf-48
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Mar 2025 11:49:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R8Q9TUFUcmUCmJa8fuQjdoN8lxpUwl7YK8Kj11w5jfs=; b=H3/NaMeE8zNZi3oJ4IGdGIaUg5
 KODaAJM6nw6qWUtW/r9F2ajfo3Ps0z/syI4sfO0a/s7FcZzD88dPySXeOE8QFiR9soZTIE02iV7/N
 836BHqdWzWHyrvd5Re7BT8bkHsuSrOSgutWAhELr5LdR/GKhDpoQe9UblJsDxv1dxBKI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R8Q9TUFUcmUCmJa8fuQjdoN8lxpUwl7YK8Kj11w5jfs=; b=HQiRit+Rl34aHpNb+zKTlGhGBe
 TBbgW1443ZLSTy8ZjvUdbThrA2pQzOMcxGZWtjJupJ/fqUS8Yvu/LJ3BoTO6EhdZAg3eeA+TwXEsp
 EpA6sgado6oNDU26wqR4PFC552Ox04M7bKTuvBYojmfugaWgi80LQDRzAX7xUXUx7o7E=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1try6g-0003Rj-Rc for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Mar 2025 11:49:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 11964A46A15;
 Tue, 11 Mar 2025 11:43:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CB98C4CEEE;
 Tue, 11 Mar 2025 11:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741693739;
 bh=RtjSiZtx5omuFVg3avMcut1p0gnfZssAhseajHHPr5c=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=swP1eeJqz9wAlJelMRxacwPkGbFz6jh0DEgR7pUP0pbGycnEyhtMvsxwzvh1LD5YK
 LIWiwzgY+BbGJA4LoafjQO1AIywnS7Ytl+SWVG+GRSpnHY9/8IQvUwVYDJlcraPMAs
 LV/m0fXHIp7yUFNWeMFD8Pat0sQ9MRj+e+tCxbVAGB1ZS0wof2BtbTeOnvfeJMbszb
 dqR+bVNWcQiFi/HU4KrBZ3QtI6tIhYCGKUpbEQlAjBsXZH3R9UU+ecDDfb5PVarKv6
 6u8RLr1+cdGZ4G/j28jn7Yd25DHwweCCO2+Npv1xiJIA5QkVPIxgwOQU/rGSQyb7Ka
 hlK49v4FGxpIQ==
Message-ID: <88e7f270-a752-471b-b57a-8b557c586ed4@kernel.org>
Date: Tue, 11 Mar 2025 19:48:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250307182151.3397003-1-willy@infradead.org>
 <20250307182151.3397003-3-willy@infradead.org>
Content-Language: en-US
In-Reply-To: <20250307182151.3397003-3-willy@infradead.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/8/25 02:21, Matthew Wilcox (Oracle) wrote: > Mappings
 which implement writepages should not implement writepage > as it can only
 harm writeback patterns. > > Signed-off-by: Matthew Wilcox (Oracle [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1try6g-0003Rj-Rc
Subject: Re: [f2fs-dev] [PATCH 2/4] f2fs: Remove f2fs_write_data_page()
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
Cc: linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/8/25 02:21, Matthew Wilcox (Oracle) wrote:
> Mappings which implement writepages should not implement writepage
> as it can only harm writeback patterns.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
