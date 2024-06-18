Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1DB90C0EC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Jun 2024 03:05:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sJNHv-0008SE-So;
	Tue, 18 Jun 2024 01:05:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sJNHu-0008S7-AM
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Jun 2024 01:05:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EgkRo4+7PWRywE13Kcht2ikhqshS2S5qOJzq7Ozi/HQ=; b=fReT9uw9hFkWgn3QmS+51eVjX3
 sbmgAD4sYcWeAWJ+/7m2oGD4/5yyZrJT5bg9I1lqeFCeTPaK6nQql1kN81JwVtwtQ13DO7DEDVdyy
 k8746dFdV/Szb1ogb3UbbNXiSBuW1Tb6vd8AargwxmCEUiqjYgLvj9j3rAoaTC5HWi3g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EgkRo4+7PWRywE13Kcht2ikhqshS2S5qOJzq7Ozi/HQ=; b=U00AVC+vp1HQDwIjseQjqgUuPG
 tPPunDDTAbgbueVCCoL+ckTp1IPoaw/u1WnPOHUqcN3teAoxoKVmDa7SusnBZxFKpGAXURfstOEAI
 sN6+qZVXxlRDRLfEq7m2QXHBoAx0UGvEfDxyhEw8spYQfBXzaUkIobIqVOYUmjxxRsCA=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sJNHt-0006BM-Nd for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Jun 2024 01:05:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4E3D6CE1686;
 Tue, 18 Jun 2024 01:05:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0654C2BD10;
 Tue, 18 Jun 2024 01:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718672716;
 bh=SAkpgrEbrLfBSD9HlN2+JeG8+6Qho66P/tm5pyVKlbg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Q+2rj0fG5LFyr0zi0IQWX3YKmUR545oouD7b3nnRp+VOK6HvTp9rlyg9LDu70bmcI
 gZufrn/4njTDoVnLIJNFTlsTRhP2QVgXUlIctzHMK5JaDlWNbMhGp7/YEXfa17s9Dd
 H7bK31MQG5uoUfcgnfy5XbrpKY1TCEHrDj8+GiZIhpK59rab/STKqWgjb6WsfvPrDj
 POO4Juq2w+dmZX3DOEo3hcTeBwdpPkuATJCGBGKUv1n0BR2UVt5aMJQupLVl3LC8pm
 PWoP8rHfPM9vjSn1eXWSAlQ9JwDgfHv+zZ6BwaYI5eS51xlj7DsgbywkIOdwxzMrmb
 chlvze7jXRQCQ==
Message-ID: <ab63f640-aa26-4c2f-9020-09953fd8d39d@kernel.org>
Date: Tue, 18 Jun 2024 09:05:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Xiuhong Wang <xiuhong.wang@unisoc.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <20240612071749.348843-1-xiuhong.wang@unisoc.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240612071749.348843-1-xiuhong.wang@unisoc.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/6/12 15:17, Xiuhong Wang wrote: > If input exceeds
 int range, data will be truncated, such as lseek: > unisoc:/data # ./f2fs_io
 lseek set 3221225000 file > returned offset=2147483647 > The off [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [145.40.73.55 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sJNHt-0006BM-Nd
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs-tools: use atoll replace atoi to
 avoid data truncate
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
Cc: ke.wang@unisoc.com, xiuhong.wang.cn@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/6/12 15:17, Xiuhong Wang wrote:
> If input exceeds int range, data will be truncated, such as lseek:
> unisoc:/data # ./f2fs_io lseek set 3221225000 file
> returned offset=2147483647
> The offset is truncated.
> 
> After patch:
> unisoc:/data # ./f2fs_io lseek set 3221225000 file
> returned offset=3221225000
> 
> Signed-off-by: Xiuhong Wang <xiuhong.wang@unisoc.com>
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
