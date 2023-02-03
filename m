Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8788968937C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Feb 2023 10:23:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pNsHn-0001bR-N1;
	Fri, 03 Feb 2023 09:23:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pNsHj-0001bK-Ux
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Feb 2023 09:23:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XSot76zFHz9O8EjdYf+IVgbw7v0D74GYLFogclO7880=; b=gss0RlMy9RoiNJzf6/exjlzoI4
 nMesy4cPqTvLX1fpyOtfOj03ZbUAhjzfCvwH0thjB+pNhKcxoS7kjv/X/PHj5OlH9AfAnsrTmiTMS
 0qf9QRo5xCYwrFJ3XSJrNdox1VFg/9oEK05l0UrpOiI1Y2O2oAJEdXRoWkJc560Cj4CA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XSot76zFHz9O8EjdYf+IVgbw7v0D74GYLFogclO7880=; b=LjAfWUCZpRpniAAflEjrthHu5H
 zTABpGNRWE3cmoXTLaBkx5QWUcDr3qiSp7dLSHdrtf7kzESehF7TYZxfqUDsWQWT9GH5/7dP+l3ch
 AlhKhBNO+PmdOIVKZRtsCKlfg8mRVgBZueiC7UAnfwUBlh6OeKq0rUwWUtgnmbVbsIPI=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pNsHi-009yx3-IZ for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Feb 2023 09:23:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4A111B829CB;
 Fri,  3 Feb 2023 09:23:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D58A5C433EF;
 Fri,  3 Feb 2023 09:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675416178;
 bh=ij0RAKgWyzJy36XWqq6ACHy+no3lvMbd/2UT4aL6kxc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qEH2+6BeJrP6PsBhU363wcLjwlYxIaa8mCEcEhA9sd5camWVvXnsKoK7kpsv76xBH
 JBG4DVtk2zY8JME6U4yXrWhyw3dEV4PTJUUbrvI0xcGrjLHJGsv1wBu/xmPujbZVlo
 Yoxc1y4SGhR/i0+L+25dPxTgLPoEsXQvym252wig10uTVE0/VIi37+/glnfZUeRR24
 v/PvQ2lDsGaRuwUD6NMJXUqposUnRhqtYGTZ8zZ+w5DVxl/8rwWpgW9caWvpak6gdP
 3PyxIyCtLXhZk/eQhmcLN3Wi6wQfDoDf+O/KuMUvsHylxwtUprVh7VquHoEMXoliu2
 HjmbD3s/OLV0w==
Message-ID: <5e70add2-2e1b-3612-1e75-ae366e8b7b7e@kernel.org>
Date: Fri, 3 Feb 2023 17:22:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20230202084815.70791-1-frank.li@vivo.com>
 <20230202084815.70791-2-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230202084815.70791-2-frank.li@vivo.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/2/2 16:48,
 Yangtao Li wrote: > IPU policy can be disabled, 
 let's add description for it and other policy. > > Signed-off-by: Yangtao
 Li <frank.li@vivo.com> Reviewed-by: Chao Yu <chao@kernel.org> 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pNsHi-009yx3-IZ
Subject: Re: [f2fs-dev] [PATCH v3 2/3] f2fs: add missing description for
 ipu_policy node
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

On 2023/2/2 16:48, Yangtao Li wrote:
> IPU policy can be disabled, let's add description for it and other policy.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
