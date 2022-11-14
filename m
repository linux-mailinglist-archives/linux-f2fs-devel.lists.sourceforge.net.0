Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB7562763F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Nov 2022 08:10:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ouTc8-0004nf-DR;
	Mon, 14 Nov 2022 07:10:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ouTc6-0004nZ-UO
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Nov 2022 07:10:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=skpkX2wuc7NsUueIM08O6wZblwPB96ahG+nJK6JkDZg=; b=K3NrVtDly8uz+dsbwng8rzCgkx
 FuwRSbgl9prVfJxu9rjXHxvpRa7TO0guYHozdJT2LIpuiSp0gMT7+12Iaf14C0aMExsE9eh7YqODc
 RJmjmqAZIT0tFrfAKv18fqbDTAudFtyquh3tBxK367XNldKXDuf0F7300MKNriKjeFNA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=skpkX2wuc7NsUueIM08O6wZblwPB96ahG+nJK6JkDZg=; b=GIBzQCcqrw3+AdRWD9AKTTtdte
 m70X3h4ISFyBxrKiM/pHLQlb2if0d352dyeVRphRq+rJz1hI45xRpWULp8dnIUdWlUJQ36EVf3EAH
 zv/ck0fDyZkC4/ufrpNs4X/FU3IbIijEqosFw3q81ETX1qRFtbkQqpVnNFNzIV9phO2U=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ouTc6-007dr8-8h for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Nov 2022 07:10:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 7D83ACE0E05;
 Mon, 14 Nov 2022 07:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE35CC433D6;
 Mon, 14 Nov 2022 07:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668409829;
 bh=THbfAA5A+RIH+2hly068ujqfrEwz0W5FzJAfINAhYi0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=tSIiQHvAn6eRckXL30h9fO0W3L3I1SiT4opCxjUoEbZS8GC1uNMhdoaLTz8kvLtK0
 vnP17zdhiY+Vl9NFO/48isUpB8ruOqrPJwXCHyN3NDRN8StPT08Bw/cWKwBHHZIUDx
 bZNE7qVgsVJdis4LqWC/ZgTzygzPMb9dFUHDjbxK7F1AdAQId08KPjRGa/kXZ5Vzgv
 gZ5Jg8icljaoQyipC20RyrI0AsCvV7Ywd4wzqbGLLgOtCJ6bdemLxc0VrZ3LcDx2fC
 WAkQwwnBrV5XFNYDks4dgbiNEogplDB6VTymcAFyi/0KKTKrFFyc0rH6aFD/7H+jtb
 7tYY6k2a1ra2w==
Message-ID: <a002bbd4-7946-2bc6-b101-182acac0e4b5@kernel.org>
Date: Mon, 14 Nov 2022 15:10:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Sheng Yong <shengyong@oppo.com>, jaegeuk@kernel.org
References: <20221110140723.92752-1-shengyong@oppo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221110140723.92752-1-shengyong@oppo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/11/10 22:07,
 Sheng Yong wrote: > Option "-g" for dump.f2fs
 is unavailable and not used in dump.f2fs. > > Signed-off-by: Sheng Yong
 <shengyong@oppo.com>
 Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ouTc6-007dr8-8h
Subject: Re: [f2fs-dev] [PATCH 1/4] dump.f2fs: remove unavailable optiont -g
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

On 2022/11/10 22:07, Sheng Yong wrote:
> Option "-g" for dump.f2fs is unavailable and not used in dump.f2fs.
> 
> Signed-off-by: Sheng Yong <shengyong@oppo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
