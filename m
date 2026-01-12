Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 745FAD117D0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jan 2026 10:27:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oT8q03PjPWwm5ltuWv2BOMyr0fAvJ7BOP4yJlXwv99Q=; b=a3E5cbf1myfWSOPIMokP4XrEUh
	Bjdw3M0r4C0Q21f7n3VpRdYS6wqbXIF6UMgK4uqZKTorwNvpDWSHlq3+7wgRKT7si8tjQABfNAHPD
	5RXTabO7nNoMoSk4wab6HVt8RuQGCi62vfrszScrziPcNmIy+i/5MOC+yQwY/oor+mjw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfEDG-0001TU-RA;
	Mon, 12 Jan 2026 09:27:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vfEDF-0001TN-Fe
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 09:27:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UGOu9f/nxLaBe4BNC3pKNGNG2pA/sf0FEwsiDGG943s=; b=XHbQlQXIiV5xxvv9Nk0/QTXGOG
 fEaWrqQFy0voObJ49egrLq54D1GAj9cV/Gf9JZ+runekKxT9VdBQIjGiPRmJGtCXepB/ufJWW2v/8
 XVAbpP+62kht0k2R2lBvIgWSE6HDMSsl/AYvMyJnQeRotGkbiHvwsl8z5j2m79/61Y7o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UGOu9f/nxLaBe4BNC3pKNGNG2pA/sf0FEwsiDGG943s=; b=Ks449sU4uCkX4u4pZgu3dWxcBz
 AzsDyEn1RF52ryf1WVxyvBbaR7ofGK4eUBbQjq1kzSz/J/HQPRbwuKxWIri4lRhQHk7t2nio9N1uv
 eL1obPup3PC5J7datoPN/89h2xy82VwsnonvS/IuZPhgWEpp4XMyYortS0No76eoyt4U=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfEDF-0000j8-33 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 09:27:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6CC8F60163;
 Mon, 12 Jan 2026 09:27:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26A37C116D0;
 Mon, 12 Jan 2026 09:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768210063;
 bh=ZpwUEX/LaxSWnglROgVTQChsWEfZ00otRALhpt3ZSiY=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Tjtss3SqlUaVPr4D0qE7HNTc1XJOBFp3SsECwGKvUWrk9EAmxnpXqZf9gbQBUUnPs
 EQLmQCL6wZYNmVlFmwnyxGduKVhC4pcLwWFlqMKGATT0A0lARhPV0NbtAaLj0Wvi/2
 OFnYNyf2fpjR5KsKT0xy3qx9J8/2wMGPd3ODsAXaWoHVzLCuMsz9HnJNIM6LM2Txf2
 KyBNPK+KIuQbNUKDpktv9snu+ugbNvBa/CEFatjCKLL5wILrb7uEPRU2XN1vPeyS1S
 I09XvHuPHyodyDYb05Bo9umCg4Wgk/vsDTrP4s36ny4AMtrj3d1TcBKgJ//DK6m85g
 gDne22T2iVkzw==
Message-ID: <63b53bbf-a904-41cd-8364-edaf5746ada7@kernel.org>
Date: Mon, 12 Jan 2026 17:27:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yangyang Zang <zangyangyang66@gmail.com>, jaegeuk@kernel.org
References: <20260112074635.3405176-1-zangyangyang1@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20260112074635.3405176-1-zangyangyang1@xiaomi.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/12/2026 3:46 PM, Yangyang Zang wrote: > Clean up code
 to improve readability, no logic changes. > > Signed-off-by: Yangyang Zang
 <zangyangyang1@xiaomi.com> Reviewed-by: Chao Yu <chao@kernel.org> 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vfEDF-0000j8-33
Subject: Re: [f2fs-dev] [PATCH] f2fs: clean up the type parameter in
 f2fs_sync_meta_pages()
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
Cc: Yangyang Zang <zangyangyang1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 1/12/2026 3:46 PM, Yangyang Zang wrote:
> Clean up code to improve readability, no logic changes.
> 
> Signed-off-by: Yangyang Zang <zangyangyang1@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
