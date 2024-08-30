Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DBD966165
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Aug 2024 14:17:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sk0ZN-0005xL-HS;
	Fri, 30 Aug 2024 12:17:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bvanassche@acm.org>) id 1sk0ZM-0005xC-42
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Aug 2024 12:17:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6GlW9yIoadQq46MmyoepJYJ8q9LfdZqy08l1271Zu+4=; b=Ht4Ey/IOQKr2CXdt2wrCQWvGVd
 poidHmv1olMBmpnmeBXoBLUKWbpTbDbrkIh2rdvghuoKXOXzeYlGDQY/1qfJezmtGDiCv5638f0Gs
 ZCZ9F9hJDE8UUqsuyOe6XBFc3rrt9Ye6r/+DFBtkEfTgUQ+u3rEnzH1xYp9ZnqEzU3bc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6GlW9yIoadQq46MmyoepJYJ8q9LfdZqy08l1271Zu+4=; b=lusX0Wsiwx/Ud3hcI5d4UCkN6E
 UEl/cwog/jDZckmI+PIXGevT9A3xnxTC8kGXPgFcyyl5X4Sk+UuvBOUdiXsBtEQWtLBe95t2rI5vG
 uZoFsH45FXBQPs2faWfDTeFNLvR6gNy1elSzjqJQzdqGfOev1bNtzT8FH4f8dujnB9Sc=;
Received: from 009.lax.mailroute.net ([199.89.1.12])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sk0ZL-0008Fz-Cb for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Aug 2024 12:17:35 +0000
Received: from localhost (localhost [127.0.0.1])
 by 009.lax.mailroute.net (Postfix) with ESMTP id 4WwHGL1TxYzlgMVf;
 Fri, 30 Aug 2024 12:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
 content-transfer-encoding:content-type:content-type:in-reply-to
 :from:from:content-language:references:subject:subject
 :user-agent:mime-version:date:date:message-id:received:received;
 s=mr01; t=1725020245; x=1727612246; bh=6GlW9yIoadQq46MmyoepJYJ8
 q9LfdZqy08l1271Zu+4=; b=HDLC/X2jGKS6GEr8dCi4sdxXG4856TtMCXnGwrLk
 hPO1wOwiL6OJ5gZBVzRO5iAqQ8W4nld9tlezsQD3axIrvx2xAuAlifeCxIYW04lY
 XJNOmPI/qZS6iG5xzXM5UkRSAOla/trI5M9M5DbVuebf06mqh1FL8K07ZJa9Qw5T
 25j8wENOw8vzEmOhvCWIjuUYTIRNi/H/oSN2GNzUKuHhDihlqmBEh5SR5LjdlqFj
 HulYBaWrWGYBKs21TSU7+5oPrTh/qcnkDchEoNA+3/RuPO3N9ZZqHetbg0nhVbSr
 zJTXX/O48XQSFBtvs76WvzyIGyvQL1f6moM7RRiKzuyaAw==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id CK5wHqhS3E6t; Fri, 30 Aug 2024 12:17:25 +0000 (UTC)
Received: from [10.254.113.103] (unknown [207.164.135.99])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: bvanassche@acm.org)
 by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4WwHG807ZyzlgMVb;
 Fri, 30 Aug 2024 12:17:19 +0000 (UTC)
Message-ID: <0cfd7841-ea11-48c6-93fb-7817236c81c8@acm.org>
Date: Fri, 30 Aug 2024 08:17:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kanchan Joshi <joshi.k@samsung.com>, axboe@kernel.dk, kbusch@kernel.org,
 hch@lst.de, sagi@grimberg.me, martin.petersen@oracle.com,
 James.Bottomley@HansenPartnership.com, brauner@kernel.org, jack@suse.cz,
 jaegeuk@kernel.org, jlayton@kernel.org, chuck.lever@oracle.com
References: <20240826170606.255718-1-joshi.k@samsung.com>
 <CGME20240826171413epcas5p3f62c2cc57b50d6df8fa66af5fe5996c5@epcas5p3.samsung.com>
 <20240826170606.255718-2-joshi.k@samsung.com>
Content-Language: en-US
In-Reply-To: <20240826170606.255718-2-joshi.k@samsung.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/26/24 1:06 PM, Kanchan Joshi wrote: > /* Block storage
 write lifetime hint values. */ > -enum rw_hint { > +enum rw_life_hint { The
 name "rw_life_hint" seems confusing to me. I think that the name
 "rw_lifetime_hint" would be a better name. 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [199.89.1.12 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: acm.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [199.89.1.12 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [199.89.1.12 listed in bl.score.senderscore.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sk0ZL-0008Fz-Cb
Subject: Re: [f2fs-dev] [PATCH v4 1/5] fs, block: refactor enum rw_hint
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
Cc: vishak.g@samsung.com, linux-scsi@vger.kernel.org, gost.dev@samsung.com,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 javier.gonz@samsung.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 8/26/24 1:06 PM, Kanchan Joshi wrote:
>   /* Block storage write lifetime hint values. */
> -enum rw_hint {
> +enum rw_life_hint {

The name "rw_life_hint" seems confusing to me. I think that the
name "rw_lifetime_hint" would be a better name.

Thanks,

Bart.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
