Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1vIdLjdhT2ovfgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 09 Jul 2026 10:52:07 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF71F72E7F6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 09 Jul 2026 10:52:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=mfo8peCc;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=NDxhkHMq;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=UEurA2Ev;
	dkim=fail ("body hash did not verify") header.d=redhat.com header.s=mimecast20190719 header.b=iza834L5;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y7ducKSF+AyLZy9aEkKdn71QjiNHu7yWNGMdpD+I6dw=; b=mfo8peCchQ8veHISZ5FLY1t9DX
	EbbqD2rqGusAs+STda7hEonxf7i4csew07BDkHTSr1qHYSXCnLo4ExYNyGjApXFwXjPYuXX1C236f
	B0yHunUWaBQO4aPulIOMXX5T01uSCWdyv8iAS4abj8/cQJoFLUqEA854ss4SYcB1KRRs=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1whkU8-0008ML-Cc;
	Thu, 09 Jul 2026 08:51:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1whkU5-0008ME-1Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Jul 2026 08:51:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eb5jDTkXBTPOE342mmNfwm5lDoBFxjZ2KPIK/Aydl/0=; b=NDxhkHMqaBe94Vqwbije6TtYlp
 Nl+ghoYltbYQr65iXL1vemoiDtiKq8IRxonqE/fQc3VZA47mSnclthOGftdU/HMHVNbY4e4Ikz5Zv
 xS+qGTiT7NJnRmxTNb0EQcdv1MI20dpmsdaHC+DV8vRtDjxSE4MMPnQl8V/fg/pMHl2M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eb5jDTkXBTPOE342mmNfwm5lDoBFxjZ2KPIK/Aydl/0=; b=UEurA2EvdivaKNJ+3B8pQ7Be9h
 uHmcW3+wl2DwUKPNIoK4Wibrvp4VNyeQeGlKgH43VAPeYsZdyqHbvbhVvpljJfnA/Ao03saQLoT/b
 7rHD5VsycsUTk65GjyOnU5nbzMELxF/xySNJlZVHkiFRuYJFsY92cF88pvRpTwQiTjI4=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1whkU4-0005Cg-Bc for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Jul 2026 08:51:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1783587106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eb5jDTkXBTPOE342mmNfwm5lDoBFxjZ2KPIK/Aydl/0=;
 b=iza834L5VL4ghd3uS/qwfK26v06iCDCHiZ2z7zsaJ0ylLcpa1eWADTc9i9X/fWm19bl264
 QgI4N5jNYKNxZTzfat48yOmrhvb4Ppip5zPTruRZhbA8nwMVjFxHxJrVCipqrgHMlrH0Qy
 8cA6E9aJVUxYbReHXlmNFov4FiM2kHE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-Ff0D0h69MxmM5HUaClMz5w-1; Thu, 09 Jul 2026 04:51:44 -0400
X-MC-Unique: Ff0D0h69MxmM5HUaClMz5w-1
X-Mimecast-MFC-AGG-ID: Ff0D0h69MxmM5HUaClMz5w_1783587104
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-493c55d5ce5so9840945e9.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 09 Jul 2026 01:51:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783587103; x=1784191903;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=eb5jDTkXBTPOE342mmNfwm5lDoBFxjZ2KPIK/Aydl/0=;
 b=OTpQDC6qxPR/3ELRsjAIiachCyKGYwflj7WFqu1QXBCfUcytXWCrZrzcCMhDUCUKNz
 awAC91/usxrA15JOIxXMSPy9hqD2MunZq3Z75mvgznPzq9QcIe+z8ZUez8ronXL5z7Cp
 2fq3RV3kMqvJLNV8zMiYBYzrrPe61I4NHhbR2yx65BIGJ0kr8ODbEQss8j6hM9+DGCbz
 dYa9Aiuf6Ud4xO2+vdpq4ZrW3i+CWuv2Wt9q3/CYTeemPZMZrYoS/JAggSY8yVXtW/im
 upjBYyPd1AD8Kx4Iim9XFtgPvdIRs0Xr3+v1HuoSLU46ATW8DcE8qo7Kw2VxqYXNqorq
 9SgA==
X-Forwarded-Encrypted: i=1;
 AHgh+Roi/14TgYaV9Crbq9FFXEfozkVavkrpX2pGHhYss71YKDRAA4ZueGogdcHU9IvkJ9fpkxdKgzR0dkmPROV8Uzh7@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzH1c6svoSMZYQ2xAAMl5rcMdP1wILK2en44hGj919pHxoqYpH6
 OMpQUIZjdXheWNLLI5sCrKnYhc10ogv7Yqjb0cfJXWF8UmtcI+Dx766PogWhbK2kNP52+sdEkDW
 UaRsL6JTqN94FdUObg5GQkV+UmgLO7jrZqZAXGA61FhSNpFY7U1ukK8RXCCn4pkVo403V/4CUTN
 rDoA==
X-Gm-Gg: AfdE7cmc04SqTKX+4VzJOw8imrN4PaezEq9XDPadf16ZEvXmSEI73BE0PVRySi5IZDZ
 DQvO3WiI2BcoHF6D45WNDxKelIWOrEPZSeltryk3P06DcTCLbMe6mz5Jldcc/iLM0HxE4R7Ecl5
 bxS7uoDKAfilmE5maw9JrxIKCHHtPaJzyr8K2rokOAH7lj0JgPUQhD0qtdTFcaNRDIscPYIOnPP
 2EfkK0qDZtN2vOMaaJqewYK2vFAOP1TN9De7rB+XaBPsGsgGLiUnnAsO9FMPPVCe7rjpNQKMITb
 nd6N6Bm8hCAM357MzKQvppa12ycYCAdNTJ5QK8SFWAyq4YgH24Zuywr+Hno1fJHaAhr+yLDsH5L
 igVWVh8Cu0tsIq3mZcWr3MJ0OQx+5uB8cGzoWv19yTBvwrg==
X-Received: by 2002:a05:600c:628d:b0:493:bcef:5646 with SMTP id
 5b1f17b1804b1-493e6862b68mr57369605e9.12.1783587103515; 
 Thu, 09 Jul 2026 01:51:43 -0700 (PDT)
X-Received: by 2002:a05:600c:628d:b0:493:bcef:5646 with SMTP id
 5b1f17b1804b1-493e6862b68mr57369285e9.12.1783587102989; 
 Thu, 09 Jul 2026 01:51:42 -0700 (PDT)
Received: from aalbersh-thinkpadx1carbongen13.rmtcz.csb ([217.30.74.39])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e5a5d174sm144100205e9.2.2026.07.09.01.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2026 01:51:41 -0700 (PDT)
Date: Thu, 9 Jul 2026 10:51:39 +0200
To: Christoph Hellwig <hch@lst.de>
Message-ID: <ak9f0CXSegLq8l5w@aalbersh-thinkpadx1carbongen13.rmtcz.csb>
References: <20260708011843.1036846-1-kbusch@meta.com>
 <20260709071352.GA20180@lst.de>
MIME-Version: 1.0
In-Reply-To: <20260709071352.GA20180@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Hf3KFJvqITjCumMo7N2QONY44lQUEoxPPtP7QF6kN3w_1783587104
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026-07-09 09:13:52, Christoph Hellwig wrote: > On Tue,
 Jul 07, 2026 at 06:18:43PM -0700, Keith Busch wrote: > > From: Keith Busch
 <kbusch@kernel.org> > > > > Memory alignment constraints for direc [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1whkU4-0005Cg-Bc
Subject: Re: [f2fs-dev] [PATCH] fs: report direct io constraints through
 file_getattr
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
Cc: axboe@kernel.dk, linux-xfs@vger.kernel.org, brauner@kernel.org,
 jack@suse.cz, Keith Busch <kbusch@meta.com>, cem@kernel.org,
 aalbersh@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, Keith Busch <kbusch@kernel.org>, tytso@mit.edu,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:axboe@kernel.dk,m:linux-xfs@vger.kernel.org,m:brauner@kernel.org,m:jack@suse.cz,m:kbusch@meta.com,m:cem@kernel.org,m:aalbersh@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:kbusch@kernel.org,m:tytso@mit.edu,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-ext4@vger.kernel.org,s:lists@lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,redhat.com:s=mimecast20190719];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,redhat.com:-];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[aalbersh@redhat.com];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aalbersh-thinkpadx1carbongen13.rmtcz.csb:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF71F72E7F6

On 2026-07-09 09:13:52, Christoph Hellwig wrote:
> On Tue, Jul 07, 2026 at 06:18:43PM -0700, Keith Busch wrote:
> > From: Keith Busch <kbusch@kernel.org>
> > 
> > Memory alignment constraints for direct io can vary depending on the
> > backing storage hardware. Provide support through file_getattr to report
> > the attributes necessary for applications to know how to construct valid
> > read and write requests.
> 
> This probably wants to be split in one patch for the new UAPI,
> one for the helper and one for each user.
> 
> And especially the UAPI one needs a much more detailed commit log
> explaining it, including why this duplicates some of the informastion
> already in statx and documenting the semantics for all the fields.
> 
> Andrey, is there a man page or other official documentation for
> file_setattr/file_getattr?

No, I had a draft in cover letter but haven't got to sending it to
man-pages. I will prepare a man page.

-- 
- Andrey



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
