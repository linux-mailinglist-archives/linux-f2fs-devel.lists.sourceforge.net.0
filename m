Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B36859AA9D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Aug 2022 04:04:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oPDqd-0002DR-EE;
	Sat, 20 Aug 2022 02:04:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oPDqb-0002DK-Ha
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 Aug 2022 02:04:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0yfsLXJXz6PxbtiGASYC7xhGFqy90RvJ/I0gCy6EDmI=; b=aPoMhBEPbKBgcNINwuxBbQMZ/F
 BQmXDcyLWv9LTAQn0srBCL0Y6cU5aPGoX8neuMl+Z+sJ7Q7432fLPmw4PSKebrQRq9eV4S+7x/zNa
 OmbEUx3xwQSXsO/XEtJ0g+IjtjRa6yM5Z6LTZppxUXA/WXurakMottweo9uKLQ+OkFCg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0yfsLXJXz6PxbtiGASYC7xhGFqy90RvJ/I0gCy6EDmI=; b=Dfcu0yMKUepfXo2WjvAS84uv0+
 9aJbuQ1tAo7Xrbvedqse2MqgSBkLJUaLyPnfovxOQrhO0fnt6OczfxucUiEMp4UzL8M4iCOrmFu+h
 LTkITILZMGzmf59Ir7iUlXx4IUFf4bBboPHs8UI8ITOI1hlc769hE/pChmB5ws6V7LNs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oPDqY-0000ud-Nt for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 Aug 2022 02:04:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5AD75616C6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 20 Aug 2022 02:04:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E1E3C433D7;
 Sat, 20 Aug 2022 02:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660961052;
 bh=D0HcQScd0vMplt3OigJziwoB5lCq0pCl/B9CGVf7vbI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IoKCcAbocxDKOX4fUjcb4CeA+iYDhCJliGn1eVw1CdCSH2viwvePE43D59SEIsANd
 uAfbECPGxHuWLdJQ5MaGx686eylCVP94I/fDVB8Y3ZTmmJWQv6z0d1u9RPu2F9rWFb
 7cDdPo1QUHHE+5IF1PvB/PI2IhRX6YQBNI/fnoByMwmZBCifiJkUiPRGPxyisDX5l/
 MFwpVzkUXOQTeiQLCaDU2bxKMBJ2ZM4M1bvUplQSkMjfL0Coh4FXEdWAfOBKvoBIux
 FNUoeMV3VNSvSjYXkLUhMLhLIKUutTDL7L6Ud3ey7c5+RDK03aLecAvBGxC3tBFGyp
 Fg7CA+I8/8lrA==
Message-ID: <62a8b7df-9970-c3cd-0050-92321f1348ea@kernel.org>
Date: Sat, 20 Aug 2022 10:04:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20220813143709.11909-1-jaegeuk@kernel.org>
 <YwAeGIszLrcNqNbE@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YwAeGIszLrcNqNbE@google.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/8/20 7:34, Jaegeuk Kim wrote: > We should decrease
 the frozen counter. > > Cc: stable@kernel.org > Fixes: 325163e9892b ("f2fs:
 add gc_urgent_high_remaining sysfs node") > Signed-off-by: Jaegeu [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oPDqY-0000ud-Nt
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix wrong continue condition in GC
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
Cc: stable@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/8/20 7:34, Jaegeuk Kim wrote:
> We should decrease the frozen counter.
> 
> Cc: stable@kernel.org
> Fixes: 325163e9892b ("f2fs: add gc_urgent_high_remaining sysfs node")
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
