Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aM7zIAH1w2lZvAQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2026 15:45:21 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C524632702E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2026 15:45:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dg2bp3POC8zn4w44KXOz8xs8f+q+bllZfig6zI6er7I=; b=PdnUmU0l4H6AGEsHWBJvDBFCvD
	RTpQQWwE1W0lOsMMYeEDDp/cl4ZB7QMGFVnJ5sl2s92sUIU55b6yPxtOWRTEMXdupCKr+K/yUzHwD
	yp4QOlntphRr9LqY3XHPcy2g55PepDBuS2AIlC6R+VzTdZRQ2A7wLjhRvi0OuszDCuKs=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w5PTu-0003d7-Vb;
	Wed, 25 Mar 2026 14:45:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1w5PTt-0003cu-90
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Mar 2026 14:45:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1xEylKt1sFxQZZ3xBGKJ8RdOSFC0up8CAh1cSzczQVQ=; b=kyq86BCFZfeGrWgVsk40qhLEVW
 Tlilj65IBiWO2Wh0l40hvIHEfop4N7FZ0/4EoYydJY4dmDa5pVnLYugG1S1TOLavrCJ4D4HgdSN5J
 iu37/TWAJl/p1AaPgg7NfQe20YWN/o2LcO998hhWpqpUT0of3IafK8nd/7WHlz3zPwa0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1xEylKt1sFxQZZ3xBGKJ8RdOSFC0up8CAh1cSzczQVQ=; b=It2XXcjE5UT/xGQsK+2wtCz6Zf
 57Np7jYJ2POvJEWsetsGwvG4wE+dJ/w4gLBdK24Dul3QLS90nNwt34LPVy6xnz75Q51UAl1ua3yZj
 ic1TGHEXQjlnop+r2Qs4oIxegLt10/iuozTnVeML8scfXuoHLkCxgBDUMC8A7Iqsbr3E=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w5PTs-0003sS-BW for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Mar 2026 14:45:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1774449901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1xEylKt1sFxQZZ3xBGKJ8RdOSFC0up8CAh1cSzczQVQ=;
 b=fA8x1U+aRnGIS7wYk7Bvg78V88ldY4CeMmFj7r13+XBJfou5HcR2tuCX+aAfXLm4Qj21zJ
 mfoloKbZklfGxu/z+xvhJMNEswNskDZ7ZG1YBS35ghxdjbOpmKH3L83TBz/C7QfhP5ZBTW
 Dd+iw97mWCDJYKRkurf4PxoOplgES/w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-Sf8SaanKMtiEuK1nlwg5jw-1; Wed, 25 Mar 2026 07:41:26 -0400
X-MC-Unique: Sf8SaanKMtiEuK1nlwg5jw-1
X-Mimecast-MFC-AGG-ID: Sf8SaanKMtiEuK1nlwg5jw_1774438885
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-43b42cd4becso604424f8f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Mar 2026 04:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774438885; x=1775043685;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1xEylKt1sFxQZZ3xBGKJ8RdOSFC0up8CAh1cSzczQVQ=;
 b=nhelhgVwOLiBgyNHr/aHR6yEH2nCX1elWJ+rXooW+p0o25VSmjMbkrt0wD4RMLNeI8
 rm7kapcevzUCEbXUJn22BjqCt6V088OaLeDeocU3TEZuDEJwx7EKkL9W5nXgUJCGYJB1
 zWB9edTpjThMSMLVvl3bII1eHGAja36Q/s7T+bjHvf9CuxN7TEPiWrI0QA8w3RGI2v66
 3vtGXYv8BGhQ7QM3io/orXBj57UKlFWZSsaW3VrI+UoiayzGy4kO1eNInDpCFOYjCfBt
 V4YcgEGPFUE03GDLYlGIlUX6eZCJADMTS/iY7aSLrFRX8JKjtp8H8UyuIMoasigwXN0u
 yYNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK98P8jYAxj78kYPHapldY4Y2kOqz97zQhz7pwhf80QjrnNBVySAjBCaOOy3zU52/VDjaL/JcT4dAfnzi8RtxS@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxQp9w69rU6T31WQ1jkWH48xELjIwDGewGF6RwMwSNh8lnvIzvV
 9JNoqlKVhGcT1oj7/BCJyMk6JBBhmFMUANdPG5AnXx5uc31pBo6LuBxsvAYxCkL81Y/yIHKIAn0
 58xzmFvvx9BhdAV0quNAILmVT6ZJmilUEjQ2wSFwLlxhTCmBAT48fgQB0M2B7QH3vYxp/bqCfef
 3Apw==
X-Gm-Gg: ATEYQzz3fDJcbvngb3mKkSZDAmIsUbdO9RKaeOXDEQKIm/xEQl0a0tTuer/QV72Xnrp
 BQasQ84nBON3SNOfmWnqZAh/M7w6LLHnM5nc358ZxtOfBaatsbudGhZ2A8CdB3MZO+OA+lKQe32
 Tkw03R2Ec2vFBj/WAp/Q4Vx9QkWVj4LUbzFIeX8rdBHLQvlwIc89nkq5vKvJZgLc4PijaPmgOnD
 64zm4iELvRFRfOhjUuRO/Da7RF8SZ1mBfygY1Alor2MSFCMP/LwVfSlvtE6GqRQXw2UmYUDn14g
 1nS8TaijvlvF/6upyI+UK/UlAsUn6alUBN23DLD6v4s7cwFBbZYFtTF59JSkgEvUqcL8Ib9PbQv
 ByhBo6hwymnDCpQ==
X-Received: by 2002:a05:6000:2a09:b0:43b:425b:ec3f with SMTP id
 ffacd0b85a97d-43b80526465mr7202972f8f.4.1774438885301; 
 Wed, 25 Mar 2026 04:41:25 -0700 (PDT)
X-Received: by 2002:a05:6000:2a09:b0:43b:425b:ec3f with SMTP id
 ffacd0b85a97d-43b80526465mr7202929f8f.4.1774438884770; 
 Wed, 25 Mar 2026 04:41:24 -0700 (PDT)
Received: from thinky ([91.245.205.131]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b6470c239sm46289550f8f.27.2026.03.25.04.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2026 04:41:24 -0700 (PDT)
Date: Wed, 25 Mar 2026 12:41:23 +0100
To: Christoph Hellwig <hch@lst.de>
Message-ID: <3lllvimldwcgi7crh3kgwy3a5z2ng2ugcka52ab47o5mwx4dnu@xyzbelhykn7n>
References: <20260319170231.1455553-1-aalbersh@kernel.org>
 <20260319170231.1455553-2-aalbersh@kernel.org>
 <20260325075402.GA952@lst.de>
MIME-Version: 1.0
In-Reply-To: <20260325075402.GA952@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: F3lqSip8Gw1cSmcxwQlwAaHTgPUCQge02N51EvCAS5I_1774438885
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026-03-25 08:54:02, Christoph Hellwig wrote: > On Thu,
 Mar 19, 2026 at 06:01:48PM +0100, Andrey Albershteyn wrote: > > Reported
 verification errors to fsnotify through recently added fserror > > i [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [170.10.129.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1w5PTs-0003sS-BW
Subject: Re: [f2fs-dev] [PATCH v5 01/25] fsverity: report validation errors
 through fserror to fsnotify
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
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,redhat.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[aalbersh@redhat.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim,lst.de:email]
X-Rspamd-Queue-Id: C524632702E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-25 08:54:02, Christoph Hellwig wrote:
> On Thu, Mar 19, 2026 at 06:01:48PM +0100, Andrey Albershteyn wrote:
> > Reported verification errors to fsnotify through recently added fserror
> > interface.
> 
> Looks good:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
Thanks!

> 
> Btw, would it make sense to enhance the interface to tell why the
> data vs considered lost?  i.e. checksum failure vs

> (part of) device disappeared?

isn't it something filesystem should report even before fsverity
gets the page?

-- 
- Andrey



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
