Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mImEB746LWqgeAQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 13 Jun 2026 13:10:54 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 260D167E6B9
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 13 Jun 2026 13:10:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=i9O63f1u;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=Vfvxx1z4;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=VsMYkYwI;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=LxUng5JZ;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8b37SHnJvwOxoj713q9yu6W2oy58hjrrb5iv+okENI0=; b=i9O63f1uD2HPqIQpnufqrQN/Pw
	1vagm8Er0RfUzhVDva+2bIZKcWLR3LSy2JNWndFjwX1co3Zmf5e3EvIF1ykrS6cuB69niAraOBIWR
	MCvtpHYgoEQIxA82TFfS1lGtT9Mxw5brho54LG+TjMbPk7Y9B+EVCzALLFFPizg1j+0U=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wYMGF-0007wx-QL;
	Sat, 13 Jun 2026 11:10:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rollkingzzc@gmail.com>) id 1wYMGE-0007wr-8Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 13 Jun 2026 11:10:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/r4So/gqDEZVEK3dosL8LAI1WYSTgnzxZMYTkyB71Ck=; b=Vfvxx1z4tKGLHj9FBy4NAIkZ7R
 I5Tkb5/R0Zz3DEYExBIdlE0nrAQmMPSr7vQLZYHeVg+pvD5FeTUbaJwkfqfjSY/hhxw5YLqpTmmaf
 P0nh94mpFso94QNz4urORPoOmXG28vca8TyMSva0RjwuHuKlMN8WY6F1tWZxi62vsYqQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/r4So/gqDEZVEK3dosL8LAI1WYSTgnzxZMYTkyB71Ck=; b=VsMYkYwIDEoSM44vgaIhvVcdbA
 cDZp2l0YupBLhNDZJZTUqeghgGmHYla5sOYdJFWFRV8sGWO4cK7OEXB08GPsBxVO2ctN2TFMvnans
 p9ncnaXikFS/q1eTP1gTE8ZOksxi0gKCbBThA630x/OB3e9iPv5/XeeW8R3+SK/FqW4g=;
Received: from mail-lj1-f195.google.com ([209.85.208.195])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wYMGC-0007gk-Uu for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 13 Jun 2026 11:10:46 +0000
Received: by mail-lj1-f195.google.com with SMTP id
 38308e7fff4ca-39677245e15so14461991fa.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 13 Jun 2026 04:10:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781349039; cv=none;
 d=google.com; s=arc-20240605;
 b=Q9W51Lz0BlOLt4OccqlwsL2vFXOSq02rG3PmUOVdzxoWoJ6Usyo4srm7XMy2GeFJto
 SSsIdvQc/gXxfYqrkVkuPyyhLpJ5jtw/L/6eP6vpFUC03uMhRrFOLGQaCU5nCvxKo5QL
 V6Lmt1y2DdIB4FDXyFbIKJjtKN3GLDVasuKhQgx2bHiP3ww8Nl9R1Q8U9s9Wk6Z3y+9Z
 hwpaGnBrHvR+dT/0ujnsjUK9nqwnfLXDCIveAHkUZiAnl1tuN4cWZs52lK1F4tzh7XZQ
 2CegaYjxcv9T5M42TvHZJmkBqApVAKGkD+qViu4vZShhURKGg6vAlcFNANUIirSNob+R
 srzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=/r4So/gqDEZVEK3dosL8LAI1WYSTgnzxZMYTkyB71Ck=;
 fh=hDckumuAe22BsiuC91Hcj7cFJqolQ5vtqsK0Hp4shMI=;
 b=MwgugmNqNcRslBaASjPiqAnNbEL9us2DA0p+RNQCh90AVoZH/ogTgUP6ZqE9+gMDdQ
 oSrU+KpDQ8TvL4mWzX28YDJxZRIJ2B79XhcyVtq+oJ2nquYD4BFaB/8rTYWnOqRYRYTe
 rzyCcEgHixZcM3qCDRViHBCJc8gT3B68G1a6S5Gi48ok6Ppo/eXFHZwphOo49KLjlny9
 qXKlKSbIFMyfpCrSdrHvfBWqkzIALoLjlG57yUbPFA0Xls5RAFeuX1wKkpvpAEhUAGKm
 61sRz8EOd3fc/RTnj2KxOQ8287nP4E6Yc9ot0Ozbc0DIgdCpsAZhfhFkwz6b8uiSmopU
 MTZw==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781349039; x=1781953839; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/r4So/gqDEZVEK3dosL8LAI1WYSTgnzxZMYTkyB71Ck=;
 b=LxUng5JZeT+gfG7hR+LEw7RNYkXIlWl9ilhjvBwyfxCYs+zLVQqtDKd9EDJMSDFb6n
 k7r8ISVhXph5Kw26TMyY2HVBRg9G5EoWWl9C5tY2M5R2Pt3n3E8wsZGC6zoOzKPbgZTv
 Y5qR60wkcixirsxrZ4YQ71gkbCXcsu9QIVo680byn1Zy/TOsP9C0cl5a3p070XNJ+JsV
 fEWT++92KNeawR+JPXh3XtkUCSm/19n/QPmhI3ORZoe1ymlHqaih6ZCVFlGu3Bo+J7ny
 ZKU4c7GRIX3Xa93xcVB1PXqurEMlyAslOOtiZWiRgZmDxQcqcZiURSS30YBE03hLoiuV
 10+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781349039; x=1781953839;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/r4So/gqDEZVEK3dosL8LAI1WYSTgnzxZMYTkyB71Ck=;
 b=r6Hk/PRMTZnIKenRzw5rT2WE645IwuK95t7uIfbfsbPhhq2VxN8KRk/YrjoFyy2FmS
 RwMutgs2N86BUXHJEf7cYF33wFvOfdLQXK/YS3j2dzKQSle3RvxRfcMPSSt2tkds9w+z
 IAKiXlCsUzCw15VF/OY5WxKJJGEYwO6wlrWLHLfHbj5OwvaMxb3C8aWBBPkvzLT/MEFJ
 UWzRE1+LXItpeIrLVwdlBKtTp+RlSN4ABvIKpYhJY5lXnlpFXxmoUUa4CPzdjX0X7vxp
 9z36XgIAozV9SqtKK15shDyYECubavmttje2C5eZcETCK68hPXUgpleCMbFG2boeiy/B
 H2jA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9OUa1Uu7Jg6mc0Wjx2mFfw7vICC5myAKSz3n04Ird6QM9UJiJXq1khbmAT1w6B/cqMdacK6r+CfYUBJJwrvOie@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxIgj9BNgT66OEJ99UxIilNPpEdf3e6UGd+DHavgkgx+C7Gn6ZZ
 LLOdgwVVtfKjVJPjZXLYjJQYQv+jtweQ6oxhXmixPK4Iu4Cj1zJIE2/HpPXcgv14BkLQSKDz7II
 w4eAxM8FigyP/0M5ezedNaIyYJa+ha68=
X-Gm-Gg: Acq92OFDl7zqwyBBVXZa/EVRgdifzavELjUtRx/RjkTgz67/28BK1OtfJtRiSZhPBjS
 Q5tuA4oCSRKKC+kYnHIlBoxAFSRLns9nJlm2sycgtu15l1TqHr0GeRVX3L7tZU0rA4ujDOWLP8F
 pMUdutpGcFLyscn+s1psZUFWgwL3mSdI+zkIN2tUS6sNtA9RbXIvwmCH+Ilijey5wYCi4Ysf0A5
 dvS+7PU3TVta76XMxK7Wy90xVizOLZPcDdn/l92KGMRro8De8vLyIHYR6vBytLb1IbqHpTY8yqi
 TMo+dUzspTeI+fgYBt9Z
X-Received: by 2002:a2e:bc26:0:b0:396:8d0f:249b with SMTP id
 38308e7fff4ca-3992b014b2bmr19983791fa.12.1781349038266; Sat, 13 Jun 2026
 04:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260530143307.3596771-1-rollkingzzc@gmail.com>
In-Reply-To: <20260530143307.3596771-1-rollkingzzc@gmail.com>
From: Cen Zhang <rollkingzzc@gmail.com>
Date: Sat, 13 Jun 2026 19:10:25 +0800
X-Gm-Features: AVVi8Cf4WLw3Yt7_1Tqiyaaz1cdL73OY2sDWjDo8In_eZCgXcXzZK6IyOblsdA0
Message-ID: <CAB7XQsF0BwP15bRc159-1xZPX_m03JMTH_yjbrMg__mX9dn6QA@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
X-Spam-Score: 2.8 (++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi all, Just a gentle ping on this series. I would appreciate
 any feedback or guidance on whether further changes are needed. 
 Content analysis details:   (2.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 HK_RANDOM_FROM         From username looks random
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 1.0 FORGED_GMAIL_RCVD 'From' gmail.com does not match 'Received' headers
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [rollkingzzc(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.195 listed in wl.mailspike.net]
X-Headers-End: 1wYMGC-0007gk-Uu
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: protect published gc_thread during
 teardown
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
Cc: 2045gemini@gmail.com, Gao Xiang <xiang@kernel.org>, zerocling0077@gmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[rollkingzzc@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:2045gemini@gmail.com,m:xiang@kernel.org,m:zerocling0077@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rollkingzzc@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,lists.sourceforge.net];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 260D167E6B9

SGkgYWxsLAoKSnVzdCBhIGdlbnRsZSBwaW5nIG9uIHRoaXMgc2VyaWVzLgoKSSB3b3VsZCBhcHBy
ZWNpYXRlIGFueSBmZWVkYmFjayBvciBndWlkYW5jZSBvbiB3aGV0aGVyIGZ1cnRoZXIgY2hhbmdl
cwphcmUgbmVlZGVkLgoKVGhhbmtzIGZvciB5b3VyIHRpbWUgYW5kIHJldmlldy4KCkJlc3QgcmVn
YXJkcywKWmhhbmcgQ2VuCgpaaGFuZyBDZW4gPHJvbGxraW5nenpjQGdtYWlsLmNvbT4g5LqOMjAy
NuW5tDXmnIgzMOaXpeWRqOWFrSAyMjozM+WGmemBk++8mgo+Cj4gZjJmc19zdG9wX2djX3RocmVh
ZCgpIHN0b3BzIHRoZSBiYWNrZ3JvdW5kIEdDIHRhc2ssIHdha2VzIGZvcmVncm91bmQKPiBHQ19N
RVJHRSB3YWl0ZXJzLCBmcmVlcyBzYmktPmdjX3RocmVhZCwgYW5kIHRoZW4gY2xlYXJzIHRoZSBw
dWJsaXNoZWQKPiBwb2ludGVyLiAgQSBmb3JlZ3JvdW5kIGYyZnNfYmFsYW5jZV9mcygpIGNhbGxl
ciBjYW4gYWxyZWFkeSBoYXZlIGNvcGllZAo+IHRoYXQgcG9pbnRlciBhbmQgcXVldWVkIGl0c2Vs
ZiBvbiBnY190aC0+ZmdnY193cSwgc28gZnJlZWluZyBnY190aCBhdAo+IHN0b3AgdGltZSBjYW4g
bGVhdmUgZmluaXNoX3dhaXQoKSBvcGVyYXRpbmcgb24gYSBmcmVlZCB3YWl0cXVldWUuCj4KPiBL
ZWVwIHRoZSBhbGxvY2F0ZWQgR0MtdGhyZWFkIHN0YXRlIHVudGlsIHRoZSBzdXBlcmJsb2NrIGlz
IGRlc3Ryb3llZCBhbmQKPiB1c2UgZ2NfdGgtPmYyZnNfZ2NfdGFzayBhcyB0aGUgcnVubmluZy1z
dGF0ZSBtYXJrZXIuICBUaGUgc3RvcCBwYXRoIG5vdwo+IHdpdGhkcmF3cyB0aGUgdGFzayBwb2lu
dGVyIHdpdGggeGNoZygpLCBzdG9wcyB0aGUgdGFzaywgYW5kIHdha2VzIGFueQo+IGZvcmVncm91
bmQgd2FpdGVycywgYnV0IGxlYXZlcyB0aGUgd2FpdHF1ZXVlIHN0b3JhZ2UgdmFsaWQuICBUaGUg
c3RhcnQKPiBwYXRoIHJldXNlcyBhIHN0b3BwZWQgZ2NfdGhyZWFkIG9iamVjdCBpbnN0ZWFkIG9m
IHJlaW5pdGlhbGl6aW5nIGl0cwo+IHdhaXRxdWV1ZXMsIGFuZCByZW1vdW50IHJlc3RhcnQgZGVj
aXNpb25zIGNoZWNrIHRoZSB0YXNrIHBvaW50ZXIgcmF0aGVyCj4gdGhhbiBvbmx5IHRoZSBvYmpl
Y3QgcG9pbnRlci4KPgo+IGYyZnNfYmFsYW5jZV9mcygpIGFsc28gc25hcHNob3RzIHNiaS0+Z2Nf
dGhyZWFkIG9uY2UgYW5kIHJlY2hlY2tzCj4gZjJmc19nY190YXNrIGFmdGVyIHByZXBhcmVfdG9f
d2FpdCgpLiAgSWYgdGVhcmRvd24gd2lucyB0aGUgcmFjZSBhZnRlcgo+IHRoZSBmaXJzdCBjaGVj
aywgdGhlIGZvcmVncm91bmQgY2FsbGVyIHJlbW92ZXMgaXRzIHdhaXQgZW50cnkgd2l0aG91dAo+
IHNsZWVwaW5nIG9uIGEgd29ya2VyIHRoYXQgaGFzIGFscmVhZHkgYmVlbiB3aXRoZHJhd24uCj4K
PiBWYWxpZGF0aW9uIHJlcHJvZHVjZWQgdGhpcyBrZXJuZWwgcmVwb3J0Ogo+Cj4gQlVHOiBLQVNB
Tjogc2xhYi11c2UtYWZ0ZXItZnJlZSBpbiBmaW5pc2hfd2FpdCsweDI3Ni8weDI5MAo+IFdyaXRl
IG9mIHNpemUgOCBhdCBhZGRyIGZmZmY4ODgxMTUwODE5YjggYnkgdGFzayBkZC84MDIKPiBUaGUg
YnVnZ3kgYWRkcmVzcyBiZWxvbmdzIHRvIHRoZSBvYmplY3QgYXQgZmZmZjg4ODExNTA4MTkwMCB3
aGljaAo+IGJlbG9uZ3MgdG8gdGhlIGNhY2hlIGttYWxsb2MtMjU2IG9mIHNpemUgMjU2Cj4gVGhl
IGJ1Z2d5IGFkZHJlc3MgaXMgbG9jYXRlZCAxODQgYnl0ZXMgaW5zaWRlIG9mIGZyZWVkIDI1Ni1i
eXRlIHJlZ2lvbgo+IENhbGwgdHJhY2U6Cj4gICBmaW5pc2hfd2FpdCgpCj4gICBmMmZzX2JhbGFu
Y2VfZnMoKQo+ICAgZjJmc193cml0ZV9zaW5nbGVfZGF0YV9wYWdlKCkKPiAgIGYyZnNfd3JpdGVf
Y2FjaGVfcGFnZXMoKQo+ICAgX19mMmZzX3dyaXRlX2RhdGFfcGFnZXMoKQo+ICAgZG9fd3JpdGVw
YWdlcygpCj4gICBmaWxlbWFwX2ZkYXRhd3JpdGVfd2JjKCkKPiAgIF9fZmlsZW1hcF9mZGF0YXdy
aXRlX3JhbmdlKCkKPiAgIGZpbGVfd3JpdGVfYW5kX3dhaXRfcmFuZ2UoKQo+ICAgZjJmc19kb19z
eW5jX2ZpbGUoKQo+ICAgZjJmc19zeW5jX2ZpbGUoKQo+ICAgZG9fZnN5bmMoKQo+IEZyZWVkIGJ5
IHRhc2sgc3RhY2s6Cj4gICBrZnJlZSgpCj4gICBmMmZzX3N0b3BfZ2NfdGhyZWFkKCkKPiAgIGYy
ZnNfZG9fc2h1dGRvd24oKQo+ICAgZjJmc19zaHV0ZG93bigpCj4gICBmc19iZGV2X21hcmtfZGVh
ZCgpCj4KPiBGaXhlczogNTkxMWQyZDFkMWEzICgiZjJmczogaW50cm9kdWNlIGdjX21lcmdlIG1v
dW50IG9wdGlvbiIpCj4gU2lnbmVkLW9mZi1ieTogWmhhbmcgQ2VuIDxyb2xsa2luZ3p6Y0BnbWFp
bC5jb20+Cj4gLS0tCj4gdjQ6Cj4gLSBSZXBsYWNlIHRoZSB2MyBTUkNVL3JlZmNvdW50ZWQgbGlm
ZXRpbWUgbW9kZWwgd2l0aCBhIHNtYWxsZXIgZml4IHRoYXQKPiAgIGtlZXBzIHRoZSBleGlzdGlu
ZyBoZWFwLWFsbG9jYXRlZCBnY190aHJlYWQgb2JqZWN0IGFsaXZlIHVudGlsCj4gICBzdXBlcmJs
b2NrIHRlYXJkb3duLgo+IC0gVXNlIGYyZnNfZ2NfdGFzayBhcyB0aGUgcnVubmluZy1zdGF0ZSBt
YXJrZXIgYW5kIHdpdGhkcmF3IGl0IHdpdGgKPiAgIHhjaGcoKSBiZWZvcmUgd2FraW5nIEdDX01F
UkdFIHdhaXRlcnMuCj4gLSBSZXVzZSBhIHN0b3BwZWQgZ2NfdGhyZWFkIG9iamVjdCBhY3Jvc3Mg
cmVtb3VudCByZXN0YXJ0cyBzbyB0aGUKPiAgIHdhaXRxdWV1ZXMgYXJlIG5vdCByZWluaXRpYWxp
emVkIHdoaWxlIG9sZCB3YWl0ZXJzIGNhbiBzdGlsbCBmaW5pc2guCj4gLSBSZWNoZWNrIGYyZnNf
Z2NfdGFzayBhZnRlciBwcmVwYXJlX3RvX3dhaXQoKSBzbyBhIHdhaXRlciB0aGF0IHJhY2VzCj4g
ICB3aXRoIHRlYXJkb3duIGRvZXMgbm90IHNsZWVwIGFmdGVyIHRoZSB3b3JrZXIgaGFzIGJlZW4g
d2l0aGRyYXduLgo+Cj4gdjM6Cj4gLSBBZGQgdGhlIEZpeGVzIHRhZyBmb3IgdGhlIEdDX01FUkdF
IGZvcmVncm91bmQgd2FpdCBwYXRoLgo+IC0gRml4IGNoZWNrcGF0Y2ggc3R5bGUgaXNzdWVzIGlu
IHRoZSBicm9hZGVyIGxpZmV0aW1lIHZhcmlhbnQuCj4KPiB2MjoKPiAtIFNhc2hpa28uZGV2IHBv
aW50ZWQgb3V0IHRoYXQgR0NfTUVSR0UgZm9yZWdyb3VuZCB3YWl0ZXJzIGFuZAo+ICAgR0MtdGhy
ZWFkIHVzZXJzIG5lZWRlZCBsaWZldGltZS1zYWZlIGFjY2VzcyBhZnRlciB0ZWFyZG93bi4KPgo+
ICBmcy9mMmZzL2djLmMgICAgICB8IDQ4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tLS0tCj4gIGZzL2YyZnMvc2VnbWVudC5jIHwgMTkgKysrKysrKysrKysrLS0t
LS0tLQo+ICBmcy9mMmZzL3N1cGVyLmMgICB8ICA3ICsrKysrLS0KPiAgMyBmaWxlcyBjaGFuZ2Vk
LCA0NyBpbnNlcnRpb25zKCspLCAyNyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9mcy9m
MmZzL2djLmMgYi9mcy9mMmZzL2djLmMKPiBpbmRleCBiYTkzMDEwOTI0YzA2Li4yMGY4Mzk0NDgy
YTA5IDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMvZ2MuYwo+ICsrKyBiL2ZzL2YyZnMvZ2MuYwo+IEBA
IC0xOTMsMTIgKzE5MywyMyBAQCBzdGF0aWMgaW50IGdjX3RocmVhZF9mdW5jKHZvaWQgKmRhdGEp
Cj4KPiAgaW50IGYyZnNfc3RhcnRfZ2NfdGhyZWFkKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkK
PiAgewo+IC0gICAgICAgc3RydWN0IGYyZnNfZ2Nfa3RocmVhZCAqZ2NfdGg7Cj4gKyAgICAgICBz
dHJ1Y3QgZjJmc19nY19rdGhyZWFkICpnY190aCA9IHNiaS0+Z2NfdGhyZWFkOwo+ICsgICAgICAg
c3RydWN0IHRhc2tfc3RydWN0ICp0YXNrOwo+ICsgICAgICAgYm9vbCBhbGxvY2F0ZWQgPSBmYWxz
ZTsKPiAgICAgICAgIGRldl90IGRldiA9IHNiaS0+c2ItPnNfYmRldi0+YmRfZGV2Owo+Cj4gLSAg
ICAgICBnY190aCA9IGYyZnNfa21hbGxvYyhzYmksIHNpemVvZihzdHJ1Y3QgZjJmc19nY19rdGhy
ZWFkKSwgR0ZQX0tFUk5FTCk7Cj4gLSAgICAgICBpZiAoIWdjX3RoKQo+IC0gICAgICAgICAgICAg
ICByZXR1cm4gLUVOT01FTTsKPiArICAgICAgIGlmIChnY190aCAmJiBSRUFEX09OQ0UoZ2NfdGgt
PmYyZnNfZ2NfdGFzaykpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAwOwo+ICsKPiArICAgICAg
IGlmICghZ2NfdGgpIHsKPiArICAgICAgICAgICAgICAgZ2NfdGggPSBmMmZzX2ttYWxsb2Moc2Jp
LCBzaXplb2YoKmdjX3RoKSwgR0ZQX0tFUk5FTCk7Cj4gKyAgICAgICAgICAgICAgIGlmICghZ2Nf
dGgpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gKyAgICAgICAg
ICAgICAgIGluaXRfd2FpdHF1ZXVlX2hlYWQoJmdjX3RoLT5nY193YWl0X3F1ZXVlX2hlYWQpOwo+
ICsgICAgICAgICAgICAgICBpbml0X3dhaXRxdWV1ZV9oZWFkKCZnY190aC0+ZmdnY193cSk7Cj4g
KyAgICAgICAgICAgICAgIHNiaS0+Z2NfdGhyZWFkID0gZ2NfdGg7Cj4gKyAgICAgICAgICAgICAg
IGFsbG9jYXRlZCA9IHRydWU7Cj4gKyAgICAgICB9Cj4KPiAgICAgICAgIGdjX3RoLT51cmdlbnRf
c2xlZXBfdGltZSA9IERFRl9HQ19USFJFQURfVVJHRU5UX1NMRUVQX1RJTUU7Cj4gICAgICAgICBn
Y190aC0+dmFsaWRfdGhyZXNoX3JhdGlvID0gREVGX0dDX1RIUkVBRF9WQUxJRF9USFJFU0hfUkFU
SU87Cj4gQEAgLTIyMSwzNCArMjMyLDM1IEBAIGludCBmMmZzX3N0YXJ0X2djX3RocmVhZChzdHJ1
Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4KPiAgICAgICAgIGdjX3RoLT5nY193YWtlID0gZmFsc2U7
Cj4KPiAtICAgICAgIHNiaS0+Z2NfdGhyZWFkID0gZ2NfdGg7Cj4gLSAgICAgICBpbml0X3dhaXRx
dWV1ZV9oZWFkKCZzYmktPmdjX3RocmVhZC0+Z2Nfd2FpdF9xdWV1ZV9oZWFkKTsKPiAtICAgICAg
IGluaXRfd2FpdHF1ZXVlX2hlYWQoJnNiaS0+Z2NfdGhyZWFkLT5mZ2djX3dxKTsKPiAtICAgICAg
IHNiaS0+Z2NfdGhyZWFkLT5mMmZzX2djX3Rhc2sgPSBrdGhyZWFkX3J1bihnY190aHJlYWRfZnVu
Yywgc2JpLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICJmMmZzX2djLSV1OiV1IiwgTUFKT1Io
ZGV2KSwgTUlOT1IoZGV2KSk7Cj4gLSAgICAgICBpZiAoSVNfRVJSKGdjX3RoLT5mMmZzX2djX3Rh
c2spKSB7Cj4gLSAgICAgICAgICAgICAgIGludCBlcnIgPSBQVFJfRVJSKGdjX3RoLT5mMmZzX2dj
X3Rhc2spOwo+ICsgICAgICAgdGFzayA9IGt0aHJlYWRfcnVuKGdjX3RocmVhZF9mdW5jLCBzYmks
ICJmMmZzX2djLSV1OiV1IiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICBNQUpPUihkZXYp
LCBNSU5PUihkZXYpKTsKPiArICAgICAgIGlmIChJU19FUlIodGFzaykpIHsKPiArICAgICAgICAg
ICAgICAgaW50IGVyciA9IFBUUl9FUlIodGFzayk7Cj4KPiAtICAgICAgICAgICAgICAga2ZyZWUo
Z2NfdGgpOwo+IC0gICAgICAgICAgICAgICBzYmktPmdjX3RocmVhZCA9IE5VTEw7Cj4gKyAgICAg
ICAgICAgICAgIGlmIChhbGxvY2F0ZWQpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBrZnJl
ZShnY190aCk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgc2JpLT5nY190aHJlYWQgPSBOVUxM
Owo+ICsgICAgICAgICAgICAgICB9Cj4gICAgICAgICAgICAgICAgIHJldHVybiBlcnI7Cj4gICAg
ICAgICB9Cj4KPiAtICAgICAgIHNldF91c2VyX25pY2UoZ2NfdGgtPmYyZnNfZ2NfdGFzaywKPiAt
ICAgICAgICAgICAgICAgICAgICAgICBQUklPX1RPX05JQ0Uoc2JpLT5jcml0aWNhbF90YXNrX3By
aW9yaXR5KSk7Cj4gKyAgICAgICBXUklURV9PTkNFKGdjX3RoLT5mMmZzX2djX3Rhc2ssIHRhc2sp
Owo+ICsgICAgICAgc2V0X3VzZXJfbmljZSh0YXNrLCBQUklPX1RPX05JQ0Uoc2JpLT5jcml0aWNh
bF90YXNrX3ByaW9yaXR5KSk7Cj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+Cj4gIHZvaWQgZjJm
c19zdG9wX2djX3RocmVhZChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4gIHsKPiAgICAgICAg
IHN0cnVjdCBmMmZzX2djX2t0aHJlYWQgKmdjX3RoID0gc2JpLT5nY190aHJlYWQ7Cj4gKyAgICAg
ICBzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2s7Cj4KPiAgICAgICAgIGlmICghZ2NfdGgpCj4gICAg
ICAgICAgICAgICAgIHJldHVybjsKPiAtICAgICAgIGt0aHJlYWRfc3RvcChnY190aC0+ZjJmc19n
Y190YXNrKTsKPiArICAgICAgIHRhc2sgPSB4Y2hnKCZnY190aC0+ZjJmc19nY190YXNrLCBOVUxM
KTsKPiArICAgICAgIGlmICghdGFzaykKPiArICAgICAgICAgICAgICAgcmV0dXJuOwo+ICsgICAg
ICAga3RocmVhZF9zdG9wKHRhc2spOwo+ICAgICAgICAgd2FrZV91cF9hbGwoJmdjX3RoLT5mZ2dj
X3dxKTsKPiAtICAgICAgIGtmcmVlKGdjX3RoKTsKPiAtICAgICAgIHNiaS0+Z2NfdGhyZWFkID0g
TlVMTDsKPiAgfQo+Cj4gIHN0YXRpYyBpbnQgc2VsZWN0X2djX3R5cGUoc3RydWN0IGYyZnNfc2Jf
aW5mbyAqc2JpLCBpbnQgZ2NfdHlwZSkKPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50LmMg
Yi9mcy9mMmZzL3NlZ21lbnQuYwo+IGluZGV4IDc4OGY4YjA1MDI0OTIuLjg0MzA3NTI1ZWRkMjcg
MTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9zZWdtZW50LmMKPiArKysgYi9mcy9mMmZzL3NlZ21lbnQu
Ywo+IEBAIC00MjQsNiArNDI0LDggQEAgaW50IGYyZnNfY29tbWl0X2F0b21pY193cml0ZShzdHJ1
Y3QgaW5vZGUgKmlub2RlKQo+ICAgKi8KPiAgdm9pZCBmMmZzX2JhbGFuY2VfZnMoc3RydWN0IGYy
ZnNfc2JfaW5mbyAqc2JpLCBib29sIG5lZWQpCj4gIHsKPiArICAgICAgIHN0cnVjdCBmMmZzX2dj
X2t0aHJlYWQgKmdjX3RoOwo+ICsKPiAgICAgICAgIGlmIChmMmZzX2NwX2Vycm9yKHNiaSkpCj4g
ICAgICAgICAgICAgICAgIHJldHVybjsKPgo+IEBAIC00NDQsMTUgKzQ0NiwxOCBAQCB2b2lkIGYy
ZnNfYmFsYW5jZV9mcyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGJvb2wgbmVlZCkKPiAgICAg
ICAgIGlmIChoYXNfZW5vdWdoX2ZyZWVfc2VjcyhzYmksIDAsIDApKQo+ICAgICAgICAgICAgICAg
ICByZXR1cm47Cj4KPiAtICAgICAgIGlmICh0ZXN0X29wdChzYmksIEdDX01FUkdFKSAmJiBzYmkt
PmdjX3RocmVhZCAmJgo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2JpLT5nY190
aHJlYWQtPmYyZnNfZ2NfdGFzaykgewo+ICsgICAgICAgZ2NfdGggPSBzYmktPmdjX3RocmVhZDsK
PiArICAgICAgIGlmICh0ZXN0X29wdChzYmksIEdDX01FUkdFKSAmJiBnY190aCAmJgo+ICsgICAg
ICAgICAgIFJFQURfT05DRShnY190aC0+ZjJmc19nY190YXNrKSkgewo+ICAgICAgICAgICAgICAg
ICBERUZJTkVfV0FJVCh3YWl0KTsKPgo+IC0gICAgICAgICAgICAgICBwcmVwYXJlX3RvX3dhaXQo
JnNiaS0+Z2NfdGhyZWFkLT5mZ2djX3dxLCAmd2FpdCwKPiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgVEFTS19VTklOVEVSUlVQVElCTEUpOwo+IC0gICAgICAgICAgICAg
ICB3YWtlX3VwKCZzYmktPmdjX3RocmVhZC0+Z2Nfd2FpdF9xdWV1ZV9oZWFkKTsKPiAtICAgICAg
ICAgICAgICAgaW9fc2NoZWR1bGUoKTsKPiAtICAgICAgICAgICAgICAgZmluaXNoX3dhaXQoJnNi
aS0+Z2NfdGhyZWFkLT5mZ2djX3dxLCAmd2FpdCk7Cj4gKyAgICAgICAgICAgICAgIHByZXBhcmVf
dG9fd2FpdCgmZ2NfdGgtPmZnZ2Nfd3EsICZ3YWl0LAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgVEFTS19VTklOVEVSUlVQVElCTEUpOwo+ICsgICAgICAgICAgICAgICBpZiAoUkVB
RF9PTkNFKGdjX3RoLT5mMmZzX2djX3Rhc2spKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
d2FrZV91cCgmZ2NfdGgtPmdjX3dhaXRfcXVldWVfaGVhZCk7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgaW9fc2NoZWR1bGUoKTsKPiArICAgICAgICAgICAgICAgfQo+ICsgICAgICAgICAgICAg
ICBmaW5pc2hfd2FpdCgmZ2NfdGgtPmZnZ2Nfd3EsICZ3YWl0KTsKPiAgICAgICAgIH0gZWxzZSB7
Cj4gICAgICAgICAgICAgICAgIHN0cnVjdCBmMmZzX2djX2NvbnRyb2wgZ2NfY29udHJvbCA9IHsK
PiAgICAgICAgICAgICAgICAgICAgICAgICAudmljdGltX3NlZ25vID0gTlVMTF9TRUdOTywKPiBk
aWZmIC0tZ2l0IGEvZnMvZjJmcy9zdXBlci5jIGIvZnMvZjJmcy9zdXBlci5jCj4gaW5kZXggY2Nm
ODA2YjY3NmY1My4uZDY4NjNkYTA1YTdjMiAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL3N1cGVyLmMK
PiArKysgYi9mcy9mMmZzL3N1cGVyLmMKPiBAQCAtMjkyNSwxMSArMjkyNSwxMiBAQCBzdGF0aWMg
aW50IF9fZjJmc19yZW1vdW50KHN0cnVjdCBmc19jb250ZXh0ICpmYywgc3RydWN0IHN1cGVyX2Js
b2NrICpzYikKPiAgICAgICAgIGlmICgoZmxhZ3MgJiBTQl9SRE9OTFkpIHx8Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgKEYyRlNfT1BUSU9OKHNiaSkuYmdnY19tb2RlID09IEJHR0NfTU9ERV9P
RkYgJiYKPiAgICAgICAgICAgICAgICAgICAgICAgICAhdGVzdF9vcHQoc2JpLCBHQ19NRVJHRSkp
KSB7Cj4gLSAgICAgICAgICAgICAgIGlmIChzYmktPmdjX3RocmVhZCkgewo+ICsgICAgICAgICAg
ICAgICBpZiAoc2JpLT5nY190aHJlYWQgJiYgUkVBRF9PTkNFKHNiaS0+Z2NfdGhyZWFkLT5mMmZz
X2djX3Rhc2spKSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgZjJmc19zdG9wX2djX3RocmVh
ZChzYmkpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIG5lZWRfcmVzdGFydF9nYyA9IHRydWU7
Cj4gICAgICAgICAgICAgICAgIH0KPiAtICAgICAgIH0gZWxzZSBpZiAoIXNiaS0+Z2NfdGhyZWFk
KSB7Cj4gKyAgICAgICB9IGVsc2UgaWYgKCFzYmktPmdjX3RocmVhZCB8fAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICFSRUFEX09OQ0Uoc2JpLT5nY190aHJlYWQtPmYyZnNfZ2NfdGFzaykpIHsK
PiAgICAgICAgICAgICAgICAgZXJyID0gZjJmc19zdGFydF9nY190aHJlYWQoc2JpKTsKPiAgICAg
ICAgICAgICAgICAgaWYgKGVycikKPiAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIHJlc3Rv
cmVfb3B0czsKPiBAQCAtNTQ1MSw2ICs1NDUyLDcgQEAgc3RhdGljIGludCBmMmZzX2ZpbGxfc3Vw
ZXIoc3RydWN0IHN1cGVyX2Jsb2NrICpzYiwgc3RydWN0IGZzX2NvbnRleHQgKmZjKQo+ICBmcmVl
X3NiX2J1ZjoKPiAgICAgICAgIGtmcmVlKHJhd19zdXBlcik7Cj4gIGZyZWVfc2JpOgo+ICsgICAg
ICAga2ZyZWUoc2JpLT5nY190aHJlYWQpOwo+ICAjaWZkZWYgQ09ORklHX0RFQlVHX0xPQ0tfQUxM
T0MKPiAgICAgICAgIGxvY2tkZXBfdW5yZWdpc3Rlcl9rZXkoJnNiaS0+Y3BfZ2xvYmFsX3NlbV9r
ZXkpOwo+ICAjZW5kaWYKPiBAQCAtNTUzNSw2ICs1NTM3LDcgQEAgc3RhdGljIHZvaWQga2lsbF9m
MmZzX3N1cGVyKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IpCj4gICAgICAgICAvKiBSZWxlYXNlIGJs
b2NrIGRldmljZXMgbGFzdCwgYWZ0ZXIgZnNjcnlwdF9kZXN0cm95X2tleXJpbmcoKS4gKi8KPiAg
ICAgICAgIGlmIChzYmkpIHsKPiAgICAgICAgICAgICAgICAgZGVzdHJveV9kZXZpY2VfbGlzdChz
YmkpOwo+ICsgICAgICAgICAgICAgICBrZnJlZShzYmktPmdjX3RocmVhZCk7Cj4gICNpZmRlZiBD
T05GSUdfREVCVUdfTE9DS19BTExPQwo+ICAgICAgICAgICAgICAgICBsb2NrZGVwX3VucmVnaXN0
ZXJfa2V5KCZzYmktPmNwX2dsb2JhbF9zZW1fa2V5KTsKPiAgI2VuZGlmCj4gLS0KPiAyLjQzLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCg==
