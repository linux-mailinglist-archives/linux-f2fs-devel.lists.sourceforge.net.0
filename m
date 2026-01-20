Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPVXGr6ib2l7DgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jan 2026 16:43:58 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0510646806
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jan 2026 16:43:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M44edvlbA13Ub/3iYXg1Yu/a0hpsieXtOBA5di0aOkY=; b=YHrxGI6chAk5fZWCkDc7ALJpCw
	y7y07I5qi764QSVbDfJXoPGlonQYiAfK+Rn7/1FNxJYUQc5uKmN06LM+a9MajEeU6u6Z/l7vkKgrV
	Z3EMpDEet3OhAWyOtKJkeUJSkPUp5PSZa/ZYjt+ECx8lqkWN+U5sUeSecMofwOOWcA5k=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1viAA3-0004w3-Iz;
	Tue, 20 Jan 2026 11:44:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1viAA2-0004vw-D1
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jan 2026 11:44:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VXQVvpxNNsGjingzXc9wZFJEzzxIAdMJuzmc45mqLJ4=; b=Hqnv4kcSRsHcoGumfVdMffvHum
 Lx8BSjjpx9DmAjwaBDVrwhideyfc9NTBwXKRoXMpfA9PMwqYgxet41p96bMkq5600NbwHmyOOB33u
 kDtLmTYNMqscF/y8wlISqH3qWQIVKWchoqT5m8fKVkLVm67Hm9DUSRm0BOiLMrR8f+8Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VXQVvpxNNsGjingzXc9wZFJEzzxIAdMJuzmc45mqLJ4=; b=EmiEvWhEnn/VnZzIXCdbDQQZ9g
 +2qVrxEeaIyDu/OqimBYKR/OVBISbkIeVsJwOYo2f9t62CsRdODF9g/+TsWI2v+txqckORKJ+wBqo
 LgLT1W/wpVnf1WNl2M/rDksVxzEnJ5gm6oQFY7N+FLysiPkRqP70zzFvUR0ki0jhZygk=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1viAA1-0008Dc-U9 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jan 2026 11:44:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768909466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VXQVvpxNNsGjingzXc9wZFJEzzxIAdMJuzmc45mqLJ4=;
 b=bON6rQPcdkmtNBKGes7yohoraayrW9gl18+npf6DsWfktAVlgh8pdWgmVzNP+8QGDik6W6
 Zg1Z5/BF7v6c8b+RzJ2vpuJJHVufjixaJykjw4t4pzoYY1e8pnJeqbU5o/4da0GUkaN7IE
 kpEnnGZp8jcg2QyDaReLVHTdNk+6xMk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-321-gtvpRoFcOgOLwzqqMPSNqQ-1; Tue, 20 Jan 2026 06:44:22 -0500
X-MC-Unique: gtvpRoFcOgOLwzqqMPSNqQ-1
X-Mimecast-MFC-AGG-ID: gtvpRoFcOgOLwzqqMPSNqQ_1768909462
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-47ee8808ffbso39904955e9.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 20 Jan 2026 03:44:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768909462; x=1769514262;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VXQVvpxNNsGjingzXc9wZFJEzzxIAdMJuzmc45mqLJ4=;
 b=TrAKMCmoxRUF/xvj0pmWGwIeKiwqKF5v5Eo4qeySzF/kd0ROoHtp3/4PU7TR+dyykU
 qBjYq5O9mrzy5FdBbhb2U/qH8r2o0l7rZ6TQVuEw1HWUatga95g5K/dd2e7nS/Zkr3gd
 xuGVwaReP1dip5AB5vMAiY5o2pYD8SwvUmQYfsapQu1a47lYOfYoVJL80c5tXkY1vI/w
 wC6kjrHalCC5y7TNiT4qUTck3se0Z/Oou1QoTvlBxTxTPIrR1VG3og8JFvZL2UlPzx0j
 wr2coUaxxHxUyxKyoIZqu3pjI2ikcMpgiimeio1lo7a2kFnConmMlJEo2EA6UNimdbs0
 Bi+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnvLbHJCfBvLzOLcCTwSvKpS1Q+8Jxu4OOQIKve4h5C5VEEVcFMKXlE+fLSVKlWWdoshreGqf8XOrzUWZIo96r@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyrquAvk1C1yA4AD5TwgbeTe/IQxq1pkAVlmUOvG6BahCIN1lXa
 4xhAkIMgPMv9lcNDS3kKH+DI06IMCpFlP0FYAvRRSEUxAToimolUCICquRpm9GdFyF5YzHF04X4
 t66y+vFK0ayrD1sLMSGS1heh6t+jrTHwZZdadMT7+SsluTNWruqloCLUyAjNWUrMWZSqoLmbodI
 MOkw==
X-Gm-Gg: AY/fxX6u7TlQ8ut12BB6KSEFlRxO2LOoXgdpFAVs3nrdxro1mMKKjkxvcKgaskUMejG
 82fnE8DU8cgQK1yMf9F6gAuoPson5vPPs09/a3cYzlAeDHW5c0LYeKMYTI0oghquXhytQxnkoOv
 zcytc9xyOS2pE39Y80Ifn4bGdEvNOrS7CmrIgW7GJfNybqBL5/uo6rdo6JHCmG27pxSbMqnyAvo
 wLVDxPheoE2kEhYgSf6PUYM3BFztB9iDUtQ/v3eO58bCK7QFIs2kxrEc9ZBmQpqDLkigqX9RMBS
 wCiWst1PojbXWpz8IRURpyc1UIniysxi+2txi1rKP8AanaGFaiUqjGgMe+RBdYdQEL5pChfU7zw
 =
X-Received: by 2002:a05:600c:4448:b0:47e:e20e:bbb4 with SMTP id
 5b1f17b1804b1-4801e345c8amr179356745e9.26.1768909461645; 
 Tue, 20 Jan 2026 03:44:21 -0800 (PST)
X-Received: by 2002:a05:600c:4448:b0:47e:e20e:bbb4 with SMTP id
 5b1f17b1804b1-4801e345c8amr179356335e9.26.1768909461124; 
 Tue, 20 Jan 2026 03:44:21 -0800 (PST)
Received: from thinky ([217.30.74.39]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f42907141sm300491595e9.9.2026.01.20.03.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 03:44:20 -0800 (PST)
Date: Tue, 20 Jan 2026 12:44:19 +0100
To: Christoph Hellwig <hch@lst.de>
Message-ID: <5tse47xskuaofuworccgwhyftyymx5xj3mc6opwz7nfxa225u6@uvbk4gc2rktd>
References: <aWZ0nJNVTnyuFTmM@casper.infradead.org>
 <op5poqkjoachiv2qfwizunoeg7h6w5x2rxdvbs4vhryr3aywbt@cul2yevayijl>
 <aWci_1Uu5XndYNkG@casper.infradead.org>
 <20260114061536.GG15551@frogsfrogsfrogs>
 <5z5r6jizgxqz5axvzwbdmtkadehgdf7semqy2oxsfytmzzu6ik@zfvhexcp3fz2>
 <6r24wj3o3gctl3vz4n3tdrfjx5ftkybdjmmye2hejdcdl6qseh@c2yvpd5d4ocf>
 <20260119063349.GA643@lst.de> <20260119193242.GB13800@sol>
 <20260119195816.GA15583@frogsfrogsfrogs>
 <20260120073218.GA6757@lst.de>
MIME-Version: 1.0
In-Reply-To: <20260120073218.GA6757@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WTijnemYCSI_k16gfIegDThW7zJ3wPl9Nr1Vn0twnCo_1768909462
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026-01-20 08:32:18, Christoph Hellwig wrote: > On Mon,
 Jan 19, 2026 at 11:58:16AM -0800, Darrick J. Wong wrote: > > > > a) not all
 architectures are reasonable. As Darrick pointed out > > > > hexa [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1viAA1-0008Dc-U9
Subject: Re: [f2fs-dev] fsverity metadata offset,
 was: Re: [PATCH v2 0/23] fs-verity support for XFS with post EOF
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
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, aalbersh@kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>, david@fromorbit.com,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, jaegeuk@kernel.org,
 linux-fsdevel@vger.kernel.org, tytso@mit.edu, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:linux-xfs@vger.kernel.org,m:aalbersh@kernel.org,m:djwong@kernel.org,m:david@fromorbit.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:jaegeuk@kernel.org,m:linux-fsdevel@vger.kernel.org,m:tytso@mit.edu,m:linux-ext4@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,redhat.com:s=mimecast20190719];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,redhat.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[aalbersh@redhat.com];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: 0510646806
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-01-20 08:32:18, Christoph Hellwig wrote:
> On Mon, Jan 19, 2026 at 11:58:16AM -0800, Darrick J. Wong wrote:
> > > >  a) not all architectures are reasonable.  As Darrick pointed out
> > > >     hexagon seems to support page size up to 1MiB.  While I don't know
> > > >     if they exist in real life, powerpc supports up to 256kiB pages,
> > > >     and I know they are used for real in various embedded settings
> > 
> > They *did* way back in the day, I worked with some seekrit PPC440s early
> > in my career.  I don't know that any of them still exist, but the code
> > is still there...
> 
> Sorry, I meant I don't really know how real the hexagon large page
> sizes are.  I know about the ppcs one personally, too.
> 
> > > If we do need to fix this, there are a couple things we could consider
> > > doing without changing the on-disk format in ext4 or f2fs: putting the
> > > data in the page cache at a different offset than it exists on-disk, or
> > > using "small" pages for EOF specifically.
> > 
> > I'd leave the ondisk offset as-is, but change the pagecache offset to
> > roundup(i_size_read(), mapping_max_folio_size_supported()) just to keep
> > file data and fsverity metadata completely separate.
> 
> Can we find a way to do that in common code and make ext4 and f2fs do
> the same?

hmm I don't see what else we could do except providing common offset
and then use it to map blocks

loff_t fsverity_metadata_offset(struct inode *inode)
{
	return roundup(i_size_read(), mapping_max_folio_size_supported());
}

-- 
- Andrey



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
