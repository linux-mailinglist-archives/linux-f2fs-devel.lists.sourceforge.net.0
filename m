Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA0681C775
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Dec 2023 10:42:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rGc35-0001ao-KI;
	Fri, 22 Dec 2023 09:42:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rGc32-0001ad-JG
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Dec 2023 09:42:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m11rtCAvzD3/ReS6+tolJ9NAqLRMITVkqgOY7AFOcLQ=; b=Q4kpc0qmnfgZqYiLS78Z/bVGcG
 YaTL1lpl2zzbEXZbU8949/iE6sgVf85mJwBqSuX+HXb8PAVGItQnXX9irDSt/FdPoBdgAzeURSJ3F
 od/YUYcVF8C/FlkpB9FV4Ob913eokFIVqSQ/a94mVe/pP5Z/y8ytbIPMhPBYvjeoGyy8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m11rtCAvzD3/ReS6+tolJ9NAqLRMITVkqgOY7AFOcLQ=; b=cuNAmol4kquicdslIRxF+Nnx7J
 vMdNfGtH8fbWd2ojZzmkpxl+c87+pm3E4wczdselpSS+UXHE9fXQl1Cv0N5833/zNiaZTwErqktbA
 N5BEq0SMaFIaWbzWvLEB8yxFw3ybLQL7bO0nCvqxOB6vowrSUyeTqZUCHNe52Vdwh6sc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rGc30-0005TK-7W for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Dec 2023 09:42:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0569361B6F;
 Fri, 22 Dec 2023 09:42:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6976AC433C9;
 Fri, 22 Dec 2023 09:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703238134;
 bh=p+9roaFx+Oo4gZM40YyRYFkahWCjHc9Sy1wNuH0y9WM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iZhci2aWpuaGAaOrTNKMieA4iw4G+bU6RH4UA2qo4oDdTfD/j+jKG6p4AsJ51A75v
 hEJPNrB90XPZ6s+vgV8PTBHBN8aLfgRUdJ1Mlb5GcMyBZQVCW7V4pTuOnWsMsSDr7c
 2ohYD5EROTkO5KgoeovDgtNHdTrqyrPODDSG3W3sxZlxwG6nx2h6g32czwbrT5ZpGd
 goSfbv4BqXDhMnDfwhHvy+I2P0Dm/dHIeyjDMiLk2D4DkH/ch+/otn1TfhDZ2b3BEc
 MGo0ZtyKKVJfNaVT0LFVhJQPuvrym+Q8PAUf6B0eBenqE1SQYc3ATj9lRIjjOsBdn7
 Aqg6EOBVlvD/Q==
Message-ID: <4d173489-a950-4af2-8ec0-fd9ace4f3370@kernel.org>
Date: Fri, 22 Dec 2023 17:42:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Yongpeng Yang <yangyongpeng1@oppo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20231222032901.3861649-1-yangyongpeng1@oppo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20231222032901.3861649-1-yangyongpeng1@oppo.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/12/22 11:29,
 Yongpeng Yang wrote: > The {struct f2fs_sb_info}->dir_level
 can be modified through the sysfs > interface, but its value range is not
 limited. If the value exceeds > MAX_DIR_HASH_ [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rGc30-0005TK-7W
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: Constrain the modification range
 of dir_level in the sysfs
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

On 2023/12/22 11:29, Yongpeng Yang wrote:
> The {struct f2fs_sb_info}->dir_level can be modified through the sysfs
> interface, but its value range is not limited. If the value exceeds
> MAX_DIR_HASH_DEPTH and the mount options include "noinline_dentry",
> the following error will occur:
> [root@fedora ~]# mount -o noinline_dentry /dev/sdb  /mnt/sdb/
> [root@fedora ~]# echo 128 > /sys/fs/f2fs/sdb/dir_level
> [root@fedora ~]# cd /mnt/sdb/
> [root@fedora sdb]# mkdir test
> [root@fedora sdb]# cd test/
> [root@fedora test]# mkdir test
> mkdir: cannot create directory 'test': Argument list too long
> 
> Signed-off-by: Yongpeng Yang <yangyongpeng1@oppo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
