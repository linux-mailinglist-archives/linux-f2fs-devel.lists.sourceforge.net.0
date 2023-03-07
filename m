Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 145636AE4D8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Mar 2023 16:34:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pZZKU-0003Kz-C0;
	Tue, 07 Mar 2023 15:34:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pZZKR-0003Ks-OQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Mar 2023 15:34:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r+AtHLeIJKeit9ZqwS5Xgb5SnBjPv8wCS+RFH2+iByo=; b=F/veEejV+fA8mksa1AMkWwd+Wx
 t/ErZSN2jsq20BhRvMaJca97HfmYaLDlQHsN5p0sgLe6z0hlscunOs9qp1NuOk4LqKMhlR6sopBSG
 8WxmuNZjRhKW2/K3R24W4KEd2iEBHkltZndqVgLzpJDuZkwRJ9BelPOHVAe7rXIl/PAk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r+AtHLeIJKeit9ZqwS5Xgb5SnBjPv8wCS+RFH2+iByo=; b=dTvkFwRf1pCHFN/WjzgIhDs/s2
 AtyqiQAq/RWg6tbonTMNExuPGQFRgf62pZ+BqUMXbk1+89s4nXaCURuwrRH4H+a0Qr8kA2q6Y01SI
 Zpi22QjelWhVSgB9PxEAT+LiNzC7+ZPExSLdohXNyx1djwUse9rUJa2wpJcQw9b+8Zyc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pZZKQ-002Jl4-Co for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Mar 2023 15:34:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 22B5861484;
 Tue,  7 Mar 2023 15:34:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56B47C433EF;
 Tue,  7 Mar 2023 15:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678203248;
 bh=Dn9EqSnkRGm4O9GvunZmjMZDcFNzVqS+z9c2o7I2WIQ=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=LhFZbk5Hq+Lq80Xx6oL1OxUtfcmurqh8fvDfQlqU2FYCQo7aIN7Rcgn9gXoKikTss
 jDrbbQcDOp3ebgxQF1uZAon9Pc1WPiNIeAtyDzIbmgDPJZxqOTUC6XgRf5pTIf14qV
 QfKuyFNZYC36sQ6PkXeFaPCIqge8/uAVG4mN6OM7GdKJE5xT54Pbi2EOj0RRzIUTqM
 q4BnEtU2nwAGQs2znCN0ZaGD3dcu26N5n6PXG/DseKgeuuVDDsdgP5PZ7ZWIXAd7en
 KtXjzTQ/2BziQxPSQQyjBx1c0lwTfAsSxZ/F4La1GHFaMnAtp70AvZ1q92O2qcmF7V
 en70vwv0dPBHw==
Message-ID: <fa14c118-ae41-6aee-d2dd-23730ef6a93b@kernel.org>
Date: Tue, 7 Mar 2023 23:34:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20230216135324.18406-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230216135324.18406-1-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/2/16 21:53, Yangtao Li wrote: > Let's use BIT() and
 GENMASK() instead of open it. > > Signed-off-by: Yangtao Li
 <frank.li@vivo.com>
 Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pZZKQ-002Jl4-Co
Subject: Re: [f2fs-dev] [PATCH] f2fs: convert to use bitmap API
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/2/16 21:53, Yangtao Li wrote:
> Let's use BIT() and GENMASK() instead of open it.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
