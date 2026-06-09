Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id udWNFEBeJ2rIvAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 09 Jun 2026 02:28:48 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 525A665B555
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 09 Jun 2026 02:28:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=VBj22FSz;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=SRVh0O9b;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=DFpRnKU9;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=s9sfeBo4;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o7Y4o34Bray+uDXIta1OTPk8AvEbHYNIQFSXnC9NVKM=; b=VBj22FSzcH4VS0KrR2kYkszvpY
	tOFOupptLTqNgJiMgpuZ1fZnqztMceCPKUlFm7jyzNrG0Q1moxLiexzw4ABfCf673M/z0oco+v2DD
	AFtCAhDiJArVIMaOQhw2SyZyqo5Hud2Yn6HVqRzdOEw4Lw6fjiH/v5fqZepC8meHxb3c=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wWkKX-0007Kt-2l;
	Tue, 09 Jun 2026 00:28:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <huangzhaoyang@gmail.com>) id 1wWkKV-0007Kn-9H
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Jun 2026 00:28:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M5i4m1TNzyDNn2vq58eQG5S4h79PWlnLHWMytDGnrP4=; b=SRVh0O9b+ap9Lb19OwkHKhBFae
 1dio6N4QzH9UQ2VPyAlV/xWDx1wk/1W3AT1an51hBnoxzEcBpQtpHZ2R+JOA+OzpAuBc65XnjBQFJ
 aPmTGcskygwCAbwAYbBzf7NmQUmqJoCwYf4awiOUbBqrtmrBv+jOm3vVmManhvboKiyY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M5i4m1TNzyDNn2vq58eQG5S4h79PWlnLHWMytDGnrP4=; b=DFpRnKU9OgBT1N3kPHpCy6QLw0
 nlJb9WVutiHfqImWgxQqoywJOlLRs/IGkZGyQtfp/+GzaEtyFxFz33FcXKpTyUga14U8NioUwdYv2
 fHs2lRP6RG8cSSTVrFAHPHS9eWPKh8Zmuf4Pj+b0LT9wXslJY/w9JVDvmhVOZMtsBxUE=;
Received: from mail-lf1-f49.google.com ([209.85.167.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wWkKT-0003xU-6z for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Jun 2026 00:28:31 +0000
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5aa68cf8643so251399e87.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 08 Jun 2026 17:28:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780964898; cv=none;
 d=google.com; s=arc-20240605;
 b=BExgADozQ08lVMxQCEba5NkUC7l9ML1Isa1r59IaaZpA+amTrlg+X4eYMoAdOK1uz0
 plNJE+Qa4CchlkcuyIu4ZkJowy8oXtzdEZyVeUEaxaCVnqREJdBRLIUdPBkGbyOaIiKX
 saeOpntetOVUuC6hU0TbTGt01/7ZCpx9tRt1yLg/m+FsNjqpB10kTy+gJeMK1gKWdY43
 Ymn7v7eDUSnC7gOek2vUBPOwzKLUuphgncnJh5ZOnp54pZZh9WDhMvelbrWfMcU/RbCr
 xoZ0qUblXdwWkAU4FejecA33LBdYGyaDz8LHkbCVp4P+Xxr+P0rHFAfflrT40uuwe9Ky
 MesQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=M5i4m1TNzyDNn2vq58eQG5S4h79PWlnLHWMytDGnrP4=;
 fh=vz7DEcFqir7Q7qnftozd3hNlxaVSMi73+XHvt6KxH5A=;
 b=K3EALi5Zv6sgivcRBxyYorDi5AkeQYdx301ZAHxONwG6mpAP7Vrjm1Ec35cJEHqhAW
 f4c2vyWcbsi08Z8/1+IdvhGX1oLm1JcHTszbVj8Yu7QhVBHVyDVvzXO8peQ6Z9DOkvSB
 tseC/9GcoH9IvFe+7lxcqQITXkaIz9Kbzizru789ud827dHIXAYisXhQwHu+5Cf8OD04
 +NxaCmZDV5287LilB8XvbudNcp5P81nkL95GJp6iKaLL1Z6jG74/cTVQTURTBl5KcJeO
 2JwHudcydNv1rXV3qAxEJmkDZOz07+fM6n6jwR7aZRrvEXLNPU/FDMuhwrNRx1rXvSjx
 Etcg==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780964898; x=1781569698; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M5i4m1TNzyDNn2vq58eQG5S4h79PWlnLHWMytDGnrP4=;
 b=s9sfeBo4g6SkrtKc++lZyZ/EW8LPkEN0f87OyEIs/Ca+2V1QEmTe+LR70OfQ7uBxAu
 GUsS4740POK0PCCB8zdFtl2nOComsVsIvsWzQPKtdQOquZpnmjUa8257KrBeI3djNy9X
 NktaIE0Nl7OweZucS11Dxoho3qS9Z9UgEqsxkxJYMfRgV5YKCUrPhZsFyLy7girfUX4G
 Ch8TisnSYTNIFOJW5OQBRa9RU7Pu/bnSNoYlCUwPV5cb1kyl9ngSc5YcZCEphvg+LtAz
 TglvMdAL+WgqOlLHmMPblLzrxylCkYATTV/zzE404dwlDaE/vewATkUnVuybk9684Q/s
 G1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780964898; x=1781569698;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=M5i4m1TNzyDNn2vq58eQG5S4h79PWlnLHWMytDGnrP4=;
 b=AofSU/168+pR1/J3pdDdwK5zxYHZs1I6iDs6OIB0XinlXKaIdRjdcm+8//hrmhqSf7
 jkYaFFgLw3tMS6N4NOX0BU9lww0dSeJl3ar9XWeA+jHmPNH6K70IWcX+wLrWI3/3F09q
 SV/cxFcvBVtIl4ZUdcZosdKP8mjgVOheZiPivI35M7SP0CsnvqI0VuyLU/GafX4P+Nj1
 AmAawu2N5grncFNMtdwZqNbiVM4IkXw31kHkVK7t7h0iFyk0wqNtRhS8xl1HVrv2oSEF
 UQe5UXaaMaPPdOs/WuKNa7uBS9nfRYlfdbFpavIADyyHN63w7Fejoat0cIqVdjDTxPto
 5yFw==
X-Gm-Message-State: AOJu0YxaWENQbmPk/f33rZXmDK0wW6CeWsN2KVwVnCBqPeXXRn6wHw9k
 iaze64JaJRTg2iXARh4Vh/z7QtvFuPMF0M/Irchn/+5eeilaVN1D9GxVt2T846GAGvNhsAPfNEL
 qKwvUDFVU7w0cgiH6t1IC9fm22TsSfb8=
X-Gm-Gg: Acq92OGBtneJH2UvXQy6yehsc2muW42+RE7y+l2goRLoFx13kRJlmCMgCmVJHtwt8XB
 oyoKS97On1PUj8Fc1YvQjjnOxFWdsa0zLjKkdeOWcswHdQhBbs4sa6p8mO5q5zKW8Y73CpCmXm2
 KyDdknTxCFvckWuUbNBbclJ1P/Fa9QeMSB8nGlGwBAWo9qg14Bg1LanbBJn4aUBeSa4O6ZBkk6r
 xJMw8NH4GMmtrvaGo/jpOqSx1he8Ln3hsj0QXnUM4FcyTwE3vu2umCOxj+0ViBP9LO5xq8mUGE3
 NTJjYDk1R7Nm4PnxyQE=
X-Received: by 2002:a05:651c:b22:b0:396:7280:1e5e with SMTP id
 38308e7fff4ca-396d05b0e5amr21633491fa.0.1780964897623; Mon, 08 Jun 2026
 17:28:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260608090939.2190185-1-zhaoyang.huang@unisoc.com>
In-Reply-To: <20260608090939.2190185-1-zhaoyang.huang@unisoc.com>
From: Zhaoyang Huang <huangzhaoyang@gmail.com>
Date: Tue, 9 Jun 2026 08:28:06 +0800
X-Gm-Features: AVVi8CcFfH9be2HvPn0WifL-4D91LqOXOg-SNPQ7ddtnJtgHf7Dha2dNZRlMg6A
Message-ID: <CAGWkznFVipKu0HzepZFNc_3P7r75yxt_8yTO9fMANYwyTbyyvg@mail.gmail.com>
To: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>, jaegeuk@kernel.org, 
 Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  +jaegeuk, chao On Mon, Jun 8, 2026 at 5:10 PM zhaoyang.huang
 wrote: > > From: Zhaoyang Huang > > This reverts commit
 9609dd704725a40cd63d915f2ab6c44248a44598.
 > > The kernel panics are keeping to be reported esp [...] 
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
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [huangzhaoyang(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.49 listed in wl.mailspike.net]
X-Headers-End: 1wWkKT-0003xU-6z
Subject: Re: [f2fs-dev] [PATCH] Revert "f2fs: remove non-uptodate folio from
 the page cache in move_data_block"
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
Cc: steve.kang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zhaoyang.huang@unisoc.com,m:jaegeuk@kernel.org,m:chao@kernel.org,m:steve.kang@unisoc.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[huangzhaoyang@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[huangzhaoyang@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,unisoc.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 525A665B555

K2phZWdldWssIGNoYW8KCk9uIE1vbiwgSnVuIDgsIDIwMjYgYXQgNToxMOKAr1BNIHpoYW95YW5n
Lmh1YW5nIDx6aGFveWFuZy5odWFuZ0B1bmlzb2MuY29tPiB3cm90ZToKPgo+IEZyb206IFpoYW95
YW5nIEh1YW5nIDx6aGFveWFuZy5odWFuZ0B1bmlzb2MuY29tPgo+Cj4gVGhpcyByZXZlcnRzIGNv
bW1pdCA5NjA5ZGQ3MDQ3MjVhNDBjZDYzZDkxNWYyYWI2YzQ0MjQ4YTQ0NTk4Lgo+Cj4gVGhlIGtl
cm5lbCBwYW5pY3MgYXJlIGtlZXBpbmcgdG8gYmUgcmVwb3J0ZWQgZXNwZWNpYWxseSB3aGVuIHRo
ZSBmMmZzCj4gcGFydGl0aW9uIGdldCBhbG1vc3QgZnVsbC4gQnkgaW52ZXN0aWdhdGlvbiwgd2Ug
ZmluZCB0aGF0IHRoZSByZWFzb24gaXMKPiBvbmUgZjJmcyBwYWdlIGdvdCBmcmVlZCB0byBidWRk
eSB3aXRob3V0IGJlaW5nIGRlbGV0ZWQgZnJvbSBMUlUgYW5kIHRoZQo+IHJvb3QgY2F1c2UgaXMg
dGhlIHJhY2UgaGFwcGVuZWQgaW4gWzJdIHdoaWNoIGlzIGVucm9sbGVkIGJ5IHRoaXMgY29tbWl0
Lgo+Cj4gVGhlcmUgYXJlIDMgcmFjZSBwcm9jZXNzZXMgaW4gdGhpcyBzY2VuYXJpbywgcGxlYXNl
IGZpbmQgYmVsb3cgZm9yIHRoZWlyCj4gbWFpbiBhY3Rpdml0aWVzLgo+Cj4gVGhlIGNoYW5nZWQg
Y29kZSBpbiBtb3ZlX2RhdGFfYmxvY2soKSBsZXRzIHRoZSBHQyBwYXRoIGV2aWN0IHRoZSB0YWls
LWVuZAo+IGZvbGlvIGZyb20gdGhlIHBhZ2UgY2FjaGUgdGhyb3VnaCBmb2xpb19lbmRfZHJvcGJl
aGluZCgpLiAgT25jZQo+IGZvbGlvX3VubWFwX2ludmFsaWRhdGUoKSByZW1vdmVzIHRoZSBmb2xp
byBmcm9tIG1hcHBpbmctPmlfcGFnZXMsIHRoZQo+IHBhZ2UtY2FjaGUgcmVmZXJlbmNlcyBmb3Ig
YWxsIHBhZ2VzIGluIHRoZSBmb2xpbyBhcmUgZHJvcHBlZC4gIFRoZSBmb2xpbwo+IGlzIHRoZW4g
a2VwdCBhbGl2ZSBvbmx5IGJ5IHRlbXBvcmFyeSBleHRlcm5hbCByZWZlcmVuY2VzLCB3aGljaCBh
bGxvd3MgYQo+IGxhdGVyIHNwbGl0IHRvIG9wZXJhdGUgb24gYSBmb2xpbyB3aG9zZSBzdWJwYWdl
cyBhcmUgbm8gbG9uZ2VyIHByb3RlY3RlZAo+IGJ5IHBhZ2UtY2FjaGUgcmVmZXJlbmNlcy4KPgo+
IEFmdGVyIHRoZSBwYWdlLWNhY2hlIHJlZmVyZW5jZXMgYXJlIGdvbmUsIHNwbGl0X2ZvbGlvX3Rv
X29yZGVyKCkgY2FuCj4gc3BsaXQgdGhlIGJpZyBmb2xpbyBpbnRvIGluZGl2aWR1YWwgcGFnZXMg
YW5kIHB1dCB0aGUgcmVzdWx0aW5nIHN1YnBhZ2VzCj4gYmFjayBvbiB0aGUgTFJVLiAgRm9yIHRh
aWwgcGFnZXMgYmV5b25kIEVPRiwgc3BsaXQgcmVtb3ZlcyB0aGVtIGZyb20gdGhlCj4gcGFnZSBj
YWNoZSBhbmQgZHJvcHMgdGhlaXIgcGFnZS1jYWNoZSByZWZlcmVuY2VzLiAgQSB0YWlsIHBhZ2Ug
Y2FuIHRoZW4KPiByZW1haW4gb24gdGhlIExSVSB3aXRoIFBHX2xydSBzZXQgd2hpbGUgaG9sZGlu
ZyBvbmx5IHRoZSBzcGxpdCBjYWxsZXIncwo+IHRlbXBvcmFyeSByZWZlcmVuY2UuICBXaGVuIGZy
ZWVfZm9saW9fYW5kX3N3YXBfY2FjaGUoKSBkcm9wcyB0aGF0IGZpbmFsCj4gcmVmZXJlbmNlLCB0
aGUgcGFnZSBlbnRlcnMgdGhlIGZpbmFsIGZvbGlvX3B1dCgpIHJlbGVhc2UgcGF0aC4KPgo+IElu
IHBhcmFsbGVsLCBmb2xpb19pc29sYXRlX2xydSgpIGNhbiBvYnNlcnZlIHRoZSBzYW1lIHRhaWwg
cGFnZSB3aXRoIGEKPiBub24temVybyByZWZjb3VudCBhbmQgUEdfbHJ1IHNldC4gIEl0IGNsZWFy
cyBQR19scnUgYmVmb3JlIHRha2luZyBpdHMgb3duCj4gcmVmZXJlbmNlLiAgSWYgdGhpcyByYWNl
cyB3aXRoIHRoZSBmaW5hbCBmb2xpb19wdXQoKSBmcm9tIHRoZSBzcGxpdCBwYXRoLAo+IF9fZm9s
aW9fcHV0KCkgc2VlcyBQR19scnUgYWxyZWFkeSBjbGVhcmVkIGFuZCBza2lwcyBscnV2ZWNfZGVs
X2ZvbGlvKCkuCj4gVGhlIHBhZ2UgaXMgdGhlbiBmcmVlZCBiYWNrIHRvIHRoZSBhbGxvY2F0b3Ig
d2hpbGUgaXRzIGxydSBsaW5rcyBhcmUKPiBzdGlsbCBwcmVzZW50IGluIHRoZSBMUlUgbGlzdC4g
IEEgbGF0ZXIgTFJVIG9wZXJhdGlvbiBvbiBhIG5laWdoYm9yaW5nCj4gcGFnZSBkZXRlY3RzIHRo
ZSBzdGFsZSBsaW5rIGFuZCByZXBvcnRzIGxpc3QgY29ycnVwdGlvbi4KPgo+IFsxXQo+IFsgICAy
Mi40ODYwODJdIGxpc3RfZGVsIGNvcnJ1cHRpb24uIG5leHQtPnByZXYgc2hvdWxkIGJlIGZmZmZm
ZmZlYzEwZTBhYzgsIGJ1dCB3YXMgZGVhZDAwMDAwMDAwMDEyMi4gKG5leHQ9ZmZmZmZmZmVjMTBl
MGE4OCkKPiBbICAgMjIuNDg2MTMwXSAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0t
LS0KPiBbICAgMjIuNDg2MTM0XSBrZXJuZWwgQlVHIGF0IGxpYi9saXN0X2RlYnVnLmM6NjchCj4g
WyAgIDIyLjQ4NjE0MV0gSW50ZXJuYWwgZXJyb3I6IE9vcHMgLSBCVUc6IDAwMDAwMDAwZjIwMDA4
MDAgWyMxXSAgU01QCj4gWyAgIDIyLjQ4ODUwMl0gVGFpbnRlZDogW1ddPVdBUk4sIFtPXT1PT1Rf
TU9EVUxFCj4gWyAgIDIyLjQ4ODUwNl0gSGFyZHdhcmUgbmFtZTogU3ByZWFkdHJ1bSBVTVM5MjMw
IDFIMTAgU29DIChEVCkKPiBbICAgMjIuNDg4NTExXSBwc3RhdGU6IDYwNDAwMGM1IChuWkN2IGRh
SUYgK1BBTiAtVUFPIC1UQ08gLURJVCAtU1NCUyBCVFlQRT0tLSkKPiBbICAgMjIuNDg4NTE3XSBw
YyA6IF9fbGlzdF9kZWxfZW50cnlfdmFsaWRfb3JfcmVwb3J0KzB4MTRjLzB4MTU0Cj4gWyAgIDIy
LjQ4ODUzMV0gbHIgOiBfX2xpc3RfZGVsX2VudHJ5X3ZhbGlkX29yX3JlcG9ydCsweDE0Yy8weDE1
NAo+IFsgICAyMi40ODg1MzldIHNwIDogZmZmZmZmYzA4MDA2YjgzMAo+IFsgICAyMi40ODg1NDJd
IHgyOTogZmZmZmZmYzA4MDA2Yjg2OCB4Mjg6IDAwMDAwMDAwMDAwMDMwMjAgeDI3OiAwMDAwMDAw
MDAwMDAwMDAwCj4gWyAgIDIyLjQ4ODU1M10geDI2OiAwMDAwMDAwMDAwMDAwMDAwIHgyNTogMDAw
MDAwMDAwMDAwMDAwNCB4MjQ6IGZmZmZmZmZlYzEwZTBhYzAKPiBbICAgMjIuNDg4NTY0XSB4MjM6
IDAwMDAwMDAwMDAwMDAwZTggeDIyOiAwMDAwMDAwMDAwMDAwMDI0IHgyMTogZGVhZDAwMDAwMDAw
MDEyMgo+IFsgICAyMi40ODg1NzRdIHgyMDogZmZmZmZmZmVjMTBlMGE4OCB4MTk6IGZmZmZmZmZl
YzEwZTBhYzggeDE4OiBmZmZmZmZjMDgwMDYxMDYwCj4gWyAgIDIyLjQ4ODU4NV0geDE3OiAyMDc0
NzU2MjIwMmMzODYzIHgxNjogNjEzMDY1MzAzMTYzNjU2NiB4MTU6IDAwMDAwMDAwMDAwMDAwNTgK
PiBbICAgMjIuNDg4NTk1XSB4MTQ6IDAwMDAwMDAwMDAwMDAwMDQgeDEzOiBmZmZmZmY4MGY5MWUw
MDAwIHgxMjogMDAwMDAwMDAwMDAwMDAwMwo+IFsgICAyMi40ODg2MDVdIHgxMTogMDAwMDAwMDAw
MDAwMDAwMyB4MTA6IDAwMDAwMDAwMDAwMDAwMDEgeDkgOiBmZmU4NTcyMWYwZTI1ZjAwCj4gWyAg
IDIyLjQ4ODYxNV0geDggOiBmZmU4NTcyMWYwZTI1ZjAwIHg3IDogMDAwMDAwMDAwMDAwMDAwMCB4
NiA6IDZjNjU2NDVmNzQ3MzY5NmMKPiBbICAgMjIuNDg4NjI1XSB4NSA6IGZmZmZmZmVkMzliMjMw
MjYgeDQgOiAwMDAwMDAwMDAwMDAwMDAwIHgzIDogMDAwMDAwMDAwMDAwMDAxMAo+IFsgICAyMi40
ODg2MzZdIHgyIDogMDAwMDAwMDAwMDAwMDAwMCB4MSA6IDAwMDAwMDAwMDAwMDAwMDAgeDAgOiAw
MDAwMDAwMDAwMDAwMDZkCj4gWyAgIDIyLjQ4ODY0N10gQ2FsbCB0cmFjZToKPiBbICAgMjIuNDg4
NjUxXSAgX19saXN0X2RlbF9lbnRyeV92YWxpZF9vcl9yZXBvcnQrMHgxNGMvMHgxNTQgKFApCj4g
WyAgIDIyLjQ4ODY2MV0gIF9fZm9saW9fcHV0KzB4MmJjLzB4NDM0Cj4gWyAgIDIyLjQ4ODY3MF0g
IGZvbGlvX3B1dCsweDI4LzB4NTgKPiBbICAgMjIuNDg4Njc4XSAgZG9fZ2FyYmFnZV9jb2xsZWN0
KzB4MWEzNC8weDI1ODQKPiBbICAgMjIuNDg4Njg5XSAgZjJmc19nYysweDIzMC8weDliNAo+IFsg
ICAyMi40ODg2OTddICBmMmZzX2ZhbGxvY2F0ZSsweGI5MC8weGRmNAo+IFsgICAyMi40ODg3MDZd
ICB2ZnNfZmFsbG9jYXRlKzB4MWI0LzB4MmJjCj4gWyAgIDIyLjQ4ODcxNl0gIF9fYXJtNjRfc3lz
X2ZhbGxvY2F0ZSsweDQ0LzB4NzgKPiBbICAgMjIuNDg4NzI1XSAgaW52b2tlX3N5c2NhbGwrMHg1
OC8weGU0Cj4gWyAgIDIyLjQ4ODczMl0gIGRvX2VsMF9zdmMrMHg0OC8weGRjCj4gWyAgIDIyLjQ4
ODczOV0gIGVsMF9zdmMrMHgzYy8weDk4Cj4gWyAgIDIyLjQ4ODc0N10gIGVsMHRfNjRfc3luY19o
YW5kbGVyKzB4MjAvMHgxMzAKPiBbICAgMjIuNDg4NzU0XSAgZWwwdF82NF9zeW5jKzB4MWM0LzB4
MWM4Cj4KPiBbMl0KPiBDUFUwIChmMmZzIEdDKSAgICAgICAgICAgICAgQ1BVMSAoc3BsaXRfZm9s
aW9fdG9fb3JkZXIpICAgICAgICAgIENQVTIgKGZvbGlvX2lzb2xhdGVfbHJ1KQo+Cj4gRjogcGFn
ZWNhY2hlIHJlZnMgPSBuCj4gRjogZXh0cmEgcmVmcyA9IEdDICsgc3BsaXQKPiBGOiBQR19scnUg
c2V0Cj4gbW92ZV9kYXRhX2Jsb2NrKCkKPiBmb2xpbyA9IGYyZnNfZ3JhYl9jYWNoZV9mb2xpbyhG
KQo+IC4uLgo+IF9fZm9saW9fc2V0X2Ryb3BiZWhpbmQoRikKPiBmb2xpb191bmxvY2soRikKPiBm
b2xpb19lbmRfZHJvcGJlaGluZChGKQo+ICAgZm9saW9fdW5tYXBfaW52YWxpZGF0ZShGKQo+ICAg
ICBfX2ZpbGVtYXBfcmVtb3ZlX2ZvbGlvKEYpCj4gICAgIGZvbGlvX3B1dF9yZWZzKEYsIG4pCj4g
Zm9saW9fcHV0KEYpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNwbGl0X2ZvbGlvX3Rv
X29yZGVyKEYpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZm9saW9fcmVmX2ZyZWV6
ZShGLCAxKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC4uLgo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGxydV9hZGRfc3BsaXRfZm9saW8oVCkKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGxpc3RfYWRkX3RhaWwoJlQtPmxydSwgJkYtPmxydSkKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZvbGlvX3NldF9scnUoVCkKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBfX2ZpbGVtYXBfcmVtb3ZlX2ZvbGlvKFQpCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZm9saW9fcHV0X3JlZnMoVCwgMSkKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAvKiBUIHJlZmNvdW50ID09IDEsIFBhZ2VMUlUgc2V0ICovCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgZm9saW9faXNvbGF0ZV9scnUoVCkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZvbGlvX3Rlc3RfY2xlYXJf
bHJ1KFQpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZyZWVfZm9saW9fYW5kX3N3YXBf
Y2FjaGUoVCkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmb2xpb19wdXQoVCkKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIHJlZmNvdW50OiAxIC0+IDAgKi8KPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fZm9saW9fcHV0KFQpCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF9fcGFnZV9jYWNoZV9yZWxlYXNlKFQpCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZm9saW9fdGVzdF9scnUoVCkgPT0gZmFsc2UK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBza2lwIGxydXZlY19kZWxf
Zm9saW8oVCkgKi8KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZnJlZV9mcm96
ZW5fcGFnZXMoVCkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBmb2xpb19nZXQoVCkKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBscnV2ZWNfZGVs
X2ZvbGlvKFQpCj4gbGF0ZXI6Cj4gICBsaXN0X2RlbChhZGphY2VudC0+bHJ1KQo+ICAgICBuZXh0
ID09ICZULT5scnUKPiAgICAgbmV4dC0+cHJldiA9PSBMSVNUX1BPSVNPTiAvIFBDUCBmcmVlbGlz
dAo+ICAgICBCVUcKPgo+IFNpZ25lZC1vZmYtYnk6IFpoYW95YW5nIEh1YW5nIDx6aGFveWFuZy5o
dWFuZ0B1bmlzb2MuY29tPgo+IC0tLQo+ICBmcy9mMmZzL2djLmMgfCA2ICstLS0tLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvZnMvZjJmcy9nYy5jIGIvZnMvZjJmcy9nYy5jCj4gaW5kZXggYmE5MzAxMDkyNGMwLi4zMDg0
ZTA1ZTIyZjIgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9nYy5jCj4gKysrIGIvZnMvZjJmcy9nYy5j
Cj4gQEAgLTE0NjgsMTEgKzE0NjgsNyBAQCBzdGF0aWMgaW50IG1vdmVfZGF0YV9ibG9jayhzdHJ1
Y3QgaW5vZGUgKmlub2RlLCBibG9ja190IGJpZHgsCj4gIHB1dF9vdXQ6Cj4gICAgICAgICBmMmZz
X3B1dF9kbm9kZSgmZG4pOwo+ICBvdXQ6Cj4gLSAgICAgICBpZiAoIWZvbGlvX3Rlc3RfdXB0b2Rh
dGUoZm9saW8pKQo+IC0gICAgICAgICAgICAgICBfX2ZvbGlvX3NldF9kcm9wYmVoaW5kKGZvbGlv
KTsKPiAtICAgICAgIGZvbGlvX3VubG9jayhmb2xpbyk7Cj4gLSAgICAgICBmb2xpb19lbmRfZHJv
cGJlaGluZChmb2xpbyk7Cj4gLSAgICAgICBmb2xpb19wdXQoZm9saW8pOwo+ICsgICAgICAgZjJm
c19mb2xpb19wdXQoZm9saW8sIHRydWUpOwo+ICAgICAgICAgcmV0dXJuIGVycjsKPiAgfQo+Cj4g
LS0KPiAyLjI1LjEKPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
