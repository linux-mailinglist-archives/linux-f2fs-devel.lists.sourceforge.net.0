Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FDC60C397
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Oct 2022 08:03:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1onD2I-0006Th-BN;
	Tue, 25 Oct 2022 06:03:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1onD2G-0006Tb-Jm
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 06:03:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m1LGkeEK7mjUvokQIzF6oBFULB+DpKP+b6T6Z7dln+w=; b=SaU92OlOx9eKzvj0jNHXOU0QeV
 CCvOdV/d8VLhad/o2FDRQtEk7hb+8JRRA+awNdE6TbBOvq7uq+84bZ5uDA8omMsmmKGlo4Mg2cJNV
 D0gvBUdwuywqWxYJGO5BuP1hpEozNZuRV9RhnHsWRpyFCQBudJot9vQWaLEMTU1Dyokw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m1LGkeEK7mjUvokQIzF6oBFULB+DpKP+b6T6Z7dln+w=; b=A61920O6sFyOu+1QA39qnYRysY
 2Z5WUHeVwhZ+EDok6/myaOxj4tWiXH+DbxMUZMcEB1M9z5mJhMZSQkMM/qPRICxOJ+67ZKZjjhvoK
 KcyCqyj1ibsDSdfgWYTisa7xL2WqUyMISHGI1JnlMvOVLvjnSc0XPQmJCEkikFlWnCV4=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1onD2C-00GWwI-8J for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 06:03:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8D2A8B81A49;
 Tue, 25 Oct 2022 06:03:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D688C433C1;
 Tue, 25 Oct 2022 06:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666677798;
 bh=VjooGWrvIG8ReDXfvIhQuOnTWhKI2n0HmhUzZot1ahw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TPktgCjJIjwm9FO3O58SW7xbMojD8GVaT9P4buRRw6wBODSV7lz/1qk2T20svq4ba
 dMPmXnogy8w8kaCfwT5D3947reVtUT3G/Iz+qz18Eke/n9OXzZzkP6++uy6kvE9/5o
 Day31pNOXxFiMgDKSA6fmkFqtS3nbJAoI/mCANDXcxQ1fx30sUanX59MWMKPXqroGP
 /7BnW8SmdJmh+97U/edvN5mks0EBUDithXrXe8bP4oZL4obZBbmG889rMoIh1Iqa6H
 7eJbFiKXSLYx1UEQEDDpPqZzbQY7TdmERgL80QK58KiwFFnvHSZepONcgNWiSJIvvC
 XEbT8qzqG3C7Q==
Message-ID: <eaae3f50-1859-ae9c-addd-51731ccf076a@kernel.org>
Date: Tue, 25 Oct 2022 14:03:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20221025030831.53888-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221025030831.53888-1-frank.li@vivo.com>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/25 11:08,
 Yangtao Li wrote: > commit 377224c47118("f2fs:
 don't split checkpoint in fstrim") obsolete > batch mode and related sysfs
 entry. > > Since this testing sysfs node has been depreca [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1onD2C-00GWwI-8J
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: remove batched_trim_sections node
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

On 2022/10/25 11:08, Yangtao Li wrote:
> commit 377224c47118("f2fs: don't split checkpoint in fstrim") obsolete
> batch mode and related sysfs entry.
> 
> Since this testing sysfs node has been deprecated for a long time, let's
> remove it.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
