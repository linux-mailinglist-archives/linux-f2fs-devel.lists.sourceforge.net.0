Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 95388A19CB7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Jan 2025 03:00:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tamWS-0007Hl-Uk;
	Thu, 23 Jan 2025 02:00:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tamWR-0007He-6l
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Jan 2025 02:00:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KSSk50kvI9g++jyXSuWPLWrb4ENdI4miohoodsJzR2M=; b=ReMiSiD0TXbxvTngRM8WFkQlbd
 6G3EJl2FBLgbL6g/Tb7a5SS+zNiP38nnFgyY8P07mKbPjD35hhnY95sjG58StKWE+bfSDmyfk1x41
 UxcMvaiMYO02NwOxsZtRR19RvQor0yRSggr5rGRUHGjh2qs/eHEZvpb2fTiUwgG12S4s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KSSk50kvI9g++jyXSuWPLWrb4ENdI4miohoodsJzR2M=; b=bFJU1JqmoxJOJQ4qIK7fzX6mUr
 ffcvVa5+FT7OOJdjLWlNWXXhyRCsnsJuL1ZKVszq07xzIYYKU0aEljJj0vb0FQ4Uf15yMvibc/VPC
 4Y5DMcvkXqpIAGxBhzaQhUPyi2GVQQCIdl8CCfd8+H0W4kMXUu8kI6Bl7+ryaw0TuglA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tamWQ-0002u9-Hw for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Jan 2025 02:00:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CF2DA5C4D81
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 Jan 2025 01:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AD47C4CED2;
 Thu, 23 Jan 2025 02:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737597631;
 bh=yroC1KreSUODZP0INo0fIXnrbats90oMjLd44T7Fe2A=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=k2G5LqLDbSusVPUef++Xnj7XuzaRNGNmDkoEmVaCeg72jbazXZoGqaf+y36SQiDdz
 tg7M7wdEN8pG7fBKxRZ9m7v0KbQ+yZ7yeOqhwxBxrLYTnHAHXnBMeXhASCX41Z3d1X
 dZ9ENx7Bt7PZ7r/15Yt9A05U/xLA22AphLHcVX94gTPWa2GlMse/McnhX1JcqjUhCx
 KWFqB4AOGcOZoNkAbP3fQqSAzuvzxfaJRPTamCzl81JJGPb3Lp+BoOmq0MuedqJGoS
 6OA6X09Z8CSUnA8dbFI3oTCC9rKn0rWroQJ6M41wKYpvcbtwPpzcadPGVHzgmH3kfx
 hlYPGQnkJorcw==
Message-ID: <fb1bcab5-b006-40ef-8442-faede11e8649@kernel.org>
Date: Thu, 23 Jan 2025 10:00:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20250122211323.3835557-1-jaegeuk@kernel.org>
 <20250122211323.3835557-3-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20250122211323.3835557-3-jaegeuk@kernel.org>
X-Spam-Score: -8.2 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/23/25 05:10, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > 1. ioctl(fd1, F2FS_IOC_DONATE_RANGE, {0,3});
 > 2. ioctl(fd2, F2FS_IOC_DONATE_RANGE,
 {1,2}); > 3. ioctl(fd3, F2FS_IOC_DONATE_RANGE, {3,1}); > [...] 
 Content analysis details:   (-8.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tamWQ-0002u9-Hw
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: add a sysfs entry to request
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

On 1/23/25 05:10, Jaegeuk Kim via Linux-f2fs-devel wrote:
> 1. ioctl(fd1, F2FS_IOC_DONATE_RANGE, {0,3});
> 2. ioctl(fd2, F2FS_IOC_DONATE_RANGE, {1,2});
> 3. ioctl(fd3, F2FS_IOC_DONATE_RANGE, {3,1});
> 4. echo 1024 > /sys/fs/f2fs/blk/reclaim_caches_kb
> 
> will reclaim 4MB page cache ranges, registered by #1, #2, and #3.

4MB -> 1MB?

> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
