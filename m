Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2FB9772B5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Sep 2024 22:30:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1soqSX-0003zh-JA;
	Thu, 12 Sep 2024 20:30:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bvanassche@acm.org>) id 1soqSV-0003zb-Rk
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 20:30:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JoPUxbKNemTOQj/Zcm/S7ujkVqb72FxciPCp7L8rpDU=; b=WnHtgVRTA4GyQ6jj8jnuv4QLDF
 mlYoNt7pv7SdNRtKpuQsylIOfQ3G0e9JASCVuwSTNmAENC+ClnwFMJ07PDK1gf2IM06EGON6eDJVn
 31mF1VVtgotg7xjuvZxwfXOjFaJYQCD81oQUgnEFxhcj9tR+aFuyVhu3gx5RcjLnHiAg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JoPUxbKNemTOQj/Zcm/S7ujkVqb72FxciPCp7L8rpDU=; b=gTT+zM3fxCJyqTmLDV+dApzjFj
 mut2GK57mtUTC9+ovdE6W/72Khw5qPRM3mh+mAOtSVA0coIwByao20UIADoW11JhakyIzdStRZo9m
 GjFcU1tfbAo+vG/cTc0CeiPjlxfFvln4ZUxTy63+EUrLF4bf0ZAv9VyvmLK4+oyVLGq8=;
Received: from 008.lax.mailroute.net ([199.89.1.11])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1soqSU-0003iD-Pk for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 20:30:32 +0000
Received: from localhost (localhost [127.0.0.1])
 by 008.lax.mailroute.net (Postfix) with ESMTP id 4X4Tb03tzXz6ClSpy;
 Thu, 12 Sep 2024 20:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
 content-transfer-encoding:content-type:content-type:in-reply-to
 :from:from:content-language:references:subject:subject
 :user-agent:mime-version:date:date:message-id:received:received;
 s=mr01; t=1726173015; x=1728765016; bh=JoPUxbKNemTOQj/Zcm/S7ujk
 Vqb72FxciPCp7L8rpDU=; b=hH6eRhNtR22x34qVLVhBhAs9zKC5jX5xUull0HKd
 cmgxk/UNnJpKcxNkOIS17H1Xfp7QcWx2voAJSOzuTvSJx0cgMJUC5tX1dK1gEy8z
 OO778DUdPMTBViGFqSys0NpdDVtclnF1VD2ZjcqJ/sC+92pEzv8dNzsIIFFLdykd
 +xsBSJnXpae75RDkwsn423y6Ahy4jNvODjnLhKsJElbcD9NhsXuH84irg2/gNejC
 siDnbqIQQn/WkqYdUhuq6eP+mdkDv0OeISTR+4Y5SC0wGgqhUMLgcun2Yzv9kmuy
 kzYxWZsFBAFm5IdevMHuC93m7imVwEcbPuTSBVuc/lFBvg==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id WSfMN2Lf5--p; Thu, 12 Sep 2024 20:30:15 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net
 [73.231.117.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: bvanassche@acm.org)
 by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4X4TZq34P1z6ClY9y;
 Thu, 12 Sep 2024 20:30:11 +0000 (UTC)
Message-ID: <fe2ae1b7-7c77-49e1-ace0-50e937f2c32c@acm.org>
Date: Thu, 12 Sep 2024 13:30:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kanchan Joshi <joshi.k@samsung.com>, Christoph Hellwig <hch@lst.de>
References: <20240910150200.6589-1-joshi.k@samsung.com>
 <CGME20240910151044epcas5p37f61bb85ccf8b3eb875e77c3fc260c51@epcas5p3.samsung.com>
 <20240910150200.6589-2-joshi.k@samsung.com> <20240912125347.GA28068@lst.de>
 <0baddb91-b292-db90-8110-37fa5a19af01@samsung.com>
Content-Language: en-US
In-Reply-To: <0baddb91-b292-db90-8110-37fa5a19af01@samsung.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/12/24 8:50 AM, Kanchan Joshi wrote: > Wherever hint is
 being used in generic way, u8 data type is being used. Has it been considered
 to introduce a new union and to use that as the type of 'hint' instead of
 'u8'? Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [199.89.1.11 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1soqSU-0003iD-Pk
Subject: Re: [f2fs-dev] [PATCH v5 1/5] fs, block: refactor enum rw_hint
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
From: Bart Van Assche via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Bart Van Assche <bvanassche@acm.org>
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, brauner@kernel.org,
 jack@suse.cz, sagi@grimberg.me, martin.petersen@oracle.com,
 gost.dev@samsung.com, jlayton@kernel.org, vishak.g@samsung.com,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 James.Bottomley@HansenPartnership.com, linux-fsdevel@vger.kernel.org,
 chuck.lever@oracle.com, javier.gonz@samsung.com, viro@zeniv.linux.org.uk,
 linux-scsi@vger.kernel.org, kbusch@kernel.org, jaegeuk@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 9/12/24 8:50 AM, Kanchan Joshi wrote:
> Wherever hint is being used in generic way, u8 data type is being used.

Has it been considered to introduce a new union and to use that as the
type of 'hint' instead of 'u8'?

Thanks,

Bart.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
