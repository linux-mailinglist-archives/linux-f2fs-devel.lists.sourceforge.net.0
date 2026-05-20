Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGA7OzW2DWrC2QUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 May 2026 15:25:09 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 47ED858EB60
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 May 2026 15:25:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1jLtcy672p4f3xGn0d21i3+bz3GRlcoTtqxLp8bOETo=; b=C9P49rM4P5p/HaKjkV5K191t+/
	dRjkXGXJr4POJTfdnNfGwyVsyITwG4HfOZT0bJzEZIFFXIfnyZa5oujdN7ouXvTON23z4O3FAFd/e
	h6NVNvyR89JrIf7P/Kj98glkvnvFBCOlfXbj2GI1gSpDlK/Qwf3xPQUaJ9tqQ8xnWauQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wPguv-0004cj-NR;
	Wed, 20 May 2026 13:24:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <amir73il@gmail.com>) id 1wPguu-0004cd-Uq
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 May 2026 13:24:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rit3XOj+nAqSskgBa3AwkCsmGpVaId+gpzvsbFjHRsc=; b=eTm+OwEfK0e4lIz7mPoptlQatK
 unBqqp1I2T98Tpr53n8iBPWBSKAyrdYiLtJZLkkZSPsUGy+z+6xp/7VgCnhU3Nzd5/gV9IoLCUNYd
 mtr5n39lCX9GLWQOhfhc7e9MTiFJV5WoWfVNlP8HazRcG5QHkQZ79XJVl13HhQCfVp0o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Rit3XOj+nAqSskgBa3AwkCsmGpVaId+gpzvsbFjHRsc=; b=fsLMDI2JDmi48Id7bqbRGqZEZf
 N5Dsm3/NZcJ33e37phru7O31iBXgPViYsiO/vsMKUq32t7li0rYrTR44qYQJ2KPmsppxcFW1WqVZP
 4OtzI9CvBbGjzMBlB7rQY47uwYrm/XjvZZY24jlvuWDHrw8tSjx9NYfI5KTn2ep+RrXY=;
Received: from mail-ed1-f49.google.com ([209.85.208.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wPgut-00019E-N4 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 May 2026 13:24:57 +0000
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-676a89de629so8330178a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 May 2026 06:24:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779283485; cv=none;
 d=google.com; s=arc-20240605;
 b=ODCFsbHZz87jApmKrFBQEJ1Tc/rRVIdpjbzKAymXajIvsAUSj+YZ65phgeWN70fAxq
 mv6tf7XicEmvNsMboqw+c0YURd7ueh0hQAdy474Ypy2syLE7/Xt+yEiUnaF88JbvbIG5
 Bz5ixb9dsOkP2ACv2rWu7vAWszdtnts14z/FcLVgy+mRLIDfR0nsEvo4FAQ1dJduQ2Ho
 A00DSyGFMfEjlo3i/lJIrWovkbDHsoxVwjlh09FtGCH82In43P80OWkM5UpZL2jhvapm
 IObvQRPW20qJkrAhERewqTrzr0zQLXheCpQXWpjVo4S/8bqaeI/ITJKAwjBZF7CPyz7H
 28hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Rit3XOj+nAqSskgBa3AwkCsmGpVaId+gpzvsbFjHRsc=;
 fh=FiU7IEoek11ot+CzjTQzc7ZAIGSHrYsQd9zOWfJmmsU=;
 b=a5eAzYRo6St8JbLdR8nwCiRmYebiAdoSdC+U1uJrazlnx7TVRXGliIxgh0HaefsuTg
 lQ8Jn8Cq62rmnnXVv4zw9roq5q9bdQKBd52e+4P6O7OMFy4N/i7gdLqlXOTKh+sNbt7G
 E7XTYcTwpQPTyflFzx6lAg1cGMyK5EK0jh/dhpLp94CJqYQ4l7xenM5P/xXW4gmq5mGD
 vZGUfFq/cn47PH9qD9VBcWd5AoEatcKq4maS0S6k/rQ0+l6YKqYSeXM0kB8NM3K739i7
 PjaJOgbPWsZcKaWK9o6BnyyXez62+jR/DRk12EL8TciIgj6ay2BeJEk1eHiYNPtwVbnG
 /lAQ==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779283485; x=1779888285; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rit3XOj+nAqSskgBa3AwkCsmGpVaId+gpzvsbFjHRsc=;
 b=aD9RPAKtE4h1e1adt86fuvJMlSQprize+0kRP59+bpB5+G9ZANen0RL6jMXvChrym4
 Rh+R4T/jJ0TIWfz4cn+ZgyuJ3pn0kjq6QaK9u3XIV9T9QV/QRbLiSVjLFnFeCyXlzRwU
 s5c4avggHHAIByyq+ChWu3wveBrcn2+S9uwrCQP7tzdZa4ith3VQ+sG5XjHkedGo5BDJ
 37qk4ZM5RQym6KLtTV8YZeVowH54E/Z3HgBqJcnFDU1zVfBb41/Z/4550XwA+2KtSU+N
 OvbWnETG1PigM3Egcf8zFPgf9l/zU7rwOwEIJk9BKJ8VEMQ5ggaPIqlVIsxzbI5VLQrI
 osBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779283485; x=1779888285;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Rit3XOj+nAqSskgBa3AwkCsmGpVaId+gpzvsbFjHRsc=;
 b=hH7KkASkHwsioYayrtYDHowUSFOvN1upWv02//RoQb1sNe/ovqPV07CeI0dOD7CFYm
 kXZsxTVtRuegNSO9rZlAlJnJlbiDbPE7znZSiFyNt2dki6axuqJU2bOQbQnUs+f8g6k8
 p3HTNDrEDPNfW1IM6SF7R2EmfAFSJ3crTYfZHhwvmTx2PLkSnhfvO1xfbCLCJx0ditCq
 hTQw+R50EkM1HQIhKTpUs/ZH4Nz5JSzv/LebUH0C2aCVwcwrDeSuoVZFCUz0/UgHSZ61
 /O/5Kx+r6vTrGOt/pbVRBk0CbIKQxpHVGTcIaM/KEQtVbK3tGP/WM1yYpuC+gumK2ILD
 kz1w==
X-Forwarded-Encrypted: i=1;
 AFNElJ/ZzjiL9DmjzOnFOwxzuWdLaBFBVOB2lj/g+IJOqUKw0oIuB06jCP5MjCg7V3jH+NYKlB+/Az7I6BZbHH7zQSad@lists.sourceforge.net
X-Gm-Message-State: AOJu0YysAlAahDEB66CgdVFgbj9Js6AKGtpIN2GQ9GJuDeWLwQiChH2y
 ecFt0h8wRyOZnHSk57COX39Fdx9yq7HAYn9KD9M9N6JUpVHQz5N6Bk9Dw5wxG55te33ROSWb2vG
 KQoqv6AVy12U9yarExg0sB9y79RDscx4=
X-Gm-Gg: Acq92OGa99jK2J8NC7+mLdvaK9NCcfCAIlG+ULM5tdGJNC+fEhvB4kyYvSl0w8CC2Ep
 5CVWIfbONzosrw0gtWe3Uus6oS8t4+DHCPVa+h6S9NF9Kcl+BUkVLoQMxKDbFn8AUuFQuLhTYzL
 /rU5xjvXgY+SQyluWvwPxGAt8fhNZJsG6hcwCBqTaoSjc4GHiPXKohhxKyn1Ru+x9UaZGZYq3wP
 rmVsVW3H6UpP1ttfpAsYXN1BLdrK/NsXbAkk03COmEB9yor6WbXJyOztDs7QCNpG4QG88xhvwUV
 DF48qZQ++Q24eEwyhB9wkmX1QGLfuZu528qqotbI0er8s2Y6ZHes
X-Received: by 2002:a05:6402:4313:b0:687:285d:44a3 with SMTP id
 4fb4d7f45d1cf-687285d465fmr1620985a12.15.1779283484506; Wed, 20 May 2026
 06:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260520123722.405752-1-aalbersh@kernel.org>
 <20260520123722.405752-4-aalbersh@kernel.org>
 <n67pde3prjxt2c2u2pvjytfw7uzwbeij2yljlrwh7fixcgnzhp@piqsltgpcc4v>
In-Reply-To: <n67pde3prjxt2c2u2pvjytfw7uzwbeij2yljlrwh7fixcgnzhp@piqsltgpcc4v>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 20 May 2026 15:24:33 +0200
X-Gm-Features: AVHnY4Jb9lW17aXG5JPAYjGDiGqwrTNH7OJH9zvcsbDKfZCeeZ6RTdTNxiDlapc
Message-ID: <CAOQ4uxiNN3U4datJb8kxxGVp7VNRFZB6_zEnO76kh9oEjE_-bg@mail.gmail.com>
To: Andrey Albershteyn <aalbersh@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 20, 2026 at 2:54 PM Andrey Albershteyn wrote:
 > > On 2026-05-20 14:37:01, Andrey Albershteyn wrote: > > fsverity now exposes
 fsverity_ensure_verity_info() which could be used > > instead [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [amir73il(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.49 listed in wl.mailspike.net]
X-Headers-End: 1wPgut-00019E-N4
Subject: Re: [f2fs-dev] [PATCH v10 03/22] ovl: use core fsverity ensure info
 interface
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
Cc: fsverity@lists.linux.dev, ebiggers@kernel.org, djwong@kernel.org,
 linux-unionfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, hch@lst.de, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[amir73il@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:aalbersh@kernel.org,m:fsverity@lists.linux.dev,m:ebiggers@kernel.org,m:djwong@kernel.org,m:linux-unionfs@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amir73il@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 47ED858EB60
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gV2VkLCBNYXkgMjAsIDIwMjYgYXQgMjo1NOKAr1BNIEFuZHJleSBBbGJlcnNodGV5biA8YWFs
YmVyc2hAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiAyMDI2LTA1LTIwIDE0OjM3OjAxLCBBbmRy
ZXkgQWxiZXJzaHRleW4gd3JvdGU6Cj4gPiBmc3Zlcml0eSBub3cgZXhwb3NlcyBmc3Zlcml0eV9l
bnN1cmVfdmVyaXR5X2luZm8oKSB3aGljaCBjb3VsZCBiZSB1c2VkCj4gPiBpbnN0ZWFkIG9mIG9w
ZW5pbmcgZmlsZSB0byBlbnN1cmUgdGhhdCBmc3Zlcml0eSBpbmZvIGlzIGxvYWRlZCBhbmQKPiA+
IGF0dGFjaGVkIHRvIGlub2RlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBBbGJlcnNo
dGV5biA8YWFsYmVyc2hAa2VybmVsLm9yZz4KPiA+IEFja2VkLWJ5OiBBbWlyIEdvbGRzdGVpbiA8
YW1pcjczaWxAZ21haWwuY29tPgo+Cj4gQW1pciwgRXJpYywgdGhpcyBpcyB0aGUgbGFzdCBwYXRj
aCBtaXNzaW5nIGEgcmV2aWV3LiBDb3VsZCBvbmUgb2YKPiB5b3UgaGF2ZSBhIGxvb2sgYXQgaXQu
IE5vdCBzdXJlIHdobyBzaG91bGQgcmV2aWV3IHRoaXMuCgpGZWVsIGZyZWUgdG8gdXBncmFkZSBt
eSBhY2sgdG86CgpSZXZpZXdlZC1ieTogQW1pciBHb2xkc3RlaW4gPGFtaXI3M2lsQGdtYWlsLmNv
bT4KClRoYW5rcywKQW1pci4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVs
QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0
cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
