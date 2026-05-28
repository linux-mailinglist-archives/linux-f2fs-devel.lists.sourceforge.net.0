Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBUOKopQGGpMiwgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 May 2026 16:26:18 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD135F3A43
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 May 2026 16:26:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7pql3bFTgkkCE69QWmrzLDfz34OJUx2GDPIWlHnBWx8=; b=BWLnAmMlZbyOKT7d0AbBijM238
	va6uhGUyjAtSiuAETX1pqRKnqQnZ8/JnKUGbt/UknzqKvN1tdjxd6A+iX8yRnX2Nj/VejbFmt1IHD
	2Wqr7TOkiaBbtcgzT5NciARxL80onBq7E3MzoMm79qVM1GXhHNXbclspwpozAMKvOzM8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wSbgU-0000zQ-0I;
	Thu, 28 May 2026 14:26:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1wSbgF-0000yu-UP
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 May 2026 14:25:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dETrkfkZjpOGKeS3HifTKOdzV7lpxcD3Cmea947aREg=; b=U2azAMepwnTJEXtwVDQEbOYAAM
 d/uzHh89jtdtivRTJq9l0N+NVwy8uosivRuWpUbnqx21Fq0PnVfMhIPv9YPXzmtNpP6VS50lrHsZz
 IuvEQELyLn0RfLUE2YP04Mu0RjttVy+LIfmUrjjrZkq5fTzplOmzvE5bAeUKgIOJzLaw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dETrkfkZjpOGKeS3HifTKOdzV7lpxcD3Cmea947aREg=; b=EARS5iyw2HgQ9wTsZwM2iPV192
 OV8I76CSQXehR9ANSlSrTtWZ0mb9UU6QSdPD5KV0ynYeqhoJBS29AKpC10MyH81MTBgz/YyqaoH4Y
 1zM7yTwmHds1kcT9lZrj+fjykASgxu2nppuya+ndLIELgiDumTIhXKEEQx3Jbj8ncgaU=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wSbgD-0002wS-QL for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 May 2026 14:25:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779978338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dETrkfkZjpOGKeS3HifTKOdzV7lpxcD3Cmea947aREg=;
 b=iB8WnxHEI8QXvvXyW3rHWT0BF5xvB0R8AZT7ohcZOeb/3pYx9DmVRG4SIsZqkTEAdXEPi8
 leucwv89QfaqG7BNab1JrgG+u24y49jtXr3MziASCDrDNUQjaM8Kpn1tu/1tIIZaQ5D7db
 okDXADzCsngFaJ/FhARi3jylRvpPDCc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-mAMoQNtZNXiStgg_s7oVKg-1; Thu, 28 May 2026 10:25:37 -0400
X-MC-Unique: mAMoQNtZNXiStgg_s7oVKg-1
X-Mimecast-MFC-AGG-ID: mAMoQNtZNXiStgg_s7oVKg_1779978336
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-48fed2519daso61505385e9.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 28 May 2026 07:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779978336; x=1780583136;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dETrkfkZjpOGKeS3HifTKOdzV7lpxcD3Cmea947aREg=;
 b=tUOQdaIIH0/AsPbdPoc5SSq5/ZGNgFlTFuyvBOoYn3usKqR6uf985cQ85llLLlkIwq
 eHnDwrEKMId9bGYIV7MUSSlJ8ud1MYE9hfpCPxKbUueZ1fu1b6Q0vyl4uqp1oVQKKbmi
 woAC2dSUwprY61varHhCChSrc81P2ktAevJIERevfsDbt6fnmDcofIvZzQ44crZcSwm3
 0rnyQRY+K6mbCDz6V6Ulm0QXh3u4f8u7UEN8wH4Xgd9l1s4JxGCYwYJ/P0AJZpcLhhwI
 AoGUxAIK71twf29OLzOntR789qu5GK6Q7xVvxK/gl/ZG2w9xlvjr76nyOa5aM0rvfyq4
 eyTw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9fekiChyayd/a7ocrf4m59ut4rg+buPfGfxBBzPbQ9ur9eA/CBzG6ansqxEdRCm++kLEfYzBjzBbQvoQAAK5ro@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxQ/ZG7a0+VdDhl2LsPqb5H/X72Ynu8XlAt+QbzB17LxIoGlqNf
 dg+yU6Huns7VAXlSFM4QlGrQvNTV3iMfgUXd3BFZKvLBFne+RmTRBly3U4z8UFhwPTmk/LHz+YY
 5Qx+lMwzF8svTCoYwCXlwZKuZ9i1q5LQcWMZcxazV6CiO+5jkeojcJ05FaYTRw8j5kYx6d1WgjN
 bA8g==
X-Gm-Gg: Acq92OHID4WkA/2Yklym4wFY86mdJCfsCxLqbvfuAFpx6jseQmHCjU5h/Tj9IQ2ygsW
 CdirSADLxPyfLY8g8WF4wW57xS710Se5AC5JuRGITtayxgfZuokhzNfhOhltn92LZCpD2CljYsR
 8UdjY6blAIFkK/Wzn5U7ofhjq9Y/vxDiGV7JWrKGTSzldxuI+bpn/e20kFBck2XM/mt9mo6FYNm
 EnnmMcEHdvLeCNoneIbTFGbPXnVd/pZC7z9wniutueWdOMAfGmsSZo9g3sJmmAyiOKzbCLgBPSF
 MNUvc9im0KZevxY4+uhYctBjjL+7GHe5/Zcvs0hbHW/88N5vQVASxIUH3fsbhoywXkVd688/Jtf
 05B4Vmb+zwOpFF4przF/G0LdTh9P3Zr0QtVyl+jsau0tpvz5mWx+ct5UCU186JXH5Rg==
X-Received: by 2002:a05:600c:8207:b0:490:688b:ece5 with SMTP id
 5b1f17b1804b1-490688bedbamr260601735e9.30.1779978336130; 
 Thu, 28 May 2026 07:25:36 -0700 (PDT)
X-Received: by 2002:a05:600c:8207:b0:490:688b:ece5 with SMTP id
 5b1f17b1804b1-490688bedbamr260600915e9.30.1779978335469; 
 Thu, 28 May 2026 07:25:35 -0700 (PDT)
Received: from thinky (178-221-68-189.dynamic.isp.telekom.rs. [178.221.68.189])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49092a925acsm77606985e9.14.2026.05.28.07.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2026 07:25:34 -0700 (PDT)
Date: Thu, 28 May 2026 16:25:32 +0200
To: Christian Brauner <brauner@kernel.org>
Message-ID: <k2g674gytgm23ef6jfhfikckpnnw4evuobkxxhn2quwgr7dplx@432kdgezw6nu>
References: <20260520123722.405752-1-aalbersh@kernel.org>
 <20260521090705.GA14254@lst.de>
 <gcw7zcg6p4s2egpufwizfig72g6ren7jfmuz5mqskkpb7xepww@e3v35j7bk7dc>
 <ag7uW7KQ5mVyCGEv@nidhogg.toxiclabs.cc>
 <20260522-unbehagen-baumethode-erlesen-811a4065eeac@brauner>
 <20260522120757.GA21041@lst.de>
 <ahVzkf8JoKP-kSC2@nidhogg.toxiclabs.cc>
 <20260528-offiziell-luftleer-misswirtschaft-3503bda2ad70@brauner>
MIME-Version: 1.0
In-Reply-To: <20260528-offiziell-luftleer-misswirtschaft-3503bda2ad70@brauner>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qll3pmBxFPP6kAnv0rDrDOrm5de-JL0yAdnuqGsq3Zw_1779978336
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026-05-28 14:20:08, Christian Brauner wrote: > On Tue,
 May 26, 2026 at 12:19:43PM +0200, Carlos Maiolino wrote: > > On Fri, May
 22, 2026 at 02:07:57PM +0200, Christoph Hellwig wrote: > > > On Fri, [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [170.10.129.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wSbgD-0002wS-QL
Subject: Re: [f2fs-dev] [PATCH v10 00/22] fs-verity support for XFS with
 post EOF merkle tree
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
 Carlos Maiolino <cem@kernel.org>, david@fromorbit.com,
 linux-unionfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brauner@kernel.org,m:fsverity@lists.linux.dev,m:ebiggers@kernel.org,m:aalbersh@kernel.org,m:djwong@kernel.org,m:cem@kernel.org,m:david@fromorbit.com,m:linux-unionfs@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[14];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,redhat.com:s=mimecast20190719];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,redhat.com:-];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[aalbersh@redhat.com]
X-Rspamd-Queue-Id: CFD135F3A43
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-28 14:20:08, Christian Brauner wrote:
> On Tue, May 26, 2026 at 12:19:43PM +0200, Carlos Maiolino wrote:
> > On Fri, May 22, 2026 at 02:07:57PM +0200, Christoph Hellwig wrote:
> > > On Fri, May 22, 2026 at 12:03:20PM +0200, Christian Brauner wrote:
> > > > > I was expecting this to come through xfs tree too if Eric and Christian
> > > > > agree.
> > > > 
> > > > You may take it through the xfs tree if there are no conflicts with
> > > > vfs-7.2.iomap. If there are I want to add the iomap changes into
> > > > vfs-7.2.iomap that you can pull in.
> > > 
> > > Merging the iomap bits through the iomap branch might make sense, given
> > > that iomap usually tends to see quite a bit of activity.
> > > 
> > 
> > That sounds good to me. If you want to go ahead and pull in the iomap
> > bits, do so, and give me a heads up when you do it so I'll pull your
> > branch locally.
> 
> Great, can the series please be resent based on current vfs-7.2.iomap
> then please? Because the iomap changes in this series don't apply
> cleanly on vfs-7.2.iomap so we already have merge conflicts...
> 

Sure, I will resend soon.

-- 
- Andrey



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
