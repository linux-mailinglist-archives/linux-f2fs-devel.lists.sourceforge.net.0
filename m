Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A751D926E26
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Jul 2024 05:43:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sPDNU-0007Bz-SV;
	Thu, 04 Jul 2024 03:43:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sPDNU-0007Bs-3P
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 03:43:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0THql/l4CncTuNTksxwS/85mvuiDwomcFaXM4jYvdG4=; b=mpfuizSFs5TuDHqIKD6fONAjqh
 zBaHZW4ejjcKlekK7fVCCaLYYaFqIpMB3JR7qd5ajISJcN3MR+fE2nbVZC3WxQ5G9dXP2z9TC5GWm
 bc1Ms8XInUvgKw8D2pmHmRSr0tAkZBexJ0CUq7b1qSF5K1bE6DhLD6eaQ28Wt5zwqwn0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0THql/l4CncTuNTksxwS/85mvuiDwomcFaXM4jYvdG4=; b=e+v8kiItpFFyXhKu99BUIRLwQ3
 Mb9Rl8zMm+Me7+i/HDDPaGBzQuA8+Q5qMYRJNnvi7kY551vhejV/Bock+2iOHGK05fbod5T/TqRzL
 FXGSNWvDWXNFe94ufUZ9ASTWTgcuxSN7VzQTB9z13q30oPYaFMn7F+g9JKn0F5Y1ZWa4=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sPDNU-0004WQ-G4 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 03:43:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EC5D8CE1B7E;
 Thu,  4 Jul 2024 03:43:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 687CAC32786;
 Thu,  4 Jul 2024 03:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720064591;
 bh=p22ydk8xEP+zbIw00f5LoBC5VJBuZ66C3ouhTHr/0pY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=sy3xC4kjebZov9UrR4/NtVEsWv/03D4dWPY8XMvx/HqTRS/E0qfvrOzfNkRJ6wRnj
 ivheD/41nLLz3k10peQjidByl6peAYt9Rw83OyTvwAR/IKD16UyBQudcskLzNppfZR
 7TRIJB59ODXjCLyylp19ChGwc1b1AMwIqdBFQqEIXiXlWXsKJ1iNVpC/6bznOlktSt
 1+QzN5k5Ze66ISHQbofAgY8nG9l35uxBMr3XVPI93fmm5cerxaE9qFavFWMzMOjMJ/
 BGvCMERveLrMFttv5Ys78q9IUEUtDBfUBsMchowmScLYg1CRDDGTEAKfT5gxkpPlIZ
 2OkcDFUwUDmyw==
Message-ID: <6752a846-eb7d-46ad-82b4-60b6d35119e7@kernel.org>
Date: Thu, 4 Jul 2024 11:43:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sheng Yong <shengyong@oppo.com>, jaegeuk@kernel.org
References: <20240704025740.527171-1-shengyong@oppo.com>
 <20240704025740.527171-10-shengyong@oppo.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240704025740.527171-10-shengyong@oppo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/7/4 10:57, Sheng Yong wrote: > This patch enables
 injecting dentry block or dir entry. > print_raw_dentry_info() is added to
 show values of node footer. > > The meanings of options are: > * de [...]
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sPDNU-0004WQ-G4
Subject: Re: [f2fs-dev] [RCF PATCH v3 09/10] inject.f2fs: add dentry
 injection
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/7/4 10:57, Sheng Yong wrote:
> This patch enables injecting dentry block or dir entry.
> print_raw_dentry_info() is added to show values of node footer.
> 
> The meanings of options are:
>   * dent: means dentry is injected.
> 
> The members could be injected in cp contains:
>   * d_bitmap: dentry block d_bitmap of nid
>   * d_hash: dentry hash
>   * d_ino: dentry ino
>   * d_ftype: dentry ftype
> 
> Signed-off-by: Sheng Yong <shengyong@oppo.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
