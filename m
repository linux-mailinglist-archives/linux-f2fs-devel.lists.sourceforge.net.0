Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 115E99747FD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Sep 2024 03:55:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1soCaA-0003G5-JC;
	Wed, 11 Sep 2024 01:55:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1soCaA-0003Fz-0X
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 01:55:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GDguCUppuG9QUVF5v81VLO5AoiA8nGPU1X6TopGbWlM=; b=eLx59FyayL/KTbhzhjyrS3+l89
 eAZWUOiwIB1FHJVYt02TkHF3KYS1bjUQVQ+Bw1qBAeZYcWcZ6ZM1hlojoQZLVibjKoriFeAKH0DaW
 XFqnRV53iKLid73h+1UaTq2BKJHzxR/D1TGU5apO9O9dvXlYnS3/PTi6rrrUi2AjTj1Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GDguCUppuG9QUVF5v81VLO5AoiA8nGPU1X6TopGbWlM=; b=UZRbq3kSxMkS3bW2x3dF/3Fd0R
 SvCbWmK60JwZIcz4XTmmh6O8U5E6zpfaOkD5z9iiIKD3iTW1vA9AwBQRcHIjJj40+ZYiEdsCF4mcl
 7GHA2Ca+WkOTISqnJB5YlWChV2aUd7BwPDbA0ZVtR4NxoBMmjc2VIjQicO4fyOfME2I8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1soCa9-00040x-E5 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 01:55:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8A2595C062F;
 Wed, 11 Sep 2024 01:55:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1339C4CEC3;
 Wed, 11 Sep 2024 01:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726019739;
 bh=u22K8r9foXtr+7paujcJ/ApAdSro5EUyd4uHs8UiTWQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=UJOcBqdpkhjNEjtwPeckjcZkC5vhfqQnSNXYggtTurPkk4ulDm6K/ywpk2BP8qG9v
 TsjjVAi+sIN7mGof9s76EgdHXonMAriDBjllSzcvwkUBaGiTM6qRK/r/B3bS34aLft
 Uz8w2/NpnTkysQV85tc9fUItZJCZ07T9KE+7Ix5qR0NjsGOQBtWG3KccglccbWHEmi
 phgR7AN0QyeBqN3cj8H4kYfmQ4zP3ycrxuGCNdpQf9V0Zm8wXmx7GyXoXLFXX1iGn9
 fisjVjxDoMnIMffVbD0mlM99dU07mQKY2F60zTw1orXPcCEh/LfOQPaTdU4wjzaLkr
 tikzNZNDMBGzA==
Message-ID: <380e8cb7-b3b8-4634-9e61-1b622d2bcf45@kernel.org>
Date: Wed, 11 Sep 2024 09:55:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20240909164535.1926830-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20240909164535.1926830-1-daeho43@gmail.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/9/10 0:45, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > Removed a redundant code to set i_ext.len to zero.
 > > Signed-off-by: Daeho Jeong <daehojeong@google.com> Reviewed-by: Chao
 Yu <chao@kernel.org> 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1soCa9-00040x-E5
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: remove redundant i_ext.len set to
 zero
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/9/10 0:45, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Removed a redundant code to set i_ext.len to zero.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
