Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 81653605A21
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Oct 2022 10:45:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1olRBQ-00083y-G3;
	Thu, 20 Oct 2022 08:45:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1olRBM-000824-Gj
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Oct 2022 08:45:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ko2h+HtUGR3uILaBOHtq/e7cl3YHcs/NJW+FiXzvEqY=; b=IzPtHktArwIL4NGT3Ttdj/N8A6
 NbAIO+R0Vxdjmmqd5ioACAlQsbjZvYMd3QtIijcryfQj7mvNs+yu5vrZ2GzNrkyIdkXhJEh/U9LjL
 mXAYk3Ca0+XkSGzeon5CPXJDkR1qs6QOOsPCeGav2XBpwYCamQLK03APnR9vudwAhmCk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ko2h+HtUGR3uILaBOHtq/e7cl3YHcs/NJW+FiXzvEqY=; b=fZjyaU+e6WYearJcPx1oShhH6e
 4G+ybkTp3h2suqE7mVGag92VRsd3s/hP69CjVQpBhTa8c9a+5Wl+6RTQU1CdPbyoVRcuyyfHi4ljz
 WggEL2AGfzNXQna+dKZnR8jy/cKI/vsJzCq1PgYILEnOgqk86EuCc1pPkI+ckBL812ps=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1olRBK-00AhCI-Vr for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Oct 2022 08:45:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D308B61A01;
 Thu, 20 Oct 2022 08:45:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A696C433D6;
 Thu, 20 Oct 2022 08:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666255527;
 bh=7B6Ip+pWwkp0r4cBY9f9rdiQtky4J80XMuZ2MSIBwCg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HG2IeADT9QNowepaVteJWKx0NWA1GdMpyf0/7kthRFFTcj1K3TlAi2AqV5FuA0VfJ
 cJjvNyWaVEfP5G8II1W5oCAcgcxWRg0KhuG9UhTnApnjt8dAOesqc6pADFRlpfO7iN
 BsErpCZKPQpObXgc2csywxzecoMZs2ME0OGYbj914oWV9qoXIRwuaBmH3Bn5e/6aLF
 Ox2RVxm+uVO/TKB6kY02Z5Bv6PeiSdtdK7o87dAT3mwvsYvZGn5+cuUAU2FHnrwcOa
 UqiZoCoYDYlMrQqe7KvlCS2pHkAmeitSt/ckhLdxqawAXuMnM1/8w4n/peeuJpSkxt
 L7FwOYUX8G1nA==
Message-ID: <7908686b-9a7c-b754-d312-d689fc28366e@kernel.org>
Date: Thu, 20 Oct 2022 16:45:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Yang Yingliang <yangyingliang@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <20221018073240.666374-1-yangyingliang@huawei.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221018073240.666374-1-yangyingliang@huawei.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/18 15:32, Yang Yingliang wrote: > Inject fault
 while probing module, kset_register() may fail, > if it fails, but the refcount
 of kobject is not decreased to > 0, the name allocated in kobj [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1olRBK-00AhCI-Vr
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix possible memory leak in
 f2fs_init_sysfs()
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
Cc: jaegeuk@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/10/18 15:32, Yang Yingliang wrote:
> Inject fault while probing module, kset_register() may fail,
> if it fails, but the refcount of kobject is not decreased to
> 0, the name allocated in kobject_set_name() is leaked. Fix
> this by calling kset_put(), so that name can be freed in
> callback function kobject_cleanup().
> 
> unreferenced object 0xffff888101b7cc80 (size 8):
>    comm "modprobe", pid 252, jiffies 4294691378 (age 31.760s)
>    hex dump (first 8 bytes):
>      66 32 66 73 00 88 ff ff                          f2fs....
>    backtrace:
>      [<000000001db5b408>] __kmalloc_node_track_caller+0x44/0x1b0
>      [<000000002783a073>] kstrdup+0x3a/0x70
>      [<00000000ead2b281>] kstrdup_const+0x63/0x80
>      [<000000003e5cf8f7>] kvasprintf_const+0x149/0x180
>      [<00000000c4d949ff>] kobject_set_name_vargs+0x56/0x150
>      [<0000000044611660>] kobject_set_name+0xab/0xe0
> 
> Fixes: bf9e697ecd42 ("f2fs: expose features to sysfs entry")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
