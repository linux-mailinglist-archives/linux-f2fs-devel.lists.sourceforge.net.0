Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19784CFBC01
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 07 Jan 2026 03:36:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VTxI1MUtoKZoEmbMU+D4CvoawJ6st6M9Pbhzi7RE8fQ=; b=NJulfTe3AGVUXjvEgekkGZGLmN
	2fgj3YPDuP/9QflVKc5tim8+al2D9cen3vJItzfKUomdMY3UPJssrUfcsjqd9pvwBUCVs8snAJ8bf
	ndqsfenAYVS2LEUtRJcCEGrqQFVGAh/XDAAr2rBS6TUoKxz90knnwczFCcPK/jaPw674=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdJPO-0001FM-SG;
	Wed, 07 Jan 2026 02:36:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vdJPN-0001FD-U8
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 02:36:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fEyprghc9r2WJMCA5SeYHwuJ/8ATNjHN/pOzwfwTCoI=; b=RsYpWHuDIvNCblr8wIs4FuhEsP
 G5E8FARhDGoKEGgRvKXw8rc+9kbxRcbRSu3wTWLD5sia1SK/QMn8ldH9zISxRzcAC+5hi+41t6jNG
 bVYrf2QlvtbqZYyofm+ZD1IkZxLXN10UoRAzwqPp9sy4XOWcKuxqkrGTtZoCtclr7urM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fEyprghc9r2WJMCA5SeYHwuJ/8ATNjHN/pOzwfwTCoI=; b=aEbTlJtvx+4Sq1tsnybIgd+3oO
 kcB8gZCSQsOEVIBO1E9Bz8R0EMXCtUXhevaGaZ5UDdcyJrAIAovryQdWeiGkBD3ssjdCezDI7hhQ7
 zXB7o821yB4QmNEqBJnyoBwEGqdqUJVxRaT6J1ZxWwSjuARGWztaaybw8V4vRHcfWd6k=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdJPN-0002eL-Fl for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 02:36:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C7F7860143;
 Wed,  7 Jan 2026 02:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F28B2C116C6;
 Wed,  7 Jan 2026 02:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767753374;
 bh=AZnSsj9H2JLWwQ901T1qASG4FAF4BPCsX8+VngnBvto=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=HZpnHy6JjIbYYv+0pvTH2sRmso18sKCE7TLFyBqu0EQT/bkgSy88ylgsXwEXr7eL0
 WCmr6pz1ndWpuPn2SdDPVQzZFuxXQsO5Q5ZK5qjtwsb9SompBzjJ/6kn0ThIRBmMp3
 BDnU68iTVPs0Y05OlZvvxc5DMSPiwh100sDICJPdREHQqdlSfFVpES+Y1cd3Phw+Ds
 oWDizBOHltlw7X9b5AXfyiJinOITsdfpARAw/n19Ip5GyUtA3FcZu7QYTjPdgbPAmQ
 GNbq3nu/szgrxjTDo5KNSSJSSWSU9pgpn8y1Y000GHLyKTLaK75bLfLWAbecMXwplg
 TffzX86MlF25g==
Message-ID: <e60443f0-7085-4296-afca-8e3be6b58d6d@kernel.org>
Date: Wed, 7 Jan 2026 10:36:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <monty_pavel@sina.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260107023346.2507670-2-monty_pavel@sina.com>
Content-Language: en-US
In-Reply-To: <20260107023346.2507670-2-monty_pavel@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/7/2026 10:33 AM, Yongpeng Yang wrote: > From: Yongpeng
 Yang <yangyongpeng@xiaomi.com> > > Some f2fs sysfs attributes suffer from
 out-of-bounds memory access and > incorrect handling of integer va [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vdJPN-0002eL-Fl
Subject: Re: [f2fs-dev] [PATCH v3 1/2] f2fs: fix out-of-bounds access in
 sysfs attribute read/write
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
Cc: Jinbao Liu <jinbaoliu365@gmail.com>,
 Yongpeng Yang <yangyongpeng@xiaomi.com>, Jinbao Liu <liujinbao1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net, stable@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 1/7/2026 10:33 AM, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> Some f2fs sysfs attributes suffer from out-of-bounds memory access and
> incorrect handling of integer values whose size is not 4 bytes.
> 
> For example:
> vm:~# echo 65537 > /sys/fs/f2fs/vde/carve_out
> vm:~# cat /sys/fs/f2fs/vde/carve_out
> 65537
> vm:~# echo 4294967297 > /sys/fs/f2fs/vde/atgc_age_threshold
> vm:~# cat /sys/fs/f2fs/vde/atgc_age_threshold
> 1
> 
> carve_out maps to {struct f2fs_sb_info}->carve_out, which is a 8-bit
> integer. However, the sysfs interface allows setting it to a value
> larger than 255, resulting in an out-of-range update.
> 
> atgc_age_threshold maps to {struct atgc_management}->age_threshold,
> which is a 64-bit integer, but its sysfs interface cannot correctly set
> values larger than UINT_MAX.
> 
> The root causes are:
> 1. __sbi_store() treats all default values as unsigned int, which
> prevents updating integers larger than 4 bytes and causes out-of-bounds
> writes for integers smaller than 4 bytes.
> 
> 2. f2fs_sbi_show() also assumes all default values are unsigned int,
> leading to out-of-bounds reads and incorrect access to integers larger
> than 4 bytes.
> 
> This patch introduces {struct f2fs_attr}->size to record the actual size
> of the integer associated with each sysfs attribute. With this
> information, sysfs read and write operations can correctly access and
> update values according to their real data size, avoiding memory
> corruption and truncation.
> 
> Fixes: b59d0bae6ca3 ("f2fs: add sysfs support for controlling the gc_thread")
> Cc: stable@kernel.org
> Signed-off-by: Jinbao Liu <liujinbao1@xiaomi.com>
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
