Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBtPGrCN6GmpMQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Apr 2026 10:58:24 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E641443B07
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Apr 2026 10:58:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3R7ECZ+UezlMrSmWQUzbKWDK96UQodZvuFa7TBdehuI=; b=iqAndb7EB3MENklViLQ2/GckhC
	WMwllOTsSsyN0QlqBNDDMPs82gdZE3U+exUhiMedKGyfQMZ5tBhg6a96dCli26aqiSbN82s1RYhHd
	aI+RWT3jYj8Cm00vTD/hhNvy90mei8xdBVcJJeZV4B+Z3bNetjJPUseyeLAHHrkmafyc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wFTPS-0006m8-Sh;
	Wed, 22 Apr 2026 08:58:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1wFTPR-0006m1-3Z
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Apr 2026 08:58:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FFaygBUBXXsgixj3eSOd6CMo0lj7K6zPcakxuhrDzd4=; b=cGPd4zTrBUvszJv6HgT5tjYqyq
 Q6Ilj3+EjObwJvrjtg5f2tqjWPQspv9UvAYJROum4VoSdwE+U4x/svJdVDFLW+vviOjDsv3W56+MQ
 8yA9PltbcyTU9vxAvxjvZH7RnUNoi82Ts8g+2eO0pM8wuIQQ1wYTSKaM0BU6mpuNmj6s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FFaygBUBXXsgixj3eSOd6CMo0lj7K6zPcakxuhrDzd4=; b=L7YsnU0e9VPbcWg82XbGH70Fiz
 F4DP7n80hSO+umequVBA+ghb0j+eND55sN87gqA0P1pBX/wjh+G+BcV9DVMMf3JmWkCsDVJdm85D6
 Uxu+59NCNIwq110gBYEdWvtXtVJp5hDs8UGQV6fBeVBjxdFLNVPIVpga3v04t05Uxaqk=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wFTPQ-0001YM-Gn for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Apr 2026 08:58:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1776848286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FFaygBUBXXsgixj3eSOd6CMo0lj7K6zPcakxuhrDzd4=;
 b=cHQHEGn4d65uGcHveSIfcaCYX+F8OuoMacUm1MAOmqirZSK4FaBJJv5JD4WXXd/psgrLV4
 AyeNE1L6dGikldh6xPKHp9tapFPxBEeg5jZczq2A419pFkp0K5EdnG6cEGSDAAe63btKjy
 0tAeHahRUjaQ4pK45Cde+QMyNuzt6lE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-533-SwoaRPGqMB23oGeHc5hoaA-1; Wed, 22 Apr 2026 04:58:05 -0400
X-MC-Unique: SwoaRPGqMB23oGeHc5hoaA-1
X-Mimecast-MFC-AGG-ID: SwoaRPGqMB23oGeHc5hoaA_1776848284
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-43ff0eb2b2aso2763684f8f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 22 Apr 2026 01:58:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776848284; x=1777453084;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FFaygBUBXXsgixj3eSOd6CMo0lj7K6zPcakxuhrDzd4=;
 b=IJhjO48j5B5Cu4JgAC/pKPRAOjhbtC2oMbwMwzGl1VU0MLYhZbKrXvR2uuFRWUWL6S
 AW2c8mhlZ8xybRIReVSsOXH6OchnOcTwaQOKJfv28ASh6XmRdvcK3G5Df3PfEosZMStr
 WBMvc3PQgbC6yLAjEr1DHP9X5aQwDR3jhKVFpOLNxc0ucsL2SeDBKtUu8OzhZhtvT2Qy
 GCdzRfOCWybT8jPvfdKqPJ5EegTWYJtqcFUmIFKKSLfo1T+7bylF1qUxqtsXJUok5B3U
 JWJY03xdxBb92byOt+fTnYikuq3t4rux1GnohFMtN4F5SqTzQ0HtK9Dm2K2GR/yQWC5l
 eB7A==
X-Forwarded-Encrypted: i=1;
 AFNElJ/VhnMZzGSFoteTfYhlGs4+SoUi8IvciITTe236FoiU45SbWXv/V7y2nVgK2bql8Rm1GznH0W9cSaPR45wFRnzQ@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxtN8I9AP40szOxd3ZwCKqpphtvyhCrT/yriViQTLhdL6E2p43s
 DoL2wnA3BOEIRiUn0Nk9mCe1P9bZz9fjHIuJnfUk62VARyjwiq7h3M8vrX8vUh/VOyEoy8Qf4mI
 PgFsT9iseXPAx0oCTNqeu4M0Rs44rzgc8C9mKPvaHQAzx5THl/YB7DUlb4ABD4VhJ4hF9N3JoQV
 8gkg==
X-Gm-Gg: AeBDies5wq7sTxbnt1Mc38/dVNZcsUhvFqPQnZakfJJKiIAEb7kVlxCtW6oLZAzMgIc
 4n5OmhEQ445QwsHhM+wrjbZW/ijeG/xAzQNUrBjHM5OyYI+ALDa+49X18KTkqCnqaUVLfU0INHE
 Cm7FoUDLCvJitajSPQesUE5dgiJEM2Y1j6P9NBBzam+sy4cxBJRMkU9VZjaunHzxFy/JTK+yPdF
 Ji9zlo3wdo1/SYOsv0X+SxCOTkS9gcIbhNpiJfdHMuAs1vGDfPPWcJjOhGhQPkGlpD9dtKbWzC6
 ymIDRklL0vRZ0+kcqS9mmGzD1sJcfj9F6lo4zu/1bJjo0eiHy59E2SGfLJyaNscTIHg6MKxYIg4
 tTPyKBDfLCTYJ+BUybuH5Ag==
X-Received: by 2002:a05:6000:4022:b0:441:2439:bef2 with SMTP id
 ffacd0b85a97d-4412439befdmr4594389f8f.24.1776848283806; 
 Wed, 22 Apr 2026 01:58:03 -0700 (PDT)
X-Received: by 2002:a05:6000:4022:b0:441:2439:bef2 with SMTP id
 ffacd0b85a97d-4412439befdmr4594342f8f.24.1776848283286; 
 Wed, 22 Apr 2026 01:58:03 -0700 (PDT)
Received: from thinky ([217.30.74.39]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e3a341sm47712138f8f.24.2026.04.22.01.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 01:58:02 -0700 (PDT)
Date: Wed, 22 Apr 2026 10:58:02 +0200
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <iads77qkk2wjkqfezd4vtqsga6btlkqdyephqojyv76herp6by@l24e2hm2ebas>
References: <20260420114714.1621982-1-aalbersh@kernel.org>
 <20260421214316.GB37143@quark>
MIME-Version: 1.0
In-Reply-To: <20260421214316.GB37143@quark>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FRRsBtuUKecrTcUXA87C9cL7f7-iYA2nq4hSk_64Qjs_1776848284
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026-04-21 14:43:16, Eric Biggers wrote: > On Mon, Apr
 20, 2026 at 01:46:47PM +0200, Andrey Albershteyn wrote: > > This series based
 on v7.0 with Christoph's read ioends patchset [1]. > > > > kerne [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [170.10.129.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wFTPQ-0001YM-Gn
Subject: Re: [f2fs-dev] [PATCH v8 00/22] fs-verity support for XFS with post
 EOF merkle tree
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
Cc: fsverity@lists.linux.dev, Andrey Albershteyn <aalbersh@kernel.org>,
 djwong@kernel.org, david@fromorbit.com, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, hch@lst.de,
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
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:aalbersh@kernel.org,m:djwong@kernel.org,m:david@fromorbit.com,m:linux-unionfs@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[12];
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
X-Rspamd-Queue-Id: 8E641443B07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-04-21 14:43:16, Eric Biggers wrote:
> On Mon, Apr 20, 2026 at 01:46:47PM +0200, Andrey Albershteyn wrote:
> > This series based on v7.0 with Christoph's read ioends patchset [1].
> > 
> > kernel:
> > https://git.kernel.org/pub/scm/linux/kernel/git/aalbersh/xfs-linux.git/log/?h=b4/fsverity
> 
> FYI: the git repository doesn't match what was actually sent out.  For
> example the patch "ovl: use core fsverity ensure info interface" is a
> bit different.  The version in git (incorrectly, I think) ignores the
> error code, while the patch returns it.
> 
> - Eric
> 

Thanks, you're right, I forgot to push

-- 
- Andrey



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
