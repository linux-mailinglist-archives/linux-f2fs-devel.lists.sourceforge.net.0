Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UH05MIQbzWnOaAYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 01 Apr 2026 15:20:04 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8EE37B1C3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 01 Apr 2026 15:20:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48ejvsuX3L4yiqnG0R2fG2+IqxaJi7e7d/tIiK9Je40=; b=PuXKchf8yC3CzmOzTWUPwopLmJ
	S3Tnf12D3omatCMiMH6wtdbpLyGHOb9tDcClypivWfLe+61mavCedOmqmHfHOqMEPvDNrvSkyJ5Ea
	PkyDBvhMbtAnyeVgFnFu1sPCQfKTq8EScXOx6OlEVsepj3IRZ3zBh5ZukrwtnEaZIOMc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w7vU7-0000jA-JL;
	Wed, 01 Apr 2026 13:19:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1w7vU6-0000j4-O4
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Apr 2026 13:19:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lyW12uBXRpbNCpKffg0iXnMuUrdM+MfpJppnsHO2xnY=; b=jKcWu4S2fgzPaolM1doAL1/1C9
 iV4Qq2PI1J6sg5bl8Lyh4PT72QePEEa0G2kqm2YV67CaMlbQZVmgdXJQJWwN6sLDiLwHegXgBMUu2
 Ie8uFE8Pp9X3U7Bb2zG/TLD7o5gtQQ9hFQtm65pPEmRkO/Pd2tASZs7cAN5CjfbPMBfg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lyW12uBXRpbNCpKffg0iXnMuUrdM+MfpJppnsHO2xnY=; b=Kbx35zXTKTIAfgi6lcQYwh2zRM
 x08Dyc04IgJbxaI+LQ/c3vB3KqXA0AEiXdkT3DB+dYxiRRlqLQVjx3FrPHWTotPlJbhcv8ZikN43k
 eUrEyLhnhr5SntWkuBG1cjR2exoh4dH7vfA6pY3SOtGlljZveeESFpeCGdRMxnF343W4=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w7vU6-0003Xp-BX for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Apr 2026 13:19:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1775049578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lyW12uBXRpbNCpKffg0iXnMuUrdM+MfpJppnsHO2xnY=;
 b=dNTM07Pqtq0jQUEe3/nEx31HD+7YqmKv+dVp+eJpS8HMwklYHPxprwz3BXmprTJMf1MoNh
 0/M36iNTkC77q3moHXjIhokUCyTrDv3oQ+Uay2JbeIxBDyB91wHB5evWnJ4pSI1AmdgRBO
 KXFIcW0FfCCBjorURtvOh+yamasNTlQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-Uc3_5xfaPRemOPOV3HUeCQ-1; Wed, 01 Apr 2026 09:19:35 -0400
X-MC-Unique: Uc3_5xfaPRemOPOV3HUeCQ-1
X-Mimecast-MFC-AGG-ID: Uc3_5xfaPRemOPOV3HUeCQ_1775049574
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-486f830f4e4so51489885e9.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 01 Apr 2026 06:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775049574; x=1775654374;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lyW12uBXRpbNCpKffg0iXnMuUrdM+MfpJppnsHO2xnY=;
 b=qgSscRW+EIx/c84Pz2u+TzopLVpQfayFAfsbAXO1SUrvDY8lZP+D1a/tVOiRRuzPgr
 ppRBaHZGPI1TrfmJYjbC+T4gpMwfbsnG6THbFRNvahBJrikUbkQgFKwjeDbDqyi0ThYn
 65tk7y56SJXeswoF/SfX+7KeLdkHn7wi8RhVEoADleE350Cmcus/V4BcBZWOy83hXr9A
 gQLt2L+KwJ04ng4gC6UfsbToaOnkH+/WniukEi3G6Bm16qGBH1B8oWtRHnK95jikmjI4
 Ea3I5LsdWnFbmnWFlSXF3+CHiKoxwghQCTjueYmHc9qEQRI2h1xyyRgdy7GbGkHIu90E
 Sj1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQ6nrV20IQsSFgid7/tSMLe8jLk9+nzJeZL4Jg178SK8PSGntAgY/67vFEeZa0SMXBQqIWmJ8FVkAO+VevNyew@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzewFe2GOqCOCL13EjE+ExivZjO1uSSwvhhtp4gmp8v5YUkzePn
 XUQf4ts6j1Ldp9toxTPguT8cMdsfmtK1/EKbygtR7kjHhJEd4wmjNA7qMQuIpa0JMfAETEK///Q
 4uKjS0NwLVaUW6qRAK1Lwdsi6/CmFlkS4iGzQlSP5hP3s3QEuLo3IbPsGChI5f3Q9vb+lgQIgp9
 xvkQ==
X-Gm-Gg: ATEYQzzUytr5BRpFPTQtSIb0YkIZZ+tfePHiFdlIGLtWIuCfHhVF4ASo6BXkjs7U7Pu
 NaT3qU4fVZaMAlXKdsmw7hNdPHmQ6vFcSwNBpFaQrmdyYAboZNBdY96f86k2kg63uXFf/SPNnjA
 bPm/NksJbUzVab44/ftqtGgOnUjbpmH4cW/BHzxDgDx4jtaVNoKByBqR7JCwrej4FraXDGSeQFj
 Jd8T7liUnHGaSp1fBYN/lLuy0GZSqqSHX+YcxBgWsTiP4yUZfItWmhuE9g4VzjABKdsqRvSbfyf
 OFd/zZv5+6Gv1KtiAn0HV4basn3TYHeLW2VXY+D68wRGYQzwTgkLPvSjIbxPHKkEVeHyrMQ+eeo
 bs2AoHWZwmche2g==
X-Received: by 2002:a05:600d:18:b0:483:6a8d:b2f9 with SMTP id
 5b1f17b1804b1-4888356847amr45594895e9.5.1775049574219; 
 Wed, 01 Apr 2026 06:19:34 -0700 (PDT)
X-Received: by 2002:a05:600d:18:b0:483:6a8d:b2f9 with SMTP id
 5b1f17b1804b1-4888356847amr45594115e9.5.1775049573591; 
 Wed, 01 Apr 2026 06:19:33 -0700 (PDT)
Received: from thinky ([91.245.205.131]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887adc52b2sm43924305e9.12.2026.04.01.06.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2026 06:19:33 -0700 (PDT)
Date: Wed, 1 Apr 2026 15:19:31 +0200
To: Christoph Hellwig <hch@lst.de>
Message-ID: <oxglumin3yplbpc647rudg6vqptkcfatf5mayzqdjcowfx7q23@p3flnabfpd4g>
References: <20260331212827.2631020-1-aalbersh@kernel.org>
 <20260331212827.2631020-22-aalbersh@kernel.org>
 <20260401063146.GD24459@lst.de>
MIME-Version: 1.0
In-Reply-To: <20260401063146.GD24459@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p69qVJ0O8QnNn5i-VKsHhSwyCQrj0QIphS_s9hZxPkY_1775049574
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026-04-01 08:31:46, Christoph Hellwig wrote: > Wouldn't
 most of these trace points make more sense in the core > fsverity code before
 calling into the file system? > > Otherwise they look good to [...] 
 Content analysis details:   (-0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.133.124 listed in wl.mailspike.net]
X-Headers-End: 1w7vU6-0003Xp-BX
Subject: Re: [f2fs-dev] [PATCH v6 21/22] xfs: add fsverity traces
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
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:ebiggers@kernel.org,m:aalbersh@kernel.org,m:djwong@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,redhat.com:s=mimecast20190719];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
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
X-Rspamd-Queue-Id: 0E8EE37B1C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-04-01 08:31:46, Christoph Hellwig wrote:
> Wouldn't most of these trace points make more sense in the core
> fsverity code before calling into the file system?
> 
> Otherwise they look good to me.
> 

oh the _file_corrupt one seems to be not used anymore with new
fserror interface

The _read/_write ones were pretty handy for debugging issues when
block size < page size when XFS read block, so, fsverity request a single page but
filesystem fetched more blocks, but with the current implementation
it's not relevant anymore

The only one which still make sense is get_descriptor, which
probably could be core fsverity one

I will drop this patch, this doesn't seem to worth it for single
trace point

-- 
- Andrey 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
