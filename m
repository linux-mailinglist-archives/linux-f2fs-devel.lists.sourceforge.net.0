Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D1896A2E867
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Feb 2025 10:59:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1thQZt-00031b-LM;
	Mon, 10 Feb 2025 09:59:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1thQZr-00031U-Le
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Feb 2025 09:59:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wsLpEQpv8tLQboH7E2WjHvysiLes9hunlVSjAFEZf9g=; b=ULPEKjXw8fV7KoM6a5/sbAMiz0
 tT4LcAxTp6CHWmVPMSJxQWv4UPq0dQ40RJ1T/YWoGzYFaoYqsMKe6bvl5br7bdiZsi2O7QfdXvjrP
 8Cvm9JTn6LRwqW4UNGE3WxPHquAqXTrVaAU9E//Au/vErY//4U4iJQCvN+VTc2OCwd7w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wsLpEQpv8tLQboH7E2WjHvysiLes9hunlVSjAFEZf9g=; b=HiDIAv1cjFRW9g7uZn+Mi+yFqT
 FMZNFGTVIbr6fd0oc2z5ho0SCO2RZNPUp3623kp39RdDfmBocqF1dw1r8qVz1B3Vbn/boS02SsHhh
 xXBTOxKXgTran1g8dzcAhjYEa0qTgx6sDuHUiDGGyPQur2hQT6C5XFWsKCTgFZwmJQ8c=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1thQZr-0001tQ-0H for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Feb 2025 09:59:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B9DA0A40F35
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Feb 2025 09:57:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C304C4CED1;
 Mon, 10 Feb 2025 09:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739181572;
 bh=aTtvb1f4dMtTpn5Laz2mDNmKptpgk8JKwnk9yB+3Mqs=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=HApETyr27GOJHy51a/6b+lne7KRLt2svbWkGcav0KLhq5MNGmbLRllEjaYuspNYNT
 h2JAHSNFBOpMDrYEFQgiWLSVuo9P7/fTlPGlEhFWEPW0mNLom5us9EJJ7COtvVvA0M
 xefqD5rvHCbhlGAnlAGsslQD+0YH0gT/Oy3KDlnmaSdWgHlgky3v85b5oe6tUQo6wa
 h5qZnSS4xZfTW1wb6rOcjaW7ayJOufzEzCuPJOO+ubFFINStO0WxvXS2ifRFrLqXNa
 nQNdbH4wg/rZwWugf08QeGUlumaYZpSvwK+w1v+0tXiAGoBWya6zCdvXFFvYGlp4d8
 UGjsSp6yFGZ8w==
Message-ID: <61e5cacc-907d-4b86-a26a-63a31cdadd61@kernel.org>
Date: Mon, 10 Feb 2025 17:59:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20250131222914.1634961-1-jaegeuk@kernel.org>
 <20250131222914.1634961-3-jaegeuk@kernel.org> <Z6Y0w1iALudX9GA7@google.com>
Content-Language: en-US
In-Reply-To: <Z6Y0w1iALudX9GA7@google.com>
X-Spam-Score: -3.9 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2/8/25 00:28, Jaegeuk Kim via Linux-f2fs-devel wrote: >
 1. ioctl(fd1, F2FS_IOC_DONATE_RANGE, {0,3});
 > 2. ioctl(fd2, F2FS_IOC_DONATE_RANGE,
 {1,2}); > 3. ioctl(fd3, F2FS_IOC_DONATE_RANGE, {3,1}); > [...] 
 Content analysis details:   (-3.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1thQZr-0001tQ-0H
Subject: Re: [f2fs-dev] [PATCH 2/2 v2] f2fs: add a sysfs entry to request
 donate file-backed pages
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2/8/25 00:28, Jaegeuk Kim via Linux-f2fs-devel wrote:
> 1. ioctl(fd1, F2FS_IOC_DONATE_RANGE, {0,3});
> 2. ioctl(fd2, F2FS_IOC_DONATE_RANGE, {1,2});
> 3. ioctl(fd3, F2FS_IOC_DONATE_RANGE, {3,1});
> 4. echo 1024 > /sys/fs/f2fs/tuning/reclaim_caches_kb
> 
> This gives a way to reclaim file-backed pages by iterating all f2fs mounts until
> reclaiming 1MB page cache ranges, registered by #1, #2, and #3.
> 
> 5. cat /sys/fs/f2fs/tuning/reclaim_caches_kb
> -> gives total number of registered file ranges.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
