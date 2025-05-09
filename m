Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19903AB0A7C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 May 2025 08:19:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XAEiC7yg0od6nVf529LqJzfGjMYGk3Sc6z5Mgs/Pv0g=; b=PHZi4FfwRUjUDM3GiWUCIpO0BR
	SLHmK5HoqOdYSJ+NVz7hzYViwgNUiP/I4O7pKw5zPZ2/VZm50WjtwpGZnxjvdZ1j6hJZV7V3NxUp5
	crd/cYPplBgCsPzDx0ZK32nWEI5rQrCBkoF261e/S0NCRi1SI8bFXGiGnxPR94kyXoJ8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uDH4o-0002Tc-Lf;
	Fri, 09 May 2025 06:19:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uDH4F-0002Sp-17
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 May 2025 06:18:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=leYF/6OllHEfVq2PjKrIvniX5cHk634HJEi8CAGV2mc=; b=kS3h2q2Cw4LKGCmFir1hR16/tM
 pHxLK1n6ReMQZlJ3VwQFjlL7KCKswTJ9MBqNuLFSpg3XoV8DQKimJvekZgj4hEU/O3oFi5SGc09go
 YDZhCw59IA/Jy0s7Rqan7rl37w1ywzhXcR7a3Ruj9m+Xf6/rAW1k/hHTXd8klwYUuWIM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=leYF/6OllHEfVq2PjKrIvniX5cHk634HJEi8CAGV2mc=; b=J1vAbyoCS3qHhHy6gQ1FAmDu4P
 9MDDTB1xhtmLKUNrxpYmL+C4eGjMOTjmIKZQ7jR5r7L1x2ahzHfQlNb1i4N6tbLqP6toMtFEzsIsl
 FxRZvEA3L61IVHIL3np/cCx9wKtsJXWz6XPM+7cQUbbxN/ot43Fkpn9/hvJHiCglvCmU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uDH4E-0007sL-Cz for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 May 2025 06:18:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B2F7960008;
 Fri,  9 May 2025 06:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93B6BC4CEE4;
 Fri,  9 May 2025 06:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746771516;
 bh=KmqICjcfsXcrZvh2/cY+7rCL2gKxbYcoMsbxZ/eMCTk=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=k5ntXOf+dA7Fs5gnT/Sk1v4aCG1pQU8PXcXiSE1PwT1dJ2u/+41AeeSwu1RDGWmgr
 +chdEnEO+EVG1T9tNrn4xYCf8T1sjQEkztjjnCUNcwVIGv6J3IGrqmnrkPMB56RzrB
 E321RaM1fkYFgsQ6jKwJB2DVRG3mO8mtoBaMoWFsTNIM2HeLe56zm+Vpk17JCc+ovI
 57FADuQMk2j2jBioaECeBnxQPJkt/YTWjqHXqycaSUia5R+PWkA4shDSfibmOnxAbl
 5TqqsEeNfUpUdp38ZP8APDWnqXhmeWH8zG8zrH+fNc9C7wZ+Ck2UxMlxIFg2+upc1P
 oxtdpYYq7ViLA==
Message-ID: <7eeb6cfb-3c64-49c5-8afa-a3a7cf272878@kernel.org>
Date: Fri, 9 May 2025 14:18:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jianan Huang <huangjianan@xiaomi.com>, jaegeuk@kernel.org
References: <20250508124235.58858-1-huangjianan@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20250508124235.58858-1-huangjianan@xiaomi.com>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/8/25 20:42, Jianan Huang wrote: > Otherwise we will get
 the following error when executing make uninstall: > > make uninstall-hook
 > make[2]: Entering directory '/home/huangjianan/code/f2fs-tools [...] 
 Content analysis details:   (-1.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uDH4E-0007sL-Cz
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs-tools: delete only if the
 libf2fs_format.so* exists
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
Cc: wanghui33@xiaomi.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/8/25 20:42, Jianan Huang wrote:
> Otherwise we will get the following error when executing make uninstall:
> 
> make  uninstall-hook
> make[2]: Entering directory '/home/huangjianan/code/f2fs-tools/mkfs'
> rm /usr/local/lib/libf2fs_format.so*
> rm: cannot remove '/usr/local/lib/libf2fs_format.so*': No such file or directory
> make[2]: *** [Makefile:827: uninstall-hook] Error 1
> make[2]: Leaving directory '/home/huangjianan/code/f2fs-tools/mkfs'
> make[1]: *** [Makefile:790: uninstall-am] Error 2
> make[1]: Leaving directory '/home/huangjianan/code/f2fs-tools/mkfs'
> make: *** [Makefile:418: uninstall-recursive] Error 1
> 
> Fixes: b067004c92dc ("add configure option --with-root-libdir")
> Signed-off-by: Jianan Huang <huangjianan@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
