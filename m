Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 045F395185C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Aug 2024 12:08:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1seAvK-0008PE-Bk;
	Wed, 14 Aug 2024 10:08:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1seAvI-0008P7-6H
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Aug 2024 10:08:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=foK+dwbcPYKLpVyiGGJ94IUxT/lSBmzeEIuRLwFGz9g=; b=A8gw3sF5u/SN8Q1WjEypXGFjZf
 0D+srMZRkfjli5KXHJ8zodgo8b2MF6mBzXV3movch6b1h9ejdf5BPclxARtxvJoEhBzIIEH1RRQRj
 6X92NvjcQQrNi0xfcGAJTqVjo9eTfiKMXxeRStrGybRdOvoaL4MyJQyWJRyuzri0lHw8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=foK+dwbcPYKLpVyiGGJ94IUxT/lSBmzeEIuRLwFGz9g=; b=Q2AkPZPOTi9x3ng49IZm+YHmFk
 dolM+U7NONXaqqYxZfMsoZWk1Q9n926TPzCKmwsDmFP2zWnhrKJl6Zv066f09b/FilyLSxbt+QrHk
 0OKTXI+FfmFMZI38IX6oLhK5D+Tk5tLVlHY/cc8kJy+8LpM4tVvjVeF8Cn9XYlu5+M5w=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1seAvI-0004ds-49 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Aug 2024 10:08:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 48450CE10AB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 Aug 2024 10:07:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1E92C32786;
 Wed, 14 Aug 2024 10:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723630075;
 bh=vAr1zcRM3lYJGDmtDIaFu/G96CSMjx3B0d5w3GD6udc=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=aRy5hkjNivlH1NYNLDStUiacX8yfUXJDYSf53LAr93vj4AqvxRD8mYxU8tmy/YKhq
 EsI42n4M/4Oqp9mQ1Zg01IeFUwcAD4p/jujbzAWPXdKNa+ShwEI9LHdzobr5kKgR9o
 wqZP6et+rlFlnbcYvO2dnSWuwlNiFS6CEOv42qQQ48Bgqyll+GjAFL7I1q0A+dCE7l
 h9Ox8KvJ4+1QcuRyYhB2UPeaZpaYUgmL2IyhDwoKkUkcZVCAgU5zAbi2Z2hPi9CNBD
 nAIJZaDZXXXaE6DxuuS5fJ9jBxa37MiD6vxb6aWR4hVN3EHGvXm57AUsovpMFKoJYp
 ZglJHfcRXfN8g==
Message-ID: <dcc14b9e-aeb0-4718-a60d-b40719ee6543@kernel.org>
Date: Wed, 14 Aug 2024 18:07:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20240808233248.323318-1-jaegeuk@kernel.org>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240808233248.323318-1-jaegeuk@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/8/9 7:32, Jaegeuk Kim wrote: > It'll crach fsck.f2fs.
 Even, let's keep the write pointers and just finish it. > > Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> Reviewed-by: Chao Yu <chao@kernel.org> 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1seAvI-0004ds-49
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: don't call dev_fill w/ null buffer
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/8/9 7:32, Jaegeuk Kim wrote:
> It'll crach fsck.f2fs. Even, let's keep the write pointers and just finish it.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
