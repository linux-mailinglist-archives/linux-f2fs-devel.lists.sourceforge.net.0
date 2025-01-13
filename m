Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D8517A0B8AC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jan 2025 14:50:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tXKpY-0001qZ-4y;
	Mon, 13 Jan 2025 13:50:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tXKpS-0001qJ-AI
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Jan 2025 13:50:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nGBq0YvBYCjXy18vyg3KopuJBvi6Jd6WSpQn4cZHH34=; b=H6VazTbHgb9SJKVxQt4QxgMkoT
 /54t4YR43iaHczb/fEJvB7yINcIe/u3MSfYP/mSQX1wAfn68w1xQ99HRMhlNK2kgygbt2HqzpJaHZ
 jtSoFxnwITc0KDuiUgF/YObrAllQOgn6aQB9zNqMu68JN1gk1fofAwhrQ/CsXvBt5vW8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nGBq0YvBYCjXy18vyg3KopuJBvi6Jd6WSpQn4cZHH34=; b=HpAsUg9TzvSX7i120/6NnYHPV0
 MXGG0cjWmjfd2NU0erWKNtTdWAjU6sX4ZgskRNoiw0z/EEMOLjX46uWuL3DiesXpUNvw7NVFwsE/n
 IlvA8KnNa/RyUFxb/Sj3NPvT5sVqfOy1XeitF6Tetlr0r/d4xwMph+AXlPVekhff3T+I=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tXKpQ-0006jp-Eu for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Jan 2025 13:50:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 84C8CA40FC3;
 Mon, 13 Jan 2025 13:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39CFCC4CED6;
 Mon, 13 Jan 2025 13:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736776198;
 bh=NV+fMuqxSRQnIPeBuoXSCl1lXf1W3Kt9I7rOIL7DD/w=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=YoIHSbErQ4gmYyl2P5CDX/KvKEIug7BG4EYNTYgJJgTcX2sVhQIXMtOyLN2LLXYPu
 HoH808V2wUs5zxoXiSAMeApvMcmc5P4MWNxH2enmOE5WFd8CWfC32fTEFPv3XdB49o
 MJT5tZZq+mg8VCtQfDTTaoQ7RmX1FaKyR43c6Ev0ErPu+wlbGrfsdUvnduloEng4Yu
 hHt1T0EgAJyY9N+O9aU0QyKNcxaMFoK2A0kTZNcjUmHb0vkGq8cxKuwA84wEpV2Vuh
 +fTKngE0FNTMLZc+zlqsAUnxJdacgF0HvqoPYEjgVpa0TrJVA+rFA4XtSFexZRj48f
 MhYhIfbCiJWfw==
Message-ID: <3e059dd1-ff49-42b2-a39f-ca38079870a8@kernel.org>
Date: Mon, 13 Jan 2025 21:49:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yi Sun <yi.sun@unisoc.com>, jaegeuk@kernel.org
References: <20241223081044.1126291-1-yi.sun@unisoc.com>
 <20241223081044.1126291-4-yi.sun@unisoc.com>
Content-Language: en-US
In-Reply-To: <20241223081044.1126291-4-yi.sun@unisoc.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/12/23 16:10, Yi Sun wrote: > New function can process
 some consecutive blocks at a time. > > Function
 f2fs_invalidate_blocks()->down_write()
 and up_write() > are very time-consuming, so if f2f [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tXKpQ-0006jp-Eu
Subject: Re: [f2fs-dev] [PATCH v4 3/4] f2fs: add parameter @len to
 f2fs_invalidate_blocks()
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, sunyibuaa@gmail.com,
 Hao_hao.Wang@unisoc.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/12/23 16:10, Yi Sun wrote:
> New function can process some consecutive blocks at a time.
> 
> Function f2fs_invalidate_blocks()->down_write() and up_write()
> are very time-consuming, so if f2fs_invalidate_blocks() can
> process consecutive blocks at one time, it will save a lot of time.
> 
> Signed-off-by: Yi Sun <yi.sun@unisoc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
