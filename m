Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EE89BC324
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Nov 2024 03:25:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t89GR-00039a-0f;
	Tue, 05 Nov 2024 02:25:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t89GK-00039O-7R
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Nov 2024 02:25:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K3xqHMQRKooxzQ1docH7nZ7frKt5tZ/FqDcPI5sRsMg=; b=Tl/j4iLL47S/GMHJ88PCzXNA0B
 Rc4oomio4MDHUd29fgdS5/zixK1Sr+4O4EmfQTQCDcwMfZHnys5iGS8daGZYOaNUIg2mrLhJG0qjV
 YICqnosJ6DU6Py+/cieMn+tQs1Jx37fb7Gq2eqbITBa0/lrrMtWR/DNswoKEKxYqQdfs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K3xqHMQRKooxzQ1docH7nZ7frKt5tZ/FqDcPI5sRsMg=; b=b0fn+/RFMwp1X+aknGVJYdtNay
 gn3DsuGbvvj9g1fzyrv4ZLc0jpBs7mGcRtQixJTD4S97KVSPC6PTONoaYzpHc0vexe+qShjrx0iDF
 3nTwPGq8uFAMg+RndgmQbIJ9rh/RDHkXdnxXWeC+RVTFoTbpQJxOHkzYZBc/PxrrmFq0=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t89GK-0000qc-Bh for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Nov 2024 02:25:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 92EE0A41682
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  5 Nov 2024 02:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91EE2C4CECE;
 Tue,  5 Nov 2024 02:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730773538;
 bh=lMPzJ/0+w8JmynbuIt0L8pf5Ylg7Fz2EHcfrGzofX6s=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=N2EweqFGeXYl/ePs0VcVJKuSiTjjHvuKpz2qD0fct0SPZueMrYOT3nckCOo4eBHr/
 1dXXu/HUgq0gmqly27LKXPa8+O99w2S2mZZjWiLWCGwFUgTw/b/F8yRFtGcmitMY2+
 feYtP6pl3kuhRCnle7PDwgdjclknmJnxHIqv07nU8MnMldMSYDDqkR2lAWTQXweLix
 GdaYZ4f3TTmlo+4dFFICEo4P5/FdKILRB9z0lGhWnk+5i+S05PBkUYwpYMKHpFLsD3
 IcWZ94U71Pe7gHudYA55Lc58jy2aIicy8PsuZRzDiCvNw/JhFUsv5iFyeigh1A/0Mn
 94qJ6PF/BLPAA==
Message-ID: <a55d0fbb-c6ae-4321-8671-86cf44b6d764@kernel.org>
Date: Tue, 5 Nov 2024 10:25:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20241101235318.300320-1-jaegeuk@kernel.org>
 <20241101235318.300320-2-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20241101235318.300320-2-jaegeuk@kernel.org>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/11/2 7:53, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > This patch improves the randread test: > - add mmap > - add fadvise option
 > - show performance results > > Signed-off-by: Jaegeuk Kim <jae [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t89GK-0000qc-Bh
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs_io: add more options for randread
 test
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/11/2 7:53, Jaegeuk Kim via Linux-f2fs-devel wrote:
> This patch improves the randread test:
>   - add mmap
>   - add fadvise option
>   - show performance results
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
