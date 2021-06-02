Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B9C398D7E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Jun 2021 16:55:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1loSGk-0002aU-TE; Wed, 02 Jun 2021 14:54:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1loSGk-0002aF-2F
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Jun 2021 14:54:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HzwSthLZZsd0472EdyxZ0+BVGrHTNJVPngelS5GWI2w=; b=M13AWKmmxFDsQ0BL3cQY0msGgl
 3vY8Wtk+Tdot9RQH8vsZZsLwsZk+4zZtevHaQshG8zvWePeDegMj7PDNKIi1SdBctFvhuxGtmLiZg
 WspRj3m9USf+yX9wsZuw4rnvxUGxiAuhSi8g6E3ifYv/veuJl38jKVPfJygp2iHJjK54=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HzwSthLZZsd0472EdyxZ0+BVGrHTNJVPngelS5GWI2w=; b=HKsXJLQKVrz/4dJ9GGQakE3A38
 oMfBSab9fHRsX3Vsan9SiDcbc831jnhnt/mScFnu3htvUOCU3pEgvUtk5K/NO++yux3h4MF21FYci
 tlHxL8WuruDdk5gesfw4z51oPw9upVR8cRBG4hAcSpR7MSqg51MWNYTQxuC6h656JXj0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1loSGa-007N2U-03
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Jun 2021 14:54:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2CF09613B4;
 Wed,  2 Jun 2021 14:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622645678;
 bh=CMRWorkve5j9VMMOu1GS9nLuWySAM7tRxFor5CPGeyU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=uIlweWKVN5VnHOpjMBsC3ZymUoSB+/zw6E15DFHI6pN1degN/3CS2BO6EV6DtZ7C+
 6+l8WXTpq9NzPXrA4CCY4CKxmIT/ydfP+N9QAvUcTBlAvQnyLYWz8jkChuRIagCyHL
 Lkiy7ztQ0eeyJCNRBRQx6/bRKryr2BklC4KSfhBZIzw0xsAR8+TnHgtbnp/t/xkQ96
 du/yPC7zS7eZLIz9uYVntSQqR2pzSWsL8lUabl81qaMDlVAvjbRP557Od2c1H6Qzu4
 PkAuS6SMWutxk4N3w6yu/c82H1wjWhPlj0mkVHWDMgwjzgxN17/f3qymzCGFB8opQl
 EwzPyutsrPKUw==
To: Daniel Rosenberg <drosen@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210602041539.123097-1-drosen@google.com>
 <20210602041539.123097-2-drosen@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <f5344d8e-aa94-f3ef-8f74-01f96103632a@kernel.org>
Date: Wed, 2 Jun 2021 22:54:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210602041539.123097-2-drosen@google.com>
Content-Language: en-US
X-Spam-Score: -1.1 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.6 NICE_REPLY_A           Looks like a legit reply (A)
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1loSGa-007N2U-03
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: Show casefolding support only when
 supported
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
Cc: linux-fsdevel@vger.kernel.org, kernel-team@android.com,
 Gabriel Krisman Bertazi <krisman@collabora.com>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/6/2 12:15, Daniel Rosenberg wrote:
> The casefolding feature is only supported when CONFIG_UNICODE is set.
> This modifies the feature list f2fs presents under sysfs accordingly.
> 
> Fixes: 5aba54302a46 ("f2fs: include charset encoding information in the superblock")
> Signed-off-by: Daniel Rosenberg <drosen@google.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
