Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HyuHK22+MGrKWwUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 05:09:33 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB8B68B9FE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 05:09:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=GnBfih8s;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=XaXvSszC;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=EBnZepic;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b="h/ZMhazN";
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yK5tC9SGjSGOdc36Gx199m0L4AIGfGhqyVNzExfLe1s=; b=GnBfih8sKi5Xce+qJPi878Xdd3
	wlHOa6AeMkJbpbxygwEBGzKcrEah7hhOWpBLUUpoj6UZfPVoXcTDyqmamywAG0touQy5I6MZN8yjp
	crHvQWT9mp/7YcwNCgEGcB1/ylzIb7Dc/2ezistRv4Ns4P4BBOm4fZ9utyR7hBPHTzcs=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZKB4-00057A-Sv;
	Tue, 16 Jun 2026 03:09:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wZKB3-000574-4N
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 03:09:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X3bxSlVHQ4gH/YTUG/J7lftqa2xV+HaScTtbiNHxOwU=; b=XaXvSszCbZvKLIdDGL/5OuIr1L
 kumW1kaY0mERpxiCIOA6pfARsYCJoxm1QDMwIX5sVyLst34+YHfzKAPcn8IlaIIU66KMH1EPPZQ4u
 Ivlc9l7IrGgvRXiN1+M/I3JhPQ2T+5V/83hJ94sGSnuYS9sg2QjP059m3V89vCqyt3us=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X3bxSlVHQ4gH/YTUG/J7lftqa2xV+HaScTtbiNHxOwU=; b=EBnZepicS1+p96eHDBKz34gZr9
 rCRQll0rJww1dKqm+PNfeBWsbHZfW6YeI58XJea+UwIAGQErdXwtqxSi4LwVVSoN2dbv2wIgXXkYZ
 mNlyy4N6swcFUlbr3PFAJbKaiXrnaefPTiO4WtYFkV29h2de3X5wpzye2VoYOe/obcio=;
Received: from mail-lf1-f41.google.com ([209.85.167.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wZKB1-0002d7-Mp for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 03:09:25 +0000
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5aa68d9dc18so5520135e87.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Jun 2026 20:09:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781579357; cv=none;
 d=google.com; s=arc-20240605;
 b=ELwLu9jUhebWQapWhQS6vs7Bz9H3xQXNnuRVKWH2840x/8YBsxoNQXSh0Xp2KV0GAl
 1ucj/o5gsnr8JzsM/pNL7K/d5MBX+3uNbShvXZG3RNxeMGHeabZNTYBmgIpWyOKkeik6
 6hkqfcJBAJ7bGpCEN2ImrS2W+5nkGgGyVSlHY3jX1P5/0n/nF3jvOYn2xqV88DtSYCKa
 JmwIbRgnGW+gA2YhTze26tgqK/yPDQfRHseDMRv0yfiGr+nHyNob2p0MIqnXlNejvpo2
 ZKfCXdVvcgYLgtl5ToYEkPD14reY1PpyzVorAAoJ7gTG2CAReTZ2OSCC5lbQAnKMfl1z
 81Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=X3bxSlVHQ4gH/YTUG/J7lftqa2xV+HaScTtbiNHxOwU=;
 fh=ENSPFdfFePZvyqIswGgVodEbaZLOSZCTbCHNBG9+pKw=;
 b=anCTfpyhBAdsDpVXskcJl5lczeW7Z40y+vbC6hsBjz/QYfci8dgS9TktGJybdSCctP
 m0NH2RZRr2cz3JIH+iQMsifylGP4t2LytnQXQ/bM/GsH0wukeRgxO7akaZwwXjSzT0VM
 Ekdr1d7T/03ig9dI6vA8krWGBfwnmF7jwda3xcCKedOyIsZ05lV4Okts4wOGyUTcpw/t
 ET2f4ZNihhwjpsoV81z57NRuA0Pe3nyCOllIXz/PlLe7I9wXp8T2Lns9lqeIMgHhTDbY
 eKtWBekLNZJtKIrnRsUqwYV91O5zLMoXszz/7swhTT04lOLAGjpWpEg7lXGHvKbPEKGb
 65iA==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781579357; x=1782184157; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X3bxSlVHQ4gH/YTUG/J7lftqa2xV+HaScTtbiNHxOwU=;
 b=h/ZMhazN40tx8vj2bk4ML6OeMGRX3D3BlIvBi+aPQNea2kVRs/QqX/8f/qeglNnIK9
 RVmFzGJnflpcSDB45rjG0mZymmh5MzMaYKkF2p5IrGegiDol3chbfmE3c3DPRJIkQlEC
 fiHv5ZEwBcKd2HTr4ULDyPLl1pjxajy/9+yu0h8lX77+3RMiQ4MglJtyPnMu1B96hCjy
 5WtbwGHrghXJj3mt+pmPx5PTSfo9H9hP2S2gLCpjDIxEZv1Fc+JnZjlnZ/TN+wncn6os
 IuHToZa8fr6lZGFh3mhPNTo4KllmbNo0ERw75irfR9O4ncb1Twi0N/3vZRcqF98RlrQx
 Utgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781579357; x=1782184157;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=X3bxSlVHQ4gH/YTUG/J7lftqa2xV+HaScTtbiNHxOwU=;
 b=PUVn7vQ3dO8H4aJ1h7UYuc/L11zdIDqNawJSIyzzVaPK2Yzuxb/vMdVRdQXUulpeoj
 sSThJItdfFh8V//0wjulC4bgyg6nPAADVt49rLYqdqfbwx+9tQF9Dgc85g2RXX/q/edi
 KgZ9mutzKqabbo9HMRmyi9r7PyfWiqKEm4ARaqeiAVSqqvyIwCygYVDzqk6fY+fyaXUJ
 YELgKDe2mPkqu3faXqyosImO1otrW4thttLVr63WfPVL1tCZ+OUfua2PU6okocFzoegW
 xGklAG1a1H/26tsOABxclN5QC+Gp+mNRKWtkkuKMzUljgjqGf4bR/bM1DXtk+GlS0f5K
 fyhQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9spZ0rAWbGWw42k2y9ZJq3IE+Q3EJQh3ogkj4lXPAlzlhZ65dczaAP+6JluG1ZS7YOnkQqCLPQVb1ek7vpF3y6@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxNg4nvQhCQcr6iK+kCw0N+Ou+8yezetd7hh0zIL5iex6G8XjHY
 Jpdy0PVgLGVY8uOnRsZDrmL7W/SpsVbPG4yt9rqn4GNFbtOpPKZVKOZSBtZ8oEoIehzWHXmXZbE
 sSAhvRgxwvuYSB2KBQB258gyu0TwKTXo=
X-Gm-Gg: Acq92OH5P/GxkB1Lmu8nMBKPKJUDqx4/8azzLNEIYBShEGHJ3mQeIFu+j8atSrtGSKe
 a/oA6IghBp8MbvoRUbU1a6Ocz1YRn4tpq0E7ejytACwTRRIpj/bvNmwzj1idhgyNkXMK3dzKMXX
 qz7WwR9mwjrTO40F9hGv/v/NcaRvMgV+8opPsOlTIMisr/iJ0yjOzdhGb24yV/REw7XQ6QcGViA
 5+9yjASXB+wcktDvFtypXl+833tUMR4MzKVRYc/32o9aIVIS4ra2RiCy7JYZENho4GU44NI9jB5
 UKzgUbNP
X-Received: by 2002:ac2:5689:0:b0:5a7:468f:1b82 with SMTP id
 2adb3069b0e04-5ad2db1b297mr4585868e87.1.1781579357138; Mon, 15 Jun 2026
 20:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260527054507.1900373-1-qiwenjie@xiaomi.com>
 <aiiwvYnHRDE1FcMk@google.com>
In-Reply-To: <aiiwvYnHRDE1FcMk@google.com>
From: Wenjie Qi <qwjhust@gmail.com>
Date: Tue, 16 Jun 2026 11:09:06 +0800
X-Gm-Features: AVVi8CcU99esTPM_cV1nWiqhXx2Bhws4xm8wei_9caxw4URS7U1LfIIS6gjVKI0
Message-ID: <CAGFpFsSY-++2MruHXgJrchsSiS07cwRMBS+gsVD9aTm0QniR+A@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Yes, f2fs_update_iostat() already checks sbi->iostat_enable.
 I removed the extra guards around the direct read/write byte accounting in
 v2. Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [qwjhust(at)gmail.com]
 1.0 FORGED_GMAIL_RCVD 'From' gmail.com does not match 'Received' headers
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.41 listed in wl.mailspike.net]
X-Headers-End: 1wZKB1-0002d7-Mp
Subject: Re: [f2fs-dev] [PATCH] f2fs: skip direct I/O iostat work when
 disabled
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
Cc: qiwenjie@xiaomi.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:qiwenjie@xiaomi.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,xiaomi.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ECB8B68B9FE

ICBZZXMsIGYyZnNfdXBkYXRlX2lvc3RhdCgpIGFscmVhZHkgY2hlY2tzIHNiaS0+aW9zdGF0X2Vu
YWJsZS4KCiAgSSByZW1vdmVkIHRoZSBleHRyYSBndWFyZHMgYXJvdW5kIHRoZSBkaXJlY3QgcmVh
ZC93cml0ZSBieXRlIGFjY291bnRpbmcgaW4gdjIuCgpodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1mMmZzLWRldmVsLzIwMjYwNjE2MDMwNjU1LjExMTkzMy0xLXFpd2VuamllQHhpYW9taS5j
b20vVC8jdQoKT24gV2VkLCBKdW4gMTAsIDIwMjYgYXQgODozM+KAr0FNIEphZWdldWsgS2ltIDxq
YWVnZXVrQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gMDUvMjcsIFdlbmppZSBRaSB3cm90ZToK
PiA+IEYyRlMgaW9zdGF0IGlzIG9wdGlvbmFsIGFuZCBpcyBkaXNhYmxlZCBieSBkZWZhdWx0LCBi
dXQgdGhlIGRpcmVjdAo+ID4gSS9PIHN1Ym1pdCBwYXRoIHN0aWxsIGFsbG9jYXRlcyBhbmQgYmlu
ZHMgYSBiaW9faW9zdGF0X2N0eCwgdXBkYXRlcwo+ID4gdGhlIHN1Ym1pdCB0aW1lc3RhbXAsIGFu
ZCByZXBsYWNlcyBiaV9lbmRfaW8gZm9yIGV2ZXJ5IERJTyBiaW8gZXZlbgo+ID4gd2hlbiBzYmkt
Pmlvc3RhdF9lbmFibGUgaXMgZmFsc2UuCj4gPgo+ID4gVGhlIGVuZF9pbyBwYXRoIGFsc28gY2Fs
bHMgZjJmc191cGRhdGVfaW9zdGF0KCksIHdoaWNoIHJldHVybnMKPiA+IGltbWVkaWF0ZWx5IHdo
ZW4gaW9zdGF0IGlzIGRpc2FibGVkLiBUaGlzIGFkZHMgYXZvaWRhYmxlIHBlci1iaW8KPiA+IG92
ZXJoZWFkIHRvIHRoZSBkZWZhdWx0IGRpcmVjdCBJL08gaG90IHBhdGguCj4gPgo+ID4gU2tpcCBE
SU8gaW9zdGF0IGNvbnRleHQgc2V0dXAgYW5kIHRoZSBkaXJlY3QgcmVhZC93cml0ZSBieXRlIHVw
ZGF0ZXMKPiA+IHdoZW4gaW9zdGF0IGlzIGRpc2FibGVkLiBJZiBpb3N0YXQgaXMgZW5hYmxlZCB0
aHJvdWdoIHN5c2ZzIGJlZm9yZQo+ID4gc3VibWlzc2lvbiwgdGhlIGV4aXN0aW5nIGNvbnRleHQg
YWxsb2NhdGlvbiBhbmQgbGF0ZW5jeSBhY2NvdW50aW5nIHBhdGgKPiA+IGlzIHN0aWxsIHVzZWQu
Cj4gPgo+ID4gUUVNVSBiZW5jaG1hcmsgb24gYSAxR2lCIEYyRlMgdmlydGlvLWJsayBpbWFnZSwg
d2l0aCBpb3N0YXRfZW5hYmxlPTAsCj4gPiA0S2lCIE9fRElSRUNUIEkvTyBvdmVyIGEgNjRNaUIg
ZmlsZSwgNTAwMDAgaXRlcmF0aW9ucyBwZXIgcnVuOgo+ID4KPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgICBiYXNlbGluZSAgICAgcGF0Y2hlZAo+ID4gICBkaXJlY3RfcmVhZCBtZWRpYW4gICAg
NjUyNjQuNTAgbnMgIDU1NDcwLjk1IG5zCj4gPiAgIGRpcmVjdF9yZWFkIHJlY2hlY2sgICA2NTU1
My43NSBucyAgNTU0NzAuOTUgbnMKPiA+ICAgZGlyZWN0X3dyaXRlIG1lZGlhbiAgIDY4MDU0LjYy
IG5zICA1NjMwOS40NCBucwo+ID4gICBkaXJlY3Rfd3JpdGUgcmVjaGVjayAgNjY4NzMuNTEgbnMg
IDU2MzA5LjQ0IG5zCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogV2VuamllIFFpIDxxaXdlbmppZUB4
aWFvbWkuY29tPgo+ID4gLS0tCj4gPiAgZnMvZjJmcy9maWxlLmMgICB8IDkgKysrKysrKy0tCj4g
PiAgZnMvZjJmcy9pb3N0YXQuaCB8IDYgKysrKysrCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMyBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZz
L2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5jCj4gPiBpbmRleCA2ZWRmMDEwNWRiYzguLjNhZDhiZDY2
MGIzMyAxMDA2NDQKPiA+IC0tLSBhL2ZzL2YyZnMvZmlsZS5jCj4gPiArKysgYi9mcy9mMmZzL2Zp
bGUuYwo+ID4gQEAgLTQ3OTksNiArNDc5OSw5IEBAIHN0YXRpYyB2b2lkIGYyZnNfZGlvX2lvc3Rh
dF9zdGFydChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBiaW8gKmJpbykKPiA+ICB7
Cj4gPiAgICAgICB2b2lkICpiaV9wcml2YXRlID0gYmlvLT5iaV9wcml2YXRlOwo+ID4KPiA+ICsg
ICAgIGlmICghZjJmc19pb3N0YXRfZW5hYmxlZChzYmkpKQo+ID4gKyAgICAgICAgICAgICByZXR1
cm47Cj4gPiArCj4gPiAgICAgICBpb3N0YXRfYWxsb2NfYW5kX2JpbmRfY3R4KHNiaSwgYmlvLCBi
aV9wcml2YXRlKTsKPiA+ICAgICAgIGlvc3RhdF91cGRhdGVfc3VibWl0X2N0eChiaW8sIERBVEEp
Owo+ID4gICAgICAgYmlvLT5iaV9lbmRfaW8gPSBmMmZzX2Rpb19lbmRfYmlvOwo+ID4gQEAgLTQ4
MTYsNyArNDgxOSw4IEBAIHN0YXRpYyBpbnQgZjJmc19kaW9fcmVhZF9lbmRfaW8oc3RydWN0IGtp
b2NiICppb2NiLCBzc2l6ZV90IHNpemUsIGludCBlcnJvciwKPiA+ICAgICAgIGRlY19wYWdlX2Nv
dW50KHNiaSwgRjJGU19ESU9fUkVBRCk7Cj4gPiAgICAgICBpZiAoZXJyb3IpCj4gPiAgICAgICAg
ICAgICAgIHJldHVybiBlcnJvcjsKPiA+IC0gICAgIGYyZnNfdXBkYXRlX2lvc3RhdChzYmksIE5V
TEwsIEFQUF9ESVJFQ1RfUkVBRF9JTywgc2l6ZSk7Cj4gPiArICAgICBpZiAoZjJmc19pb3N0YXRf
ZW5hYmxlZChzYmkpKQo+ID4gKyAgICAgICAgICAgICBmMmZzX3VwZGF0ZV9pb3N0YXQoc2JpLCBO
VUxMLCBBUFBfRElSRUNUX1JFQURfSU8sIHNpemUpOwo+Cj4gZjJmc191cGRhdGVfaW9zdGF0KCkg
Y2hlY2tzIHNiaS0+aW9zdGF0X2VuYWJsZT8KPgo+ID4gICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+
ID4KPiA+IEBAIC01MDk3LDcgKzUxMDEsOCBAQCBzdGF0aWMgaW50IGYyZnNfZGlvX3dyaXRlX2Vu
ZF9pbyhzdHJ1Y3Qga2lvY2IgKmlvY2IsIHNzaXplX3Qgc2l6ZSwgaW50IGVycm9yLAo+ID4gICAg
ICAgaWYgKGVycm9yKQo+ID4gICAgICAgICAgICAgICByZXR1cm4gZXJyb3I7Cj4gPiAgICAgICBm
MmZzX3VwZGF0ZV90aW1lKHNiaSwgUkVRX1RJTUUpOwo+ID4gLSAgICAgZjJmc191cGRhdGVfaW9z
dGF0KHNiaSwgTlVMTCwgQVBQX0RJUkVDVF9JTywgc2l6ZSk7Cj4gPiArICAgICBpZiAoZjJmc19p
b3N0YXRfZW5hYmxlZChzYmkpKQo+ID4gKyAgICAgICAgICAgICBmMmZzX3VwZGF0ZV9pb3N0YXQo
c2JpLCBOVUxMLCBBUFBfRElSRUNUX0lPLCBzaXplKTsKPiA+ICAgICAgIHJldHVybiAwOwo+ID4g
IH0KPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9pb3N0YXQuaCBiL2ZzL2YyZnMvaW9zdGF0
LmgKPiA+IGluZGV4IDIwMjUyMjViNWJlZC4uZDNlZjc4NzU3NWJlIDEwMDY0NAo+ID4gLS0tIGEv
ZnMvZjJmcy9pb3N0YXQuaAo+ID4gKysrIGIvZnMvZjJmcy9pb3N0YXQuaAo+ID4gQEAgLTQ0LDYg
KzQ0LDExIEBAIHN0cnVjdCBiaW9faW9zdGF0X2N0eCB7Cj4gPiAgICAgICBzdHJ1Y3QgYmlvX3Bv
c3RfcmVhZF9jdHggKnBvc3RfcmVhZF9jdHg7Cj4gPiAgfTsKPiA+Cj4gPiArc3RhdGljIGlubGlu
ZSBib29sIGYyZnNfaW9zdGF0X2VuYWJsZWQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+ID4g
K3sKPiA+ICsgICAgIHJldHVybiBzYmktPmlvc3RhdF9lbmFibGU7Cj4gPiArfQo+ID4gKwo+ID4g
IHN0YXRpYyBpbmxpbmUgdm9pZCBpb3N0YXRfdXBkYXRlX3N1Ym1pdF9jdHgoc3RydWN0IGJpbyAq
YmlvLAo+ID4gICAgICAgICAgICAgICAgICAgICAgIGVudW0gcGFnZV90eXBlIHR5cGUpCj4gPiAg
ewo+ID4gQEAgLTcyLDYgKzc3LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIGYyZnNfdXBkYXRlX2lv
c3RhdChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBpbm9kZSAqaW4KPiA+ICAgICAg
ICAgICAgICAgZW51bSBpb3N0YXRfdHlwZSB0eXBlLCB1bnNpZ25lZCBsb25nIGxvbmcgaW9fYnl0
ZXMpIHt9Cj4gPiAgc3RhdGljIGlubGluZSB2b2lkIGYyZnNfdXBkYXRlX3JlYWRfZm9saW9fY291
bnQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+ID4gICAgICAgICAgICAgICBzdHJ1Y3QgZm9s
aW8gKmZvbGlvKSB7fQo+ID4gK3N0YXRpYyBpbmxpbmUgYm9vbCBmMmZzX2lvc3RhdF9lbmFibGVk
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkgeyByZXR1cm4gZmFsc2U7IH0KPiA+ICBzdGF0aWMg
aW5saW5lIHZvaWQgaW9zdGF0X3VwZGF0ZV9hbmRfdW5iaW5kX2N0eChzdHJ1Y3QgYmlvICpiaW8p
IHt9Cj4gPiAgc3RhdGljIGlubGluZSB2b2lkIGlvc3RhdF9hbGxvY19hbmRfYmluZF9jdHgoc3Ry
dWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+ID4gICAgICAgICAgICAgICBzdHJ1Y3QgYmlvICpiaW8s
IHN0cnVjdCBiaW9fcG9zdF9yZWFkX2N0eCAqY3R4KSB7fQo+ID4gLS0KPiA+IDIuNDMuMAo+ID4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCg==
