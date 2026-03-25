Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GFlDZH7w2k/vQQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2026 16:13:21 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC6C3279FE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2026 16:13:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uprUeuDwUjTtvtAt2ykVfapi78FqV5E2bNCSe59t9dY=; b=M2U+r06kp6mZbWgWMLrNCfD32p
	SU8F120EMvqzOyfxxB3IruNypoNSla7bLCXnAEHKTE1cPrVrt8Zk1tpOxGFjsaDS2ntO1Ghnq+4xc
	1G6omUCLB37d43KG0JZN3PBOEIWDlZ8eU4EOm/AE8siAr1c/eO6MdgxAEWfWF2In5/0U=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w5Pv3-0002uV-DE;
	Wed, 25 Mar 2026 15:13:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1w5Pug-0002tq-58
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Mar 2026 15:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xgQzcNVTgAYMtY/AG+BgYI0+wd9pZeBrIlwhVeuWoe0=; b=DPuAs3TK6qjM1lWvwq/JrgTOdK
 J/y08PuBPje4vNJX7BXDBKz7kA6627deKJZaJ1EDennaqV0Ug18IR+pz6zrMSVatsg8SQPPuJNym3
 Tta/ib+lZoZFNjzwsIs2eTAK1M0v/ZvufgDafcJ7VvEDQDbTO/nLpZMqe3ArpdDEG9ho=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xgQzcNVTgAYMtY/AG+BgYI0+wd9pZeBrIlwhVeuWoe0=; b=FnssGFRY2h4WAb5T8ZKO4t/vSI
 sg1RZkvI4N2N4Fi0B2BJzqsSze9g44rVt97Ff5UOxCqMl4GSrtBSyMspec76oEviXRnMf5eu8b2Kd
 VSYBcq2i+79Z4UksVrnH2UT/WiHjtMyC1ta7yM2CKPFwwQ4HHt6VV+jrrvBDODHjKDXo=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w5Puf-0007h6-HV for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Mar 2026 15:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1774451562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xgQzcNVTgAYMtY/AG+BgYI0+wd9pZeBrIlwhVeuWoe0=;
 b=ejlqr86JSBzoNCSa6gf3P9uBJL7ZI4KmVwch/tp2KBgQqQGy8/50ORDh7c+UyJ7b7DNz67
 qHhJQPhzp0lSVnO6zTte0NsFZTosKlNXZw4UEq+OHy580+RgjjKAof4Kd3Yb5JRTowk2Sp
 5jtOrnx2gEai7oBkKluo91ezbt7wY0s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-0dToZ97vOI-oGDQapVX3ug-1; Wed, 25 Mar 2026 08:08:45 -0400
X-MC-Unique: 0dToZ97vOI-oGDQapVX3ug-1
X-Mimecast-MFC-AGG-ID: 0dToZ97vOI-oGDQapVX3ug_1774440524
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-4362197d1easo1995025f8f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Mar 2026 05:08:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774440524; x=1775045324;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xgQzcNVTgAYMtY/AG+BgYI0+wd9pZeBrIlwhVeuWoe0=;
 b=Pnn5UZK8RnSXB96a7DrI93EjuSOWs06dlDjPeY8RK+Gxuoux+mW1h8812nqHRffgjM
 O5PsV8Jga1AZS4+T1lOGYJcrb3uoX9/VkthqG7KrE16a3mOBdTcUWEgBOt8AUH2Xwfst
 gKrcM6i+xwqSOQB9CD7u342JwkSGHSWoX5YcvOo0ZWNA1ltB2b0/oAtbJiqyXliIZbD4
 DPoXOesSV1181fL5GzNi38S+bwj+rSb/u937iVsza6YHoI2Sy9LNoMT8W1Q2TJg4E4Ew
 neMJKsBa1sXevDnMml1TgCVidVsu+dgfBV8Q5TqQQSJ2MClLwvz0mCwZDHnFOXIg8ahh
 0gsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7RFaRjTxv6XS3VAXbuDsNX6GO4DdTt0zjNfD7xovEoiOMNHx17yCM3di/WwNlpGBoGcOUwE+znFETsTXd1tpj@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzLjt2aA3uCAonygogHSBlt3HT4clzDQLuVSe7j4fDY6iV3EYyg
 Hs80jO+d6oefudEwNpEYg94ImG/JfyMenzaMHesZOTa24YkI6VmXrqzaBIURqFmd27/NyCc3MRd
 4SlLP7bPvLKWOKHrOw3vrJC0RR/hQuRqjbOcBjNpddxiT9G6Qfi7k58rBFyXGw3QnaxJLXchTBR
 vEuQ==
X-Gm-Gg: ATEYQzwwCftHLIikaTGvrSdojvBl9EtzFfKymR0CZMsMlvONISP3D4JqZ9YDWwmLlMg
 FizNNQzKzpiv3+TjULBkPSowBvzPxL2McTbdOkJkqDKF5MFFiRY0ivx6F0fkQyqSbMtTxC9xuN3
 510pVLUMJNP1k005DjBjXy2nHVQ/Z4aomQueEj6QNaarBQH9CKsOaLV4KNcexxPq6T8kzQzsLTG
 fjHZ8yGWB339kWH9nvdy0ghDWj/ocwQOYAVB6bORhfZ6s5npjey8LIYKjC4vZfaubWqwELlwVWN
 n8/RoWrtu57uvN5cOS4X9qzD5mk3bl+mVTSlo72hnuGDuQKFrichA7egUDN9xs4MZ1LaEzMw+YF
 oMFjdnYWIpV2Ngw==
X-Received: by 2002:a05:6000:2c0c:b0:43b:436d:782a with SMTP id
 ffacd0b85a97d-43b88a2168cmr4549291f8f.5.1774440523998; 
 Wed, 25 Mar 2026 05:08:43 -0700 (PDT)
X-Received: by 2002:a05:6000:2c0c:b0:43b:436d:782a with SMTP id
 ffacd0b85a97d-43b88a2168cmr4549233f8f.5.1774440523459; 
 Wed, 25 Mar 2026 05:08:43 -0700 (PDT)
Received: from thinky ([91.245.205.131]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b90f17158sm216982f8f.8.2026.03.25.05.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2026 05:08:42 -0700 (PDT)
Date: Wed, 25 Mar 2026 13:08:41 +0100
To: Christoph Hellwig <hch@lst.de>
Message-ID: <nune2zskdoz2buxwj73z652azx4pwwkpsjjluq55mk3odybhym@2lolknvk7ddf>
References: <20260319170231.1455553-1-aalbersh@kernel.org>
 <20260319170231.1455553-10-aalbersh@kernel.org>
 <20260325080407.GG952@lst.de>
MIME-Version: 1.0
In-Reply-To: <20260325080407.GG952@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: K-ayrRk63iDnBtn8nwNknYxFevnsRSVaUDBcSG4x0cg_1774440524
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026-03-25 09:04:07, Christoph Hellwig wrote: > On Thu,
 Mar 19, 2026 at 06:01:56PM +0100, Andrey Albershteyn wrote: > > Issue reading
 of fsverity merkle tree on the fsverity inodes. This way > > me [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1w5Puf-0007h6-HV
Subject: Re: [f2fs-dev] [PATCH v5 09/25] iomap: issue readahead for fsverity
 merkle tree
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
From: Andrey Albershteyn via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: fsverity@lists.linux.dev, ebiggers@kernel.org,
 Andrey Albershteyn <aalbersh@kernel.org>, djwong@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,redhat.com:s=mimecast20190719];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:ebiggers@kernel.org,m:aalbersh@kernel.org,m:djwong@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,redhat.com:-];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[aalbersh@redhat.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 7EC6C3279FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-25 09:04:07, Christoph Hellwig wrote:
> On Thu, Mar 19, 2026 at 06:01:56PM +0100, Andrey Albershteyn wrote:
> > Issue reading of fsverity merkle tree on the fsverity inodes. This way
> > metadata will be available at I/O completion time.
> 
> Patches 8 to 10 really look like they should be merged to me.  They
> all add the actual fsverity support to the iomap buffered read path,
> and merging them and having a single explanation of the side seems
> helpful both for review and future archeology

I see, thanks, I will merge them.

-- 
- Andrey



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
