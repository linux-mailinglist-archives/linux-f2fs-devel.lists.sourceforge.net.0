Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAEC951819
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Aug 2024 11:58:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1seAlo-0003es-9z;
	Wed, 14 Aug 2024 09:58:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1seAlk-0003eY-UB
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Aug 2024 09:58:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=61q2QTbshBzVYQ5FLMGKc7s0S3Ycxdb2QMzwlJ2Up/8=; b=iCkaznCx1mKpxO9Im0+XfRLGwO
 X1wZxM75o+jYLdZxKNKqUFjINrmhmXD8dOxgkWWgRfM+K5E79qZo2FuAx5Xl41O7pdKO7gulOnWAe
 ZxAUNb3xhtus18SFZ2v4qDgDizK3QGjKWvAHuzP4AUN0VZs6bfXQp/VVB/qegtfNOe68=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=61q2QTbshBzVYQ5FLMGKc7s0S3Ycxdb2QMzwlJ2Up/8=; b=ZIjGGUOSn8atB5GwS4hUvL6qwZ
 yB0N+cWCDBo94N29jn1sgsjXtkfPKe64nXVWlD6jHBaDqlDU13zxv2I+i54wk4rEyOYdriiWjQAuZ
 zAUsT+rCP4syuAhUVjHAqGxHtcssDFB66O3ksM+R6qOrhzzn7V4/9zr+HHaPP3nh8oE8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1seAlk-00041b-AW for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Aug 2024 09:58:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ED216615C4;
 Wed, 14 Aug 2024 09:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79DDCC32786;
 Wed, 14 Aug 2024 09:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723629485;
 bh=c1DRi6NyZ8YeV/Jy6vvGJBLjP3EAf16yRRK8oKda6ws=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MtUf2FdeFRqOGdcCUM5bgD1AXWndhJkKX8W9H8BhmeLL+hueXS8i2+E3mrqHJUU7w
 ho6ZgYru45RAZ+AtOlDy4Ooli8jN3XXPzoxKhXSPYpBYjD7Qfufhfq/9vgWYVQDotR
 /WEWnN5r2F3rCZ6NDbRhf+QD9o5r4vjAbXs/YvpLD0WCuTkN2f8nhP2mGd+YmvVLiV
 qQjIYVNvqDhV4TeRFEcbDuecL+mmyxU8ntq8DXbZ2NxF5ckZIVOl5GzJGQ05FU00D1
 ldWLI7Np8dRpYYtrXNlN53StzC1X/pHnIULZL8JvVy6Sesc1cHLHxI7k11TCNIDEh4
 dDcRo1LrmLMwQ==
Message-ID: <99199c2a-1dbf-439c-ad24-68ed8844e096@kernel.org>
Date: Wed, 14 Aug 2024 17:58:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <0afb817e75a84859e1a86e1a7ba2041a9b852b6e.1723117820.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <0afb817e75a84859e1a86e1a7ba2041a9b852b6e.1723117820.git.christophe.jaillet@wanadoo.fr>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/8/8 19:50,
 Christophe JAILLET wrote: > This file already
 uses sysfs_emit(). So be consistent and also use > sysfs_emit_at(). > > This
 slightly simplifies the code and makes it more readable. > [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1seAlk-00041b-AW
Subject: Re: [f2fs-dev] [PATCH] f2fs: Use sysfs_emit_at() to simplify code
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/8/8 19:50, Christophe JAILLET wrote:
> This file already uses sysfs_emit(). So be consistent and also use
> sysfs_emit_at().
> 
> This slightly simplifies the code and makes it more readable.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
