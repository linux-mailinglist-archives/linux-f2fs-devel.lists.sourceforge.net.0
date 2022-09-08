Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A50B25B1249
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Sep 2022 04:01:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oW6qm-00067g-8R;
	Thu, 08 Sep 2022 02:01:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oW6qb-00067G-35
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Sep 2022 02:00:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YbDRk4BWWh7U5jaXchQQ0I4Sg5bkiIWhWrBroA6yncE=; b=jKXvsvxLHjDWzULWd+YuP80H9N
 xVYXbM3HZM8UFdxGhXVmSgjE58LZb1I78GCjBctKkiJtwUzYckngqqfhrpxE1jRZZun6z2EPpJz7J
 DzE3DLE6CXJGKjoiuWKR5RiG/bQWzmAWHFyY2VgG47DkypZROpBADiJgv77xAvNwNeA8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YbDRk4BWWh7U5jaXchQQ0I4Sg5bkiIWhWrBroA6yncE=; b=Ka/k1+nH2nsWH4okYqDIIjK3g3
 yU6294MU4JMQ1rqO9jYf/F9k9EN9KCfofV+jg39/5mOycP1lSmmTjnE5mBvmzlIhjlLxPQn5XTKbW
 I++qwjtf4iBgojiY0jHdwXXo8rkzr+/voMZoPfTE4BNDcpWJc0WVb93hgwL9IeMYA/ow=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oW6qa-001ggu-H8 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Sep 2022 02:00:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1D04961B1F;
 Thu,  8 Sep 2022 02:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A9AC433C1;
 Thu,  8 Sep 2022 02:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662602446;
 bh=ykIyX1r6EPVTXkRsMWuX4hF98iRFGnijnz7r06qwuS8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=tDFZ5HJHLk/8gBiMczbHy21cqZpnE/ZuQj1aOm0JKkutHIX20imKw18NVAj2C24Bm
 WzN5CvHvmM8Q+njnoImwIgSm/qM3eHN4hOIpnBx6I25nYu11kM5XAlzAwqgHJbZI8U
 SR2wSLtwr2NOFQDEcUhMsr2zTV+kL+blOuBsBoRzm6GGteval3a2Kj5U3jQ2kcWoI7
 ZxHxewD+EmJj1v7QBTLkCHCHuL4ynULWfos/ZezP8O9sz+VgmwZEjbaYew+uLvZl3l
 d9+LbggXJjORb2dSV+yzh7s7wHXk+5+VeD6GxAaT9LiFt+zXLQXnLX/dymIxvLxLVA
 YEw06QZBg5f/A==
Message-ID: <b99b6fb5-c289-dec5-fa15-779e069af3cb@kernel.org>
Date: Thu, 8 Sep 2022 10:00:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
References: <20220901002828.25102-1-rdunlap@infradead.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220901002828.25102-1-rdunlap@infradead.org>
X-Spam-Score: -9.4 (---------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/9/1 8:28, Randy Dunlap wrote: > Change occurrences
 of "it's" that are possessive to "its" > so that they don't read as "it is".
 > > For f2fs.rst, reword one description for better clarity. > > [...] 
 Content analysis details:   (-9.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -4.2 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oW6qa-001ggu-H8
Subject: Re: [f2fs-dev] [PATCH v2] Documentation: filesystems: correct
 possessive "its"
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
Cc: Christian Brauner <brauner@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Jonathan Corbet <corbet@lwn.net>, "Darrick J . Wong" <djwong@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Seth Forshee <sforshee@kernel.org>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/9/1 8:28, Randy Dunlap wrote:
> Change occurrences of "it's" that are possessive to "its"
> so that they don't read as "it is".
> 
> For f2fs.rst, reword one description for better clarity.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-fsdevel@vger.kernel.org
> Cc: linux-f2fs-devel@lists.sourceforge.net
> Cc: linux-xfs@vger.kernel.org
> Cc: Christian Brauner <brauner@kernel.org>
> Cc: Seth Forshee <sforshee@kernel.org>
> Cc: Al Viro <viro@zeniv.linux.org.uk>
> Cc: Theodore Ts'o <tytso@mit.edu>
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Reviewed-by: Darrick J. Wong <djwong@kernel.org>
> Reviewed-by: "Christian Brauner (Microsoft)" <brauner@kernel.org>
> ---
> v2: Reword the compress_log_size description.
>      Rebase (the xfs file changed).
>      Add Reviewed-by: tags.
> 
> Thanks for Al and Ted for suggesting rewording the f2fs.rst description.
> 
>   Documentation/filesystems/f2fs.rst                       |    5 ++---
>   Documentation/filesystems/idmappings.rst                 |    2 +-
>   Documentation/filesystems/qnx6.rst                       |    2 +-
>   Documentation/filesystems/xfs-delayed-logging-design.rst |    6 +++---
>   4 files changed, 7 insertions(+), 8 deletions(-)
> 
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -286,9 +286,8 @@ compress_algorithm=%s:%d Control compres
>   			 algorithm	level range
>   			 lz4		3 - 16
>   			 zstd		1 - 22
> -compress_log_size=%u	 Support configuring compress cluster size, the size will
> -			 be 4KB * (1 << %u), 16KB is minimum size, also it's
> -			 default size.
> +compress_log_size=%u	 Support configuring compress cluster size. The size will
> +			 be 4KB * (1 << %u). The default and minimum sizes are 16KB.

For f2fs part,

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
