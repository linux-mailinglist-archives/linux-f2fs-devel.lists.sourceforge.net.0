Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C438BA19C93
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Jan 2025 02:50:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tamMe-0001s3-FW;
	Thu, 23 Jan 2025 01:50:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tamMc-0001rw-QJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Jan 2025 01:50:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VqIXqy9oI5X96YS6HURaqJ9+DwydXnLLPSRs+t7+lVw=; b=lfIo9C3NRcWzZI6VWfZychNZ3y
 WAoJcDav6YqEKRC7QCiLwdXDqThr6DDC1ysAPlFoF5Ngn+fUD3PRo/KnJeG+EsFzs5dh+bpA+Pljy
 fbaDQVV3oafGwm9F7pjoXoCpF2o4kMpLTD615zHyVKBrQU25fbw1e0c7ewYQvtrBJbj4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VqIXqy9oI5X96YS6HURaqJ9+DwydXnLLPSRs+t7+lVw=; b=F2a0YN67++YIlu/zNTxofdQgk2
 407S2jPwUpBFh2pJ/tTCOUMq50m6Thwu9k8Hh2c1vfvc0pvtdLk7Oi+8WlQfS+XIITRGppCnoLmB7
 BxXT2sP+HzjciG283bXG+eORaXl3lDsQWnxJ0Jy38xSX3pZrl/l719pBlOK/NJHHmM4I=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tamMc-0002IK-Qz for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Jan 2025 01:50:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B873EA42B6A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 Jan 2025 01:48:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D933C4CED2;
 Thu, 23 Jan 2025 01:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737597028;
 bh=MFa6sE3c6bEQ0/tVR9xYFhnCdB1FZZS9Zo3BRCwSBls=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=cgqMJLwsgiVvopY6hxAod69tdNa+4E3atbPYLHRd9m/q0Hk9XpqQ5mFcDBK6GJiah
 WsuqtV/R80B7EwroML+9f+Mzcmu22Zp35PMjQool0EQU9J7l4Oi2nWtCb6KNeC53c+
 vNDhgBL0U+FkNwBb4er4lfSnmIu6LY0L+i95XIHh9i5DTxWpu2fGh+7AI3XRQweJ48
 uvUFPaRiASz7ScVT8b+poGv2LtVWqqvf/wG68TIvzpUQIzQgsG7sOvegA9LEQpcfl6
 fdGBz/2lS7sG4x8W1VLEByU+OCdC1Xrphk9tjfe2EAjp8nxN/UzZ/wB/dQZ/4rVEgQ
 bGKgxyhF3HC8Q==
Message-ID: <516a18c5-f380-48de-873e-db021e9c63cd@kernel.org>
Date: Thu, 23 Jan 2025 09:50:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20250122211323.3835557-1-jaegeuk@kernel.org>
 <20250122211323.3835557-2-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20250122211323.3835557-2-jaegeuk@kernel.org>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/23/25 05:10, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > This patch introduces an inode list to keep the page cache ranges that users
 > can donate pages together. > > #define F2FS_IOC_DONATE_RANGE [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
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
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tamMc-0002IK-Qz
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: register inodes which is able to
 donate pages
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

On 1/23/25 05:10, Jaegeuk Kim via Linux-f2fs-devel wrote:
> This patch introduces an inode list to keep the page cache ranges that users
> can donate pages together.
> 
>  #define F2FS_IOC_DONATE_RANGE		_IOW(F2FS_IOCTL_MAGIC, 27,	\
> 						struct f2fs_donate_range)
>  struct f2fs_donate_range {
> 	__u64 start;
> 	__u64 len;
>  };
> 
> e.g., ioctl(F2FS_IOC_DONATE_RANGE, &range);
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
